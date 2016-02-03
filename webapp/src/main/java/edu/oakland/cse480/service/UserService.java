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
                    r.setName(rs.getString("name"));
                    r.setId(rs.getInt("id"));
                    r.setEmail(rs.getString("email"));
                    return r;
            }
    }

    public boolean userExists(String name) {
        try {
            return this.jdbcPostgres.queryForObject("select exists(select 1 from users where name = ?)", new Object[] {name}, Boolean.class);
        } catch(Exception e) {
            return false;
        }
    }

    public void insertUser(User u, String passwordHash, String role) {
        try {
            this.jdbcPostgres.update("insert into users (email, name, password_hash, role_id) values (?, ?, ?, (select id from roles where role = ?))", u.getEmail(), u.getName(), passwordHash, role);
        } catch(Exception e) {
        }
    }
}
