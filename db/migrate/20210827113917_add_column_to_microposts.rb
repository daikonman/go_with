class AddColumnToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :back, :date
  end
end
