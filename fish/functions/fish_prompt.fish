function fish_prompt --description 'Write out the prompt'
   set -g fish_prompt_last_status $status

   # Just calculate this once, to save a few cycles when displaying the prompt
   if not set -q __fish_prompt_hostname
      set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
   end

   # Setup Colors
   set -l normal (set_color normal)
   set -l prompt_color_user (set_color brgreen)
   set -l prompt_color_host (set_color brgreen)
   set -l prompt_color_git (set_color yellow)

   set -g __fish_git_prompt_showdirtystate true
   set -g __fish_git_prompt_showstashstate true
   set -g __fish_git_prompt_showuntrackedfiles true
   set -g __fish_git_prompt_showupstream auto

   set -l color_cwd
   set -l prefix
   switch $USER
   case root toor
      if set -q fish_color_cwd_root
         set color_cwd $fish_color_cwd_root
      else
         set color_cwd $fish_color_cwd
      end
      set suffix '#'
   case '*'
      set color_cwd $fish_color_cwd
      set suffix '$'
   end

   set -l suffix_color
   switch "$fish_key_bindings"
   case '*_vi_*' '*_vi'
      # possibly fish_vi_key_bindings, or custom key bindings
      # that includes the name "vi"
      switch $fish_bind_mode
      case default
         set suffix_color (set_color red)
      case insert
         set suffix_color $normal
      case visual
         set suffix_color (set_color purple)
      end
   end

   echo -n -s $prompt_color_user "$USER" @ $prompt_color_host "$__fish_prompt_hostname" $normal ':' (set_color $color_cwd) (prompt_pwd) $prompt_color_git (__fish_git_prompt) $suffix_color "$suffix "
end
