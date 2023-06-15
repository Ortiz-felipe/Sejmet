export interface Sale {
    id: string,
    customerId: string,
    customerName: string,
    totalAmount: number,
    saleDate: string,
    soldProducts: SaleProduct[]
}

export interface SaleProduct {
    productId: string,
    productName: string,
    quantity: number,
    unitPrice: number
}

export interface CreateSale {
    customerId: string,
    customerName: string,
    totalAmount: number,
    saleDate: string,
    soldProducts: SaleProduct[]
}

export interface SalesByMonth {
    month: string,
    totalAmount: number
}