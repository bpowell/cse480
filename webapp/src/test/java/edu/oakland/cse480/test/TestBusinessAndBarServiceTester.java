package edu.oakland.cse480.test;

import org.junit.Assert;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import edu.oakland.cse480.service.BusinessAndBarService;
import edu.oakland.cse480.mvc.models.Bar;
import edu.oakland.cse480.mvc.models.Business;

public class TestBusinessAndBarServiceTester {
        private static EmbeddedDatabase db;
        private static BusinessAndBarService businessAndBar;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .addScript("sql/mock.sql")
                        .build();

                businessAndBar = new BusinessAndBarService();
                businessAndBar.setPostgresDataSource(db);
        }

        @Test
        public void testGetAllBars() {
                Assert.assertEquals(businessAndBar.getAllBars().size(), 2);
        }

        @Test
        public void testGetBarsById() {
                Assert.assertEquals(businessAndBar.getBarsIdByOwnerId(1).size(), 1);
        }

        @Test
        public void testGetBarsIdByOwnerId() {
                Assert.assertEquals(businessAndBar.getBarsIdByOwnerId(1).size(), 1);
        }

        @Test
        public void testGetBarsByBusinessId() {
                Assert.assertEquals(businessAndBar.getBarsByBusinessId(1).size(), 1);
        }

        @Test
        public void testGetBarsByOwnerId() {
                Assert.assertEquals(businessAndBar.getBarsByOwnerId(1).size(), 1);
        }

        @Test
        public void testGetAllBusinesses() {
                Assert.assertEquals(businessAndBar.getAllBusinesses().size(), 2);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
