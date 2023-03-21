import React from 'react'
import { connect } from 'react-redux'
import { withRouter } from 'react-router-dom'
import ActivePlaylistContainer from './ActivePlaylistContainer'
import DrawerContainer from './DrawerContainer'
import Title from '../components/Title'
//material-ui
import Grid from '@material-ui/core/Grid'
import Paper from '@material-ui/core/Paper'
import { withStyles } from '@material-ui/core/styles'

const styles = (theme) => ({
    heroContent: {
        width: '100%',
        margin: '0 auto',
        bottomPadding: `${theme.spacing.unit * 5}px`,
    },
    title: {
        flexGrow: 1,
        padding: '25px',
    },
})

const HeaderContainer = (props) => {
    const { classes, client } = props

    return (
        <>
            <Paper className={classes.heroContent} id="image">
                <Grid container alignItems="flex-start" justify="flex-start">
                    <Grid item>
                        <DrawerContainer />
                    </Grid>
                    <Grid item className={classes.title}>
                        <Title />
                    </Grid>
                </Grid>
            </Paper>
        </>
    )
}

// <Grid
//   container
//   spacing={8}
//   className={classes.active}
//   alignItems="center"
//   justify="flex-start"
// />

const mapStateToProps = (state) => ({
    client: state.client,
})

export default withRouter(
    connect(mapStateToProps, null)(withStyles(styles)(HeaderContainer))
)
