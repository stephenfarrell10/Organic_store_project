class AddPaymentToOrdersPaymentString < ActiveRecord::Migration
  def self.up
    add_column :orders,:payment, :string
  end

  def self.down
  remove_column :orders,:payent
  end
end
