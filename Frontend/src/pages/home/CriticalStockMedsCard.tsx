import useFetch from "../../hook/useFetch"
import { CriticalStockProduct } from "../../schemas/products"
import { StyledCard } from "../../ui/Card/StyledCard"
import CriticalStockMedsTable from "./CriticalStockMedsTable"

const baseURL = import.meta.env.VITE_BACKEND_URL

const CriticalStockMedsCard = () => {
  const { data, error } = useFetch<CriticalStockProduct[]>(
    `${baseURL}/Products/CriticalStockProducts`,
  )

  return (
    <StyledCard size="3lines" floor="2floor">
      <div className="inventario">
        {data && data?.length < 0 ? (
          <p>Loading...</p>
        ) : (
          <CriticalStockMedsTable data={data || []} />
        )}
      </div>
    </StyledCard>
  )
}

export default CriticalStockMedsCard;