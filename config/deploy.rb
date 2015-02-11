# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'azkaban2'
set :repo_url, 'git@github.com:Shopify/azkaban.git'
set :branch, 'master'
set :deploy_to, '/u/apps/a2'

set :scm, :git
set :format, :pretty
set :log_level, :debug
