require 'rails_helper'

RSpec.describe ClientsController, type: :controller do
  render_views
  let!(:client) { create(:client) }
  let(:client_attributes) { { id: client.id,
                              name: client.name,
                              last_name:  client.last_name,
                              email:  client.email,
                              b_date:  client.b_date.strftime('%Y-%m-%d'),
                              status:  client.status,
                              contact_means:  client.contact_means,
                              phone:  client.phone,
                              address:  client.address,
                              personal_description:  client.personal_description,
                              is_old: client.is_old } }


  describe 'GET #index' do
    it 'returns a success response' do
      get :index, format: :json

      expect(response).to be_successful
      expect(JSON.parse(response.body).first).to eq(client_attributes.transform_keys(&:to_s))
    end
  end

  describe "POST #create" do
    it "creates a new client with is_old set to false" do
      post :create, params: { client: attributes_for(:client) }, format: :json
      expect(Client.last.is_old).to be_falsey
      expect(response.body).not_to be_empty
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: client.to_param }, format: :json
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:client) }

      it 'creates a new Client' do
        expect do
          post :create, params: { client: valid_attributes }, format: :json
        end.to change(Client, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated Name' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        expect(client.name).to eq('Updated Name')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested client' do
      delete :destroy, params: { id: client.to_param }, format: :json
      is_client_exist = Client.where(id: client.id)
      expect(is_client_exist).to be_empty
    end
  end
end
