import { HeadCell } from "../../schemas/headCell";

export const soldProductsHead: readonly HeadCell[] = [
    {
        id: "productName",
        numeric: false,
        disablePadding: true,
        label: "Product",
    },
    {
        id: "quantity",
        numeric: false,
        disablePadding: true,
        label: "Cantidad",
    },
    {
        id: "unitPrice",
        numeric: false,
        disablePadding: true,
        label: "Precio unitario",
    },
]