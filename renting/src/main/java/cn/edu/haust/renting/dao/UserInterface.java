package cn.edu.haust.renting.dao;

import cn.edu.haust.renting.entity.User;
import io.github.yfblock.yfSql.Annotation.DataRunner;
import io.github.yfblock.yfSql.Annotation.Find;
import io.github.yfblock.yfSql.Annotation.Insert;
import io.github.yfblock.yfSql.Annotation.Select;

import java.sql.SQLException;
import java.util.List;

@DataRunner
public interface UserInterface {
    @Select("select * from user")
    public List<User> getUsers() throws SQLException;

    @Find("select * from user where username='{0}'")
    public User getUserByUsername(String username) throws SQLException;

    @Insert("insert into user (username, password) VALUES ('{0}','{1}')")
    public Integer addUser(String username, String password) throws SQLException;

}
