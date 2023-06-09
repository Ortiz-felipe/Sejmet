/* eslint-disable prettier/prettier */
import styled from "styled-components"
import Card from "../ui/Card/Card"
// template for 3 elements 
export const StyledLogin = styled.div`
    display: flex;
    width: 100vw;
    .logo {
        background: ${props => props.theme.colors.backGradient};
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .form {
        flex: 1;       
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        .formulario{
            width: 80%;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            .button {
                background: ${props => props.theme.colors.backGradient};
            }
            .options {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
        }
    }


 
`
