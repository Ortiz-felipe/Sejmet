import { HeadCell } from "../../schemas/headCell";

export const OrderProductHead: HeadCell[] = [
    {
        id: "productId",
        numeric: false,
        disablePadding: true,
        label: "Product Id",
    },
    {
        id: "productName",
        numeric: false,
        disablePadding: true,
        label: "Nombre de Producto",
    },
    {
        id: "quantity",
        numeric: true,
        disablePadding: true,
        label: "Cantidad",
    },
    {
        id: "unitPrice",
        numeric: true,
        disablePadding: true,
        label: "Precio unitario",
    },
]
