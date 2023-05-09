class PropertySerializer < ActiveModel::Serializer
  attributes :id, :location, :price, :property_type, :size_in_sqft, :description

  belongs_to :seller
end
