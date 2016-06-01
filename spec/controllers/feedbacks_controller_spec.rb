require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
let(:feedback) { FactoryGirl.create(:feedback) }

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe '#create' do
    it 'success' do
      feedback_parameters = FactoryGirl.attributes_for(:feedback)
      expect { post :create, feedback: feedback_parameters}.to change(Feedback, :count).by(1)
    end

  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, id: feedback.id
      expect(response).to have_http_status(:success)
    end
  end

end
