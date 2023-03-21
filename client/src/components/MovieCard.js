import React, { Component } from 'react'
import { Link } from 'react-router-dom'
import debounce from 'lodash/debounce'
import Add from './Add'
import Stars from './Stars'
import ActionIconsContainer from '../containers/ActionIconsContainer'
import Image from '../assets/black-brushed-metal-edit.jpg'
//material-ui
import { withStyles } from '@material-ui/core/styles'
import withWidth from '@material-ui/core/withWidth'
import { Typography } from '@material-ui/core'

const styles = (theme) => ({
    root: {
        flex: 1,
    },
    altText: {
        color: 'yellow',
        fontSize: '2rem',
        position: 'absolute',
        top: '50%',
        left: '50%',
        width: '100%',
        transform: 'translate(-50%, -50%)',
        padding: '0 10px',
    },
})

class MovieCard extends Component {
    constructor(props) {
        super(props)
        this.state = {
            starsVisible: null,
            altText: false,
        }
        this.handleMouseEnterDebounced = debounce(
            this.handleMouseEnter.bind(this),
            200
        )
        this.handleMouseLeaveDebounced = debounce(
            this.handleMouseLeave.bind(this),
            200
        )
        this.handleAltText = this.handleAltText.bind(this)
    }

    handleMouseEnter(target) {
        this.setState({ starsVisible: target })
    }

    handleMouseLeave() {
        this.setState({ starsVisible: null })
    }

    handleAltText() {
        this.setState({ altText: true })
    }

    render() {
        const { id, movie, imageUrl, width, classes, profile } = this.props
        let target = profile ? 'person' : 'movie'

        const starSize = {
            xs: 14,
            sm: 17,
            md: 19,
            lg: 18,
            xl: 18,
        }

        const open = Boolean(this.state.starsVisible)

        return (
            <>
                <div
                    className={classes.root}
                    aria-owns={open ? id : undefined}
                    aria-haspopup="true"
                    onMouseEnter={(event) => {
                        let target = event.currentTarget
                        this.handleMouseEnterDebounced(target)
                    }}
                    onMouseLeave={this.handleMouseLeaveDebounced}
                >
                    <ActionIconsContainer
                        id={id}
                        actionPosition="right"
                        titlePosition="top"
                        actionIcon={
                            !profile ? <Add id={id} movie={movie} /> : null
                        }
                        open={open}
                        onClose={this.handleMouseLeaveDebounced}
                        starsVisible={this.state.starsVisible}
                    />
                    <Link
                        to={{
                            pathname: `/ms/${target}/${id}`,
                            state: {
                                id: id,
                                imageUrl: imageUrl,
                                movie: movie,
                                profile: profile,
                            },
                        }}
                    >
                        <img
                            src={imageUrl}
                            alt={movie.title || movie.name}
                            width="100%"
                            height="100%"
                            onError={(event) => {
                                if (!this.state.altText) {
                                    event.currentTarget.onerror = null
                                    event.currentTarget.src = Image
                                    this.handleAltText()
                                } else return
                            }}
                        />
                        {this.state.altText && (
                            <Typography className={classes.altText}>
                                {movie.title || movie.name}
                            </Typography>
                        )}
                    </Link>
                    <ActionIconsContainer
                        id={id}
                        actionPosition="center"
                        actionIcon={
                            !profile ? (
                                <Stars
                                    id={id}
                                    movie={movie}
                                    starSize={starSize[width]}
                                />
                            ) : null
                        }
                        open={open}
                        onClose={this.handleMouseLeaveDebounced}
                        starsVisible={this.state.starsVisible}
                    />
                </div>
            </>
        )
    }
}

export default withWidth()(withStyles(styles)(MovieCard))
