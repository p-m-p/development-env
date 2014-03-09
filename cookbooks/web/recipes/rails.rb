[
  'libsqlite3-dev'
].each do |pkg|
  package pkg do
    action :install
  end
end

gem_package 'rails' do
  gem_binary 'gem'
end
