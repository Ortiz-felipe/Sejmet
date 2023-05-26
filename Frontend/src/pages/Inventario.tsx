/* eslint-disable prettier/prettier */
import Card from "../ui/Card/Card"
import { StyledInventario } from "./StyledInventario"

// this home is whit 2 squares and 1 rectangle
const Inventario = () => {
    return (
        <StyledInventario >
            <div className="inventario">
                <Card title="Inventario"> Lista de medicamentos </Card>
            </div>
        </StyledInventario >
    )
}
export default Inventario