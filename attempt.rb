execute "download" do
	unless File.file?("~/Nessus")
		cwd ~/Nessus/
		command "sudo wget https://github.com/deadDrifters/EST-Nessus/raw/master/Nessus_ -P ~/Nessus/"
	end
end 
execute "install" do
	unless File.file?("~/Nessus")
		command "sudo dpkg -i ~/Nessus/Nessus_"
	end
end
execute "install-configure" do
	unless File.file?("~/Nessus")
		command "sudo apt-get install -f"
	end
end
