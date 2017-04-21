class CreateLikes < ActiveRecord::Migration[5.0]
  def up
    create_table :likes do |t|
      t.string :user_ip, :null => false
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
	def down
		drop_table :likes
	end
end
