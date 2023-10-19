import React from 'react'
//material-ui
import TextField from '@material-ui/core/TextField'
import { withStyles } from '@material-ui/core/styles'

const styles = ({ props }) => ({
    type: {
        fontWeight: '800',
    },
    label: {
        color: '#333333',
    },
    shrink: {
        transform: 'translate(0, -3px) scale(1)',
    },
})

const FormInput = (props) => {
    const { touched, error } = props.meta
    const { classes } = props
    console.log(props)

    return (
        <TextField
            id={props.id}
            type={props.type}
            label={props.label}
            name={props.input.name}
            fullWidth
            {...props.input}
            helperText={
                touched &&
                error && <span style={{ color: 'red' }}>{error}</span>
            }
            margin="dense"
            InputProps={{ className: classes.type }}
            InputLabelProps={{
                classes: { label: classes.label, shrink: classes.shrink },
            }}
        />
    )
}

export default withStyles(styles)(FormInput)
