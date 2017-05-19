execute "download" do
        #unless File.file?("~/Nessus/Nessus.deb")
        unless  ::File.file?("~/Nessus/Nessus_")
                cwd ~/Nessus/
                command "sudo wget https://github.com/deadDrifters/EST-Nessus/raw/master/Nessus_ -P ~/Nes$
                #command "sudo wget  -O ~/Nessus/ \"http://downloads.nessus.org/nessus3dl.php?file=Nessus$
        end
end
execute "install" do
        unless  ::File.file?("~/Nessus/Nessus_")
                command "sudo dpkg -i ~/Nessus/Nessus_"
                action :run
        end
end
execute "install-configure" do
        unless  ::File.file?("~/Nessus/Nessus_")
                command "sudo apt-get install -f"
        end
end
execute "Disable auto-start" do
        unless  ::File.file?("~/Nessus/Nessus_")
                command "sudo update-rc.d nessusd disable"
        end
end
execute "Start" do
        command "sudo service nessusd start"
end


