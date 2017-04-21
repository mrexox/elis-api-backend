class CreatePosts < ActiveRecord::Migration[5.0]
  def up
    create_table :posts do |t|
      t.string :name, :null => false
      t.text :text, :null => false
      t.string :permalink, :null => false
      t.string :images

      t.timestamps
    end
  end
	def down
		drop_table :posts
	end
end
