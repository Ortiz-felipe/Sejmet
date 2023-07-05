/* eslint-disable prettier/prettier */
import Card from "../../ui/Card/Card"
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
import { selectedOrderedProductsLength } from "../../features/carro/carroSlice"
import Table from "../../ui/Table/Table"
import { inventarioHead } from "./inventarioHead"
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';
import Drawner from "../../ui/Drawner/Drawner"

const baseURL = import.meta.env.VITE_BACKEND_URL

interface PaginationOptions {
  pageSize: number
  currentPage: number
  totalRecords?: number
}

const Inventario = () => {
  const navigate = useNavigate()
  const selectedItems = useAppSelector(orderedProducts)
  console.log("selectedItems", selectedItems)
  const [paginationOptions, setPaginationOptions] = useState<PaginationOptions>(
    {
      currentPage: 0,
      pageSize: 5,
    },
  )

  const { data, error } = usePagedFetch<PagedResponse<Products>>(
    `${baseURL}/Products?CurrentPage=${paginationOptions.currentPage + 1
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
    setPaginationOptions((prev) => {
      return { ...prev, currentPage: currentPage }
    })
  }

  const pageSizeHandler = (pageSize: number): void => {
    setPaginationOptions((prev) => {
      return { ...prev, currentPage: 0, pageSize: pageSize }
    })
  }

  const createNewOrderHandler = () => {
    navigate('/nuevaOrden');
  }


  return (
    <>
      <Drawner className="drawner" />

      <StyledInventario>

        <div className="inventario">
          <Card title="Inventario">
            <Button
              variant="contained"
              startIcon={<ShoppingCartCheckoutIcon />}
              disabled={selectedItems.length === 0}
              onClick={createNewOrderHandler}
              aria-disabled={selectedItems.length === 0}

            >
              Crear nueva orden
            </Button>
            {!data?.items ? (
              <Box sx={{ display: 'flex', justifyContent: 'center', alignContent: "center" }}>
                <CircularProgress />
              </Box>
            ) : (
              <Table
                data={data.items || []}
                count={paginationOptions.totalRecords || 0}
                currentPage={paginationOptions.currentPage}
                pageSize={paginationOptions.pageSize}
                onPageChange={pageChangeHandler}
                onPageSizeChange={pageSizeHandler}
                headCells={inventarioHead}
              />
            )}
          </Card>
        </div>
      </StyledInventario>
    </>
  )
}
export default Inventario
