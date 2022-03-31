#!/bin/bash

echo ">>>> Install asdf & plugins"
if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    cd ~/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"

    ~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
    bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
	NODE_VERSION=$(~/.asdf/bin/asdf latest nodejs)
    ~/.asdf/bin/asdf install nodejs $NODE_VERSION
    ~/.asdf/bin/asdf global nodejs $NODE_VERSION

    ~/.asdf/bin/asdf plugin-add java https://github.com/halcyon/asdf-java.git
	JAVA_VERSION=adoptopenjdk-15.0.1+9
    ~/.asdf/bin/asdf install java $JAVA_VERSION
    ~/.asdf/bin/asdf global java $JAVA_VERSION

    ~/.asdf/bin/asdf plugin-add maven
	MVN_VERSION=$(~/.asdf/bin/asdf latest maven)
    ~/.asdf/bin/asdf install maven $MVN_VERSION
    ~/.asdf/bin/asdf global maven $MVN_VERSION

    ~/.asdf/bin/asdf plugin-add scala
	SCALA_VERSION=$(~/.asdf/bin/asdf list all scala | grep ^2.13 | tail -1)
    ~/.asdf/bin/asdf install scala $SCALA_VERSION
    ~/.asdf/bin/asdf global scala $SCALA_VERSION

    ~/.asdf/bin/asdf plugin-add sbt
	SBT_VERSION=$(~/.asdf/bin/asdf latest sbt)
    ~/.asdf/bin/asdf install sbt $SBT_VERSION
    ~/.asdf/bin/asdf global sbt $SBT_VERSION
fi
