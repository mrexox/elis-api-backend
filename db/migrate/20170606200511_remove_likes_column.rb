class RemoveLikesColumn < ActiveRecord::Migration[5.0]
  def up
    remove_column :posts, :likes
  end

  def down
    add_column :posts, :likes, :integer, :default => 0
  end
end
