class CreateLog < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.text :content
      t.integer :book_id
      t.integer :pages
      t.integer :minutes
    end
  end
end
