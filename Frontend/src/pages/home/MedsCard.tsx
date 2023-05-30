/* eslint-disable prettier/prettier */
import Card from "../../ui/Card/Card"
import MedsTable from "./MedsTable"
import useFetch from "../../hook/useFecth"
import { PagedResponse } from "../../schemas/pagedResponse"
import { Products } from "../../schemas/products"
import { useState, useEffect } from "react"
import { StyledCard } from "../../ui/Card/StyledCard"
const baseURL = import.meta.env.VITE_BACKEND_URL

interface PaginationOptions {
    pageSize: number
    currentPage: number
    totalRecords?: number
}

const MedsCard = () => {
    const [paginationOptions, setPaginationOptions] = useState<PaginationOptions>(
        {
            currentPage: 0,
            pageSize: 5,
        },
    )
    const [url, setUrl] = useState<string>(
        `${baseURL}/Products?CurrentPage=${paginationOptions.currentPage + 1
        }&PageSize=${paginationOptions.pageSize}`,
    )
    const [dataTable, setDataTable] = useState<Products[]>([])

    const callData = async () => {
        const elements = await fetch(url)
        const data = (await elements.json()) as PagedResponse<Products>
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
            `${baseURL}/Products?CurrentPage=${paginationOptions.currentPage + 1
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
        <StyledCard>
            <div className="inventario">
                Lista de medicamentos
                {/* <p>{data.items[0].title}</p> */}
                <MedsTable
                    data={dataTable}
                    count={paginationOptions.totalRecords || 0}
                    currentPage={paginationOptions.currentPage}
                    pageSize={paginationOptions.pageSize}
                    onPageChange={pageChangeHandler}
                    onPageSizeChange={pageSizeHandler}
                />
            </div>
        </StyledCard>
    )
}
export default MedsCard
