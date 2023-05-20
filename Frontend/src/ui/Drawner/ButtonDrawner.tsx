/* eslint-disable prettier/prettier */
import { StyledButtonDrawner } from "./StyledDrawner"

interface buttonDrwanerItf {
    title: string
    location: string
}

const ButtonDrawner = ({ title, location }: buttonDrwanerItf) => {
    return (
        <StyledButtonDrawner classes={"button"} type="button" size="large" href={location}>{title}</StyledButtonDrawner>
    )
}
export default ButtonDrawner
