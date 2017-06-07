class ChangeImageUrlColumnName < ActiveRecord::Migration[5.0]
  def up
    rename_column :images, :url, :image
  end

  def down
    rename_column :images, :image, :url
  end
end
