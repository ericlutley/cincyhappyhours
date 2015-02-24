require 'spec_helper'

describe PlacesController do
  describe "POST create" do
    let(:place_params) { { name: "Via Vite", address: "520 Vine St, Cincinnati, OH" } }

    context "when signed in as an admin" do
      let(:user) { FactoryGirl.create :admin }

      before(:each) { session[:user_id] = user.id }

      it "creates a new place" do
        expect { post :create, place: place_params }.to change{ Place.count }.by(1)
      end
    end

    context "when not signed in" do
      it "returns HTTP 403 page" do
        post :create, place: place_params
        response.status.should == 403
      end
    end
  end
end
