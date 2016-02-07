package edu.oakland.cse480.test;

import org.junit.Assert;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import edu.oakland.cse480.service.CategoriesService;

public class TestCategoriesService {
        private static EmbeddedDatabase db;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .build();
        }

        @Test
        public void testFindById() {
                CategoriesService cs = new CategoriesService();
                cs.setPostgresDataSource(db);

                Assert.assertEquals(cs.getCategoryById(1).get(0).getName(), "Beer");
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
