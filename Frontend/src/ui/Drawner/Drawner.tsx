import ButtonDrawner from "./ButtonDrawner"
import { StyledNavBar } from "./StyledDrawner"
import { redirect } from "react-router-dom";

/* eslint-disable prettier/prettier */
const Drawner = () => {

    const drawnersButtons = [
        {
            title: "Home",
            location: '/'
        },
        {
            title: "Inventario",
            location: '/Inventario'
        },
        {
            title: "Pedidos",
            location: '/Pedidos'
        },
        {
            title: "Ventas",
            location: '/Ventas'
        }
    ]
    return <StyledNavBar>
        <div className="drawner">
            {drawnersButtons.map((obj) => <ButtonDrawner key={obj.title} title={obj.title} location={obj.location} />)}
        </div>
    </StyledNavBar>
}
export default Drawner
