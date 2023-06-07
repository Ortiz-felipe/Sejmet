import { Validator } from "fluentvalidation-ts"

type CustomerData = {
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

class CustomerValidator extends Validator<CustomerData> {
  constructor() {
    super()

    this.ruleFor("dni")
      .notNull()
      .withMessage("Por favor ingrese un numero de DNI")
      .maxLength(8)
      .withMessage("Por favor, ingrese un numero de DNI valido")

    this.ruleFor("firstName")
      .notEmpty()
      .notNull()
      .withMessage("Por favor, ingrese un nombre")

    this.ruleFor("lastName")
      .notEmpty()
      .notNull()
      .withMessage("Por favor, ingrese un apellido")

    this.ruleFor("address")
      .notEmpty()
      .notNull()
      .withMessage("Por favor, ingrese una direccion")

    this.ruleFor("birthdate")
      .notEmpty()
      .notNull()
      .withMessage("Por favor, ingrese una fecha de nacimiento")

    this.ruleFor("healthcareProviderId")
      .notEmpty()
      .notNull()
      .withMessage("Por favor, seleccione una obra social")

    this.ruleFor("cityId")
      .notEmpty()
      .notNull()
      .withMessage("Por favor, seleccione una ciudad")

    this.ruleFor("provinceId")
      .notNull()
      .withMessage("Por favor, seleccione una provincia")

    this.ruleFor("phoneNumber")
      .notEmpty()
      .notNull()
      .withMessage("Por favor, ingrese un numero de contacto")
  }
}
