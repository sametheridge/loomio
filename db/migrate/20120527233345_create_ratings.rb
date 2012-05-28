class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :author_id
      t.integer :message_id
      t.integer :discussion_id
      t.boolean :useful

      t.timestamps
    end
    add_index :ratings, :author_id
    add_index :ratings, :message_id
    add_index :ratings, :discussion_id
  end
end
