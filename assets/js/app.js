// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
// Live_view_React
import { MyComponent } from "./components/my_components"

window.Components = {
  MyComponent
}

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"
import LiveReact, { initLiveReact } from "phoenix_live_react"

let hooks = { LiveReact }

let liveSocket = new LiveSocket("/live", Socket, { hooks })
liveSocket.connect()

// Optionally render the React components on page load as
// well to speed up the initial time to render.
// The pushEvent prop will not be passed here.
document.addEventListener("DOMContentLoaded", e => {
    initLiveReact()
  })