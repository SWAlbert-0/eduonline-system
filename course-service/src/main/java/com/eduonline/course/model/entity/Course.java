package com.eduonline.course.model.entity;

import com.eduonline.common.enums.CategoryEnum;
import com.eduonline.common.enums.StatusEnum;
import com.eduonline.notification.model.entity.Notification;
import com.eduonline.user.model.entity.Student;
import com.eduonline.user.model.entity.Teacher;
import lombok.Data;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class Course {
    private Integer id;
    private String title;
    private String description;
    private Float price;
    private Teacher teacher;
    private List<Student> students;
    private List<Resource> resources;
    private List<Assignment> assignments;
    private CategoryEnum category;
    private StatusEnum status;
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private Integer enrollmentCount;

    public boolean addResource(Resource resource) {
        // 添加资源实现
        return true;
    }

    public boolean createAssignment(Assignment assignment) {
        // 创建作业实现
        return true;
    }

    public void notifyStudents(Notification notification) {
        // 通知学生实现
    }
}