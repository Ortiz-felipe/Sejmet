
import { Outlet } from "react-router-dom";
function Root({ children }) {
    return (
        <div>
            <p>root?</p>
            <Outlet />
        </div>
    );
}

export default Root; 