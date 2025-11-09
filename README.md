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
```
## ▶️ How to Run

The syntax to run the script is

```./calculatePayment.sh <file1> [<file2> ...] <money>
```

** You can pass one or multiple text files as input.
** The last argument must be the amount of money the customer pays.

## 💡Examples
#### Example 1 — Single file
```
bash calculatePayment.sh He_wants_to_return_the_bags.txt 100
```

#### Output:
Total purchase price : 19.20
Your change is 80.80 shekel


#### Example 2 — Another file
```
bash calculatePayment.sh grocery.txt 50
```

#### Output:
Total purchase price : 28.21
Your change is 21.79 shekel


#### Example 3 — File without numbers
```
bash calculatePayment.sh no_numbers.txt 100
```

#### Output:
Total purchase price : 0.00
Your change is 100.00 shekel


#### Example 4 — Multiple files together
```
bash calculatePayment.sh grocery.txt He_wants_to_return_the_bags.txt 60
```

#### Output:
Total purchase price : 47.41
Your change is 12.59 shekel

## 🔍 How It Works (Simplified Explanation)

1. The script takes all input files and reads them line by line.

2. Each line is scanned using regular expressions to extract any numbers (integers or decimals).

3. All numbers found in all files are summed together.

4. The total is compared to the money amount provided as the last argument.

5. Depending on the comparison, the script prints:

- The total price

- The change to be given (if enough money)

- Or the amount missing (if not enough)











