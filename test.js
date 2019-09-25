const log = console.log.bind(console);
const rAF = window.requestAnimationFrame
  ? window.requestAnimationFrame.bind(window)
  : callback => setTimeout(callback, 16);
const cn = classNames;

const OtherContent = ({ css, cssPositionSticky, children }) => {
  let msg = null;
  if (!cssPositionSticky) {
    msg = <div>This browser does not support position: sticky</div>;
  }
  return (
    <div className={cn("other-content", css)}>
      {msg}
      {children}
    </div>
  );
};

const StickyContainer = ({ children }) => (
  <div className="sticky-container">{children}</div>
);

const StickyBoundary = ({ children }) => (
  <div className="sticky-boundary">{children}</div>
);

class StickyBox extends React.Component {
  render() {
    const { mode, cssPositionSticky } = this.props;
    return (
      <div
        className={cn("sticky-box", mode, { "is-sticky": this.props.isSticky })}
      >
        <p>sticky box: {mode}</p>
        {cssPositionSticky && <p>css position: {cssPositionSticky}</p>}
      </div>
    );
  }
}

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      mode: "is-top",
      deviceMediumMinWidthInPixels: 500
    };
    this.onResize = this.onResize.bind(this);
    this.onScroll = this.onScroll.bind(this);
  }

  render() {
    return (
      <div className="app">
        <OtherContent
          css="top"
          cssPositionSticky={this.state.cssPositionSticky}
        >
          <h1>Scroll down, resize window</h1>
          <p>
            The sticky box is at bottom for small devices. At the top for larger
            devices. The fallback is unsticky for non-supporting browsers.
          </p>
        </OtherContent>
        <StickyContainer>
          {this.state.mode === "is-top" && (
            <React.Fragment>
              <StickyBox
                ref={el => (this.stickyBox = el)}
                mode={this.state.mode}
                cssPositionSticky={this.state.cssPositionSticky}
                isSticky={this.state.isSticky}
              />
              <StickyBoundary key="boundary">{generateText()}</StickyBoundary>
            </React.Fragment>
          )}
          {this.state.mode === "is-bottom" && (
            <React.Fragment>
              <StickyBoundary>{generateText()}</StickyBoundary>
              <StickyBox
                ref={el => (this.stickyBox = el)}
                mode={this.state.mode}
                cssPositionSticky={this.state.cssPositionSticky}
                isSticky={this.state.isSticky}
              />
            </React.Fragment>
          )}
        </StickyContainer>
        <OtherContent
          css="bottom"
          cssPositionSticky={this.state.cssPositionSticky}
        >
          Some other content
        </OtherContent>
      </div>
    );
  }

  componentDidMount() {
    //log("componentDidMount");
    this.setState({
      mode: this._getStickyModeByClientWidth(),
      cssPositionSticky: featureDetectCssPositionSticky()
    });

    setTimeout(
      /* wait until this.stickyBox is available, wait next browser DOM update tick, maybe this is not needed but I want to be sure it works, seemed quirky without when tested */
      () =>
        this.setState({ stickyBoxEl: ReactDOM.findDOMNode(this.stickyBox) }),
      0
    );

    window.addEventListener("resize", this.onResize);
    window.addEventListener("scroll", this.onScroll);
  }
  componentWillUnmount() {
    //log("componentWillUnmount");
    window.removeEventListener("resize", this.onResize);
    window.removeEventListener("scroll", this.onScroll);
  }

  onResize() {
    rAF(() => {
      /* throttle events */

      this.setState({
        mode: this._getStickyModeByClientWidth(),
        isSticky: false
      });

      setTimeout(
        /* wait next tick, because the DOM might change, sticky moved from top to bottom or vice versa, maybe not needed but seemed quirky when tested */
        () =>
          this.setState({ stickyBoxEl: ReactDOM.findDOMNode(this.stickyBox) }),
        0
      );
    });
  }

  onScroll() {
    rAF(() => {
      /* throttle events */
      // All this is just for position calculation, to add shadow or not. If shadow is not important, the onscroll and this.stickyBox DOM ref code can be deleted.
      const rect = this.state.stickyBoxEl.getBoundingClientRect();
      let isSticky = false;
      if (this.state.mode === "is-top" && isInRange(rect.top, -1, 1)) {
        isSticky = true;
      } else if (this.state.mode === "is-bottom") {
        let viewHeight = getViewHeight();
        if (rect.bottom >= viewHeight) {
          isSticky = true;
        }
      }
      this.setState({
        isSticky
      });
    });
  }

  _getStickyModeByClientWidth() {
    return document.documentElement.clientWidth >=
      this.state.deviceMediumMinWidthInPixels
      ? "is-top"
      : "is-bottom";
  }
}

ReactDOM.render(<App />, document.querySelector("#react-app"));

function generateText() {
  return [
    <p key="1">
      This is the boundary content, the sticky box will be sticky relative to
      this boundary
    </p>,
    <p key="2">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Adipisci
      repellat cum totam! Enim, sunt. Numquam voluptate, velit quisquam ipsa
      molestias laudantium odit reiciendis nisi corporis voluptatibus,
      voluptatum sunt natus, accusantium magnam consequatur fugit officiis
      minima voluptatem consequuntur nam, earum necessitatibus! Cupiditate ullam
      repellendus, eius iure voluptas at commodi consectetur, quia, adipisci
      possimus, ex mollitia. Labore harum error consectetur officiis aut optio,
      temporibus iste nobis ducimus cumque laudantium rem pariatur. Ut
      repudiandae id, consequuntur quasi quis pariatur autem corporis
      perferendis facilis eius similique voluptatibus iusto deleniti odio
      officia numquam tenetur excepturi, aspernatur sunt minima aut fugiat
      ipsam. Ea nesciunt, amet fugit facere similique dolor nam tempora
      perferendis aut fugiat non, ex pariatur.
    </p>
  ];
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
