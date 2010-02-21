class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :worker
  has_many :worker_charges
end
