class WorkerCharge < ActiveRecord::Base
  belongs_to :task
  # TODO: belongs_to :worker_payment   # payment_id integer REFERENCES worker_payments
end
