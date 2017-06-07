class AllImagesInOnePlace < ActiveRecord::Migration[5.0]
  def up
    # Post now will have a FK on Image for storing a cover
    remove_column :posts, :images
    add_reference :posts, :image, foreign_key: true, index: true

    # Portfolio now will be a collection of images from Image
    remove_column :portfolio_images, :image
    add_reference :portfolio_images, :image, foreign_key: true, index: true

    # Slide not will be a collection of images from Image
    remove_column :slides, :image
    add_reference :slides, :image, foreign_key: true, index: true
  end

  def down
    # All back again
    remove_reference :posts, :image, foreign_key: true, index: true
    add_column :posts, :images, :string

    remove_reference :portfolio_images, :image, foreign_key: true, index: true
    add_column :portfolio_images, :image, :string, :null => false

    remove_reference :slides, :image, foreign_key: true, index: true
    add_column :slides, :image, :string, :null => false
  end
end
