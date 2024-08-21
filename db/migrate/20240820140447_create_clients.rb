class CreateClients < ActiveRecord::Migration[7.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.date :b_date
      t.integer :status
      t.integer :contact_means
      t.string :phone
      t.string :address
      t.text :personal_description

      t.timestamps
    end
  end
end
