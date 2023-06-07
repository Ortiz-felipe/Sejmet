import Box from "@mui/material/Box"
import styled from "styled-components"

export const StyledEnhancedTable = styled(Box)`
.MuiPaper-root {
    box-shadow: none;
    background-color: transparent;
}
    .MuiCheckbox-root {
        align-self: end;
	color: ${props => props.theme.colors.primary};;
  }
`