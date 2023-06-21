package cn.edu.haust.renting.entity;

import io.github.yfblock.yfSql.Annotation.DataRunner;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.Date;

@Data
public class User {
    private Integer id;
    private String username;
    private String password;
    private String phone;
    private Integer role;
    private Integer deleted;
    private LocalDateTime createTime;
}
