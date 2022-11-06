class AddLocations < ActiveRecord::Migration[7.0]
  def up
    create_table :locations do |t|
      t.string :name
      t.string :link
    end
  end

  def down
    drop_table :locations
  end
end
