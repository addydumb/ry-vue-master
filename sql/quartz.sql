DROP TABLE IF EXISTS QRTZ_FIRED_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_PAUSED_TRIGGER_GRPS;
DROP TABLE IF EXISTS QRTZ_SCHEDULER_STATE;
DROP TABLE IF EXISTS QRTZ_LOCKS;
DROP TABLE IF EXISTS QRTZ_SIMPLE_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_SIMPROP_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_CRON_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_BLOB_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_TRIGGERS;
DROP TABLE IF EXISTS QRTZ_JOB_DETAILS;
DROP TABLE IF EXISTS QRTZ_CALENDARS;

-- ----------------------------
-- 1. Stores details for each configured jobDetail
-- ----------------------------
create table QRTZ_JOB_DETAILS (
    sched_name           varchar(120)    not null            comment 'schedule name',
    job_name             varchar(200)    not null            comment 'Task name',
    job_group            varchar(200)    not null            comment 'Task group name',
    description          varchar(250)    null                comment 'Related introduction',
    job_class_name       varchar(250)    not null            comment 'Execution task class name',
    is_durable           varchar(1)      not null            comment 'Whether to persist',
    is_nonconcurrent     varchar(1)      not null            comment 'Is it concurrent?',
    is_update_data       varchar(1)      not null            comment 'Whether to update data',
    requests_recovery    varchar(1)      not null            comment 'Whether to accept resume execution',
    job_data             blob            null                comment 'Store persistent job objects',
    primary key (sched_name, job_name, job_group)
) engine=innodb comment = 'Task details table';

-- ----------------------------
-- 2. Stores information about configured Triggers
-- ----------------------------
create table QRTZ_TRIGGERS (
    sched_name           varchar(120)    not null            comment 'Schedule name',
    trigger_name         varchar(200)    not null            comment 'Trigger name',
    trigger_group        varchar(200)    not null            comment 'The name of the group to which the trigger belongs',
    job_name             varchar(200)    not null            comment 'qrtz_job_details table job_name foreign key',
    job_group            varchar(200)    not null            comment 'qrtz_job_details table job_group foreign key',
    description          varchar(250)    null                comment 'Related introduction',
    next_fire_time       bigint(13)      null                comment 'Last trigger time (milliseconds)',
    prev_fire_time       bigint(13)      null                comment 'Next trigger time (default is -1 means no trigger)',
    priority             integer         null                comment 'Priority',
    trigger_state        varchar(16)     not null            comment 'trigger state',
    trigger_type         varchar(8)      not null            comment 'Type of trigger',
    start_time           bigint(13)      not null            comment 'start time',
    end_time             bigint(13)      null                comment 'end time',
    calendar_name        varchar(200)    null                comment 'schedule name',
    misfire_instr        smallint(2)     null                comment 'Compensation execution strategies',
    job_data             blob            null                comment 'Store persistent job objects',
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, job_name, job_group) references QRTZ_JOB_DETAILS(sched_name, job_name, job_group)
) engine=innodb comment = 'Trigger details table';

-- ----------------------------
-- 3. Store a simple Trigger, including the number of repetitions, the interval, and the number of times it has been triggered
-- ----------------------------
create table QRTZ_SIMPLE_TRIGGERS (
    sched_name           varchar(120)    not null            comment 'schedule name',
    trigger_name         varchar(200)    not null            comment 'qrtz_triggers table trigger_name foreign key',
    trigger_group        varchar(200)    not null            comment 'qrtz_triggers table trigger_group foreign key',
    repeat_count         bigint(7)       not null            comment 'Count of repetitions',
    repeat_interval      bigint(12)      not null            comment 'Repeat interval',
    times_triggered      bigint(10)      not null            comment 'Number of times it has been triggered',
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, trigger_name, trigger_group) references QRTZ_TRIGGERS(sched_name, trigger_name, trigger_group)
) engine=innodb comment = 'Information table for simple triggers';

-- ----------------------------
-- 4. Stores Cron Triggers, including Cron expressions and time zone information
-- ----------------------------
create table QRTZ_CRON_TRIGGERS (
    sched_name           varchar(120)    not null            comment 'schedule name',
    trigger_name         varchar(200)    not null            comment 'qrtz_triggers table trigger_name foreign key',
    trigger_group        varchar(200)    not null            comment 'qrtz_triggers table trigger_group foreign key',
    cron_expression      varchar(200)    not null            comment 'cron expression',
    time_zone_id         varchar(80)                         comment 'time zone',
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, trigger_name, trigger_group) references QRTZ_TRIGGERS(sched_name, trigger_name, trigger_group)
) engine=innodb comment = 'Cron type trigger table';

-- ----------------------------
-- 5. Trigger as Blob type storage(used for Quartz For users JDBC Create their own customized Trigger type，JobStore When you don’t know how to store instances)
-- ----------------------------
create table QRTZ_BLOB_TRIGGERS (
    sched_name           varchar(120)    not null            comment 'schedule name',
    trigger_name         varchar(200)    not null            comment 'qrtz_triggers table trigger_name foreign key',
    trigger_group        varchar(200)    not null            comment 'qrtz_triggers table trigger_group foreign key',
    blob_data            blob            null                comment 'Store persistent Trigger objects',
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, trigger_name, trigger_group) references QRTZ_TRIGGERS(sched_name, trigger_name, trigger_group)
) engine=innodb comment = 'Blob Trigger table of type';

-- ----------------------------
-- 6. Calendar information is stored in Blob type. quartz can configure a calendar to specify a time range.
-- ----------------------------
create table QRTZ_CALENDARS (
    sched_name           varchar(120)    not null            comment 'schedule name',
    calendar_name        varchar(200)    not null            comment 'calendar name',
    calendar             blob            not null            comment 'Store persistent calendar objects',
    primary key (sched_name, calendar_name)
) engine=innodb comment = 'calendar information table';

-- ----------------------------
-- 7. Stores information about paused Trigger groups
-- ----------------------------
create table QRTZ_PAUSED_TRIGGER_GRPS (
    sched_name           varchar(120)    not null            comment 'schedule name',
    trigger_group        varchar(200)    not null            comment 'qrtz_triggers table trigger_group foreign key',
    primary key (sched_name, trigger_group)
) engine=innodb comment = 'Paused trigger table';

-- ----------------------------
-- 8. Store status information related to the triggered Trigger and execution information of the associated Job
-- ----------------------------
create table QRTZ_FIRED_TRIGGERS (
    sched_name           varchar(120)    not null            comment 'schedule name',
    entry_id             varchar(95)     not null            comment 'Scheduler instance id',
    trigger_name         varchar(200)    not null            comment 'qrtz_triggers table trigger_name foreign key',
    trigger_group        varchar(200)    not null            comment 'qrtz_triggers table trigger_group foreign key',
    instance_name        varchar(200)    not null            comment 'Scheduler instance name',
    fired_time           bigint(13)      not null            comment 'trigger time',
    sched_time           bigint(13)      not null            comment 'The time set by the timer',
    priority             integer         not null            comment 'priority',
    state                varchar(16)     not null            comment 'state',
    job_name             varchar(200)    null                comment 'Task name',
    job_group            varchar(200)    null                comment 'Task group name',
    is_nonconcurrent     varchar(1)      null                comment 'Is it concurrent?',
    requests_recovery    varchar(1)      null                comment 'Whether to accept resume execution',
    primary key (sched_name, entry_id)
) engine=innodb comment = 'Fired trigger table';

-- ----------------------------
-- 9. Store a small amount of status information about Scheduler. If it is used in a cluster, you can see other Scheduler instances.
-- ----------------------------
create table QRTZ_SCHEDULER_STATE (
    sched_name           varchar(120)    not null            comment 'schedule name',
    instance_name        varchar(200)    not null            comment 'Instance name',
    last_checkin_time    bigint(13)      not null            comment 'Last check time',
    checkin_interval     bigint(13)      not null            comment 'Check interval',
    primary key (sched_name, instance_name)
) engine=innodb comment = 'scheduler state table';

-- ----------------------------
-- 10. Store the pessimistic lock information of the program (if pessimistic lock is used)
-- ----------------------------
create table QRTZ_LOCKS (
    sched_name           varchar(120)    not null            comment 'schedule name',
    lock_name            varchar(40)     not null            comment 'Pessimistic lock name',
    primary key (sched_name, lock_name)
) engine=innodb comment = 'Stored pessimistic lock information table';

-- ----------------------------
-- 11. Quartz cluster implements row lock table of synchronization mechanism
-- ----------------------------
create table QRTZ_SIMPROP_TRIGGERS (
    sched_name           varchar(120)    not null            comment 'schedule name',
    trigger_name         varchar(200)    not null            comment 'qrtz_triggers table trigger_name foreign key',
    trigger_group        varchar(200)    not null            comment 'qrtz_triggers table trigger_group foreign key',
    str_prop_1           varchar(512)    null                comment 'String type The first parameter of trigger',
    str_prop_2           varchar(512)    null                comment 'String type The second parameter of trigger',
    str_prop_3           varchar(512)    null                comment 'String type The third parameter of trigger',
    int_prop_1           int             null                comment 'int type The first parameter of trigger',
    int_prop_2           int             null                comment 'int type The second parameter of trigger',
    long_prop_1          bigint          null                comment 'long type The first parameter of trigger',
    long_prop_2          bigint          null                comment 'long type The second parameter of trigger',
    dec_prop_1           numeric(13,4)   null                comment 'decimal type The first parameter of trigger',
    dec_prop_2           numeric(13,4)   null                comment 'decimal type The second parameter of trigger',
    bool_prop_1          varchar(1)      null                comment 'Boolean type The first parameter of trigger',
    bool_prop_2          varchar(1)      null                comment 'Boolean type The second parameter of trigger',
    primary key (sched_name, trigger_name, trigger_group),
    foreign key (sched_name, trigger_name, trigger_group) references QRTZ_TRIGGERS(sched_name, trigger_name, trigger_group)
) engine=innodb comment = 'Row lock table for synchronization mechanism';

commit;