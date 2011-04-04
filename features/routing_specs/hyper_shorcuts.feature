Feature: hyper shortcuts

  To make my routing tests clean and focused
  As a developer
  I will use hyper shortcuts

  Scenario: passing route spec with hyper shortcut syntax
    Given a file named "spec/routing/widgets_routing_spec.rb" with:
      """
      require "spec_helper"

      describe "routes for Widgets" do
        get("/widgets").should route_to(
          :controller => "widgets",
          :action => "index"
        )

        post("/widgets").should route_to(
          :controller => "widgets",
          :action => "create"
        )

        put("/widgets/0").should route_to(
          :controller => "widgets", 
          :action => "update", 
          :id => "0"
        )

        delete("/widgets/0").should route_to(
          :controller => "widgets",
          :action => "destroy",
          :id => "0"
        )
      end
      """

    When I run `rspec spec/routing/widgets_routing_spec.rb`
    Then the examples should all pass

  Scenario: failing route spec with hyper shortcut syntax
    Given a file named "spec/routing/widgets_routing_spec.rb" with:
      """
      require "spec_helper"

      describe "routes for Widgets" do
        get("/widgets").should_not route_to(
          :controller => "widgets",
          :action => "index"
        )

        post("/widgets").should_not route_to(
          :controller => "widgets",
          :action => "create"
        )

        put("/widgets/0").should_not route_to(
          :controller => "widgets", 
          :action => "update", 
          :id => "0"
        )

        delete("/widgets/0").should_not route_to(
          :controller => "widgets",
          :action => "destroy",
          :id => "0"
        )
      end
      """

    When I run `rspec spec/routing/widgets_routing_spec.rb`
    Then the output should contain "4 failure"

  Scenario: specify routeable route should be routable with hyper shortcut (passes)
    Given a file named "spec/routing/widgets_routing_spec.rb" with:
      """
      require "spec_helper"

      describe "routes for Widgets" do
        get("/widgets").should be_routable
      end
      """

    When I run `rspec spec/routing/widgets_routing_spec.rb`
    Then the examples should all pass
