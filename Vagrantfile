VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] ||= 'docker'
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "railsgoat" do |rg|
    rg.vm.provider "docker" do |d|
      d.image = "mccabe615/railsgoat"
      d.name = "railsgoat"
      d.ports = ["3000:3000"]
      d.vagrant_vagrantfile = "./Vagrantfile.proxy"
    end
  end

end
