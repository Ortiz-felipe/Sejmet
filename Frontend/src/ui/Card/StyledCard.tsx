/* eslint-disable prettier/prettier */
import styled from "styled-components"

export const StyledCard = styled.div(({ size, floor }: { size: "square" | "WideRectangle" | "HeightRectangle" | "full" | "3lines", floor: "1floor" | "2floor" }): void => ({
    gridColumn: size === "WideRectangle" && `1 / 4`,
    gridRow: floor === "1floor" ? `1 / 2` : `2 / 3`,
    padding: `2rem`,
    gap: `2rem`,
    display: `flex`,
    borderRadius: `2rem`,
    flexDirection: `column`,
    backgroundColor: `#fcfcfe`,
}))


