class ChangeColumnToStatus < ActiveRecord::Migration
  def up
    Task.where( status: nil ).update_all( status: "incomplete" )
    Task.where( status: "" ).update_all( status: "incomplete" )
    change_column :tasks, :status, :string, default: "incomplete"
  end

  def down
  end
end
