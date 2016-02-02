package edu.oakland.cse480.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;

import edu.oakland.cse480.mvc.models.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.*;

@Service
public class UserService extends AbstractJdbcDriver {
	protected final Logger log = LoggerFactory.getLogger(getClass());

    public List<User> getAllUsers() {
            try{
                    List<User> u = new ArrayList<User>();
                    u.addAll(this.jdbcPostgres.query("select * from user", new UserMapper()));
                    return u;
            } catch(Exception er) {
                    throw new IllegalArgumentException(er.getMessage());
            }
    }

    private class UserMapper implements RowMapper<User>{
            public User mapRow(ResultSet rs, int rowNum) throws SQLException {
                    User r = new User();
                    r.name = rs.getString("name");
                    r.id = rs.getInt("id");
                    r.email = rs.getString("email");
                    return r;
            }
    }
}
