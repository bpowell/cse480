package edu.oakland.cse480.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class BarStatsService extends AbstractJdbcDriver {
    protected final Logger log = LoggerFactory.getLogger(getClass());

    public int totalNumberOfAvailableDrinksForBar(int barId) {
        try {
            return this.jdbcPostgres.queryForObject("select count(id) from availabledrinks where bar_id = ?", Integer.class, barId);
        } catch(Exception e) {
            log.error("", e);
        }

        return 0;
    }

    public int totalNumberOfDrinksServedAtBat(int barId) {
        try {
            return this.jdbcPostgres.queryForObject("select count(id) from drinkorder where bar_id = ? and time_complete is not null", Integer.class, barId);
        } catch(Exception e) {
            log.error("", e);
        }

        return 0;
    }

    public int totalNumberOfDrinksInQueueAtBar(int barId) {
        try {
            return this.jdbcPostgres.queryForObject("select count(id) from drinkorder where bar_id = ? and time_complete is null", Integer.class, barId);
        } catch(Exception e) {
            log.error("", e);
        }

        return 0;
    }

    public String totalQueueWaitTimeForBar(int barId) {
        try {
            return this.jdbcPostgres.queryForObject("select to_char(sum(drink_count*make_time) * interval '1 second', 'HH24:MI:SS') as timeleft from drink, drinkorder where drink.id = drinkorder.drink_id and drinkorder.bar_id = ?", String.class, barId);
        } catch(Exception e) {
            log.error("", e);
        }

        return "";
    }
}
