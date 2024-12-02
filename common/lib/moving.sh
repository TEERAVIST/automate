#!/bin/bash

# just for testing required soruce
# source "./logging.sh"
#
copy_and_verify() {
  local src=${1:?Missing source path}
  local dst=${2:?Missing destination path}

  # Check if source exists
  if [[ ! -e "$src" ]]; then
    log_error "Source '$src' does not exist."
    return 1
  fi

  # Check if the source and destination are the same
  if [[ "$src" -ef "$dst" ]]; then
    log_warning "Source '$src' and destination '$dst' are the same. Skipping copy."
    return 0
  fi

  # Create destination directory if it doesn't exist
  local dst_dir
  dst_dir=$(dirname "$dst")
  if [[ ! -d "$dst_dir" ]]; then
    if ! mkdir -p "$dst_dir"; then
      log_error "Failed to create destination directory '$dst_dir'."
      return 1
    fi
    log_info "Created destination directory '$dst_dir'."
  fi

  # Perform copy operation
  if cp -r -v -f --preserve=all "$src" "$dst"; then
    log_info "Successfully copied '$src' to '$dst'."
  else
    log_error "Failed to copy '$src' to '$dst'."
    return 1
  fi

  # Skip verification for directories
  if [[ -d "$src" ]]; then
    log_info "Source '$src' is a directory. Skipping content verification."
    return 0
  fi

  # Verify if the destination exists
  if [[ ! -e "$dst" ]]; then
    log_error "Destination '$dst' not found after copy operation."
    return 1
  fi

  # Check if the contents match for files
  if ! diff -q "$src" "$dst" &>/dev/null; then
    log_warning "Contents of file '$src' and '$dst' do not match. Verify manually."
    return 1
  fi

  log_info "Verification complete. Contents of file '$src' and '$dst' are identical."
  return 0
}

# copy_and_verify "$@"

# Example usage
# copy_and_verify "/path/to/source" "/path/to/destination"
