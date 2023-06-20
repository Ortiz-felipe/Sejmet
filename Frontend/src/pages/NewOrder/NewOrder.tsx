import { useState, useEffect } from "react"
import {
  FormControl,
  MenuItem,
  Select,
  SelectChangeEvent,
  TextField,
  Typography,
  Button,
} from "@mui/material"
import { useNavigate } from "react-router-dom"
import { StyledNewOrder } from "./StyledNewOrder"
import Card from "../../ui/Card/Card"
import useFetch from "../../hook/useFetch"
import { Provider } from "../../schemas/provider"
import { createNewOrder, getAllProviders } from "../../utils/apiRoutes"
import { ValidationErrors } from "fluentvalidation-ts"
import { CreateOrder } from "../../schemas/order"
import SaveRoundedIcon from "@mui/icons-material/SaveRounded"
import { useAppSelector } from "../../app/hooks"
import {
  orderedProducts,
  totalOrderAmount,
} from "../../features/carro/carroSlice"
import * as dayjs from "dayjs"
import { OrderValidator } from "../../validators/NewOrder/newOrderValidator"
import Table from "../../ui/Table/Table"
import { newOrderCells } from "./newOrderHead"

const NewOrder = () => {
  const navigate = useNavigate()
  const selectedOrderProducts = useAppSelector(orderedProducts)
  const currentTotalOrderAmount = useAppSelector(totalOrderAmount)
  const [orderData, setOrderData] = useState<CreateOrder>({
    providerId: "0",
    providerName: "",
    transactionStatusId: 1,
    orderDate: "",
    orderedProducts: [],
    totalAmount: 0,
  })
  const [availableProviders, setAvailableProviders] = useState<Provider[]>([])
  const [orderValidationErrors, setOrderValidationErrors] =
    useState<ValidationErrors<CreateOrder>>()
  const { data, error } = useFetch<Provider[]>(getAllProviders)

  useEffect(() => {
    console.log(orderData)
  }, [orderData])

  useEffect(() => {
    if (data && data.length > 0) {
      setAvailableProviders(data)
    }
  }, [data])

  useEffect(() => {
    if (selectedOrderProducts && selectedOrderProducts.length > 0) {
      updateOrderData("orderedProducts", selectedOrderProducts)
      updateOrderData("orderDate", dayjs().toJSON())
    }
  }, [selectedOrderProducts])

  useEffect(() => {
    updateOrderData("totalAmount", currentTotalOrderAmount)
  }, [currentTotalOrderAmount])

  useEffect(() => {
    if (data && data.length > 0) {
      const provider = data.find((x) => x.id === orderData.providerId)
      if (provider?.providerName) {
        updateOrderData("providerName", provider.providerName)
      }
    }
  }, [orderData.providerId])

  const updateOrderData = (
    key: keyof CreateOrder,
    value: CreateOrder[keyof CreateOrder],
  ) => {
    setOrderData((prevState) => {
      return {
        ...prevState,
        [key]: value,
      }
    })
  }

  const inputChangeHandler = (
    event: SelectChangeEvent | React.ChangeEvent<HTMLInputElement>,
    key: keyof CreateOrder,
  ) => {
    updateOrderData(key, event.target.value)
  }

  const createNewOrderHandler = async () => {
    const validationStatus = new OrderValidator().validate(orderData)
    if (Object.keys(validationStatus).length === 0) {
      try {
        const requestConfig: RequestInit = {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            body: orderData,
          }),
        }
        const response = await fetch(createNewOrder, requestConfig)

        if (!response.ok) {
          throw new Error("Failed to create new order")
        } else {
          navigate("/Pedidos")
        }
      } catch (error) {
        console.error("Error creating order:", error)
      }
    } else {
      setOrderValidationErrors(validationStatus)
    }
  }

  return (
    <StyledNewOrder>
      <div className="newOrder">
        <Card title="Nueva orden de productos">
          <div className="flex">
            <div className="flex">
              <Typography variant="body1">Nombre del proveedor</Typography>
              <Select
                //   error={orderValidationErrors?.providerName}
                value={orderData.providerId}
                onChange={(event: SelectChangeEvent) =>
                  inputChangeHandler(event, "providerId")
                }
              >
                <MenuItem disabled value="0">
                  <em>Seleccione un proveedor</em>
                </MenuItem>
                {availableProviders &&
                  availableProviders.length > 0 &&
                  availableProviders.map((provider) => (
                    <MenuItem key={provider.id} value={provider.id}>
                      {provider.providerName}
                    </MenuItem>
                  ))}
              </Select>
            </div>
            <Typography variant="body1">
              Total de la orden: {currentTotalOrderAmount.toFixed(2)}
            </Typography>
          </div>
          <Table
            data={selectedOrderProducts}
            count={selectedOrderProducts.length}
            headCells={newOrderCells}
            isSelectable={false}
          />
          <div>
            <Button
              variant="contained"
              startIcon={<SaveRoundedIcon />}
              onClick={createNewOrderHandler}
            >
              Guardar
            </Button>
          </div>
        </Card>
      </div>
    </StyledNewOrder >
  )
}

export default NewOrder
