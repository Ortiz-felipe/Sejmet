/* eslint-disable prettier/prettier */
import Card from "../../ui/Card/Card"
import EnhancedTable from "./EnhancedTable"
import { StyledPedidos } from "./StyledPedidos"

const baseURL = import.meta.env.VITE_BACKEND_URL

// this home is whit 2 squares and 1 rectangle
const Pedidos = () => {
  return (
    <StyledPedidos>
      <div className="pedidos">
        <Card title="Pedidos">
          {" "}
          Lista de Pedidos
          <EnhancedTable
            data={data.items}
            count={data.totalRecords}
            currentPage={data.currentPage}
            pageSize={data.pageSize}
            onPageChange={pageChangeHandler}
            onPageSizeChange={pageSizeHandler}
          />
        </Card>
      </div>
    </StyledPedidos>
  )
}
export default Pedidos
