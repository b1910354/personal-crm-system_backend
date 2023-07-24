create database personal_crm_system;
use personal_crm_system;

-- 2
CREATE TABLE customer (
    cus_id CHAR(32),
    cus_name VARCHAR(100),
    cus_birthday CHAR(32),
    cus_avatar VARCHAR(100),
    cus_address VARCHAR(255),
    cus_phone CHAR(12),
    cus_email VARCHAR(100),
    typ_id CHAR(32),
    PRIMARY KEY (cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer_types(typ_id)
);

-- 3
CREATE TABLE work_customer (
    wor_id CHAR(32),
    wor_current_workplace VARCHAR(255),
    wor_work_history VARCHAR(255),
    wor_current_position VARCHAR(255),
    wor_work_temp VARCHAR(50),
    cus_id CHAR(32),
    typ_id CHAR(32),
    PRIMARY KEY (wor_id),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer(typ_id)
);

-- 4
CREATE TABLE event (
    eve_id CHAR(32),
    eve_time_duration CHAR(50),
    eve_content VARCHAR(255),
    PRIMARY KEY (eve_id)
);

-- 5
CREATE TABLE cus_eve (
    eve_id CHAR(32),
    cus_id CHAR(32),
    typ_id CHAR(32),
    FOREIGN KEY (eve_id) REFERENCES event(eve_id),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer(typ_id)
);

-- 6
CREATE TABLE habit (
    hab_id CHAR(32),
    hab_content VARCHAR(255),
    PRIMARY KEY (hab_id)
);

-- 7
CREATE TABLE cus_hab (
    hab_id CHAR(32),
    cus_id CHAR(32),
    typ_id CHAR(32),
    FOREIGN KEY (hab_id) REFERENCES habit(hab_id),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer(typ_id)
);

-- 1
CREATE TABLE customer_types (
    typ_id CHAR(32),
    typ_name VARCHAR(100),
    PRIMARY KEY (typ_id)
);

-- 11
CREATE TABLE employee (
    emp_id CHAR(32),
    emp_name VARCHAR(100),
    emp_birthday CHAR(50),
    emp_address VARCHAR(255),
    emp_phone CHAR(12),
    emp_email VARCHAR(100),
    pos_id CHAR(32),
    uni_id CHAR(32),
    lev_id CHAR(32),
    PRIMARY KEY (emp_id),
    FOREIGN KEY (pos_id) REFERENCES `position`(pos_id),
    FOREIGN KEY (uni_id) REFERENCES unit(uni_id),
    FOREIGN KEY (lev_id) REFERENCES unit(lev_id)
);

-- 8
CREATE TABLE position (
    pos_id CHAR(32),
    pos_name VARCHAR(255),
    PRIMARY KEY (pos_id)
);

-- 10
CREATE TABLE unit (
    uni_id CHAR(32),
    uni_name VARCHAR(255),
    lev_id CHAR(32),
    PRIMARY KEY (uni_id),
    FOREIGN KEY (lev_id) REFERENCES level(lev_id)
);

-- 9
CREATE TABLE level (
    lev_id CHAR(32),
    lev_name VARCHAR(255),
    PRIMARY KEY (lev_id)
);

-- 15
CREATE TABLE account (
    acc_user_name VARCHAR(100),
    acc_password CHAR(50),
    rol_id CHAR(32),
    PRIMARY KEY (acc_user_name),
    FOREIGN KEY (rol_id) REFERENCES role(rol_id)
);

-- 12
CREATE TABLE role (
    rol_id CHAR(32),
    rol_name VARCHAR(255),
    PRIMARY KEY (rol_id)
);

-- 13
CREATE TABLE permission (
    per_id CHAR(32),
    per_name VARCHAR(255),
    PRIMARY KEY (per_id)
);

-- 14
CREATE TABLE rol_per (
    rol_id CHAR(32),
    per_id CHAR(32),
    FOREIGN KEY (rol_id) REFERENCES role(rol_id),
    FOREIGN KEY (per_id) REFERENCES permission(per_id)
);

-- 17
CREATE TABLE task (
    tas_id CHAR(32),
    tas_service_day CHAR(24),
    tas_service_cycle CHAR(24),
    tas_service_content VARCHAR(255),
    cus_id CHAR(32),
    typ_id CHAR(32),
    emp_id CHAR(32),
    pos_id CHAR(32),
    uni_id CHAR(32),
    lev_id CHAR(32),
    PRIMARY KEY (tas_id),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer(typ_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (uni_id) REFERENCES employee(uni_id),
    FOREIGN KEY (pos_id) REFERENCES employee(pos_id),
    FOREIGN KEY (lev_id) REFERENCES employee(lev_id)
);

-- 18
CREATE TABLE emp_tas (
    tas_id CHAR(32),
    cus_id CHAR(32),
    typ_id CHAR(32),
    emp_id CHAR(32),
    pos_id CHAR(32),
    uni_id CHAR(32),
    lev_id CHAR(32),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (uni_id) REFERENCES employee(uni_id),
    FOREIGN KEY (pos_id) REFERENCES employee(pos_id),
    FOREIGN KEY (lev_id) REFERENCES employee(lev_id),
    FOREIGN KEY (tas_id) REFERENCES task(tas_id),
    FOREIGN KEY (cus_id) REFERENCES task(cus_id),
    FOREIGN KEY (typ_id) REFERENCES task(typ_id),
    FOREIGN KEY (emp_id) REFERENCES task(emp_id),
    FOREIGN KEY (uni_id) REFERENCES task(uni_id),
    FOREIGN KEY (pos_id) REFERENCES task(pos_id),
    FOREIGN KEY (lev_id) REFERENCES task(lev_id)
);

-- 15
CREATE TABLE appointment (
    app_id CHAR(32),
    app_date CHAR(24),
    app_content VARCHAR(255),
    cus_id CHAR(32),
    typ_id CHAR(32),
    emp_id CHAR(32),
    pos_id CHAR(32),
    uni_id CHAR(32),
    lev_id CHAR(32),
    PRIMARY KEY (app_id),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer(typ_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id),
    FOREIGN KEY (uni_id) REFERENCES employee(uni_id),
    FOREIGN KEY (pos_id) REFERENCES employee(pos_id),
    FOREIGN KEY (lev_id) REFERENCES employee(lev_id)
);

-- 16
CREATE TABLE log (
    log_id CHAR(32),
    log_created_at CHAR(24),
    log_content VARCHAR(255),
    PRIMARY KEY (log_id)
);


