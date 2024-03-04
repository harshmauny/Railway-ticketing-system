require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe ReviewsController, type: :controller do
  let(:valid_attributes) {
    FactoryBot.attributes_for(:review)
  }

  let(:invalid_attributes) {
    { rating: nil, feedback: nil }
  }

  let(:valid_session) { {} }


  describe "POST #create" do
    context "with valid parameters" do
      it "redirects to the root path" do
        post :create, params: { review: valid_attributes }, session: valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Review" do
        expect {
          post :create, params: { review: invalid_attributes }, session: valid_session
        }.to_not change(Review, :count)
      end

     
    end
  end

end
