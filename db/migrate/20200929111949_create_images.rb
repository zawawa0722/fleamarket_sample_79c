class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :item             , foreign_key: true
      t.string :images               , null: false
      t.timestamps
    end
  end
end