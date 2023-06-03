import useFetch from "../../hook/useFetch"
import { SalesByMonth } from "../../schemas/sale"
import { StyledCard } from "../../ui/Card/StyledCard"
import SalesChart from "./SalesChart"

const baseURL = import.meta.env.VITE_BACKEND_URL

const SalesChartCard = () => {
  const { data, error } = useFetch<SalesByMonth[]>(
    `${baseURL}/Sales/GetSalesByMonth/${new Date().getFullYear()}`,
  )

  return (
    <StyledCard>
      <div className="inventario">
        {data && data?.length < 0 ? (
          <p>Loading...</p>
        ) : (
          <SalesChart data={data || []} />
        )}
      </div>
    </StyledCard>
  )
}

export default SalesChartCard
