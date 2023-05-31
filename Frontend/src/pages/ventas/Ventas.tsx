/* eslint-disable prettier/prettier */
import { useState, useEffect } from "react"
import { Sale } from "../../schemas/sale"
import Card from "../../ui/Card/Card"
import EnhancedTable from "./EnhancedTable"
import { StyledVentas } from "./StyledVentas"
import { PagedResponse } from "../../schemas/pagedResponse"

const baseURL = import.meta.env.VITE_BACKEND_URL

interface PaginationOptions {
  pageSize: number
  currentPage: number
  totalRecords?: number
}

// this home is whit 2 squares and 1 rectangle
const Ventas = () => {
  const [paginationOptions, setPaginationOptions] = useState<PaginationOptions>(
    {
      currentPage: 0,
      pageSize: 5,
    },
  )
  const [url, setUrl] = useState<string>(
    `${baseURL}/Sales?CurrentPage=${
      paginationOptions.currentPage + 1
    }&PageSize=${paginationOptions.pageSize}`,
  )
  const [dataTable, setDataTable] = useState<Sale[]>([])

  const callData = async () => {
    const elements = await fetch(url)
    const data = (await elements.json()) as PagedResponse<Sale>
    console.log("data", data)
    setDataTable(data.items)
    setPaginationOptions((prev) => {
      return { ...prev, totalRecords: data.totalRecords }
    })
  }

  useEffect(() => {
    console.log("currentPage", paginationOptions.currentPage)
    console.log("pageSize", paginationOptions.pageSize)
    setUrl(
      `${baseURL}/Sales?CurrentPage=${
        paginationOptions.currentPage + 1
      }&PageSize=${paginationOptions.pageSize}`,
    )
  }, [paginationOptions.currentPage, paginationOptions.pageSize])

  useEffect(() => {
    callData()
  }, [url])

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

  if (dataTable.length < 1) return <p>Loading...</p>

  return (
    <StyledVentas>
      <div className="ventas">
        <Card title="Ventas">
          <EnhancedTable
            data={dataTable}
            count={paginationOptions.totalRecords || 0}
            currentPage={paginationOptions.currentPage}
            pageSize={paginationOptions.pageSize}
            onPageChange={pageChangeHandler}
            onPageSizeChange={pageSizeHandler}
          />
        </Card>
      </div>
    </StyledVentas>
  )
}
export default Ventas
