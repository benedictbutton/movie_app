import React, { Component } from "react";

function withInfiniteScroll(Component) {
  return class extends Component {
    constructor(props) {
      super(props);
      this.state = {
        display: false
        // mode: "is-top",
        // deviceMediumMinWidthInPixels: 500,
        // stickyBoxEl: null
      };
      // this.myRef = React.createRef();
      this.handleChange = this.handleChange.bind(this);
      // this.onResize = this.onResize.bind(this);
      this.onScroll = this.onScroll.bind(this);
    }

    handleChange() {
      this.setState({ display: !this.state.display });
    }

    componentDidMount() {
      window.addEventListener("scroll", this.onScroll, false);
      /* capturing the first parameter after ms/movies as the query type and then everything that follows as the query tag - /ms/movies/(query type)/(query tag). */

      // if (this.props.movies.query.type === "discover")
      //   this.props.doMoviesRequesting(this.props.movies.query);
      // if (this.props.movies.query.type === "multi")
      //   this.props.doMovieCategoryRequesting(this.props.movies.query);
      // if (this.props.movies.query.type === "search")
      //   this.props.doMovieSearchRequesting(this.props.movies.query);

      /* until I'm sure of localStorage memory limits, this is my workaround for persisting movies state through a refresh */
      const match = `${this.props.match.url}`.match(
        /((^\/\w+\/\w+)\/(\w+)\/(.+))/
      );

      /* if navigating back from a movie/:id page, this code prevents a new api fetch call and instead reloads the page with the existing props from before; the page !== 0 conditional ensures the component does mount at least once (a page value of greater than 1 guarantess there was previous activity) */
      if (
        this.props.movies.query.page > 1 &&
        this.props.movies.query.tag !== "genre" &&
        this.props.movies.query.type === match[3] &&
        this.props.movies.query.tag === match[4]
      )
        return;

      if (match[4] === "genre") {
        if (!this.state.display) this.handleChange();
        return;
      }

      let payload = {
        type: this.props.match.params.type,

        page: this.props.match.params.type === "discover" ? 0 : 1,
        tag: match[4]
      };
      if (match[3] === "discover") {
        if (!this.state.display) this.handleChange();
        this.props.doUpdateGenre(payload);
        this.props.doMoviesRequesting(payload);
        return;
      }
      if (payload.type === "multi") {
        if (this.state.display === true) this.handleChange();
        this.props.doUpdateGenre(payload);
        this.props.doMovieCategoryRequesting(payload);
        return;
      }

      if (payload.type === "search") {
        this.props.doUpdateSearch(payload);
        this.props.doMovieSearchRequesting(payload);
      }
    }

    // integrates browser navigation with url
    componentDidUpdate(prevProps) {
      /* capturing the first parameter after ms/movies as the query type and then everything that follows as the query tag - /ms/movies/(query type)/(query tag) */
      if (prevProps.match.url !== this.props.match.url) {
        // TBD: I am unsure how performant using regex is versus relying on match.param values
        const match = `${this.props.match.url}`.match(
          /((^\/\w+\/\w+)\/(\w+)\/(.+))/
        );
        let payload = {
          type: match[3],
          page: 1,
          tag: match[4]
        };
        if (match[3] === "discover") {
          if (!this.state.display) this.handleChange();
          this.props.doUpdateGenre(payload);
          this.props.doMoviesRequesting(payload);
        } else if (match[4] === "genre") {
          if (!this.state.display) this.handleChange();
        } else if (match[3] === "multi") {
          if (this.state.display) this.handleChange();
          this.props.doUpdateGenre(payload);
          this.props.doMovieCategoryRequesting(payload);
        } else if (match[3] === "search") {
          this.props.doUpdateSearch(payload);
          this.props.doMovieSearchRequesting(payload);
        }
        window.scrollTo(0, 0);
      }
    }

    componentWillUnmount() {
      window.removeEventListener("scroll", this.onScroll, false);
    }

    onScroll() {
      if (
        window.innerHeight + window.scrollY >=
          document.body.offsetHeight - 500 &&
        this.props.movies.results.length &&
        !this.props.movies.requesting &&
        this.props.movies.query.type !== "search" &&
        !this.props.movies.requesting
      ) {
        let payload = {
          type: this.props.movies.query.type,
          page: this.props.movies.query.page + 1,
          tag: this.props.movies.query.tag
        };
        this.props.movies.query.type === "discover"
          ? this.props.doMoviesRequesting(payload)
          : this.props.doMovieCategoryRequesting(payload);
      }
    }

    render() {
      return (
        <>
          <Component
            display={this.state.display}
            handleChange={this.handleChange}
            {...this.props}
          />
        </>
      );
    }
  };
}

export default withInfiniteScroll;
