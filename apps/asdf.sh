#!/bin/bash

echo ">>>> Install asdf & plugins"
if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    cd ~/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"

    ~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
    ~/.asdf.bin/asdf install nodejs 12.19.0
    ~/.asdf.bin/asdf global nodejs 12.19.0

    ~/.asdf/bin/asdf plugin-add java https://github.com/halcyon/asdf-java.git
    ~/.asdf/bin/asdf install java adoptopenjdk-15.0.1+9
    ~/.asdf/bin/asdf global java adoptopenjdk-15.0.1+9

    ~/.asdf/bin/asdf plugin-add maven
    ~/.asdf/bin/asdf install maven 3.6.3
    ~/.asdf/bin/asdf global maven 3.6.3

    ~/.asdf/bin/asdf plugin-add scala
    ~/.asdf/bin/asdf install scala 2.13.3
    ~/.asdf/bin/asdf global scala 2.13.3

    ~/.asdf/bin/asdf plugin-add sbt
    ~/.asdf/bin/asdf install sbt 1.4.2
    ~/.asdf/bin/asdf global sbt 1.4.2
fi
