#!/bin/bash

# if not found a LOG_FILE variable. it will write a logs in current path
LOG_FILE="${LOG_FILE:-./app.log}"

# Define color codes
COLOR_RESET="\e[0m"
COLOR_INFO="\e[32m"    # Green for info
COLOR_WARNING="\e[33m" # Yellow for warning
COLOR_ERROR="\e[31m"   # Red for error

# Log an info message
log_info() {
  local message="$1"
  printf "${COLOR_INFO}[INFO] %s %s${COLOR_RESET}\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$message" | tee -a "$LOG_FILE"
}

# Log a warning message
log_warning() {
  local message="$1"
  printf "${COLOR_WARNING}[WARNING] %s %s${COLOR_RESET}\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$message" | tee -a "$LOG_FILE"
}

# Log an error message
log_error() {
  local message="$1"
  printf "${COLOR_ERROR}[ERROR] %s %s${COLOR_RESET}\n" "$(date '+%Y-%m-%d %H:%M:%S')" "$message" | tee -a "$LOG_FILE" >&2
}
