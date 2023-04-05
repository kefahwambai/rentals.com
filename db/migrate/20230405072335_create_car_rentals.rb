class CreateCarRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :car_rentals do |t|
      t.string :image_url
      t.string :carmake
      t.string :carmodel
      t.integer :price
      t.string :description
      t.string :fuel

      t.timestamps
    end
  end
end
