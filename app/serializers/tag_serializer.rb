class TagSerializer < ActiveModel::Serializer
  attribute :tag_name, key: :'tag-name'
  attributes :id
  has_many :posts
  
end
