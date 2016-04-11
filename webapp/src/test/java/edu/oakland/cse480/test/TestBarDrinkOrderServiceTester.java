package edu.oakland.cse480.test;

import org.junit.Assert;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import edu.oakland.cse480.service.BarDrinkOrderService;
import edu.oakland.cse480.mvc.models.BarDrinkOrder;

public class TestBarDrinkOrderServiceTester {
        private static EmbeddedDatabase db;
        private static BarDrinkOrderService barDrinkOrder;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .addScript("sql/mock.sql")
                        .build();

                barDrinkOrder = new BarDrinkOrderService();
               	barDrinkOrder.setPostgresDataSource(db);
        }

        @Test
        public void testGetDrinkOrdersByUsername() {
                Assert.assertEquals(barDrinkOrder.getDrinkOrdersByUsername("Don").size(), 1);
        }

        @Test
        public void testGetFiveDrinksByEmail() {
                Assert.assertEquals(barDrinkOrder.getFiveDrinksByEmail("don@don.com").size(), 1);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
