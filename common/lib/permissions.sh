#!/bin/bash

# just for testing required soruce
# source "$(dirname "$0")/logging.sh"

# Set permissions for a service file
set_service_permissions() {
  local service_file=${1:?Missing service file path}
  chmod 640 "$service_file" &&
    chown root:root "$service_file" &&
    log_info "Set permissions and ownership for service file: $service_file" ||
    log_error "Failed to set permissions for service file: $service_file"
}

symlink_permissions() {
  local symlink_path=${1:?Missing symlink path}
  local owner=${2:?Missing owner in 'user:group' format}

  # Check if the symlink exists and is a valid symlink
  if [[ ! -L "$symlink_path" ]]; then
    log_error "Path '$symlink_path' is not a valid symbolic link."
    return 1
  fi

  # Set ownership of the symlink
  if chown -h "$owner" "$symlink_path"; then
    log_info "Set ownership of symlink '$symlink_path' to '$owner'."
  else
    log_error "Failed to set ownership of symlink '$symlink_path' to '$owner'."
    return 1
  fi

  return 0
}

# Set permissions for a Java directory
set_java_permissions() {
  local java_dir=${1:?Missing Java directory}
  local owner=${2:?Missing owner in 'user:group' format}

  if [[ $(stat -c "%U:%G" "$java_dir") != "$owner" ]]; then
    if chown -R "$owner" "$java_dir"; then
      log_info "Set ownership for Java directory '$java_dir' to '$owner'."
    else
      log_error "Failed to set ownership for Java directory '$java_dir' to '$owner'."
      return 1
    fi
  else
    log_info "Ownership for Java directory '$java_dir' is already '$owner'. No changes needed."
  fi

  if chmod -R 755 "$java_dir"; then
    log_info "Set permissions for Java directory '$java_dir' to 755."
  else
    log_error "Failed to set permissions for Java directory '$java_dir'."
    return 1
  fi
}

# Generic function to set up permissions for a given path
setup_permissions() {
  local path=${1:?Missing path}
  local owner=${2:?Missing owner in 'user:group' format}
  local permissions=${3:-770} # Default permissions to 770 if not provided

  if chmod -R "$permissions" "$path" && chown -R "$owner" "$path"; then
    log_info "Set permissions $permissions and ownership to '$owner' for path: $path"
  else
    log_error "Failed to set permissions or ownership for path: $path"
    return 1
  fi
}

# Custom function to set permissions for configuration files
set_config_permissions() {
  local config_file=${1:?Missing configuration file}
  chmod 600 "$config_file" &&
    chown root:root "$config_file" &&
    log_info "Set permissions to 600 and ownership to root:root for config file: $config_file" ||
    log_error "Failed to set permissions for config file: $config_file"
}

# Example usage
#
# set_service_permissions "/etc/systemd/system/my-service.service"
# symlink_permissions "/path/to/symlink" "user:group"
# set_java_permissions "/opt/java" "java_user:java_group"
# setup_permissions "/var/www/myapp" "www-data:www-data" 775
# set_config_permissions "/etc/myapp.conf"
