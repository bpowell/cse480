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
import edu.oakland.cse480.mvc.models.Categories;

public class TestCategoriesServiceTester {
        private static EmbeddedDatabase db;
        private static CategoriesService categories;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .addScript("sql/mock.sql")
                        .build();

                categories = new CategoriesService();
                categories.setPostgresDataSource(db);
        }

        @Test
        public void testGetAllDrinks() {
                Assert.assertEquals(categories.getAllCategories().size(), 5);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
