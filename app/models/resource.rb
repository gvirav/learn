class Resource < ActiveRecord::Base
  attr_accessible :category, :title, :url, :votes#, :summary
  validates_presence_of :url
  validates_presence_of :category
  validates_presence_of :title
  belongs_to :user
  before_create :add_http

  default_scope order: 'category ASC'

  def add_http
  	self.url = "http://#{url}" unless self.url =~ /http[s]?:\/\//
  end

end
