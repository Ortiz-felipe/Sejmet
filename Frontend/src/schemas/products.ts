export interface Products {
    upc: string;
    tradeName: string;
    laboratoryName: string;
    dosageFormName: string;
    activeCompoundName: string;
    container: number;
    dosage: number;
    price: number;
    currentStock: number;
}

export interface TopSoldProduct {
    id: string,
    upc: string,
    tradeName: string,
    laboratoryName: string
}

export interface CriticalStockProduct {
    id: string,
    upc: string,
    productName: string,
    currentStock: number
}