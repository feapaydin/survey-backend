require 'rails_helper'

RSpec.describe 'Surveys', type: :request do
  before(:all) do
    @survey = Survey.first
  end

  describe 'GET /show/:id' do
    it 'returns http success' do
      get "/survey/#{@survey.id}"
      expect(response).to have_http_status(:success)
    end

    it 'returns not found on invalid id' do
      get "/survey/invalid-id"
      expect(response).to have_http_status(:not_found)
    end

    it 'returns survey in response' do
      get "/survey/#{@survey.id}"
      body = JSON.parse(response.body).with_indifferent_access
      expect(body[:payload][:id]).to be_truthy
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      post '/survey'
      expect(response).to have_http_status(:success)
    end
  end
end
