require "rails_helper"

RSpec.describe SourcePagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/source_pages").to route_to("source_pages#index")
    end

    it "routes to #new" do
      expect(get: "/source_pages/new").to route_to("source_pages#new")
    end

    it "routes to #show" do
      expect(get: "/source_pages/1").to route_to("source_pages#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/source_pages/1/edit").to route_to("source_pages#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/source_pages").to route_to("source_pages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/source_pages/1").to route_to("source_pages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/source_pages/1").to route_to("source_pages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/source_pages/1").to route_to("source_pages#destroy", id: "1")
    end
  end
end
