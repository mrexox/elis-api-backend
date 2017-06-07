class MessageSerializer < ActiveModel::Serializer
  attributes :id, :name, :theme, :email, :phone_number, :text, :created_at
end
