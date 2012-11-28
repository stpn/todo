class Task < ActiveRecord::Base
  attr_accessible :done, :user_id, :content
  belongs_to :user


end
