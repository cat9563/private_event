class AddEventToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :event, foreign_key: true
  end
end
