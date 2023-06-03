import useFetch from "../../hook/useFetch"
import { LatestOrder } from "../../schemas/order"
import { StyledCard } from "../../ui/Card/StyledCard"
import LatestOrdersTable from "./LatestOrdersTable"

const baseURL = import.meta.env.VITE_BACKEND_URL

const LatestOrdersCard = () => {
  const { data, error } = useFetch<LatestOrder[]>(
    `${baseURL}/Orders/GetTopLatestOrders`,
  )

  return (
    <StyledCard size="3lines" floor="2floor">
      <div className="inventario">
        {data && data?.length < 0 ? (
          <p>Loading...</p>
        ) : (
          <LatestOrdersTable data={data || []} />
        )}
      </div>
    </StyledCard>
  )
}

export default LatestOrdersCard;