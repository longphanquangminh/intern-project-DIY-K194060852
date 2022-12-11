source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.4"

gem "mysql2"

gem 'enumerize'

gem 'countries', require: 'countries/global'

gem 'formtastic', '~> 4.0'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem "slim-rails" # erb sang slim?

gem 'dotenv-rails'

gem 'kaminari'       # gíup phân trang
gem 'ransack'     # tạo form tìm kiếm
gem 'bootstrap-kaminari-views' # giao diện đẹp cho phân trang
gem 'bootstrap_form'
gem 'bootstrap4-kaminari-views'

gem 'jquery-rails'

gem 'devise' # gem cho login function (kể cả admin)

gem "paperclip" # upload ảnh # https://viblo.asia/p/gioi-thieu-ve-gem-paperclip-lA7GKndWMKZQ

gem 'aws-sdk-s3' # cũng cho upload ảnh? # lỗi?: * You must set the `s3_region`

# gem 'rails_admin'
gem 'rails_admin', '~> 3.0' # để này theo github: https://github.com/railsadminteam/rails_admin (chạy "https://github.com/sferik/rails_admin" theo slide thì ra link 1)

gem 'actionmailer' # tự # ra 7.0.4?
# gem 'actionmailer', '~> 5.0', '>= 5.0.0.1'

gem "letter_opener" # tự
# gem "letter_opener", :group => :development
# gem 'letter_opener', '~> 1.4', '>= 1.4.1'

# gem 'rspec' # thử install
# gem 'rspec', '~> 3.0'

gem 'whenever'

gem 'rubyzip'

gem "net-http"

gem "net-ftp"

gem "bootstrap"

gem "font-awesome-sass"

gem 'popper_js'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'
gem "activerecord-import"
gem "sunspot_rails"
gem "sunspot_solr"
gem 'progress_bar'
gem "friendly_id"
gem "carrierwave"
