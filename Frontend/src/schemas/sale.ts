export interface Sale {
    saleId: string,
    customerId: string,
    customerName: string,
    totalAmount: number,
    saleDate: Date,
    soldProducts: SaleProduct[]
}

export interface SaleProduct {
    productId: string,
    productName: string,
    quantity: number,
    unitPrice: number
}