/* eslint-disable prettier/prettier */
import Card from "../../ui/Card/Card"
import CriticalStockMedsCard from "./CriticalStockMedsCard"
import LatestOrdersCard from "./LatestOrdersCard"
import SalesChartCard from "./SalesChartCard"
import { StyledHome } from "./StyledHome"
import TopSoldMedsCard from "./TopSoldMedsCard"
// this home is whit 2 squares and 1 rectangle
const Home = () => {
    return (
        <StyledHome>
            <div className="home">
                <SalesChartCard />
                <TopSoldMedsCard />
                <CriticalStockMedsCard />
                <LatestOrdersCard />
            </div>
        </StyledHome >
    )
}
export default Home