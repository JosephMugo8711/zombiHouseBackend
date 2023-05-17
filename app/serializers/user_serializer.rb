class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fullname, :role, :subscription_package, :avatar, :contact, :email, :password_digest, :budget, :company_name, :location
end
