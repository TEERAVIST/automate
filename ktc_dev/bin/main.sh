#!/bin/bash

#
source "./remove_java_version.sh" # individual script for project
source "./common_source.sh"       # common commands

# config file only this project
source "../config/log_config.sh"          # where the log file will be written
source "../config/services_config.sh"     # list a name of services
source "../config/remove_items_config.sh" # remove the files or folders
source "../config/check_config.sh"

ascii_logging_enable

where_logging_write

ascii_config

check_config_files

ascii_backup
ascii_remove
ascii_download
ascii_permissions
ascii_linking
ascii_moving
ascii_wait
ascii_service_stop
