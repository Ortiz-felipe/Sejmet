import { HeadCell } from "../../schemas/headCell";

/* 
ANTERIOR!, REVISAR SI ES EL CORRECTO
export const newSaleHead: HeadCell[] = [
    {
        id: "tradeName",
        numeric: false,
        disablePadding: true,
        label: "Nombre comercial",
    },
    {
        id: "laboratoryName",
        numeric: false,
        disablePadding: true,
        label: "Laboratorio",
    },
    {
        id: "activeCompoundName",
        numeric: false,
        disablePadding: true,
        label: "Principio activo",
    },
    {
        id: "currentStock",
        numeric: false,
        disablePadding: true,
        label: "Stock disponible",
    },
    {
        id: "price",
        numeric: false,
        disablePadding: true,
        label: "Precio",
    },
    {
        id: "details",
        numeric: false,
        disablePadding: false,
        label: "Detalles",
    },
    {
        id: "quantity",
        numeric: false,
        disablePadding: false,
        label: "Cantidad",
    },
] */
export const newSaleHead: HeadCell[] = [
    {
        id: "productId",
        numeric: false,
        disablePadding: true,
        label: "Id del producto",
    },
    {
        id: "productName",
        numeric: false,
        disablePadding: true,
        label: "Nombre comercial",
    },
    {
        id: "unitPrice",
        numeric: false,
        disablePadding: true,
        label: "Precio",
    },

    {
        id: "quantity",
        numeric: false,
        disablePadding: false,
        label: "Cantidad",
    },
] 
