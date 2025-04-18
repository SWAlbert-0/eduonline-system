package com.eduonline.user.model.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class Teacher extends User {
    private List<Course> teachingCourses;
    private Float rating;

    @Override
    public boolean login() {
        // 教师登录实现
        return true;
    }

    @Override
    public void logout() {
        // 教师登出实现
    }

    @Override
    public boolean updateProfile() {
        // 教师资料更新实现
        return true;
    }

    public boolean createCourse(Course course) {
        // 创建课程实现
        return true;
    }

    public boolean uploadResource(Course course, Resource resource) {
        // 上传资源实现
        return true;
    }

    public void gradeAssignment(Submission submission) {
        // 批改作业实现
    }

    public void answerQuestion(Message message) {
        // 回答问题实现
    }

    public boolean receivePayout() {
        // 收取报酬实现
        return true;
    }
}