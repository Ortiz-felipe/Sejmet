/* eslint-disable prettier/prettier */
import Card from "../../ui/Card/Card"
import { StyledHome } from "./StyledHome"
import MedsCard from "./MedsCard"
// this home is whit 2 squares and 1 rectangle
const Home = () => {
    return (
        <StyledHome>
            <div className="home">
                <MedsCard />
                <Card title="Medicamentos por acabarse" > otra cosa </Card>
                <Card title="Promedio de ventas">una cosa</Card>
                <Card title="Ultimos Pedidos Realizados" >una cosa</Card>
            </div>
        </StyledHome >
    )
}
export default Home