package edu.oakland.cse480.service;

import edu.oakland.cse480.mvc.models.Bar;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.*;

public class BarMapper implements RowMapper<Bar>{
    public Bar mapRow(ResultSet rs, int rowNum) throws SQLException {
        Bar r = new Bar();
        r.setName(rs.getString("name"));
        r.setId(rs.getInt("id"));
        r.setBusinessId(rs.getInt("business_id"));
        r.setOwnerId(rs.getInt("owner_id"));
        r.setAddress(rs.getString("address"));
        r.setCity(rs.getString("city"));
        r.setZipcode(rs.getString("zipcode"));
        r.setState(rs.getString("state"));
        r.setNumber(rs.getString("phonenumber"));
        r.setMondayHours(rs.getString("monday"));
        r.setTuesdayHours(rs.getString("tuesday"));
        r.setWednesdayHours(rs.getString("wednesday"));
        r.setThursdayHours(rs.getString("thursday"));
        r.setFridayHours(rs.getString("friday"));
        r.setSaturdayHours(rs.getString("saturday"));
        r.setSundayHours(rs.getString("sunday"));
        return r;
    }
}
