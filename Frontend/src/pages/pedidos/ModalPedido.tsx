import Box from "@mui/material/Box"
import Typography from "@mui/material/Typography"
import { useParams } from "react-router-dom"
import useFetch from "../../hook/useFetch"
import { Products } from "../../schemas/products"
import Button from "@mui/material/Button"
import { StyledModal } from "./StyledModal"
import { Orders } from "../../schemas/order"
import { formatDate } from "../../utils/utils"
import { TransactionStatusNames } from "../../schemas/transactionStatusEnum"
import EnhancedTable from "./EnhancedTableOrderProducts"

const style = {
  position: "absolute" as "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 400,
  bgcolor: "background.paper",
  border: "2px solid #000",
  boxShadow: 24,
  p: 4,
}

const baseURL = import.meta.env.VITE_BACKEND_URL

const ModalProduct = ({
  open,
  setOpen,
  orderId,
}: {
  open: boolean
  setOpen: (value: boolean) => void
  orderId: string
}) => {
  const url = `${baseURL}/Orders/${orderId}`
  const { data, error } = useFetch<Orders>(url)
  const handleClose = () => setOpen(false)

  return (
    <StyledModal
      open={open}
      onClose={handleClose}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <Box sx={style}>
        <Button onClick={handleClose}>X</Button>
        <Typography id="modal-modal-title" variant="h6" component="h2">
          Detalles
        </Typography>
        <Typography id="modal-modal-description" sx={{ mt: 2 }}>
          Nombre Proveedor: {data?.providerName}
        </Typography>
        <Typography id="modal-modal-description" sx={{ mt: 2 }}>
          Fecha del pedido: {formatDate(data?.orderDate)}
        </Typography>
        <Typography id="modal-modal-description" sx={{ mt: 2 }}>
          Estado de la orden:{" "}
          {TransactionStatusNames[data?.transactionStatusId || 1]}
        </Typography>
        <Typography id="modal-modal-description" sx={{ mt: 2 }}>
          Total: {data?.totalAmount}
        </Typography>
        {data?.orderedProducts && (
          <EnhancedTable data={data.orderedProducts} />
        )}
      </Box>
    </StyledModal>
  )
}

export default ModalProduct
