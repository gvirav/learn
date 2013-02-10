class Resource < ActiveRecord::Base
  attr_accessible :category, :title, :url, :votes
end
