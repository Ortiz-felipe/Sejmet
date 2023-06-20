import React, { useState } from "react"
import Box from "@mui/material/Box"
import Table from "@mui/material/Table"
import TableBody from "@mui/material/TableBody"
import TableCell from "@mui/material/TableCell"
import TableContainer from "@mui/material/TableContainer"
import TableHead from "@mui/material/TableHead"
import TablePagination from "@mui/material/TablePagination"
import TableRow from "@mui/material/TableRow"
import TableSortLabel from "@mui/material/TableSortLabel"
import Paper from "@mui/material/Paper"
import { visuallyHidden } from "@mui/utils"
import { Order } from "../../utils/sort"
import { StyledEnhancedTable } from "./StyledEnhancedTable"
import { OrderProduct } from "../../schemas/order"

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
    id: "quantity",
    numeric: false,
    disablePadding: true,
    label: "Cantidad",
  },
  {
    id: "unitPrice",
    numeric: false,
    disablePadding: true,
    label: "Precio unitario",
  },
]

interface EnhancedTableProps {
  onRequestSort: (
    event: React.MouseEvent<unknown>,
    property: keyof OrderProduct,
  ) => void
  order: Order
  orderBy: string
}

function EnhancedTableHead(props: EnhancedTableProps) {
  const { order, orderBy, onRequestSort } = props
  const createSortHandler =
    (property: keyof OrderProduct) => (event: React.MouseEvent<unknown>) => {
      onRequestSort(event, property)
    }

  return (
    <TableHead>
      <TableRow>
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

export default function EnhancedTable({ data }: { data: OrderProduct[] }) {
  const rows: OrderProduct[] = data
  const [order, setOrder] = useState<Order>("asc")
  const [orderBy, setOrderBy] = useState<keyof OrderProduct>("productName")
  const [page, setPage] = useState(0)
  const [dense, setDense] = useState(false)
  const [rowsPerPage, setRowsPerPage] = useState(5)

  const handleRequestSort = (
    event: React.MouseEvent<unknown>,
    property: keyof OrderProduct,
  ) => {
    const isAsc = orderBy === property && order === "asc"
    setOrder(isAsc ? "desc" : "asc")
    setOrderBy(property)
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

  const handleChangeDense = (event: React.ChangeEvent<HTMLInputElement>) => {
    setDense(event.target.checked)
  }

  // Avoid a layout jump when reaching the last page with empty rows.
  const emptyRows =
    page > 0 ? Math.max(0, (1 + page) * rowsPerPage - rows.length) : 0

  //   const visibleRows = React.useMemo(
  //     () =>
  //       stableSort(rows, getComparator(order, orderBy)).slice(
  //         page * rowsPerPage,
  //         page * rowsPerPage + rowsPerPage,
  //       ),
  //     [order, orderBy, page, rowsPerPage],
  //   )

  return (
    <StyledEnhancedTable sx={{ width: "100%" }}>
      <Paper sx={{ width: "100%", mb: 2 }}>
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
            />
            <TableBody>
              {rows.map((row, index) => {
                const labelId = `enhanced-table-checkbox-${index}`

                return (
                  <TableRow
                    hover
                    role="checkbox"
                    tabIndex={-1}
                    key={row.productId}
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
                    <TableCell align="left">{row.quantity}</TableCell>
                    <TableCell align="left">{row.unitPrice}</TableCell>
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
          count={rows.length}
          rowsPerPage={rowsPerPage}
          page={page}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
        />
      </Paper>
    </StyledEnhancedTable>
  )
}
