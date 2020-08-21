class AddQrTokenToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :qr_token, :string
  end
end
