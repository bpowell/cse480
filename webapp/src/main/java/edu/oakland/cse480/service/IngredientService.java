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

import edu.oakland.cse480.mvc.models.Ingredient;

@Service
public class IngredientService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcPostgres = jdbcTemplate;
    }

    public List<Ingredient> getAllIngredients() {
        List<Ingredient> i = new ArrayList<Ingredient>();
        try {
            i.addAll(this.jdbcPostgres.query("select ingredient.id, ingredient.name, ingredient.description, icon_url, category_id, categories.name as catname from ingredient, categories where categories.id = ingredient.category_id", new IngredientMapper()));
        } catch(Exception e) {
            log.error("No ingredient found");
            log.error("",e);
        }

        return i;
    }

    public List<Ingredient> getIngredientById(int id) {
        try {
            return this.jdbcPostgres.query("select ingredient.id, ingredient.name, ingredient.description, icon_url, category_id, categories.name as catname from ingredient, categories where categories.id = ingredient.category_id and ingredient.id = ?", new Object[] {id}, new IngredientMapper());
        } catch(Exception e) {
            log.info("No ingredient found for id {}", id);
            return new ArrayList<Ingredient>();
        }
    }

    public List<Ingredient> getIngredientByName(String name) {
        try {
            return this.jdbcPostgres.query("select ingredient.id, ingredient.name, ingredient.description, icon_url, category_id, categories.name as catname from ingredient, categories where categories.id = ingredient.category_id and ingredient.name = ?", new Object[] {name}, new IngredientMapper());
        } catch(Exception e) {
            log.info("No ingredient found for name {}", name);
            return new ArrayList<Ingredient>();
        }
    }

    public void updateIngredientById(Ingredient i, int id) {
        try {
            this.jdbcPostgres.update("update ingredient set name = ?, description = ?, icon_url = ?, category = ? where id = ?", new Object[] {i.getName(), i.getDescription(), i.getIconUrl(), i.getCategory(), id});
        } catch(Exception e) {
            log.info("Cannot update ingredient with id {}", id);
        }
    }

    public boolean insertIngredient(Ingredient i) {
        try {
            this.jdbcPostgres.update("insert into ingredient (name, description, icon_url, category) values(?, ?, ?, ?)", new Object[] {i.getName(), i.getDescription(), i.getIconUrl(), i.getCategory()});
            return true;
        } catch(Exception e) {
            log.info("Cannot insert ingredient");
        }

        return false;
    }

    public void deleteIngredientById(int id) {
        try {
                this.jdbcPostgres.update("delete from ingredient where id = ?", new Object[] {id});
        } catch(Exception e) {
            log.info("Cannot delete ingredient for id {}", id);
        }
    }

    private class IngredientMapper implements RowMapper<Ingredient> {
        public Ingredient mapRow(ResultSet rs, int rowNum) throws SQLException {
            Ingredient i = new Ingredient();
            i.setId(rs.getInt("id"));
            i.setName(rs.getString("name"));
            i.setDescription(rs.getString("description"));
            i.setIconUrl(rs.getString("icon_url"));
            i.setCategory(rs.getInt("category_id"));
            i.setCategoryName(rs.getString("catname"));

            return i;
        }
    }
}
