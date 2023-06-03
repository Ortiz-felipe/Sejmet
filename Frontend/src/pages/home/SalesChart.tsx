import { LineChart, Line, CartesianGrid, XAxis, YAxis, Tooltip } from "recharts"
import { SalesByMonth } from "../../schemas/sale"

const SalesChart = ({ data }: { data: SalesByMonth[] }) => {
  return (
    <LineChart
      width={400}
      height={300}
      data={data}
      margin={{ top: 5, right: 20, bottom: 5, left: 0 }}
    >
      <Line type="monotone" dataKey="totalAmount" stroke="#8884d8" />
      <CartesianGrid stroke="#ccc" strokeDasharray="5 5" />
      <XAxis dataKey="month" />
      <YAxis />
      <Tooltip />
    </LineChart>
  )
}

export default SalesChart
