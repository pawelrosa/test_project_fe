role :app, %w{paulus@46.101.150.244}
role :web, %w{paulus@46.101.150.244}
role :db,  %w{paulus@46.101.150.244}
set :deploy_to, '/home/paulus/www/test_project_fe/production'
set :branch, 'deployment'

server '46.101.150.244', user: 'paulus', roles: %w{web app}