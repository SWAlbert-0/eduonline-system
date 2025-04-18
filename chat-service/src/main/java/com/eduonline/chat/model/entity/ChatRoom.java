package com.eduonline.chat.model.entity;

import com.eduonline.user.model.entity.User;
import lombok.Data;
import java.util.List;

@Data
public class ChatRoom {
    private Integer id;
    private Integer courseId;
    private List<User> participants;
    private List<Message> messages;
    private Boolean isActive;

    public Message sendMessage(User sender, String content) {
        // 发送消息实现
        return null;
    }

    public boolean markAsResolved(Message message) {
        // 标记为已解决实现
        return true;
    }

    public boolean saveToFAQ(Message message) {
        // 保存到FAQ实现
        return true;
    }
}