package edu.oakland.cse480.test;

import org.junit.Assert;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import edu.oakland.cse480.service.AvailableDrinksService;
import edu.oakland.cse480.mvc.models.AvailableDrinks;

public class TestAvailableDrinkServiceTester {
        private static EmbeddedDatabase db;
        private static AvailableDrinksService availableDrinks;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .build();

                availableDrinks = new AvailableDrinksService();
                availableDrinks.setPostgresDataSource(db);
        }

        @Test
        public void testGetAll() {
                Assert.assertEquals(availableDrinks.getAllAvailableDrinks().size(), 0);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
