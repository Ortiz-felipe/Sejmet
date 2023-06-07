import {Typography} from '@mui/material'
import useFetch from "../../hook/useFetch"
import { SalesByMonth } from "../../schemas/sale"
import { StyledCard } from "../../ui/Card/StyledCard"
import SalesChart from "./SalesChart"
import shortNumber from '../../utils/shortNumber'

const baseURL = import.meta.env.VITE_BACKEND_URL

const SalesChartCard = () => {
  const { data, error } = useFetch<SalesByMonth[]>(
    `${baseURL}/Sales/GetSalesByMonth/${new Date().getFullYear()}`,
  )

  const getTotalSalesInCurrentMonth = () => {
    if (data && data.length > 0) {
      return shortNumber(data[data.length - 1].totalAmount)
    }
  }

  return (
    <StyledCard size="WideRectangle" floor="1floor">
      <div className="inventario">
        <Typography variant='h6'>Historico de ventas</Typography>
        {data && data?.length < 0 ? (
          <p>Loading...</p>
        ) : (
          <SalesChart data={data || []} />
        )}
        <Typography variant='h6'>Total ventas del mes actual</Typography>
        <Typography variant='h6'>${getTotalSalesInCurrentMonth()}</Typography>
      </div>
    </StyledCard>
  )
}

export default SalesChartCard
