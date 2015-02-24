class AddExternalIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :external_id, :string, limit: 255
    add_index :places, :external_id, unique: true
  end
end
