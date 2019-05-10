class RenameTableAttndaceToAttendance < ActiveRecord::Migration[5.2]
  def change
    rename_table :attndaces, :attendances
  end
end
