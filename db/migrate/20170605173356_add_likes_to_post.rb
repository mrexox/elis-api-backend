class AddLikesToPost < ActiveRecord::Migration[5.0]
  # Likes should not be passed by json as a set of ips
  # thay should be a number
  # when adding a like the following happens:
  # 1. Checking if ip already exist, if yes bad request sends
  # 2. If ip is new, then it is added to Like and post's likes attribute
  #    increases
  def up
    add_column :posts, :likes, :integer, :default => 0
  end

  def down
    remove_column :posts, :likes
  end
end
