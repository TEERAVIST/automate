#!/bin/bash

# Import logging functions
# source "$(dirname "$0")/logging.sh"

close_ping_timestamp() {
  # Add OUTPUT rule to block ICMP type 13 (timestamp requests)
  if sudo firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 0 -p icmp --icmp-type 13 -j DROP; then
    log_info "Added rule to block ICMP timestamp requests on OUTPUT."
  else
    log_error "Failed to add rule to block ICMP timestamp requests on OUTPUT."
    return 1
  fi

  # Add INPUT rule to block ICMP type 13 (timestamp requests)
  if sudo firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 0 -p icmp --icmp-type 13 -j DROP; then
    log_info "Added rule to block ICMP timestamp requests on INPUT."
  else
    log_error "Failed to add rule to block ICMP timestamp requests on INPUT."
    return 1
  fi

  # Reload the firewall to apply changes
  if sudo firewall-cmd --reload; then
    log_info "Firewall rules reloaded successfully."
  else
    log_error "Failed to reload firewall rules."
    return 1
  fi

  return 0
}

# Example usage
# close_ping_timestamp
