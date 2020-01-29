class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :events, :creator
  end
end
