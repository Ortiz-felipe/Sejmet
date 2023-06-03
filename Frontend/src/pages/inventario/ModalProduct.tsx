import { useState } from "react";
import Box from '@mui/material/Box';
import Typography from "@mui/material/Typography"
import { useParams } from "react-router-dom";
import useFetch from "../../hook/useFetch";
import { Products } from "../../schemas/products";
import Button from "@mui/material/Button"
import { StyledModal } from "./StyledModal";

const style = {
    position: 'absolute' as 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    width: 400,
    bgcolor: 'background.paper',
    border: '2px solid #000',
    boxShadow: 24,
    p: 4,
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
                <Button onClick={handleClose}>X</Button>
                <Typography id="modal-modal-title" variant="h6" component="h2">
                    {data?.tradeName}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    UPC: {data?.upc}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    Laboratory: {data?.laboratoryName}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    Dosage Form Name: {data?.dosageFormName}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    Active Ingredient: {data?.activeCompoundName}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    Container: {data?.container}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    Price: {data?.price}
                </Typography>
                <Typography id="modal-modal-description" sx={{ mt: 2 }}>
                    Current Stock: {data?.currentStock}
                </Typography>
            </Box>
        </StyledModal>
    )
}

export default ModalProduct