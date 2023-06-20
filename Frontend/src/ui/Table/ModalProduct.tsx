import { useState } from "react";
import Box from '@mui/material/Box';
import Typography from "@mui/material/Typography"
import { useParams } from "react-router-dom";
import useFetch from "../../hook/useFetch";
import { Products } from "../../schemas/products";
import Button from "@mui/material/Button"
import CloseIcon from '@mui/icons-material/Close';
import { StyledModal } from "../Modal/StyledModal";

const style = {
    position: 'absolute' as 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    width: 800,
    bgcolor: 'background.paper',
    boxShadow: 24,
    borderRadius: '2rem',
    p: 6,
};

const baseURL = import.meta.env.VITE_BACKEND_URL;

const ModalProduct = ({ open, setOpen, upc }) => {
    let { userUPC } = useParams();

    const url = `${baseURL}/Products/${upc}`
    const { data, error } = useFetch<Products>(url)
    const handleClose = () => setOpen(false);

    return (
        <StyledModal
            open={open}
            onClose={handleClose}
            aria-labelledby="modal-modal-title"
            aria-describedby="modal-modal-description"
        >

            <Box sx={style}>
                <Button variant="contained" onClick={handleClose} endIcon={<CloseIcon />} />
                <Typography id="modal-modal-title" variant="h4" component="h4">
                    {data?.tradeName}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    <strong>UPC:</strong> {data?.upc}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    <strong>Laboratory:</strong> {data?.laboratoryName}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    <strong>Dosage Form Name:</strong> {data?.dosageFormName}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    <strong>Active Ingredient:</strong>{data?.activeCompoundName}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    <strong>Container:</strong> {data?.container}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    <strong>Price:</strong> {data?.price}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    <strong>Current Stock:</strong> {data?.currentStock}
                </Typography>
            </Box>
        </StyledModal>
    )
}

export default ModalProduct