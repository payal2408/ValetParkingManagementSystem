require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    let(:valid_attributes) { { email: 'user@example.com', password: 'password', password_confirmation: 'password' } }
    let(:invalid_attributes) { { email: 'user@example.com', password: 'password', password_confirmation: 'mismatch' } }
    let(:json) { JSON.parse(response.body) }
    context 'when the request is valid' do
      before do
        post :create, params: { user: valid_attributes }
      end

      it 'creates a new user' do
        expect(response).to have_http_status(:created)
      end

      it 'returns an authentication token' do
        expect(json['token']).not_to be_nil
      end
    end

    context 'when the request is invalid' do
      before do
        post :create, params: { user: invalid_attributes }
      end

      it 'returns an unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns validation errors' do
        expect(json['errors']).not_to be_empty
      end
    end
  end
end