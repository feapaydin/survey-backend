require 'rails_helper'

RSpec.describe "Surveys", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/survey/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/survey/create"
      expect(response).to have_http_status(:success)
    end
  end

end
