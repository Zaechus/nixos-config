use std::io;

use clap::Parser;

use virst::*;

fn main() -> io::Result<()> {
    match Cli::parse().command {
        Commands::New { iso_file } => {
            let name = prompt("Name: ")?;
            if vm_already_exists(&name) {
                println!("A VM with that name already exists.");
            } else {
                let cores = prompt_or_default("Cores: ", "4")?;
                let mem = prompt_or_default("Memory (MiB): ", "4096")?;
                let size = format!("size={}", prompt_or_default("Disk size (GiB): ", "20")?);
                let uefi = prompt_or_default("UEFI? (y/N): ", "n")?.to_lowercase();
                let args = [
                    "--vcpus",
                    &cores,
                    "--memory",
                    &mem,
                    "--disk",
                    &size,
                    "--name",
                    &name,
                    "--osinfo",
                    "detect=on,name=generic",
                    "--cdrom",
                    &iso_file,
                ];
                let args = if uefi.starts_with("y") {
                    [args.as_slice(), &["--boot", "loader=/etc/ovmf/OVMF_CODE.fd,loader.readonly=yes,loader.type=pflash,nvram.template=/etc/ovmf/OVMF_VARS.fd,loader_secure=no"]].concat()
                } else {
                    args.to_vec()
                };
                println!("{}", get_output("virt-install", &args)?);
            }
        }
        Commands::List => println!("{}", get_output("virsh", &["list", "--all"])?),
        Commands::Live { iso_file } => {
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
                        "-cdrom",
                        &iso_file
                    ]
                )?
            );
        }
        Commands::View { domain } => {
            println!("{}", get_output("virt-viewer", &["-f", &domain])?);
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
                    &["undefine", &domain, "--nvram", "--remove-all-storage"]
                )?
            )
        }
    };

    Ok(())
}
