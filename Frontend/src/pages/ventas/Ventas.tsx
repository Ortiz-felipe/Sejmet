/* eslint-disable prettier/prettier */
import Card from "../../ui/Card/Card"
import { StyledVentas } from "./StyledVentas"

// this home is whit 2 squares and 1 rectangle
const Ventas = () => {
    return (
        <StyledVentas >
            <div className="ventas">
                <Card title="Ventas"> Lista de medicamentos </Card>
            </div>
        </StyledVentas >
    )
}
export default Ventas