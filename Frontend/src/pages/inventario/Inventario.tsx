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
  const [currentPage, setCurrentPage] = useState(1)
  const [pageSize, setPageSize] = useState(5)
//   const [productData, setProductData] = useState<PagedResponse<Products>>()
  const url = `${baseURL}/Products?currentPage=${currentPage}&pageSize=${pageSize}`
  const { data, error } = useFetch<PagedResponse<Products>>(url)

//   useEffect(() => {
//     setProductData(data)
//   }, [])

//   useEffect(() => {
//     setCurrentPage()
//   }, [currentPage])

  const pageChangeHandler = (currentPage: number): void => {
    setCurrentPage(currentPage)
  }

  const pageSizeHandler = (pageSize: number): void => {
    setPageSize(pageSize)
  }

  if (error) return <p>There is an error.</p>
  if (!data) return <p>Loading...</p>

  return (
    <StyledInventario>
      <div className="inventario">
        <Card title="Inventario">
          {" "}
          Lista de medicamentos
          {/* <p>{data.items[0].title}</p> */}
          <EnhancedTable
            data={data.items}
            count={data.totalRecords}
            currentPage={data.currentPage}
            pageSize={data.pageSize}
            onPageChange={pageChangeHandler}
            onPageSizeChange={pageSizeHandler}
          />
        </Card>
      </div>
    </StyledInventario>
  )
}
export default Inventario
