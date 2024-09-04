# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # Use a Windows 11 box
  config.vm.box = "gusztavvargadr/windows-11"

  #region Network/Port Configuration (Optional)

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessible to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  #endregion

  # Set provider to Hyper-V
  config.vm.provider "hyperv" do |h|
    h.memory = 8192        # Set memory to 8GB
    h.cpus = 4             # Use 4 CPUs
    h.enable_virtualization_extensions = true
  end

  # Provisioning script to install development tools using Chocolatey
  config.vm.provision "shell", privileged: true, inline: <<-SHELL
    # Set execution policy for PowerShell scripts
    Set-ExecutionPolicy Bypass -Scope Process -Force

    # Download the PowerShell script from GitHub
    $scriptUrl = "https://raw.githubusercontent.com/brandonpowers/dev/main/install-virtual.ps1"
    $scriptPath = "C:\\vagrant\\install-virtual.ps1"

    # Download the script using Invoke-WebRequest
    Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

    # Run the downloaded script
    & $scriptPath
  SHELL

  # Set the boot timeout for Windows to ensure it boots properly
  config.vm.boot_timeout = 1200
end
