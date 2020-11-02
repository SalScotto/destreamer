#!/usr/bin/env bash
NODE_VERSION=$(node --version)

if [ $# -eq 0 ]; then
    echo "Destreamer Unina"
    echo "Usage:"
    echo "docker run -it --rm -e STREAMPASSWD=[your Unina/MSTeams Password] \\"
    echo -e "\t -v [path of the download directory]:/destreamer/videos \\"
    echo -e "\t d1l3mm4/destreamer_unina \\"
	echo -e "\t -u [your Unina/MSTeams  email] \\"
	echo -e "\t [other destreamer options (eg. -i for video URLs)] "
else
    node --max-http-header-size 32768 build/src/destreamer.js "$@"
fi