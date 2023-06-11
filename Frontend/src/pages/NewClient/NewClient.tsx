import {
  FormControl,
  MenuItem,
  Select,
  SelectChangeEvent,
  TextField,
  Typography,
  Button,
} from "@mui/material"
import Card from "../../ui/Card/Card"
import { StyledNewClient } from "./StyledNewClient"
import { Customer } from "../../schemas/customer"
import { useState, useEffect } from "react"
import useFetch from "../../hook/useFetch"
import { Province } from "../../schemas/province"
import { City } from "../../sc../../schemas/city"
import { HealthcareProvider } from "../../schemas/healthcareProvider"
import { LocalizationProvider, DatePicker } from "@mui/x-date-pickers"
import SaveRoundedIcon from "@mui/icons-material/SaveRounded"
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs"
import * as dayjs from "dayjs"
import { validateObject } from "../../utils/utils"
import CustomerValidator, { CustomerData } from "../../validators/NewCustomer/newCustomerValidator"
import { ValidationErrors } from "fluentvalidation-ts"

const baseURL = import.meta.env.VITE_BACKEND_URL

const NewClient = () => {
  const [customerData, setCustomerData] = useState<Customer>({
    id: "",
    dni: "",
    firstName: "",
    lastName: "",
    address: "",
    age: 0,
    birthdate: null,
    healthcareProviderId: "0",
    phoneNumber: "",
    cityId: "0",
    provinceId: 0,
  })

  const [customerValidationState, setCustomerValidationState] = useState<
    ValidationState<Customer>
  >({
    id: false,
    dni: false,
    firstName: false,
    lastName: false,
    address: false,
    birthdate: false,
    age: false,
    healthcareProviderId: false,
    cityId: false,
    provinceId: false,
    phoneNumber: false,
  })

  const [validationState, setValidationState] = useState<ValidationErrors<CustomerData>>({
    dni: '',
    firstName: '',
    lastName: '',
    address: '',
    birthdate: '',
    age: '',
    healthcareProviderId: '',
    cityId: '',
    provinceId: '',
    phoneNumber: '',
  })

  const [availableCities, setAvailableCities] = useState<City[]>([
    {
      id: "",
      name: "",
    },
  ])

  const provincesURL = `${baseURL}/Provinces`
  const healthcareProvidersURL = `${baseURL}/HealthcareProvider?IncludeDeactivedProviders=false`
  const citiesURL = `${baseURL}/Cities?ProvinceId=${customerData.provinceId}`
  const createCustomerURL = `${baseURL}/Customers`

  const provinceData = useFetch<Province[]>(provincesURL)
  const providersData = useFetch<HealthcareProvider[]>(healthcareProvidersURL)

  useEffect(() => {
    console.log(customerData)
  }, [customerData])

  useEffect(() => {
    const getAvailableCities = async () => {
      const elements = await fetch(citiesURL)
      const data = (await elements.json()) as City[]
      setAvailableCities([...data])
    }
    if (customerData.provinceId > 0) {
      getAvailableCities()
    }
  }, [customerData.provinceId])

  useEffect(() => {
    if (customerData.birthdate !== "") {
      const currentDate = dayjs()
      const age = currentDate.diff(customerData.birthdate, "year")
      setCustomerData((prevState) => {
        return {
          ...prevState,
          age: age,
        }
      })
    }
  }, [customerData.birthdate])

  const updateCustomerData = (
    key: keyof Customer,
    value: Customer[keyof Customer],
  ) => {
    setCustomerData((prevState) => {
      return {
        ...prevState,
        [key]: value,
      }
    })
  }

  const inputChangeHandler = (
    event: SelectChangeEvent | React.ChangeEvent<HTMLInputElement>,
    key: keyof Customer,
  ) => {
    updateCustomerData(key, event.target.value)
  }

  const dateInputChangeHandler = (value: string) => {
    updateCustomerData("birthdate", value.toJSON())
  }

  const createCustomerHandler = async () => {
    try {
      const validState = validateObject<Customer>(
        customerData,
        customerValidationState,
      )

      const customerValidator = new CustomerValidator();
      const result = customerValidator.validate(customerData)

      if (!Object.values(validState).some((error) => error)) {
        const {id, ...customerInfo} = customerData
        const payload = {
          body: customerInfo
        }
        const response = await fetch(createCustomerURL, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(payload),
        })

        if (!response.ok) {
          throw new Error("Failed to create customer")
        }
      } else {
        setCustomerValidationState(validState)
        setValidationState({...result})
      }
    } catch (error) {
      // Handle any error that occurred during the POST request
      console.error("Error creating customer:", error)
    }
  }

  return (
    <StyledNewClient>
      <div className="newClient">
        <Card title="Nuevo Cliente">
          <div className="">
            <Typography variant="body1">DNI:</Typography>
            <TextField
              // error={customerValidationState.dni}
              error={validationState?.dni !== ''}
              value={customerData?.dni}
              onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
                inputChangeHandler(event, "dni")
              }
              helperText={validationState?.dni !== '' ? validationState.dni : ''}
            />
            <Typography variant="body1">Nombre:</Typography>
            <TextField
              error={validationState?.firstName !== ''}
              value={customerData?.firstName}
              onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
                inputChangeHandler(event, "firstName")
              }
              helperText={validationState?.firstName !== '' ? validationState.firstName : ''}
            />
            <Typography variant="body1">Apellido:</Typography>
            <TextField
              error={customerValidationState.lastName}
              value={customerData?.lastName}
              onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
                inputChangeHandler(event, "lastName")
              }
            />
            <Typography variant="body1">Fecha de nacimiento:</Typography>
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DatePicker
                label="Seleccione una fecha"
                disableFuture
                value={customerData.birthdate}
                onChange={(value) => dateInputChangeHandler(value ? value : "")}
              />
            </LocalizationProvider>
            <Typography variant="body1">Obra Social:</Typography>
            <Select
              error={customerValidationState.healthcareProviderId}
              value={customerData.healthcareProviderId}
              onChange={(event: SelectChangeEvent) =>
                inputChangeHandler(event, "healthcareProviderId")
              }
            >
              <MenuItem disabled value="0">
                <em>Seleccione una obra social</em>
              </MenuItem>
              {providersData.data &&
                providersData.data?.length > 0 &&
                providersData.data.map((provider) => (
                  <MenuItem key={provider.id} value={provider.id}>
                    {provider.name}
                  </MenuItem>
                ))}
            </Select>
            <Typography variant="body1">Domicilio:</Typography>
            <TextField
              value={customerData?.address}
              error={customerValidationState.address}
              onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
                inputChangeHandler(event, "address")
              }
            />
            <Typography variant="body1">Provincia:</Typography>
            <Select
              error={customerValidationState.provinceId}
              value={customerData.provinceId.toString()}
              onChange={(event: SelectChangeEvent) =>
                inputChangeHandler(event, "provinceId")
              }
            >
              <MenuItem disabled value="0">
                <em>Seleccione una provincia</em>
              </MenuItem>
              {provinceData.data &&
                provinceData.data?.length > 0 &&
                provinceData.data.map((province) => (
                  <MenuItem key={province.id} value={province.id}>
                    {province.name}
                  </MenuItem>
                ))}
            </Select>
            <Typography variant="body1">Ciudad:</Typography>
            <FormControl disabled={customerData.provinceId < 0}>
              <Select
                error={customerValidationState.cityId}
                value={customerData.cityId}
                onChange={(event: SelectChangeEvent) =>
                  inputChangeHandler(event, "cityId")
                }
              >
                <MenuItem disabled value="0">
                  <em>Seleccione una ciudad</em>
                </MenuItem>
                {availableCities &&
                  availableCities.length > 0 &&
                  availableCities.map((city) => (
                    <MenuItem key={city.id} value={city.id}>
                      {city.name}
                    </MenuItem>
                  ))}
              </Select>
            </FormControl>

            <Typography variant="body1">Telefono:</Typography>
            <TextField
              error={customerValidationState.phoneNumber}
              value={customerData?.phoneNumber}
              onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
                inputChangeHandler(event, "phoneNumber")
              }
            />
            <div>
              <Button
                variant="contained"
                startIcon={<SaveRoundedIcon />}
                onClick={createCustomerHandler}
              >
                Guardar
              </Button>
            </div>
          </div>
        </Card>
      </div>
    </StyledNewClient>
  )
}

export default NewClient
