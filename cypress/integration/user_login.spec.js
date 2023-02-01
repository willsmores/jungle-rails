describe("User interactions", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("should accept a new user and have the user logged in", () => {
    cy.contains("Signup").click();
    cy.contains("New User Signup");
    cy.get("#user_first_name").type("Lydia");
    cy.get("#user_last_name").type("Miller-Jones");
    cy.get("#user_email").type("lj@gmail.com");
    cy.get("#user_password").type("password");
    cy.get("#user_password_confirmation").type("password");
    cy.contains("Submit").click();
    cy.contains("Hello, Lydia!");
  });

  it("should allow an existing user to logout", () => {
    cy.contains("Logout").click();
    cy.contains("Login");
  });

  it("should allow an existing user to login", () => {
    cy.contains("Login").click();
    cy.contains("Login");
    cy.get("#email").type("lj@gmail.com");
    cy.get("#password").type("password");
    cy.get(".user > div > form > .btn").click();
    cy.contains("Hello, Lydia!");
  });
});
