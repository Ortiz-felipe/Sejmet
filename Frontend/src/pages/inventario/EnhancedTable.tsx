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
import { getComparator, stableSort, Order } from "../../utils/sort"
import ModalProduct from "./ModalProduct"
import Button from "@mui/material/Button"
import { StyledEnhancedTable } from "./StyledEnhancedTable"

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
    label: "Trade Name",
  },
  {
    id: "laboratoryName",
    numeric: false,
    disablePadding: true,
    label: "Laboratory Name",
  },
  {
    id: "activeCompoundName",
    numeric: false,
    disablePadding: true,
    label: "Active Compound Name",
  },
  {
    id: "currentStock",
    numeric: false,
    disablePadding: true,
    label: "Current Stock",
  },
  {
    id: "price",
    numeric: false,
    disablePadding: true,
    label: "Price",
  },
  {
    id: "details",
    numeric: false,
    disablePadding: false,
    label: "details",
  },
]

interface EnhancedTableProps {
  numSelected: number
  onRequestSort: (
    event: React.MouseEvent<unknown>,
    property: keyof Products,
  ) => void
  onSelectAllClick: (event: React.ChangeEvent<HTMLInputElement>) => void
  order: Order
  orderBy: string
  rowCount: number
}

function EnhancedTableHead(props: EnhancedTableProps) {
  const {
    onSelectAllClick,
    order,
    orderBy,
    numSelected,
    rowCount,
    onRequestSort,
  } = props
  const createSortHandler =
    (property: keyof Products) => (event: React.MouseEvent<unknown>) => {
      onRequestSort(event, property)
    }

  return (
    <TableHead>
      <TableRow>
        <TableCell padding="checkbox">
          <Checkbox
            color="primary"
            indeterminate={numSelected > 0 && numSelected < rowCount}
            checked={rowCount > 0 && numSelected === rowCount}
            onChange={onSelectAllClick}
            inputProps={{
              "aria-label": "select all products",
            }}
          />
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
      {numSelected > 0 ? (
        <Typography
          sx={{ flex: "1 1 100%" }}
          color="inherit"
          variant="subtitle1"
          component="div"
        >
          {numSelected} selected
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
  currentPage,
  pageSize,
  onPageChange,
  onPageSizeChange
}: {
  data: Products[]
  count: number
  currentPage: number
  pageSize: number,
  onPageChange: (currentPage: number) => void,
  onPageSizeChange: (pageSize: number) => void
}) {
  const rows: Products[] = data
  const [order, setOrder] = useState<Order>("asc")
  const [orderBy, setOrderBy] = useState<keyof Products>("tradeName")
  const [selected, setSelected] = useState<readonly string[]>([])
  const [dense, setDense] = useState(false)
  const [openModal, setOpenModal] = useState(false)
  const [upc, setUpc] = useState("")
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
    console.log('se va a cambiar la pagina', newPage, currentPage, event)
    onPageChange(newPage);

  }

  const handleChangeRowsPerPage = (
    event: React.ChangeEvent<HTMLInputElement>,
  ) => {
    console.log('se va a cambiar la cantidad de elementos', event.target.value, pageSize)

    onPageSizeChange(parseInt(event.target.value));
    onPageChange(0);

  }



  const isSelected = (name: string) => selected.indexOf(name) !== -1

  //whit this code void a layout jump when reaching the last currentPage with empty rows, but don't work fine.
  //const emptyRows =  currentPage > 0 ? Math.max(0, (1 + currentPage) * pageSize - rows.length) : 0
  const emptyRows = 0

  const visibleRows = React.useMemo(
    () => {
      const pepe = stableSort(rows, getComparator(order, orderBy)).slice(
        currentPage * pageSize,
        currentPage * pageSize + pageSize,
      )
      return pepe;
    }
    ,
    [order, orderBy, currentPage, pageSize],
  )

  return (
    <StyledEnhancedTable sx={{ width: "100%" }}>
      <ModalProduct open={openModal} setOpen={setOpenModal} upc={upc} />
      <Paper sx={{ width: "100%", mb: 2 }}>
        <EnhancedTableToolbar numSelected={selected.length} />
        <TableContainer>
          <Table
            sx={{ minWidth: 750 }}
            aria-labelledby="tableTitle"
            size={dense ? "small" : "medium"}
          >
            <EnhancedTableHead
              numSelected={selected.length}
              order={order}
              orderBy={orderBy}
              onSelectAllClick={handleSelectAllClick}
              onRequestSort={handleRequestSort}
              rowCount={rows.length}
            />
            <TableBody>
              {rows.map((row, index) => {
                const isItemSelected = isSelected(row.upc)
                const labelId = `enhanced-table-checkbox-${index}`
                console.log('el row total es', rows, emptyRows, visibleRows)
                return (
                  <TableRow
                    hover
                    onClick={(event) => handleClick(event, row.upc)}
                    role="checkbox"
                    aria-checked={isItemSelected}
                    tabIndex={-1}
                    key={row.upc}
                    selected={isItemSelected}
                    sx={{ cursor: "pointer" }}
                  >
                    <TableCell padding="checkbox">
                      <Checkbox
                        color="primary"
                        checked={isItemSelected}
                        inputProps={{
                          "aria-labelledby": labelId,
                        }}
                      />
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
                        Details
                      </Button>
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
