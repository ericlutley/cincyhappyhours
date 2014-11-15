class AddFacebookIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :facebook_id, :string
    add_index :places, :facebook_id, unique: true
  end
end
