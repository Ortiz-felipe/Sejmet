import ButtonDrawner from "./ButtonDrawner"
import { StyledNavBar } from "./StyledDrawner"
/* eslint-disable prettier/prettier */
const Drawner = () => {
    const drawnersButtons = [
        {
            title: "Medicamentos",
            onClick: () => console.log('medicamentos')
        },
        {
            title: "Laboratios",
            onClick: () => console.log('Laboratios')
        },
        {
            title: "Doctores",
            onClick: () => console.log('Doctores')
        }
    ]
    return <StyledNavBar>
        <div className="drawner">
            {drawnersButtons.map((obj) => <ButtonDrawner title={obj.title} onClick={obj.onClick} />)}
        </div>
    </StyledNavBar>
}
export default Drawner
