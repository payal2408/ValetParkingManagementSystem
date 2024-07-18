require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST #login' do
    let!(:user) { FactoryBot.create(:user, email: 'user@example.com', password: 'password') }
    let(:json) { JSON.parse(response.body) }
    
    context 'when the credentials are correct' do
      before do
        post :login, params: { email: user.email, password: 'password' }
      end

      it 'returns a success status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns an authentication token' do
        expect(json['token']).not_to be_nil
      end
    end

    context 'when the credentials are incorrect' do
      before do
        post :login, params: { email: user.email, password: '123456' }
      end

      it 'returns an unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        expect(json['error']).to eq('Invalid email or password')
      end
    end
  end
end

