class UserRole < ActiveRecord::Base
  attr_accessible :role, :user_id
  belongs_to :user
end
