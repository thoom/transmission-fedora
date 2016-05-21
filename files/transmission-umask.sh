if [[ $(id -u) == 1000 ]]; then
  umask 002
fi
