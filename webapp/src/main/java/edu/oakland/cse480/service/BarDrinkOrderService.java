package edu.oakland.cse480.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;

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
            return this.jdbcPostgres.query("select availabledrinks.price, drink.make_time, drinkorder.id, drinkorder.drink_id, drinkorder.drink_count, drink.name, drink.icon_url, drinkorder.user_id, users.name as username, drinkorder.time_placed, drinkorder.time_complete, drinkorder.bar_id, drinkorder.comments from availabledrinks, drinkorder left join drink on drink.id = drinkorder.drink_id left join users on users.id = drinkorder.user_id where drinkorder.time_complete is null and users.enabled = 't' and availabledrinks.drink_id = drinkorder.drink_id and drinkorder.bar_id = ? order by drinkorder.time_placed", new Object[] {bar_id}, new BarDrinkOrderMapper());
        } catch(Exception e) {
            log.info("", e);
            return new ArrayList<BarDrinkOrder>();
        }
    }

    public List<BarDrinkOrder> getThreeDrinkOrdersByBarId(int bar_id) {
        try {
            return this.jdbcPostgres.query("select availabledrinks.price, drink.make_time, drinkorder.id, drinkorder.drink_id, drinkorder.drink_count, drink.name, drink.icon_url, drinkorder.user_id, users.name as username, drinkorder.time_placed, drinkorder.time_complete, drinkorder.bar_id, drinkorder.comments from availabledrinks, drinkorder left join drink on drink.id = drinkorder.drink_id left join users on users.id = drinkorder.user_id where users.enabled = 't' and availabledrinks.drink_id = drinkorder.drink_id and drinkorder.bar_id = ? and drinkorder.time_complete is null order by drinkorder.time_placed limit 3", new Object[] {bar_id}, new BarDrinkOrderMapper());
        } catch(Exception e) {
            log.info("", e);
            return new ArrayList<BarDrinkOrder>();
        }
    }

    public List<BarDrinkOrder> getDrinkOrdersByUsername(String username) {
        try {
            return this.jdbcPostgres.query("select availabledrinks.price, drink.make_time, drinkorder.id, drinkorder.drink_id, drinkorder.drink_count, drink.name, drink.icon_url, drinkorder.user_id, users.name as username, drinkorder.time_placed, drinkorder.time_complete, drinkorder.bar_id, drinkorder.comments from availabledrinks, drinkorder left join drink on drink.id = drinkorder.drink_id left join users on users.id = drinkorder.user_id where users.name = ? and availabledrinks.drink_id = drinkorder.drink_id order by drinkorder.time_placed desc", new Object[] {username}, new BarDrinkOrderMapper());
        } catch(Exception e) {
            log.info("", e);
            return new ArrayList<BarDrinkOrder>();
        }
    }

    public int getTotalDrinksOrderedByEmail(String email) {
        int num = 0;
        try {
            num = this.jdbcPostgres.queryForObject("select count(drinkorder.id) from drinkorder left join users on users.id = drinkorder.user_id where users.email = ?", new Object[] {email}, Integer.class);
        } catch(Exception e) {
            log.info("", e);
        }
        return num;
    }

    public List<BarDrinkOrder> getFiveDrinksByEmail(String email) {
        try {
            return this.jdbcPostgres.query("select availabledrinks.price, drink.make_time, drinkorder.id, drinkorder.drink_id, drinkorder.drink_count, drink.name, drink.icon_url, drinkorder.user_id, users.name as username, drinkorder.time_placed, drinkorder.time_complete, drinkorder.bar_id, drinkorder.comments from availabledrinks, drinkorder left join drink on drink.id = drinkorder.drink_id left join users on users.id = drinkorder.user_id where users.email = ? and availabledrinks.drink_id = drinkorder.drink_id order by drinkorder.time_placed desc limit 5", new Object[] {email}, new BarDrinkOrderMapper());
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

    public boolean clearOrder(BarDrinkOrder order) {
        try {
            this.jdbcPostgres.update("update drinkorder set time_complete = ? where id = ?", order.getTimeComplete(), order.getId());
        } catch(Exception e) {
            log.info("", e);
            return false;
        }

        return true;
    }

    public Map<String, Object> getPhoneNumberAndDrinkNameFromDrinkOrderId(int did) {
        try {
            return this.jdbcPostgres.queryForMap("select phonenumber, drink.name from drinkorder, users, drink where drink.id = drinkorder.drink_id and drinkorder.id = ? and users.id = drinkorder.user_id", did);
        } catch(Exception e) {
            log.error("", e);
            return new HashMap<String, Object>();
        }
    }

    public Map<String, Object> getTopDrinkAndTimesOrdered(String email) {
        try {
            return this.jdbcPostgres.queryForMap("select drink.name as name, sum(drinkorder.drink_count) over (partition by drinkorder.drink_id) as count from drinkorder, drink, users where drink.id = drinkorder.drink_id and drinkorder.user_id = users.id and users.email = ? order by count desc limit 1", email);
        } catch(Exception e) {
            log.error("", e);
            return new HashMap<String, Object>();
        }
    }

    private class BarDrinkOrderMapper implements RowMapper<BarDrinkOrder> {
        public BarDrinkOrder mapRow(ResultSet rs, int rowNum) throws SQLException {
            BarDrinkOrder b = new BarDrinkOrder();
            b.setId(rs.getInt("id"));
            b.setDrinkId(rs.getInt("drink_id"));
            b.setDrinkCount(rs.getInt("drink_count"));
            b.setDrinkName(rs.getString("name"));
            b.setMakeTime(rs.getInt("make_time"));
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
