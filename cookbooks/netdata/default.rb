package 'netdata'

service 'netdata' do
  action [:enable, :start]
end

remote_file '/etc/netdata/netdata.conf' do
  owner 'root'
  group 'root'
  mode '644'
  notifies :restart, 'service[netdata]'
end

# TODO: 必要に応じて有効化していく
# package 'python3'
# package 'python3-mysqldb'

# remote_file '/etc/netdata/python.d/web_log.conf' do
#   owner 'root'
#   group 'root'
#   mode '644'
#   notifies :restart, 'service[netdata]'
# end

# execute %|mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'netdata'@'localhost' IDENTIFIED BY 'netdata' WITH GRANT OPTION; FLUSH PRIVILEGES;"| do
#   user 'root'
#   not_if %(mysql -uroot -e "select User,Host from mysql.user"|grep -q netdata)
# end

# remote_file '/etc/netdata/python.d/mysql.conf' do
#   owner 'root'
#   group 'root'
#   mode '644'
#   notifies :restart, 'service[netdata]'
# end

# remote_file '/etc/netdata/python.d/nginx.conf' do
#   owner 'root'
#   group 'root'
#   mode '644'
#   notifies :restart, 'service[netdata]'
# end

# remote_file '/etc/netdata/python.d/redis.conf' do
#   owner 'root'
#   group 'root'
#   mode '644'
#   notifies :restart, 'service[netdata]'
# end
