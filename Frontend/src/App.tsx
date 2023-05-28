import "./Reset.css"
import "./App.css"
import NavBar from "./ui/NavBar/NavBar"
import Drawner from "./ui/Drawner/Drawner"
import Footer from "./ui/Footer/Footer"
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import Home from "./pages/Home"
import Inventario from "./pages/Inventario"
import Ventas from "./pages/Ventas"
import Pedidos from "./pages/Pedidos"
import StyledEngineProvider from "@mui/material/StyledEngineProvider";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Home className="home" />
  },
  {
    path: "/inventario",
    element: <Inventario className="home" />
  },
  {
    path: "/pedidos",
    element: <Pedidos className="home" />
  },
  {
    path: "/ventas",
    element: <Ventas className="home" />
  },
]);

function App() {
  return (
    <div className="App">
      <StyledEngineProvider injectFirst>
        <NavBar className="navBar" />
        <Drawner className="drawner" />
        <RouterProvider router={router} />
        <Footer className="footer" />
      </StyledEngineProvider>
    </div>
  )
}

export default App