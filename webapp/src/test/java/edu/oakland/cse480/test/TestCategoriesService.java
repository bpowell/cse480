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
        public void testGetAll() {
                Assert.assertEquals(categoriesService.getAllCategories().size(), 1);
        }

        @Test
        public void testFindById() {
                Assert.assertEquals(categoriesService.getCategoryById(1).get(0).getName(), "Beer");
        }

        @Test
        public void testFindByName() {
                Assert.assertEquals(categoriesService.getCategoryByName("Beer").get(0).getName(), "Beer");
        }

        @Test
        public void testInsert() {
                Categories c = new Categories();
                c.setName("Test");
                c.setDescription("Test category");
                categoriesService.insertCategories(c);

                Assert.assertEquals(categoriesService.getCategoryByName("Test").get(0).getName(), "Test");
        }

        @Test
        public void testDelete() {
                Categories c = new Categories();
                c.setName("Test");
                c.setDescription("Test category");
                categoriesService.insertCategories(c);

                categoriesService.deleteCategoryById(categoriesService.getCategoryByName("Test").get(0).getId());
                Assert.assertEquals(categoriesService.getCategoryByName("Test").size(), 0);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
