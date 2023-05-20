/* eslint-disable prettier/prettier */
import Card from "../ui/Card/Card"
import { StyledTemplate3 } from "./StyledTemplate3"

// this home is whit 2 squares and 1 rectangle
const Home = () => {
    return (
        <StyledHome >
            <StyledHome div className="home" >
                <Card > otra cosa </Card>
                <Card >una cosa</Card>
                <Card size={"WideRectangle"}>
                    Grande
                </Card>

            </StyledHome>

        </StyledHome >
    )
}
export default Home
