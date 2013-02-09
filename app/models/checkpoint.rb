class Checkpoint < ActiveRecord::Base
  attr_accessible :complete, :deadline, :title, :purpose
  validates_presence_of :title
  has_many :notes
  belongs_to :goal
end
