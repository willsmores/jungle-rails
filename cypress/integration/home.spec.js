describe("Navigation to Home Page", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("should show products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should show 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});
