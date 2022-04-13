function fish_right_prompt -d "Write out the right prompt"
   set -l last_status $status

   set -l normal (set_color normal)
   set -l right_color (set_color cyan)
   set -l fish_color_status (set_color --bold red)

   set -l prompt_date (date "+%_I:%M%p")

   # Setup Prompt status
   set -l prompt_status
   if test $last_status -ne 0
      set prompt_status $fish_color_status "$last_status ↵ " $normal
   end

   # Setup timer
   set -gx fish_command_timer_export_cmd_duration_str 1
   set -gx fish_command_timer_enabled 0

   set -l prompt_time
   if set -q $CMD_DURATION_STR
      set prompt_time ""
   else
      set prompt_time $CMD_DURATION_STR " | "
   end

   echo -ns $prompt_status $right_color '<- ' $prompt_time $prompt_date $normal
end

