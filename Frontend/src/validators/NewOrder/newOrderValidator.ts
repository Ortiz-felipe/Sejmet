import { Validator } from "fluentvalidation-ts"

type CreateOrder = {
  providerId: string
  providerName: string
  totalAmount: number
  orderDate: string
  transactionStatusId: number
  orderedProducts: OrderProduct[]
}

type OrderProduct = {
  productId: string
  productName: string
  quantity: number
  unitPrice: number
}

export class OrderValidator extends Validator<CreateOrder> {
  constructor() {
    super()

    this.ruleFor("providerId")
      .notNull()
      .notEmpty()
      .withMessage("Por favor, seleccione un proveedor")

    this.ruleFor("orderedProducts").notNull()

    this.ruleForEach("orderedProducts").setValidator(
      () => new OrderProductValidator(),
    )
  }
}

class OrderProductValidator extends Validator<OrderProduct> {
  constructor() {
    super()

    this.ruleFor("productId").notNull().notEmpty()

    this.ruleFor("productName").notNull().notEmpty()

    this.ruleFor("quantity").greaterThan(0)

    this.ruleFor("unitPrice").greaterThan(0)
  }
}
