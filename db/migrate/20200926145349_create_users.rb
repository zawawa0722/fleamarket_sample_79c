class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname            , null: false
      t.string :email               , null: false
      t.string :password            , null: false
      t.string :family_name         , null: false
      t.string :first_name          , null: false
      t.string :family_name_kana    , null: false
      t.string :first_name_kana     , null: false
      t.integer :birthday_year      , null: false
      t.integer :birtuhday_month    , null: false
      t.integer :biruthday_day      , null: false

      t.timestamps
    end
  end
end
