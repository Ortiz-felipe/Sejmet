/* eslint-disable prettier/prettier */
import Card from "../ui/Card/Card"
import { StyledPedidos } from "./StyledPedidos"

// this home is whit 2 squares and 1 rectangle
const Pedidos = () => {
    return (
        <StyledPedidos >
            <div className="pedidos">
                <Card title="Pedidos"> Lista de Pedidos </Card>
            </div>
        </StyledPedidos >
    )
}
export default Pedidos