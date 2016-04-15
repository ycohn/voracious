class RemoveColumn < ActiveRecord::Migration
  def change
    remove_column :comments, :content 
  end
end
