const baseURL = import.meta.env.VITE_BACKEND_URL

export const getAllProviders = `${baseURL}/Providers`
export const getAllProvinces = `${baseURL}/Provinces`
export const getAllHealthcareProviders = `${baseURL}/HealthcareProvider?IncludeDeactivedProviders=false`
export const createNewOrder = `${baseURL}/Orders`
//   const citiesURL = `${baseURL}/Cities?ProvinceId=${customerData.provinceId}`
//   const createCustomerURL = `${baseURL}/Customers`