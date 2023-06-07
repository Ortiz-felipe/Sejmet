import { Validator } from 'fluentvalidation-ts'

type CreateOrder = {
    providerId: string,
    providerName: string,
    totalAmount: number,
    orderDate: string,
    transactionStatusId: number,
    orderedProducts: OrderProduct[]
}

type OrderProduct = {
    productId: string,
    productName: string,
    quantity: number,
    unitPrice: number
}

class OrderValidator extends Validator<CreateOrder> {
    constructor() {
        super()

        this.ruleFor("providerId")
            .notNull()
            .notEmpty()
            .withMessage("Por favor")
    }
}