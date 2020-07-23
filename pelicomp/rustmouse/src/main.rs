use enigo::{Enigo, MouseButton, MouseControllable};
use std::thread;
use std::time::Duration;
use serialport::posix::TTYPort;

// script to control mouse events for pelicomputer

/* DEPENDENCIES
- xdotool
- pkg-config
- libudev
 */
requires xdotool installed on system

fn main() {
    /* EXAMPLE ENIGO CODE
    let wait_time = Duration::from_secs(2);
    let mut enigo = Enigo::new();
    
    // println!("Hello, world!");

    thread::sleep(wait_time);

    enigo.mouse_move_to(500, 200);
    thread::sleep(wait_time);

    enigo.mouse_down(MouseButton::Left);
    thread::sleep(wait_time);

    enigo.mouse_move_relative(100, 100);
    enigo.mouse_up(MouseButton::Left);
    thread::sleep(wait_time);

    enigo.mouse_scroll_y(-2);
    thread::sleep(wait_time);
    enigo.mouse_scroll_y(2);
    thread::sleep(wait_time);
     */

    
    /* EXAMPLE SERIAL CODE */

    // open port - 9600 baud is the default
    let port = serialport::new("/dev/ttyUSB0")
        .timeout(Duration::from_millis(10))
        .open().expect("Failed to open port");

    // read from port
    let mut serial_buf: Vec<u8> = vec![0; 32];
    port.read(serial_buf.as_mut_slice()).expect("Found no data!");
}
