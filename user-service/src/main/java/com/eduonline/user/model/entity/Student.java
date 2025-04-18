package com.eduonline.user.model.entity;

import com.eduonline.course.model.entity.Assignment;
import com.eduonline.course.model.entity.Course;
import com.eduonline.course.model.entity.Resource;
import com.eduonline.payment.model.entity.Order;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.List;

@Data
@EqualsAndHashCode(callSuper = true)
public class Student extends User {
    private List<Course> enrolledCourses;
    private List<Order> orders;
    private Float balance;

    @Override
    public boolean login() {
        // 学生登录实现
        return true;
    }

    @Override
    public void logout() {
        // 学生登出实现
    }

    @Override
    public boolean updateProfile() {
        // 学生资料更新实现
        return true;
    }

    public boolean enrollCourse(Course course) {
        // 课程报名实现
        return true;
    }

    public void viewVideo(Resource resource) {
        // 观看视频实现
    }

    public boolean submitAssignment(Assignment assignment, String content) {
        // 提交作业实现
        return true;
    }

    public List<String> askQuestion(Course course, String content) {
        // 提问实现
        return null;
    }

    public boolean payCourse(Course course) {
        // 支付课程实现
        return true;
    }
}