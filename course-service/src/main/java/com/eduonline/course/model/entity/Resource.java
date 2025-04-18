package com.eduonline.course.model.entity;

import com.eduonline.common.enums.ResourceTypeEnum;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Resource {
    private Integer id;
    private Integer courseId;
    private String title;
    private ResourceTypeEnum type;
    private String url;
    private Long size;
    private LocalDateTime uploadedAt;

    public int view() {
        // 查看资源实现
        return 0;
    }

    public boolean download() {
        // 下载资源实现
        return true;
    }
}