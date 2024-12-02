#!/bin/bash

# Import logging functions
# source "$(dirname "$0")/logging.sh"

# Remove existing symlinks
remove_symlinks() {
  local symlink_path=${1:?Missing symlink path}

  # Check if the provided path is a symlink
  if [[ -L "$symlink_path" ]]; then
    if rm "$symlink_path"; then
      log_info "Removed symlink: $symlink_path"
    else
      log_error "Failed to remove symlink: $symlink_path"
      return 1
    fi
  else
    if [[ -e "$symlink_path" ]]; then
      log_warning "Path '$symlink_path' exists but is not a symlink. Skipping."
    else
      log_warning "Symlink '$symlink_path' does not exist. Skipping."
    fi
  fi

  return 0
}

# Example usage
# remove_symlinks "/path/to/symlink"
