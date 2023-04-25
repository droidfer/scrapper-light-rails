require "rails_helper"

RSpec.describe WebsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/webs").to route_to("webs#index")
    end

    it "routes to #new" do
      expect(get: "/webs/new").to route_to("webs#new")
    end

    it "routes to #show" do
      expect(get: "/webs/1").to route_to("webs#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/webs/1/edit").to route_to("webs#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/webs").to route_to("webs#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/webs/1").to route_to("webs#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/webs/1").to route_to("webs#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/webs/1").to route_to("webs#destroy", id: "1")
    end
  end
end
