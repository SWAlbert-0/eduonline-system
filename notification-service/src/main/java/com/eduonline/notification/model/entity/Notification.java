package com.eduonline.notification.model.entity;

import com.eduonline.common.enums.NotificationTypeEnum;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Notification {
    private Integer id;
    private Integer userId;
    private String title;
    private String content;
    private NotificationTypeEnum type;
    private LocalDateTime createdAt;
    private Boolean isRead;

    public boolean read() {
        // 阅读通知实现
        return true;
    }

    public boolean send() {
        // 发送通知实现
        return true;
    }
}