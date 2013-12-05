package 'python-software-properties' do
  action :install
end

execute 'Add ruby-ng ppa' do
  action :run
  command 'add-apt-repository ppa:brightbox/ruby-ng'
end

script 'Run apt-get update' do
  interpreter 'bash'
  user 'root'
  code 'apt-get update'
end

[
  'ruby1.9.3',
  'ruby-switch'
].each do |pkg|
  package pkg  do
    action :install
  end
end

execute "ruby-switch --set ruby1.9.1" do
  action :run
  not_if "ruby-switch --check | grep -q 'ruby1.9.1'"
end

['bundler', 'rake'].each do |g|
  gem_package g do
    gem_binary 'gem'
  end
end
