[
  'php5-common',
  'php5-cli',
  'php5-fpm'
].each do |pkg|
  package pkg  do
    action :install
  end
end
