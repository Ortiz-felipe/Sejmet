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
import IconButton from "@mui/material/IconButton"
import Tooltip from "@mui/material/Tooltip"
import DeleteIcon from "@mui/icons-material/Delete"
import { visuallyHidden } from "@mui/utils"
import { Products } from "../../schemas/products"
import ModalPedidos from "../../pages/pedidos/ModalPedido"
import ModalProduct from "../../pages/inventario/ModalProduct"
import ModalSale from "../../pages/ventas/ModalSale"
import Button from "@mui/material/Button"
import { StyledTable } from "./StyledTable"
import AddShoppingCartIcon from '@mui/icons-material/AddShoppingCart';
import RemoveShoppingCartIcon from '@mui/icons-material/RemoveShoppingCart';
import { useAppSelector, useAppDispatch } from "../../app/hooks"
import { addProduct, addAllSelectedProducts, removeProduct, removeAllSelectedProducts, selectedOrderedProductsLength, selectedProducts, incrementProductQuantity, decrementProductQuantity } from "../../features/carro/carroSlice"
import { OrderProduct, Orders } from "../../schemas/order"
import { HeadCell } from "../../schemas/headCell"
import AddIcon from "@mui/icons-material/Add"
import RemoveIcon from "@mui/icons-material/Remove"
import { soldProducts, addProductToSale, incrementSaleQuantity, decrementSalesQuantity } from "../../features/sale/saleSlice"
import { SaleProduct } from "../../schemas/sale"
import { removeProductFromSale, } from "../../features/sale/saleSlice"
import { useMatches } from "react-router-dom";

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
    rows: Orders[],
    headCells: HeadCell[],
    isSelectable: boolean
}

function EnhancedTableHead(props: EnhancedTableProps) {
    const {
        onSelectAllClick,
        order,
        orderBy,
        onRequestSort,
        allSelected,
        rows,
        headCells,
        isSelectable
    } = props
    const createSortHandler =
        (property: keyof Products) => (event: React.MouseEvent<unknown>) => {
            onRequestSort(event, property)
        }

    return (
        <TableHead>
            <TableRow>
                {isSelectable && (
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
                )}
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
    numSelected: number,
    isVisible: boolean
}

function EnhancedTableToolbar(props: EnhancedTableToolbarProps) {
    const { numSelected, isVisible = true } = props
    if (isVisible) return (
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
    headCells,
    isSelectable = true,
    toolbarVisibility = true
}: {
    data: Products[] | Orders[]
    count: number
    currentPage: number
    pageSize: number
    onPageChange: (currentPage: number) => void
    onPageSizeChange: (pageSize: number) => void
    headCells: HeadCell[],
    isSelectable?: boolean
}) {
    const rows = data
    const [order, setOrder] = useState<Order>("asc")
    const [availableProducts, setAvailableProducts] = useState(data)
    const [orderedProducts, setOrderedProducts] = useState([])
    const [orderBy, setOrderBy] = useState<keyof Products>("tradeName")
    const [openModal, setOpenModal] = useState(false)
    const [id, setId] = useState("")
    const [allSelected, setAllSelected] = useState(false)
    const cantidad = useAppSelector(selectedOrderedProductsLength)
    const selectedCarro = useAppSelector(selectedProducts)
    const dispatch = useAppDispatch()
    const currentlySoldProducts = useAppSelector(soldProducts)
    const matches = useMatches();

    const handleOpen = (id: string) => {
        setId(id)
        setOpenModal(true)
    }
    const handleRequestSort = (
        event: React.MouseEvent<unknown>,
        property: keyof Products,
    ) => {
        const isAsc = orderBy === property && order === "asc"
        setOrder(isAsc ? "desc" : "asc")
        setOrderBy(property)
    }

    const handleSelectAllClick = (selected: boolean, rows: Products[]) => {
        if (!selected) {
            const deselectedProducts: string[] = rows.map(row => row.id)
            dispatch(removeAllSelectedProducts(deselectedProducts))
            setAllSelected(false)
            return
        }
        const selectItems: OrderProduct[] = rows.map(row => {
            const orderProduct: OrderProduct = {
                productId: row.id,
                productName: row.tradeName,
                quantity: 1,
                unitPrice: row.price
            }
            return orderProduct
        })
        dispatch(addAllSelectedProducts(selectItems))
        setAllSelected(true)
        return
    }

    const handleClick = (isItemSelected: boolean, row: Products) => {
        const selectedIndex = selectedCarro.indexOf(row.upc)
        if (!isItemSelected) {
            const orderProduct: OrderProduct = {
                productId: row.id,
                productName: row.tradeName,
                quantity: 1,
                unitPrice: row.price
            }
            dispatch(addProduct(orderProduct))
        } else {
            dispatch(removeProduct(row.id))
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
    const addToCartHandler = (
        productId: string,
        productName: string,
        unitPrice: number,
    ) => {

        console.log('se suna 1', productId)
        if (matches[0].pathname === "/nuevaOrden") {
            console.log('se arranca+', matches)
            dispatch(incrementProductQuantity(productId))
        }
        if (matches[0].pathname === "/nuevaVenta") {
            console.log('se arranca+', matches)
            dispatch(incrementSaleQuantity(productId))
        }
        const product = availableProducts.find((x) => x.id === productId)
        if (product && product?.currentStock > 0) {
            setOrderedProducts((prevState) => {
                const previouslyAddedProduct = prevState.find(
                    (x) => x.productId === productId,
                )

                if (previouslyAddedProduct === undefined) {
                    console.log(prevState)
                    return [
                        ...prevState,
                        {
                            productId: productId,
                            productName: productName,
                            quantity: 1,
                            unitPrice: unitPrice,
                        },
                    ]
                } else {
                    return prevState.map((product) => {
                        if (product.productId === previouslyAddedProduct?.productId) {
                            return { ...product, quantity: product.quantity + 1 }
                        }
                        return product
                    })
                }
            })
            const product: SaleProduct = {
                productId: productId,
                productName: productName,
                quantity: 1,
                unitPrice: unitPrice,
            }

            dispatch(addProductToSale(product))
            setAvailableProducts(prevState => {
                return prevState.map(product => {
                    if (product.id === productId) {
                        return {
                            ...product,
                            currentStock: product.currentStock - 1
                        }
                    }
                    return product
                })
            })
        }
    }

    const removeFromCartHandler = (productId: string) => {
        if (matches[0].pathname === "/nuevaOrden") {
            console.log('se arranca+', matches)
            dispatch(decrementProductQuantity(productId))
        }
        if (matches[0].pathname === "/nuevaVenta") {
            console.log('se arranca+', matches)
            dispatch(decrementSalesQuantity(productId))
        }
        setOrderedProducts((prevState) => {
            const previouslyAddedProduct = prevState.find(
                (x) => x.productId === productId,
            )

            if (previouslyAddedProduct === undefined) {
                return prevState
            } else {
                if (previouslyAddedProduct.quantity > 1) {
                    return prevState.map((product) => {
                        if (product.productId === previouslyAddedProduct.productId) {
                            return {
                                ...product,
                                quantity: product.quantity - 1,
                            }
                        }
                        return product
                    })
                }
                return prevState.filter(
                    (x) => x.productId !== previouslyAddedProduct.productId,
                )
            }
        })
        const product: SaleProduct = {
            productId: productId,
        }
        dispatch(removeProductFromSale(product))
        setAvailableProducts(prevState => {
            return prevState.map(product => {
                if (product.id === productId) {
                    return {
                        ...product,
                        currentStock: product.currentStock + 1
                    }
                }
                return product
            })
        })
    }

    const isSelected = (name: string) => selectedCarro.indexOf(name) !== -1

    const emptyRows = 0
    function getModal(): React.ReactNode {
        switch (matches[0].pathname) {
            case '/Inventario':
                return <ModalProduct open={openModal} setOpen={setOpenModal} id={id} />;
            case '/Pedidos':
                console.log('pedidos modal')
                return <ModalPedidos open={openModal} setOpen={setOpenModal} id={id} />;
            case '/Ventas':
                console.log('ventasss modal')
                return <ModalSale open={openModal} setOpen={setOpenModal} id={id} />;
        }
    }

    return (
        <StyledTable sx={{ width: "100%" }}>
            {openModal && getModal()}
            <Paper sx={{ width: "100%", mb: 2 }}>
                <EnhancedTableToolbar numSelected={cantidad} isVisible={toolbarVisibility} />
                <TableContainer>
                    <Table
                        sx={{ minWidth: 750 }}
                        aria-labelledby="tableTitle"
                        size="medium"
                    >
                        <EnhancedTableHead
                            order={order}
                            orderBy={orderBy}
                            headCells={headCells}
                            rows={rows}
                            onSelectAllClick={handleSelectAllClick}
                            onRequestSort={handleRequestSort}
                            rowCount={rows.length}
                            allSelected={allSelected}
                            numSelected={cantidad}
                            isSelectable={isSelectable}
                        />
                        <TableBody>
                            {rows.map((row, index) => {
                                const isItemSelected = isSelected(row.id)
                                const labelId = `enhanced-table-checkbox-${index}`
                                return (
                                    <TableRow
                                        hover
                                        onClick={(event) => isSelectable && handleClick(isItemSelected, row)}
                                        role="checkbox"
                                        aria-checked={isItemSelected}
                                        tabIndex={-1}
                                        key={row.upc}
                                        selected={isItemSelected}
                                        sx={{ cursor: "pointer" }}
                                    >
                                        {isSelectable && (
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

                                            </TableCell>)
                                        }
                                        {headCells.map((headCell) => {
                                            // generate swith on headCell.id
                                            switch (headCell.id) {
                                                case "details":
                                                    return (
                                                        <TableCell align="left"> <Button onClick={() => handleOpen(row.upc ?? row.id)}>Detalles</Button></TableCell>
                                                    )
                                                    break;
                                                case "totalPrice":
                                                    return (
                                                        <TableCell align="left">
                                                            {console.log('rows?', row)}
                                                            {(row.unitPrice * row.quantity).toFixed(2)}
                                                        </TableCell>)
                                                    break;
                                                case "quantity":
                                                    return (
                                                        <TableCell>
                                                            <IconButton onClick={() => removeFromCartHandler(row["productId"])}>
                                                                <RemoveIcon />
                                                            </IconButton>
                                                            {currentlySoldProducts.find((x) => x.productId === row.id)
                                                                ?.quantity || row.quantity}
                                                            <IconButton
                                                                onClick={() =>
                                                                    addToCartHandler(row["productId"], row["productName"], row["unitPrice"])
                                                                }
                                                            >
                                                                <AddIcon />
                                                            </IconButton>
                                                        </TableCell>
                                                    )
                                                    break;
                                                default:
                                                    return (
                                                        <TableCell align="left">{row[headCell.id]}</TableCell>
                                                    )

                                            }
                                        })}

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
        </StyledTable >
    )
}
