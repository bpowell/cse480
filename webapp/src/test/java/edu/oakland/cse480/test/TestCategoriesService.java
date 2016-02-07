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
        private static CategoriesService categoriesService;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .build();

                categoriesService = new CategoriesService();
                categoriesService.setPostgresDataSource(db);
        }

        @Test
        public void testFindById() {
                Assert.assertEquals(categoriesService.getCategoryById(1).get(0).getName(), "Beer");
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
