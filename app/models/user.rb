class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :reviews

    has_many :car_rentals

    has_secure_password

end