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
        public void testAyyLmao() {
                Assert.assertEquals(4, 4);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
