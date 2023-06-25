package cn.edu.haust.renting.entity;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class House {
    private Integer id;
    private String title;
    private String position;
    private String details;
    private String cover;
    private Double price;
    private Double area;
    private Integer ordered;
    private LocalDateTime updateTime;
    private LocalDateTime createTime;
}
