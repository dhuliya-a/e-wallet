class CreateDumbdata < ActiveRecord::Migration[6.0]
  def change
    create_table :dumbdata do |t|
      t.integer :base_currency
      t.integer :target_currency
      t.decimal :exchange_rate

    end
  end
end
