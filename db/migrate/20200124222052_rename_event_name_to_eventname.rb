class RenameEventNameToEventname < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :name, :eventname
  end
end
