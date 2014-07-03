DROP TABLE IF EXISTS analysis;
DROP TABLE IF EXISTS signature;
DROP TABLE IF EXISTS task;
DROP TABLE IF EXISTS cuckoo_server;
DROP TABLE IF EXISTS metadata;
DROP TABLE IF EXISTS source_types;
DROP TABLE IF EXISTS local_source;
DROP TABLE IF EXISTS remote_source;
DROP TABLE IF EXISTS configuration;
DROP TABLE IF EXISTS triggz;

CREATE TABLE triggz ( triggz_id INTEGER PRIMARY KEY AUTOINCREMENT, task_id INTEGER, label TEXT, description TEXT, criticity INTEGER);
CREATE TABLE analysis (analysis_id INTEGER PRIMARY KEY AUTOINCREMENT, cuckoo_id INTEGER, kernel_analysis INTEGER, state INTEGER, total_score INTEGER DEFAULT 0, cuckoo_server_id INTEGER, task_id INTEGER);
CREATE TABLE signature (signature_id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, score INTEGER DEFAULT 0, analysis_id INTEGER);
CREATE TABLE task (task_id INTEGER PRIMARY KEY AUTOINCREMENT, md5 TEXT);
CREATE TABLE cuckoo_server (cuckoo_server_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, server_addr TEXT, ssh_port INTEGER, username TEXT, password TEXT, cuckoo_path TEXT, vms_count INTEGER DEFAULT 0, is_active INTEGER DEFAULT 0);
CREATE TABLE submition (submition_id INTEGER PRIMARY KEY AUTOINCREMENT, time TEXT, source_type INTEGER, source_id INTEGER, task_id INTEGER);
CREATE TABLE metadata (metadata_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, value TEXT, submition_id INTEGER);
CREATE TABLE source_types(source_type_id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT);
CREATE TABLE state_types(state_type_id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT);
CREATE TABLE local_source(local_source_id INTEGER PRIMARY KEY AUTOINCREMENT, lookup_folder TEXT, is_active INTEGER DEFAULT 0);
CREATE TABLE remote_source(remote_source_id INTEGER PRIMARY KEY AUTOINCREMENT, remote_ip_addr TEXT, is_active INTEGER DEFAULT 0);
CREATE TABLE configuration(parse_metadata INTEGER DEFAULT 0, auto_download_reports INTEGER DEFAULT 0, kernelmode_score_medium INTEGER DEFAULT 10, kernelmode_score_high INTEGER DEFAULT 20, usermode_score_medium INTEGER DEFAULT 10, usermode_score_high INTEGER DEFAULT 20, enable_usermode_analysis INTEGER DEFAULT 0, enable_kernelmode_analysis INTEGER DEFAULT 0, usermode_timeout INTEGER DEFAULT 90, kernelmode_timeout INTEGER DEFAULT 90, sampling INTEGER DEFAULT 100);
CREATE TABLE w_user(user_id INTEGER PRIMARY KEY AUTOINCREMENT, login TEXT, password TEXT, is_active INTEGER DEFAULT 0, group_id INTEGER DEFAULT 0, access_rights INTEGER DEFAULT 0);
CREATE TABLE w_group(group_id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, is_active INTEGER DEFAULT 0, access_rights INTEGER DEFAULT 0);

INSERT INTO configuration VALUES (1,1,10,20,10,20,1,1,90,90,100);
INSERT INTO state_types(state_type_id,title) VALUES(0,"not dispatched");
INSERT INTO state_types(state_type_id,title) VALUES(1,"running");
INSERT INTO state_types(state_type_id,title) VALUES(2,"finished");
INSERT INTO state_types(state_type_id,title) VALUES(3,"reported");
INSERT INTO state_types(state_type_id,title) VALUES(4,"failed");
INSERT INTO source_types(source_type_id,title) VALUES(0,"not defined");
INSERT INTO source_types(source_type_id,title) VALUES(1,"local");
INSERT INTO source_types(source_type_id,title) VALUES(2,"remote");
INSERT INTO source_types(source_type_id,title) VALUES(3,"manual");
