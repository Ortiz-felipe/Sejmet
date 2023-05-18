import { AppBar, Container, Toolbar, Typography } from "@mui/material";
import { NavLink } from "react-router-dom";

const MainNavigation: React.FC = (props) => {
  //   return (
  //     <header>
  //       <nav>
  //         <ul>
  //           <li>
  //             <NavLink to="/">Home</NavLink>
  //           </li>
  //           <li>
  //             <NavLink to="/about">About Us</NavLink>
  //           </li>
  //         </ul>
  //       </nav>
  //     </header>
  //   );
  return (
    <AppBar position="static">
      <Container maxWidth="xl">
        <Toolbar disableGutters>
          <Typography
            variant="h6"
            noWrap
            component={NavLink}
            to="/"
            sx={{
              mr: 2,
              display: { xs: "none", md: "flex" },
              fontFamily: "monospace",
              fontWeight: 700,
              letterSpacing: ".3rem",
              color: "inherit",
              textDecoration: "none",
            }}
          >
            SejmetLogo
          </Typography>
        </Toolbar>
      </Container>
    </AppBar>
  );
};

export default MainNavigation;
