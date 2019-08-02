import React, { Component } from "react";

function withInfiniteScroll(Component, props) {
  return class extends Component {
    componentDidMount() {
      window.addEventListener("scroll", this.onScroll, false);
      /* capturing the first parameter after ms/movies as the query type and then everything that follows as the query tag - /ms/movies/(query type)/(query tag) */
      // if (this.props.movies.query.type === "discover")
      //   this.props.doMoviesRequesting(this.props.movies.query);
      // if (this.props.movies.query.type === "multi")
      //   this.props.doMovieCategoryRequesting(this.props.movies.query);
      // if (this.props.movies.query.type === "search")
      //   this.props.doMovieSearchRequesting(this.props.movies.query);

      /* until I'm sure of localStorage memory limits, this is my workaround to  persisting movies state through a refresh */
      const match = `${this.props.match.url}`.match(
        /((^\/\w+\/\w+)\/(\w+)\/(.+))/
      );
      let payload = {
        type: match[3],
        page: 1,
        tag: match[4]
      };

      if (match[3] === "discover") {
        this.props.doUpdateGenre(payload);
        this.props.doMoviesRequesting(payload);
      }
      if (match[3] === "multi") {
        this.props.doUpdateGenre(payload);
        this.props.doMovieCategoryRequesting(payload);
      }

      if (match[3] === "search") {
        this.props.doUpdateSearch(payload);
        this.props.doMovieSearchRequesting(payload);
      }
    }

    componentWillUnmount() {
      window.removeEventListener("scroll", this.onScroll, false);
    }

    onScroll = () => {
      if (
        window.innerHeight + window.scrollY >=
          document.body.offsetHeight - 500 &&
        this.props.movies.results.length &&
        !this.props.movies.requesting &&
        this.props.movies.query.type !== "search"
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
    };

    render() {
      return <Component {...this.props} />;
    }
  };
}

export default withInfiniteScroll;
