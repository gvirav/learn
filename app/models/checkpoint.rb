class Checkpoint < ActiveRecord::Base
  attr_accessible :complete, :deadline, :title, :purpose

  validates_presence_of :title

  belongs_to :goal
end
