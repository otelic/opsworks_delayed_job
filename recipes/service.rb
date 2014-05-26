service "monit" do
  supports :status => false, :restart => true, :reload => true
  action :nothing
end


node[:deploy].each do |application, deploy|
  
  # Overwrite the unicorn restart command declared elsewhere
  execute "restart Rails app #{application}" do
    command node[:delayed_job][application][:restart_command]
    action :nothing
  end
  
end
