/* eslint-disable prettier/prettier */
import { useState, useRef } from "react"
import "./Reset.css"
import "./App.css"
import NavBar from "./ui/NavBar/NavBar"
import Drawner from "./ui/Drawner/Drawner"
import Footer from "./ui/Footer/Footer"
import { BrowserRouter, createBrowserRouter, createRoutesFromElements, Route, Router, RouterProvider, Routes } from "react-router-dom"
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
import RequireAuth from "./utils/RequireAuth"
import PrivateWrapper from "./utils/PrivateWrapper"
import Root from "./ui/Root"
import PrivateRoutes from "./PrivateRoutes"
function App() {
  const loggedIn = useAppSelector(isLoggedIn)



  return (
    <ThemeProvider theme={theme}>

      <div className="App">
        <StyledEngineProvider injectFirst>
          <BrowserRouter>
            <Routes>
              <Route element={<PrivateRoutes />}>
                <Route element={<Home />} path="/" />
                <Route element={<Inventario />} path="/inventario" />
                <Route element={<Ventas />} path="/ventas" />
                <Route element={<Pedidos />} path="/pedidos" />
                <Route element={<NewClient />} path="/nuevocliente" />
                <Route element={<NewSale />} path="/nuevaventa" />
                <Route element={<NewOrder />} path="/nuevopedido" />
              </Route>
              <Route element={<Login />} path="/login" />
            </Routes>
          </BrowserRouter>

        </StyledEngineProvider>

      </div>
    </ThemeProvider >
  )
}

export default App