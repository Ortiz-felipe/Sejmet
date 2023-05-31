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
