
function goto_repo
    set path (find  $HOME/Repos -maxdepth 3 -a -wholename "*$argv*" -a -type d  | head -n 1 )
    cd $path
end
function r 
 cd $HOME/Repos/$argv 2>/dev/null || goto_repo $argv
end
function list_all_repo
  set paths (find $HOME/Repos -maxdepth 3 -mindepth 1  -a -name ".git" -print | xargs dirname )
  set allPaths (echo $paths | awk 'BEGIN {RS = " "; FS = "/"} {print $NF " " $(NF-1)"/" $(NF)}')

  echo $allPaths
end
complete -c r -f  -a (list_all_repo)
