class Note < ActiveRecord::Base
  attr_accessible :body, :url

  belongs_to :checkpoint
end
