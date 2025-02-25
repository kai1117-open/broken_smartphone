class AddProgressLevelToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :progress_level, :integer, default: 0, null: false
  end
end
