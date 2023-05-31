export enum TransactionStatus {
    InProgress = 1,
    Accepted,
    InTransit,
    Recieved,
    Cancelled
}

interface TransactionStatusNames {
    [key: number]: string;
}

export const TransactionStatusNames : TransactionStatusNames = {
    1: "En curso",
    2: "Aceptado",
    3: "En camino",
    4: "Recibido",
    5: "Cancelado"
}