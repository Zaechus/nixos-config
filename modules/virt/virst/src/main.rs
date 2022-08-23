use std::{fs, io};

use clap::Parser;

use virst::*;

fn main() -> io::Result<()> {
    match Cli::parse().command {
        Commands::New { iso_file } => {
            let name = prompt("Name: ");
            let cores = prompt_or_default("Cores: ", "4");
            let mem = prompt_or_default("Memory (MiB): ", "4096");
            let size = format!("size={}", prompt_or_default("Disk size (GiB): ", "20"));
            println!(
                "{}",
                get_output(
                    "virt-install",
                    &[
                        "--vcpus", &cores, "--memory", &mem, "--disk", &size, "--name", &name,
                        "--boot", "loader=/etc/ovmf/OVMF_CODE.fd,loader.readonly=yes,loader.type=pflash,nvram.template=/etc/ovmf/OVMF_VARS.fd,loader_secure=no",
                        "--osinfo", "detect=on,name=generic", "--cdrom", &iso_file,
                    ],
                )?
            );
        }
        Commands::List => println!("{}", get_output("virsh", &["list", "--all"])?),
        Commands::Live { iso_file } => {
            fs::copy("/etc/ovmf/OVMF_VARS.fd", "/tmp/OVMF_VARS.fd")?;
            let mut perms = fs::metadata("/tmp/OVMF_VARS.fd")?.permissions();
            perms.set_readonly(false);
            fs::set_permissions("/tmp/OVMF_VARS.fd", perms)?;
            println!(
                "{}",
                get_output(
                    "qemu-kvm",
                    &[
                        "-cpu",
                        "host",
                        "-smp",
                        "4",
                        "-m",
                        "4096",
                        "-vga",
                        "virtio",
                        "-full-screen",
                        "-drive",
                        "if=pflash,format=raw,unit=0,readonly=on,file=/etc/ovmf/OVMF_CODE.fd",
                        "-drive",
                        "if=pflash,format=raw,unit=1,file=/tmp/OVMF_VARS.fd",
                        "-cdrom",
                        &iso_file
                    ]
                )?
            );
            fs::remove_file("/tmp/OVMF_VARS.fd")?;
        }
        Commands::Start { domain } => {
            println!("{}", get_output("virsh", &["start", &domain])?);
            println!("{}", get_output("virt-viewer", &["-f", &domain])?);
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
