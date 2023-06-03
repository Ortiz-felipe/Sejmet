/* eslint-disable prettier/prettier */
import { StyledButtonDrawner } from "./StyledDrawner"

interface buttonDrwanerItf {
    title: string
    location: string,
    icon: React.ReactNode
}

const ButtonDrawner = ({ title, location, icon }: buttonDrwanerItf) => {
    return (
        <StyledButtonDrawner classes={"button"} type="button" size="large" href={location} startIcon={icon}>{title}</StyledButtonDrawner>
    )
}
export default ButtonDrawner
