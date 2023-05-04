class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :provider

      #Recoverable
      t.string :reset_password_token
      t.string :reset_password_sent_at

      #Rememberable

      t.datetime :remember_created_at

      t.timestamps
    end
  end
end
