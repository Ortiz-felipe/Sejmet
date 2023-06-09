/* eslint-disable prettier/prettier */
import styled from "styled-components"
import Button from '@mui/material/Button';

export const StyledNavBar = styled.div`
     background: ${props => props.theme.colors.backGradient};
     color: white;
     display: flex;
     flex-direction: column;
     justify-content: center;
     align-content: center;
     gap: 5rem;
     width: 6rem !important;
     min-width: 6rem !important;

     z-index: 5;
     width: auto;
     box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
     position: relative;
    .drawner {
        display: flex;
        flex-direction: column;
        gap: 3rem;
        height: 100vh;
        justify-content: space-around;
    }
    .logo {
        width: 3rem;
        margin-left: 0.5rem;
    }
 
 `

export const StyledButtonDrawner = styled(Button)`  
        border: none;
        background-color: transparent;
        font-size: x-large;
        display: flex;
        width: 2rem;
        justify-content: start;
        padding-left: 1.5rem;
        gap: 2rem;
        
    
`

