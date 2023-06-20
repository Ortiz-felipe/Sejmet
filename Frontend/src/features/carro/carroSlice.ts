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
  orderedProducts: [],
}

export const OrderSlice = createSlice({
  name: "order",
  initialState,
  // The `reducers` field lets us define reducers and generate associated actions
  reducers: {
    addProduct: (state, action: PayloadAction<OrderProduct>) => {
      state.orderedProducts = [...state.orderedProducts, action.payload]
    },
    addAllSelectedProducts: (state, action: PayloadAction<OrderProduct[]>) => {
      state.orderedProducts = [...state.orderedProducts, ...action.payload]
    },
    removeProduct: (state, action: PayloadAction<string>) => {
      state.orderedProducts = state.orderedProducts.filter(
        (item) => item.productId !== action.payload,
      )
    },
    removeAllSelectedProducts: (state, action: PayloadAction<string[]>) => {
      state.orderedProducts = state.orderedProducts.filter(
        (item) => !action.payload.some((item2) => item.productId === item2),
      )
    },
    incrementProductQuantity: (state, action: PayloadAction<string>) => {
      state.orderedProducts = state.orderedProducts.map((product) => {
        if (product.productId === action.payload) {
          return {
            ...product,
            quantity: product.quantity + 1,
          }
        }
        return product
      })
    },
    decrementProductQuantity: (state, action: PayloadAction<string>) => {
      const updatedProducts = state.orderedProducts.map((product) => {
        if (product.productId === action.payload) {
          if (product.quantity === 1) {
            return null
          } else {
            return {
              ...product,
              quantity: product.quantity - 1,
            } as OrderProduct
          }
        }
        return product
      })

      state.orderedProducts = updatedProducts.filter(
        (product): product is OrderProduct => product !== null,
      )
    },
  },
})

export const {
  addProduct,
  addAllSelectedProducts,
  removeProduct,
  removeAllSelectedProducts,
  incrementProductQuantity,
  decrementProductQuantity,
} = OrderSlice.actions
export const orderedProducts = (state: RootState) =>
  state.orders.orderedProducts
export const selectedOrderedProductsLength = (state: RootState) =>
  state.orders.orderedProducts.length
export const selectedProducts = (state: RootState) =>
  state.orders.orderedProducts.map((item) => item.productId)
export const totalOrderAmount = (state: RootState) =>
  state.orders.orderedProducts.reduce((accumulator, product) => {
    const { productId, quantity, unitPrice } = product
    const productTotal = quantity * unitPrice

    return accumulator + productTotal
  }, 0)

export default OrderSlice.reducer
