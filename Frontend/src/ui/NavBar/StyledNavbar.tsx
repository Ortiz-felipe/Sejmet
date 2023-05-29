/* eslint-disable prettier/prettier */
import styled from "styled-components"

const StyledNavBar = styled.div`
    z-index: 20;
    background-color: ${props => props.theme.colors.primary};
     color: white;
     flex-direction: row;
     justify-content: left;
     padding: 2rem;
     padding-left: 4rem;
     box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
     position: relative;
     grid-column: 1/3;
     grid-row: 1/2;
    display: grid;
    align-items: stretch; 
`

export default StyledNavBar
