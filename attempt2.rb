execute "update" do
        command "apt-get update"
end
execute "dependencies" do
        command "apt-get -f install"
end
execute "download" do
        #unless File.file?("~/Nessus/Nessus.deb")
        unless  ::File.file?("~/Nessus/Nessus_")
                cwd ~/Nessus/
                command "wget https://github.com/deadDrifters/EST-Nessus/raw/master/Nessus_ -P ~/Nessus/"
                #command "sudo wget  -O ~/Nessus/ \"http://downloads.nessus.org/nessus3dl.php?file=Nessus""
        end
end
execute "dependencies" do
        command "apt-get -f install"
end
execute "install" do
        unless  ::File.file?("~/Nessus/Nessus_")
                command "dpkg -i ~/Nessus/Nessus_; apt-get -f install"
                action :run
        end
end
execute "install-configure" do
        unless  ::File.file?("~/Nessus/Nessus_")
                command "apt-get install -f"
        end
end
execute "Disable auto-start" do
        unless  ::File.file?("~/Nessus/Nessus_")
                command "update-rc.d nessusd disable"
        end
end
execute "Start" do
        command "service nessusd start"
end
execute "Stop" do
	command "service nessusd stop"
end
