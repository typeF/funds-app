require 'rails_helper'

RSpec.describe 'Stocks API', type: :request do
  # initialize test data 
  let(:user) { create(:user) }
  let!(:stocks) { create_list(:stock, 10) }
  let(:stock_id) { stocks.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /stocks
  describe 'GET /stocks' do
    # make HTTP get request before each example
    before { get '/stocks', params: {}, headers: headers }

    it 'returns stocks' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /stocks/:id
  describe 'GET /stocks/:id' do
    before { get "/stocks/#{stock_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the stock' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(stock_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:stock_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Stock/)
      end
    end
  end

  # Test suite for POST /stocks
  describe 'POST /stocks' do
    # valid payload
    let(:valid_attributes) do
      { symbol: 'DOW', function: 'TIME_SERIES_DAILY', data: "{2020-01-01: '199.21'}" }.to_json
    end 

    context 'when the request is valid' do
      before { post '/stocks', params: valid_attributes, headers: headers }

      it 'creates a stock' do
        expect(json['symbol']).to eq('DOW')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { symbol: nil }.to_json }
      before { post '/stocks', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Symbol can't be blank/)
      end
    end
  end

  # Test suite for PUT /stocks/:id
  describe 'PUT /stocks/:id' do
    let(:valid_attributes) { { symbol: 'NASDAQ' }.to_json }

    context 'when the record exists' do
      before { put "/stocks/#{stock_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

end