require 'rails_helper'

RSpec.describe 'Surveys', type: :request do
  before(:all) do
    @survey = Survey.first

    get "/survey/#{@survey.id}"
  end

  describe 'GET /show/:id' do
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns survey in response' do
      body = JSON.parse(response.body).with_indifferent_access
      expect(body[:payload][:id]).to be_truthy
    end

    it 'returns not found on invalid id' do
      get '/survey/invalid-id'
      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'POST /create/:id' do
    it 'returns http success' do
      questions = @survey.questions

      post "/survey/#{@survey.id}", params: {
        feedback: {
          responses: [
            {
              question_id: questions.first.id,
              option_id: questions.first.choices.first&.id
            },
            {
              question_id: questions.second.id,
              body: 'I like the cashier.'
            }
          ]
        }
      }

      expect(response).to have_http_status(:success)
    end
  end
end
