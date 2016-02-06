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

import edu.oakland.cse480.mvc.models.Drink;

@Service
public class DrinkService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcPostgres = jdbcTemplate;
    }

    public List<Drink> getAllDrinks() {
        List<Drink> d = new ArrayList<Drink>();
        try {
            d.addAll(this.jdbcPostgres.query("select * from drink", new DrinkMapper()));
        } catch(Exception e) {
            log.error("No drink found");
        }

        return d;
    }

    public List<Drink> getDrinkById(int id) {
        try {
            return this.jdbcPostgres.query("select * from drink where id = ?", new Object[] {id}, new DrinkMapper());
        } catch(Exception e) {
            log.info("No drink found for id {}", id);
            return new ArrayList<Drink>();
        }
    }

    public List<Drink> getDrinkByName(String name) {
        try {
            return this.jdbcPostgres.query("select * from drink where name = ?", new Object[] {name}, new DrinkMapper());
        } catch(Exception e) {
            log.info("No drink found for name {}", name);
            return new ArrayList<Drink>();
        }
    }

    public void updateDrinkById(Drink d, int id) {
        try {
            this.jdbcPostgres.update("update drink set name = ?, info = ?, make_time = ?, icon_url = ? where id = ?", new Object[] {d.getName(), d.getInfo(), d.getMakeTime(), d.getIconUrl(), id});
        } catch(Exception e) {
            log.info("Cannot update drink with id {}", id);
        }
    }

    public void insertDrink(Drink d) {
        try {
            this.jdbcPostgres.update("insert into drink (name, info, make_time, icon_url) values(?, ?, ?, ?)", new Object[] {d.getName(), d.getInfo(), d.getMakeTime(), d.getIconUrl()});
        } catch(Exception e) {
            log.info("Cannot insert drink");
        }
    }

    public void deleteDrinkById(int id) {
        try {
                this.jdbcPostgres.update("delete from drink where id = ?", new Object[] {id});
        } catch(Exception e) {
            log.info("Cannot delete drink for id {}", id);
        }
    }

    private class DrinkMapper implements RowMapper<Drink> {
        public Drink mapRow(ResultSet rs, int rowNum) throws SQLException {
            Drink d = new Drink();
            d.setId(rs.getInt("id"));
            d.setName(rs.getString("name"));
            d.setInfo(rs.getString("info"));
            d.setMakeTime(rs.getInt("make_time"));
            d.setIconUrl(rs.getString("icon_url"));

            return d;
        }
    }
}
