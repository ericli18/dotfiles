#!/usr/bin/env bash
set -e
set -u
set -o pipefail

is_wifi_enabled() {
  if [[ "$(nmcli radio wifi)" == "enabled" ]]; then
    echo "true"
  else
    echo "false"
  fi
}

##
# Exits script with an error if the Wi-Fi radio is off
##
make_sure_wifi_is_enabled() {
  if [[ "$(is_wifi_enabled)" == 'false' ]]; then
    echo "Error: Wi-Fi is disabled. Use '$(basename "$0") on' to enable it." >&2
    exit 1
  fi
}

# --- Core Functions ---

##
# Show Wi-Fi radio status and current connection details
##
wifi_status() {
  local radio_state
  radio_state="$(nmcli radio wifi)"
  echo "Wi-Fi Radio: $radio_state"

  if [[ "$radio_state" == "enabled" ]]; then
    echo "Current Connection(s):"
    # Filter for active Wi-Fi connections
    nmcli connection show --active | grep 'wifi' || echo "  (Not connected to any Wi-Fi network)"
  fi
}

##
# List available Wi-Fi networks
##
wifi_list() {
  echo "Scanning for Wi-Fi networks..."
  # 'nmcli device wifi list' will rescan by default if list is too old
  nmcli device wifi list
}

##
# Join a Wi-Fi network
# Usage: wifi_join <ssid> [password]
##
wifi_join() {
  local ssid="$1"
  local pass="${2:-}" # Default to empty string if $2 is not provided

  if [[ -z "$ssid" ]]; then
    echo "Error: SSID must be provided for 'join'." >&2
    echo
    help
    exit 1
  fi

  if [[ -z "$pass" ]]; then
    echo "Attempting to connect to open network: $ssid"
    nmcli device wifi connect "$ssid"
  else
    echo "Attempting to connect to protected network: $ssid"
    nmcli device wifi connect "$ssid" password "$pass"
  fi
}

##
# Turn off the Wi-Fi radio
##
wifi_off() {
  nmcli radio wifi off
  echo "Wi-Fi radio disabled."
}

##
# Turn on the Wi-Fi radio
##
wifi_on() {
  nmcli radio wifi on
  echo "Wi-Fi radio enabled."
}

##
# Restart the Wi-Fi radio (off, then on)
##
wifi_toggle() {
  echo "Restarting Wi-Fi radio..."
  wifi_off
  sleep 1
  wifi_on
}

##
# Show the help message
##
help() {
  cat << EOF
Usage: $(basename "$0") [command]

A simple nmcli wrapper for common Wi-Fi operations.

Available commands:
  status          Show Wi-Fi radio status and current connection
  list            List available Wi-Fi networks
  join <ssid> [password]
                  Connect to a Wi-Fi network (password is optional)
  off             Turn off the Wi-Fi radio
  on              Turn on the Wi-Fi radio
  toggle          Turn Wi-Fi radio off, then on
  help            Show this help message
EOF
}

# --- Main Logic ---

# No arguments provided, show help
if [[ $# == 0 ]]; then
  help
  exit 0
fi

# Main command dispatcher
# We use 'case' for clarity instead of a long if/elif chain
case "$1" in
  status)
    wifi_status
    ;;
  list)
    make_sure_wifi_is_enabled
    wifi_list
    ;;
  join)
    make_sure_wifi_is_enabled
    # Pass the 2nd and 3rd script arguments ($2, $3) to the function
    # ${2:-} provides an empty string if $2 is not set (for open networks)
    wifi_join "${2:-}" "${3:-}"
    ;;
  off)
    wifi_off
    ;;
  on)
    wifi_on
    ;;
  toggle)
    wifi_toggle
    ;;
  help)
    help
    ;;
  *)
    echo "Error: Unknown command '$1'" >&2
    echo
    help
    exit 1
    ;;
esac


