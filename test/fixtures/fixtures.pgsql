BEGIN;

INSERT INTO clients (id, person_id, currency, millicents_balance) VALUES (1, 6, 'EUR', 30000); -- augustus
INSERT INTO clients (id, person_id, currency, millicents_balance) VALUES (2, 7, 'GBP', 400000); -- veruca

INSERT INTO managers (id, person_id) VALUES (1, 1); -- sivers
INSERT INTO managers (id, person_id) VALUES (2, 5); -- wonka

INSERT INTO workers (id, person_id, rating, currency, millicents_per_second) VALUES (1, 2, 70, 'EUR', 41); -- sage
INSERT INTO workers (id, person_id, rating, currency, millicents_per_second) VALUES (2, 3, 60, 'JPY', 39); -- yoko

INSERT INTO projects (id, client_id, lang, title, description, created_at, quoted_at, approved_at, started_at, finished_at, seconds, quoted_currency, quoted_millicents, quoted_ratetype, final_currency, final_millicents) VALUES
 (1, 1, 'en', 'Wash My Car in Tokyo', 'Get it really clean!', '2008-11-24 00:30:14+00', '2008-11-24 00:40:14+00', '2008-11-24 12:30:14+00', '2008-11-25 00:30:14+00', '2008-11-26 00:30:14+00', 1329, 'EUR', 70000, 'fix', 'EUR', 70000);
INSERT INTO projects (id, client_id, lang, title, description, created_at, quoted_at, approved_at, started_at, finished_at, seconds, quoted_currency, quoted_millicents, quoted_ratetype, final_currency, final_millicents) VALUES
 (2, 2, 'en', 'Solve My Life', 'I am stumped.', '2008-11-25 00:30:14+00', '2008-11-25 05:30:14+00', '2008-11-25 11:30:14+00', '2008-11-25 02:30:14+00', NULL, 3665, 'GBP', 80000, 'hour', 'GBP', NULL);
INSERT INTO projects (id, client_id, lang, title, description, created_at, quoted_at, approved_at, started_at, finished_at, seconds, quoted_currency, quoted_millicents, quoted_ratetype, final_currency, final_millicents) VALUES
 (3, 1, 'en', 'Wake Me Up', 'In the morning.', '2008-11-28 03:20:44+00', '2008-11-28 09:20:44+00', NULL, NULL, NULL, NULL, 'EUR', 10000, 'fix', 'EUR', NULL);

INSERT INTO tasks (id, project_id, worker_id, sortid, lang, title, description, created_at, started_at, finished_at) VALUES
 (1, 1, 2, 3, 'ja', 'の売', 'を徴収', '2008-11-24 06:50:17+00', '2008-11-25 00:52:17+00', '2008-11-25 00:54:19+00');
INSERT INTO tasks (id, project_id, worker_id, sortid, lang, title, description, created_at, started_at, finished_at) VALUES
 (2, 1, 2, 2, 'ja', '販売', 'だけを', '2008-11-24 06:50:17+00', '2008-11-25 00:32:17+00', '2008-11-25 00:51:19+00');
INSERT INTO tasks (id, project_id, worker_id, sortid, lang, title, description, created_at, started_at, finished_at) VALUES
 (3, 1, 2, 1, 'ja', '徴販', '徴を', '2008-11-24 06:50:17+00', '2008-11-25 00:30:14+00', '2008-11-25 00:31:19+00');
INSERT INTO tasks (id, project_id, worker_id, sortid, lang, title, description, created_at, started_at, finished_at) VALUES
 (4, 2, 1, 1, 'en', 'Ask what''s wrong', 'Call and ask Are you OK?', '2008-11-25 01:30:14+00', '2008-11-25 02:30:14+00', '2008-11-25 03:31:19+00');
INSERT INTO tasks (id, project_id, worker_id, sortid, lang, title, description, created_at, started_at, finished_at) VALUES
 (5, 2, 1, 2, 'en', 'Do nothing together', 'Sit on the phone for years.', '2008-11-25 01:30:14+00', '2008-11-27 11:25:14+00', NULL);
INSERT INTO tasks (id, project_id, worker_id, sortid, lang, title, description, created_at, started_at, finished_at) VALUES
 (6, 2, 1, 3, 'en', 'Find role model', 'Find a role model based on ideal.', '2008-11-25 01:30:14+00', NULL, NULL);
INSERT INTO tasks (id, project_id, worker_id, sortid, lang, title, description, created_at, started_at, finished_at) VALUES
 (7, 3, 1, 1, 'en', 'Call at 7am', 'Phone +1-212-555-1212 and say wake up.', '2008-11-29 18:24:14+00', NULL, NULL);

INSERT INTO payments (id, created_at, client_id, currency, millicents, notes) VALUES (1, '2008-11-01 00:30:00+00', 1, 'EUR', 50000, 'PayPal transaction ID#: 1313a878bf');
INSERT INTO payments (id, created_at, client_id, currency, millicents, notes) VALUES (2, '2008-11-15 13:15:00+00', 2, 'GBP', 400000, 'PayPal transaction ID#: xx13a878bf');
INSERT INTO payments (id, created_at, client_id, currency, millicents, notes) VALUES (3, '2008-11-20 09:30:55+00', 1, 'EUR', 50000, 'PayPal transaction ID#: xx13a878bg');

INSERT INTO charges (id, created_at, project_id, currency, millicents, notes) VALUES (1, '2008-11-26 00:30:14+00', 1, 'EUR', 70000, '');

INSERT INTO worker_payments (id, worker_id, currency, millicents, created_at, notes) VALUES (1, 2, 'JPY', 3500, '2008-11-29', 'PayPal');

INSERT INTO worker_charges (id, task_id, currency, millicents, payment_id) VALUES (1, 3, 'JPY', 2500, 1);
INSERT INTO worker_charges (id, task_id, currency, millicents, payment_id) VALUES (2, 2, 'JPY', 44500, 1);
INSERT INTO worker_charges (id, task_id, currency, millicents, payment_id) VALUES (3, 1, 'JPY', 4700, 1);
INSERT INTO worker_charges (id, task_id, currency, millicents, payment_id) VALUES (4, 4, 'EUR', 150300, NULL);

INSERT INTO templates (id, title, description) VALUES (1, 'Walk the Dog', 'Walk him real good.');
INSERT INTO template_tasks (id, template_id, sortid, title, description) VALUES (1, 1, 3, 'Open door.', 'Bring key.');
INSERT INTO template_tasks (id, template_id, sortid, title, description) VALUES (2, 1, 1, 'Get the leash.', 'Hanging on the hook.');
INSERT INTO template_tasks (id, template_id, sortid, title, description) VALUES (3, 1, 2, 'Put on collar.', 'Not too loose.');
INSERT INTO template_tasks (id, template_id, sortid, title, description) VALUES (4, 1, 4, 'Walk around.', 'Until poops.');
INSERT INTO template_tasks (id, template_id, sortid, title, description) VALUES (5, 1, 5, 'Come home.', 'Take of collar.');

INSERT INTO paypaltxns (id, payment_id, created_at, txn_id, txn_type, info, reconciled) VALUES (1, 1, NOW(), '1313a878bf', 'web_accept', 'transaction_subject = Augustus Gloop muckwork.com balance
payment_date = 09:49:49 Sep 11, 2009 PDT
txn_type = web_accept
first_name = Augustus
last_name = Gloop
residence_country = DE
item_name = Augustus Gloop muckwork.com balance
mc_currency = EUR
mc_gross = 5.00
business = muckwork@muckwork.com
payment_type = instant
payer_status = verified
payer_email = augustus@gloop.com
txn_id = 1313a878bf
quantity = 1
receiver_email = muckwork@muckwork.com
payer_id = 9F6YYD8DKZE4Q
receiver_id = XX7UP87AEABXW
item_number = 1
custom = PERSON_ID=6 CLIENT_ID=1
payment_status = Completed', 't');

INSERT INTO paypaltxns (id, payment_id, created_at, txn_id, txn_type, info, reconciled) VALUES (2, 2, NOW(), 'xx13a878bf', 'web_accept', 'transaction_subject = Veruca Salt muckwork.com balance
payment_date = 09:49:46 Sep 12, 2009 PDT
txn_type = web_accept
first_name = Veruca
last_name = Salt
residence_country = UK
item_name = Veruca Salt muckwork.com balance
mc_currency = GBP
mc_gross = 40.00
business = muckwork@muckwork.com
payment_type = instant
payer_status = verified
payer_email = veruca@salt.com
txn_id = xx13a878bf
quantity = 1
receiver_email = muckwork@muckwork.com
payer_id = 7F6YYD8DKZE4Q
receiver_id = XX7UP87AEABXW
item_number = 3
custom = PERSON_ID=7 CLIENT_ID=2
payment_status = Completed', 't');

INSERT INTO paypaltxns (id, payment_id, created_at, txn_id, txn_type, info, reconciled) VALUES (3, 3, NOW(), 'xx13a878bg', 'web_accept', 'transaction_subject = Augustus Gloop muckwork.com balance
payment_date = 09:49:49 Sep 14, 2009 PDT
txn_type = web_accept
first_name = Augustus
last_name = Gloop
residence_country = DE
item_name = Augustus Gloop muckwork.com balance
mc_currency = EUR
mc_gross = 5.00
business = muckwork@muckwork.com
payment_type = instant
payer_status = verified
payer_email = augustus@gloop.com
txn_id = xx13a878bg
quantity = 1
receiver_email = muckwork@muckwork.com
payer_id = 9F6YYD8DKZE4Q
receiver_id = XX7UP87AEABXW
item_number = 1
custom = PERSON_ID=6 CLIENT_ID=1
payment_status = Completed', 't');

INSERT INTO emails_projects (project_id, email_id) VALUES (2, 1);
INSERT INTO emails_projects (project_id, email_id) VALUES (2, 2);

COMMIT;

BEGIN;
SELECT pg_catalog.setval('clients_id_seq', (SELECT MAX(id) FROM clients) + 1, false);
SELECT pg_catalog.setval('managers_id_seq', (SELECT MAX(id) FROM managers) + 1, false);
SELECT pg_catalog.setval('workers_id_seq', (SELECT MAX(id) FROM workers) + 1, false);
SELECT pg_catalog.setval('projects_id_seq', (SELECT MAX(id) FROM projects) + 1, false);
SELECT pg_catalog.setval('tasks_id_seq', (SELECT MAX(id) FROM tasks) + 1, false);
SELECT pg_catalog.setval('payments_id_seq', (SELECT MAX(id) FROM payments) + 1, false);
SELECT pg_catalog.setval('charges_id_seq', (SELECT MAX(id) FROM charges) + 1, false);
SELECT pg_catalog.setval('worker_payments_id_seq', (SELECT MAX(id) FROM worker_payments) + 1, false);
SELECT pg_catalog.setval('worker_charges_id_seq', (SELECT MAX(id) FROM worker_charges) + 1, false);
SELECT pg_catalog.setval('templates_id_seq', (SELECT MAX(id) FROM templates) + 1, false);
SELECT pg_catalog.setval('template_tasks_id_seq', (SELECT MAX(id) FROM template_tasks) + 1, false);
SELECT pg_catalog.setval('paypaltxns_id_seq', (SELECT MAX(id) FROM paypaltxns) + 1, false);
COMMIT;

