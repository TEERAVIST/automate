#!/bin/bash

# Import logging functions
# source "$(dirname "$0")/logging.sh"

remove_java_directories() {
  local paths=("$@")

  if [[ ${#paths[@]} -eq 0 ]]; then
    log_error "No paths provided for scanning."
    return 1
  fi

  for path in "${paths[@]}"; do
    if [[ ! -d "$path" ]]; then
      log_warning "Path not found or is not a directory: $path. Skipping."
      continue
    fi

    log_info "Scanning path: $path for matching directories..."

    # Remove jdk1.8.0_401-421
    if find "$path" -type d -regex '.*/jdk1\.8\.0_\(40[1-9]\|41[0-9]\|42[0-1]\)' -exec rm -rf {} + 2>/dev/null; then
      log_info "Removed matching directories for jdk1.8.0_401-421 in path: $path"
    else
      log_error "Failed to remove jdk1.8.0_401-421 directories in path: $path"
    fi

    # Remove jdk-21.0.0 to jdk-21.0.4
    if find "$path" -type d -regex '.*/jdk-21\.0\.[0-4]$' -exec rm -rf {} + 2>/dev/null; then
      log_info "Removed matching directories for jdk-21.0.0 to jdk-21.0.4 in path: $path"
    else
      log_error "Failed to remove jdk-21.0.0 to jdk-21.0.4 directories in path: $path"
    fi

    # Remove jdk-17.0.0 to jdk-17.0.12
    if find "$path" -type d -regex '.*/jdk-17\.0\.\(0\|[1-9]\|1[0-2]\)$' -exec rm -rf {} + 2>/dev/null; then
      log_info "Removed matching directories for jdk-17.0.0 to jdk-17.0.12 in path: $path"
    else
      log_error "Failed to remove jdk-17.0.0 to jdk-17.0.12 directories in path: $path"
    fi
  done

  return 0
}

# Example usage
# remove_java_directories "/home/scsysadm" "/opt/java"
