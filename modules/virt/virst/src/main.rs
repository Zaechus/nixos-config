use std::{
    io::{self, Write},
    process::Command,
};

use clap::{Parser, Subcommand};

/// A helper utility for libvirt and virt-manager
#[derive(Parser)]
#[clap(author, version, about)]
struct Cli {
    #[clap(subcommand)]
    command: Commands,
}

#[derive(Subcommand)]
enum Commands {
    /// Create a new VM
    New {
        /// Path to ISO file
        iso_file: String,
    },
    /// List all VMs
    List,
    /// Launch a VM
    Start {
        /// Name of VM
        domain: String,
    },
    /// Shutdown a running VM
    Stop {
        /// Name of VM
        domain: String,
    },
    /// Immediately stop a running VM
    Destroy {
        /// Name of VM
        domain: String,
    },
    /// Delete a VM
    Delete {
        /// Name of VM
        domain: String,
    },
}

fn main() -> io::Result<()> {
    match Cli::parse().command {
        Commands::New { iso_file } => {
            let name = prompt("Name: ");
            let cores = prompt_or_default("Cores: ", "8");
            let mem = prompt_or_default("Memory (MiB): ", "7444");
            let size = format!("size={}", prompt_or_default("Disk size (GiB): ", "20"));
            println!(
                "{}",
                get_output(
                    "virt-install",
                    &[
                        "--vcpus", &cores, "--memory", &mem, "--disk", &size, "--name", &name,
                        "--boot", "loader=/etc/ovmf/OVMF_CODE.fd,loader.readonly=yes,loader.type=pflash,nvram.template=/etc/ovmf/OVMF_VARS.fd,loader_secure=no",
                        "--cdrom", &iso_file,
                    ],
                )?
            );
        }
        Commands::List => println!("{}", get_output("virsh", &["list", "--all"])?),
        Commands::Start { domain } => {
            println!("{}", get_output("virsh", &["start", &domain])?);
            println!("{}", get_output("virt-viewer", &[&domain])?);
        }
        Commands::Stop { domain } => {
            println!("{}", get_output("virsh", &["shutdown", &domain])?)
        }
        Commands::Destroy { domain } => {
            println!("{}", get_output("virsh", &["destroy", &domain])?)
        }
        Commands::Delete { domain } => {
            println!("{}", get_output("virsh", &["destroy", &domain])?);
            println!(
                "{}",
                get_output(
                    "virsh",
                    &["undefine", &domain, "--remove-all-storage", "--keep-nvram"]
                )?
            )
        }
    };

    Ok(())
}

fn prompt(prompt: &str) -> String {
    loop {
        let input = read_line(&format!("{}", prompt));

        if !input.is_empty() && input.len() < 64 {
            return input;
        }
    }
}

fn prompt_or_default(prompt: &str, default: &str) -> String {
    let input = read_line(&format!("{}", prompt));

    if !input.is_empty() && input.len() < 64 {
        input
    } else {
        default.to_owned()
    }
}

fn read_line(prompt: &str) -> String {
    print!("{}", prompt);
    io::stdout().flush().expect("Error flushing stdout");

    let mut input = String::new();
    io::stdin()
        .read_line(&mut input)
        .expect("Error reading stdin");
    input.trim().to_owned()
}

fn get_output(command: &str, args: &[&str]) -> io::Result<String> {
    if let Ok(s) = String::from_utf8(Command::new(command).args(args).output()?.stdout) {
        Ok(s.trim().to_owned())
    } else {
        Err(io::Error::from(io::ErrorKind::InvalidData))
    }
}
