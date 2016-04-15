class AddColumn < ActiveRecord::Migration
  def change
    add_column :comments, :words, :string
  end
end
