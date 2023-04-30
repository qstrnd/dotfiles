#!/usr/bin/env bash

# Reading device info

function sim_list_booted() {
  xcrun simctl list devices | grep -E 'iPhone|iPad|iPod' | grep '(Booted)' | sed -E 's/.*\(([0-9A-F-]+)\).*/\1/g'
}

function sim_list_booted_named() {
  xcrun simctl list devices | grep -E 'iPhone|iPad|iPod' | grep '(Booted)'
}

# status bar

function sim_update_status_bar_booted() {
  for sim in $(sim_list_booted); do
    xcrun simctl status_bar "$sim" override --time "9:41" --batteryState charged --batteryLevel 100
  done
}

# reloading

function sim_reload() {
  local sim="$1"
  xcrun simctl shutdown "$sim"
  xcrun simctl boot "$sim"
}

function sim_reload_booted() {
  for sim in $(sim_list_booted); do
    xcrun simctl shutdown "$sim"
    xcrun simctl boot "$sim"
  done
}

# opening links

function sim_open_on_device() {
  local sim="$1"
  local url="$2"
  xcrun simctl openurl "$sim" "$url"
}

function sim_open_booted() {
  local url="$1"
  for sim in $(sim_list_booted); do
    xcrun simctl openurl "$sim" "$url"
  done
}

function sim_open() {
    local deeplink="$1"
    local device="$2"
    if [ -z "$device" ]; then
        echo "Opening \"$deeplink\" on all booted devices"
        sim_open_booted "$deeplink"
    else
        echo "Opening \"$deeplink\" on $device"
        sim_open_on_device "$device" "$deeplink"
    fi
}