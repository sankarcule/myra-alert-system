require 'rails_helper'

RSpec.describe 'Alerts API', type: :request do
  let!(:alerts) { create_list(:alert, 10) }
  let(:alert_id) { alerts.first.id }

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

  describe 'POST /alerts' do
    let(:valid_attributes) { { reference_id: 1, delay: 20, description: 'not completed' } }

    context 'when the request is valid' do
      before { post '/alerts', params: valid_attributes }

      it 'creates a alert' do
        expect(json['reference_id']).to eq(1)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/alerts', params: { reference_id: 1 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Delay can't be blank, Description can't be blank/)
      end
    end
  end

  describe 'DELETE /alerts/:id' do
    before { delete "/alerts/#{alert_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
