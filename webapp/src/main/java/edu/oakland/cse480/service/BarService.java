package edu.oakland.cse480.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;

import edu.oakland.cse345.mvc.models.Bar;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.*;

@Service
public class BarService extends AbstractJdbcDriver {
	protected final Logger log = LoggerFactory.getLogger(getClass());

	public List<Bar> getAllBars() {
		try {
			List<Bar> b = new ArrayList<Bar>();
			b.addAll(this.jdbcPostgres.query("select * from bar", new BarMapper()));
			return b;
		} catch(Exception er) {
			throw new IllegalArgumentException(er.getMessage());
		}
	}

	private class BarMapper implements RowMapper<Bar>{
		public Bar mapRow(ResultSet rs, int rowNum) throws SQLException {
			Bar r = new Bar();
			r.name = rs.getString("name");
			r.id = rs.getInt("id");
			r.business_id = rs.getString("business_id");
			return r;
		}
	}
}
