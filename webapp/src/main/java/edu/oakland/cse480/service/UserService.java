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
            u.addAll(this.jdbcPostgres.query("select users.id, name, email, enabled, roles.role from users, roles where users.role_id = roles.id", new UserMapper()));
            return u;
        } catch(Exception er) {
            log.error("", er);
            throw new IllegalArgumentException(er.getMessage());
        }
    }

    public List<User> getAllStandardUsers() {
        try{
            List<User> u = new ArrayList<User>();
            u.addAll(this.jdbcPostgres.query("select users.id, name, email, enabled, roles.role from users, roles where users.role_id = roles.id and roles.role = 'ROLE_USER'", new UserMapper()));
            return u;
        } catch(Exception er) {
            log.error("", er);
            throw new IllegalArgumentException(er.getMessage());
        }
    }

    public List<User> getAllOwners() {
        try{
            List<User> u = new ArrayList<User>();
            u.addAll(this.jdbcPostgres.query("select users.id, name, email, enabled, roles.role from users, roles where users.role_id = roles.id and roles.role = 'ROLE_OWNER'", new UserMapper()));
            return u;
        } catch(Exception er) {
            log.error("", er);
            throw new IllegalArgumentException(er.getMessage());
        }
    }

    public List<User> getAllBartendersByBarId(int barId) {
        try{
            List<User> u = new ArrayList<User>();
            u.addAll(this.jdbcPostgres.query("select users.id, name, email, enabled, roles.role from users, roles, bartenders where users.role_id = roles.id and roles.role = 'ROLE_EMPLOYEE' and users.id = bartenders.user_id and bartenders.bar_id = ?", new Object[] {barId}, new UserMapper()));
            return u;
        } catch(Exception er) {
            log.error("", er);
            throw new IllegalArgumentException(er.getMessage());
        }
    }

    public int getUserIdByEmail(String email) {
        try {
            return this.jdbcPostgres.queryForObject("select id from users where email = ?", new Object[] {email}, Integer.class);
        } catch(Exception e) {
            log.error("", e);
            return -1;
        }
    }

    public String getUsernameByEmail(String email) {
        try {
            return this.jdbcPostgres.queryForObject("select name from users where email = ?", new Object[] {email}, String.class);
        } catch(Exception e) {
            log.error("", e);
            return e.getMessage();
        }
    }

    private class UserMapper implements RowMapper<User>{
        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User r = new User();
            r.setId(rs.getInt("id"));
            r.setName(rs.getString("name"));
            r.setEmail(rs.getString("email"));
            r.setEnabled(rs.getBoolean("enabled"));
            r.setRole(rs.getString("role"));
            return r;
        }
    }

    public boolean userExists(String name) {
        try {
            return this.jdbcPostgres.queryForObject("select exists(select 1 from users where name = ?)", new Object[] {name}, Boolean.class);
        } catch(Exception e) {
            log.error("", e);
            return false;
        }
    }

    public void insertUser(User u, String role) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(u.getPassword());

        try {
            this.jdbcPostgres.update("insert into users (email, name, password_hash, role_id, enabled) values (?, ?, ?, (select id from roles where role = ?), true)", u.getEmail(), u.getName(), hashedPassword, role);
        } catch(Exception e) {
            log.error("", e);
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
            log.error("", e);
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
            log.error("", e);
            return false;
        }

        return true;
    }

    public boolean updateRole(int userId, int roleId) {
        try {
            int id = this.jdbcPostgres.queryForObject("update users SET role_id = ? where id = ? returning role_id", new Object[] {roleId, userId}, Integer.class);
            if(id!=roleId) {
                return false;
            }
        } catch(Exception e) {
            log.error("", e);
            return false;
        }

        return true;
    }

    public boolean addBartender(int userId, int barId) {
        try {
            this.jdbcPostgres.update("insert into bartenders (user_id, bar_id) values(?, ?)", userId, barId);
        } catch(Exception e) {
            log.error("", e);
            return false;
        }

        return true;
    }

    public boolean removeBartender(int userId) {
        try {
            this.jdbcPostgres.update("delete from bartenders where user_id = ?", userId);
        } catch(Exception e) {
            log.error("", e);
            return false;
        }

        return true;
    }
}
