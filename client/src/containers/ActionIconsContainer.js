import React from 'react'
import classNames from 'classnames'
import Grid from '@material-ui/core/Grid'
import { withStyles } from '@material-ui/core/styles'

export const styles = (theme) => ({
    /* Styles applied to the root element. */
    root: {
        position: 'absolute',
        left: 0,
        right: 0,
        height: '48',
        paddingBottom: theme.spacing.unit,
    },
    /* Styles applied to the root element if `titlePosition="bottom"`.  */
    titlePositionBottom: {
        background: 'rgba(0, 0, 0, 0.5)',
        bottom: 0,
    },
    /* Styles applied to the root element if `titlePosition="top"`. */
    titlePositionTop: {
        background: 'transparent',
        top: 0,
        justifyContent: 'flex-end',
    },
})

const ActionIconsContainer = (props) => {
    const { starsVisible, actionIcon, classes, titlePosition } = props

    const className = classNames(classes.root, {
        [classes.titlePositionBottom]: titlePosition === 'bottom',
        [classes.titlePositionTop]: titlePosition === 'top',
    })

    return (
        <div>
            {actionIcon && starsVisible ? (
                <Grid container className={className}>
                    {actionIcon}
                </Grid>
            ) : null}
        </div>
    )
}

ActionIconsContainer.defaultProps = {
    actionPosition: 'right',
    titlePosition: 'bottom',
}

export default withStyles(styles, { name: 'MuiGridListTileBar' })(
    ActionIconsContainer
)
