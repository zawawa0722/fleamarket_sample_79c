class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :zipcode
      t.text :prefectures
      t.text :city
      t.text :address
      t.text :building
      t.text :address_name1
      t.text :address_name2
      t.text :phone
      t.references :user
      t.timestamps
    end
  end
end
