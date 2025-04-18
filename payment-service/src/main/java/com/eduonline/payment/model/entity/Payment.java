package com.eduonline.payment.model.entity;

import com.eduonline.common.enums.PaymentMethodEnum;
import com.eduonline.common.enums.PaymentStatusEnum;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Payment {
    private Integer id;
    private Integer orderId;
    private Integer studentId;
    private Integer courseId;
    private Float amount;
    private PaymentStatusEnum status;
    private PaymentMethodEnum method;
    private String transactionId;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    public boolean processPayment() {
        // 处理支付实现
        return true;
    }

    public boolean cancelPayment() {
        // 取消支付实现
        return true;
    }

    public boolean refundPayment() {
        // 退款实现
        return true;
    }
}