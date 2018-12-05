Vagrant.configure("2") do |config|
    (1..2).each do |id|
       srv_name = ( "srv" + id.to_s ).to_sym
        config.vm.define srv_name do |srv|
            srv.vm.box = "qarham/CentOS7.5-350GB"
            srv.vm.box_version = "1.0"
            srv.vm.hostname = "srv#{id}"
            srv.vm.network "public_network", bridge: "br1", ip:"192.168.100.#{id+20}"
            srv.ssh.insert_key = true
            srv.vm.provision "shell", path: "scripts/ntp.sh"
	    srv.vm.provision "shell", path: "scripts/install_contrail#{id}.sh"
        config.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "32768", "--cpus", "4"]
        end
      end
    end
end
