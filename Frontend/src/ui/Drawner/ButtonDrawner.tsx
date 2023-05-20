/* eslint-disable prettier/prettier */
import { StyledButtonDrawner } from "./StyledDrawner"

interface buttonDrwanerItf {
    title: string
    location: string
}

const ButtonDrawner = ({ title, location }: buttonDrwanerItf) => {
    return (
        <div>
            <StyledButtonDrawner type="button" href={location}>{title}</StyledButtonDrawner>
        </div>
    )
}
export default ButtonDrawner
