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
                        .addScript("sql/mock.sql")
                        .build();

                availableDrinks = new AvailableDrinksService();
                availableDrinks.setPostgresDataSource(db);
        }

        @Test
        public void testGetAllAvailableDrinks() {
                Assert.assertEquals(availableDrinks.getAllAvailableDrinks().size(), 4);
        }

        @Test
        public void testGetAvailableDrinksById() {
                Assert.assertEquals(availableDrinks.getAvailableDrinksById(1).size(), 1);
        }

        @Test
        public void testGetBarsByDrinkId() {
                Assert.assertEquals(availableDrinks.getBarsByDrinkId(2).size(), 1);
        }

        @Test
        public void testGetDrinksByBarId() {
                Assert.assertEquals(availableDrinks.getDrinksByBarId(1).size(), 1);
        }

        @Test
        public void testGetDrinksByBarIdAndDrinkName() {
                Assert.assertEquals(availableDrinks.getDrinksByBarIdAndDrinkName(2, "beer3").size(), 1);
        }




        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
