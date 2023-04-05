class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :username, :comment, :rating, :car_rental_id
end
