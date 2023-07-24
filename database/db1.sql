create database personal_crm_system_1;
use personal_crm_system_1;

-- 1
CREATE TABLE `customer_types` (
    typ_id CHAR(32),
    typ_name VARBINARY(116) NOT NULL,
    PRIMARY KEY (typ_id)
);

-- 2
CREATE TABLE `customer` (
    cus_id CHAR(32),
    cus_name VARBINARY(116) NOT NULL,
    cus_birthday VARBINARY(116) NOT NULL,
    cus_avatar VARBINARY(116) NOT NULL,
    cus_address VARBINARY(116) NOT NULL,
    cus_phone VARBINARY(116) NOT NULL,
    cus_email VARBINARY(116) NOT NULL,
    typ_id CHAR(32),
    PRIMARY KEY (cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer_types(typ_id)
);

-- 3
CREATE TABLE `work_customer` (
    wor_id CHAR(32),
    wor_current_workplace VARBINARY(116) NOT NULL,
    wor_work_history VARBINARY(116) NOT NULL,
    wor_current_position VARBINARY(116) NOT NULL,
    wor_work_temp VARBINARY(116) NOT NULL,
    cus_id CHAR(32),
    typ_id CHAR(32),
    PRIMARY KEY (wor_id),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer(typ_id)
);

-- 4
CREATE TABLE `event` (
    eve_id CHAR(32),
    eve_time_duration VARBINARY(116) NOT NULL,
    eve_content VARBINARY(116) NOT NULL,
    PRIMARY KEY (eve_id)
);

-- 5
CREATE TABLE `cus_eve` (
    eve_id CHAR(32),
    cus_id CHAR(32),
    typ_id CHAR(32),
    FOREIGN KEY (eve_id) REFERENCES event(eve_id),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer(typ_id)
);

-- 6
CREATE TABLE `habit` (
    hab_id CHAR(32),
    hab_content VARBINARY(116) NOT NULL,
    PRIMARY KEY (hab_id)
);

-- 7
CREATE TABLE `cus_hab` (
    hab_id CHAR(32),
    cus_id CHAR(32),
    typ_id CHAR(32),
    FOREIGN KEY (hab_id) REFERENCES habit(hab_id),
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
    FOREIGN KEY (typ_id) REFERENCES customer(typ_id)
);

-- 8
CREATE TABLE `position` (
    pos_id CHAR(32),
    pos_name VARBINARY(116) NOT NULL,
    PRIMARY KEY (pos_id)
);

-- 9
CREATE TABLE `level` (
    lev_id CHAR(32),
    lev_name VARBINARY(116) NOT NULL,
    PRIMARY KEY (lev_id)
);

-- 10
CREATE TABLE `unit` (
    uni_id CHAR(32),
    uni_name VARBINARY(116) NOT NULL,
    lev_id CHAR(32),
    PRIMARY KEY (uni_id),
    FOREIGN KEY (lev_id) REFERENCES level(lev_id)
);

-- 11
CREATE TABLE `employee` (
    emp_id CHAR(32),
    emp_name VARBINARY(116) NOT NULL,
    emp_birthday VARBINARY(116) NOT NULL,
    emp_address VARBINARY(116) NOT NULL,
    emp_phone VARBINARY(116) NOT NULL,
    emp_email VARBINARY(116) NOT NULL,
    pos_id CHAR(32),
    uni_id CHAR(32),
    lev_id CHAR(32),
    PRIMARY KEY (emp_id),
    FOREIGN KEY (pos_id) REFERENCES `position`(pos_id),
    FOREIGN KEY (uni_id) REFERENCES unit(uni_id),
    FOREIGN KEY (lev_id) REFERENCES unit(lev_id)
);

-- 12
CREATE TABLE `role` (
    rol_id CHAR(32),
    rol_name VARBINARY(116) NOT NULL,
    PRIMARY KEY (rol_id)
);

-- 13
CREATE TABLE `permission` (
    per_id CHAR(32),
    per_name VARBINARY(116) NOT NULL,
    PRIMARY KEY (per_id)
);

-- 14
CREATE TABLE `rol_per` (
    rol_id CHAR(32),
    per_id CHAR(32),
    FOREIGN KEY (rol_id) REFERENCES role(rol_id),
    FOREIGN KEY (per_id) REFERENCES permission(per_id)
);

-- 15
CREATE TABLE `account` (
    acc_user_name VARBINARY(116) NOT NULL,
    acc_password VARBINARY(116) NOT NULL,
    rol_id CHAR(32),
    PRIMARY KEY (acc_user_name),
    FOREIGN KEY (rol_id) REFERENCES role(rol_id)
);

-- 16
CREATE TABLE `appointment` (
    app_id CHAR(32),
    app_date VARBINARY(116) NOT NULL,
    app_content VARBINARY(116) NOT NULL,
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

-- 17
CREATE TABLE `log` (
    log_id CHAR(32),
    log_created_at VARBINARY(116) NOT NULL,
    log_content VARBINARY(116) NOT NULL,
    PRIMARY KEY (log_id)
);

-- 18
CREATE TABLE `task` (
    tas_id CHAR(32),
    tas_service_day VARBINARY(116) NOT NULL,
    tas_service_cycle VARBINARY(116) NOT NULL,
    tas_service_content VARBINARY(116) NOT NULL,
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

-- 19
CREATE TABLE `emp_tas` (
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



