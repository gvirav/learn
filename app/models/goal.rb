class Goal < ActiveRecord::Base
  attr_accessible :description, :due, :name

  has_many :checkpoints
end
