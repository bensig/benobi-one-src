#!/usr/bin/env bash
set -euo pipefail

if ! command -v curl >/dev/null 2>&1; then
  echo "curl is required but not installed." >&2
  exit 1
fi

BASE_URL="${1:-http://localhost:1313}"
BASE_URL="${BASE_URL%/}"
PROJECTS_URL="${BASE_URL}/projects/"
CUSTOM_CSS_URL="${BASE_URL}/css/custom.css"

printf 'Checking projects page at %s\n' "${PROJECTS_URL}"

if ! http_status="$(curl -s -o /dev/null -w '%{http_code}' "${PROJECTS_URL}")"; then
  echo "Failed to connect to ${PROJECTS_URL}. Is the Hugo server running?" >&2
  exit 1
fi

if [[ "${http_status}" != "200" ]]; then
  echo "Projects page returned HTTP ${http_status}" >&2
  exit 1
fi

if ! page_html="$(curl -s "${PROJECTS_URL}")"; then
  echo "Unable to fetch projects page content." >&2
  exit 1
fi

if [[ -z "${page_html}" ]]; then
  echo "Projects page response was empty." >&2
  exit 1
fi

if ! grep -q 'class="portfolio-item"' <<<"${page_html}"; then
  echo "No portfolio items found on projects page." >&2
  exit 1
fi

printf 'Fetching custom CSS at %s\n' "${CUSTOM_CSS_URL}"
if ! css_content="$(curl -s "${CUSTOM_CSS_URL}")"; then
  echo "Unable to fetch custom CSS from ${CUSTOM_CSS_URL}." >&2
  exit 1
fi

if [[ -z "${css_content}" ]]; then
  echo "Custom CSS response was empty." >&2
  exit 1
fi

if grep -q '.portfolio-item' <<<"${css_content}"; then
  if tr '\n' ' ' <<<"${css_content}" | grep -E -q '.portfolio-item[^{]*\{[^}]*display:[[:space:]]*flex'; then
    echo "Custom CSS defines .portfolio-item with flex layout."
  else
    echo "Custom CSS does not define a flex layout for .portfolio-item." >&2
    exit 1
  fi
else
  echo ".portfolio-item selector not found in custom CSS." >&2
  exit 1
fi

echo "Projects page is reachable and styled with the custom layout."
