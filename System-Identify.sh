    #!/bin/bash
    # Script 1: System Identity Report
    # Author: PRADEEP N | Software Focus: Python
    # Using: variables, echo, command substitution, and box-formatting      

    # Setting up project-specific identifiers 
    NAME="Pradeep N"                # Your name for the report header
    SOFTWARE_CHOICE="Python"        # The open-source tool we are auditing
 

    # Gathering live environmental data from the system
    # These lines capture the technical "DNA" of the current machine
    KERNEL=$(uname -r)                    # Grabbing the specific kernel build version
    USER_NAME=$(whoami)                   # Identifying the person currently at the terminal
    HOME_DIR=$HOME                        # Locating the path to the user's primary folder
    UPTIME=$(uptime -p)                   # Checking how long the system has been running
    CURRENT_DATE=$(date '+%A, %d %B %Y')  # Organizing the date for a professional look
    CURRENT_TIME=$(date '+%I:%M:%S %p')   # Keeping track of the exact execution time

    # Extracting the distribution name from /etc/os-release
    
    DISTRO_NAME=$(grep -w "PRETTY_NAME" /etc/os-release | cut -d'"' -f2)

    # --- Display the system identity report ---
    echo ""
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║           OPEN SOURCE AUDIT — SYSTEM IDENTITY           ║"
    echo "╠══════════════════════════════════════════════════════════╣"
    echo "║  Student    : $NAME"
    echo "║  Software   : $SOFTWARE_CHOICE"
    echo "╠══════════════════════════════════════════════════════════╣"
    echo "║  Distribution : $DISTRO_NAME"
    echo "║  Kernel       : $KERNEL"
    echo "║  User         : $USER_NAME"
    echo "║  Home Dir     : $HOME_DIR"
    echo "║  Uptime       : $UPTIME"
    echo "║  Date         : $CURRENT_DATE"
    echo "║  Time         : $CURRENT_TIME"
    echo "╠══════════════════════════════════════════════════════════╣"
    echo "║  OS License   : GNU General Public License v2 (GPLv2)   ║"
    echo "║  The Linux kernel is licensed under GPLv2, which        ║"
    echo "║  guarantees the freedom to use, study, modify,          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo ""

# --- End of Script 1 ---
