import React from 'react'
import { Grid, Typography, withStyles, withWidth } from '@material-ui/core'

const styles = (theme) => ({
    title: {
        flex: 1,
        // marginBottom: theme.spacing.unit * 2
    },
    type: {
        color: '#ecca00',
        fontWeight: '900',
        // fontFamily: "'NewTimesRoman', serif",
        fontFamily: 'Starjedi',
        letterSpacing: '10px',
        display: 'inline-block',
    },
})

const Title = (props) => {
    const { classes, width } = props
    const header = {
        xs: 'h5',
        sm: 'h4',
        md: 'h1',
        lg: 'h1',
        xl: 'h1',
    }

    return (
        <>
            {/* <Grid
                container
                className={classes.title}
                // alignItems="center"
                justify="center"
            > */}
            <Typography
                component="h1"
                variant={header[width]}
                align="center"
                className={`newFont ${classes.type}`}
                gutterBottom
            >
                Movie{' '}
            </Typography>
            <Typography
                id="rotate"
                component="h1"
                variant={header[width]}
                align="center"
                className={classes.type}
                gutterBottom
            >
                {'  '}S{'  '}
            </Typography>
            <Typography
                component="h1"
                variant={header[width]}
                align="center"
                className={`newFont ${classes.type}`}
                gutterBottom
            >
                cene
            </Typography>
            {/* </Grid> */}
        </>
    )
}

export default withWidth()(withStyles(styles)(Title))
