#!/bin/bash

# Usage
# ./install.sh 2>&1 | tee install.log
#

main_section_heading () {
    echo " "
    echo " "
    echo "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"
    echo " $1"
    if [ -n "$2" ]; then
        # $2 is set to a non-empty string
        echo " $2"
    fi
    echo "======================================================================"
}

sub_section_heading () {
    echo " "
    echo " "
    echo "--- $1"
    echo "--------------------"
}


# ----------------------------------------------------------------------------------------------------
main_section_heading "Environment variables"
# ----------------------------------------------------------------------------------------------------
# Env variables used in the commands below

# ----------------------------------------------------------------------------------------------------
main_section_heading "Dependencies"
# ----------------------------------------------------------------------------------------------------
set -x
apt-get update
apt-get install -y curl wget binutils

set +x
# ----------------------------------------------------------------------------------------------------
main_section_heading "nodejs 5.x"
# ----------------------------------------------------------------------------------------------------
set -x
curl -sL https://deb.nodesource.com/setup_5.x | /bin/bash -
apt-get install -y nodejs

# Update package list and upgrade all packages
apt-get update
apt-get -y upgrade

set +x
# ----------------------------------------------------------------------------------------------------
main_section_heading "elixir, incl. erlang"
# ----------------------------------------------------------------------------------------------------
set -x
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb
apt-get update
apt-get -y install esl-erlang
apt-get -y install elixir


set +x
# ----------------------------------------------------------------------------------------------------
main_section_heading "phoenix"
# ----------------------------------------------------------------------------------------------------
set -x
mix local.hex --force
mix local.rebar --force
mix archive.install "https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez" --force

set +x
# ----------------------------------------------------------------------------------------------------
main_section_heading "Check the version numbers to test the installations"
# ----------------------------------------------------------------------------------------------------

sub_section_heading "node"
echo "node --version"
node --version

sub_section_heading "erlang"
echo "cat /usr/lib/erlang/releases/RELEASES"
cat /usr/lib/erlang/releases/RELEASES

sub_section_heading "elixir"
echo "elixir --version"
elixir --version

mix deps.get --only prod
MIX_ENV=prod mix compile
MIX_ENV=prod mix release
cp rel/hello_semaphore/releases/$VERSION/hello_semaphore.tar.gz /app/hello_semaphore.tar.gz

apt-get remove -y nodejs elixir erlang esl-erlang

# ----------------------------------------------------------------------------------------------------
main_section_heading "End"
# ----------------------------------------------------------------------------------------------------

