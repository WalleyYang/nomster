class AddPhotos < ActiveRecord::Migration
	def change
		create_table :photos do |t|
			t.string   :picture
			t.string   :caption
			t.integer  :place_id
			t.integer  :user_id  		
		end
	end
end
