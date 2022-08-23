use clap::{Parser, Subcommand};

/// A helper utility for libvirt and virt-manager
#[derive(Parser)]
#[clap(author, version, about)]
pub struct Cli {
    #[clap(subcommand)]
    pub command: Commands,
}

#[derive(Subcommand)]
pub enum Commands {
    /// Create a new VM
    New {
        /// Path to ISO file
        iso_file: String,
    },
    /// List all VMs
    #[clap(alias = "l", alias = "ls")]
    List,
    /// Open an ISO with qemu-kvm
    Live {
        /// Path to ISO file
        iso_file: String,
    },
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
