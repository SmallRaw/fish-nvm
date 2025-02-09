function nvm
  if not type -q bass
    echo 'Bass is not installed please install it running fisher edc/bass'
    return
  end
  set -q NVM_DIR; or set -gx NVM_DIR ~/.nvm
  
  bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv

  set bstatus $status

  if test $bstatus -gt 0
    return $bstatus
  end

  if test (count $argv) -lt 1
    return 0
  end

  if test $argv[1] = "use"; or test $argv[1] = "install"
    set -g NVM_HAS_RUN 1
  end
end
