#!/bin/bash

# just for testing (source required)
# source "$(dirname "$0")/logging.sh"

# Create a file or directory if it does not exist
create_if_missing() {
  local path=${1:?Missing path}

  if [[ "${path: -1}" == "/" || -d "$path" ]]; then
    # Handle directory
    if [[ ! -d "$path" ]]; then
      if mkdir -p "$path"; then
        log_info "Directory created: $path"
      else
        log_error "Failed to create directory: $path"
        return 1
      fi
    else
      log_info "Directory already exists: $path"
    fi
  else
    # Handle file
    local dir
    dir=$(dirname "$path")
    if [[ ! -d "$dir" ]]; then
      if mkdir -p "$dir"; then
        log_info "Directory for file created: $dir"
      else
        log_error "Failed to create directory for file: $dir"
        return 1
      fi
    fi

    if [[ ! -e "$path" ]]; then
      if touch "$path"; then
        log_info "File created: $path"
      else
        log_error "Failed to create file: $path"
        return 1
      fi
    else
      log_info "File already exists: $path"
    fi
  fi

  return 0
}

# Example usage
# create_if_missing "/path/to/directory/"
# create_if_missing "/path/to/directory/file.txt"
