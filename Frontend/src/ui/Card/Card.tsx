/* eslint-disable prettier/prettier */
import { ReactElement } from "react"
import { StyledCard } from "./StyledCard"

interface CardItf {
    title: string
    children: ReactElement
    size?: "square" | "WideRectangle" | "HeightRectangle" | "full"
}
const Card = ({ title, children, size }: CardItf) => {
    return (
        <StyledCard size={size}>
            <h1>{title}</h1>
            {children}
        </StyledCard>
    )
}
export default Card
