class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user                , foreign_key: true
      t.string :name                    , null: false
      t.string :price                   , null: false
      t.text :comment                   , null: false
      t.string :shipping_charges        , null: false
      t.string :shipping_date           , null: false
      t.timestamps
    end
  end
end
