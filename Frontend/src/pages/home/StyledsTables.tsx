import Box from "@mui/material/Box"
import styled from "styled-components"

export const StyledTables = styled(Box)`
.MuiPaper-root {
  box-shadow: none;

}
    .MuiCheckbox-root {
        align-self: end;
	color: ${props => props.theme.colors.primary};
  }
`