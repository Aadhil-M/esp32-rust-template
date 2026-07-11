# ESP32-S3 Rust Development Template

A production-ready, batteries-included Rust template for ESP32-S3 projects.

**Stop fighting ESP-IDF configuration. Start shipping firmware.**

## ✨ Features

- ✅ **Out-of-the-box examples** — GPIO, WiFi, HTTP client, UART
- ✅ **Zero-config Docker dev environment** — No Rust toolchain installation needed
- ✅ **CI/CD pipeline** — Automated builds on every push
- ✅ **Real hardware examples** — Not just theory; these actually work
- ✅ **Comprehensive docs** — Setup, architecture, troubleshooting
- ✅ **Production-ready** — Follows Rust embedded best practices
- ✅ **MIT/Apache-2.0 licensed** — Use commercially without worrying

## 🚀 Quick Start

### Option 1: Docker (Recommended - No Installation)

```bash
# Clone the repo
git clone https://github.com/yourusername/esp32-rust-template
cd esp32-rust-template

# Start dev container
docker-compose run --rm esp-dev bash

# Inside the container, build an example
cd examples/01-hello-world
cargo build --release

# Flash to ESP32-S3 (adjust /dev/ttyUSB0 if needed)
cargo espflash flash --release /dev/ttyUSB0
```

### Option 2: Native Installation

1. **Install Rust nightly:**
   ```bash
   rustup install nightly
   rustup default nightly
   ```

2. **Install ESP tools:**
   ```bash
   cargo install espup cargo-espflash
   espup install-default
   ```

3. **Build an example:**
   ```bash
   cd examples/01-hello-world
   cargo build --release
   cargo espflash flash --release /dev/ttyUSB0
   ```

See [Setup Guide](docs/setup.md) for detailed instructions.

## 📚 Examples

| Example | Description | Difficulty |
|---------|-------------|-----------|
| [01-hello-world](examples/01-hello-world) | GPIO LED blink with serial output | ⭐ Beginner |
| [02-wifi](examples/02-wifi) | Connect to WiFi and display IP | ⭐⭐ Intermediate |
| [03-http-client](examples/03-http-client) | Make HTTP GET requests to APIs | ⭐⭐ Intermediate |

## 📖 Documentation

- **[Setup Guide](docs/setup.md)** — Installation, configuration, board selection
- **[Architecture](docs/architecture.md)** — Project structure, design decisions
- **[Troubleshooting](docs/troubleshooting.md)** — Common issues and solutions

## 🛠️ Project Structure

```
esp32-rust-template/
├── examples/              # Runnable examples for each feature
│   ├── 01-hello-world/   # GPIO and serial output
│   ├── 02-wifi/          # WiFi connectivity
│   └── 03-http-client/   # HTTP requests
├── src/                  # Shared utilities (optional)
├── docs/                 # Documentation
├── Dockerfile            # Docker dev environment
├── Cargo.toml            # Root workspace config
└── README.md             # This file
```

## ⚙️ Hardware Requirements

- **ESP32-S3 Development Board** — Tested with ESP32-S3-DevKitC-1
- **USB Cable** — For flashing and serial communication
- **GPIO2 LED** (optional) — For the hello-world example

**Board Compatibility:**
- ✅ ESP32-S3-DevKitC-1
- ✅ ESP32-S3-USB-OTG
- ⚠️ Other ESP32-S3 boards may need pin adjustments

## 🔧 Configuration

### Change the LED pin (hello-world example)

Edit `examples/01-hello-world/src/main.rs`:
```rust
let mut led = PinDriver::output(pins.gpio2).unwrap();  // Change gpio2 to your pin
```

### WiFi credentials (wifi example)

Edit `examples/02-wifi/src/main.rs`:
```rust
const SSID: &str = "YOUR_SSID";
const PASS: &str = "YOUR_PASSWORD";
```

## 📊 Build & Test

**Build all examples:**
```bash
cargo build --release
```

**Run checks:**
```bash
cargo clippy --all-targets
cargo fmt --check
```

**Flash to device:**
```bash
cd examples/01-hello-world
cargo espflash flash --release /dev/ttyUSB0 --monitor
```

The `--monitor` flag opens a serial terminal to see output.

## 🤝 Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md)

**Ideas for new examples:**
- Timer/PWM LED dimming
- ADC sensor reading
- SPI/I2C communication
- MQTT client
- BLE Bluetooth
- SD card access

## 📜 License

Licensed under either of:
- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

## 🎓 Learning Resources

- [The Embedded Rust Book](https://docs.rust-embedded.org/book/)
- [ESP-IDF HAL Docs](https://docs.rs/esp-idf-hal)
- [ESP32-S3 Datasheet](https://www.espressif.com/sites/default/files/documentation/esp32-s3_datasheet_en.pdf)

## ⭐ Show Your Support

If this template helped you, please star the repo! It helps others discover it.

---

**Questions?** Open an issue or check [Troubleshooting](docs/troubleshooting.md).
