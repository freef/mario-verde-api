class AddConsoleToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :console, :string
  end
end
