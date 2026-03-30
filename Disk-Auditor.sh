
echo ""

#!/bin/bash
# ==============================================================
# Script 3 (Modified): Disk and Permission Auditor (Python)
# Author: Rahul G | Course: Open Source Software
# Purpose: Audit system directories + Python configuration/setup
# ==============================================================

# --- Define important system directories ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

# --- Python-related paths ---
PYTHON_BIN=$(which python3 2>/dev/null)
PYTHON_CONFIG_DIR="$HOME/.config/python"
PYTHON_PIP_CONFIG="$HOME/.config/pip/pip.conf"

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║          DISK AND PERMISSION AUDITOR (PYTHON)           ║"
echo "╠══════════════════════════════════════════════════════════╣"
echo "║  Auditing system directories + Python environment       ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# --- Overall disk usage ---
echo "=== Overall Disk Usage ==="
df -h / | awk 'NR==1 || NR==2'
echo ""

# --- Directory Audit ---
echo "=== Directory Audit Report ==="
echo "--------------------------------------------------------------"
printf "%-15s %-15s %-10s %-10s %s\n" "DIRECTORY" "PERMISSIONS" "OWNER" "GROUP" "SIZE"
echo "--------------------------------------------------------------"

for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        [ -z "$SIZE" ] && SIZE="N/A"

        printf "%-15s %-15s %-10s %-10s %s\n" "$DIR" "$PERMS" "$OWNER" "$GROUP" "$SIZE"
    else
        printf "%-15s %-15s\n" "$DIR" "[DOES NOT EXIST]"
    fi
done

echo ""

# --- Python Audit Section ---
echo "=== Python Configuration Audit ==="
echo "--------------------------------------------------------------"

# Check Python binary
if [ -n "$PYTHON_BIN" ]; then
    PERMS=$(ls -l "$PYTHON_BIN" | awk '{print $1}')
    OWNER=$(ls -l "$PYTHON_BIN" | awk '{print $3}')
    echo "Python binary : $PYTHON_BIN"
    echo "Permissions   : $PERMS"
    echo "Owner         : $OWNER"
else
    echo "Python binary : NOT FOUND"
fi

echo ""

# Check Python config directory
if [ -d "$PYTHON_CONFIG_DIR" ]; then
    PERMS=$(ls -ld "$PYTHON_CONFIG_DIR" | awk '{print $1}')
    OWNER=$(ls -ld "$PYTHON_CONFIG_DIR" | awk '{print $3}')
    SIZE=$(du -sh "$PYTHON_CONFIG_DIR" 2>/dev/null | cut -f1)

    echo "Config dir    : $PYTHON_CONFIG_DIR"
    echo "Permissions   : $PERMS"
    echo "Owner         : $OWNER"
    echo "Size          : $SIZE"
else
    echo "Config dir    : $PYTHON_CONFIG_DIR [NOT FOUND]"
fi

echo ""

# Check pip config file
if [ -f "$PYTHON_PIP_CONFIG" ]; then
    PERMS=$(ls -l "$PYTHON_PIP_CONFIG" | awk '{print $1}')
    OWNER=$(ls -l "$PYTHON_PIP_CONFIG" | awk '{print $3}')
    echo "Pip config    : $PYTHON_PIP_CONFIG"
    echo "Permissions   : $PERMS"
    echo "Owner         : $OWNER"
else
    echo "Pip config    : $PYTHON_PIP_CONFIG [NOT FOUND]"
    echo "  (Create with: pip config set global.index-url <url>)"
fi

echo ""

# Check installed Python version
if [ -n "$PYTHON_BIN" ]; then
    VERSION=$($PYTHON_BIN --version 2>&1)
    echo "Python version: $VERSION"
fi

echo ""
echo "=== Audit Complete ==="
echo ""

# --- End of Script 3 ---
