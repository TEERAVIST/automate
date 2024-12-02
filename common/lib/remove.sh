#!/bin/bash

#
# just for testing (source required)
# source "../config/remove_items_config.sh"
# source "$(dirname "$0")/logging.sh"

# Global array to define items to remove

remove_items() {
  local item

  if [[ ${#ITEMS_TO_REMOVE[@]} -eq 0 ]]; then
    log_error "No items specified in ITEMS_TO_REMOVE array."
    return 1
  fi

  for item in "${ITEMS_TO_REMOVE[@]}"; do
    if [[ -f "$item" ]]; then
      if rm -f "$item"; then
        log_info "Removed file: $item"
      else
        log_error "Failed to remove file: $item"
      fi
    elif [[ -d "$item" ]]; then
      if rm -rf "$item"; then
        log_info "Removed directory: $item"
      else
        log_error "Failed to remove directory: $item"
      fi
    else
      log_warning "Item not found or unsupported type: $item. Skipping."
    fi
  done

  return 0
}

# Example usage
# Populate the ITEMS_TO_REMOVE array

# Call the function
# remove_items
