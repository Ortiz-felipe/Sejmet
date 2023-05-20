/* eslint-disable prettier/prettier */
import styled from "styled-components"

export const StyledHome = styled.div`
    grid-column: 2/3;
    grid-row: 2/3;
    .home {
        // whit this create a 4 x 4 grid
        display: grid;
        gap: 1rem;
        padding: 2rem;
        height: -webkit-fill-available;
        grid-template-columns: 1fr 1fr;
        grid-template-rows: 1fr 1fr;
   } 
`
