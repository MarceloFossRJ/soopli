require "rails_helper"

module Soopli
  RSpec.describe SupplierTypesController, type: :routing do
    describe "routing" do

      it "routes to #index" do
        expect(:get => "/supplier_types").to route_to("supplier_types#index")
      end

      it "routes to #new" do
        expect(:get => "/supplier_types/new").to route_to("supplier_types#new")
      end

      it "routes to #show" do
        expect(:get => "/supplier_types/1").to route_to("supplier_types#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/supplier_types/1/edit").to route_to("supplier_types#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/supplier_types").to route_to("supplier_types#create")
      end

      it "routes to #update via PUT" do
        expect(:put => "/supplier_types/1").to route_to("supplier_types#update", :id => "1")
      end

      it "routes to #update via PATCH" do
        expect(:patch => "/supplier_types/1").to route_to("supplier_types#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/supplier_types/1").to route_to("supplier_types#destroy", :id => "1")
      end

    end
  end
end
