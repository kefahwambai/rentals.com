class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :username
      t.string :comment
      t.integer :rating
      t.integer :car_rental_id

      t.timestamps
    end
  end
end
