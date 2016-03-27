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

import edu.oakland.cse480.mvc.models.Categories;

@Service
public class CategoriesService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public List<Categories> getAllCategories() {
        List<Categories> c = new ArrayList<Categories>();
        try {
            c.addAll(this.jdbcPostgres.query("select * from categories", new CategoriesMapper()));
        } catch(Exception e) {
            log.error("", e);
        }

        return c;
    }

    private class CategoriesMapper implements RowMapper<Categories> {
        public Categories mapRow(ResultSet rs, int rowNum) throws SQLException {
            Categories c = new Categories();
            c.setId(rs.getInt("id"));
            c.setName(rs.getString("name"));
            c.setDescription(rs.getString("description"));

            return c;
        }
    }
}
