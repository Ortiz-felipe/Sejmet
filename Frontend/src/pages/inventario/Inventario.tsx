/* eslint-disable prettier/prettier */
import Card from "../../ui/Card/Card"
import EnhancedTable from "./EnhancedTable"
import { StyledInventario } from "./StyledInventario"
import usePagedFetch from "../../hook/usePagedFetch"
import { PagedResponse } from "../../schemas/pagedResponse"
import { Products } from "../../schemas/products"
import { useState, useEffect } from "react"
import { useAppSelector } from "../../app/hooks"
import { orderedProducts } from "../../features/carro/carroSlice"
import ShoppingCartCheckoutIcon from "@mui/icons-material/ShoppingCartCheckout"
import { Button } from "@mui/material"
import { useNavigate } from "react-router-dom"
const baseURL = import.meta.env.VITE_BACKEND_URL

interface PaginationOptions {
  pageSize: number
  currentPage: number
  totalRecords?: number
}

const Inventario = () => {
  const navigate = useNavigate()
  const selectedItems = useAppSelector(orderedProducts)

  const [paginationOptions, setPaginationOptions] = useState<PaginationOptions>(
    {
      currentPage: 0,
      pageSize: 5,
    },
  )

  const { data, error } = usePagedFetch<PagedResponse<Products>>(
    `${baseURL}/Products?CurrentPage=${
      paginationOptions.currentPage + 1
    }&PageSize=${paginationOptions.pageSize}`,
  )

  useEffect(() => {
    if (data && data?.totalRecords && data?.currentPage && data?.pageSize) {
      setPaginationOptions((prevState) => {
        return {
          ...prevState,
          totalRecords: data.totalRecords,
        }
      })
    }
  }, [data])

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

  const createNewOrderHandler = () => {
    navigate('/nuevaOrden');
  }

  // if (data?.items && data.items.length < 1) return <p>Loading...</p>

  return (
    <StyledInventario>
      <div className="inventario">
        <Card title="Inventario">
          <Button
            variant="contained"
            startIcon={<ShoppingCartCheckoutIcon />}
            disabled={selectedItems.length === 0}
            onClick={createNewOrderHandler}
          >
            Crear nueva orden
          </Button>
          {!data?.items ? (
            <p>Loading...</p>
          ) : (
            <EnhancedTable
              data={data.items || []}
              count={paginationOptions.totalRecords || 0}
              currentPage={paginationOptions.currentPage}
              pageSize={paginationOptions.pageSize}
              onPageChange={pageChangeHandler}
              onPageSizeChange={pageSizeHandler}
            />
          )}
        </Card>
      </div>
    </StyledInventario>
  )
}
export default Inventario
