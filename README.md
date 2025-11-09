# 💰 Payment Calculator Bash Script

## 🧾 Project Overview
This Bash project was created to **automatically calculate the total payment** from one or more text files that contain product prices written in mixed formats (for example, `$1.49/can`, `10.99 /lb`, `2.5`, etc.).

It also compares the **total purchase amount** with the **money provided by the customer**, then prints either:
- The change to be returned, or  
- How much more money is needed.

This script is designed for flexible testing and can handle:
- Lines that contain numbers with different formats (`$, /, :, text mixed with numbers`)
- Empty lines or lines with no numbers
- Multiple files passed together
- Various currency values

---

## ⚙️ Requirements

Before running the script, make sure that:
1. You are using a **Linux** or **macOS** terminal (or WSL/Git Bash on Windows).  
2. You have **Bash** installed (default in most systems).  
3. The script has execution permission. You can grant it by running:

```bash
chmod +x calculatePayment.sh
