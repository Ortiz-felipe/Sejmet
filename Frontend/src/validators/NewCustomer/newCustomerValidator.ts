import { Validator } from "fluentvalidation-ts"

export type CustomerData = {
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

export default class CustomerValidator extends Validator<CustomerData> {
  constructor() {
    super()

    this.ruleFor("dni")
      .notEmpty()
      .withMessage("Por favor ingrese un numero de DNI")
      .maxLength(8)
      .withMessage("Por favor, ingrese un numero de DNI valido")

    this.ruleFor("firstName")
      .notEmpty()
      .withMessage("Por favor, ingrese un nombre")
      .notNull()
      .withMessage("Por favor, ingrese un nombre")

    this.ruleFor("lastName")
      .notEmpty()
      .withMessage("Por favor, ingrese un apellido")
      .notNull()
      .withMessage("Por favor, ingrese un apellido")

    this.ruleFor("address")
      .notEmpty()
      .withMessage("Por favor, ingrese una direccion")
      .notNull()
      .withMessage("Por favor, ingrese una direccion")

    this.ruleFor("birthdate")
      .notEmpty()
      .withMessage("Por favor, ingrese una fecha de nacimiento")
      .notNull()
      .withMessage("Por favor, ingrese una fecha de nacimiento")

    this.ruleFor("healthcareProviderId")
    .notEmpty()
    .withMessage("Por favor, seleccione una obra social")
      .notNull()
      .withMessage("Por favor, seleccione una obra social")

    this.ruleFor("cityId")
      .notEmpty()
      .withMessage("Por favor, seleccione una ciudad")
      .notNull()
      .withMessage("Por favor, seleccione una ciudad")
      .must(value => value !== '0')
      .withMessage("Por favor, seleccione una ciudad")

    this.ruleFor("provinceId")
      .notNull()
      .withMessage("Por favor, seleccione una provincia")
      .greaterThan(0)
      .withMessage("Por favor, seleccione una provincia")

    this.ruleFor("phoneNumber")
      .notEmpty()
      .withMessage("Por favor, ingrese un numero de contacto")
      .notNull()
      .withMessage("Por favor, ingrese un numero de contacto")
  }
}
