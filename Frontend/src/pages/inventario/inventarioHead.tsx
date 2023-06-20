import { HeadCell } from "../../schemas/headCell";

export const inventarioHead: readonly HeadCell[] = [
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
]