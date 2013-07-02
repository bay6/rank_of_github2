class Contribute < ActiveRecord::Base
  attr_accessible :user_id, :score
  belongs_to :user

  def score
  	read_attribute(:score).tr(',','').to_i
  end
end
