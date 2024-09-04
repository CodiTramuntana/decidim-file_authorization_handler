# frozen_string_literal: true

source "https://rubygems.org"

# Declare your gem's dependencies in decidim-file_authorization_handler.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

group :development, :test do
  gem "bootsnap", require: false
  gem "decidim", "~> 0.28.0", require: true
  gem "faker"
  gem "letter_opener_web"
  gem "listen"
  # Set versions because Property AutoCorrect errors.
  gem "rspec-rails", "~> 6.0.4"
  gem "rubocop-factory_bot", "2.25.1"
  gem "rubocop-rspec", "2.26.1"
end
