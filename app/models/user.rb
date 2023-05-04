class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :reviews

    has_many :car_rentals

    has_secure_password

    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable,
            :omniauthable, omniauth_providers: [:github]



    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first
  
      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user.name = access_token.info.name
      user.image = access_token.info.image
      user.uid = access_token.uid
      user.provider = access_token.provider
      user.save
  
  end
      
end