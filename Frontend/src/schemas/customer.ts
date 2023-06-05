export interface Customer {
  id: string
  dni: string
  firstName: string
  lastName: string
  address: string
  birthdate: string
  age: number
  healthcareProviderId: string
  cityId: string
  provinceId: number
  phoneNumber: string
}

export interface CustomerInfo {
  id: string
  customerName: string
  healthcareProviderName: string
}