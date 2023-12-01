#! /bin/bash
#
tfa="--font /usr/share/fonts/TTF/JetBrainsMonoNerdFontMono-Medium.ttf -c $HOME/.config/tofi.theme --require-match false --history-file $HOME/.local/state/tofi-custom-history"
tf="tofi $tfa"
arg=$( { awk 'BEGIN{FS="="}; /^GenericName[^\[\]]/ || /^Name[^\[\]]/ {print $2}' /usr/share/applications/*.desktop $HOME/.local/share/applications/*.desktop; compgen -c; } | $tf)
if [[ $arg =~ ^[0-9] ]]; then
  ans=$(calc "$arg") 
  echo "" | $tf --prompt-text $ans
elif [[ ! -z $arg ]]; then
  echo $arg
  file=$(grep -l "^.*Name=$arg" /usr/share/applications/*.desktop $HOME/.local/share/applications/*.desktop)
  if [[ -f $file ]]; then
    echo "file: $file"
    exe=$(awk 'BEGIN{FS="="}/Exec/{print$2}' $file)
    if type $exe >/dev/null 2>&1; then
      $exe &
    else 
      notify-send "Could not find executable for $arg in $file found $exe"
    fi
  else
    kitty --hold fish -c "$arg"
  fi
fi
