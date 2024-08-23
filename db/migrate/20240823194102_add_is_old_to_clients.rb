class AddIsOldToClients < ActiveRecord::Migration[7.2]
  def change
    add_column :clients, :is_old, :boolean
  end
end
