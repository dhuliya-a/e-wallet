class AddCurrency < ActiveRecord::Migration[6.0]
  def change
    add_column :wallets,:currency,:integer
  end
end
