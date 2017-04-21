class CreatePortfolioImages < ActiveRecord::Migration[5.0]
  def up
    create_table :portfolio_images do |t|
      t.string :image, :null => false
      t.text :description, :default => ''

      t.timestamps
    end
  end
	def down
		drop_table :portfolio_images
	end
end
