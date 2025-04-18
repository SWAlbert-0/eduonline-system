-- 用户表结构
CREATE TABLE `user` (
                        `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                        `name` varchar(50) NOT NULL COMMENT '用户名',
                        `email` varchar(100) NOT NULL COMMENT '邮箱',
                        `password` varchar(100) NOT NULL COMMENT '密码',
                        `phone` varchar(20) DEFAULT NULL COMMENT '手机号',
                        `avatar` varchar(255) DEFAULT NULL COMMENT '头像URL',
                        `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                        `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `uk_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户基础信息表';

-- 学生表结构
CREATE TABLE `student` (
                           `id` int(11) NOT NULL COMMENT '用户ID',
                           `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
                           `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           PRIMARY KEY (`id`),
                           CONSTRAINT `fk_student_user` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生表';

-- 教师表结构
CREATE TABLE `teacher` (
                           `id` int(11) NOT NULL COMMENT '用户ID',
                           `rating` decimal(3,2) DEFAULT NULL COMMENT '评分',
                           `introduction` text COMMENT '教师介绍',
                           `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           PRIMARY KEY (`id`),
                           CONSTRAINT `fk_teacher_user` FOREIGN KEY (`id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师表';

-- 课程表结构
CREATE TABLE `course` (
                          `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
                          `title` varchar(100) NOT NULL COMMENT '课程标题',
                          `description` text COMMENT '课程描述',
                          `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程价格',
                          `teacher_id` int(11) NOT NULL COMMENT '教师ID',
                          `category` varchar(20) NOT NULL COMMENT '课程分类',
                          `status` varchar(20) NOT NULL DEFAULT 'DRAFT' COMMENT '课程状态',
                          `start_date` datetime DEFAULT NULL COMMENT '开始日期',
                          `end_date` datetime DEFAULT NULL COMMENT '结束日期',
                          `enrollment_count` int(11) NOT NULL DEFAULT '0' COMMENT '报名人数',
                          `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                          `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                          `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                          PRIMARY KEY (`id`),
                          KEY `idx_teacher` (`teacher_id`),
                          KEY `idx_status` (`status`),
                          KEY `idx_category` (`category`),
                          CONSTRAINT `fk_course_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程表';

-- 学生课程关系表
CREATE TABLE `student_course` (
                                  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
                                  `student_id` int(11) NOT NULL COMMENT '学生ID',
                                  `course_id` int(11) NOT NULL COMMENT '课程ID',
                                  `enroll_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报名时间',
                                  `study_progress` decimal(5,2) DEFAULT '0.00' COMMENT '学习进度',
                                  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  PRIMARY KEY (`id`),
                                  UNIQUE KEY `uk_student_course` (`student_id`,`course_id`),
                                  KEY `idx_course` (`course_id`),
                                  CONSTRAINT `fk_sc_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
                                  CONSTRAINT `fk_sc_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生课程关系表';

-- 资源表结构
CREATE TABLE `resource` (
                            `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源ID',
                            `course_id` int(11) NOT NULL COMMENT '课程ID',
                            `title` varchar(100) NOT NULL COMMENT '资源标题',
                            `type` varchar(20) NOT NULL COMMENT '资源类型',
                            `url` varchar(255) NOT NULL COMMENT '资源URL',
                            `size` bigint(20) NOT NULL DEFAULT '0' COMMENT '资源大小(字节)',
                            `uploaded_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
                            `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                            `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                            `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                            PRIMARY KEY (`id`),
                            KEY `idx_course` (`course_id`),
                            KEY `idx_type` (`type`),
                            CONSTRAINT `fk_resource_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程资源表';

-- 资源访问记录表
CREATE TABLE `resource_view` (
                                 `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
                                 `resource_id` int(11) NOT NULL COMMENT '资源ID',
                                 `student_id` int(11) NOT NULL COMMENT '学生ID',
                                 `view_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '查看时间',
                                 `progress` decimal(5,2) DEFAULT '0.00' COMMENT '观看进度',
                                 `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                 PRIMARY KEY (`id`),
                                 KEY `idx_resource` (`resource_id`),
                                 KEY `idx_student` (`student_id`),
                                 CONSTRAINT `fk_view_resource` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
                                 CONSTRAINT `fk_view_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源访问记录表';

-- 作业表结构
CREATE TABLE `assignment` (
                              `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '作业ID',
                              `course_id` int(11) NOT NULL COMMENT '课程ID',
                              `title` varchar(100) NOT NULL COMMENT '作业标题',
                              `description` text COMMENT '作业描述',
                              `due_date` datetime NOT NULL COMMENT '截止日期',
                              `max_score` int(11) NOT NULL DEFAULT '100' COMMENT '最高分',
                              `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
                              PRIMARY KEY (`id`),
                              KEY `idx_course` (`course_id`),
                              CONSTRAINT `fk_assignment_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作业表';

-- 作业提交表结构
CREATE TABLE `submission` (
                              `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提交ID',
                              `assignment_id` int(11) NOT NULL COMMENT '作业ID',
                              `student_id` int(11) NOT NULL COMMENT '学生ID',
                              `content` text COMMENT '提交内容',
                              `submitted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
                              `status` varchar(20) NOT NULL DEFAULT 'SUBMITTED' COMMENT '提交状态',
                              `score` decimal(5,2) DEFAULT NULL COMMENT '得分',
                              `feedback` text COMMENT '反馈',
                              `is_late` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否迟交',
                              `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              PRIMARY KEY (`id`),
                              KEY `idx_assignment` (`assignment_id`),
                              KEY `idx_student` (`student_id`),
                              KEY `idx_status` (`status`),
                              CONSTRAINT `fk_submission_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`id`),
                              CONSTRAINT `fk_submission_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作业提交表';

-- 订单表结构
CREATE TABLE `order` (
                         `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
                         `student_id` int(11) NOT NULL COMMENT '学生ID',
                         `course_id` int(11) NOT NULL COMMENT '课程ID',
                         `amount` decimal(10,2) NOT NULL COMMENT '订单金额',
                         `status` varchar(20) NOT NULL DEFAULT 'PENDING' COMMENT '订单状态',
                         `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                         `expire_at` datetime NOT NULL COMMENT '过期时间',
                         PRIMARY KEY (`id`),
                         KEY `idx_student` (`student_id`),
                         KEY `idx_course` (`course_id`),
                         KEY `idx_status` (`status`),
                         CONSTRAINT `fk_order_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
                         CONSTRAINT `fk_order_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- 支付表结构
CREATE TABLE `payment` (
                           `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付ID',
                           `order_id` int(11) NOT NULL COMMENT '订单ID',
                           `student_id` int(11) NOT NULL COMMENT '学生ID',
                           `course_id` int(11) NOT NULL COMMENT '课程ID',
                           `amount` decimal(10,2) NOT NULL COMMENT '支付金额',
                           `status` varchar(20) NOT NULL DEFAULT 'PENDING' COMMENT '支付状态',
                           `method` varchar(20) NOT NULL COMMENT '支付方式',
                           `transaction_id` varchar(100) DEFAULT NULL COMMENT '交易ID',
                           `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           PRIMARY KEY (`id`),
                           KEY `idx_order` (`order_id`),
                           KEY `idx_student` (`student_id`),
                           KEY `idx_course` (`course_id`),
                           KEY `idx_status` (`status`),
                           CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
                           CONSTRAINT `fk_payment_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
                           CONSTRAINT `fk_payment_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付表';

-- 聊天室表结构
CREATE TABLE `chat_room` (
                             `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '聊天室ID',
                             `course_id` int(11) NOT NULL COMMENT '课程ID',
                             `title` varchar(100) DEFAULT NULL COMMENT '聊天室标题',
                             `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否活跃',
                             `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             PRIMARY KEY (`id`),
                             KEY `idx_course` (`course_id`),
                             CONSTRAINT `fk_chatroom_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='聊天室表';

-- 聊天室参与者表
CREATE TABLE `chat_room_participant` (
                                         `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参与ID',
                                         `chat_room_id` int(11) NOT NULL COMMENT '聊天室ID',
                                         `user_id` int(11) NOT NULL COMMENT '用户ID',
                                         `joined_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uk_room_user` (`chat_room_id`,`user_id`),
                                         KEY `idx_user` (`user_id`),
                                         CONSTRAINT `fk_participant_room` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_room` (`id`),
                                         CONSTRAINT `fk_participant_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='聊天室参与者表';

-- 消息表结构
CREATE TABLE `message` (
                           `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息ID',
                           `chat_room_id` int(11) NOT NULL COMMENT '聊天室ID',
                           `sender_id` int(11) NOT NULL COMMENT '发送者ID',
                           `content` text NOT NULL COMMENT '消息内容',
                           `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
                           `type` varchar(20) NOT NULL DEFAULT 'TEXT' COMMENT '消息类型',
                           `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
                           `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                           PRIMARY KEY (`id`),
                           KEY `idx_chat_room` (`chat_room_id`),
                           KEY `idx_sender` (`sender_id`),
                           KEY `idx_time` (`timestamp`),
                           CONSTRAINT `fk_message_room` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_room` (`id`),
                           CONSTRAINT `fk_message_sender` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='消息表';

-- 通知表结构
CREATE TABLE `notification` (
                                `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通知ID',
                                `user_id` int(11) NOT NULL COMMENT '用户ID',
                                `title` varchar(100) NOT NULL COMMENT '通知标题',
                                `content` text NOT NULL COMMENT '通知内容',
                                `type` varchar(20) NOT NULL COMMENT '通知类型',
                                `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
                                PRIMARY KEY (`id`),
                                KEY `idx_user` (`user_id`),
                                KEY `idx_type` (`type`),
                                KEY `idx_create_time` (`created_at`),
                                CONSTRAINT `fk_notification_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='通知表';