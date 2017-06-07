class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

module HasImage
  # Keeping post_id, portfolio_image_id and slide_id
  # in Image is not good to realize one-to-one relationships.
  #
  # So I use this helper to let Post, PortfolioImage and Slide
  # have an image (and let an image not to belong to one model).
  #
  # Image - is a storage for all pic data. This may be unsafe
  # but is much more cleaner than creating own uploaders for
  # all models.
  def image
    begin
      image = Image.find(image_id)
    rescue ActiveRecord::RecordNotFound => e
      image = nil
    end
    return image
  end
end
