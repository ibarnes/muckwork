class Payment < ActiveRecord::Base
  belongs_to :client
  has_one :paypaltxn
end
