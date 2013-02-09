class Checkpoint < ActiveRecord::Base
  attr_accessible :complete, :deadline, :title, :purpose
  has_many :notes
  belongs_to :goal
end
