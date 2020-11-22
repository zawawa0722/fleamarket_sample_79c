class AddSalerIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :seller, foreign_key: { to_table: :users }
  end
end
