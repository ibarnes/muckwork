class WorkerPayment < ActiveRecord::Base
  belongs_to :worker
  # TODO: has_one :worker_charge  # payment_id integer REFERENCES worker_payments
end
