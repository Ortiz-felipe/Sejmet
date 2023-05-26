/* eslint-disable prettier/prettier */
import styled from "styled-components"
import Button from '@mui/material/Button';

export const StyledNavBar = styled.div`
     background-color: #7eddf2;
     color: white;
     display: flex;
     flex-direction: column;
     justify-content: left;
     padding: 2rem;
     z-index: 5;
     box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
     position: relative;
     grid-column: 1/2;
     grid-row: 2/4;

 
 `

export const StyledButtonDrawner = styled(Button)`
    .button {
        color: white  !important;

    }
        border: none;
        background-color: transparent;
        font-size: x-large;
        border-bottom: 2px solid white;
        padding: 1rem;
        width: 100%;
    
`

