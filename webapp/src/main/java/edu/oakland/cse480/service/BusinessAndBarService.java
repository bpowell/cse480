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
            return this.jdbcPostgres.query("select bar.id, name, business_id, owner_id, address, city, zipcode, state, phonenumber, monday, tuesday, wednesday, thursday, friday, saturday, sunday from bar left join barhours on barhours.id = bar.id where id = ?", new Object[] {id}, new BarMapper());
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

    public List<Bar> getBarsByOwnerId(int oid) {
        try {
            List<Bar> b = new ArrayList<Bar>();
            b.addAll(this.jdbcPostgres.query("select bar.id, name, business_id, owner_id, address, city, zipcode, state, phonenumber, monday, tuesday, wednesday, thursday, friday, saturday, sunday from bar left join barhours on barhours.id = bar.id where owner_id = ?", new Object[] {oid}, new BarMapper()));
            return b;
        } catch(Exception e) {
            throw new IllegalArgumentException(e.getMessage());
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

    public boolean insertBar(Bar b) {
        try {
            this.jdbcPostgres.update("insert into bar (name, business_id, owner_id, address, city, zipcode, state, phonenumber) values(?, ?, ?, ?, ?, ?, ?, ?)", b.getName(), b.getBusinessId(), b.getOwnerId(), b.getAddress(), b.getCity(), b.getZipcode(), b.getState(), b.getPhoneNumber());
        } catch(Exception e) {
            return false;
        }

        return true;
    }

	private class BarMapper implements RowMapper<Bar>{
		public Bar mapRow(ResultSet rs, int rowNum) throws SQLException {
			Bar b = new Bar();
			b.setId(rs.getInt("id"));
			b.setName(rs.getString("name"));
			b.setBusinessId(rs.getInt("business_id"));
			b.setOwnerId(rs.getInt("owner_id"));
                        b.setAddress(rs.getString("address"));
                        b.setCity(rs.getString("city"));
                        b.setZipcode(rs.getString("zipcode"));
                        b.setState(rs.getString("state"));
                        b.setPhoneNumber(rs.getString("phonenumber"));
                        b.setMondayHours(rs.getString("monday"));
                        b.setTuesdayHours(rs.getString("tuesday"));
                        b.setWednesdayHours(rs.getString("wednesday"));
                        b.setThursdayHours(rs.getString("thursday"));
                        b.setFridayHours(rs.getString("friday"));
                        b.setSaturdayHours(rs.getString("saturday"));
                        b.setSundayHours(rs.getString("sunday"));
 
			return b;
		}
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
