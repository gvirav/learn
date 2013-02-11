class Resource < ActiveRecord::Base
  attr_accessible :category, :title, :url, :votes
  validates_presence_of :url
  belongs_to :user

  default_scope order: 'category ASC' 

  def add_http
  	self.url = "http://#{url}" unless self.url =~ /http[s]?:\/\//
  end

end
