require 'rails_helper'

RSpec.describe 'Alerts API', type: :request do
  let!(:alerts) { create_list(:alert, 10) }
  let(:alert_id) { alerts.first.id }

  describe 'GET /alerts' do
    before { get '/alerts' }

    it 'returns alerts' do
      expect(json["alerts"].length).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /alerts' do
    let(:valid_attributes) { { reference_id: '10', delay: 20, description: 'not completed' } }

    context 'when the request is valid' do
      before { post '/alerts', params: valid_attributes }

      it 'creates a alert' do
        expect(json["alert"]["reference_id"]).to eq("10")
        expect(json["alert"]["delay"]).to eq(20)
        expect(json["alert"]["description"]).to eq("not completed")
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/alerts', params: { reference_id: '1' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Delay can't be blank, Description can't be blank/)
      end
    end
  end

  describe 'DELETE /alerts/revoke' do
    before { delete "/alerts/revoke", params: { reference_id: 'Transcription_start_1' } }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
