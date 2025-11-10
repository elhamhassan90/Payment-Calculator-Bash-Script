#!/bin/bash

# --------------------------
# calculatePayment.sh
# --------------------------
# Script to sum product prices from one or more files
# and calculate the change or remaining balance.
# --------------------------

# Function to print usage
print_usage() {
    echo "Usage : calculatePayment.sh <valid_file_name> [More_Files] ... <money>"
}

# --------------------------
# Step 1: Check number of parameters
# --------------------------
if [ $# -lt 2 ]; then
    echo "Number of parameters received : $# " >&2
    print_usage
    exit 1
fi

# --------------------------
# Step 2: Validate last parameter is a positive real number
# --------------------------
last_param=${!#}

if ! [[ $last_param =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Not a valid number : $last_param" >&2
    print_usage
    exit 1
fi

# --------------------------
# Step 3: Check that all file paths before last parameter are valid
# --------------------------
valid_files=()
invalid_found=false

for ((i=1; i<$#; i++)); do
    file="${!i}"
    if [ -f "$file" ]; then
        valid_files+=("$file")
    else
        echo "File does not exist : $file" >&2
        invalid_found=true
    fi
done

if [ "$invalid_found" = true ]; then
    echo "" >&2
    print_usage
    exit 1
fi

# --------------------------
# Step 4: Sum all numbers from all valid files
# --------------------------
total_sum=0

for file in "${valid_files[@]}"; do
    # Extract numbers (integer or decimal) from each line
    while read -r line; do
        num=$(echo "$line" | grep -oE '[0-9]+(\.[0-9]+)?')
        if [ ! -z "$num" ]; then
            total_sum=$(echo "$total_sum + $num" | bc)
        fi
    done < "$file"
done

# --------------------------
# Step 5: Round total_sum to 2 decimal places
# --------------------------
# Use printf to round correctly
total_sum=$(printf "%.2f" "$total_sum")

echo "Total purchase price : $total_sum"

# --------------------------
# Step 6: Compare with paid amount
# --------------------------
paid_amount=$(printf "%.2f" "$last_param")

# Use bc for comparison
diff=$(echo "$paid_amount - $total_sum" | bc)

# Get absolute difference for display
abs_diff=$(echo "$diff" | awk '{if ($1<0) $1*=-1; print $1}')

# Round to 2 decimals
abs_diff=$(printf "%.2f" "$abs_diff")

# Print result based on comparison
comp=$(echo "$diff > 0" | bc)
equal=$(echo "$diff == 0" | bc)

if [ "$equal" -eq 1 ]; then
    echo "Exact payment"
elif [ "$comp" -eq 1 ]; then
    echo "Your change is $abs_diff shekel"
else
    echo "You need to add $abs_diff shekel to pay the bill"
fi
