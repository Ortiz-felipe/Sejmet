import { Outlet, Navigate } from 'react-router-dom'
import { isLoggedIn } from "./features/userCredentials/userCredentialsSlice"
import { useAppSelector } from "./app/hooks";

const PrivateRoutes = () => {
    const loggedIn = useAppSelector(isLoggedIn)

    return (
        loggedIn ? <Outlet /> : <Navigate to="/login" />
    )
}

export default PrivateRoutes