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
    addElement: (state, action: PayloadAction<Orders>) => {   
      console.log('payload', action.payload)   
      state.orderedProducts =  [...state.orderedProducts, action.payload]
      console.log('state', state.orderedProducts)  
    },
    addAllElements: (state, action: PayloadAction<Orders[]>) => {   
      console.log('payload', action.payload)   
      state.orderedProducts =  [...state.orderedProducts, ...action.payload]
      console.log('state', state.orderedProducts)  
    },
    removeElement: (state, action: PayloadAction<Orders>) => {
      console.log('payload pero para borrar', action.payload)   
      console.log('state borrado', state.orderedProducts)   
      state.orderedProducts = state.orderedProducts.filter((item) => item.upc !== action.payload.upc)
    },  
    removeAllElement: (state, action: PayloadAction<Orders[]>) => {
      console.log('payload pero para borrar', action.payload)   
      console.log('state borrado', state.orderedProducts)   
      state.orderedProducts = state.orderedProducts.filter((item) =>  !action.payload.some((item2) => item.upc === item2.upc))
    }, 
  },

})

export const { addElement, addAllElements, removeAllElement, removeElement } = OrderSlice.actions
export const selectCarro = (state: RootState) => state.orders.orderedProducts
export const selectCarroCantidad = (state: RootState) => state.orders.orderedProducts.length
export const selectCarroSelected = (state: RootState) => state.orders.orderedProducts.map((item) => item.upc)

export default OrderSlice.reducer
