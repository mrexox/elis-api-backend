class CreateSlides < ActiveRecord::Migration[5.0]
  def up
    create_table :slides do |t|
      t.string :text
      t.string :url
      t.string :image, :null => false

      t.timestamps
    end
  end
	def down
		drop_table :slides
	end
end
