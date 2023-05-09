class SellerSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :location, :email, :contact, :avatar, :subscription_package

  has_many :properties
  has_many :buyers
end
