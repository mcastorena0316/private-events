class CreateEventAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendances do |t|
      t.integer :attended_event
      t.integer :attendee

      t.timestamps
    end
  end
end
