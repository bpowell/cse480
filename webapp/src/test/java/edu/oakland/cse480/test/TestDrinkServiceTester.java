package edu.oakland.cse480.test;

import org.junit.Assert;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import edu.oakland.cse480.service.DrinkService;
import edu.oakland.cse480.mvc.models.Drink;

public class TestDrinkServiceTester {
        private static EmbeddedDatabase db;
        private static DrinkService drinkService;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .addScript("sql/mock.sql")
                        .build();

                drinkService = new DrinkService();
                drinkService.setPostgresDataSource(db);
        }

        @Test
        public void testGetAllDrinks() {
                Assert.assertEquals(drinkService.getAllDrinks().size(), 4);
        }

        @Test
        public void testGetDrinkById() {
                Assert.assertEquals(drinkService.getDrinkById(1).size(), 1);
        }

        @Test
        public void testGetDrinkByName() {
                Assert.assertEquals(drinkService.getDrinkByName("beer1").size(), 1);
        }

        public void testGetDrinksByBarId() {
                Assert.assertEquals(drinkService.getDrinksByBarId(2).size(), 4);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
