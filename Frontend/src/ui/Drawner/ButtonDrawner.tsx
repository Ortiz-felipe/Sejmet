/* eslint-disable prettier/prettier */
import { StyledButtonDrawner } from "./StyledDrawner"

interface buttonDrwanerItf {
    title: string
    onClick: () => {}
}

const ButtonDrawner = ({ title, onClick }: buttonDrwanerItf) => {
    return (
        <div>
            <StyledButtonDrawner type="button" onClick={onClick} >{title}</StyledButtonDrawner>
        </div>
    )
}
export default ButtonDrawner
