import { HeadCell } from "../../schemas/headCell";

export const newOrderCells: readonly HeadCell[] = [
  {
    id: "productName",
    numeric: false,
    disablePadding: true,
    label: "Producto",
  },
  {
    id: "unitPrice",
    numeric: false,
    disablePadding: true,
    label: "Precio por unidad",
  },
  {
    id: "totalPrice",
    numeric: false,
    disablePadding: true,
    label: "Precio final",
  },
  {
    id: "quantity",
    numeric: false,
    disablePadding: false,
    label: "Cantidad",
  },
]