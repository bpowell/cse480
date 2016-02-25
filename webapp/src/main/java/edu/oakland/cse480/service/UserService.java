package edu.oakland.cse480.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;
import java.util.Objects;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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

    public void insertUser(User u, String role) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(u.getPassword());

        try {
            this.jdbcPostgres.update("insert into users (email, name, password_hash, role_id, enabled) values (?, ?, ?, (select id from roles where role = ?), true)", u.getEmail(), u.getName(), hashedPassword, role);
        } catch(Exception e) {
        }
    }

    public boolean verifyUser(String email, String password) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        String passwordFromdb;
        try {
            passwordFromdb = this.jdbcPostgres.queryForObject("select password_hash from users where email = ?", new Object[] {email}, String.class);
            if(passwordEncoder.matches(password, passwordFromdb)) {
                return true;
            }
        } catch(Exception e) {
        }

        return false;
    }

    public boolean updatePassword(String email, String password) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(password);

        try {
            String result = this.jdbcPostgres.queryForObject("update users SET password_hash = ? where email = ? returning password_hash", new Object[] {hashedPassword, email}, String.class);
            if(!Objects.equals(result, hashedPassword)) {
                return false;
            }
        } catch(Exception e) {
            log.error(e.getMessage());
            return false;
        }

        return true;
    }
}
