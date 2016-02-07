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

import edu.oakland.cse480.mvc.models.DrinkOrder;

@Service
public class DrinkOrderService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcPostgres = jdbcTemplate;
    }

    public List<DrinkOrder> getAllDrinkOrders() {
        List<DrinkOrder> d = new ArrayList<DrinkOrder>();
        try {
            d.addAll(this.jdbcPostgres.query("select * from drinkorder", new DrinkOrderMapper()));
        } catch(Exception e) {
            log.error("No drinkorder found");
        }

        return d;
    }

    public List<DrinkOrder> getDrinkOrderById(int id) {
        try {
            return this.jdbcPostgres.query("select * from drinkorder where id = ?", new Object[] {id}, new DrinkOrderMapper());
        } catch(Exception e) {
            log.info("No drinkorder found for id {}", id);
            return new ArrayList<DrinkOrder>();
        }
    }

    public List<DrinkOrder> getDrinkOrderByUserId(int user_id) {
        try {
            return this.jdbcPostgres.query("select * from drinkorder where user_id = ?", new Object[] {user_id}, new DrinkOrderMapper());
        } catch(Exception e) {
            log.info("No drinkorder found for user_id {}", user_id);
            return new ArrayList<DrinkOrder>();
        }
    }

    public void insertDrinkOrder(DrinkOrder d) {
        try {
            this.jdbcPostgres.update("insert into drinkorder (drink_id, drink_count, user_id, time_placed, time_complete, bar_id) values(?, ?, ?, CURRENT_TIME, NULL, ?)", new Object[] {d.getDrinkId(), d.getDrinkCount(), d.getUserId(), d.getBarId()});
        } catch(Exception e) {
            log.info("Cannot insert drinkorder");
        }
    }

    public void closeDrinkOrderById(int id) {
        try {
            this.jdbcPostgres.update("update drinkorder set time_complete = CURRENT_TIME where id = ?", new Object[] {id});
        } catch(Exception e) {
            log.info("Cannot close drinkorder for id {}", id);
        }
    }

    public void deleteDrinkOrderById(int id) {
        try {
                this.jdbcPostgres.update("delete from drinkorder where id = ?", new Object[] {id});
        } catch(Exception e) {
            log.info("Cannot delete drinkorder for id {}", id);
        }
    }

    private class DrinkOrderMapper implements RowMapper<DrinkOrder> {
        public DrinkOrder mapRow(ResultSet rs, int rowNum) throws SQLException {
            DrinkOrder d = new DrinkOrder();
            d.setId(rs.getInt("id"));
            d.setDrinkId(rs.getInt("drink_id"));
            d.setDrinkCount(rs.getInt("drink_count"));
            d.setUserId(rs.getInt("user_id"));
            d.setTimePlaced(rs.getInt("time_placed"));
            d.setTimeComplete(rs.getInt("time_complete"));
            d.setBarId(rs.getString("bar_id"));

            return d;
        }
    }
}
