class AddPhoneNumberAndAddressToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :phone_number, :string
    add_column :orders, :address, :string
  end
end
