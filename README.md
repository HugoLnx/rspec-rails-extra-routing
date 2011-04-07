# RSpec Rails Extra Routing `v0.1.0`

## Description
I've implement this gem to code some ideas of mine about how should be the rspec-route DSL.  
Maybe some of this ideas makes sense for others developers, and can be joined to the rspec-rails in the future.  
For now, is there only one feature 100% finished, but soon enough will be others.  
Any feed back is welcomed.  

## Features
### Hyper Shortcuts [`Pull Request discussion`](https://github.com/rspec/rspec-rails/pull/346)
This feature object is to simplify and DRY(Don't Repeat Yourself) the way you write your route test.  

    # Old Way
    describe "GET /" do
      it { get("/").should route_to(
        :controller => "users",
        :action => "index"
      ) }
    end

    # HyperShortcut Way
    get("/").should route_to(
      :controller => "users",
      :action => "index"
    )

## How use
Install the gem:

    gem install rspec-rails-extra-routing

Load the gem in Gemfile:

    # Gemfile
    group :test do
      gem 'rspec-rails-extra-routing'
    end

and require it above `require "rspec/rails"` in your `spec/spec_helper` file:

    # spec/spec_helper.rb
    ... 
    require "rspec/rails"
    require "rspec/rails/extra/routing" # or rspec/rails/extra/FEATURE-PATH to
                                        # load a specific feature
    ...
## Copyright

Copyright (c) 2011 HugoLnx. See LICENSE.txt for
further details.
