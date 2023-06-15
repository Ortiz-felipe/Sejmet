import { Validator } from "fluentvalidation-ts"

type Sale = {
  customerId: string
  customerName: string
  totalAmount: number
  saleDate: string
  soldProducts: Array<SaleProduct>
}

type SaleProduct = {
  productId: string
  productName: string
  quantity: number
  unitPrice: number
}

class SaleProductValidator extends Validator<SaleProduct> {
  constructor() {
    super()

    this.ruleFor("productId").notNull().notEmpty()

    this.ruleFor("productName").notNull().notEmpty()

    this.ruleFor("quantity").greaterThan(0)

    this.ruleFor("unitPrice").greaterThan(0)
  }
}

export class SaleValidator extends Validator<Sale> {
  constructor() {
    super()

    this.ruleFor("customerName")
      .notNull()
      .notEmpty()
      .withMessage("Por favor, asocie esta venta a un cliente")

    this.ruleFor("soldProducts").notNull()

    this.ruleForEach("soldProducts").setValidator(
      (soldProduct) => new SaleProductValidator(),
    )
  }
}
