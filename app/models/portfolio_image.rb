class PortfolioImage < ApplicationRecord
  include HasImage  
  scope :sorted, lambda { order('created_at DESC') }
end
