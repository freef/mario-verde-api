class AddTimeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :time, :time
  end
end
