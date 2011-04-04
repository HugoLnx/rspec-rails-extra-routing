unless File.exist?('./Gemfile')
  raise <<-MESSAGE
Could not find a Gemfile. Please run any of:
  thor rails:use 3-0-stable
  thor rails:use master
  thor rails:use VERSION (where VERSION is any released version)
MESSAGE
end
require "bundler"
Bundler.setup
#Bundler::GemHelper.install_tasks

require 'rake'
require 'yaml'

require 'cucumber/rake/task'

require 'rubygems'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.version = "0.0.1"
  gem.name = "rspec-rails-extra-routing"
  gem.homepage = "http://github.com/HugoLnx/rspec-rails-extra-routing"
  gem.license = "MIT"
  gem.summary = %Q{Extension to rspec-rails that allows some shortcuts in routing tests}
  gem.description = <<STRING 
Extension to rspec-rails that allows some shortcuts in routing tests.
With it, this:
  describe "users routes" do
    describe "GET /" do
      it{{:get => '/'}.should route_to "users#index"}
    end

    describe "POST /" do
      it{{:post => '/'}.should be_routable}
    end
  end

can be written like this:

  describe "users routes" do
    get('/').should route_to "users#index"
    post('/').should be_routable
  end
STRING
  gem.email = "hugo.roque@caelum.com.br"
  gem.authors = ["Hugo Roque (a.k.a HugoLnx)"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_dependency 'rspec-rails', '>= 2.5.0'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
  gem.files = FileList['lib/**/*.rb'].to_a
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "rspec-rails-extra-routing #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end












Cucumber::Rake::Task.new(:cucumber)

namespace :generate do
  desc "generate a fresh app with rspec installed"
  task :app do |t|
    unless File.directory?('./tmp/example_app')
      sh "bundle exec rails new ./tmp/example_app"
      sh "cp ./templates/Gemfile-base    ./tmp/example_app/"
      sh "cp ./templates/Gemfile       ./tmp/example_app/"
      sh "cp ./templates/Gemfile.lock  ./tmp/example_app/"
    end
  end

  desc "generate a bunch of stuff with generators"
  task :stuff do
    in_example_app "rake rails:template LOCATION='../../templates/generate_stuff.rb'"
  end
end

def in_example_app(command)
  Dir.chdir("./tmp/example_app/") do
    Bundler.with_clean_env do
      sh command
    end
  end
end

namespace :db do
  task :migrate do
    in_example_app "rake db:migrate"
  end

  namespace :test do
    task :prepare do
      in_example_app "rake db:test:prepare"
    end
  end
end

desc "run a variety of specs against the generated app"
task :smoke do
  in_example_app "rake rails:template --trace LOCATION='../../templates/run_specs.rb'"
end

desc 'clobber generated files'
task :clobber do
  rm_rf "pkg"
  rm_rf "tmp"
  rm    "Gemfile.lock" if File.exist?("Gemfile.lock")
end

namespace :clobber do
  desc "clobber the generated app"
  task :app do
    rm_rf "tmp/example_app"
  end
end

desc "Push docs/cukes to relishapp using the relish-client-gem"
task :relish, :version do |t, args|
  raise "rake relish[VERSION]" unless args[:version]
  sh "relish push rspec/rspec-rails:#{args[:version]}"
end

task :default => [:spec, "clobber:app", "generate:app", "generate:stuff", :smoke, :cucumber]
