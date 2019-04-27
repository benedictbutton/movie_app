import React, {Component} from 'react';

function withInfiniteScroll (Component, props) {
  return class extends Component {
    componentDidMount() {
      window.addEventListener("scroll", this.onScroll, false);

      if (this.props.movies.query.type === "discover")
        this.props.doMoviesRequesting(this.props.movies.query);
      if (this.props.movies.query.type === "multi")
        this.props.doMovieCategoryRequesting(this.props.movies.query);
      if (this.props.movies.query.type === "search")
        this.props.doMovieSearchRequesting(this.props.movies.query);
      }

      componentWillUnmount() {
        window.removeEventListener("scroll", this.onScroll, false);
      }

      onScroll = () => {
        if (
          window.innerHeight + window.scrollY >= document.body.offsetHeight - 500 &&
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
