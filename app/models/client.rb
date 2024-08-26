class Client < ApplicationRecord
    validates :name, :last_name, :email, :b_date, :status, :contact_means, :phone, :address, :personal_description, presence: true
    validates :personal_description, length: { minimum: 500 }

    enum :status, { inactive: 0, active: 1 }
    enum :contact_means, { instagram: 0, facebook: 1, whatsapp: 2 }
end
