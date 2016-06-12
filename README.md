# HelloSemaphore

To start your **Dockerized** Phoenix app:

  1. Install dependencies with `mix deps.get`
  1. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  1. Compile in preparation for a release with `MIX_ENV=prod mix compile`i
  1. Build a release with `MIX_ENV=prod mix release`
  1. Start Phoenix endpoint with `PORT=8888 rel/hello_semaphore/bin/hello_semaphore console`

Now you can visit [`localhost:8888`](http://localhost:8888) from your browser.

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
