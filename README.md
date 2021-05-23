# The Climbers Club Member Services

Member Services, is an open source club management system built for the climbers' club, intended to be usable by many other clubs, small or large.

Functionality includes member management, subscriptions, payments and much more.

An installed system provides club members and officers a web based & mobile compatible interface to their club.

## Vision

> To connect, organise & enhance your club, it's people & it's management experience.

## Tech stack

Well established technology and solutions around the language of Ruby.

[![Ruby Style Guide](https://img.shields.io/badge/code_style-standard-brightgreen.svg)](https://github.com/testdouble/standard)

### Back-end

- [PostgreSQL](https://www.postgresql.org/)
- [Redis](https://redis.io/)
- [Sidekiq](https://github.com/mperham/sidekiq)
- [Action Cable](https://guides.rubyonrails.org/action_cable_overview.html)
- [ERB](https://guides.rubyonrails.org/layouts_and_rendering.html)

### Front-end

- [Webpacker](https://github.com/rails/webpacker)
- [Hotwire](https://hotwire.dev/)
- [StimulusJS](https://stimulusjs.org/)
- [TailwindCSS](https://tailwindcss.com/)
- [Heroicons](https://heroicons.dev/)

## Running this app

You'll need to have [Docker installed](https://docs.docker.com/get-docker/).
It's available on Windows, macOS and most distros of Linux. If you're new to
Docker and want to learn it in detail check out the [additional resources
links](#learn-more-about-docker-and-ruby-on-rails) near the bottom of this
README.

If you're using Windows, it will be expected that you're following along inside
of [WSL or WSL
2](https://nickjanetakis.com/blog/a-linux-dev-environment-on-windows-with-wsl-2-docker-desktop-and-more).
That's because we're going to be running shell commands. You can always modify
these commands for PowerShell if you want.

#### Clone this repo anywhere you want and move into the directory:

```sh
git clone https://github.com/theclimbersclub/mso mso
cd mso

# Optionally checkout a specific tag, such as: git checkout 1.0.0
```

#### Copy a example files, because the real files are ignored in git:

```sh
cp .env.example .env
```

#### Build everything:

_The first time you run this it's going to take a good few minutes. This depends on your
internet speed and hardware specs. It's
going to download a few Docker images and build the Ruby + Yarn et al dependencies._

```sh
.devcontainer/docker-compose up --build
```

#### Development & testing

Once built and your vscode editor is attached you can run the terminal, eg `rails s`

Running a local web server:
```sh
rails s -b 0.0.0.0
```
_the binding of 0.0.0.0 permits the always port forward 3000 to 3000, rails defaults_

Runnig the test suite:
```sh
rspec
```

Running a development console:
```sh
rails c
```

Running the test suite in guard mode:
```sh
guard
```

Checking your code for code standards, this is run on CI too:
```sh
standardrb
```

Checking for code smells, this is run on CI too:
```sh
reek
```

Checking for bundle gem advisories, this is run on CI too:
```sh
bundler-audit --update
```

Checking for vulnerability, this is run CI too:
```sh
brakeman -q -w2
```

Running foreman to start up rails and webpacker dev server
```sh
foreman start
```

#### Email testing

There is an instance of `Mailhog` running, it's available on `localhost:8025`
