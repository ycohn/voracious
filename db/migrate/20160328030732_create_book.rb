class CreateBook < ActiveRecord::Migration
  def change
     create_table :books do |t|
      t.text :link
      t.string :title
      t.string :authors
    end
  end
end
