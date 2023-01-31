describe("Add to Cart functionality", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("should show products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should show 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("should update the cart count by 1 when the add to cart button is clicked", () => {
    cy.contains("My Cart (0)");
    cy.contains("Add").click();
    cy.contains("My Cart (1)");
  });
});
