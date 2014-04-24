class AddHappyHoursToPlaces < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.references :place
      t.string :starts_at, default: "15:00"
      t.string :ends_at, default: "18:00"
      t.integer :start_day, default: 1
      t.integer :end_day, default: 5
      t.text :details

      t.timestamps
    end

    add_index :specials, :place_id
  end
end
