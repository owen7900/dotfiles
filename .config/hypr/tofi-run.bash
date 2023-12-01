#! /bin/bash

tfa="--font /usr/share/fonts/TTF/JetBrainsMonoNerdFontMono-Medium.ttf -c $HOME/.config/tofi.theme --require-match false --history-file $HOME/.local/state/tofi-custom-history"
tf="tofi $tfa"
arg=$( { awk 'BEGIN{FS="="}; /^GenericName[^\[\]]/ || /^Name[^\[\]]/ {print $2}' /usr/share/applications/*.desktop $HOME/.local/share/applications/*.desktop; compgen -c; } | $tf)
if [[ $arg =~ ^[0-9] ]]; then
  ans=$(calc "$arg") 
  if [[ -z $ans ]]; then
    ans="Err"
  fi
  calc $arg 2> >($tf --prompt-text $ans)
elif [[ ! -z $arg ]]; then
  files=$(grep -l "^.*Name=$arg" /usr/share/applications/*.desktop $HOME/.local/share/applications/*.desktop)
  file=""
  if [[ ! -z $files ]]; then
    file=$(grep -L "NoDisplay=true" $files)
  fi
  if [[ -f $file ]]; then
    exe=$(awk 'BEGIN{FS="[=\ ]"}/^Exec/{print$2}' $file)
    if type $exe >/dev/null 2>&1; then
      if grep -q "Terminal=true" $file; then
        kitty --hold fish -c "$exe"
      else
        $exe &
      fi
    else 
      notify-send "Could not find executable for $arg in $file found $exe"
    fi
  else
    kitty --hold fish -c "$arg"
  fi
fi
