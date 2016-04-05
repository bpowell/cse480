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

import edu.oakland.cse480.mvc.models.BarDrinkOrder;

@Service
public class BarDrinkOrderService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcPostgres = jdbcTemplate;
    }

    public List<BarDrinkOrder> getDrinkOrdersByBarId(int bar_id) {
        try {
            return this.jdbcPostgres.query("select availabledrinks.price, drinkorder.id, drinkorder.drink_id, drinkorder.drink_count, drink.name, drink.icon_url, drinkorder.user_id, users.name as username, drinkorder.time_placed, drinkorder.time_complete, drinkorder.bar_id, drinkorder.comments from availabledrinks, drinkorder left join drink on drink.id = drinkorder.drink_id left join users on users.id = drinkorder.user_id where users.enabled = 't' and availabledrinks.drink_id = drinkorder.drink_id and drinkorder.bar_id = ? order by drinkorder.time_placed", new Object[] {bar_id}, new BarDrinkOrderMapper());
        } catch(Exception e) {
            log.info("", e);
            return new ArrayList<BarDrinkOrder>();
        }
    }

    public List<BarDrinkOrder> getThreeDrinkOrdersByBarId(int bar_id) {
        try {
            return this.jdbcPostgres.query("select availabledrinks.price, drinkorder.id, drinkorder.drink_id, drinkorder.drink_count, drink.name, drink.icon_url, drinkorder.user_id, users.name as username, drinkorder.time_placed, drinkorder.time_complete, drinkorder.bar_id, drinkorder.comments from availabledrinks, drinkorder left join drink on drink.id = drinkorder.drink_id left join users on users.id = drinkorder.user_id where users.enabled = 't' and availabledrinks.drink_id = drinkorder.drink_id and drinkorder.bar_id = ? order by drinkorder.time_placed limit 3", new Object[] {bar_id}, new BarDrinkOrderMapper());
        } catch(Exception e) {
            log.info("", e);
            return new ArrayList<BarDrinkOrder>();
        }
    }

    public List<BarDrinkOrder> getDrinkOrdersByUsername(String username) {
        try {
            return this.jdbcPostgres.query("select availabledrinks.price, drinkorder.id, drinkorder.drink_id, drinkorder.drink_count, drink.name, drink.icon_url, drinkorder.user_id, users.name as username, drinkorder.time_placed, drinkorder.time_complete, drinkorder.bar_id, drinkorder.comments from availabledrinks, drinkorder left join drink on drink.id = drinkorder.drink_id left join users on users.id = drinkorder.user_id where users.name = ? and availabledrinks.drink_id = drinkorder.drink_id order by drinkorder.time_placed desc", new Object[] {username}, new BarDrinkOrderMapper());
        } catch(Exception e) {
            log.info("", e);
            return new ArrayList<BarDrinkOrder>();
        }
    }

    public List<BarDrinkOrder> getFiveDrinksByEmail(String email) {
        try {
            return this.jdbcPostgres.query("select availabledrinks.price, drinkorder.id, drinkorder.drink_id, drinkorder.drink_count, drink.name, drink.icon_url, drinkorder.user_id, users.name as username, drinkorder.time_placed, drinkorder.time_complete, drinkorder.bar_id, drinkorder.comments from availabledrinks, drinkorder left join drink on drink.id = drinkorder.drink_id left join users on users.id = drinkorder.user_id where users.email = ? and availabledrinks.drink_id = drinkorder.drink_id order by drinkorder.time_placed desc limit 5", new Object[] {email}, new BarDrinkOrderMapper());
        } catch(Exception e)  {
            log.info("", e);
            return new ArrayList<BarDrinkOrder>();
        }
    }

    public boolean placeOrder(BarDrinkOrder order) {
        try {
            this.jdbcPostgres.update("insert into drinkorder (drink_id, drink_count, bar_id, user_id, time_placed, comments) values(?,?,?,?,?,?)", order.getDrinkId(), order.getDrinkCount(), order.getBarId(), order.getUserId(), order.getTimePlaced(), order.getComments());
        } catch(Exception e) {
            log.info("", e);
            return false;
        }

        return true;
    }

    private class BarDrinkOrderMapper implements RowMapper<BarDrinkOrder> {
        public BarDrinkOrder mapRow(ResultSet rs, int rowNum) throws SQLException {
            BarDrinkOrder b = new BarDrinkOrder();
            b.setId(rs.getInt("id"));
            b.setDrinkId(rs.getInt("drink_id"));
            b.setDrinkCount(rs.getInt("drink_count"));
            b.setDrinkName(rs.getString("name"));
            b.setDrinkIconUrl(rs.getString("icon_url"));
            b.setUserId(rs.getInt("user_id"));
            b.setUserName(rs.getString("username"));
            b.setTimePlaced(rs.getTimestamp("time_placed"));
            b.setTimeComplete(rs.getTimestamp("time_complete"));
            b.setBarId(rs.getInt("bar_id"));
            b.setComments(rs.getString("comments"));
            b.setPrice(rs.getFloat("price"));
            return b;
        }
    }
}
