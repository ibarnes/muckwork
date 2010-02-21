class Client < ActiveRecord::Base
  has_many :projects
  has_many :payments
end
