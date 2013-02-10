class Note < ActiveRecord::Base
  attr_accessible :body, :url
  validates_presence_of :body
  belongs_to :checkpoint
  has_one :user, through: :checkpoint
end
