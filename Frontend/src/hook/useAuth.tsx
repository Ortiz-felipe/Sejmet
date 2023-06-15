import { useEffect } from "react"
import { useAppDispatch } from "../app/hooks"
import { onAuthStateChanged } from "firebase/auth"
import { auth } from "../firebase"
import {
  setLoginStatus,
  setUserData,
} from "../features/userCredentials/userCredentialsSlice"

export const useAuth = () => {
  const dispatch = useAppDispatch()
  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (user) => {
      if (user) {
        console.log(user)
        dispatch(setLoginStatus(true))
        dispatch(setUserData(user))
      } else {
        dispatch(setLoginStatus(false))
      }
    })

    return unsubscribe
  }, [])
}
