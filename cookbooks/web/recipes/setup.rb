template "/home/#{node[:user]}/.ssh/config" do
  source 'sshconfig.erb'
  owner node[:user]
  group node[:user]
  mode 0600
end

node[:packages].each do |pkg|
  package pkg do
    action :install
  end
end

git "/home/#{node[:user]}/.vim" do
  repository 'git@github.com:tpope/vim-pathogen.git'
  revision 'HEAD'
  action :sync
  remote 'upstream'
  user node[:user]
  group node[:user]
end

directory "/home/#{node[:user]}/sites" do
  action :create
  user node[:user]
  group node[:user]
end
