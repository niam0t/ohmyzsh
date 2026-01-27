# Android development environment setup for Zsh
export ANDROID_BASE_DIR="${HOME}/Android"
export ANDROID_HOME="${ANDROID_BASE_DIR}/Sdk"  # SDK tools path
# export ANDROID_AVD_HOME="${ANDROID_BASE_DIR}/.android/avd"  # Explicit AVD path
export FLUTTER_ROOT="${ANDROID_BASE_DIR}/flutter"
export ANDROID_SDK_ROOT="${ANDROID_HOME}"

# Helper function to safely add directories to PATH
android_add_to_path() {
  local dir="$1"
  if [[ -d "$dir" ]] && [[ ":${PATH}:" != *":${dir}:"* ]]; then
    export PATH="${dir}:${PATH}"
  fi
}

# Set Android SDK environment variables
set_android_sdk_env_var() {
  if [[ -d "${ANDROID_HOME}" ]]; then

  #
    # Add Android tools to PATH
    android_add_to_path "${ANDROID_HOME}/emulator"
    android_add_to_path "${ANDROID_HOME}/platform-tools"
    android_add_to_path "${ANDROID_HOME}/tools/bin"

    # Add cmdline-tools (modern structure)
    local cmdline_tools_dir="${ANDROID_HOME}/cmdline-tools/latest/bin"
    if [[ -d "$cmdline_tools_dir" ]]; then
      android_add_to_path "$cmdline_tools_dir"
    else
      # Fallback to legacy cmdline-tools structure
      if [[ -d "${ANDROID_HOME}/cmdline-tools" ]]; then
        local legacy_tools_dir=$(find "${ANDROID_HOME}/cmdline-tools" -maxdepth 1 -name "*" -type d | sort -r | head -n 1)
        if [[ -n "$legacy_tools_dir" ]]; then
          android_add_to_path "$legacy_tools_dir/bin"
        fi
      fi
    fi
  fi
}

# Set Flutter path (unchanged)
set_flutter_path() {
  if [[ -d "${FLUTTER_ROOT}/bin" ]]; then
    android_add_to_path "${FLUTTER_ROOT}/bin"
  fi
  if [[ -d "${HOME}/.pub-cache/bin" ]]; then
    android_add_to_path "${HOME}/.pub-cache/bin"
  fi
  if [[ -d "${FLUTTER_ROOT}/bin/cache/dart-sdk/bin" ]]; then
    android_add_to_path "${FLUTTER_ROOT}/bin/cache/dart-sdk/bin"
  fi
}

# Initialize
set_android_sdk_env_var
set_flutter_path
export CHROME_EXECUTABLE="brave-browser"
