import { HeadCell } from "../../schemas/headCell";

export const ventasHead: HeadCell[] = [
    {
        id: "id",
        numeric: false,
        disablePadding: true,
        label: "ID Venta",
    },
    {
        id: "customerName",
        numeric: false,
        disablePadding: true,
        label: "Nombre cliente",
    },
    {
        id: "totalAmount",
        numeric: false,
        disablePadding: true,
        label: "Valor total",
    },
    {
        id: "saleDate",
        numeric: false,
        disablePadding: true,
        label: "Fecha venta",
    },
    {
        id: "details",
        numeric: false,
        disablePadding: false,
        label: "Detalles",
    },
]