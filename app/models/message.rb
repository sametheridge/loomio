class Message < ActiveRecord::Base
  attr_accessible :ancestry, :author_id, :body, :parent_id
  belongs_to :author, class_name: 'User'
  has_ancestry
end
