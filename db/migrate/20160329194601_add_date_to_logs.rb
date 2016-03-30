class AddDateToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :created_at, :datetime
  end
end
