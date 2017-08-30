require "rails_helper"

module Soopli
  RSpec.describe RagStatusesController, type: :routing do
    describe "routing" do

      it "routes to #index" do
        expect(:get => "/rag_statuses").to route_to("rag_statuses#index")
      end

      it "routes to #new" do
        expect(:get => "/rag_statuses/new").to route_to("rag_statuses#new")
      end

      it "routes to #show" do
        expect(:get => "/rag_statuses/1").to route_to("rag_statuses#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/rag_statuses/1/edit").to route_to("rag_statuses#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/rag_statuses").to route_to("rag_statuses#create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/rag_statuses/1").to route_to("rag_statuses#update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/rag_statuses/1").to route_to("rag_statuses#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/rag_statuses/1").to route_to("rag_statuses#destroy", :id => "1")
      end

    end
  end
end
