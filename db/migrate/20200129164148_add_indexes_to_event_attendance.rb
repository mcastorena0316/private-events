class AddIndexesToEventAttendance < ActiveRecord::Migration[6.0]
  def change
    add_index :event_attendances, [:attended_event, :created_at]

  end
end
