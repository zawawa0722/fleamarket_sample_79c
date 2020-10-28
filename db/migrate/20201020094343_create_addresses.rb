class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :zipcode
      t.string :prefectures
      t.string :city
      t.string :address
      t.string :building
      t.string :address_name1
      t.string :address_name2
      t.string :phone
      t.references :user
      t.timestamps
    end
  end
end
