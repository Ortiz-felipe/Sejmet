/* eslint-disable prettier/prettier */
import { useState, useRef } from "react"
import "./Reset.css"
import "./App.css"
import NavBar from "./ui/NavBar/NavBar"
import Drawner from "./ui/Drawner/Drawner"
import Footer from "./ui/Footer/Footer"
import { createBrowserRouter, RouterProvider } from "react-router-dom"
import Home from "./pages/home/Home"
import Inventario from "./pages/inventario/Inventario"
import Ventas from "./pages/ventas/Ventas"
import Pedidos from "./pages/pedidos/Pedidos"
import StyledEngineProvider from "@mui/material/StyledEngineProvider"
import { ThemeProvider } from "styled-components"
import { theme } from "./ui/theme/theme"
import NewClient from "./pages/NewClient/NewClient"
import NewSale from "./pages/NewSale/NewSale"
import Login from "./pages/login/login"
import NewOrder from "./pages/NewOrder/NewOrder"
import { useAppSelector } from "./app/hooks"
import { isLoggedIn } from "./features/userCredentials/userCredentialsSlice"

const router = createBrowserRouter([

  {
    path: "/",
    element: <Home className="home" />,
  },
  {
    path: "/inventario",
    element: <Inventario className="home" />,
  },
  {
    path: "/pedidos",
    element: <Pedidos className="home" />,
  },
  {
    path: "/ventas",
    element: <Ventas className="home" />
  },
  {
    path: "/nuevoCliente",
    element: <NewClient className="home" />
  },
  {
    path: "/nuevaVenta",
    element: <NewSale className="home" />
  },
  {
    path: '/nuevaOrden',
    element: <NewOrder className="home" />
  }
])

function App() {

  const loggedIn = useAppSelector(isLoggedIn)
  const LoggedInRef = useRef(loggedIn);
  return (
    <ThemeProvider theme={theme}>

      <div className="App">
        <StyledEngineProvider injectFirst>
          {!LoggedInRef ? <Login /> :
            <>
              <RouterProvider router={router} />
            </>
          }
        </StyledEngineProvider>

      </div>
    </ThemeProvider >
  )
}

export default App