package com.eduonline.user.model.entity;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public abstract class User {
    private Integer id;
    private String name;
    private String email;
    private String password;
    private String phone;
    private LocalDateTime createdAt;

    // 通用用户方法
    public abstract boolean login();
    public abstract void logout();
    public abstract boolean updateProfile();
}