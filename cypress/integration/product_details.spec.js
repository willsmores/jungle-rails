describe("Navigation to Product Page", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("should show products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should navigate to the product page when clicked", () => {
    cy.contains("Scented Blade").click();
    cy.contains("The Scented Blade is an extremely rare, tall plant");
  });
});
