#!/usr/bin/env python3
'''
This script renames, reorders, adds, and removes files in a directory with a numerical naming scheme.
'''
import re
import os
import os.path as path
import sys
import tempfile
import argparse
import subprocess
import math
import shutil

EDITOR = os.environ.get('EDITOR', 'vim')
RIGHTS = 0o777 & (~int(subprocess.getoutput('umask'), base=8))
SEPS = '-_ '


def atoi(text):
    return int(text) if text.isdigit() else text


def natural_keys(text):
    '''
    alist.sort(key=natural_keys) sorts in human order
    http://nedbatchelder.com/blog/200712/human_sorting.html
    (See Toothy's implementation in the comments)
    '''
    return [atoi(c) for c in re.split(r'(\d+)', text)]


def list_all(d):
    d = path.realpath(d)
    return [path.join(d, i) for i in os.listdir(d)]


def list_files(d):
    'return directory listing with full path names of files only'
    return [f for f in list_all(d) if path.isfile(f)]


def list_dirs(d):
    'return directory listing with full path names of folders only'
    return [f for f in list_all(d) if path.isdir(f)]


def get_previous_name(files, id):
    'Get the matching name from the previous files list'
    return [f for f in files if re.match(f'^{id}[{SEPS}]', f)]


def main(argv):

    # Create list of choices for separator options
    sep_choices = ['none']
    for c in SEPS:
        sep_choices.append(c)

    parser = argparse.ArgumentParser(description="""Script to rename, reorder, add, and remove files/directories in a directory with a numerical naming scheme.
    Run the program and provide a directory with the numbered files/directories.
    A text buffer will be opened with the current files/directories in the folder using the editor specified by the EDITOR environment variable.
    If EDITOR is not set, Vim will be used by default.
    Reorder, rename, add, or delete files in the buffer.
    Do not change the numbered part of the file/directory name; these numbers will be recalculated and are used to match renamed files/directories.
    Save and exit the editor.
    Then the program with perform the operations to the files/directories in the directory.
    To cancel the operation, save an empty buffer.""")
    parser.add_argument('directory', help='The target directory')
    parser.add_argument('-a', '--add', help='Add unnumbered files to numbering', dest='add', action='store_true')
    parser.add_argument('-n', '--nono', help='Do not make changes', action='store_true')
    parser.add_argument('-v', '--verbose', help='Verbose output', action='store_true')
    parser.add_argument('-d', '--directory', help='Operate on directories instead of files', dest='direct', action='store_true')
    parser.add_argument('-f', '--format', help='Number of leading 0', dest='form', type=int, nargs=1, default=[-1])
    parser.add_argument('-u', '--update', help='Force rename all files', action='store_true')
    parser.add_argument('-l', '--filter', help='Filter string for files/directories. This is represented as a single string containing a space-separated list of filters operated on with logical or', type=str, nargs=1, default=[''])
    parser.add_argument('-s', '--separator', help='Character to separate the number from the file/directory name. The none option will either choose whatever is already used in the directory or default to _', choices=sep_choices, type=str, nargs=1, default=['none'])
    args = parser.parse_args(argv[1:])

    # Variables to hold program statistics
    renamed = 0
    added = 0
    deleted = 0

    # Get directory to reorder
    directory = path.realpath(args.directory)

    # Create list of files
    if not args.direct:
        files = sorted([path.basename(f) for f in list_files(directory)], key=natural_keys)
    else:
        files = sorted([path.basename(f) for f in list_dirs(directory)], key=natural_keys)

    # Add filter for files
    if args.filter[0] != '':
        filt = args.filter[0].rstrip().split()
        files = sorted([a for a in files if [b for b in filt if b in a]], key=natural_keys)

    # Get separator
    if args.separator[0] == 'none':
        try:
            sep = re.match(f'^(\d*)([{SEPS}])(.*)$', files[0])[2]
        except:
            sep = '_'
    else:
        sep = args.separator[0]

    # Remove unnumbered files
    unnumbered_files = []
    numbered_files = []
    if not args.add:
        for f in files:
            match = re.match(f'^(\d*)[{SEPS}](.*)$', f)
            if match:
                numbered_files.append(f)
            else:
                unnumbered_files.append(f)

        files = numbered_files

    # Create vim buffer content
    buf = '\n'.join(files)

    # Edit with vim
    with tempfile.NamedTemporaryFile(suffix='.tmp') as tf:
        tf.write(buf.encode('utf-8'))
        tf.flush()
        subprocess.call([EDITOR, tf.name])
        tf.seek(0)
        new_files = tf.read().decode('utf-8').rstrip().split('\n')
        new_files = [i for i in new_files if i]
        if len(new_files) == 0:
            print('Exited due to empty buffer.')
            exit()

    # Calculate the number of digits needed for the prepended number
    max_num = math.ceil(math.log(len(new_files)+1, 10))
    if args.form[0] != -1:
        max_num = args.form[0]

    # Rename, Delete, Add files or directories
    count = 1

    for f in new_files:
        # Rename
        match = re.match(f'^(\d*)[{SEPS}](.*)$', f)
        if match:
            id = match[1]
            name = match[2]
            old_name = get_previous_name(files, id)
            if len(old_name) == 1:
                if (args.update or old_name[0] != f or int(id) != count):
                    if not args.nono:
                        os.rename(path.join(directory, old_name[0]), path.join(directory, f'{count:0{max_num}d}{sep}{name}'))
                    renamed += 1
                    if (args.verbose):
                        print(f'Renamed: {old_name[0]} to {count:0{max_num}d}{sep}{name}.')
            else:
                print(f'Could not rename {name} since multiple old files match.')

            # Remove processed old files.
            for i in old_name:
                files.remove(i)

        # Add file to numbered list
        else:
            # Check is already exists
            if f in unnumbered_files or f in files:
                # Rename existing file
                if not args.nono:
                    os.rename(path.join(directory, f), path.join(directory, f'{count:0{max_num}d}{sep}{f}'))
                renamed += 1
                if (args.verbose):
                    print(f'Renamed: {f} to {count:0{max_num}d}{sep}{f}.')
                if f in files:
                    files.remove(f)
            else:
                # New file or directory
                if not args.nono:
                    if not args.direct:
                        open(path.join(directory, f'{count:0{max_num}d}{sep}{f}'), 'w').close()
                    else:
                        os.mkdir(path.join(directory, f'{count:0{max_num}d}{sep}{f}'), RIGHTS)

                added += 1
                if (args.verbose):
                    print(f'Added: {count:0{max_num}d}{sep}{f}.')

        count += 1

    # Delete
    for f in files:
        if not args.nono:
            if not args.direct:
                os.remove(path.join(directory, f))
            else:
                shutil.rmtree(path.join(directory, f))
        deleted += 1
        if (args.verbose):
            print(f'Deleted: {f}.')

    # Print statistics
    print(f'Added: {added}  Deleted: {deleted}  Renamed: {renamed}')

if __name__ == '__main__':
    main(sys.argv)
