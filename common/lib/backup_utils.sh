#!/bin/bash

# required for "source" testing a script
# source "./logging.sh"
# source "./ascii.sh"
# source "../config/log_config.sh"

# Backup a file or directory and remove the original source after backup
backup_directory() {
  local src=${1:?Missing source file or directory to backup}
  local dest=${2:?Missing target backup file location}

  # Check if source exists, skip if not found
  if [[ ! -e $src ]]; then
    log_warning "Source '$src' does not exist. Skipping backup."
    return 0
  fi

  # Automatically append ".tar.gz" for compressed backups
  if [[ ! $dest =~ \.tar\.gz$ ]]; then
    dest="${dest}.tar.gz"
  fi

  # Handle same source and destination name
  if [[ $src == ${dest%.tar.gz} ]]; then
    local new_dest="${src}_backup_$(date +'%Y%m%d_%H%M%S').tar.gz"
    log_info "Source and destination conflict. Changing destination to '$new_dest'."
    dest=$new_dest
  fi

  # Check for destination conflict
  if [[ -e $dest ]]; then
    local timestamp
    timestamp=$(date +'%Y%m%d_%H%M%S')
    local new_backup="${dest%.tar.gz}_${timestamp}.tar.gz"

    if ! mv "$dest" "$new_backup"; then
      log_error "Failed to move existing destination to '$new_backup'."
      return 1
    fi

    log_info "Existing backup moved to '$new_backup'."
  fi

  # Create compressed backup
  if ! tar -czf "$dest" "$src"; then
    log_error "Failed to compress and backup '$src' to '$dest'."
    return 1
  fi

  log_info "Compressed backup of '$src' created at '$dest'."

  # Remove the original source after successful backup
  if [[ -d $src ]]; then
    if ! rm -rf "$src"; then
      log_error "Failed to remove directory '$src' after backup."
      return 1
    fi
  else
    if ! rm "$src"; then
      log_error "Failed to remove file '$src' after backup."
      return 1
    fi
  fi

  log_info "Source '$src' removed after backup."
}

# ascii_backup
#
# backup_directory "$@"
