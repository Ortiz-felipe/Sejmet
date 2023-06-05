import { useState, useEffect } from "react"
import {
  Button,
  InputAdornment,
  SelectChangeEvent,
  TextField,
  Typography,
} from "@mui/material"
import PersonIcon from "@mui/icons-material/Person"
import SaveRoundedIcon from "@mui/icons-material/SaveRounded"
import PersonAddIcon from "@mui/icons-material/PersonAdd"
import Card from "../../ui/Card/Card"
import { StyledNewSale } from "./StyledNewSale"
import { Sale } from "../../schemas/sale"
import * as dayjs from "dayjs"
import { CustomerInfo } from "../../schemas/customer"
import usePagedFetch from "../../hook/usePagedFetch"
import { PagedResponse } from "../../schemas/pagedResponse"
import { Products } from "../../schemas/products"
import EnhancedTable from "./EnhancedTable"
import { useNavigate } from "react-router-dom"

const baseURL = import.meta.env.VITE_BACKEND_URL
interface PaginationOptions {
  pageSize: number
  currentPage: number
  totalRecords?: number
}

const NewSale = () => {
    const navigate = useNavigate();
  const [saleData, setSaleData] = useState<Sale>({
    id: "",
    customerId: "",
    customerName: "",
    saleDate: "",
    soldProducts: [],
    totalAmount: 0,
  })
  const [customerDni, setCustomerDni] = useState<string>("")
  const [customerInfo, setCustomerInfo] = useState<CustomerInfo>({
    id: "",
    customerName: "",
    healthcareProviderName: "",
  })
  const [productSearchExpression, setProductSearchExpression] =
    useState<string>("")
  const [searchExpression, setSearchExpression] = useState<string>("")
  const [saleValidationState, setSaleValidationState] = useState<
    ValidationState<Sale>
  >({})

  const [userNotFound, setUserNotFound] = useState(false)
  const [paginationOptions, setPaginationOptions] = useState<PaginationOptions>(
    {
      currentPage: 0,
      pageSize: 5,
    },
  )

  const { data, error } = usePagedFetch<PagedResponse<Products>>(
    `${baseURL}/Products?SearchExpression=${searchExpression}&CurrentPage=${
      paginationOptions.currentPage + 1
    }&PageSize=${paginationOptions.pageSize}`,
  )

  useEffect(() => {
    if (data && data?.totalRecords && data?.currentPage && data?.pageSize) {
      setPaginationOptions((prevState) => {
        return {
          ...prevState,
          totalRecords: data.totalRecords,
        }
      })
    }
  }, [data])

  const pageChangeHandler = (currentPage: number): void => {
    console.log("current Page", currentPage)
    setPaginationOptions((prev) => {
      return { ...prev, currentPage: currentPage }
    })
  }

  const pageSizeHandler = (pageSize: number): void => {
    console.log("pageSize", pageSize)
    setPaginationOptions((prev) => {
      return { ...prev, currentPage: 0, pageSize: pageSize }
    })
  }

  const updateSaleData = (key: keyof Sale, value: Sale[keyof Sale]) => {
    setSaleData((prevState) => {
      return {
        ...prevState,
        [key]: value,
      }
    })
  }

  const addNewClientHandler = () => {
    navigate("/nuevoCliente");
  }

  const inputChangeHandler = (
    event: SelectChangeEvent | React.ChangeEvent<HTMLInputElement>,
    key: keyof Sale,
  ) => {
    updateSaleData(key, event.target.value)
  }

  const onDniChangeHandler = (event: React.ChangeEvent<HTMLInputElement>) => {
    setCustomerDni(event.target.value)
    if (userNotFound) {
      setUserNotFound(!userNotFound)
    }
  }

  const customerSearchHandler = async (
    event: React.KeyboardEvent<HTMLInputElement>,
  ) => {
    if (event.keyCode === 13) {
      // Make an HTTP GET request to the URL specified by the input element
      await makeGetRequest(customerDni)
    }
  }

  const productSearchHandler = (
    event: React.KeyboardEvent<HTMLInputElement>,
  ) => {
    if (event.key === "Enter") {
      setSearchExpression(productSearchExpression)
      setPaginationOptions((prevState) => {
        return {
          ...prevState,
          currentPage: 0,
        }
      })
    }
  }

  const makeGetRequest = async (customerDni: string) => {
    const URL = `${baseURL}/Customers/${customerDni}`
    try {
      const response = await fetch(URL)
      if (response.ok) {
        const data = (await response.json()) as CustomerInfo
        setCustomerInfo({ ...data })
        updateSaleData("customerId", data.id)
        updateSaleData("customerName", data.customerName)
      } else {
        setUserNotFound(true)
      }
    } catch (error) {
      console.error(error)
    }
  }

  return (
    <StyledNewSale>
      <div className="newClient">
        <Card title="Nueva Venta">
          <div className="">
            <Typography variant="body">Ingrese el DNI del cliente</Typography>
            <TextField
              error={userNotFound}
              variant="outlined"
              InputProps={{
                endAdornment: (
                  <InputAdornment position="end">
                    <PersonIcon />
                  </InputAdornment>
                ),
              }}
              value={customerDni}
              onChange={onDniChangeHandler}
              helperText={
                userNotFound && "Cliente no existe o numero de DNI incorrecto"
              }
              onKeyDown={customerSearchHandler}
            />
            <TextField
              disabled
              label="Nombre del cliente"
              value={customerInfo.customerName}
            />
            <TextField
              disabled
              label="Obra social"
              value={customerInfo.healthcareProviderName}
            />
            <Button variant="contained" startIcon={<PersonAddIcon />} onClick={addNewClientHandler}>
              Agregar cliente
            </Button>
          </div>
          <div>
            <TextField
              value={productSearchExpression}
              placeholder="Ingrese un principio activo o una marca comercial"
              onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
                setProductSearchExpression(event.target.value)
              }
              onKeyDown={productSearchHandler}
            />
            {!data?.items ? (
              <p>Loading...</p>
            ) : (
              <EnhancedTable
                data={data.items || []}
                count={paginationOptions.totalRecords || 0}
                currentPage={paginationOptions.currentPage}
                pageSize={paginationOptions.pageSize}
                onPageChange={pageChangeHandler}
                onPageSizeChange={pageSizeHandler}
              />
            )}
          </div>
          <div>
            <Button variant="contained" startIcon={<SaveRoundedIcon />}>
              Guardar
            </Button>
          </div>
        </Card>
      </div>
    </StyledNewSale>
  )
}

export default NewSale
