class Checkpoint < ActiveRecord::Base
  attr_accessible :complete, :deadline, :title, :purpose

  belongs_to :goal
end
