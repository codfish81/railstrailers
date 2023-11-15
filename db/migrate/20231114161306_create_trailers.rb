class CreateTrailers < ActiveRecord::Migration[7.0]
  def change
    create_table :trailers do |t|
      t.integer :trailer_number
      t.integer :order_number
      t.string :trucking_company
      t.integer :truck_number
      t.string :trailer_location
      t.integer :dock_number
      t.string :live_load
      t.timestamp :timer

      t.timestamps
    end
  end
end
