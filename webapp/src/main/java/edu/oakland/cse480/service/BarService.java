package edu.oakland.cse480.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;

import edu.oakland.cse480.mvc.models.Bar;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.*;

@Service
public class BarService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public List<Bar> getAllBars() {
        List<Bar> b = new ArrayList<Bar>();
        try {
            b.addAll(this.jdbcPostgres.query("select * from bar", new BarMapper()));
        } catch(Exception er) {
            throw new IllegalArgumentException(er.getMessage());
        }
        return b;
    }

    public List<Bar> getBarById(int id) {
        try {
            return this.jdbcPostgres.query("select * from bar where id = ?", new Object[] {id}, new BarMapper());
        } catch(Exception e) {
            log.info("No bar found for id {}", id);
            return new ArrayList<Bar>();
        }
    }

    public List<Bar> getBarByName(String name) {
        try {
            return this.jdbcPostgres.query("select * from bar where name = ?", new Object[] {name}, new BarMapper());
        } catch(Exception e) {
            log.info("No bar found for name {}", name);
            return new ArrayList<Bar>();
        }
    }

    public void updateBarById(Bar b, int id) {
        try {
            this.jdbcPostgres.update("update bar set name = ?, business_id = ?, owner_id = ?, contact_info = ?, location = ? where id = ?", new Object[] {b.getName(), b.getBusinessId(), b.getOwnerId(), b.getContactInfo(), b.getLocation(), id});
        } catch(Exception e) {
            log.info("Cannot update bar with id {}", id);
        }
    }

    public void insertBar(Bar b) {
        try {
            this.jdbcPostgres.update("insert into bar (name, business_id, owner_id, contact_info, location) values(?, ?, ?, ?, ?)", new Object[] {b.getName(), b.getBusinessId(), b.getOwnerId(), b.getContactInfo(), b.getLocation()});
        } catch(Exception e) {
            log.info("Cannot insert bar");
        }
    }

    public void deleteBarById(int id) {
        try {
            this.jdbcPostgres.update("delete from bar where id = ?", new Object[] {id});
        } catch(Exception e) {
            log.info("Cannot delete bar for id {}", id);
        }
    }

    private class BarMapper implements RowMapper<Bar>{
        public Bar mapRow(ResultSet rs, int rowNum) throws SQLException {
            Bar b = new Bar();
            b.setId(rs.getInt("id"));
            b.setName(rs.getString("name"));
            b.setBusinessId(rs.getInt("business_id"));
            b.setOwnerId(rs.getInt("owner_id"));
            b.setContactInfo(rs.getString("contact_info"));
            b.setLocation(rs.getString("location"));

            return b;
        }
    }
}
