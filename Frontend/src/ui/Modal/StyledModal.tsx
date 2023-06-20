import Modal from '@mui/material/Modal';
import { Box } from '@mui/material';
import styled from "styled-components"

export const StyledModal = styled(Modal)`
   position: fixed;
    z-index: 1300;
    right: 0;
    bottom: 0;
    top: 0;
    left: 0;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    flex-direction: column;
    width: auto;
    h4 {
      margin-bottom: 2rem;
    }  
   
    .MuiTypography-root strong {
        font-size: 1.1rem;
        font-weight: 700;
        margin-right: 0.5rem;
    }
  
      
   
    .MuiButton-root {
        position: absolute;
        top: 2rem;
        right: 2rem;
        align-self: center;
        font-weight: 700;
        width: auto;
        padding: 0.5rem;
	    color: ${props => props.theme.colors.back};
        background-color: ${props => props.theme.colors.primary};
        z-index: 1500;
      span {
        margin: 0px
      }
  }
` 