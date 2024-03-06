#! /bin/bash

tfa="--font /usr/share/fonts/TTF/JetBrainsMonoNerdFontMono-Medium.ttf -c $HOME/.config/tofi.theme --require-match false --history-file $HOME/.local/state/tofi-custom-history"
tf="tofi $tfa"
arg=$( { awk 'BEGIN{FS="="}; /^GenericName[^\[\]]/ || /^Name[^\[\]]/ {print $2}' /usr/share/applications/*.desktop $HOME/.local/share/applications/*.desktop; compgen -c; } | $tf)
getibase() {
  if [[ $1 =~ ^0x ]]; then
    echo "16"
  elif [[ $1 =~ ^0o ]]; then 
    echo "8"
  else 
    echo "10"
  fi
}
stripPrefix() {
  if [[ $1 =~ ^0[a-z] ]]; then
    echo `echo $1 | cut -c 3-`
  else 
    echo $1
  fi
}
if [[ $arg =~ ^hex\  ]]; then
    val=`echo $arg | awk 'BEGIN{FS=" "};{print $2}'`
    ibase=`getibase $val`
    val=`stripPrefix $val`
    echo "0x"`echo "obase=16;ibase=$ibase; $val" | bc` | $tf
elif [[ $arg =~ ^dec\  ]]; then
    val=`echo $arg | awk 'BEGIN{FS=" "};{print $2}'`
    ibase=`getibase $val`
    val=`stripPrefix $val`
    echo "obase=10; ibase=$ibase; $val" | bc | $tf
elif [[ $arg =~ ^oct\  ]]; then
    val=`echo $arg | awk 'BEGIN{FS=" "};{print $2}'`
    ibase=`getibase $val`
    val=`stripPrefix $val`
    echo "0o"`echo "obase=8;ibase=$ibase; $val" | bc` | $tf
elif [[ $arg =~ ^[0-9] ]]; then
  ans=$(calc "$arg") 
  if [[ -z $ans ]]; then
    ans="Err"
  fi
  calc $arg 2> >($tf --prompt-text $ans)
elif [[ ! -z $arg ]]; then
  files=$(grep -l "^.*Name=$arg$" /usr/share/applications/*.desktop $HOME/.local/share/applications/*.desktop)
  echo $files
  file=""
  if [[ ! -z $files ]]; then
    file=$(grep -L "NoDisplay=true" $files)
    if [[ ! -f $file ]]; then
      file=`echo $file | awk 'BEGIN{FS=" "};{print $1}'`    
    fi
  fi
  echo $file
  if [[ -f $file ]]; then
    exe=$(awk 'BEGIN{FS="[=\ ]"}/^Exec/{print$2; exit;}' $file)
    echo $exe
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
