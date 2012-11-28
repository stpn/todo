class Task < ActiveRecord::Base
  attr_accessible :done, :user_id, :content
  belongs_to :user
  validates_presence_of :content, :message => "task cannot be blank"
	validates_presence_of :content, :with => /\S{1,}\s\S{1,}/, :on => :create, :message => "You need at least two words in a task!"
end
