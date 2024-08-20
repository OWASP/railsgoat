# Vulnerability Discovery Techniques
## tools used
brakeman

I use [mise](https://github.com/jdx/mise) to manage my local dev environment

## vulnerability discovery - SAST
Use a recent version of ruby for latest brakeman, it wants ruby >= 3.0.0. I already have 3.1.6 installed.

```
mise use ruby@3.1.6
gem install brakeman
```

Run brakeman locally and save to a file
`brakeman --color -o /dev/stdout -o brakeman/output.json -o brakeman/report.html`

I can then analyze the results from stdout, from brakeman/output.json or from a nicer brakeman/report.html file in a web browser

## setup railsgoat
Read `README.md` for instructions to run railsgoat locally. I'll go with the provided docker compose stack.

`docker-compose` has been deprecated, on my environment I had to use `docker compose` instead.

```
docker compose build
docker compose run web rails db:setup
docker compose up
````

railsgoat is then available at http://localhost:3000
