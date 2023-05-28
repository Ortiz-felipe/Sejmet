import Modal from "@mui/material/Modal"
import styled from "styled-components"

export const StyledModal = styled(Modal)`

    .MuiBox-root {
        display: flex;
        flex-direction: column;
        background-color: ${props => props.theme.colors.back};
    }
    .MuiButton-root {
        position: absolute;
        align-self: end;
        font-weight: 700;
        width: 1rem;
	color: ${props => props.theme.colors.back};;
    background-color: ${props => props.theme.colors.primary};
  }
`