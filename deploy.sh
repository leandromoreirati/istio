set -eo pipefail

if [ ! -d "$PWD/built-library" ]; then
  git clone --single-branch --branch v1 https://github.com/leandromoreirati/built-library.git "$PWD/built-library"
fi

__BUILD_TOOLS_PATH="./built-library"

#__LIBRARY_PATH="./built-library"

LOG_FILE="$PWD/cluster.log"

rm -f $LOG_FILE

source "$__BUILD_TOOLS_PATH/scripts/log.sh"
source "$__BUILD_TOOLS_PATH/scripts/shell_overrides.sh"
source "$__BUILD_TOOLS_PATH/scripts/istio.sh"

f_istio() {
  #$1 - Istio configuration folder
  istio_install "$PWD/istio"
}

f_destroy_istio() {
  #$1 - Istio Namespace
  #$2 - Istio Configuration Folder
  istio_uninstall "istio-system" "$PWD/istio"
}

f_clean() {
  rm -rfv terraform/.terraform* terraform/terraform*  terraform/tfplan*
}

case "$1" in
  deploy-istio)
    f_istio
  ;;

  destroy-istio)
    f_destroy_istio
  ;;

  clean)
    f_clean
  ;;

  *)
    echo "usage: build.sh deploy-istio|destroy-istio|clean"
    exit 0
  ;;

esac