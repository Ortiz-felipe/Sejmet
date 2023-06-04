import { LineChart, Line, CartesianGrid, XAxis, YAxis, Tooltip, ResponsiveContainer } from "recharts"
import { SalesByMonth } from "../../schemas/sale"
import shortNumber from "../../utils/shortNumber"
const SalesChart = ({ data }: { data: SalesByMonth[] }) => {
  console.log('preparacion data', data)
  return (
    <ResponsiveContainer width="95%" height={300} >
      <LineChart
        data={data}
        margin={{ top: 5, right: 20, bottom: 5, left: 0 }}
      >
        <Line type="monotone" dataKey="totalAmount" stroke="#8884d8" />
        <CartesianGrid stroke="#ccc" strokeDasharray="5 5" />
        <XAxis dataKey="month" />
        <YAxis dataKey="totalAmount" tickFormatter={(data) => shortNumber(data)} />
        <Tooltip />
      </LineChart>
    </ResponsiveContainer >
  )
}

export default SalesChart
