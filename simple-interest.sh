#!/bin/bash

# simple-interest.sh - A script to calculate simple interest

# Function to display usage
usage() {
    echo "Usage: $0 principal rate time"
    echo "  principal : The principal amount (initial investment)"
    echo "  rate      : The annual interest rate (in percentage)"
    echo "  time      : The time period (in years)"
    exit 1
}

# Check if the correct number of arguments are provided
if [ "$#" -ne 3 ]; then
    usage
fi

# Read input arguments
principal=$1
rate=$2
time=$3

# Validate input: check if all arguments are numbers
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: All arguments must be numeric values."
    usage
fi

# Calculate simple interest
simple_interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

# Display the result
echo "Principal Amount: $principal"
echo "Annual Interest Rate: $rate%"
echo "Time Period: $time years"
echo "Simple Interest: $simple_interest"
