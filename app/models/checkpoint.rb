class Checkpoint < ActiveRecord::Base
  attr_accessible :complete, :deadline, :name, :purpose

  belongs_to :goal
end
