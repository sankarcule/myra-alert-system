require 'rails_helper'

RSpec.describe 'Alerts API', type: :request do
  let!(:alerts) { create_list(:alert, 10) }
  describe 'GET /alerts' do
    before { get '/alerts' }

    it 'returns alerts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
