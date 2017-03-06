# oauth2-proxy

A containerized version of [bitly][]'s [oauth2_proxy][] application:

> A reverse proxy that provides authentication with Google, Github or other
> provider

Per [the docs][config-docs], `oauth2_proxy` can be configured via the command
line, the environment, or a config file.

[Environment-based configuration][env-docs] might be especially handy for a containerized
deployment, via the following environment variables:

- `OAUTH2_PROXY_CLIENT_ID`
- `OAUTH2_PROXY_CLIENT_SECRET`
- `OAUTH2_PROXY_COOKIE_NAME`
- `OAUTH2_PROXY_COOKIE_SECRET`
- `OAUTH2_PROXY_COOKIE_DOMAIN`
- `OAUTH2_PROXY_COOKIE_EXPIRE`
- `OAUTH2_PROXY_COOKIE_REFRESH`
- `OAUTH2_PROXY_SIGNATURE_KEY`

[bitly]: https://bitly.com/
[oauth2_proxy]: https://github.com/bitly/oauth2_proxy
[config-docs]: https://github.com/bitly/oauth2_proxy#configuration
[env-docs]: https://github.com/bitly/oauth2_proxy#environment-variables
