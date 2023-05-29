/* eslint-disable prettier/prettier */
import Card from "../../ui/Card/Card"
import EnhancedTable from "./EnhancedTable"
import { StyledInventario } from "./StyledInventario"
import useFetch from "../../hook/useFecth"
const url = 'http://localhost:5149/api/Products'

const Inventario = () => {
    const { data, error } = useFetch<Products[]>(url)
    if (error) return <p>There is an error.</p>
    if (!data) return <p>Loading...</p>
    return (
        <StyledInventario >
            <div className="inventario">
                <Card title="Inventario"> Lista de medicamentos
                    <p>{data[0].title}</p>
                    <EnhancedTable data={data} />
                </Card>
            </div>
        </StyledInventario >
    )
}
export default Inventario