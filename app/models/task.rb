class Task < ActiveRecord::Base
  attr_accessible :content, :group_id, :sort, :status, :user_id

  belongs_to :user
end
