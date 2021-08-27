class AddDetailsToMicroposts < ActiveRecord::Migration[6.1]
  def change
    add_column :microposts, :amount, :integer
    add_column :microposts, :schedule, :date
  end
end
