package edu.oakland.cse480.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;

import edu.oakland.cse480.mvc.models.Bar;
import edu.oakland.cse480.mvc.models.Business;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.*;

@Service
public class BusinessAndBarService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public List<Bar> getAllBars() {
        try {
            List<Bar> b = new ArrayList<Bar>();
            b.addAll(this.jdbcPostgres.query("select bar.id, name, business_id, owner_id, address, city, zipcode, state, phonenumber, monday, tuesday, wednesday, thursday, friday, saturday, sunday from bar left join barhours on barhours.id = bar.id", new BarMapper()));
            return b;
        } catch(Exception er) {
            throw new IllegalArgumentException(er.getMessage());
        }
    }

    public List<Bar> getBarById(int id) {
        try {
            return this.jdbcPostgres.query("select * from bar where id = ?", new Object[] {id}, new BarMapper());
        } catch(Exception e) {
            log.info("No bar found for id {}", id);
            return new ArrayList<Bar>();
        }
    }

    public List<Bar> getBarsByBusinessId(int bid) {
        try {
            List<Bar> b = new ArrayList<Bar>();
            b.addAll(this.jdbcPostgres.query("select bar.id, name, business_id, owner_id, address, city, zipcode, state, phonenumber, monday, tuesday, wednesday, thursday, friday, saturday, sunday from bar left join barhours on barhours.id = bar.id where business_id = ?", new Object[] {bid}, new BarMapper()));
            return b;
        } catch(Exception er) {
            throw new IllegalArgumentException(er.getMessage());
        }
    }

    public List<Business> getAllBusinesses() {
        try {
            List<Business> b = new ArrayList<Business>();
            b.addAll(this.jdbcPostgres.query("select * from business", new BusinessMapper()));
            return b;
        } catch(Exception er) {
            throw new IllegalArgumentException(er.getMessage());
        }
    }

    public List<Business> getAllBusinessAndBars() {
        try {
            List<Business> business = new ArrayList<Business>();
            business = getAllBusinesses();
            for (Business b : business) {
                b.setBars(getBarsByBusinessId(b.getId()));
            }

            return business;
        } catch(Exception e) {
            throw new IllegalArgumentException(e.getMessage());
        }
    }

    public boolean insertBusiness(Business b) {
        try {
            this.jdbcPostgres.update("insert into business (name, info, icon_url) values(?, ?, ?)", b.getName(), b.getInfo(), b.getIconUrl());
        } catch(Exception e) {
            return false;
        }

        return true;
    }

	private class BusinessMapper implements RowMapper<Business>{
		public Business mapRow(ResultSet rs, int rowNum) throws SQLException {
			Business r = new Business();
			r.setName(rs.getString("name"));
			r.setId(rs.getInt("id"));
			r.setInfo(rs.getString("info"));
			r.setIconUrl(rs.getString("icon_url"));
			return r;
		}
	}
}
