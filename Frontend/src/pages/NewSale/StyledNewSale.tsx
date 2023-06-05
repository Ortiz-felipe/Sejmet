/* eslint-disable prettier/prettier */
import styled from "styled-components"

export const StyledNewSale = styled.div`
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
    grid-column: 2/3;
    grid-row: 2/3;
    .newClient {
        // whit this create a 4 x 4 grid
        display: grid;
        gap: 1rem;
        padding: 2rem;
        height: -webkit-fill-available;
   } 
   .MuiButton-root {
	color: ${props => props.theme.colors.back};;
    background-color: ${props => props.theme.colors.primary};  }
`
