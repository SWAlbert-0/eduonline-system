package com.eduonline.payment.model.entity;

import com.eduonline.common.enums.OrderStatusEnum;
import com.eduonline.common.enums.PaymentMethodEnum;
import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Order {
    private Integer id;
    private Integer studentId;
    private Integer courseId;
    private Float amount;
    private OrderStatusEnum status;
    private LocalDateTime createdAt;
    private LocalDateTime expireAt;

    public boolean pay(PaymentMethodEnum method) {
        // 支付实现
        return true;
    }

    public boolean cancel() {
        // 取消订单实现
        return true;
    }

    public boolean refund() {
        // 退款实现
        return true;
    }

    public String generateInvoice() {
        // 生成发票实现
        return "";
    }
}