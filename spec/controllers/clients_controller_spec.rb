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
    context 'when there are client' do
      it 'returns a success response' do
        get :index, format: :json
        expect(response).to be_successful
        expect(JSON.parse(response.body).first).to eq(client_attributes.transform_keys(&:to_s))
      end
    end

    context "when there are no clients" do
      it 'returns an empty array' do
        Client.delete_all
        get :index, format: :json
        expect(response).to be_successful
        expect(JSON.parse(response.body)).to be_empty
      end
    end
  end


  describe "POST #create" do
    context 'with valid params' do
      it "creates a new client with is_old set to false" do
        post :create, params: { client: attributes_for(:client) }, format: :json
        expect(Client.last.is_old).to be_falsey
        expect(JSON.parse(response.body))
      end
    end

    context "with invalid params" do
      it 'does not create a client with invalid params' do
        invalid_attributes = attributes_for(:client, name: nil)
        expect do
            post :create, params: { client: invalid_attributes }, format: :json
        end.not_to change(Client, :count)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include("name")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with invalid params" do
      it 'does not create a client with invalid params' do
        invalid_attributes = attributes_for(:client, last_name: nil)
        expect do
            post :create, params: { client: invalid_attributes }, format: :json
        end.not_to change(Client, :count)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include("last_name")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with invalid params" do
      it 'does not create a client with invalid params' do
        invalid_attributes = attributes_for(:client, email: nil)
        expect do
            post :create, params: { client: invalid_attributes }, format: :json
        end.not_to change(Client, :count)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include("email")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with invalid params" do
      it 'does not create a client with invalid params' do
        invalid_attributes = attributes_for(:client, b_date: nil)
        expect do
            post :create, params: { client: invalid_attributes }, format: :json
        end.not_to change(Client, :count)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include("b_date")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with invalid params" do
      it 'does not create a client with invalid params' do
        invalid_attributes = attributes_for(:client, status: nil)
        expect do
            post :create, params: { client: invalid_attributes }, format: :json
        end.not_to change(Client, :count)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include("status")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with invalid params" do
      it 'does not create a client with invalid params' do
        invalid_attributes = attributes_for(:client, contact_means: nil)
        expect do
            post :create, params: { client: invalid_attributes }, format: :json
        end.not_to change(Client, :count)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include("contact_means")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with invalid params" do
      it 'does not create a client with invalid params' do
        invalid_attributes = attributes_for(:client, phone: nil)
        expect do
            post :create, params: { client: invalid_attributes }, format: :json
        end.not_to change(Client, :count)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include("phone")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with invalid params" do
      it 'does not create a client with invalid params' do
        invalid_attributes = attributes_for(:client, address: nil)
        expect do
            post :create, params: { client: invalid_attributes }, format: :json
        end.not_to change(Client, :count)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include("address")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "with invalid params" do
      it 'does not create a client with invalid params' do
        invalid_attributes = attributes_for(:client, contact_means: nil)
        expect do
            post :create, params: { client: invalid_attributes }, format: :json
        end.not_to change(Client, :count)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to include("contact_means")
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end


  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: client.to_param }, format: :json
      expect(response).to be_successful
      expected_attributes = client_attributes.merge("id" => client.id).transform_keys(&:to_s)
      expect(JSON.parse(response.body)).to eq(expected_attributes)
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
      let(:new_attributes) { { name: 'Hayberth' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['name']).to eq('Hayberth')
      end
    end

    context 'with valid params' do
      let(:new_attributes) { { last_name: 'Rada' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['last_name']).to eq('Rada')
      end
    end

    context 'with valid params' do
      let(:new_attributes) { { b_date: '1990-01-02' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['b_date']).to eq('1990-01-02')
      end
    end

    context 'with valid params' do
      let(:new_attributes) { { status: 'inactive' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['status']).to eq('inactive')
      end
    end

    context 'with valid params' do
      let(:new_attributes) { { contact_means: 'whatsapp' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['contact_means']).to eq('whatsapp')
      end
    end

    context 'with valid params' do
      let(:new_attributes) { { phone: '3043055330' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['phone']).to eq('3043055330')
      end
    end

    context 'with valid params' do
      let(:new_attributes) { { address: 'carr 118 #39 d 49 inter 232' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['address']).to eq('carr 118 #39 d 49 inter 232')
      end
    end

    context 'with valid params' do
      let(:new_attributes) { { personal_description: 'hacemos un  pequeno detalle personal description with more than 500 characters.
                              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                              tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                              Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.' } }

      it 'updates the requested client' do
        put :update, params: { id: client.to_param, client: new_attributes }, format: :json
        client.reload
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['personal_description']).to eq('hacemos un  pequeno detalle personal description with more than 500 characters.
                              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
                              tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                              quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                              Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.')
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
