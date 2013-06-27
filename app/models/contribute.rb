class Contribute < ActiveRecord::Base
  attr_accessible :user_id, :score
  belongs_to :user
end
