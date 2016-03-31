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

import edu.oakland.cse480.mvc.models.AvailableDrinks;
import edu.oakland.cse480.mvc.models.Bar;
import edu.oakland.cse480.mvc.models.Drink;

@Service
public class AvailableDrinksService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcPostgres = jdbcTemplate;
    }

    public List<AvailableDrinks> getAllAvailableDrinks() {
        List<AvailableDrinks> a = new ArrayList<AvailableDrinks>();
        try {
            a.addAll(this.jdbcPostgres.query("select * from availabledrinks", new AvailableDrinksMapper()));
        } catch(Exception e) {
            log.error("No available drinks found");
        }

        return a;
    }

    public List<AvailableDrinks> getAvailableDrinksById(int id) {
        try {
            return this.jdbcPostgres.query("select * from availabledrinks where id = ?", new Object[] {id}, new AvailableDrinksMapper());
        } catch(Exception e) {
            log.info("No available drinks found for id {}", id);
            return new ArrayList<AvailableDrinks>();
        }
    }

    public List<Bar> getBarsByDrinkId(int drink_id) {
        try {
            return this.jdbcPostgres.query("select * from bar left join availabledrinks on availabledrinks.bar_id = bar.id where availabledrinks.drink_id = ?", new Object[] {drink_id}, new BarMapper());
        } catch(Exception e) {
            log.info("No available drinks found for drink_id {}", drink_id);
            return new ArrayList<Bar>();
        }
    }

    public List<Drink> getDrinksByBarId(int bar_id) {
        try {
            return this.jdbcPostgres.query("select * from drink left join availabledrinks on availabledrinks.drink_id = drink.id where availabledrinks.bar_id = ?", new Object[] {bar_id}, new DrinkMapper());
        } catch(Exception e) {
            log.info("No available drinks found for bar_id {}", bar_id);
            return new ArrayList<Drink>();
        }
    }

    public boolean insertAvailableDrink(AvailableDrinks a) {
        try {
            this.jdbcPostgres.update("insert into availabledrinks (drink_id, bar_id) values(?, ?)", new Object[] {a.getDrinkId(), a.getBarId()});
        } catch(Exception e) {
            log.info("Cannot insert available drink");
            return false;
        }

        return true;
    }

    public void deleteAvailableDrinkById(int id) {
        try {
            this.jdbcPostgres.update("delete from availabledrinks where id = ?", new Object[] {id});
        } catch(Exception e) {
            log.info("Cannot delete available drink for id {}", id);
        }
    }

    public void deleteAvailableDrinksByBarId(int bar_id) {
        try {
            this.jdbcPostgres.update("delete from availabledrinks where bar_id = ?", new Object[] {bar_id});
        } catch(Exception e) {
            log.info("Cannot delete available drink for bar id {}", bar_id);
        }
    }

    public boolean deleteAvailableDrinkByDrinkId(AvailableDrinks a) {
        try {
            this.jdbcPostgres.update("delete from availabledrinks where drink_id = ? and bar_id = ?", new Object[] {a.getDrinkId(), a.getBarId()});
        } catch(Exception e) {
            log.error("", e);
            return false;
        }

        return true;
    }

    private class AvailableDrinksMapper implements RowMapper<AvailableDrinks> {
        public AvailableDrinks mapRow(ResultSet rs, int rowNum) throws SQLException {
            AvailableDrinks a = new AvailableDrinks();
            a.setId(rs.getInt("id"));
            a.setDrinkId(rs.getInt("drink_id"));
            a.setBarId(rs.getInt("bar_id"));
            return a;
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
