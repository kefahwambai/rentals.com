class CarRentalSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :carmake, :carmodel, :price, :description, :fuel
end
