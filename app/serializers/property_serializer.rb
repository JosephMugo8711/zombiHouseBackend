class PropertySerializer < ActiveModel::Serializer
  attributes :id, :location, :price, :seller_id, :buyer_id, :status, :property_type, :image, :description, :size_in_sqft
end
