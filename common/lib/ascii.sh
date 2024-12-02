#!/bin/bash

# Function to set text color
set_color() {
  case $1 in
  "red") echo -e "\033[1;31m" ;;           # Red
  "green") echo -e "\033[1;32m" ;;         # Green
  "yellow") echo -e "\033[1;33m" ;;        # Yellow
  "blue") echo -e "\033[1;34m" ;;          # Blue
  "purple") echo -e "\033[1;35m" ;;        # Purple
  "cyan") echo -e "\033[1;36m" ;;          # Cyan
  "white") echo -e "\033[1;37m" ;;         # White
  "gray") echo -e "\033[1;90m" ;;          # Gray
  "bright-red") echo -e "\033[1;91m" ;;    # Bright Red
  "bright-green") echo -e "\033[1;92m" ;;  # Bright Green
  "bright-yellow") echo -e "\033[1;93m" ;; # Bright Yellow
  "bright-blue") echo -e "\033[1;94m" ;;   # Bright Blue
  "bright-purple") echo -e "\033[1;95m" ;; # Bright Purple
  "bright-cyan") echo -e "\033[1;96m" ;;   # Bright Cyan
  "bright-white") echo -e "\033[1;97m" ;;  # Bright White
  "orange") echo -e "\033[38;5;208m" ;;    # Orange
  "pink") echo -e "\033[38;5;205m" ;;      # Pink
  "lime") echo -e "\033[38;5;118m" ;;      # Lime
  "teal") echo -e "\033[38;5;37m" ;;       # Teal
  "gold") echo -e "\033[38;5;214m" ;;      # Gold
  "indigo") echo -e "\033[38;5;54m" ;;     # Indigo
  "maroon") echo -e "\033[38;5;52m" ;;     # Maroon
  "reset") echo -e "\033[0m" ;;            # Reset color
  *) echo -e "\033[0m" ;;                  # Default to reset if color is invalid
  esac
}

# Function to select a random color
random_color() {
  local colors=(
    "red" "green" "yellow" "blue" "purple" "cyan" "white"
    "gray" "bright-red" "bright-green" "bright-yellow"
    "bright-blue" "bright-purple" "bright-cyan" "bright-white"
    "orange" "pink" "lime" "teal" "gold" "indigo" "maroon"
  )
  local random_index=$((RANDOM % ${#colors[@]}))
  set_color "${colors[$random_index]}"
}

# ascii_() {
#   random_color
#   cat <<"EOF"
#
#                       by 0xK1n3ticShdw
# ---------------------------------------
# EOF
#   set_color reset
# }
# ASCII art for move anything
ascii_download() {
  random_color
  cat <<"EOF"
 __   __                  __        __          __
|  \ /  \ |  | |\ | |    /  \  /\  |  \ | |\ | / _`
|__/ \__/ |/\| | \| |___ \__/ /~~\ |__/ | | \| \__>    ...

                                  by 0xK1n3ticShdw
===================================================
EOF
  set_color reset
}
# ASCII art for move anything
ascii_firewall() {
  random_color
  cat <<"EOF"
 ___    __   ___                         __   ___ ___ ___         __  
|__  | |__) |__  |  |  /\  |    |       /__` |__   |   |  | |\ | / _` 
|    | |  \ |___ |/\| /~~\ |___ |___    .__/ |___  |   |  | | \| \__> 

                                            by 0xK1n3ticShdw
===================================================================
EOF
  set_color reset
}
# ASCII art for move anything
ascii_unlink() {
  random_color
  cat <<"EOF"
                                   __  
|  | |\ | |    | |\ | |__/ | |\ | / _` 
\__/ | \| |___ | | \| |  \ | | \| \__> 

                      by 0xK1n3ticShdw
=======================================
EOF
  set_color reset
}

#
# ASCII art for move anything
ascii_missing() {
  random_color
  cat <<"EOF"
         __   __          __          __ __ 
 |\/| | /__` /__` | |\ | / _`          _| _|
 |  | | .__/ .__/ | | \| \__>    ..    .  . 

                                  by 0xK1n3ticShdw
===================================================
EOF
  set_color reset
}

# ASCII art for move anything
ascii_remove() {
  random_color
  cat <<"EOF"
 __   ___        __               __           
|__) |__   |\/| /  \ \  / | |\ | / _`          
|  \ |___  |  | \__/  \/  | | \| \__> .   .   .

                                  by 0xK1n3ticShdw
===================================================
EOF
  set_color reset
}

# ASCII art for move anything
ascii_permissions() {
  random_color
  cat <<"EOF"
 __   ___  __           __   __     __        __  
|__) |__  |__)  |\/| | /__` /__` | /  \ |\ | /__` 
|    |___ |  \  |  | | .__/ .__/ | \__/ | \| .__/ 
                                                  
                                  by 0xK1n3ticShdw
===================================================
EOF
  set_color reset
}

#
# ASCII art for move anything
ascii_linking() {
  random_color
  cat <<"EOF"
                         __  
|    | |\ | |__/ | |\ | / _` 
|___ | | \| |  \ | | \| \__> 

            by 0xK1n3ticShdw
=============================
EOF
  set_color reset
}

#
# ASCII art for move anything
ascii_moving() {
  random_color
  cat <<"EOF"
       __               __      ___       ___  __  ___              __  
 |\/| /  \ \  / | |\ | / _`    |__  \  / |__  |__)  |  |__| | |\ | / _` 
 |  | \__/  \/  | | \| \__>    |___  \/  |___ |  \  |  |  | | | \| \__> 

                                                    by 0xK1n3ticShdw
=====================================================================
EOF
  set_color reset
}

# ASCII art for logging
ascii_logging_disable() {
  random_color
  cat <<"EOF"
      __   __   __          __      __     __        __        ___  __  
|    /  \ / _` / _` | |\ | / _`    |  \ | /__`  /\  |__) |    |__  |  \ 
|___ \__/ \__> \__> | | \| \__>    |__/ | .__/ /~~\ |__) |___ |___ |__/ 

                                                    by 0xK1n3ticShdw
=====================================================================
EOF
  set_color reset
}

ascii_logging_enable() {
  random_color
  cat <<"EOF"
      __   __   __          __      ___            __        ___  __  
|    /  \ / _` / _` | |\ | / _`    |__  |\ |  /\  |__) |    |__  |  \ 
|___ \__/ \__> \__> | | \| \__>    |___ | \| /~~\ |__) |___ |___ |__/ 

                                                    by 0xK1n3ticShdw
=====================================================================
EOF
  set_color reset
}
#
# ASCII art for service management
ascii_service_start() {
  random_color
  cat <<"EOF"
 __  ___       __  ___     __   ___  __          __   ___  __  
/__`  |   /\  |__)  |     /__` |__  |__) \  / | /  ` |__  /__` 
.__/  |  /~~\ |  \  |     .__/ |___ |  \  \/  | \__, |___ .__/ 

                                            by 0xK1n3ticShdw
==============================================================
EOF
  set_color reset
}
# ASCII art for service management
ascii_service_status() {
  random_color
  cat <<"EOF"
 __  ___      ___       __      __   ___  __          __   ___  __  
/__`  |   /\   |  |  | /__`    /__` |__  |__) \  / | /  ` |__  /__` 
.__/  |  /~~\  |  \__/ .__/    .__/ |___ |  \  \/  | \__, |___ .__/ 

                                                      by 0xK1n3ticShdw
=======================================================================
EOF
  set_color reset
}

# ASCII art for service management
ascii_service_restart() {
  random_color
  cat <<"EOF"
 __   ___  __  ___       __  ___     __   ___  __          __   ___  __  
|__) |__  /__`  |   /\  |__)  |     /__` |__  |__) \  / | /  ` |__  /__` 
|  \ |___ .__/  |  /~~\ |  \  |     .__/ |___ |  \  \/  | \__, |___ .__/ 

                                                      by 0xK1n3ticShdw
=======================================================================
EOF
  set_color reset
}
# ASCII art for service management
ascii_service_stop() {
  random_color
  cat <<"EOF"
 __  ___  __   __      __   ___  __          __   ___  __  
/__`  |  /  \ |__)    /__` |__  |__) \  / | /  ` |__  /__` 
.__/  |  \__/ |       .__/ |___ |  \  \/  | \__, |___ .__/ 

                                          by 0xK1n3ticShdw
==============================================================
EOF
  set_color reset
}

# ASCII art for backups
ascii_backup() {
  random_color
  cat <<"EOF"
 __        __             __  
|__)  /\  /  ` |__/ |  | |__) 
|__) /~~\ \__, |  \ \__/ |    
                              
            by 0xK1n3ticShdw
==============================
EOF
  set_color reset
}

# ASCII art for cleanup
ascii_cleanup() {
  random_color
  cat <<"EOF"
 __        ___                 __  
/  ` |    |__   /\  |\ | |  | |__) 
\__, |___ |___ /~~\ | \| \__/ |    

                by 0xK1n3ticShdw
==============================
EOF
  set_color reset
}

# ASCII art for file utilities
ascii_file_utils() {
  random_color
  cat <<"EOF"
 ___         ___         ___         __  
|__  | |    |__     |  |  |  | |    /__` 
|    | |___ |___    \__/  |  | |___ .__/ 

                      by 0xK1n3ticShdw
========================================
EOF
  set_color reset
}

# ASCII art for configuration management
ascii_config() {
  random_color
  cat <<"EOF"
 __   __        ___    __        __   ___ 
/  ` /  \ |\ | |__  | / _` |  | |__) |__  
\__, \__/ | \| |    | \__> \__/ |  \ |___ 
                                          
                      by 0xK1n3ticShdw
========================================
EOF
  set_color reset
}
# ASCII art for configuration management
ascii_wait() {
  random_color
  cat <<"EOF"
           __  ___                ___            
   | |  | /__`  |     |  |  /\  |  |             
\__/ \__/ .__/  |     |/\| /~~\ |  |     .   .   

                              by 0xK1n3ticShdw
================================================
EOF
  set_color reset
}

# Example usage
# if [[ "$#" -gt 0 ]]; then
#   case "$1" in
#   logging_enable) logging_enable ;;
#   logging_disable) logging_disable ;;
#   service) ascii_service ;;
#   backup) ascii_backup ;;
#   cleanup) ascii_cleanup ;;
#   file_utils) ascii_file_utils ;;
#   config) ascii_config ;;
#   *)
#     echo "Unknown option: $1"
#     echo "Available options: logging, service, backup, cleanup, file_utils, config"
#     ;;
#   esac
# else
#   echo "Usage: $0 <option>"
#   echo "Options: logging_enable, logging_disable, service, backup, cleanup, file_utils, config"
# fi
