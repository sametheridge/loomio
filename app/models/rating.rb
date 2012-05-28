class Rating < ActiveRecord::Base
  attr_accessible :author_id, :discussion_id, :message_id, :useful
  belongs_to :message
  belongs_to :discussion
  belongs_to :author, class_name: 'User'
  validates_presence_of :author, :discussion, :message, :useful
end
