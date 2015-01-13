class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :user
      t.text :content
      t.timestamps
    end

    add_index :lists, :user_id
  end
end
