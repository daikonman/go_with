class RenameScheduleColumnToMicroposts < ActiveRecord::Migration[6.1]
  def change
    rename_column :microposts, :schedule, :departure
  end
end
