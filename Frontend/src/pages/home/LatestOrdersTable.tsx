import React, { useState } from "react"
import { alpha } from "@mui/material/styles"
import Table from "@mui/material/Table"
import TableBody from "@mui/material/TableBody"
import TableCell from "@mui/material/TableCell"
import TableContainer from "@mui/material/TableContainer"
import TableHead from "@mui/material/TableHead"
import TableRow from "@mui/material/TableRow"
import TableSortLabel from "@mui/material/TableSortLabel"
import Toolbar from "@mui/material/Toolbar"
import Typography from "@mui/material/Typography"
import Paper from "@mui/material/Paper"
import ModalProduct from "./ModalProduct"
import { StyledTables } from "./StyledsTables"
import { LatestOrder } from "../../schemas/order"
import { formatDate } from "../../utils/utils"

interface HeadCell {
  disablePadding: boolean
  id: keyof LatestOrder
  label: string
  numeric: boolean
}

const headCells: readonly HeadCell[] = [
  {
    id: "providerName",
    numeric: false,
    disablePadding: true,
    label: "Proveedor",
  },
  {
    id: "orderDate",
    numeric: false,
    disablePadding: true,
    label: "Fecha",
  },
  {
    id: "totalAmount",
    numeric: false,
    disablePadding: true,
    label: "Total",
  }
]

interface EnhancedTableProps {
  rowCount: number
}

function EnhancedTableHead(props: EnhancedTableProps) {
  return (
    <TableHead>
      <TableRow>
        {headCells.map((headCell) => (
          <TableCell
            key={headCell.id}
            align={"center"}
            padding={headCell.disablePadding ? "none" : "normal"}
            sortDirection={false}
          >
            <TableSortLabel
            >
              {headCell.label}
            </TableSortLabel>
          </TableCell>
        ))}
      </TableRow>
    </TableHead>
  )
}



function EnhancedTableToolbar() {
  return (
    <Toolbar
      sx={{
        pl: { sm: 2 },
        pr: { xs: 1, sm: 1 }
      }}
    >
      <Typography
        sx={{ flex: "1 1 100%" }}
        variant="h6"
        id="tableTitle"
        component="div"
      >
        Ultimos Pedidos Realizados
      </Typography>
    </Toolbar>
  )
}

export default function LatestOrdersTable({
  data,
}: {
  data: LatestOrder[]
}) {
  const rows: LatestOrder[] = data
  const [openModal, setOpenModal] = useState(false)
  const [upc, setUpc] = useState("")
  const handleOpen = (upc: string) => {
    setOpenModal(true)
    setUpc(upc)
  }

  return (
    <StyledTables sx={{ width: "100%" }}>
      <Paper sx={{ width: "100%", mb: 2 }}>
        <EnhancedTableToolbar />
        <TableContainer>
          <Table
            sx={{
              minWidth: 400,
            }}
            aria-labelledby="tableTitle"
            size={"small"}
          >
            <EnhancedTableHead
              rowCount={rows.length}
            />
            <TableBody>
              {rows.map((row, index) => {
                const labelId = `enhanced-table-checkbox-${index}`
                return (
                  <TableRow
                    hover
                    // onClick={(event) => handleOpen(row.upc)}
                    role="checkbox"
                    tabIndex={-1}
                    key={row.id}
                    sx={{ cursor: "pointer" }}
                  >
                    <TableCell
                      align="center"
                      component="th"
                      id={labelId}
                      scope="row"
                      padding="none"
                    >
                      {row.providerName}
                    </TableCell>
                    <TableCell align="center">{formatDate(row.orderDate)}</TableCell>
                    <TableCell align="center">{row.totalAmount}</TableCell>
                  </TableRow>
                )
              })}
            </TableBody>
          </Table>
        </TableContainer>
      </Paper>
    </StyledTables>
  )
}
