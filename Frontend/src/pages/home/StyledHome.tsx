/* eslint-disable prettier/prettier */
import styled from "styled-components"

export const StyledHome = styled.div`
    grid-column: 2/3;
    grid-row: 2/3;
    .home {
        display: grid;
        width: auto;
        gap: 1rem;
        padding: 2rem;
        grid-template-columns: 1fr 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        background-color: tomato;
   } 
`
