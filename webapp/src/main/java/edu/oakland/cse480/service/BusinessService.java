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
		try {
			List<Business> b = new ArrayList<Business>();
			b.addAll(this.jdbcPostgres.query("select * from business", new BusinessMapper()));
			return b;
		} catch(Exception er) {
			throw new IllegalArgumentException(er.getMessage());
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
