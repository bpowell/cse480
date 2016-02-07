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
            log.error("No categories found");
        }

        return c;
    }

    public List<Categories> getCategoryById(int id) {
        try {
            return this.jdbcPostgres.query("select * from categories where id = ?", new Object[] {id}, new CategoriesMapper());
        } catch(Exception e) {
            log.info("No category found for id {}", id);
            return new ArrayList<Categories>();
        }
    }

    public List<Categories> getCategoryByName(String name) {
        try {
            return this.jdbcPostgres.query("select * from categories where name = ?", new Object[] {name}, new CategoriesMapper());
        } catch(Exception e) {
            log.info("No category found for name {}", name);
            return new ArrayList<Categories>();
        }
    }

    public void insertCategories(Categories c) {
        try {
            this.jdbcPostgres.update("insert into categories (name, description) values(?, ?)", new Object[] {c.getName(), c.getDescription()});
        } catch(Exception e) {
            log.info("Cannot insert categories");
        }
    }

    public void deleteCategoryById(int id) {
        try {
                this.jdbcPostgres.update("delete from categories where id = ?", new Object[] {id});
        } catch(Exception e) {
            log.info("Cannot delete category for id {}", id);
        }
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
