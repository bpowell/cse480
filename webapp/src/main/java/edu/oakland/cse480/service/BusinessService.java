package edu.oakland.cse480.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;

import edu.oakland.cse480.mvc.models.Business;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.*;

@Service
public class BusinessService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public List<Business> getAllBusinesses() {
        List<Business> b = new ArrayList<Business>();
        try {
            b.addAll(this.jdbcPostgres.query("select * from business", new BusinessMapper()));
        } catch(Exception e) {
            log.error("No business found");
        }
        return b;
    }

    public List<Business> getBusinessById(int id) {
        try {
            return this.jdbcPostgres.query("select * from business where id = ?", new Object[] {id}, new BusinessMapper());
        } catch(Exception e) {
            log.info("No business found for id {}", id);
            return new ArrayList<Business>();
        }
    }

    public List<Business> getBusinessByName(String name) {
        try {
            return this.jdbcPostgres.query("select * from business where name = ?", new Object[] {name}, new BusinessMapper());
        } catch(Exception e) {
            log.info("No business found for name {}", name);
            return new ArrayList<Business>();
        }
    }

    public void updateBusinessById(Business b, int id) {
        try {
            this.jdbcPostgres.update("update business set name = ?, info = ?, icon_url = ? where id = ?", new Object[] {b.getName(), b.getInfo(), b.getIconUrl(), id});
        } catch(Exception e) {
            log.info("Cannot update business with id {}", id);
        }
    }

    public void insertBusiness(Business b) {
        try {
            this.jdbcPostgres.update("insert into business (name, info, icon_url) values(?, ?, ?)", new Object[] {b.getName(), b.getInfo(), b.getIconUrl()});
        } catch(Exception e) {
            log.info("Cannot insert business");
        }
    }

    public void deleteBusinessById(int id) {
        try {
            this.jdbcPostgres.update("delete from business where id = ?", new Object[] {id});
        } catch(Exception e) {
            log.info("Cannot delete business for id {}", id);
        }
    }

    private class BusinessMapper implements RowMapper<Business>{
        public Business mapRow(ResultSet rs, int rowNum) throws SQLException {
            Business b = new Business();
            b.setId(rs.getInt("id"));
            b.setName(rs.getString("name"));
            b.setInfo(rs.getString("info"));
            b.setIconUrl(rs.getString("icon_url"));
            return b;
        }
    }
}
