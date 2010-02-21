-- MuckWork has WORKERS that do the TASKS inside PROJECTS for CLIENTS.
BEGIN;

CREATE SCHEMA muckwork;
SET search_path = muckwork;

CREATE TABLE managers (
	id serial primary key,
	person_id integer not null UNIQUE
);

CREATE TABLE clients (
	id serial primary key,
	person_id integer not null UNIQUE,
	currency char(3) not null default 'USD',
	millicents_balance integer not null default 0
);

CREATE TABLE workers (
	id serial primary key,
	person_id integer not null UNIQUE,
	rating integer not null default 50,
	currency char(3),
	millicents_per_second integer
);

CREATE TABLE projects (
	id serial primary key,
	client_id integer not null REFERENCES clients,
	lang char(2) not null default 'en',
	title text,
	description text,
	created_at timestamp(0) with time zone not null default CURRENT_TIMESTAMP,
	quoted_at timestamp(0) with time zone,
	approved_at timestamp(0) with time zone,
	started_at timestamp(0) with time zone,
	finished_at timestamp(0) with time zone,
	seconds integer,
	quoted_currency char(3),
	quoted_millicents integer,
	quoted_ratetype varchar(4),  -- time, fix
	final_currency char(3),
	final_millicents integer
);
CREATE INDEX pjci ON projects(client_id);
CREATE INDEX pjsa ON projects(started_at);
CREATE INDEX pjaa ON projects(finished_at);
	
CREATE TABLE tasks (
	id serial primary key,
	project_id integer REFERENCES projects,
	worker_id integer REFERENCES workers,
	sortid integer,
	lang char(2) not null default 'en',
	title text,
	description text,
	created_at timestamp(0) with time zone not null default CURRENT_TIMESTAMP,
	started_at timestamp(0) with time zone,
	finished_at timestamp(0) with time zone
);
CREATE INDEX tpi ON tasks(project_id);
CREATE INDEX twi ON tasks(worker_id);
CREATE INDEX tsa ON tasks(started_at);
CREATE INDEX tfa ON tasks(finished_at);

CREATE TABLE charges (
	id serial primary key,
	created_at timestamp(0) with time zone not null default CURRENT_TIMESTAMP,
	project_id integer REFERENCES projects,
	currency char(3) not null,
	millicents integer not null,
	notes text
);
CREATE INDEX chpi ON charges(project_id);

CREATE TABLE payments (
	id serial primary key,
	created_at timestamp(0) with time zone not null default CURRENT_TIMESTAMP,
	client_id integer REFERENCES clients,
	currency char(3) not null,
	millicents integer not null,
	notes text
);
CREATE INDEX pci ON payments(client_id);

CREATE TABLE worker_payments (
	id serial primary key,
	worker_id integer not null REFERENCES workers,
	currency char(3) not null,
	millicents integer,
	created_at date not null default CURRENT_DATE,
	notes text
);
CREATE INDEX wpwi ON worker_payments(worker_id);

CREATE TABLE worker_charges (
	id serial primary key,
	task_id integer not null REFERENCES tasks,
	currency char(3) not null,
	millicents integer not null,
	payment_id integer REFERENCES worker_payments  -- NULL until paid
);
CREATE INDEX wcpi ON worker_charges(payment_id);
CREATE INDEX wcti ON worker_charges(task_id);

CREATE TABLE templates (
	id serial primary key,
	title text,
	description text
);

CREATE TABLE template_tasks (
	id serial primary key,
	template_id integer REFERENCES templates,
	sortid integer,
	title text,
	description text
);
CREATE INDEX ttti ON template_tasks(template_id);

CREATE TABLE paypaltxns (
	id serial primary key,
	payment_id integer REFERENCES payments(id),
	created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
	txn_id varchar(32),
	txn_type varchar(35),
	info text,
        reconciled boolean not null default false
);
CREATE INDEX txpi ON paypaltxns(payment_id);
CREATE INDEX txrc ON paypaltxns(reconciled);

CREATE TABLE emails_projects (
	project_id integer not null REFERENCES projects,
	email_id integer not null, -- REFERENCES people::emails.id
	PRIMARY KEY (project_id, email_id)
);
CREATE INDEX eppi ON emails_projects(project_id);
CREATE INDEX epei ON emails_projects(email_id);

CREATE TABLE words (
	id serial primary key,
	code varchar(127) unique,
	lang char(2) not null default 'en',
	phrase text,
	comment text
);

COMMIT;
