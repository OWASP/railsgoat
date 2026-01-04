# RailsGoat

RailsGoat is a deliberately vulnerable web application built on Ruby on Rails. It demonstrates real-world security vulnerabilities from the OWASP Top 10 and serves as a hands-on training platform for developers and security professionals.

## What is RailsGoat?

RailsGoat is an intentionally insecure Rails application designed to teach web application security. By exploring and exploiting its vulnerabilities, you'll learn:

- How common security flaws manifest in Rails applications
- How to identify vulnerabilities through code review and testing
- How to implement proper security controls and remediation strategies

**Current Version:** Rails 8.0 with Ruby 3.3.6

## Vulnerabilities Included

RailsGoat demonstrates real-world security vulnerabilities from the OWASP Top 10, including SQL injection, cross-site scripting (XSS), authentication issues, insecure direct object references, and more.

For a complete list of vulnerabilities with detailed explanations and tutorials, visit the [RailsGoat Wiki](https://github.com/OWASP/railsgoat/wiki).

## Quick Start

### Prerequisites

- Ruby 3.3.6
- Git
- SQLite3 (included by default)
- MySQL (optional, required for certain SQL injection demos)

**New to Ruby?** Follow the setup guide at [GoRails](https://gorails.com/setup) for your operating system.

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/OWASP/railsgoat.git
   cd railsgoat
   ```

2. **Install dependencies:**
   ```bash
   gem install bundler
   bundle install
   ```

3. **Setup the database:**
   ```bash
   rails db:setup
   ```

4. **Start the server:**
   ```bash
   rails server
   ```

5. **Open your browser:**
   Navigate to `http://localhost:3000` and start exploring!

### Other Rails Versions

The `main` branch runs Rails 8. For older versions, switch branches:

```bash
git checkout rails_3_2  # Rails 3.2
git checkout rails_4_2  # Rails 4.2
git checkout rails_5    # Rails 5.x
```

## Learning Path

### 1. Training Mode (Recommended for Learners)

Run the vulnerability test suite to see which security flaws exist:

```bash
rails training
```

Each failing test indicates a vulnerability. The test output includes a link to a wiki tutorial explaining:
- How the vulnerability works
- How to exploit it
- How to fix it

To run a specific vulnerability test:

```bash
rails training SPEC=spec/vulnerabilities/sql_injection_spec.rb
```

### 2. Explore the Application

- Create an account and log in
- Browse the different features
- Try to access other users' data
- Attempt various injection attacks
- Review the source code to understand the vulnerabilities

### 3. Learn from the Wiki

Visit the [RailsGoat Wiki](https://github.com/OWASP/railsgoat/wiki) for detailed tutorials on each vulnerability, including:
- Vulnerability explanation
- Exploitation techniques
- Code examples
- Remediation steps

## Docker Installation

**Requirements:** [Docker](https://docs.docker.com/engine/installation/) and [Docker Compose](https://docs.docker.com/compose/install/) 1.6.0+

**For Mac Apple Silicon (ARM64):** Rosetta must be installed

```bash
docker-compose build
docker-compose run web rails db:setup
docker-compose up
```

The application will be available at `http://localhost:3000`

**Troubleshooting:** If the container exits with "A server is already running", remove `tmp/pids/server.pid` from your working directory and try again.

## Advanced Configuration

### MySQL Environment

Some SQL injection vulnerabilities require MySQL. To run with MySQL:

```bash
# Create and migrate the database
RAILS_ENV=mysql rails db:create
RAILS_ENV=mysql rails db:migrate

# Start the server
RAILS_ENV=mysql rails server
```

### Email Testing

RailsGoat uses [MailCatcher](https://mailcatcher.me/) to intercept emails:

```bash
gem install mailcatcher
mailcatcher
```

View emails at `http://localhost:1080`

## For Contributors and Maintainers

### Running Tests in Maintainer Mode

Set the `RAILSGOAT_MAINTAINER` environment variable to verify that vulnerabilities still exist:

```bash
RAILSGOAT_MAINTAINER="yes" bundle exec rspec
```

In maintainer mode, tests pass when vulnerabilities are correctly implemented (opposite of training mode).

### Contributing

We welcome contributions! Please see our [contribution guidelines](./CONTRIBUTING.md) for details.

## Support

Need help?

- Join the [OWASP Slack Channel](https://owasp.slack.com/messages/project-railsgoat/)
- Check the [Wiki](https://github.com/OWASP/railsgoat/wiki) for tutorials
- Open an [issue](https://github.com/OWASP/railsgoat/issues) for bugs or questions

## Project History

RailsGoat was created to demonstrate security vulnerabilities in Rails applications and teach secure coding practices. It has been continuously updated through Rails versions 3, 4, 5, 6, and now 8, maintaining relevance as the framework evolves.

Conversion to OWASP Top Ten 2013 completed in November 2013.

## License

[The MIT License (MIT)](./LICENSE.md)

---

**Warning:** This application contains serious security vulnerabilities. Never deploy it on a public server or network. Use only in isolated training environments.
