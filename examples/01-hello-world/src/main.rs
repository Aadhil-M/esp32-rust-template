use esp_idf_hal::gpio::*;
use esp_idf_hal::prelude::*;
use esp_println::println;

fn main() {
    esp_idf_sys::link_patches();

    let peripherals = Peripherals::take().unwrap();
    let pins = peripherals.pins;
    
    // GPIO 2 is built-in LED on ESP32-S3
    let mut led = PinDriver::output(pins.gpio2).unwrap();

    println!("LED Blink starting...");

    loop {
        led.set_high().unwrap();
        println!("LED ON");
        std::thread::sleep(std::time::Duration::from_millis(1000));

        led.set_low().unwrap();
        println!("LED OFF");
        std::thread::sleep(std::time::Duration::from_millis(1000));
    }
}
