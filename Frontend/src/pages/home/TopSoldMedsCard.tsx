/* eslint-disable prettier/prettier */
import TopSoldMedsTable from "./TopSoldMedsTable"
import useFetch from "../../hook/useFetch"
import { TopSoldProduct } from "../../schemas/products"
import { StyledCard } from "../../ui/Card/StyledCard"
import { CircularProgress } from "@mui/material"
const baseURL = import.meta.env.VITE_BACKEND_URL

const TopSoldMedsCard = () => {
  const { data, error } = useFetch<TopSoldProduct[]>(
    `${baseURL}/Products/TopSoldProducts`,
  )

  return (
    <StyledCard>
      <div className="inventario">
        {data && data?.length < 0 ? (
          <CircularProgress />
        ) : (
          <TopSoldMedsTable data={data || []} />
        )}
      </div>
    </StyledCard>
  )
}
export default TopSoldMedsCard
