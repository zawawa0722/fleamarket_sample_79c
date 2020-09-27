class CreatePays < ActiveRecord::Migration[6.0]
  def change
    create_table :pays do |t|
      t.references :user            , foreign_key: true
      t.string :card_number         , null: false
      t.integer :year               , null: false
      t.integer :month              , null: false
      t.integer :security_number    , null: false
      t.timestamps
    end
  end
end
