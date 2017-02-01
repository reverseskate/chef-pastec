package 'nginx'

cookbook_file '/usr/share/nginx/html/index.html'
cookbook_file '/etc/nginx/sites-available/default'

service 'nginx' do
  supports reload: true
  action [ :enable, :start, :reload ]
end
