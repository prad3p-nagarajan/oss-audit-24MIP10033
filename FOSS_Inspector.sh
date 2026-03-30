
#!/bin/bash

# --------------------------------------------
# FOSS Package Inspector - Python
# This script checks if Python is installed,
# displays its version, and prints a description
# using a case statement.
# --------------------------------------------

# Step 1: Set default package name
pkg="python3"

# Step 2: Check if python3 command exists
echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║          FOSS PACKAGE INSPECTOR                         ║"
echo "╠══════════════════════════════════════════════════════════╣"
echo "║  Inspecting package: $PACKAGE"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""
# 'command -v' checks if the command is available in the system
if command -v "$pkg" >/dev/null 2>&1; then
    
    # If found, print success message
    echo "✅ $pkg is installed."

    # Step 3: Get Python version
    # '--version' prints version info
    version=$($pkg --version 2>&1)

    # Display version
    echo "Version: $version"

    # Step 4: Use case statement to describe software
    case "$pkg" in
        python|python3)
            echo "Description: Python is a high-level, interpreted programming language used for web development, data analysis, artificial intelligence, automation, and more."
            ;;
        
        # Default case (not really needed here but added for completeness)
        *)
            echo "Description: No predefined description available."
            ;;
    esac

else
    # If python3 is not found, check for 'python'
    if command -v python >/dev/null 2>&1; then
        
        pkg="python"
        echo "✅ $pkg is installed."

        # Get version of python
        version=$(python --version 2>&1)
        echo "Version: $version"

        # Case statement again
        case "$pkg" in
            python|python3)
                echo "Description: Python is a high-level, interpreted programming language used for web development, data analysis, artificial intelligence, automation, and more."
                ;;
            *)
                echo "Description: No predefined description available."
                ;;
        esac

    else
        # If neither python nor python3 is found
        echo "❌ Python is NOT installed on this system."
    fi
fi
# --- End of Script 2 ---