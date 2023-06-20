import useFetch from "../../hook/useFetch"
import { CriticalStockProduct } from "../../schemas/products"
import { StyledCard } from "../../ui/Card/StyledCard"
import CriticalStockMedsTable from "./CriticalStockMedsTable"
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';

const baseURL = import.meta.env.VITE_BACKEND_URL

const CriticalStockMedsCard = () => {
  const { data, error } = useFetch<CriticalStockProduct[]>(
    `${baseURL}/Products/CriticalStockProducts`,
  )

  return (
    <StyledCard size="3lines" floor="2floor">
      <div className="inventario">
        {data && data?.length < 0 ? (
          <Box sx={{ display: 'flex' }}>
            <CircularProgress />
          </Box>
        ) : (
          <CriticalStockMedsTable data={data || []} />
        )}
      </div>
    </StyledCard>
  )
}

export default CriticalStockMedsCard;