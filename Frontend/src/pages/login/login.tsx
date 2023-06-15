import React, { useEffect, useState } from "react"
import loginLogo from "../../assets/loginLogo.png"
import Avatar from "@mui/material/Avatar"
import Button from "@mui/material/Button"
import CssBaseline from "@mui/material/CssBaseline"
import TextField from "@mui/material/TextField"
import FormControlLabel from "@mui/material/FormControlLabel"
import Checkbox from "@mui/material/Checkbox"
import Link from "@mui/material/Link"
import Grid from "@mui/material/Grid"
import Box from "@mui/material/Box"
import LockOutlinedIcon from "@mui/icons-material/LockOutlined"
import Typography from "@mui/material/Typography"
import Container from "@mui/material/Container"
import { StyledLogin } from "./StyledLogin"
import {
  UserCredential,
  createUserWithEmailAndPassword,
  signInWithEmailAndPassword,
} from "firebase/auth"
import { auth } from "../../firebase"
import { useAuth } from "../../hook/useAuth"

function Copyright(props: any) {
  return (
    <Typography
      variant="body2"
      color="text.secondary"
      align="center"
      {...props}
    >
      {"Copyright © "}
      <Link color="inherit" href="https://mui.com/">
        Sejmet
      </Link>{" "}
      {new Date().getFullYear()}
      {"."}
    </Typography>
  )
}
const Login = () => {
  const [email, setEmail] = useState<string>("")
  const [password, setPassword] = useState<string>("")
  const [userCredentials, setUserCredentials] = useState<UserCredential>()

  useAuth()

  useEffect(() => {
    console.log(email)
    console.log(password)
  }, [email, password])

  //TODO: This should be the Register User Method
  // const handleSubmit = async (event) => {
  //     event.preventDefault()
  //     try {
  //         const userCredentials = await createUserWithEmailAndPassword(auth, email, password)
  //         setUserCredentials(userCredentials)
  //     } catch (error) {
  //         console.error(error)
  //     }
  // }

  const handleSubmit = async (event) => {
    event.preventDefault()
    try {
      const userCredentials = await signInWithEmailAndPassword(
        auth,
        email,
        password,
      )
      setUserCredentials(userCredentials)
    } catch (error) {
      console.error(error)
    }
  }

  return (
    <StyledLogin>
      <div className="logo">
        <img src={loginLogo} />
      </div>
      <div className="form">
        <Avatar sx={{ m: 3, bgcolor: "secondary.main" }}>
          <LockOutlinedIcon />
        </Avatar>
        <Typography component="h1" variant="h5">
          Ingresar
        </Typography>
        <form className="formulario">
          <TextField
            margin="normal"
            required
            fullWidth
            id="email"
            label="Direccion De mail"
            name="email"
            autoComplete="email"
            autoFocus
            onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
              setEmail(event.target.value)
            }
          />
          <TextField
            margin="normal"
            required
            fullWidth
            name="password"
            label="Contraseña"
            type="password"
            id="password"
            autoComplete="current-password"
            onChange={(event: React.ChangeEvent<HTMLInputElement>) =>
              setPassword(event.target.value)
            }
          />
          <FormControlLabel
            control={<Checkbox value="remember" color="primary" />}
            label="Recordarme"
          />
          <Button
            className="button"
            type="submit"
            fullWidth
            variant="contained"
            onClick={handleSubmit}
          >
            Ingresar
          </Button>
          <div className="options">
            <Grid item xs>
              <Link href="#" variant="body2">
                Olvido su contraseña?
              </Link>
            </Grid>
            <Grid item>
              <Link href="#" variant="body2">
                {"No tiene una cuenta? Registrese"}
              </Link>
            </Grid>
          </div>
          <Copyright sx={{ mt: 8, mb: 4 }} />
        </form>
      </div>
    </StyledLogin>
  )
}
export default Login
