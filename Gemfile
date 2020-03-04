source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'haml', '~> 5.1', '>= 5.1.2'
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'simple_form', '~> 5.0', '>= 5.0.2'
gem "aws-sdk-s3", require: false
gem 'carrierwave', '~> 2.0', '>= 2.0.2'
gem 'fog-aws', '~> 3.5', '>= 3.5.2'
gem 'devise', '~> 4.7', '>= 4.7.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.9'
  gem 'factory_bot_rails', '~> 5.1', '>= 5.1.1'
  gem 'faker', '~> 2.10', '>= 2.10.2'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'erb2haml', '~> 0.1.5'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
