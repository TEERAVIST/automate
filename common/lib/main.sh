#!/bin/bash

source "../../ktc_dev/bin/remove_java_version.sh"
source "./extract_tar.sh"
source "./download.sh"
source "./firewall.sh"
source "./unlinking.sh"
source "./missing.sh"
source "./logging.sh"
source "./remove.sh"
source "./backup_utils.sh"
source "./ascii.sh"
source "./service_utils.sh"
source "./checking.sh"
source "./permissions.sh"
source "./moving.sh"
source "./linking.sh"
source "../config/log_config.sh"      # where the log file will be written
source "../config/services_config.sh" # list a name of services
source "../config/remove_items_config.sh"
source "../config/check_config.sh"

### logging
ascii_logging_enable
where_logging_write

####
####
ascii_backup

backup_directory /home/toto/Practice/Bash/root/common/lib/test_backup /home/toto/Practice/Bash/root/common/lib/test_backup

####
#### move a file or folder
ascii_moving

## move file
copy_and_verify /home/toto/Practice/Bash/root/common/lib/test_file /home/toto/Practice/Bash/root/common/lib/test

## move folder
copy_and_verify /home/toto/Practice/Bash/root/common/lib/test /home/toto/Practice/Bash/root/common/lib/test_move/

####
#### check config file . where to retrived a config file
ascii_config

check_config_files

###
### setting permission more deatail in ../docs/permissions.html
ascii_permissions

setup_permissions ./test "toto:toto"

###
### create if folder or files is misssing
ascii_missing

# end with / will be folder , otherwise file
create_if_missing "create_this_file_incommand/"

create_if_missing "create_this_file_incommand.txt"
###
###

## create a symlink
ascii_linking

link_and_verify ./test ./test_file_linking

ascii_unlink

## unlink a file symlink
unlinking

remove_symlinks test_file_linking
# list in ../config/remove_items_config.sh
ascii_remove

remove_items

###
### check services status
ascii_service_status

status_all_services

###
## wati for restart services
ascii_wait

wait_for_background_tasks
