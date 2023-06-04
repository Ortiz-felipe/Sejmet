import { createAsyncThunk, createSlice, PayloadAction } from "@reduxjs/toolkit"
import { RootState, AppThunk } from "../../app/store"
import { Orders, OrderProduct } from "../../schemas/order"



const initialState: Orders = {
    providerId: "",
    providerName: "",
    totalAmount: 0,
    orderDate: "",
    recievedDate: "",
    transactionStatusId: 1,
    orderedProducts: []
}


export const OrderSlice = createSlice({
  name: "order",
  initialState,
  // The `reducers` field lets us define reducers and generate associated actions
  reducers: {
    addElement: (state, action: PayloadAction<OrderProduct>) => {   
      console.log('payload', action)   
      state.providerId +=  action.payload.productId
    },
    removeElement: (state, {payload}) => {
      state.orderedProducts = state.orderedProducts.filter((item) => item.productId !== payload.productId)
    },  
  },

})

export const { addElement, removeElement } = OrderSlice.actions
export const selectCarro = (state: RootState) => state.orders
export default OrderSlice.reducer
