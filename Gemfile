# frozen_string_literal: true

source "https://rubygems.org"
ruby "2.7.0"
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

gem 'line-bot' # line messaging APIを利用するためのgem
gem 'sinatra'  # rubyのサーバー
gem 'dotenv'   # 環境変数を管理するgem
gem 'liff_selector' # liff appを管理するgem

gem 'pg', groups: %w[production]
gem "activerecord-postgresql-adapter" , groups: %w[production]
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'sqlite3', groups: %w(test development), require: false

gem 'rake'
gem 'sinatra-contrib'

