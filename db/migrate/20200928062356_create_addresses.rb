class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :user                , foreign_key: true
      t.string :postcode                , null: false
      t.string :municipalities          , null: false
      t.string :address                 , null: false
      t.string :building                , null: false
      t.string :phone_number            , null: false         ,unique: true
      t.timestamps
    end
  end
end
