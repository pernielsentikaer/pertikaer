#!/bin/bash

# Simple test script for pertikaer repository
# Tests basic repository structure and content

echo "Running tests for pertikaer repository..."
echo "========================================"

# Test counter
tests_run=0
tests_passed=0

# Helper function to run a test
run_test() {
    local test_name="$1"
    local test_command="$2"
    
    tests_run=$((tests_run + 1))
    echo -n "Test $tests_run: $test_name... "
    
    if eval "$test_command"; then
        echo "PASS"
        tests_passed=$((tests_passed + 1))
    else
        echo "FAIL"
    fi
}

# Test 1: Check if README.md exists
run_test "README.md exists" "[ -f README.md ]"

# Test 2: Check if README.md has content
run_test "README.md has content" "[ -s README.md ]"

# Test 3: Check if README.md contains project name
run_test "README.md contains project name" "grep -q 'pertikaer' README.md"

# Test 4: Check if files directory exists
run_test "files directory exists" "[ -d files ]"

# Test 5: Check if images directory exists
run_test "images directory exists" "[ -d images ]"

# Test 6: Check if images directory contains files
run_test "images directory contains files" "[ \$(ls -1 images/ | wc -l) -gt 0 ]"

# Summary
echo "========================================"
echo "Tests completed: $tests_run"
echo "Tests passed: $tests_passed"
echo "Tests failed: $((tests_run - tests_passed))"

if [ $tests_passed -eq $tests_run ]; then
    echo "All tests passed! ✓"
    exit 0
else
    echo "Some tests failed! ✗"
    exit 1
fi