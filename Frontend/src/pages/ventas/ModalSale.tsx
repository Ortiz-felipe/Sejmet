import { Box, Button, Typography } from "@mui/material"
import useFetch from "../../hook/useFetch"
import { Sale } from "../../schemas/sale"
import EnhancedTable from "./EnhancedTableSaleProducts"
import { formatDate } from "../../utils/utils"
import CloseIcon from "@mui/icons-material/Close"
import { StyledModal } from "../../ui/Modal/StyledModal";
import { soldProductsHead } from "./soldProductsHead"
import Table from "../../ui/Table/Table"

const baseURL = import.meta.env.VITE_BACKEND_URL

const style = {
  position: "absolute" as "absolute",
  top: "50%",
  left: "50%",
  transform: "translate(-50%, -50%)",
  width: 'auto',
  bgcolor: "background.paper",
  border: "2px solid #000",
  boxShadow: 24,
  p: 4
}

const ModalSale = ({
  open,
  setOpen,
  id,
}: {
  open: boolean
  setOpen: (value: boolean) => void
  id: string
}) => {
  const url = `${baseURL}/Sales/${id}`
  const { data, error } = useFetch<Sale>(url)
  const handleClose = () => setOpen(false)

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
          Nombre Proveedor: {data?.customerName}
        </Typography>
        <Typography id="modal-modal-description" sx={{ mt: 2 }}>
          Fecha del pedido: {formatDate(data?.saleDate)}
        </Typography>
        <Typography id="modal-modal-description" sx={{ mt: 2, mb: 2 }}>
          Total: {data?.totalAmount}
        </Typography>
        {data?.soldProducts && (
          <Table headCells={soldProductsHead} toolbarVisibility={false} isSelectable={false} data={data.soldProducts} />
        )}
      </Box>
    </StyledModal>
  )
}

export default ModalSale