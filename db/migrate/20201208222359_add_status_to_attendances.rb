class AddStatusToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :status, :integer
  end
end
