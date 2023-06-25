package cn.edu.haust.renting.dao;

import cn.edu.haust.renting.entity.House;
import cn.edu.haust.renting.entity.User;
import io.github.yfblock.yfSql.Annotation.*;

import java.sql.SQLException;
import java.util.List;

@DataRunner
public interface HouseInterface {
    @Select("select * from house")
    public List<House> getHouses() throws SQLException;

    @Delete("delete from house where id = {0}")
    public Integer deleteHouseById(Integer id) throws SQLException;

    @Insert("insert into house (title, position, details, cover, price, area) VALUES('{0}', '{1}', '{2}', '{3}', {4}, {5})")
    public Integer addHouse(String title, String position, String details, String cover, String price, String area) throws SQLException;

    @Find("select * from house where id = {0}")
    public House getHouseById(Integer id) throws SQLException;

    @Select("select * from house where title like '%{0}%'")
    public List<House> findHouseByName(String title) throws SQLException;

    @Select("select * from house where ordered={0}")
    public List<House> findHouseByOrder(Integer ordered) throws SQLException;

    @Update("update house set ordered=1 where id = {0}")
    public Integer toOrderById(Integer id) throws SQLException;
}
