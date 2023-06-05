export const formatDate = (dateToFormat: string | undefined): string => {
  if (dateToFormat !== undefined) {
    const date = new Date(dateToFormat)
    const day = String(date.getDate()).padStart(2, "0")
    const month = String(date.getMonth() + 1).padStart(2, "0") // Month is zero-based
    const year = String(date.getFullYear())

    return `${day}/${month}/${year}`
  } else {
    return '';
  }
}

export const validateObject = <T>(object: T, initialState: ValidationState<T>): ValidationState<T> => {
  const validationState: ValidationState<T> = { ...initialState };

  for (const property in object) {
    if (property !== 'id') {
      const value = object[property as keyof T];

      if (typeof value === 'object' && value !== null) {
        // Check if the property is a collection
        if (Array.isArray(value) && typeof value[0] === 'object') {
          const collectionHasErrors = value.some((item: any) => {
            const itemValidationState = validateObject(item, {} as ValidationState<typeof item>);
            return Object.values(itemValidationState).some(error => error);
          });
    
          validationState[property as keyof T] = collectionHasErrors as ValidationState<T[keyof T]>;
        } else {
          const nestedValidationState = validateObject(value, {} as ValidationState<typeof value>);
          const hasErrors = Object.values(nestedValidationState).some(error => error);
          validationState[property as keyof T] = hasErrors as ValidationState<T[keyof T]>;
        }
      } else {
        // Validate primitive property value
        validationState[property as keyof T] = !value;
      }
    }
  }

  return validationState;
};

