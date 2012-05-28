class Discussion < ActiveRecord::Base
  attr_accessible :group, :title, :group_id, :message_attributes, :message_id
  validates_presence_of :title, :group, :message
  validates :title, :length => { :maximum => 150 }
  belongs_to :group
  has_many :motions
  belongs_to :message
  accepts_nested_attributes_for :message
end
