Feature: anonymous controller

  Use the `controller` method to define an anonymous controller derived from
  ApplicationController, or any other base controller. This is useful for
  spec'ing behavior such as global error handling.

  Scenario: specify error handling in ApplicationController
    Given a file named "spec/controllers/application_controller_spec.rb" with:
    """
    require "spec_helper"

    class ApplicationController < ActionController::Base
      class AccessDenied < StandardError; end

      rescue_from AccessDenied, :with => :access_denied

    private

      def access_denied
        redirect_to "/401.html"
      end
    end

    describe ApplicationController do
      controller do
        def index
          raise ApplicationController::AccessDenied
        end
      end

      describe "handling AccessDenied exceptions" do
        it "redirects to the /401.html page" do
          get :index
          response.should redirect_to("/401.html")
        end
      end
    end
    """
    When I run `rspec spec`
    Then the examples should all pass

  Scenario: specify error handling in subclass of ApplicationController
    Given a file named "spec/controllers/application_controller_subclass_spec.rb" with:
    """
    require "spec_helper"

    class ApplicationController < ActionController::Base
      class AccessDenied < StandardError; end
    end

    class ApplicationControllerSubclass < ApplicationController

      rescue_from ApplicationController::AccessDenied, :with => :access_denied

      private

      def access_denied
        redirect_to "/401.html"
      end
    end

    describe ApplicationControllerSubclass do
      controller(ApplicationControllerSubclass) do
        def index
          raise ApplicationController::AccessDenied
        end
      end

      describe "handling AccessDenied exceptions" do
        it "redirects to the /401.html page" do
          get :index
          response.should redirect_to("/401.html")
        end
      end
    end
    """
    When I run `rspec spec`
    Then the examples should all pass
