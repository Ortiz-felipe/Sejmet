/* eslint-disable prettier/prettier */
import { useNavigate } from "react-router-dom";
import { StyledButtonDrawner } from "./StyledDrawner"
import Tooltip from '@mui/material/Tooltip';
import firebase from "firebase/compat/app";
import { clearUserData, setLoginStatus } from "../../features/userCredentials/userCredentialsSlice";
import { useDispatch } from "react-redux";
import { getAuth, signOut } from "firebase/auth";

interface buttonDrwanerItf {
    title?: string
    location: string,
    icon: React.ReactNode
}


const ButtonDrawner = ({ title, location, icon }: buttonDrwanerItf) => {
    const navigate = useNavigate();
    const dispatch = useDispatch()
    const onLogout = () => {
        console.log('firebase element', firebase)
        const auth = getAuth();
        signOut(auth).then(() => {
            console.log('se deslogueo')
        }).catch((error) => {
            console.log('error al desloguearse', error)
        });
        dispatch(clearUserData())
        dispatch(setLoginStatus(false))
        navigate("/login")
    }
    if (title === "Salir") return (
        <Tooltip title={title} placement="left" arrow>
            <StyledButtonDrawner className={"button"} type="button" size="large" onClick={onLogout} startIcon={icon}></StyledButtonDrawner>
        </Tooltip>
    )

    return (
        <Tooltip title={title} placement="left" arrow>
            <StyledButtonDrawner className={"button"} type="button" size="large" onClick={() => navigate(location)} startIcon={icon}></StyledButtonDrawner>
        </Tooltip>
    )
}
export default ButtonDrawner
