import Box from "@mui/material/Box"
import Typography from "@mui/material/Typography"
import useFetch from "../../hook/useFetch"
import Button from "@mui/material/Button"
import { Orders } from "../../schemas/order"
import { formatDate } from "../../utils/utils"
import { TransactionStatusNames } from "../../schemas/transactionStatusEnum"
import Table from "../../ui/Table/Table"
import CloseIcon from '@mui/icons-material/Close';
import { OrderProductHead } from "./OrderProductHead"
import { StyledModal } from "../../ui/Modal/StyledModal";

const style = {
  position: "absolute" as "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 'auto',
  bgcolor: "background.paper",
  border: "2px solid #000",
  boxShadow: 24,
  p: 4,
}

const baseURL = import.meta.env.VITE_BACKEND_URL

const ModalProduct = ({
  open,
  setOpen,
  id,
}: {
  open: boolean
  setOpen: (value: boolean) => void
  id: string
}) => {
  const url = `${baseURL}/Orders/${id}`
  const { data, error } = useFetch<Orders>(url)
  const handleClose = () => setOpen(false)

  console.log('order id', data)
  return (
    <StyledModal
      open={open}
      onClose={handleClose}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <Box sx={style}>
        <Button variant="contained" onClick={handleClose} endIcon={<CloseIcon />} />
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
        <Typography id="modal-modal-description" sx={{ mt: 2, mb: 2 }}>
          Total: {data?.totalAmount}
        </Typography>
        {data?.orderedProducts && (
          <Table data={data.orderedProducts} toolbarVisibility={false} isSelectable={false} headCells={OrderProductHead} />
        )}
      </Box>
    </StyledModal>
  )
}

export default ModalProduct
