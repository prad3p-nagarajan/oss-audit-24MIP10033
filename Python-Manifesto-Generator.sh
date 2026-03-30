#!/bin/bash
# ==============================================================
# Script 5: Open Source Manifesto Generator
# ==============================================================

# --- Alias demonstration (Python-related) ---
# In bash, aliases are shortcuts for longer commands. For example:
# alias py='python3'              → typing 'py' runs 'python3'
# alias pipup='pip install --upgrade pip'
# alias runserver='python3 app.py'
# alias venv='python3 -m venv myenv'
# Aliases are typically defined in ~/.bashrc or ~/.bash_aliases
# They are best suited for interactive shells, not scripts.

# --- Gather user input ---
read -p "1. Name one open-source Python tool/library you use: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one Python project you would build and share: " BUILD

# --- Get date and user info ---
DATE=$(date '+%d %B %Y')
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
USERNAME=$(whoami)

# --- Output file ---
OUTPUT="manifesto_${USERNAME}_${TIMESTAMP}.txt"

# --- Write manifesto ---
echo "===================================================" > "$OUTPUT"
echo "   MY OPEN SOURCE MANIFESTO (PYTHON EDITION)" >> "$OUTPUT"
echo "   Generated on $DATE by $USERNAME" >> "$OUTPUT"
echo "===================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# --- Paragraph creation ---
echo "I believe in the power of open source. Every day, I rely on $TOOL — a Python-based tool that reflects the spirit of collaboration and transparency. To me, freedom means $FREEDOM. It shapes how I approach programming, learning, and sharing knowledge with others." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "If I could build one thing and share it freely, it would be $BUILD using Python. I believe that when developers share code openly, innovation grows faster and knowledge becomes accessible to everyone." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Python and open source together empower developers to solve real-world problems efficiently. I am inspired by the global community that contributes to open-source Python projects, and I aim to contribute back." >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "This is my manifesto. Written on $DATE. Signed by $USERNAME." >> "$OUTPUT"
echo "===================================================" >> "$OUTPUT"

# --- Display output ---
echo ""
echo "Your manifesto has been generated and saved."
echo ""
echo "--- BEGIN MANIFESTO ---"
cat "$OUTPUT"
echo "--- END MANIFESTO ---"
echo ""
echo "Saved to: $(pwd)/$OUTPUT"
echo ""
