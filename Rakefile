require 'rubygems'
require 'bundler'
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
  gem.version = "0.0.5"
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
  rdoc.title = "teste #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
