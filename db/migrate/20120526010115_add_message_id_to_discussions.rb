class AddMessageIdToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :message_id, :integer
  end
end
