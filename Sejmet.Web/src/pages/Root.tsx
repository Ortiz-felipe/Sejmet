import { Container } from "@mui/material";
import MainNavigation from "../components/MainNavigation";
import { Outlet } from "react-router-dom";

const RootLayout: React.FC = (props) => {
  return (
    <Container>
      <MainNavigation />
      <main>
        <Outlet />
      </main>
    </Container>
  );
};

export default RootLayout;
