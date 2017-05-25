require "pty"
require "expect"

execute "update" do
        command "apt-get update; sudo dpkg --configure -a"
end
execute "dependencies" do
        command "apt-get -f install"
end
execute "download" do
        #unless File.file?("~/Nessus/Nessus.deb")
	if ::File.file?("~/Nessus/Nessus_/")
                cwd ~/Nessus/
                command "wget https://github.com/deadDrifters/EST-Nessus/raw/master/Nessus_ -P ~/Nessus/"
                #command "sudo wget  -O ~/Nessus/ \"http://downloads.nessus.org/nessus3dl.php?file=Nessus""
        end
end
execute "dependencies" do
        command "apt-get -f install"
end
execute "install" do
        if  ::File.file?("~/Nessus/Nessus_/")
                command "dpkg -i ~/Nessus/Nessus_; apt-get -f install"
                action :run
        end
end
execute "install-configure" do
        if  ::File.file?("~/Nessus/Nessus_/")
                command "apt-get install -f"
        end
end
execute "Disable auto-start" do
        if  !::File.file?("~/Nessus/Nessus_")
                command "update-rc.d nessusd disable"
        end
end
execute "Start" do
        command "service nessusd start"
end
execute "nessus_Update" do
	command "sudo ../../../opt/nessus/sbin/nessuscli update; sudo service nessusd stop; sudo ../../../opt/nessus/sbin/nessuscli update"
end
#execute "add_user" do
#	command "sudo ../../../opt/nessus/sbin/nessuscli adduser Scanner"
#	echo "password\n"
#	echo "y\n"
#end
PTY.spawn("sudo ../../../opt/nessus/sbin/nessuscli adduser Scanner") do |reader, writer|
	reader.expect("Login password: ", 5)
	writer.puts("password")
	reader.expect("y/n")
	writer.puts("y")
end

execute "challenge_code" do
	command "sudo ../../../opt/nessus/sbin/nessuscli fetch --challenge"
end

execute "register" do
	command "sudo ../../../opt/nessus/sbin./nessuscli fetch --register-offline ~/Git/nessus.license"
end
#execute "Stop" do
#	command "service nessusd stop"
#end
