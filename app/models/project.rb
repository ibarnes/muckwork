class Project < ActiveRecord::Base
  belongs_to :client
  has_many :tasks
  has_many :charges
  # TODO: has_and_belongs_to_many :emails
end
