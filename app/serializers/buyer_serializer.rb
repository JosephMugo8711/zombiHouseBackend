class BuyerSerializer < ActiveModel::Serializer
  attributes :id, :username, :fullname, :email, :contact, :avatar, :budget, :subscription_package

  has_many :properties
  has_many :sellers
end
