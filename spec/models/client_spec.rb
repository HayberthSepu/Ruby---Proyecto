require 'rails_helper'

RSpec.describe Client, type: :model do
  it 'is valid with valid attributes' do
    client = build(:client)
    expect(client).to be_valid
  end

  it 'is not valid without a name' do
    client = build(:client, name: nil)
    expect(client).not_to be_valid
    expect(client.errors[:name]).to include("can't be blank")
  end

  it 'is not valid without a last_name' do
    client = build(:client, last_name: nil)
    expect(client).not_to be_valid
    expect(client.errors[:last_name]).to include("can't be blank")
  end

  it 'is not valid without an email' do
    client = build(:client, email: nil)
    expect(client).not_to be_valid
    expect(client.errors[:email]).to include("can't be blank")
  end

  it 'is not valid without a b_date' do
    client = build(:client, b_date: nil)
    expect(client).not_to be_valid
    expect(client.errors[:b_date]).to include("can't be blank")
  end

  it 'is not valid without a status' do
    client = build(:client, status: nil)
    expect(client).not_to be_valid
    expect(client.errors[:status]).to include("can't be blank")
  end

  it 'is not valid without contact_means' do
    client = build(:client, contact_means: nil)
    expect(client).not_to be_valid
    expect(client.errors[:contact_means]).to include("can't be blank")
  end

  it 'is not valid without a phone' do
    client = build(:client, phone: nil)
    expect(client).not_to be_valid
    expect(client.errors[:phone]).to include("can't be blank")
  end

  it 'is not valid without an address' do
    client = build(:client, address: nil)
    expect(client).not_to be_valid
    expect(client.errors[:address]).to include("can't be blank")
  end

  it 'is not valid without personal_description' do
    client = build(:client, personal_description: nil)
    expect(client).not_to be_valid
    expect(client.errors[:personal_description]).to include("can't be blank")
  end
end
