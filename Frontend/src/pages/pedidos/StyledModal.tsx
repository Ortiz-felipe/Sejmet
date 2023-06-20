import Modal from '@mui/base/Modal';
import styled from "styled-components"

export const StyledModal = styled(Modal)`
        display: flex;
        flex-direction: column;
        background-color: ${props => props.theme.colors.back};
        padding: 3rem;
        flex: 1rem ;
        border-radius: 2rem !important ;
        border: none !important;
        z-index: 150000;
    
    .MuiButton-root {
        position: absolute;
        align-self: center;
        font-weight: 700;
        width: 1rem;
	    color: ${props => props.theme.colors.back};
        background-color: ${props => props.theme.colors.primary};
  }
`