package com.eduonline.chat.model.entity;

import com.eduonline.common.enums.MessageTypeEnum;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Message {
    private Integer id;
    private Integer chatRoomId;
    private Integer senderId;
    private String content;
    private LocalDateTime timestamp;
    private MessageTypeEnum type;
    private Boolean isRead;

    public boolean read() {
        // 阅读消息实现
        return true;
    }

    public Message reply(String content) {
        // 回复消息实现
        return null;
    }
}