require 'rails_helper'

RSpec.describe 'Voters', type: :request do
  xdescribe 'GET /new' do
    it 'returns http success' do
      get '/voters/new'
      expect(response).to have_http_status(:success)
    end
  end
end
