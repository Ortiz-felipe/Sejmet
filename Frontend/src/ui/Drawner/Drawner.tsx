import ButtonDrawner from "./ButtonDrawner"
import { StyledNavBar } from "./StyledDrawner"
import { redirect } from "react-router-dom";
import HomeIcon from "@mui/icons-material/Home"
import InventoryIcon from "@mui/icons-material/Inventory"
import GradingIcon from "@mui/icons-material/Grading"
import ReceiptIcon from "@mui/icons-material/Receipt"

/* eslint-disable prettier/prettier */
const Drawner = () => {

    const drawnersButtons = [
        {
            title: "Home",
            location: '/',
            icon: <HomeIcon />
        },
        {
            title: "Inventario",
            location: '/Inventario',
            icon: <InventoryIcon />
        },
        {
            title: "Pedidos",
            location: '/Pedidos',
            icon: <GradingIcon />
        },
        {
            title: "Ventas",
            location: '/Ventas',
            icon: <ReceiptIcon />
        }
    ]
    return <StyledNavBar>
        <div className="drawner">
            {drawnersButtons.map((obj) => <ButtonDrawner key={obj.title} title={obj.title} location={obj.location} icon={obj.icon} />)}
        </div>
    </StyledNavBar>
}
export default Drawner
