#!/bin/bash

response=$(curl -s http://localhost:5000)
expected="Hello from Flask & Jenkins!"

if [[ "$response" == "$expected" ]]; then
    echo "✅ Test passed"
    exit 0
else
    echo "❌ Test failed: got '$response'"
    exit 1
fi
