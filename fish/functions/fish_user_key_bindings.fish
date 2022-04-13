function fish_user_key_bindings
   fzf_key_bindings

   # Use vi keybindings
   fish_vi_key_bindings

   # Add Back ctrl f to auto complete to end
   for mode in insert default visual
      bind -M $mode \cf forward-char
   end
end
