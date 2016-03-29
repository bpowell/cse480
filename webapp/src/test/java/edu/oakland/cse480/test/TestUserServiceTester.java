package edu.oakland.cse480.test;

import org.junit.Assert;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import edu.oakland.cse480.service.UserService;
import edu.oakland.cse480.mvc.models.User;

public class TestUserServiceTester {
        private static EmbeddedDatabase db;
        private static UserService userService;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .addScript("sql/mock.sql")
                        .build();

                userService = new UserService();
                userService.setPostgresDataSource(db);
        }

        @Test
        public void testGetAllUsers() {
                Assert.assertEquals(userService.getAllUsers().size(), 10);
        }

        @Test
        public void testGetAllStandardUsers() {
                Assert.assertEquals(userService.getAllStandardUsers().size(), 4);
        }

        @Test
        public void testGetAllOwners() {
                Assert.assertEquals(userService.getAllOwners().size(), 2);
        }

        @Test
        public void testGetAllBartendersByBarId() {
                Assert.assertEquals(userService.getAllBartendersByBarId(1).size(), 2);
        }

        @Test
        public void testGetUserIdByEmail() {
                Assert.assertEquals(userService.getUserIdByEmail("admin@admin"), 1);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
