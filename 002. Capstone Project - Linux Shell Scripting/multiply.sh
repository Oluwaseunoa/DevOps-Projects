#!/bin/bash

# Function to display the full multiplication table (1-10)
full_table() {
    local num=$1
    echo "Full multiplication table for $num (1 to 10):"
    for (( i=1; i<=10; i++ )); do
        echo "$num x $i = $((num * i))"
    done
}

# Function to display a partial multiplication table
partial_table() {
    local num=$1
    read -p "Enter the starting range: " start
    read -p "Enter the ending range: " end
    
    # Validate the range
    if [[ $start -gt $end ]]; then
        echo "Error: Starting range cannot be greater than ending range."
        return 1
    fi
    
    echo "Partial multiplication table for $num ($start to $end):"
    for (( i=start; i<=end; i++ )); do
        echo "$num x $i = $((num * i))"
    done
}

# Main script
read -p "Enter a number: " number

# Validate the input is a number
if ! [[ "$number" =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1
fi

echo "Choose an option:"
echo "1. Full multiplication table (1 to 10)"
echo "2. Partial multiplication table (custom range)"
read -p "Enter your choice (1 or 2): " choice

case $choice in
    1)
        full_table "$number"
        ;;
    2)
        partial_table "$number"
        ;;
    *)
        echo "Invalid choice. Please enter 1 or 2."
        exit 1
        ;;
esac

