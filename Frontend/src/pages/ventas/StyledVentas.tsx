/* eslint-disable prettier/prettier */
import styled from "styled-components"

export const StyledVentas = styled.div`
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
    grid-column: 2/3;
    grid-row: 2/3;
    width: 100%;





    .ventas {
        // whit this create a 4 x 4 grid
        gap: 1rem;
        padding: 2rem;
        background-color: ${props => props.theme.colors.back};
        height: -webkit-fill-available;
        border-top-left-radius: 2rem;
        border-bottom-left-radius: 2rem;
        width: calc(100% - 2rem);
        left: -2rem;
        z-index: 100;
        position: relative;
        display: flex;
        flex-direction: column;
        justify-content: center;
   } 
`
