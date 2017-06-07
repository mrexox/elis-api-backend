class ImageSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :url
  def url
    object.image.url
  end
end
