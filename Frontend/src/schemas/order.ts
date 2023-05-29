export interface Order {
    id: string,
    providerId: string,
    providerName: string,
    totalAmount: number,
    orderDate: Date,
    recievedDate: Date,
    transactionStatusId: number,
    orderedProducts: OrderProduct[]
}

export interface OrderProduct {
    productId: string,
    productName: string,
    quantity: number,
    unitPrice: number
}