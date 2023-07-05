import { PayloadAction, createSlice } from "@reduxjs/toolkit"
import { User, UserCredential } from "firebase/auth"
import { RootState } from "../../app/store"

const initialState = {
  isLoggedIn: false,
  userData: {},
}

export const userCredentialSlice = createSlice({
  name: "userData",
  initialState,
  reducers: {
    setLoginStatus: (state, action: PayloadAction<boolean>) => {
      state.isLoggedIn = action.payload
    },
    setUserData: (state, action: PayloadAction<User>) => {
      state.userData = action.payload
    },
    clearUserData: (state) => {
      state.userData = {}
    },
  },
})

export const { setLoginStatus, setUserData, clearUserData } =
  userCredentialSlice.actions
export const isLoggedIn = (state: RootState) => state.userCredentials.isLoggedIn
export const userData = (state: RootState) => state.userCredentials.userData
export default userCredentialSlice.reducer
