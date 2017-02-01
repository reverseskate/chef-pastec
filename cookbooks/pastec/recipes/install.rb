include_recipe 'pleaserun'

deps = %w(libopencv-dev libmicrohttpd-dev libjsoncpp-dev cmake git)

deps.each do |dep|
  package dep
end

user 'pastec' do
  home '/home/pastec'
  manage_home true
  system true
end

group 'pastec' do
  users [ 'pastec' ]
end

ark 'pastec' do
  url 'https://github.com/Visu4link/pastec/archive/dist-ver.tar.gz'
  path '/usr/local/src'
  action :put
end

remote_file '/home/pastec/visuarlWordsORB.tar.gz' do
  source 'http://pastec.io/files/visualWordsORB.tar.gz'
end

execute 'extract ORB' do
  command 'tar -xzf /home/pastec/visuarlWordsORB.tar.gz'
  cwd '/home/pastec'
end

directory '/usr/local/src/pastec/build'

execute 'cmake pastec' do
  command 'cmake ../'
  cwd '/usr/local/src/pastec/build'
end

execute 'make pastec' do
  command 'make'
  cwd '/usr/local/src/pastec/build'
end

execute 'install pastec' do
  command 'mv pastec /usr/local/bin/'
  cwd '/usr/local/src/pastec/build'
end

pleaserun 'pastec' do
  name 'pastec'
  program '/usr/local/bin/pastec'
  args [ '/home/pastec/visualWordsORB.dat' ]
  action :create
end
