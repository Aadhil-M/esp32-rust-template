#!/bin/bash

# Flash script for ESP32 Rust Template

set -e

PORT="${1:-/dev/ttyUSB0}"
EXAMPLE="${2:-01-hello-world}"
MODE="${3:-release}"

if [ -z "$PORT" ]; then
    echo "Usage: $0 <port> [example] [mode]"
    echo "Example: $0 /dev/ttyUSB0 01-hello-world release"
    exit 1
fi

echo "Flashing example: $EXAMPLE"
echo "Port: $PORT"
echo "Mode: $MODE"

# Build first
./scripts/build.sh "$EXAMPLE" "$MODE"

# Flash
if [ "$MODE" = "debug" ]; then
    cargo espflash flash --monitor "$PORT" --example "$EXAMPLE"
else
    cargo espflash flash --monitor "$PORT" --release --example "$EXAMPLE"
fi

echo "✓ Flash complete!"
echo "Monitor opened at $PORT"
