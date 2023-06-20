/* eslint-disable prettier/prettier */
import { useNavigate } from "react-router-dom";
import { StyledButtonDrawner } from "./StyledDrawner"
import Tooltip from '@mui/material/Tooltip';

interface buttonDrwanerItf {
    title?: string
    location: string,
    icon: React.ReactNode
}

const ButtonDrawner = ({ title, location, icon }: buttonDrwanerItf) => {
    const navigate = useNavigate();

    return (
        <Tooltip title={title} placement="left" arrow>
            <StyledButtonDrawner classes={"button"} type="button" size="large" onClick={() => navigate(location)} startIcon={icon}></StyledButtonDrawner>
        </Tooltip>
    )
}
export default ButtonDrawner
