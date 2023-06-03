/* eslint-disable prettier/prettier */
import styled from "styled-components"

export const StyledCard = styled.div(({ size, floor }: { size: "square" | "WideRectangle" | "HeightRectangle" | "full" | "3lines", floor: "1floor" | "2floor" }): void => ({
    boxShadow: ` rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;`,
    gridColumn: size === "WideRectangle" && `1 / 4`,
    gridRow: floor === "1floor" ? `1 / 2` : `2 / 3`,
    padding: `2rem`,
    display: `flex`,
    flexDirection: `column`,
    backgroundColor: 'white',
}))


