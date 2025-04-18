package com.eduonline.course.model.entity;

import com.eduonline.user.model.entity.Student;
import lombok.Data;
import java.time.LocalDateTime;
import java.util.List;

@Data
public class Assignment {
    private Integer id;
    private Integer courseId;
    private String title;
    private String description;
    private LocalDateTime dueDate;
    private List<Submission> submissions;
    private Integer maxScore;

    public Submission submit(Student student, String content) {
        // 提交作业实现
        return null;
    }

    public boolean grade(Submission submission, Float score, String feedback) {
        // 评分实现
        return true;
    }
}