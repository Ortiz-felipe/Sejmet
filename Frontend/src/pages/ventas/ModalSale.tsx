import { Box, Button, Typography } from "@mui/material"
import useFetch from "../../hook/useFetch"
import { Sale } from "../../schemas/sale"
import { StyledModal } from "./StyledModal"
import EnhancedTable from "./EnhancedTableSaleProducts"
import { formatDate } from "../../utils/utils"
import CloseIcon from "@mui/icons-material/Close"

const baseURL = import.meta.env.VITE_BACKEND_URL

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

const ModalSale = ({
    open,
    setOpen,
    saleId,
  }: {
    open: boolean
    setOpen: (value: boolean) => void
    saleId: string
  }) => {
    const url = `${baseURL}/Sales/${saleId}`
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
          <Typography id="modal-modal-description" sx={{ mt: 2 }}>
            Total: {data?.totalAmount}
          </Typography>
          {data?.soldProducts && (
            <EnhancedTable data={data.soldProducts} />
          )}
        </Box>
      </StyledModal>
    )
  }

export default ModalSale