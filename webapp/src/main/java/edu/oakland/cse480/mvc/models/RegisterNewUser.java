package edu.oakland.cse480.mvc.models;

import org.hibernate.validator.constraints.NotBlank;

public class RegisterNewUser {
        @NotBlank
        private String email;

        @NotBlank
        private String password;

        @NotBlank
        private String passwordConfirm;

        @NotBlank
        private String name;

        public String getEmail() {
                return this.email;
        }

        public void setEmail(String email) {
                this.email = email;
        }

        public String getPassword() {
                return this.password;
        }

        public void setPassword(String password) {
                this.password = password;
        }

        public String getPasswordConfirm() {
                return this.passwordConfirm;
        }

        public void setPasswordConfirm(String passwordConfirm) {
                this.passwordConfirm = passwordConfirm;
        }

        public String getName() {
                return this.name;
        }

        public void setName(String name) {
                this.name = name;
        }
}
