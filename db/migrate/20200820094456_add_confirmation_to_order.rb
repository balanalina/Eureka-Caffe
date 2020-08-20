class AddConfirmationToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :confirmation, :boolean, default: false
  end
end
