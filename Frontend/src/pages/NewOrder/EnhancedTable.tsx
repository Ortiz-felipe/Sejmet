import React, { useEffect, useState } from "react"
import { alpha } from "@mui/material/styles"
import Box from "@mui/material/Box"
import Table from "@mui/material/Table"
import TableBody from "@mui/material/TableBody"
import TableCell from "@mui/material/TableCell"
import TableContainer from "@mui/material/TableContainer"
import TableHead from "@mui/material/TableHead"
import TablePagination from "@mui/material/TablePagination"
import TableRow from "@mui/material/TableRow"
import TableSortLabel from "@mui/material/TableSortLabel"
import Toolbar from "@mui/material/Toolbar"
import Typography from "@mui/material/Typography"
import Paper from "@mui/material/Paper"
import Checkbox from "@mui/material/Checkbox"
import IconButton from "@mui/material/IconButton"
import Tooltip from "@mui/material/Tooltip"
import DeleteIcon from "@mui/icons-material/Delete"
import FilterListIcon from "@mui/icons-material/FilterList"
import { visuallyHidden } from "@mui/utils"
import { Products } from "../../schemas/products"
import { getComparator, stableSort, Order } from "../../utils/sort"
import Button from "@mui/material/Button"
import { StyledEnhancedTable } from "./StyledEnhancedTable"
import AddIcon from "@mui/icons-material/Add"
import RemoveIcon from "@mui/icons-material/Remove"
import { OrderProduct } from "../../schemas/order"
import { SaleProduct } from "../../schemas/sale"
import { useAppDispatch, useAppSelector } from "../../app/hooks"
import { addProductToSale, soldProducts } from "../../features/sale/saleSlice"
import { removeProductFromSale } from "../../features/sale/saleSlice"
import {
  decrementProductQuantity,
  incrementProductQuantity,
} from "../../features/carro/carroSlice"

interface HeadCell {
  disablePadding: boolean
  id: keyof OrderProduct
  label: string
  numeric: boolean
}

const headCells: readonly HeadCell[] = [
  {
    id: "productName",
    numeric: false,
    disablePadding: true,
    label: "Producto",
  },
  {
    id: "unitPrice",
    numeric: false,
    disablePadding: true,
    label: "Precio por unidad",
  },
  {
    id: "totalPrice",
    numeric: false,
    disablePadding: true,
    label: "Precio final",
  },
  {
    id: "quantity",
    numeric: false,
    disablePadding: false,
    label: "Cantidad",
  },
]

interface EnhancedTableProps {
  onRequestSort: (
    event: React.MouseEvent<unknown>,
    property: keyof OrderProduct,
  ) => void
  order: Order
  orderBy: string
  rowCount: number
}

function EnhancedTableHead(props: EnhancedTableProps) {
  const { order, orderBy, rowCount, onRequestSort } = props
  const createSortHandler =
    (property: keyof OrderProduct) => (event: React.MouseEvent<unknown>) => {
      onRequestSort(event, property)
    }

  return (
    <TableHead>
      <TableRow>
        {/* <TableCell padding="checkbox">
          <Checkbox
            color="primary"
            indeterminate={numSelected > 0 && numSelected < rowCount}
            checked={rowCount > 0 && numSelected === rowCount}
            onChange={onSelectAllClick}
            inputProps={{
              "aria-label": "select all products",
            }}
          />
        </TableCell> */}
        {headCells.map((headCell) => (
          <TableCell
            key={headCell.id}
            align={headCell.numeric ? "right" : "left"}
            padding={headCell.disablePadding ? "none" : "normal"}
            sortDirection={orderBy === headCell.id ? order : false}
          >
            <TableSortLabel
              active={orderBy === headCell.id}
              direction={orderBy === headCell.id ? order : "asc"}
              onClick={createSortHandler(headCell.id)}
            >
              {headCell.label}
              {orderBy === headCell.id ? (
                <Box component="span" sx={visuallyHidden}>
                  {order === "desc" ? "sorted descending" : "sorted ascending"}
                </Box>
              ) : null}
            </TableSortLabel>
          </TableCell>
        ))}
      </TableRow>
    </TableHead>
  )
}

interface EnhancedTableToolbarProps {
  numSelected: number
}

function EnhancedTableToolbar(props: EnhancedTableToolbarProps) {
  const { numSelected } = props

  return (
    <Toolbar
      sx={{
        pl: { sm: 2 },
        pr: { xs: 1, sm: 1 },
        ...(numSelected > 0 && {
          bgcolor: (theme) =>
            alpha(
              theme.palette.primary.main,
              theme.palette.action.activatedOpacity,
            ),
        }),
      }}
    >
      {numSelected > 0 ? (
        <Typography
          sx={{ flex: "1 1 100%" }}
          color="inherit"
          variant="subtitle1"
          component="div"
        >
          {numSelected} seleccionados
        </Typography>
      ) : (
        <Typography
          sx={{ flex: "1 1 100%" }}
          variant="h6"
          id="tableTitle"
          component="div"
        >
          Products
        </Typography>
      )}
      {numSelected > 0 ? (
        <Tooltip title="Delete">
          <IconButton>
            <DeleteIcon />
          </IconButton>
        </Tooltip>
      ) : (
        <Tooltip title="Filter list">
          <IconButton>
            <FilterListIcon />
          </IconButton>
        </Tooltip>
      )}
    </Toolbar>
  )
}

export default function EnhancedTable({
  data,
  count,
}: //   currentPage,
//   pageSize,
//   onPageChange,
//   onPageSizeChange,
{
  data: OrderProduct[]
  count: number
  //   currentPage: number
  //   pageSize: number
  //   onPageChange: (currentPage: number) => void
  //   onPageSizeChange: (pageSize: number) => void
}) {
  const dispatch = useAppDispatch()

  const rows: OrderProduct[] = data
  const [availableProducts, setAvailableProducts] =
    useState<OrderProduct[]>(data)
  const [order, setOrder] = useState<Order>("asc")
  const [orderBy, setOrderBy] = useState<keyof OrderProduct>("productName")
  const [selected, setSelected] = useState<readonly string[]>([])
  const [dense, setDense] = useState(false)
  const [page, setPage] = useState<number>(0)
  const [rowsPerPage, setRowsPerPage] = useState<number>(5)

  useEffect(() => {
    setAvailableProducts(data)
  }, [data])

  const handleRequestSort = (
    event: React.MouseEvent<unknown>,
    property: keyof OrderProduct,
  ) => {
    const isAsc = orderBy === property && order === "asc"
    setOrder(isAsc ? "desc" : "asc")
    setOrderBy(property)
  }

  const handleSelectAllClick = (event: React.ChangeEvent<HTMLInputElement>) => {
    if (event.target.checked) {
      const newSelected = rows.map((n) => n.upc)
      setSelected(newSelected)
      return
    }
    setSelected([])
  }

  const handleClick = (event: React.MouseEvent<unknown>, name: string) => {
    const selectedIndex = selected.indexOf(name)
    let newSelected: readonly string[] = []

    if (selectedIndex === -1) {
      newSelected = newSelected.concat(selected, name)
    } else if (selectedIndex === 0) {
      newSelected = newSelected.concat(selected.slice(1))
    } else if (selectedIndex === selected.length - 1) {
      newSelected = newSelected.concat(selected.slice(0, -1))
    } else if (selectedIndex > 0) {
      newSelected = newSelected.concat(
        selected.slice(0, selectedIndex),
        selected.slice(selectedIndex + 1),
      )
    }

    setSelected(newSelected)
  }

  const handleChangePage = (event: unknown, newPage: number) => {
    setPage(newPage)
  }

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    setRowsPerPage(parseInt(event.target.value, 10))
    setPage(0)
  }

  const incrementProductQuantityHandler = (productId: string) => {
    dispatch(incrementProductQuantity(productId))
  }

  const decrementProductQuantityHandler = (productId: string) => {
    dispatch(decrementProductQuantity(productId))
  }

  // const isSelected = (name: string) => currentlySoldProducts.indexOf(name) !== -1

  const isSelectedHandler = (productId: string) =>
    currentlySoldProducts.findIndex((x) => x.productId === productId) !== -1

  //whit this code void a layout jump when reaching the last currentPage with empty rows, but don't work fine.
  //const emptyRows =  currentPage > 0 ? Math.max(0, (1 + currentPage) * pageSize - rows.length) : 0
  const emptyRows = 0

  //   const visibleRows = React.useMemo(() => {
  //     const pepe = stableSort(rows, getComparator(order, orderBy)).slice(
  //       currentPage * pageSize,
  //       currentPage * pageSize + pageSize,
  //     )
  //     return pepe
  //   }, [order, orderBy, currentPage, pageSize])

  return (
    <StyledEnhancedTable sx={{ width: "100%" }}>
      <Paper sx={{ width: "100%", mb: 2 }}>
        {/* <EnhancedTableToolbar numSelected={currentlySoldProducts.length} /> */}
        <TableContainer>
          <Table
            sx={{ minWidth: 750 }}
            aria-labelledby="tableTitle"
            size={dense ? "small" : "medium"}
          >
            <EnhancedTableHead
              order={order}
              orderBy={orderBy}
              onRequestSort={handleRequestSort}
              rowCount={availableProducts.length}
            />
            <TableBody>
              {(rowsPerPage > 0
                ? availableProducts.slice(
                    page * rowsPerPage,
                    page * rowsPerPage + rowsPerPage,
                  )
                : availableProducts
              ).map((row, index) => {
                // const isItemSelected = isSelectedHandler(row.id)
                const labelId = `enhanced-table-checkbox-${index}`
                // console.log("el row total es", rows, emptyRows, visibleRows)
                return (
                  <TableRow
                    hover
                    // onClick={(event) => handleClick(event, row.upc)}
                    role="checkbox"
                    // aria-checked={isItemSelected}
                    tabIndex={-1}
                    key={row.productId}
                    // selected={isItemSelected}
                    sx={{ cursor: "pointer" }}
                  >
                    <TableCell
                      align="left"
                      component="th"
                      id={labelId}
                      scope="row"
                      padding="none"
                    >
                      {row.productName}
                    </TableCell>
                    <TableCell align="left">{row.unitPrice}</TableCell>
                    <TableCell align="left">
                      {row.unitPrice * row.quantity}
                    </TableCell>
                    <TableCell>
                      <IconButton onClick={() => decrementProductQuantityHandler(row.productId)}>
                        <RemoveIcon />
                      </IconButton>
                      {row.quantity}
                      <IconButton
                        onClick={() =>
                          incrementProductQuantityHandler(row.productId)
                        }
                      >
                        <AddIcon />
                      </IconButton>
                    </TableCell>
                  </TableRow>
                )
              })}
              {emptyRows > 0 && (
                <TableRow
                  style={{
                    height: (dense ? 33 : 53) * emptyRows,
                  }}
                >
                  <TableCell colSpan={6} />
                </TableRow>
              )}
            </TableBody>
          </Table>
        </TableContainer>
        <TablePagination
          rowsPerPageOptions={[5, 10, 25]}
          component="div"
          count={availableProducts.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
        />
      </Paper>
    </StyledEnhancedTable>
  )
}
