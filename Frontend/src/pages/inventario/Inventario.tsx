/* eslint-disable prettier/prettier */
import Card from "../../ui/Card/Card"
import EnhancedTable from "./EnhancedTable"
import { StyledInventario } from "./StyledInventario"
import useFetch from "../../hook/useFecth"
import { PagedResponse } from "../../schemas/pagedResponse"
import { Products } from "../../schemas/products"
import { useState, useEffect } from "react"
const baseURL = import.meta.env.VITE_BACKEND_URL

const Inventario = () => {
  const [currentPage, setCurrentPage] = useState(0)
  const [pageSize, setPageSize] = useState(5)
  const [url, setUrl] = useState<string>(`${baseURL}/Products?CurrentPage=${currentPage + 1}&PageSize=${pageSize}`)
  const [dataTable, setDataTable] = useState<Products[]>([])
  const callData = async () => {
    const elements = await fetch(url)
    const data = await elements.json()
    console.log('data', data)
    setDataTable(data)
  }
  useEffect(() => {
    console.log('currentPage', currentPage)
    console.log('pageSize', pageSize)
    setUrl(`${baseURL}/Products?CurrentPage=${currentPage + 1}&PageSize=${pageSize}`)
    callData()
  }, [currentPage, pageSize])

  const pageChangeHandler = (currentPage: number): void => {
    console.log('current Page', currentPage)
    setCurrentPage(currentPage)
  }

  const pageSizeHandler = (pageSize: number): void => {
    console.log('pageSize', pageSize)

    setPageSize(pageSize)
    setCurrentPage(0)
  }

  if (dataTable.length < 1) return <p>Loading...</p>

  return (
    <StyledInventario>
      <div className="inventario">
        <Card title="Inventario">
          Lista de medicamentos
          {/* <p>{data.items[0].title}</p> */}
          {console.log('la data final sobre la tabla es', dataTable)}
          <EnhancedTable
            data={dataTable.items}
            count={76}
            currentPage={currentPage}
            pageSize={pageSize}
            onPageChange={pageChangeHandler}
            onPageSizeChange={pageSizeHandler}
          />
        </Card>
      </div>
    </StyledInventario>
  )
}
export default Inventario
