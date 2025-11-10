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

```
bash calculatePayment.sh <file1> [<file2> ...] <money>
```

** You can pass one or multiple text files as input.
** The last argument must be the amount of money the customer pays.


## flowchart TD
---
A[Start Script] --> B{Are there at least 2 arguments?}
B -- No --> B1[Show usage & Exit]
B -- Yes --> C[Get last argument as 'money']

C --> D{Is 'money' a valid positive number?}
D -- No --> D1[Show error & Exit]
D -- Yes --> E[Validate all files before 'money']

E --> F{Do all files exist?}
F -- No --> F1[Show missing file error & Exit]
F -- Yes --> G[Initialize total_sum = 0]

G --> H[For each file → Read line by line]
H --> I[Extract numbers using regex]
I --> J[Add all numbers to total_sum using bc]

J --> K[Round total_sum to 2 decimals]
K --> L[Print "Total purchase price : total_sum"]

L --> M[Compare total_sum with paid money]
M --> N{Equal?}
N -- Yes --> N1[Print "Exact payment"]
N -- No --> O{Paid > total?}
O -- Yes --> O1[Print "Your change is X shekel"]
O -- No --> O2[Print "You need to add X shekel"]

O1 --> P[End]
O2 --> P[End]
N1 --> P[End]
---















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


## 📂 Files Included
| File Name                         | Description                                          |
| --------------------------------- | ---------------------------------------------------- |
| `calculatePayment.sh`             | Main Bash script                                     |
| `He_wants_to_return_the_bags.txt` | Example input file with prices                       |
| `grocery.txt`                     | Example input file with multiple product prices      |
| `info.txt`                        | Information about the file format and testing rules  |
| `no_numbers.txt`                  | Test file with no numbers (to verify error handling) |


## 🧠 Testing Notes

- The script is flexible enough to handle unknown files (not just the given ones).

- Each file may contain at most one number per line.

- Empty or invalid lines are automatically ignored.

- Additional hidden test files can be used without code modification.

## 🚀 Expected Output Summary
| Input File(s)                                   | Money Given | Expected Total | Result         |
| ----------------------------------------------- | ----------- | -------------- | -------------- |
| `He_wants_to_return_the_bags.txt`               | 100         | 19.20          | Change: 80.80  |
| `grocery.txt`                                   | 50          | 28.21          | Change: 21.79  |
| `no_numbers.txt`                                | 100         | 0.00           | Change: 100.00 |
| `grocery.txt + He_wants_to_return_the_bags.txt` | 60          | 47.41          | Change: 12.59  |



---

## 👨‍💻 Author Information

- **👤 Name:** Elham Hasan Gouda Tammam Kedwany  
- **🔗 LinkedIn:** [linkedin.com/in/elham-hasan-6b029433a](https://www.linkedin.com/in/elham-hasan-6b029433a)  
- **💻 GitHub:** [github.com/elhamhassan90](https://github.com/elhamhassan90)

---






