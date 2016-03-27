package edu.oakland.cse480.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.*;
import org.springframework.jdbc.core.JdbcTemplate;

import edu.oakland.cse480.mvc.models.Role;

@Service
public class RoleService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public List<Role> getAllRoles() {
        List<Role> r = new ArrayList<Role>();
        try {
            r.addAll(this.jdbcPostgres.query("select * from roles", new RoleMapper()));
        } catch(Exception e) {
            log.error("", e);
        }

        return r;
    }

    private class RoleMapper implements RowMapper<Role> {
        public Role mapRow(ResultSet rs, int rowNum) throws SQLException {
            Role r = new Role();
            r.setId(rs.getInt("id"));
            r.setRole(rs.getString("role"));
            r.setInfo(rs.getString("info"));

            return r;
        }
    }
}
