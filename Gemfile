 # source 'https://rubygems.org'
source "http://ruby.taobao.org/"

gem 'rails', '3.2.13'

gem 'slim'
gem 'kaminari' #paginate
gem 'bootstrap-sass'
gem 'omniauth-github'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "octokit"
gem "nokogiri"
gem "kaminari"
gem "resque"
gem 'devise'
gem 'newrelic_rpm'
group :production do
  gem 'pg' 
  gem 'unicorn'
end

group :development, :test do 
  gem 'sqlite3'
  gem 'pry-debugger'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "thin"
end

group :test do
  gem 'rspec-rails'
end
