class CreateCondittions < ActiveRecord::Migration[6.0]
  def change
    create_table :condittions do |t|
      t.string :condittion     , null: false
      t.timestamps
    end
  end
end
