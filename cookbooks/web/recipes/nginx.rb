template "/etc/nginx/sites-available/webroot" do
  source 'nginx-webroot.erb'
  owner 'www-data'
  group 'www-data'
end

link "/etc/nginx/sites-enabled/webroot" do
  to "/etc/nginx/sites-available/webroot"
  not_if { File.exists? '/etc/nginx/sites-enabled/webroot' }
end

service 'nginx' do
  action :restart
end
