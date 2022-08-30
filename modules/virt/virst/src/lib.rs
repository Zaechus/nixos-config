use std::{
    io::{self, Write},
    process::Command,
};

pub mod cli;
pub use cli::{Cli, Commands};

pub fn vm_already_exists(iso_file: &str) -> bool {
    get_output("virsh", &["list", "--all"])
        .unwrap_or_default()
        .lines()
        .skip(2)
        .map(|l| l.split_whitespace().nth(1).unwrap_or_default())
        .collect::<Vec<&str>>()
        .contains(&iso_file)
}

pub fn prompt(prompt: &str) -> String {
    loop {
        let input = read_line(&format!("{}", prompt));

        if !input.is_empty() && input.len() < 64 {
            return input;
        }
    }
}

pub fn prompt_or_default(prompt: &str, default: &str) -> String {
    let input = read_line(&format!("{}", prompt));

    if !input.is_empty() && input.len() < 64 {
        input
    } else {
        default.to_owned()
    }
}

pub fn read_line(prompt: &str) -> String {
    print!("{}", prompt);
    io::stdout().flush().expect("Error flushing stdout");

    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Error reading stdin");
    input.trim().to_owned()
}

pub fn get_output(command: &str, args: &[&str]) -> io::Result<String> {
    if let Ok(s) = String::from_utf8(Command::new(command).args(args).output()?.stdout) {
        Ok(s.trim().to_owned())
    } else {
        Err(io::Error::from(io::ErrorKind::InvalidData))
    }
}
