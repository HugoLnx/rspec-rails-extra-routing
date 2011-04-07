# RSpec Rails Extra Routing `v0.1.0`

## Description `Some New Stuff for Routing Tests in RSpec Rails`
This gem has been created just to put some features there I like to use in RSpec Rails until my pull request is accepted and a new version is released, or forever ( if this don't happens ).

## Features
### Hyper Shortcuts [`Pull Request`](https://github.com/rspec/rspec-rails/pull/346)
  This feature allows shortcuts to the old routing test describe structure:

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

This aims to routing tests became focused and consequently clean. The pull request of this feature in rspec-rails is open, give your opnion.

Exists just this unique feature for now.

## How use
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
