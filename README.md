# Node with support for headless WebGL

To run headless WebGL tests under Docker with [`gl`][gl], [`#stackgl`][stackgl]'s fork of `headless-gl`, you'll need:

* `node`
* OpenGL drivers
* A headless back buffer with OpenGL support

This image contains:

* The latest `node` 6 LTS, because it's `FROM node:6`
* The packages required for [gl use under Travis][gltravis], including `xvfb`
* Yelp's [`dumb-init`][dumb-init] to handle the PID 1 duties `xvfb-run` won't

The full process tree will be:

* `dumb-init`
  * `xvfb-run`
    * `xvbf`
    * `node`, or whatever else you put in your `CMD`

I've left out `gl` itself. If you want it globally installed in your derived image, add these lines to your `Dockerfile`:

    FROM garthk/node-for-headless-webgl
    ENV NODE_PATH /usr/local/lib/node_modules
    RUN npm install --unsafe-perm --global gl

[stackgl]: http://stack.gl
[gl]: https://github.com/stackgl/headless-gl
[gltravis]: https://github.com/stackgl/headless-gl#how-can-i-use-headless-gl-with-a-continuous-integration-service
[dumb-init]: https://github.com/Yelp/dumb-init
