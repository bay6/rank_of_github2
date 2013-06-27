class User < ActiveRecord::Base
   attr_accessible :name, :contribute, :login, :followers, :following
   has_many :contributes
end
