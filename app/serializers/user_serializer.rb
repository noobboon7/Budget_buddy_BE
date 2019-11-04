class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :email, :first_name, :last_name, :avatar, :amount

end
