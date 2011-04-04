source "http://rubygems.org"

group :test do
  %w[rspec rspec-core rspec-expectations rspec-mocks rspec-rails].each do |lib|
    library_path = File.expand_path("../../#{lib}", __FILE__)
    if File.exist?(library_path)
      gem lib, :path => library_path
    else
      gem lib
    end
  end

  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem "cucumber", "~> 0.10.2"
  gem "aruba", "~> 0.3.5"
  gem "relish", "0.2.0"
  gem "guard-rspec", "0.1.9"
  gem "growl", "1.0.3"
  gem "ZenTest", "~> 4.4.2"
  gem "webrat", "0.7.2"


  if RUBY_PLATFORM =~ /darwin/
    gem "autotest-fsevent", "~> 0.2.4"
    gem "autotest-growl", "~> 0.2.9"
  end

  gem "ruby-debug", :platforms => :ruby_18
  gem "ruby-debug19", "~> 0.11.6", :platforms => :ruby_19

  platforms :ruby_18, :ruby_19 do
    gem "rb-fsevent", "~> 0.3.9"
    gem "ruby-prof", "~> 0.9.2"
  end

  platforms :jruby do
    gem "jruby-openssl"
  end
  # Add dependencies required to use your gem here.
  # Example:
  #   gem "activesupport", ">= 2.3.5"

  # Add dependencies to develop your gem here.
  # Include everything needed to run rake, tests, features, etc.
  gem "rails", :git => "https://github.com/rails/rails.git", :branch => "3-0-stable"
  gem "arel",  :git => "git://github.com/rails/arel.git", :branch => "2-0-stable"
  gem "rack",  :git => "git://github.com/rack/rack.git"
end
gem "shoulda", ">= 0"
gem "bundler", "~> 1.0.0"
gem "jeweler", "~> 1.5.2"
gem "rcov", "0.9.9"
  #gem "rcov", ">= 0"
