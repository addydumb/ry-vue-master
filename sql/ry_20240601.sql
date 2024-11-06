-- ----------------------------
-- 1. Department Table
-- ----------------------------
drop table if exists sys_dept;
create table sys_dept (
  dept_id           bigint(20)      not null auto_increment    comment 'Department ID',
  parent_id         bigint(20)      default 0                  comment 'Parent Department ID',
  ancestors         varchar(50)     default ''                 comment 'Ancestor List',
  dept_name         varchar(30)     default ''                 comment 'Department Name',
  order_num         int(4)          default 0                  comment 'Display Order',
  leader            varchar(20)     default null               comment 'Leader',
  phone             varchar(11)     default null               comment 'Contact Phone',
  email             varchar(50)     default null               comment 'Email',
  status            char(1)         default '0'                comment 'Department Status (0 Active, 1 Inactive)',
  del_flag          char(1)         default '0'                comment 'Delete Flag (0 Existing, 2 Deleted)',
  create_by         varchar(64)     default ''                 comment 'Created By',
  create_time       datetime                                   comment 'Creation Time',
  update_by         varchar(64)     default ''                 comment 'Updated By',
  update_time       datetime                                   comment 'Update Time',
  primary key (dept_id)
) engine=innodb auto_increment=200 comment = 'Department Table';

-- ----------------------------
-- Initialize - Department Table Data
-- ----------------------------
insert into sys_dept values(100,  0,   '0',          'Ruoyi Technology',   0, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(101,  100, '0,100',      'Shenzhen Headquarters', 1, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(102,  100, '0,100',      'Changsha Branch', 2, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(103,  101, '0,100,101',  'R&D Department',   1, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(104,  101, '0,100,101',  'Marketing Department',   2, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(105,  101, '0,100,101',  'Testing Department',   3, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(106,  101, '0,100,101',  'Finance Department',   4, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(107,  101, '0,100,101',  'Operations Department',   5, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(108,  102, '0,100,102',  'Marketing Department',   1, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);
insert into sys_dept values(109,  102, '0,100,102',  'Finance Department',   2, 'Ruoyi', '15888888888', 'ry@qq.com', '0', '0', 'admin', sysdate(), '', null);

-- ----------------------------
-- 2. User Information Table
-- ----------------------------
drop table if exists sys_user;
create table sys_user (
  user_id           bigint(20)      not null auto_increment    comment 'User ID',
  dept_id           bigint(20)      default null               comment 'Department ID',
  user_name         varchar(30)     not null                   comment 'User Account',
  nick_name         varchar(30)     not null                   comment 'User Nickname',
  user_type         varchar(2)      default '00'               comment 'User Type (00 System User)',
  email             varchar(50)     default ''                 comment 'User Email',
  phonenumber       varchar(11)     default ''                 comment 'Phone Number',
  sex               char(1)         default '0'                comment 'User Gender (0 Male, 1 Female, 2 Unknown)',
  avatar            varchar(100)    default ''                 comment 'Avatar URL',
  password          varchar(100)    default ''                 comment 'Password',
  status            char(1)         default '0'                comment 'Account Status (0 Active, 1 Inactive)',
  del_flag          char(1)         default '0'                comment 'Delete Flag (0 Existing, 2 Deleted)',
  login_ip          varchar(128)    default ''                 comment 'Last Login IP',
  login_date        datetime                                   comment 'Last Login Date',
  create_by         varchar(64)     default ''                 comment 'Created By',
  create_time       datetime                                   comment 'Creation Time',
  update_by         varchar(64)     default ''                 comment 'Updated By',
  update_time       datetime                                   comment 'Update Time',
  remark            varchar(500)    default null               comment 'Remark',
  primary key (user_id)
) engine=innodb auto_increment=100 comment = 'User Information Table';

-- ----------------------------
-- Initialize - User Information Table Data
-- ----------------------------
insert into sys_user values(1,  103, 'admin', 'Ruoyi', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), 'admin', sysdate(), '', null, 'Administrator');
insert into sys_user values(2,  105, 'ry',    'Ruoyi', '00', 'ry@qq.com',  '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', sysdate(), 'admin', sysdate(), '', null, 'Tester');

-- ----------------------------
-- 3. Position Information Table
-- ----------------------------
drop table if exists sys_post;
create table sys_post
(
  post_id       bigint(20)      not null auto_increment    comment 'Position ID',
  post_code     varchar(64)     not null                   comment 'Position Code',
  post_name     varchar(50)     not null                   comment 'Position Name',
  post_sort     int(4)          not null                   comment 'Display Order',
  status        char(1)         not null                   comment 'Status (0 Active, 1 Inactive)',
  create_by     varchar(64)     default ''                 comment 'Created By',
  create_time   datetime                                   comment 'Creation Time',
  update_by     varchar(64)     default ''                 comment 'Updated By',
  update_time   datetime                                   comment 'Update Time',
  remark        varchar(500)    default null               comment 'Remark',
  primary key (post_id)
) engine=innodb comment = 'Position Information Table';

-- ----------------------------
-- Initialize - Position Information Table Data
-- ----------------------------
insert into sys_post values(1, 'ceo',  'Chairman',    1, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(2, 'se',   'Project Manager',  2, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(3, 'hr',   'Human Resources',  3, '0', 'admin', sysdate(), '', null, '');
insert into sys_post values(4, 'user', 'Ordinary Employee',  4, '0', 'admin', sysdate(), '', null, '');

-- ----------------------------
-- 4. Role Information Table
-- ----------------------------
drop table if exists sys_role;
create table sys_role (
  role_id              bigint(20)      not null auto_increment    comment 'Role ID',
  role_name            varchar(30)     not null                   comment 'Role Name',
  role_key             varchar(100)    not null                   comment 'Role Permission String',
  role_sort            int(4)          not null                   comment 'Display Order',
  data_scope           char(1)         default '1'                comment 'Data Scope (1: All Data Permissions, 2: Custom Data Permissions, 3: Department Data Permissions, 4: Department and Below Data Permissions)',
  menu_check_strictly  tinyint(1)      default 1                  comment 'Menu Tree Selection Linked Display',
  dept_check_strictly  tinyint(1)      default 1                  comment 'Department Tree Selection Linked Display',
  status               char(1)         not null                   comment 'Role Status (0 Active, 1 Inactive)',
  del_flag             char(1)         default '0'                comment 'Delete Flag (0 Existing, 2 Deleted)',
  create_by            varchar(64)     default ''                 comment 'Created By',
  create_time          datetime                                   comment 'Creation Time',
  update_by            varchar(64)     default ''                 comment 'Updated By',
  update_time          datetime                                   comment 'Update Time',
  remark               varchar(500)    default null               comment 'Remark',
  primary key (role_id)
) engine=innodb auto_increment=100 comment = 'Role Information Table';

-- ----------------------------
-- Initialize - Role Information Table Data
-- ----------------------------
insert into sys_role values('1', 'Super Administrator',  'admin',  1, 1, 1, 1, '0', '0', 'admin', sysdate(), '', null, 'Super Administrator');
insert into sys_role values('2', 'Ordinary Role',    'common', 2, 2, 1, 1, '0', '0', 'admin', sysdate(), '', null, 'Ordinary Role');



-- ----------------------------
-- 5. Menu Permissions Table
-- ----------------------------
drop table if exists sys_menu;
create table sys_menu (
  menu_id           bigint(20)      not null auto_increment    comment 'Menu ID',
  menu_name         varchar(50)     not null                   comment 'Menu Name',
  parent_id         bigint(20)      default 0                  comment 'Parent Menu ID',
  order_num         int(4)          default 0                  comment 'Display Order',
  path              varchar(200)    default ''                 comment 'Route Address',
  component         varchar(255)    default null               comment 'Component Path',
  query             varchar(255)    default null               comment 'Route Parameters',
  route_name        varchar(50)     default ''                 comment 'Route Name',
  is_frame          int(1)          default 1                  comment 'Is External Link (0 Yes, 1 No)',
  is_cache          int(1)          default 0                  comment 'Cache (0 Cache, 1 No Cache)',
  menu_type         char(1)         default ''                 comment 'Menu Type (M Directory, C Menu, F Button)',
  visible           char(1)         default 0                  comment 'Menu Status (0 Show, 1 Hide)',
  status            char(1)         default 0                  comment 'Menu Status (0 Active, 1 Inactive)',
  perms             varchar(100)    default null               comment 'Permission Identifier',
  icon              varchar(100)    default '#'                comment 'Menu Icon',
  create_by         varchar(64)     default ''                 comment 'Created By',
  create_time       datetime                                   comment 'Creation Time',
  update_by         varchar(64)     default ''                 comment 'Updated By',
  update_time       datetime                                   comment 'Update Time',
  remark            varchar(500)    default ''                 comment 'Remarks',
  primary key (menu_id)
) engine=innodb auto_increment=2000 comment = 'Menu Permissions Table';

-- ----------------------------
-- Initialization - Menu Information Table Data
-- ----------------------------
-- Level 1 Menu
insert into sys_menu values('1', 'System Management', '0', '1', 'system',           null, '', '', 1, 0, 'M', '0', '0', '', 'system',   'admin', sysdate(), '', null, 'System Management Directory');
insert into sys_menu values('2', 'System Monitoring', '0', '2', 'monitor',          null, '', '', 1, 0, 'M', '0', '0', '', 'monitor',  'admin', sysdate(), '', null, 'System Monitoring Directory');
insert into sys_menu values('3', 'System Tools', '0', '3', 'tool',                  null, '', '', 1, 0, 'M', '0', '0', '', 'tool',     'admin', sysdate(), '', null, 'System Tools Directory');
insert into sys_menu values('4', 'RuoYi Official Website', '0', '4', 'http://ruoyi.vip', null, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', sysdate(), '', null, 'RuoYi Official Website URL');
-- Secondary Menu
insert into sys_menu values('100', 'User Management', '1', '1', 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', sysdate(), '', null, 'User Management Menu');
insert into sys_menu values('101', 'Role Management', '1', '2', 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', sysdate(), '', null, 'Role Management Menu');
insert into sys_menu values('102', 'Menu Management', '1', '3', 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', sysdate(), '', null, 'Menu Management Menu');
insert into sys_menu values('103', 'Department Management', '1', '4', 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', sysdate(), '', null, 'Department Management Menu');
insert into sys_menu values('104', 'Position Management', '1', '5', 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', sysdate(), '', null, 'Position Management Menu');
insert into sys_menu values('105', 'Dictionary Management', '1', '6', 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', sysdate(), '', null, 'Dictionary Management Menu');
insert into sys_menu values('106', 'Parameter Settings', '1', '7', 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', sysdate(), '', null, 'Parameter Settings Menu');
insert into sys_menu values('107', 'Notice and Announcements', '1', '8', 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', sysdate(), '', null, 'Notice and Announcements Menu');
insert into sys_menu values('108', 'Log Management', '1', '9', 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', sysdate(), '', null, 'Log Management Menu');
insert into sys_menu values('109', 'Online Users', '2', '1', 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', sysdate(), '', null, 'Online Users Menu');
insert into sys_menu values('110', 'Scheduled Tasks', '2', '2', 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', sysdate(), '', null, 'Scheduled Tasks Menu');
insert into sys_menu values('111', 'Data Monitoring', '2', '3', 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', sysdate(), '', null, 'Data Monitoring Menu');
insert into sys_menu values('112', 'Server Monitoring', '2', '4', 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', sysdate(), '', null, 'Server Monitoring Menu');
insert into sys_menu values('113', 'Cache Monitoring', '2', '5', 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', sysdate(), '', null, 'Cache Monitoring Menu');
insert into sys_menu values('114', 'Cache List', '2', '6', 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', sysdate(), '', null, 'Cache List Menu');
insert into sys_menu values('115', 'Form Builder', '3', '1', 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', sysdate(), '', null, 'Form Builder Menu');
insert into sys_menu values('116', 'Code Generation', '3', '2', 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', sysdate(), '', null, 'Code Generation Menu');
insert into sys_menu values('117', 'System API', '3', '3', 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', sysdate(), '', null, 'System API Menu');
-- Tertiary Menu
insert into sys_menu values('500', 'Operation Log', '108', '1', 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', sysdate(), '', null, 'Operation Log Menu');
insert into sys_menu values('501', 'Login Log', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', sysdate(), '', null, 'Login Log Menu');
-- User Management Buttons
insert into sys_menu values('1000', 'User Query', '100', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1001', 'Add User', '100', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1002', 'Edit User', '100', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1003', 'Delete User', '100', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1004', 'Export User', '100', '5',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1005', 'Import User', '100', '6',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1006', 'Reset Password', '100', '7',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd',       '#', 'admin', sysdate(), '', null, '');

-- Role Management Buttons
insert into sys_menu values('1007', 'Role Query', '101', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1008', 'Add Role', '101', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1009', 'Edit Role', '101', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1010', 'Delete Role', '101', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1011', 'Export Role', '101', '5',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export',         '#', 'admin', sysdate(), '', null, '');

-- Menu Management Buttons
insert into sys_menu values('1012', 'Menu Query', '102', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1013', 'Add Menu', '102', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1014', 'Edit Menu', '102', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1015', 'Delete Menu', '102', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove',         '#', 'admin', sysdate(), '', null, '');

-- Department Management Buttons
insert into sys_menu values('1016', 'Department Query', '103', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1017', 'Add Department', '103', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1018', 'Edit Department', '103', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1019', 'Delete Department', '103', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove',         '#', 'admin', sysdate(), '', null, '');
-- Post Management Buttons
insert into sys_menu values('1020', 'Post Query', '104', '1',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1021', 'Add Post', '104', '2',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1022', 'Edit Post', '104', '3',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1023', 'Delete Post', '104', '4',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1024', 'Export Post', '104', '5',  '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export',         '#', 'admin', sysdate(), '', null, '');

-- Dictionary Management Buttons
insert into sys_menu values('1025', 'Dictionary Query', '105', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1026', 'Add Dictionary', '105', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1027', 'Edit Dictionary', '105', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1028', 'Delete Dictionary', '105', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1029', 'Export Dictionary', '105', '5', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export',         '#', 'admin', sysdate(), '', null, '');

-- Parameter Settings Buttons
insert into sys_menu values('1030', 'Parameter Query', '106', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1031', 'Add Parameter', '106', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1032', 'Edit Parameter', '106', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1033', 'Delete Parameter', '106', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1034', 'Export Parameter', '106', '5', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export',       '#', 'admin', sysdate(), '', null, '');

-- Notification Announcement Buttons
insert into sys_menu values('1035', 'Announcement Query', '107', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query',        '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1036', 'Add Announcement', '107', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1037', 'Edit Announcement', '107', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1038', 'Delete Announcement', '107', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove',       '#', 'admin', sysdate(), '', null, '');

-- Operation Log Buttons
insert into sys_menu values('1039', 'Operation Query', '500', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query',      '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1040', 'Delete Operation', '500', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove',     '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1041', 'Export Log', '500', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export',     '#', 'admin', sysdate(), '', null, '');

-- Login Log Buttons
insert into sys_menu values('1042', 'Login Query', '501', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query',   '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1043', 'Delete Login', '501', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1044', 'Export Log', '501', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export',  '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1045', 'Account Unlock', '501', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock',  '#', 'admin', sysdate(), '', null, '');
-- Online User Buttons
insert into sys_menu values('1046', 'Online Query', '109', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query',       '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1047', 'Batch Force Logout', '109', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1048', 'Single Force Logout', '109', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', sysdate(), '', null, '');

-- Scheduled Task Buttons
insert into sys_menu values('1049', 'Task Query', '110', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query',          '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1050', 'Add Task', '110', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1051', 'Edit Task', '110', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1052', 'Delete Task', '110', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove',         '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1053', 'Change Status', '110', '5', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus',   '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1054', 'Export Task', '110', '6', '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export',         '#', 'admin', sysdate(), '', null, '');

-- Code Generation Buttons
insert into sys_menu values('1055', 'Generation Query', '116', '1', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query',             '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1056', 'Edit Generation', '116', '2', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit',              '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1057', 'Delete Generation', '116', '3', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1058', 'Import Code', '116', '4', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import',            '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1059', 'Preview Code', '116', '5', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview',           '#', 'admin', sysdate(), '', null, '');
insert into sys_menu values('1060', 'Generate Code', '116', '6', '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code',              '#', 'admin', sysdate(), '', null, '');

-- ----------------------------
-- 6. User and Role Association Table (Users N-1 Roles)
-- ----------------------------
drop table if exists sys_user_role;
create table sys_user_role (
  user_id   bigint(20) not null comment 'User ID',
  role_id   bigint(20) not null comment 'Role ID',
  primary key(user_id, role_id)
) engine=innodb comment = 'User and Role Association Table';

-- ----------------------------
-- Initialization - User and Role Association Table Data
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');


-- ----------------------------
-- Role and Menu Association Table (Role 1-N Menu)
-- ----------------------------
drop table if exists sys_role_menu;
create table sys_role_menu (
  role_id   bigint(20) not null comment 'Role ID',
  menu_id   bigint(20) not null comment 'Menu ID',
  primary key(role_id, menu_id)
) engine=innodb comment = 'Role and Menu Association Table';

-- ----------------------------
-- Initialization - Role and Menu Association Table Data
-- ----------------------------

insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '4');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '116');
insert into sys_role_menu values ('2', '117');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');
insert into sys_role_menu values ('2', '1057');
insert into sys_role_menu values ('2', '1058');
insert into sys_role_menu values ('2', '1059');
insert into sys_role_menu values ('2', '1060');

-- ----------------------------
-- Role and Department Association Table (Role 1-N Department)
-- ----------------------------
drop table if exists sys_role_dept;
create table sys_role_dept (
  role_id   bigint(20) not null comment 'Role ID',
  dept_id   bigint(20) not null comment 'Department ID',
  primary key(role_id, dept_id)
) engine=innodb comment = 'Role and Department Association Table';

-- ----------------------------
-- Initialization - Role and Department Association Table Data
-- ----------------------------
insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '105');


-- ----------------------------
-- User and Post Association Table (User 1-N Post)
-- ----------------------------
drop table if exists sys_user_post;
create table sys_user_post
(
  user_id   bigint(20) not null comment 'User ID',
  post_id   bigint(20) not null comment 'Post ID',
  primary key (user_id, post_id)
) engine=innodb comment = 'User and Post Association Table';

-- ----------------------------
-- Initialization - User and Post Association Table Data
-- ----------------------------
insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '2');


-- ----------------------------
-- 10. Operation Log Records
-- ----------------------------

drop table if exists sys_oper_log;
create table sys_oper_log (
  oper_id           bigint(20)      not null auto_increment    comment '日志主键',
  title             varchar(50)     default ''                 comment '模块标题',
  business_type     int(2)          default 0                  comment '业务类型（0其它 1新增 2修改 3删除）',
  method            varchar(200)    default ''                 comment '方法名称',
  request_method    varchar(10)     default ''                 comment '请求方式',
  operator_type     int(1)          default 0                  comment '操作类别（0其它 1后台用户 2手机端用户）',
  oper_name         varchar(50)     default ''                 comment '操作人员',
  dept_name         varchar(50)     default ''                 comment '部门名称',
  oper_url          varchar(255)    default ''                 comment '请求URL',
  oper_ip           varchar(128)    default ''                 comment '主机地址',
  oper_location     varchar(255)    default ''                 comment '操作地点',
  oper_param        varchar(2000)   default ''                 comment '请求参数',
  json_result       varchar(2000)   default ''                 comment '返回参数',
  status            int(1)          default 0                  comment '操作状态（0正常 1异常）',
  error_msg         varchar(2000)   default ''                 comment '错误消息',
  oper_time         datetime                                   comment '操作时间',
  cost_time         bigint(20)      default 0                  comment '消耗时间',
  primary key (oper_id),
  key idx_sys_oper_log_bt (business_type),
  key idx_sys_oper_log_s  (status),
  key idx_sys_oper_log_ot (oper_time)
) engine=innodb auto_increment=100 comment = '操作日志记录';


-- ----------------------------
-- 11. Dictionary Type Table
-- ----------------------------
drop table if exists sys_dict_type;
create table sys_dict_type
(
  dict_id          bigint(20)      not null auto_increment    comment 'Dictionary Primary Key',
  dict_name        varchar(100)    default ''                 comment 'Dictionary Name',
  dict_type        varchar(100)    default ''                 comment 'Dictionary Type',
  status           char(1)         default '0'                comment 'Status (0: normal, 1: disabled)',
  create_by        varchar(64)     default ''                 comment 'Creator',
  create_time      datetime                                   comment 'Creation Time',
  update_by        varchar(64)     default ''                 comment 'Updater',
  update_time      datetime                                   comment 'Update Time',
  remark           varchar(500)    default null               comment 'Remarks',
  primary key (dict_id),
  unique (dict_type)
) engine=innodb auto_increment=100 comment = 'Dictionary Type Table';

insert into sys_dict_type values(1,  'User Gender', 'sys_user_sex',        '0', 'admin', sysdate(), '', null, 'User gender list');
insert into sys_dict_type values(2,  'Menu Status', 'sys_show_hide',       '0', 'admin', sysdate(), '', null, 'Menu status list');
insert into sys_dict_type values(3,  'System Switch', 'sys_normal_disable',  '0', 'admin', sysdate(), '', null, 'System switch list');
insert into sys_dict_type values(4,  'Task Status', 'sys_job_status',      '0', 'admin', sysdate(), '', null, 'Task status list');
insert into sys_dict_type values(5,  'Task Group', 'sys_job_group',       '0', 'admin', sysdate(), '', null, 'Task group list');
insert into sys_dict_type values(6,  'System Yes/No', 'sys_yes_no',          '0', 'admin', sysdate(), '', null, 'System yes/no list');
insert into sys_dict_type values(7,  'Notice Type', 'sys_notice_type',     '0', 'admin', sysdate(), '', null, 'Notice type list');
insert into sys_dict_type values(8,  'Notice Status', 'sys_notice_status',   '0', 'admin', sysdate(), '', null, 'Notice status list');
insert into sys_dict_type values(9,  'Operation Type', 'sys_oper_type',       '0', 'admin', sysdate(), '', null, 'Operation type list');
insert into sys_dict_type values(10, 'System Status', 'sys_common_status',   '0', 'admin', sysdate(), '', null, 'Login status list');


-- ----------------------------
-- 12. Dictionary Data Table
-- ----------------------------
drop table if exists sys_dict_data;
create table sys_dict_data
(
  dict_code        bigint(20)      not null auto_increment    comment 'Dictionary Code',
  dict_sort        int(4)          default 0                  comment 'Dictionary Sort',
  dict_label       varchar(100)    default ''                 comment 'Dictionary Label',
  dict_value       varchar(100)    default ''                 comment 'Dictionary Value',
  dict_type        varchar(100)    default ''                 comment 'Dictionary Type',
  css_class        varchar(100)    default null               comment 'Style Attributes (Other Style Extensions)',
  list_class       varchar(100)    default null               comment 'Table Display Style',
  is_default       char(1)         default 'N'                comment 'Is Default (Y: Yes, N: No)',
  status           char(1)         default '0'                comment 'Status (0: normal, 1: disabled)',
  create_by        varchar(64)     default ''                 comment 'Creator',
  create_time      datetime                                   comment 'Creation Time',
  update_by        varchar(64)     default ''                 comment 'Updater',
  update_time      datetime                                   comment 'Update Time',
  remark           varchar(500)    default null               comment 'Remarks',
  primary key (dict_code)
) engine=innodb auto_increment=100 comment = 'Dictionary Data Table';

insert into sys_dict_data values(1,  1,  'Male',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', sysdate(), '', null, 'Gender male');
insert into sys_dict_data values(2,  2,  'Female',     '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, 'Gender female');
insert into sys_dict_data values(3,  3,  'Unknown',     '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', sysdate(), '', null, 'Gender unknown');
insert into sys_dict_data values(4,  1,  'Show',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'Show menu');
insert into sys_dict_data values(5,  2,  'Hide',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Hide menu');
insert into sys_dict_data values(6,  1,  'Normal',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'Normal status');
insert into sys_dict_data values(7,  2,  'Disabled',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Disabled status');
insert into sys_dict_data values(8,  1,  'Normal',     '0',       'sys_job_status',      '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'Normal status');
insert into sys_dict_data values(9,  2,  'Paused',     '1',       'sys_job_status',      '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Disabled status');
insert into sys_dict_data values(10, 1,  'Default',     'DEFAULT', 'sys_job_group',       '',   '',        'Y', '0', 'admin', sysdate(), '', null, 'Default group');
insert into sys_dict_data values(11, 2,  'System',     'SYSTEM',  'sys_job_group',       '',   '',        'N', '0', 'admin', sysdate(), '', null, 'System group');
insert into sys_dict_data values(12, 1,  'Yes',       'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'System default yes');
insert into sys_dict_data values(13, 2,  'No',       'N',       'sys_yes_no',          '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'System default no');
insert into sys_dict_data values(14, 1,  'Notice',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', sysdate(), '', null, 'Notice');
insert into sys_dict_data values(15, 2,  'Announcement',     '2',       'sys_notice_type',     '',   'success', 'N', '0', 'admin', sysdate(), '', null, 'Announcement');
insert into sys_dict_data values(16, 1,  'Normal',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', sysdate(), '', null, 'Normal status');
insert into sys_dict_data values(17, 2,  'Closed',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Closed status');
insert into sys_dict_data values(18, 99, 'Other',     '0',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, 'Other operations');
insert into sys_dict_data values(19, 1,  'Add',     '1',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, 'Add operation');
insert into sys_dict_data values(20, 2,  'Modify',     '2',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', sysdate(), '', null, 'Modify operation');
insert into sys_dict_data values(21, 3,  'Delete',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Delete operation');
insert into sys_dict_data values(22, 4,  'Authorize',     '4',       'sys_oper_type',       '',   'primary', 'N', '0', 'admin', sysdate(), '', null, 'Authorize operation');
insert into sys_dict_data values(23, 5,  'Export',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, 'Export operation');
insert into sys_dict_data values(24, 6,  'Import',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, 'Import operation');
insert into sys_dict_data values(25, 7,  'Force Logout',     '7',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Force logout operation');
insert into sys_dict_data values(26, 8,  'Generate Code', '8',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', sysdate(), '', null, 'Generate operation');
insert into sys_dict_data values(27, 9,  'Clear Data', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Clear operation');
insert into sys_dict_data values(28, 1,  'Success',     '0',       'sys_common_status',   '',   'primary', 'N', '0', 'admin', sysdate(), '', null, 'Normal status');
insert into sys_dict_data values(29, 2,  'Failure',     '1',       'sys_common_status',   '',   'danger',  'N', '0', 'admin', sysdate(), '', null, 'Disabled status');

-- ----------------------------
-- 13. Parameter Configuration Table
-- ----------------------------
drop table if exists sys_config;
create table sys_config (
  config_id         int(5)          not null auto_increment    comment 'Parameter Primary Key',
  config_name       varchar(100)    default ''                 comment 'Parameter Name',
  config_key        varchar(100)    default ''                 comment 'Parameter Key Name',
  config_value      varchar(500)    default ''                 comment 'Parameter Key Value',
  config_type       char(1)         default 'N'                comment 'System Built-in (Y for Yes, N for No)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation Time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update Time',
  remark            varchar(500)    default null               comment 'Remarks',
  primary key (config_id)
) engine=innodb auto_increment=100 comment = 'Parameter Configuration Table';

insert into sys_config values(1, 'Main Framework Page - Default Skin Style Name',     'sys.index.skinName',            'skin-blue',     'Y', 'admin', sysdate(), '', null, 'Blue skin-blue, Green skin-green, Purple skin-purple, Red skin-red, Yellow skin-yellow' );
insert into sys_config values(2, 'User Management - Initial Password',              'sys.user.initPassword',         '123456',        'Y', 'admin', sysdate(), '', null, 'Initial password 123456' );
insert into sys_config values(3, 'Main Framework Page - Sidebar Theme',             'sys.index.sideTheme',           'theme-dark',    'Y', 'admin', sysdate(), '', null, 'Dark theme theme-dark, Light theme theme-light' );
insert into sys_config values(4, 'Account Self-Service - CAPTCHA Switch',           'sys.account.captchaEnabled',    'true',          'Y', 'admin', sysdate(), '', null, 'Whether to enable CAPTCHA function (true to enable, false to disable)');
insert into sys_config values(5, 'Account Self-Service - User Registration',        'sys.account.registerUser',      'false',         'Y', 'admin', sysdate(), '', null, 'Whether to enable user registration (true to enable, false to disable)');
insert into sys_config values(6, 'User Login - Blacklist',                          'sys.login.blackIPList',         '',              'Y', 'admin', sysdate(), '', null, 'Set login IP blacklist restriction; multiple entries are separated by ;, supports matching (* wildcard, subnet)');


-- ----------------------------
-- 14. System Access Records
-- ----------------------------
drop table if exists sys_logininfor;
create table sys_logininfor (
  info_id        bigint(20)     not null auto_increment   comment 'Access ID',
  user_name      varchar(50)    default ''                comment 'User Account',
  ipaddr         varchar(128)   default ''                comment 'Login IP Address',
  login_location varchar(255)   default ''                comment 'Login Location',
  browser        varchar(50)    default ''                comment 'Browser Type',
  os             varchar(50)    default ''                comment 'Operating System',
  status         char(1)        default '0'               comment 'Login Status (0 for Success, 1 for Failure)',
  msg            varchar(255)   default ''                comment 'Prompt Message',
  login_time     datetime                                 comment 'Access Time',
  primary key (info_id),
  key idx_sys_logininfor_s  (status),
  key idx_sys_logininfor_lt (login_time)
) engine=innodb auto_increment=100 comment = 'System Access Records';


-- ----------------------------
-- 15. Scheduled Task Scheduling Table
-- ----------------------------
drop table if exists sys_job;
create table sys_job (
  job_id              bigint(20)    not null auto_increment    comment 'Task ID',
  job_name            varchar(64)   default ''                 comment 'Task Name',
  job_group           varchar(64)   default 'DEFAULT'          comment 'Task Group Name',
  invoke_target       varchar(500)  not null                   comment 'Invocation Target String',
  cron_expression     varchar(255)  default ''                 comment 'Cron Execution Expression',
  misfire_policy      varchar(20)   default '3'                comment 'Scheduled Execution Error Policy (1 Immediate Execution 2 Execute Once 3 Abandon Execution)',
  concurrent          char(1)       default '1'                comment 'Is Concurrent Execution Allowed (0 Yes 1 No)',
  status              char(1)       default '0'                comment 'Status (0 Normal 1 Paused)',
  create_by           varchar(64)   default ''                 comment 'Creator',
  create_time         datetime                                   comment 'Creation Time',
  update_by           varchar(64)   default ''                 comment 'Updater',
  update_time         datetime                                   comment 'Update Time',
  remark              varchar(500)  default ''                 comment 'Remark Information',
  primary key (job_id, job_name, job_group)
) engine=innodb auto_increment=100 comment = 'Scheduled Task Scheduling Table';

insert into sys_job values(1, 'System Default (No Parameters)', 'DEFAULT', 'ryTask.ryNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(2, 'System Default (With Parameters)', 'DEFAULT', 'ryTask.ryParams(\'ry\')',  '0/15 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');
insert into sys_job values(3, 'System Default (Multiple Parameters)', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', sysdate(), '', null, '');


-- ----------------------------
-- 16. Scheduled Task Scheduling Log Table
-- ----------------------------
drop table if exists sys_job_log;
create table sys_job_log (
  job_log_id          bigint(20)     not null auto_increment    comment 'Task Log ID',
  job_name            varchar(64)    not null                   comment 'Task Name',
  job_group           varchar(64)    not null                   comment 'Task Group Name',
  invoke_target       varchar(500)   not null                   comment 'Invocation Target String',
  job_message         varchar(500)                              comment 'Log Information',
  status              char(1)        default '0'                comment 'Execution Status (0 Normal 1 Failed)',
  exception_info      varchar(2000)  default ''                 comment 'Exception Information',
  create_time         datetime                                  comment 'Creation Time',
  primary key (job_log_id)
) engine=innodb comment = 'Scheduled Task Scheduling Log Table';


-- ----------------------------
-- 17. Notification Announcement Table
-- ----------------------------
drop table if exists sys_notice;
create table sys_notice (
  notice_id         int(4)          not null auto_increment    comment 'Announcement ID',
  notice_title      varchar(50)     not null                   comment 'Announcement Title',
  notice_type       char(1)         not null                   comment 'Announcement Type (1 Notification 2 Announcement)',
  notice_content    longblob        default null               comment 'Announcement Content',
  status            char(1)         default '0'                comment 'Announcement Status (0 Normal 1 Closed)',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time       datetime                                   comment 'Creation Time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update Time',
  remark            varchar(255)    default null               comment 'Remarks',
  primary key (notice_id)
) engine=innodb auto_increment=10 comment = 'Notification Announcement Table';

-- ----------------------------
-- Initialization - Announcement Information Table Data
-- ----------------------------
insert into sys_notice values('1', 'Warm Reminder: On 2018-07-01, a new version of RuoYi has been released', '2', 'New version content', '0', 'admin', sysdate(), '', null, 'Admin');
insert into sys_notice values('2', 'Maintenance Notice: On 2018-07-01, RuoYi system maintenance at midnight', '1', 'Maintenance content',   '0', 'admin', sysdate(), '', null, 'Admin');


-- ----------------------------
-- 18. Code Generation Business Table
-- ----------------------------
drop table if exists gen_table;
create table gen_table (
  table_id          bigint(20)      not null auto_increment    comment 'ID',
  table_name        varchar(200)    default ''                 comment 'Table Name',
  table_comment     varchar(500)    default ''                 comment 'Table Description',
  sub_table_name    varchar(64)     default null               comment 'Related Sub-table Name',
  sub_table_fk_name varchar(64)     default null               comment 'Sub-table Associated Foreign Key Name',
  class_name        varchar(100)    default ''                 comment 'Entity Class Name',
  tpl_category      varchar(200)    default 'crud'             comment 'Template Used (crud for single table operations, tree for tree table operations)',
  tpl_web_type      varchar(30)     default ''                 comment 'Frontend Template Type (element-ui template, element-plus template)',
  package_name      varchar(100)                               comment 'Generated Package Path',
  module_name       varchar(30)                                comment 'Generated Module Name',
  business_name     varchar(30)                                comment 'Generated Business Name',
  function_name     varchar(50)                                comment 'Generated Function Name',
  function_author   varchar(50)                                comment 'Generated Function Author',
  gen_type          char(1)         default '0'                comment 'Code Generation Method (0 for zip package, 1 for custom path)',
  gen_path          varchar(200)    default '/'                comment 'Generation Path (default project path if not filled)',
  options           varchar(1000)                              comment 'Other Generation Options',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time 	    datetime                                   comment 'Creation Time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update Time',
  remark            varchar(500)    default null               comment 'Remarks',
  primary key (table_id)
) engine=innodb auto_increment=1 comment = 'Code Generation Business Table';


-- ----------------------------
-- 19. Code Generation Business Table Fields
-- ----------------------------
drop table if exists gen_table_column;
create table gen_table_column (
  column_id         bigint(20)      not null auto_increment    comment 'ID',
  table_id          bigint(20)                                 comment 'Belonging Table ID',
  column_name       varchar(200)                               comment 'Column Name',
  column_comment    varchar(500)                               comment 'Column Description',
  column_type       varchar(100)                               comment 'Column Type',
  java_type         varchar(500)                               comment 'JAVA Type',
  java_field        varchar(200)                               comment 'JAVA Field Name',
  is_pk             char(1)                                    comment 'Is Primary Key (1 Yes)',
  is_increment      char(1)                                    comment 'Is Auto Increment (1 Yes)',
  is_required       char(1)                                    comment 'Is Required (1 Yes)',
  is_insert         char(1)                                    comment 'Is Insert Field (1 Yes)',
  is_edit           char(1)                                    comment 'Is Edit Field (1 Yes)',
  is_list           char(1)                                    comment 'Is List Field (1 Yes)',
  is_query          char(1)                                    comment 'Is Query Field (1 Yes)',
  query_type        varchar(200)    default 'EQ'               comment 'Query Method (Equal, Not Equal, Greater Than, Less Than, Range)',
  html_type         varchar(200)                               comment 'Display Type (Text Box, Text Area, Dropdown Box, Checkbox, Radio Button, Date Control)',
  dict_type         varchar(200)    default ''                 comment 'Dictionary Type',
  sort              int                                        comment 'Sorting',
  create_by         varchar(64)     default ''                 comment 'Creator',
  create_time 	    datetime                                   comment 'Creation Time',
  update_by         varchar(64)     default ''                 comment 'Updater',
  update_time       datetime                                   comment 'Update Time',
  primary key (column_id)
) engine=innodb auto_increment=1 comment = 'Code Generation Business Table Fields';
