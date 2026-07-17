# Developer-Setup
One-command developer environment setup automation toolkit for Web Development, AI/ML, Databases and DevOps.

## Quick start

```bash
chmod +x /home/runner/work/Developer-Setup/Developer-Setup/setup-dev-environment.sh
/home/runner/work/Developer-Setup/Developer-Setup/setup-dev-environment.sh --profile all
```

## Profiles

- `web`: Node.js, npm, yarn, pnpm
- `ai-ml`: Python, pip, Jupyter, common ML libraries
- `databases`: SQLite, PostgreSQL client, MySQL client, Redis CLI
- `devops`: Docker, Docker Compose, kubectl, Terraform, Ansible
- `all`: installs everything above

## Notes

- Supports package-manager based setup on Linux (`apt`, `dnf`) and macOS (`brew`).
- Re-run safely: already installed tools are skipped where possible.
- Use `--dry-run` to print actions without making changes.
