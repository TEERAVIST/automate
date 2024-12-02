#!/bin/bash

# Array of configuration files to check
# CONFIG_FILES=( "../config/log_config.sh"
#   "../config/services_config.sh"
#   "../config/remove_items_config.sh"
# )

# Function to check if configuration files exist
check_config_files() {
  for config_path in "${CONFIG_FILES[@]}"; do
    if [[ -f $config_path ]]; then
      log_info "Configuration file '$config_path' exists [using for fundamental config]."
    else
      log_warning "Configuration file '$config_path' does not exist."
    fi
  done
}

# Function to check the LOG_FILE variable
where_logging_write() {
  if [[ -z $LOG_FILE ]]; then
    log_warning "LOG_FILE variable is not set. Logs will not be written to a file."
  elif [[ ! -d $(dirname "$LOG_FILE") ]]; then
    log_warning "The directory for LOG_FILE does not exist: '$(dirname "$LOG_FILE")'."
  else
    log_info "Logs will be written to: '$LOG_FILE'."
  fi

  printf "\n%s\n\n" "========================================="
}
