class Worker < ActiveRecord::Base
  has_many :tasks
  has_many :worker_payments
end
