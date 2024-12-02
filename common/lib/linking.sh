#!/bin/bash

# just for testing a script only (required source)
# source "$(dirname "$0")/logging.sh"

link_and_verify() {
  local target=${1:?Missing target path}
  local linkname=${2:?Missing symlink name}

  # Check if target exists
  if [[ ! -e "$target" ]]; then
    log_error "Target '$target' does not exist. Cannot create symlink."
    return 1
  fi

  # Create parent directory for the symlink if it doesn't exist
  local link_dir
  link_dir=$(dirname "$linkname")
  if [[ ! -d "$link_dir" ]]; then
    if ! mkdir -p "$link_dir"; then
      log_error "Failed to create directory '$link_dir' for symlink '$linkname'."
      return 1
    fi
    log_info "Created directory '$link_dir' for symlink."
  fi

  # Create the symlink
  if ln -s -f "$target" "$linkname"; then
    log_info "Successfully created symlink from '$target' to '$linkname'."
  else
    log_error "Failed to create symlink from '$target' to '$linkname'."
    return 1
  fi

  # Verify the symlink
  local resolved_target
  if resolved_target=$(readlink -f "$linkname"); then
    if [[ "$resolved_target" == "$(readlink -f "$target")" ]]; then
      log_info "Verification complete. Symlink '$linkname' points to '$target'."
    else
      log_warning "Symlink '$linkname' does not resolve to the correct target. Expected '$target', got '$resolved_target'."
      return 1
    fi
  else
    log_error "Failed to resolve symlink '$linkname'."
    return 1
  fi

  return 0
}

# link_and_verify "$@"
#
# Example usage
# link_and_verify "/path/to/target" "/path/to/symlink"
