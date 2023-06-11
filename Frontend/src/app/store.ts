import { configureStore, ThunkAction, Action } from "@reduxjs/toolkit"
import counterReducer from "../features/counter/counterSlice"
import { OrderSlice } from "../features/carro/carroSlice"
import { SaleSlice } from "../features/sale/saleSlice"
import {userCredentialSlice} from "../features/userCredentials/userCredentialsSlice"

export const store = configureStore({
  reducer: {
    counter: counterReducer,
    orders: OrderSlice.reducer,
    sale: SaleSlice.reducer,
    userCredentials: userCredentialSlice.reducer
  },

})

export type AppDispatch = typeof store.dispatch
export type RootState = ReturnType<typeof store.getState>
export type AppThunk<ReturnType = void> = ThunkAction<
  ReturnType,
  RootState,
  unknown,
  Action<string>
>
