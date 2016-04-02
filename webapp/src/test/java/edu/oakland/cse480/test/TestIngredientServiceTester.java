package edu.oakland.cse480.test;

import org.junit.Assert;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import edu.oakland.cse480.service.IngredientService;
import edu.oakland.cse480.mvc.models.Ingredient;

public class TestIngredientServiceTester {
        private static EmbeddedDatabase db;
        private static IngredientService ingredientService;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .addScript("sql/mock.sql")
                        .build();

                ingredientService = new IngredientService();
                ingredientService.setPostgresDataSource(db);
        }

        @Test
        public void testGetAllIngredients() {
                Assert.assertEquals(ingredientService.getAllIngredients().size(), 3);
        }

        @Test
        public void testIngredientById() {
                Assert.assertEquals(ingredientService.getIngredientById(1).size(), 1);
        }

        @Test
        public void testIngredientByName() {
                Assert.assertEquals(ingredientService.getIngredientByName("spice").size(), 1);
        }

        @Test
        public void testGetIngredientsByDrinkId() {
                Assert.assertEquals(ingredientService.getIngredientsByDrinkId(2).size(), 2);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
