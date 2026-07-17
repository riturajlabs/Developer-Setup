#!/usr/bin/env bash
set -euo pipefail

PROFILE="all"
DRY_RUN="false"
APT_UPDATED="false"

usage() {
  cat <<'EOF'
Usage: setup-dev-environment.sh [--profile <web|ai-ml|databases|devops|all>] [--dry-run]

Examples:
  ./setup-dev-environment.sh --profile all
  ./setup-dev-environment.sh --profile web --dry-run
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile)
      if [[ $# -lt 2 ]]; then
        echo "Missing value for --profile." >&2
        usage
        exit 1
      fi
      PROFILE="${2:-}"
      shift 2
      ;;
    --dry-run)
      DRY_RUN="true"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage
      exit 1
      ;;
  esac
done

if [[ -z "${PROFILE}" ]]; then
  echo "Profile cannot be empty." >&2
  exit 1
fi

if ! command -v sudo >/dev/null 2>&1 && [[ "$(id -u)" -ne 0 ]]; then
  SUDO=""
else
  SUDO="sudo"
fi

if command -v apt-get >/dev/null 2>&1; then
  PM="apt"
elif command -v dnf >/dev/null 2>&1; then
  PM="dnf"
elif command -v brew >/dev/null 2>&1; then
  PM="brew"
else
  echo "Unsupported system: expected apt, dnf or brew." >&2
  exit 1
fi

run_cmd() {
  if [[ "${DRY_RUN}" == "true" ]]; then
    echo "[dry-run] $*"
  else
    "$@"
  fi
}

has_tool() {
  command -v "$1" >/dev/null 2>&1
}

install_apt() {
  if [[ "${APT_UPDATED}" == "false" ]]; then
    run_cmd ${SUDO} apt-get update
    APT_UPDATED="true"
  fi
  run_cmd ${SUDO} apt-get install -y "$@"
}

install_dnf() {
  run_cmd ${SUDO} dnf install -y "$@"
}

install_brew() {
  run_cmd brew install "$@"
}

install_system_packages() {
  if [[ $# -eq 0 ]]; then
    return
  fi

  case "${PM}" in
    apt) install_apt "$@" ;;
    dnf) install_dnf "$@" ;;
    brew) install_brew "$@" ;;
    *)
      echo "Unsupported package manager: ${PM}" >&2
      exit 1
      ;;
  esac
}

install_pip_packages() {
  if [[ $# -eq 0 ]]; then
    return
  fi
  if has_tool pip3; then
    run_cmd pip3 install --user "$@"
  elif has_tool pip; then
    run_cmd pip install --user "$@"
  else
    echo "pip is not available; skipping Python packages: $*"
  fi
}

web_setup() {
  if [[ "${PM}" == "apt" ]]; then
    install_system_packages nodejs npm yarnpkg
    if has_tool npm && ! has_tool pnpm; then
      run_cmd npm install -g pnpm
    fi
  elif [[ "${PM}" == "dnf" ]]; then
    install_system_packages nodejs npm yarn
    if has_tool npm && ! has_tool pnpm; then
      run_cmd npm install -g pnpm
    fi
  else
    install_system_packages node yarn pnpm
  fi
}

aiml_setup() {
  if [[ "${PM}" == "apt" ]]; then
    install_system_packages python3 python3-pip python3-venv
  elif [[ "${PM}" == "dnf" ]]; then
    install_system_packages python3 python3-pip
  else
    install_system_packages python
  fi
  install_pip_packages jupyterlab numpy pandas matplotlib scikit-learn
}

databases_setup() {
  if [[ "${PM}" == "apt" ]]; then
    install_system_packages sqlite3 postgresql-client mysql-client redis-tools
  elif [[ "${PM}" == "dnf" ]]; then
    install_system_packages sqlite postgresql mysql redis
  else
    install_system_packages sqlite postgresql mysql-client redis
  fi
}

devops_setup() {
  if [[ "${PM}" == "apt" ]]; then
    install_system_packages docker.io docker-compose kubectl terraform ansible
  elif [[ "${PM}" == "dnf" ]]; then
    install_system_packages docker docker-compose kubernetes-client terraform ansible
  else
    install_system_packages docker docker-compose kubectl terraform ansible
  fi
}

case "${PROFILE}" in
  web) web_setup ;;
  ai-ml) aiml_setup ;;
  databases) databases_setup ;;
  devops) devops_setup ;;
  all)
    web_setup
    aiml_setup
    databases_setup
    devops_setup
    ;;
  *)
    echo "Unsupported profile: ${PROFILE}" >&2
    usage
    exit 1
    ;;
esac

echo "Setup completed for profile: ${PROFILE}"
