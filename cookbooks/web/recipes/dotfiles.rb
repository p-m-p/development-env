directory node[:dotfiles][:path] do
  action :create
  user node[:user]
  group node[:user]
end

git node[:dotfiles][:path] do
  repository node[:dotfiles][:repo]
  revision 'HEAD'
  action :sync
  remote 'origin'
  user node[:user]
  group node[:user]
end

execute 'Install Configs' do
  action :run
  user node[:user]
  group node[:user]
  cwd node[:dotfiles][:path]
  env 'HOME_DIR' => "/home/#{node[:user]}"
  command './install.sh'
end
