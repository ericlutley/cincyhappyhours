class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :image_url
      t.boolean :admin, :default => false, :null => false

      t.timestamps
    end
  end
end
