class PostSerializer < ActiveModel::Serializer
  attributes :id, :name, :text, :permalink, :created_at, :likes
  
  def likes
    object.likes.count
  end

  has_many :tags
  has_one :image, key: :cover
end
