# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "charges", :force => true do |t|
    t.timestamp "created_at", :limit => 0, :null => false
    t.integer   "project_id"
    t.string    "currency",   :limit => 3, :null => false
    t.integer   "millicents",              :null => false
    t.text      "notes"
  end

  add_index "charges", ["project_id"], :name => "chpi"

  create_table "clients", :force => true do |t|
    t.integer "person_id",                                          :null => false
    t.string  "currency",           :limit => 3, :default => "USD", :null => false
    t.integer "millicents_balance",              :default => 0,     :null => false
  end

  add_index "clients", ["person_id"], :name => "clients_person_id_key", :unique => true

  create_table "emails_projects", :id => false, :force => true do |t|
    t.integer "project_id", :null => false
    t.integer "email_id",   :null => false
  end

  add_index "emails_projects", ["email_id"], :name => "epei"
  add_index "emails_projects", ["project_id"], :name => "eppi"

  create_table "managers", :force => true do |t|
    t.integer "person_id", :null => false
  end

  add_index "managers", ["person_id"], :name => "managers_person_id_key", :unique => true

  create_table "payments", :force => true do |t|
    t.timestamp "created_at", :limit => 0, :null => false
    t.integer   "client_id"
    t.string    "currency",   :limit => 3, :null => false
    t.integer   "millicents",              :null => false
    t.text      "notes"
  end

  add_index "payments", ["client_id"], :name => "pci"

  create_table "paypaltxns", :force => true do |t|
    t.integer  "payment_id"
    t.datetime "created_at"
    t.string   "txn_id",     :limit => 32
    t.string   "txn_type",   :limit => 35
    t.text     "info"
    t.boolean  "reconciled",               :default => false, :null => false
  end

  add_index "paypaltxns", ["payment_id"], :name => "txpi"
  add_index "paypaltxns", ["reconciled"], :name => "txrc"

  create_table "projects", :force => true do |t|
    t.integer   "client_id",                                        :null => false
    t.string    "lang",              :limit => 2, :default => "en", :null => false
    t.text      "title"
    t.text      "description"
    t.timestamp "created_at",        :limit => 0,                   :null => false
    t.timestamp "quoted_at",         :limit => 0
    t.timestamp "approved_at",       :limit => 0
    t.timestamp "started_at",        :limit => 0
    t.timestamp "finished_at",       :limit => 0
    t.integer   "seconds"
    t.string    "quoted_currency",   :limit => 3
    t.integer   "quoted_millicents"
    t.string    "quoted_ratetype",   :limit => 4
    t.string    "final_currency",    :limit => 3
    t.integer   "final_millicents"
  end

  add_index "projects", ["client_id"], :name => "pjci"
  add_index "projects", ["finished_at"], :name => "pjaa"
  add_index "projects", ["started_at"], :name => "pjsa"

  create_table "tasks", :force => true do |t|
    t.integer   "project_id"
    t.integer   "worker_id"
    t.integer   "sortid"
    t.string    "lang",        :limit => 2, :default => "en", :null => false
    t.text      "title"
    t.text      "description"
    t.timestamp "created_at",  :limit => 0,                   :null => false
    t.timestamp "started_at",  :limit => 0
    t.timestamp "finished_at", :limit => 0
  end

  add_index "tasks", ["finished_at"], :name => "tfa"
  add_index "tasks", ["project_id"], :name => "tpi"
  add_index "tasks", ["started_at"], :name => "tsa"
  add_index "tasks", ["worker_id"], :name => "twi"

  create_table "template_tasks", :force => true do |t|
    t.integer "template_id"
    t.integer "sortid"
    t.text    "title"
    t.text    "description"
  end

  add_index "template_tasks", ["template_id"], :name => "ttti"

  create_table "templates", :force => true do |t|
    t.text "title"
    t.text "description"
  end

  create_table "words", :force => true do |t|
    t.string "code",    :limit => 127
    t.string "lang",    :limit => 2,   :default => "en", :null => false
    t.text   "phrase"
    t.text   "comment"
  end

  add_index "words", ["code"], :name => "words_code_key", :unique => true

  create_table "worker_charges", :force => true do |t|
    t.integer "task_id",                 :null => false
    t.string  "currency",   :limit => 3, :null => false
    t.integer "millicents",              :null => false
    t.integer "payment_id"
  end

  add_index "worker_charges", ["payment_id"], :name => "wcpi"
  add_index "worker_charges", ["task_id"], :name => "wcti"

  create_table "worker_payments", :force => true do |t|
    t.integer "worker_id",               :null => false
    t.string  "currency",   :limit => 3, :null => false
    t.integer "millicents"
    t.date    "created_at",              :null => false
    t.text    "notes"
  end

  add_index "worker_payments", ["worker_id"], :name => "wpwi"

  create_table "workers", :force => true do |t|
    t.integer "person_id",                                          :null => false
    t.integer "rating",                             :default => 50, :null => false
    t.string  "currency",              :limit => 3
    t.integer "millicents_per_second"
  end

  add_index "workers", ["person_id"], :name => "workers_person_id_key", :unique => true

end
