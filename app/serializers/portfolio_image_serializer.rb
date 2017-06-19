class PortfolioImageSerializer < ActiveModel::Serializer
  attributes :id, :description, :created_at, :updated_at 

	has_one :image
end
