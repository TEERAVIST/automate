#!/bin/bash

# Import logging functions
# source "$(dirname "$0")/logging.sh"

extract_tar_gz() {
  local tar_file=${1:?Missing tar file path}
  local destination=${2:?Missing destination path}

  # Ensure the tar file exists
  if [[ ! -f "$tar_file" ]]; then
    log_error "Tar file not found: $tar_file"
    return 1
  fi

  # Ensure the destination directory exists
  if [[ ! -d "$destination" ]]; then
    if mkdir -p "$destination"; then
      log_info "Created destination directory: $destination"
    else
      log_error "Failed to create destination directory: $destination"
      return 1
    fi
  fi

  # Extract the tar.gz file
  if tar -xzvf "$tar_file" -C "$destination"; then
    log_info "Successfully extracted '$tar_file' to '$destination'."
  else
    log_error "Failed to extract '$tar_file' to '$destination'."
    return 1
  fi

  return 0
}

# Example usage
# extract_tar_gz "/path/to/file.tar.gz" "/path/to/destination"
