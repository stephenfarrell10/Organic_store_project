class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :payment

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
