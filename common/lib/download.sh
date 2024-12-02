#!/bin/bash

# Import logging functions
# source "$(dirname "$0")/logging.sh"

download_file() {
  local url=${1:?Missing URL}
  local destination=${2:?Missing destination path}

  # Ensure the parent directory for the destination exists
  local dir
  dir=$(dirname "$destination")
  if [[ ! -d "$dir" ]]; then
    if mkdir -p "$dir"; then
      log_info "Created directory: $dir"
    else
      log_error "Failed to create directory: $dir"
      return 1
    fi
  fi

  # Perform the download
  if curl -# -L "$url" -o "$destination"; then
    log_info "File downloaded successfully from '$url' to '$destination'."
  else
    log_error "Failed to download file from '$url'."
    return 1
  fi

  return 0
}

# download_file "https://example.com/file.txt" "./file.txt"
# Example usage
