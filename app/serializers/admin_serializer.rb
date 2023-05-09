class AdminSerializer < ActiveModel::Serializer
  attributes :id, :username, :fullname, :email, :contact, :avatar
end
