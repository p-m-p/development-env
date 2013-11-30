script 'Run apt-get update' do
  interpreter 'bash'
  user 'root'
  code 'apt-get update'
end

[
  'build-essential',
  'git-core',
  'vim',
  'tmux',
  'nginx-full'
].each do |pkg|
  package pkg do
    action :install
  end
end
