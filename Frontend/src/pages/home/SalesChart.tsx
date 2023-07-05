import { LineChart, Line, CartesianGrid, XAxis, YAxis, Tooltip, ResponsiveContainer, TooltipProps } from "recharts"
import { SalesByMonth } from "../../schemas/sale"
import shortNumber from "../../utils/shortNumber"
import { ValueType } from "recharts/types/component/DefaultTooltipContent"
import { NameType } from "recharts/types/component/DefaultTooltipContent"
const SalesChart = ({ data }: { data: SalesByMonth[] }) => {
  console.log('preparacion data', data)

  const CustomTooltip = ({ active, payload, label }: TooltipProps<ValueType, NameType>) => {
    if (active && payload && payload.length) {
      return (
        <div className="custom-tooltip">
          <p>{label.charAt(0).toUpperCase() + label.slice(1)}</p>
          <p>{shortNumber(payload[0]?.value || 0)}</p>
        </div>
      )
    }
    return null
  }

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
        <Tooltip content={<CustomTooltip />} />
      </LineChart>
    </ResponsiveContainer >
  )
}

export default SalesChart
