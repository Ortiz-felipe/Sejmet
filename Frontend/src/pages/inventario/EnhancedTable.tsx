import React, { useState } from "react"
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
import { getComparator, stableSort } from "../../utils/sort"
import ModalProduct from "./ModalProduct"
import Button from "@mui/material/Button"
import { StyledEnhancedTable } from "./StyledEnhancedTable"
import AddShoppingCartIcon from '@mui/icons-material/AddShoppingCart';
import RemoveShoppingCartIcon from '@mui/icons-material/RemoveShoppingCart';
import { useAppSelector, useAppDispatch } from "../../app/hooks"
import { addElement, addAllElements, removeAllElement, removeElement, selectCarroCantidad, selectCarroSelected } from "../../features/carro/carroSlice"
import { OrderProduct, Orders } from "../../schemas/order"
interface HeadCell {
  disablePadding: boolean
  id: keyof Products
  label: string
  numeric: boolean
}

const headCells: readonly HeadCell[] = [
  {
    id: "tradeName",
    numeric: false,
    disablePadding: true,
    label: "Nombre comercial",
  },
  {
    id: "laboratoryName",
    numeric: false,
    disablePadding: true,
    label: "Laboratorio",
  },
  {
    id: "activeCompoundName",
    numeric: false,
    disablePadding: true,
    label: "Principio activo",
  },
  {
    id: "currentStock",
    numeric: false,
    disablePadding: true,
    label: "Stock disponible",
  },
  {
    id: "price",
    numeric: false,
    disablePadding: true,
    label: "Precio",
  },
  {
    id: "details",
    numeric: false,
    disablePadding: false,
    label: "Detalles",
  },
]

interface EnhancedTableProps {
  numSelected: number
  onRequestSort: (
    event: React.MouseEvent<unknown>,
    property: keyof Products,
  ) => void
  onSelectAllClick: (selected: boolean, rows: Order[]) => void
  order: Order
  orderBy: string
  rowCount: number,
  allSelected: boolean,
  rows: Orders[]
}

function EnhancedTableHead(props: EnhancedTableProps) {
  const {
    onSelectAllClick,
    order,
    orderBy,
    onRequestSort,
    allSelected,
    rows
  } = props
  const createSortHandler =
    (property: keyof Products) => (event: React.MouseEvent<unknown>) => {
      onRequestSort(event, property)
    }

  return (
    <TableHead>
      <TableRow>
        <TableCell padding="checkbox">
          {!allSelected ?
            <Tooltip title="Seleccionar Todo">
              <IconButton select={true} onClick={() => onSelectAllClick(true, rows)}>
                <AddShoppingCartIcon />
              </IconButton>
            </Tooltip>
            :
            <Tooltip title="Deseleccionar Todo">
              <IconButton onClick={() => onSelectAllClick(false, rows)} >
                <RemoveShoppingCartIcon />
              </IconButton>
            </Tooltip>
          }
        </TableCell>
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
      {numSelected > 0 && (
        <Typography
          sx={{ flex: "1 1 100%" }}
          color="inherit"
          variant="subtitle1"
          component="div"
        >
          {numSelected} seleccionados
        </Typography>
      )}
      {numSelected > 0 && (
        <Tooltip title="Delete">
          <IconButton>
            <DeleteIcon />
          </IconButton>
        </Tooltip>
      )}
    </Toolbar>
  )
}

export default function EnhancedTable({
  data,
  count,
  currentPage,
  pageSize,
  onPageChange,
  onPageSizeChange,
}: {
  data: Products[]
  count: number
  currentPage: number
  pageSize: number
  onPageChange: (currentPage: number) => void
  onPageSizeChange: (pageSize: number) => void
}) {
  const rows: Products[] = data
  const [order, setOrder] = useState<Order>("asc")
  const [orderBy, setOrderBy] = useState<keyof Products>("tradeName")
  const [openModal, setOpenModal] = useState(false)
  const [upc, setUpc] = useState("")
  const [allSelected, setAllSelected] = useState(false)
  const cantidad = useAppSelector(selectCarroCantidad)
  const selectedCarro = useAppSelector(selectCarroSelected)
  const dispatch = useAppDispatch()

  const handleOpen = (upc: string) => {
    setOpenModal(true)
    setUpc(upc)
  }
  const handleRequestSort = (
    event: React.MouseEvent<unknown>,
    property: keyof Products,
  ) => {
    const isAsc = orderBy === property && order === "asc"
    setOrder(isAsc ? "desc" : "asc")
    setOrderBy(property)
  }

  const handleSelectAllClick = (selected: boolean, row: Orders) => {
    if (!selected) {
      dispatch(removeAllElement(row))
      setAllSelected(false)
      return
    }
    dispatch(addAllElements(row))
    setAllSelected(true)
    return
  }

  const handleClick = (event: React.MouseEvent<unknown>, row: Orders) => {
    const selectedIndex = selectedCarro.indexOf(row.upc)
    console.log('el nomber es', row.upc, selectedIndex)
    if (selectedIndex === -1) {
      dispatch(addElement(row))
    } else if (selectedIndex === 0) {
      dispatch(removeElement(row))
    } else if (selectedIndex === selectedCarro.length - 1) {
      dispatch(removeElement(row))
    } else if (selectedIndex > 0) {
      dispatch(removeElement(row))
    }
  }

  const handleChangePage = (event: unknown, newPage: number) => {
    console.log("se va a cambiar la pagina", newPage, currentPage, event)
    onPageChange(newPage)
    console.log('largo de el row', rows.length)
    if (rows.length === 5) {
      setAllSelected(false)
    }
  }

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    console.log(
      "se va a cambiar la cantidad de elementos",
      event.target.value,
      pageSize,
    )

    onPageSizeChange(parseInt(event.target.value))
    onPageChange(0)
  }

  const isSelected = (name: string) => selectedCarro.indexOf(name) !== -1

  const emptyRows = 0
  return (
    <StyledEnhancedTable sx={{ width: "100%" }}>
      {openModal && (
        <ModalProduct open={openModal} setOpen={setOpenModal} upc={upc} />
      )}
      <Paper sx={{ width: "100%", mb: 2 }}>
        <EnhancedTableToolbar numSelected={cantidad} />
        <TableContainer>
          <Table
            sx={{ minWidth: 750 }}
            aria-labelledby="tableTitle"
            size="medium"
          >
            <EnhancedTableHead
              order={order}
              orderBy={orderBy}
              rows={rows}
              onSelectAllClick={handleSelectAllClick}
              onRequestSort={handleRequestSort}
              rowCount={rows.length}
              allSelected={allSelected}
              numSelected={cantidad}
            />
            <TableBody>
              {rows.map((row, index) => {
                const isItemSelected = isSelected(row.upc)
                const labelId = `enhanced-table-checkbox-${index}`
                return (
                  <TableRow
                    hover
                    onClick={(event) => handleClick(event, row)}
                    role="checkbox"
                    aria-checked={isItemSelected}
                    tabIndex={-1}
                    key={row.upc}
                    selected={isItemSelected}
                    sx={{ cursor: "pointer" }}
                  >
                    <TableCell padding="checkbox">
                      {!isItemSelected ?
                        <Tooltip title="Delete">
                          <IconButton>
                            <AddShoppingCartIcon />
                          </IconButton>
                        </Tooltip>
                        :
                        <Tooltip title="Filter list">
                          <IconButton>
                            <RemoveShoppingCartIcon />
                          </IconButton>
                        </Tooltip>
                      }

                    </TableCell>
                    <TableCell
                      align="left"
                      component="th"
                      id={labelId}
                      scope="row"
                      padding="none"
                    >
                      {row.tradeName}
                    </TableCell>
                    <TableCell align="left">{row.laboratoryName}</TableCell>
                    <TableCell align="left">{row.activeCompoundName}</TableCell>
                    <TableCell align="left">{row.currentStock}</TableCell>
                    <TableCell align="left">{row.price}</TableCell>
                    <TableCell align="left">
                      <Button onClick={() => handleOpen(row.upc)}>
                        Detalles
                      </Button>
                    </TableCell>
                  </TableRow>
                )
              })}
              {emptyRows > 0 && (
                <TableRow
                  style={{
                    height: (53) * emptyRows,
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
          count={count}
          rowsPerPage={pageSize}
          page={currentPage}
          onPageChange={handleChangePage}
          onRowsPerPageChange={handleChangeRowsPerPage}
        />
      </Paper>
    </StyledEnhancedTable>
  )
}
