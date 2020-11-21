class AddSalerIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :saler_id, :integer
  end
end
