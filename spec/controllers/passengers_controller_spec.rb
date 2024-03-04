# spec/controllers/passengers_controller_spec.rb

require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe PassengersController, type: :controller do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:passenger)
  }

  let(:invalid_attributes) {
    { username: nil, name: nil, email: nil }
  }

  let(:valid_session) { {} }


  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end
  end


  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Passenger" do
        expect {
          post :create, params: { passenger: valid_attributes }, session: valid_session
        }.to change(Passenger, :count).by(1)
      end

      it "redirects to the root path" do
        post :create, params: { passenger: valid_attributes }, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Passenger" do
        expect {
          post :create, params: { passenger: invalid_attributes }, session: valid_session
        }.to_not change(Passenger, :count)
      end

      it "returns a success response (unprocessable_entity)" do
        post :create, params: { passenger: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

end
