class PortfolioImageSerializer < ActiveModel::Serializer
  attributes :id, :description, :created_at, :updated_at, :image_id
end
