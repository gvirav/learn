class Goal < ActiveRecord::Base
  attr_accessible :description, :due, :name
  validates_presence_of :name
  has_many :checkpoints

  belongs_to :user
  has_many :notes, through: :checkpoints, :dependent => :destroy
end
