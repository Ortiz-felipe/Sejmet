import { createSlice, PayloadAction } from "@reduxjs/toolkit"
import { RootState } from "../../app/store"
import { Sale, SaleProduct } from "../../schemas/sale"

const initialState: Sale = {
  customerId: "",
  customerName: "",
  saleDate: "",
  totalAmount: 0,
  soldProducts: [],
}

export const SaleSlice = createSlice({
  name: "Sale",
  initialState,
  reducers: {
    updateSaleData: (state, action: PayloadAction<Sale>) => {
      state = action.payload
    },
    addProductToSale: (state, action: PayloadAction<SaleProduct>) => {
      const previouslyAddedProduct = state.soldProducts.find(
        (x) => x.productId === action.payload.productId,
      )

      if (previouslyAddedProduct === undefined) {
        console.log(state)
        state.soldProducts = [
          ...state.soldProducts,
          {
            productId: action.payload.productId,
            productName: action.payload.productName,
            quantity: 1,
            unitPrice: action.payload.unitPrice,
          },
        ]
      } else {
        state.soldProducts = state.soldProducts.map((product) => {
          if (product.productId === previouslyAddedProduct?.productId) {
            return { ...product, quantity: product.quantity + 1 }
          }
          return product
        })
      }
    },
    removeProductFromSale: (state, action: PayloadAction<SaleProduct>) => {
      const previouslyAddedProduct = state.soldProducts.find(
        (x) => x.productId === action.payload.productId,
      )

      if (previouslyAddedProduct === undefined) {
        state.soldProducts = state.soldProducts
      } else {
        if (previouslyAddedProduct.quantity > 1) {
          state.soldProducts = state.soldProducts.map((product) => {
            if (product.productId === previouslyAddedProduct.productId) {
              return {
                ...product,
                quantity: product.quantity - 1,
              }
            }
            return product
          })
        } else {
          state.soldProducts = state.soldProducts.filter(
            (x) => x.productId !== previouslyAddedProduct.productId,
          )
        }
      }
    },
  },
})

export const { addProductToSale, removeProductFromSale, updateSaleData } =
  SaleSlice.actions
export const totalSaleAmount = (state: RootState) =>
  state.sale.soldProducts.reduce((accumulator, product) => {
    const { productId, quantity, unitPrice } = product
    const productTotal = quantity * unitPrice

    return accumulator + productTotal
  }, 0)
export const soldProducts = (state: RootState) => state.sale.soldProducts
export default SaleSlice.reducer
