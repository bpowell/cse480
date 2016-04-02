package edu.oakland.cse480.test;

import org.junit.Assert;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

import edu.oakland.cse480.service.RoleService;
import edu.oakland.cse480.mvc.models.Role;

public class TestRoleServiceTester {
        private static EmbeddedDatabase db;
        private static RoleService roleService;

        @BeforeClass
        public static void setUp() {
                db = new EmbeddedDatabaseBuilder()
                        .setType(EmbeddedDatabaseType.HSQL)
                        .addScript("sql/hsql.sql")
                        .addScript("sql/create.sql")
                        .addScript("sql/mock.sql")
                        .build();

                roleService = new RoleService();
                roleService.setPostgresDataSource(db);
        }

        @Test
        public void testGetAllRoles() {
                Assert.assertEquals(roleService.getAllRoles().size(), 7);
        }

        @AfterClass
        public static void shutdown() {
                db.shutdown();
        }
}
