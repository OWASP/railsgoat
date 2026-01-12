# Bonus: Encrypted Secrets in Rails 5.1+

This bonus section explains how modern Rails applications manage sensitive
information such as secret keys, API tokens, and credentials.

RailsGoat intentionally does NOT follow these practices by default, because it
is designed to demonstrate insecure patterns for educational purposes.
However, real-world applications should always protect secrets properly.

---

## What Are Application Secrets?

Application secrets include:
- `secret_key_base`
- API keys
- OAuth client secrets
- Encryption keys
- Database credentials

If these values are exposed, attackers may be able to:
- Hijack user sessions
- Forge cookies
- Access third-party services
- Decrypt sensitive data

---

## The Problem with Hardcoded Secrets

Hardcoding secrets directly in source code is dangerous because:
- Source code is often shared publicly
- Secrets can be leaked via Git history
- Compromised secrets are difficult to rotate

Example of an insecure approach:

```ruby
SECRET_KEY_BASE = "hardcoded_secret_value"
```

Once committed, this secret is effectively public forever.

---

## Rails 5.1: Encrypted Secrets

Rails 5.1 introduced encrypted secrets using `config/secrets.yml`.

A typical secure configuration looks like this:

```yaml
production:
  secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
```

In this approach:
- Secrets are stored outside the codebase
- Environment variables are injected at runtime
- Different environments can use different secrets

This pattern is commonly used in:
- Docker
- CI/CD pipelines
- Cloud platforms

## Rails 5.2+: Encrypted Credentials

Rails 5.2 introduced encrypted credentials, which are now the recommended
approach.

Credentials are stored in:

- `config/credentials.yml.enc`

They are encrypted using a master key stored in:

- `config/master.key`

Credentials are edited using:

```bash
rails credentials:edit
```

Example usage in application code:
```ruby
 Rails.application.credentials.secret_key_base
```
## Important Rules

- `master.key` must **NEVER** be committed to version control
- `credentials.yml.enc` **is safe** to commit
- Secrets can be rotated without changing application code

---

## Why RailsGoat Is Different

RailsGoat intentionally avoids secure secret management in order to:

- Demonstrate insecure patterns
- Teach developers how vulnerabilities arise
- Provide hands-on security training

This is a deliberate design choice and should **NOT** be copied into real
applications.

---

## Recommended Best Practices

For real-world Rails applications:

- Never hardcode secrets
- Use environment variables or encrypted credentials
- Never commit `master.key`
- Rotate secrets regularly
- Restrict access to production secrets




