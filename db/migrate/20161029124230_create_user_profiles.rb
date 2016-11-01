class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :tagline
    	t.text :bio
    	t.string :facebook_id
    	t.string :twitter_id

      t.timestamps null: false
    end
  end
end
