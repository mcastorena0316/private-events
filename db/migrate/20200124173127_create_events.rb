class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :date
      t.integer :creator

      t.timestamps
    end
    add_index :events, :creator
  end
end
