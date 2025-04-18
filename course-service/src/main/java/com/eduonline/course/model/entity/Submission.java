package com.eduonline.course.model.entity;

import com.eduonline.common.enums.SubmissionStatusEnum;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Submission {
    private Integer id;
    private Integer assignmentId;
    private Integer studentId;
    private String content;
    private LocalDateTime submittedAt;
    private SubmissionStatusEnum status;
    private Float score;
    private String feedback;
    private Boolean isLate;

    public Float evaluate() {
        // 评估实现
        return 0.0f;
    }

    public boolean provideFeedback(String feedback) {
        // 提供反馈实现
        return true;
    }
}