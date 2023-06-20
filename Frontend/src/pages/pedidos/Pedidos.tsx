/* eslint-disable prettier/prettier */
import { Orders } from "../../schemas/order";
import { PagedResponse } from "../../schemas/pagedResponse";
import Card from "../../ui/Card/Card"
import { PaginationOptions } from "../../utils/sort";
import EnhancedTable from "./EnhancedTable.bbk"
import { StyledPedidos } from "./StyledPedidos"
import { useState, useEffect } from "react";
import Table from "../../ui/Table/Table"
import { pedidosHead } from "./pedidosHead";

const baseURL = import.meta.env.VITE_BACKEND_URL

// this home is whit 2 squares and 1 rectangle
const Pedidos = () => {
  const [paginationOptions, setPaginationOptions] = useState<PaginationOptions>(
    {
      currentPage: 0,
      pageSize: 5,
    },
  )
  const [url, setUrl] = useState<string>(
    `${baseURL}/Orders?CurrentPage=${paginationOptions.currentPage + 1
    }&PageSize=${paginationOptions.pageSize}`,
  )
  const [dataTable, setDataTable] = useState<Orders[]>([])

  const callData = async () => {
    const elements = await fetch(url)
    const data = (await elements.json()) as PagedResponse<Orders>
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
      `${baseURL}/Orders?CurrentPage=${paginationOptions.currentPage + 1
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
    <StyledPedidos>
      <div className="pedidos">
        <Card title="Pedidos">
          Lista de Pedidos
          {console.log("dataTable", dataTable)}
          <Table
            data={dataTable}
            count={paginationOptions.totalRecords || 0}
            currentPage={paginationOptions.currentPage}
            pageSize={paginationOptions.pageSize}
            onPageChange={pageChangeHandler}
            onPageSizeChange={pageSizeHandler}
            headCells={pedidosHead}

          />
        </Card>
      </div>
    </StyledPedidos>
  )
}
export default Pedidos
