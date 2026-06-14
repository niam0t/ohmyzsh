# entry point
__main__(){
  configure_android_environment
  configure_flutter_environment
}
ANDROID_BASE_DIR="$HOME/Android"
ANDROID_SDK_HOME="$ANDROID_BASE_DIR"
ANDROID_SDK_DIR="$ANDROID_SDK_HOME/Sdk"


path_add_if_exists() {
  local target_dir="$1"
  [[ -z "$target_dir" || ! -d "$target_dir" ]] && return

  case ":$PATH:" in
    *":$target_dir:"*) ;;
    *) export PATH="$PATH:$target_dir" ;;
  esac
}


configure_browser_executable() {
  [[ -n "$CHROME_EXECUTABLE" ]] && return

  local preferred_browser_list=("brave" "brave-browser" "brave-browser-stable" "firefox" "x-www-browser")

  for browser_name in "${preferred_browser_list[@]}"; do
    if command -v "$browser_name" >/dev/null 2>&1; then
      export CHROME_EXECUTABLE="$(command -v "$browser_name")"
      return
    fi
  done
}


configure_flutter_environment() {
  local flutter_primary_bin="$ANDROID_BASE_DIR/flutter/bin"
  local flutter_fallback_bin="$HOME/flutter/bin"
  local dart_sdk_bin="$ANDROID_BASE_DIR/flutter/bin/cache/dart-sdk/bin"
  local pub_cache_bin="$HOME/.pub-cache/bin"

  [[ -d "$flutter_primary_bin" ]] && path_add_if_exists "$flutter_primary_bin"
  [[ -d "$flutter_fallback_bin" ]] && path_add_if_exists "$flutter_fallback_bin"

  path_add_if_exists "$dart_sdk_bin"
  path_add_if_exists "$pub_cache_bin"

  configure_browser_executable
}


configure_android_environment() {
  [[ ! -d "$ANDROID_SDK_DIR" ]] && return

  export ANDROID_HOME="$ANDROID_SDK_DIR"
  export ANDROID_SDK_ROOT="$ANDROID_SDK_DIR"
  # export ANDROID_USER_HOME="$ANDROID_SDK_HOME/.android"

  local emulator_bin="$ANDROID_HOME/emulator"
  local platform_tools_bin="$ANDROID_HOME/platform-tools"
  local tools_bin="$ANDROID_HOME/tools"
  local tools_legacy_bin="$ANDROID_HOME/tools/bin"

  path_add_if_exists "$emulator_bin"
  path_add_if_exists "$platform_tools_bin"
  path_add_if_exists "$tools_bin"
  path_add_if_exists "$tools_legacy_bin"

}

__main__
