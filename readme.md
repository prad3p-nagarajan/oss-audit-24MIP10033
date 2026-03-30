# oss-audit — The Open Source Audit (Git)

**Course:** Open Source Software (OSS NGMC)  
**Student:** PRADEEP N 
**Registration Number:** *24MIP10033*  
**Chosen Software:** Python — Programming Language 
**License of Chosen Software:** Python Software Foundation License (PSFL)

---

## About This Project

This project is part of my Open Source Software course and focuses on understanding how open-source tools actually work in real life. Instead of just studying theory, I’ve used simple shell scripts to explore and analyze systems practically.

The main software I chose is Python, created by Guido van Rossum. Python is one of the most popular open-source languages today, and this project looks at its background, licensing, and role in the open-source world.

Along with that, the scripts in this repository help in checking system details, analyzing logs, and understanding how Linux systems behave.

---

## Repository Contents


| `scripts/system_identity.sh` | Script 1 — System Identity Report |
| `scripts/foss_inspector.sh` | Script 2 — FOSS Package Inspector |
| `scripts/disk_auditor.sh` | Script 3 — Disk and Permission Auditor |
| `scripts/log_analyzer.sh` | Script 4 — Log File Analyzer |
| `scripts/manifesto_generator.sh` | Script 5 — Open Source Manifesto Generator |
| `README.md` | This file |

---

## Script Descriptions

### Script 1 — System Identity Report (`system_identity.sh`)
Displays a welcome-screen-style identity card showing the Linux distribution, kernel version, current user, home directory, system uptime, date/time, and the open-source license covering the OS.

**Concepts:** Variables, `echo`, command substitution `$()`, output formatting, `grep`, `cut`.

### Script 2 — FOSS Package Inspector (`foss_inspector.sh`)
Checks whether a specified package (default: `git`) is installed, shows its version and details, and prints a philosophy note about the package using a `case` statement.

**Concepts:** `if-then-else`, `case` statement, `dpkg`/`rpm`, pipe with `grep`, command-line arguments.

### Script 3 — Disk and Permission Auditor (`disk_auditor.sh`)
Audits important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`) for permissions, ownership, and disk usage. Also checks Git's configuration directories.

**Concepts:** `for` loop, arrays, `df`, `du`, `ls -ld`, `awk`, `cut`, `printf`.

### Script 4 — Log File Analyzer (`log_analyzer.sh`)
Reads a log file line by line, counts keyword occurrences (e.g., "error"), and prints a summary with the last 5 matching lines.

**Concepts:** `while read` loop, `if-then`, counter variables, `$1`/`$2` arguments, `grep`, `tail`.

### Script 5 — Open Source Manifesto Generator (`manifesto_generator.sh`)
Asks the user three questions interactively and generates a personalised open-source philosophy manifesto saved to a `.txt` file.

**Concepts:** `read`, string concatenation, file redirection (`>`, `>>`), `date`, aliases (explained in comments).

---

## How to Run the Scripts

### Prerequisites
- A Linux system (Ubuntu recommended) — either native, a VM, or WSL on Windows.
   Linux system (Ubuntu recommended)
   bash shell
   Python installed (python3)

### Step-by-Step Instructions

1. **Clone this repository:**
   ```bash
   git clone https://github.com/<your-username>/oss-audit-<rollnumber>.git
   cd oss-audit-<rollnumber>
   ```

2. **Make all scripts executable:**
   ```bash
   chmod +x scripts/*.sh
   ```

3. **Run Script 1 — System Identity Report:**
   ```bash
   ./scripts/system_identity.sh
   ```
   No arguments needed. Displays system information immediately.

4. **Run Script 2 — FOSS Package Inspector:**
   ```bash
   # Inspect git (default)
   ./scripts/foss_inspector.sh

   # Inspect a different package
   ./scripts/foss_inspector.sh apache2
   ./scripts/foss_inspector.sh firefox
   ```

5. **Run Script 3 — Disk and Permission Auditor:**
   ```bash
   ./scripts/disk_auditor.sh
   ```
   No arguments needed. May require `sudo` for full access to some directories:
   ```bash
   sudo ./scripts/disk_auditor.sh
   ```

6. **Run Script 4 — Log File Analyzer:**
   ```bash
   # Analyze syslog for "error" (default keyword)
   ./scripts/log_analyzer.sh /var/log/syslog

   # Analyze with a custom keyword
   ./scripts/log_analyzer.sh /var/log/syslog warning

   # Analyze auth log
   sudo ./scripts/log_analyzer.sh /var/log/auth.log "failed"
   ```

7. **Run Script 5 — Open Source Manifesto Generator:**
   ```bash
   ./scripts/manifesto_generator.sh
   ```
   Follow the interactive prompts. Your manifesto will be saved as `manifesto_<username>_<timestamp>.txt`.

---

## Dependencies

Dependency	Required For	Install Command
bash	All scripts	Pre-installed on Linux
python3	Script 2 (default package)	sudo apt install python3
coreutils	date, whoami, du, cut	Pre-installed on Linux
grep	Scripts 2, 4	Pre-installed on Linux
gawk	Script 3 (awk)	Pre-installed on most Linux distributions
---

## License

The scripts in this repository are released for educational purposes as part of the VIT Open Source Software course.
