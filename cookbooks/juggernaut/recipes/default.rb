#
# Cookbook Name:: juggernaut
# Recipe:: default
#
# Install and start Juggernaut server
#
# IMPORTANT: This has to run AFTER node.js is installed
# /home/deploy/bin/juggernaut
# juggernaut --port 8080

if node[:name] == 'chat' 
  install_dir = "/home/deploy/bin"

  ey_cloud_report "juggernaut" do
    message "Setting up juggernaut server"
  end

  execute "npm install juggernaut" do
    command "npm install -g juggernaut"
    not_if { FileTest.exists?("#{install_dir}/juggernaut") }
  end

  execute "start juggernaut daemon" do
    #command "/sbin/start-stop-daemon --start --background --exec #{install_dir}/juggernaut --chuid root:root"
    #command "screen -S juggernaut"
    #command "#{install_dir}/juggernaut --port 8080"
    command "screen -t juggernaut bash -c '#{install_dir}/juggernaut --port 8080'"
# not_if { FileTest.exists?("#{install_dir}/juggernaut") }
  end

end
