#!/bin/bash

# Start a service (always runs in the background)
start_service() {
  local service="$1"
  (systemctl start "$service" && log_info "Started service: $service" || log_error "Failed to start service: $service") &
  log_info "Start service command for $service is running in the background."
}

# Stop a service
stop_service() {
  local service="$1"
  if systemctl stop "$service"; then
    log_info "Stopped service: $service"
  else
    log_error "Failed to stop service: $service"
  fi
}

# Restart a service with optional force flag (always runs in the background)
restart_service() {
  local service="$1"
  local force="${2:-false}"

  (
    if [[ "$force" == "true" ]]; then
      systemctl restart --force "$service" && log_info "Forcefully restarted service: $service" || log_error "Failed to force restart service: $service"
    else
      systemctl restart "$service" && log_info "Restarted service: $service" || log_error "Failed to restart service: $service"
    fi
  ) &
  log_info "Restart service command for $service is running in the background."
}

# Reload service configuration (always runs in the background)
reload_service() {
  local service="$1"
  (systemctl reload "$service" && log_info "Reloaded service configuration for: $service" || log_error "Failed to reload service configuration for: $service") &
  log_info "Reload service command for $service is running in the background."
}

# Check the status of a service in detailed or short form
status_service() {
  local service="$1"
  local mode="${2:-detailed}" # Options: detailed, short
  if [[ "$mode" == "short" ]]; then
    systemctl status -a | grep --color=auto "$service" || log_error "Service not found: $service"
  else
    systemctl -l --no-pager status "$service" || log_error "Service not found or no status available for: $service"
  fi
}

# Enable a service to start on boot
enable_service() {
  local service="$1"
  if systemctl enable "$service"; then
    log_info "Enabled service: $service"
  else
    log_error "Failed to enable service: $service"
  fi
}

# Disable a service from starting on boot
disable_service() {
  local service="$1"
  if systemctl disable "$service"; then
    log_info "Disabled service: $service"
  else
    log_error "Failed to disable service: $service"
  fi
}

# List all active services matching a pattern
list_active_services() {
  local pattern="${1:-.*}"
  systemctl list-units --type=service --state=active | grep --color=auto "$pattern" || log_error "No active services match the pattern: $pattern"
}

# Wait for all background tasks to complete
wait_for_background_tasks() {
  log_info "Waiting for all background tasks to complete..."
  wait
  log_info "All background tasks have completed."
}

# Operations on all services
start_all_services() {
  for service in "${SERVICES[@]}"; do
    start_service "$service"
  done
}

stop_all_services() {
  for service in "${SERVICES[@]}"; do
    stop_service "$service"
  done
}

restart_all_services() {
  for service in "${SERVICES[@]}"; do
    restart_service "$service"
  done
}

reload_all_services() {
  for service in "${SERVICES[@]}"; do
    reload_service "$service"
  done
}

status_all_services() {
  for service in "${SERVICES[@]}"; do
    status_service "$service"
  done
}

enable_all_services() {
  for service in "${SERVICES[@]}"; do
    enable_service "$service"
  done
}

disable_all_services() {
  for service in "${SERVICES[@]}"; do
    disable_service "$service"
  done
}
