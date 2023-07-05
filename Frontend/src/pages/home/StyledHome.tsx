/* eslint-disable prettier/prettier */
import styled from "styled-components"

export const StyledHome = styled.div`
    grid-column: 2/3;
    grid-row: 2/3;
    width: 100%;
    .home {
        transition: auto;
        min-height: 90%;
        display: grid;
        gap: 1rem;
        padding: 2rem;
        grid-template-columns: 1fr 1fr 1fr;
        grid-template-rows: 1fr 1fr;
        background-color: ${props => props.theme.colors.back};
        height: -webkit-fill-available;
        max-height: 100vh;
        border-top-left-radius: 2rem;
        border-bottom-left-radius: 2rem;
        width: calc(100% - 2rem);
        left: -2rem;
        z-index: 100;
        position: relative;
   } 
`
