class CreateMessages < ActiveRecord::Migration[5.0]
  def up
    create_table :messages do |t|
      t.string :name, :null => false
      t.string :theme
      t.string :email
      t.string :phone_number
      t.text :text, :null => false

      t.timestamps
    end
  end
	def down
		drop_table :messages
	end
end
