/* eslint-disable prettier/prettier */
import styled from "styled-components"

export const StyledNewClient = styled.div`
    box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
    width: 100%;
    display: flex;
    .newClient {
        transition: auto;
        min-height: 90%;
        display: flex;
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
        align-items: stretch;
        flex-direction: column;
        justify-content: center;
   } 
   .grid-new-client {
        display: grid;
        grid-template-columns: 1fr 1fr 1fr 1fr;
        gap: 2rem
    }
    .flex-address {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-between;
    }
    .spaceBetween {
        
    }
   .MuiButton-root {
	color: ${props => props.theme.colors.back};;
    background-color: ${props => props.theme.colors.primary};

    width: fit-content;
    align-self: end;
        
    }
    .MuiButton-root:disabled {
    	background-color: ${props => props.theme.colors.back};;
        color: ${props => props.theme.colors.primary};
    }
`
