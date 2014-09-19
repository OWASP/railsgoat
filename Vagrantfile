VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "web" do |web|
    web.vm.provider "docker" do |d|
      config.vm.box = "hashicorp/precise64"
      d.image = "mccabe615/railsgoat"
      d.name = "web"
      d.ports = ["3000:3000"]
      d.vagrant_vagrantfile = "./Vagrantfile.proxy"
    end
  end

end
