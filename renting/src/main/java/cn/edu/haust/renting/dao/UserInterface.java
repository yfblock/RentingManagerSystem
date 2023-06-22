package cn.edu.haust.renting.dao;

import cn.edu.haust.renting.entity.User;
import io.github.yfblock.yfSql.Annotation.*;

import java.sql.SQLException;
import java.util.List;

@DataRunner
public interface UserInterface {
    @Select("select * from user where deleted = 0")
    public List<User> getUsers() throws SQLException;

    @Find("select * from user where deleted = 0 and username='{0}'")
    public User getUserByUsername(String username) throws SQLException;

    @Find("select * from user where deleted = 0 and id = {0}")
    public User getUserById(Integer id) throws SQLException;

    @Insert("insert into user (username, password) VALUES ('{0}','{1}')")
    public Integer addUser(String username, String password) throws SQLException;

    @Update("update user set deleted = 1 where id = {0}")
    public Integer deleteUserById(Integer id) throws SQLException;

    @Insert("insert into user (username, password, phone) VALUES ('{0}','{1}', '{2}')")
    public Integer addUserWithPhone(String username, String password, String phone) throws SQLException;

    @Update("update user set password = '{1}', phone = '{2}' where id = {0}")
    public Integer updateUserInfoById(Integer id, String password, String phone) throws SQLException;
}
