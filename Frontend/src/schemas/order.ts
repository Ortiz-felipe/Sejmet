export interface Orders {
    id: string,
    providerId: string,
    providerName: string,
    totalAmount: number,
    orderDate: string,
    recievedDate: string,
    transactionStatusId: number,
    orderedProducts: OrderProduct[]
}

export interface OrderProduct {
    productId: string,
    productName: string,
    quantity: number,
    unitPrice: number
}

export interface UpdateOrder {
    orderId: string,
    transactionStatusID: number
}

export interface LatestOrder {
    id: string,
    providerName: string,
    totalAmount: number,
    orderDate: string
}