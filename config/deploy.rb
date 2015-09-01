lock '3.4.0'

set :application, 'test_project_fe'
set :repo_url, 'git@github.com:pawelrosa/test_project_fe.git'

set :linked_files, %w{config/database.yml config/secrets.yml config/application.yml}
set :linked_dirs, %w{log public/system}

set :rvm_ruby_version, '2.2.2@test_project_fe'
set :keep_releases, 3

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
