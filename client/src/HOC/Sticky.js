import React, { Component } from "react";
import classNames from "classnames";
// material-ui
import LinearProgress from "@material-ui/core/LinearProgress";

const rAF = window.requestAnimationFrame
  ? window.requestAnimationFrame.bind(window)
  : callback => setTimeout(callback, 16);
const cn = classNames;

// Container and Boundary may only be necessary for resizing?
export const StickyContainer = ({ children }) => (
  <div className="sticky-container">{children}</div>
);

export const StickyBoundary = ({ children }) => (
  <div className="sticky-boundary">{children}</div>
);

export const StickyBox = React.forwardRef((props, ref) => {
  const { mode, cssPositionSticky } = props;

  return (
    <div
      className={cn("sticky-box", mode, { "is-sticky": props.isSticky })}
      ref={ref}
    >
      {props.children}
    </div>
  );
});

function withSticky(Component) {
  return class extends React.Component {
    constructor(props) {
      super(props);
      this.state = {
        mode: "is-top",
        deviceMediumMinWidthInPixels: 500,
        stickyBoxEl: null
      };
      this.myRef = React.createRef();
      // this.onResize = this.onResize.bind(this);
      this.handleScroll = this.handleScroll.bind(this);
    }

    componentDidMount() {
      this.setState({
        mode: this._getStickyModeByClientWidth(),
        cssPositionSticky: featureDetectCssPositionSticky()
      });

      // setTimeout(
      /* wait until this.stickyBox is available, wait next browser DOM update tick, maybe this is not needed but I want to be sure it works, seemed quirky without when tested */
      //   () => this.setState({ stickyBoxEl: this.myRef.current }),
      //   0
      // );

      window.addEventListener("scroll", this.handleScroll, false);
      // window.addEventListener("resize", this.onResize);
    }

    componentWillUnmount() {
      window.removeEventListener("scroll", this.handleScroll, false);
      // window.removeEventListener("resize", this.onResize, false);
    }

    handleScroll() {
      rAF(() => {
        const rect = this.myRef.current.getBoundingClientRect();
        let isSticky = false;
        // checks if rect.top is or near to 0 essentially
        if (this.state.mode === "is-top" && isInRange(rect.top, -1, 1)) {
          isSticky = true;
          // } else if (this.state.mode === "is-bottom") {
          //   let viewHeight = getViewHeight();
          //   if (rect.bottom >= viewHeight) {
          //     isSticky = true;
          //   }
          // }
        }
        this.setState({
          isSticky
        });
      });
    }

    // onResize() {
    //   rAF(() => {
    /* throttle events */
    // this.setState({
    //   mode: this._getStickyModeByClientWidth(),
    //   isSticky: false
    // });

    // setTimeout(
    /* wait next tick, because the DOM might change, sticky moved from top to bottom or vice versa, maybe not needed but seemed quirky when tested */
    //   () =>
    //     this.setState({
    //       stickyBoxEl: this.myRef.current
    //     }),
    //   0
    // );
    //   });
    // }

    _getStickyModeByClientWidth() {
      return document.documentElement.clientWidth >=
        this.state.deviceMediumMinWidthInPixels
        ? "is-top"
        : "is-bottom";
    }

    render() {
      return (
        <StickyBox
          ref={this.myRef}
          mode={this.state.mode}
          cssPositionSticky={this.state.cssPositionSticky}
          isSticky={this.state.isSticky}
        >
          <Component {...this.props} />
        </StickyBox>
      );
    }
  };
}

function featureDetectCssPositionSticky() {
  const el = document.createElement("div");

  // Could also use inline style, but I am using autoprefixer to generate the vendor prefixes for me.
  // el.style.cssText = 'position: -webkit-sticky; position: sticky;';
  el.className = "u-feature-detect-sticky";

  document.body.appendChild(el);
  const position = window.getComputedStyle(el).position;
  document.body.removeChild(el);
  if (position === "absolute" || position === "static") {
    return null;
  }
  return position || null;
}

function getViewHeight() {
  return Math.max(window.innerHeight, 0);
}

function getScrollPosition() {
  return (
    window.scrollY ||
    window.pageYOffset ||
    document.documentElement.scrollTop ||
    0
  );
}

function isInRange(value, min, max) {
  return value >= min && value <= max;
}

export default withSticky;
