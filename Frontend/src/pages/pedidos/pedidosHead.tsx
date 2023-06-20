import { HeadCell } from "../../schemas/headCell";

export const pedidosHead: HeadCell[] = [
    {
        id: "providerName",
        numeric: false,
        disablePadding: true,
        label: "Proveedor",
    },
    {
        id: "orderDate",
        numeric: false,
        disablePadding: true,
        label: "Fecha de orden",
    },
    {
        id: "totalAmount",
        numeric: false,
        disablePadding: true,
        label: "Valor total orden",
    },
    {
        id: "transactionStatusId",
        numeric: false,
        disablePadding: true,
        label: "Estado de la orden",
    },
    {
        id: "details",
        numeric: false,
        disablePadding: false,
        label: "Detalles",
    },
]