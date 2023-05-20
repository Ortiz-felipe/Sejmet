/* eslint-disable prettier/prettier */
import { ReactElement } from "react"
import { StyledCard } from "./StyledCard"

interface CardItf {
    title: string
    children: ReactElement
    size: "square" | "WideRectangle" | "HeightRectangle" | "full"
}
const Card = ({ title, children, size }: CardItf) => {
    return (
        <StyledCard>
            <h3>Titulo</h3>
            {children}
        </StyledCard>
    )
}
export default Card
