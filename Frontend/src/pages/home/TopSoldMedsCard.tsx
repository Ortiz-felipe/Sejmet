/* eslint-disable prettier/prettier */
import TopSoldMedsTable from "./TopSoldMedsTable"
import useFetch from "../../hook/useFetch"
import { TopSoldProduct } from "../../schemas/products"
import { StyledCard } from "../../ui/Card/StyledCard"
import CircularProgress from '@mui/material/CircularProgress';
import Box from '@mui/material/Box';

const baseURL = import.meta.env.VITE_BACKEND_URL

const TopSoldMedsCard = () => {
  const { data, error } = useFetch<TopSoldProduct[]>(
    `${baseURL}/Products/TopSoldProducts`,
  )

  return (
    <StyledCard floor="2floor" size="3lines">
      <div className="inventario">
        {data && data?.length < 0 ? (
          <Box sx={{ display: 'flex' }}>
            <CircularProgress />
          </Box>
        ) : (
          <TopSoldMedsTable data={data || []} />
        )}
      </div>
    </StyledCard>
  )
}
export default TopSoldMedsCard
