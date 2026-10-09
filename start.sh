#!/usr/bin/env sh
# Run Inkboard locally without Docker. Needs Python 3 (preinstalled on macOS and most Linux).
# Usage: ./start.sh            -> http://localhost:8080
#        PORT=9000 ./start.sh  -> http://localhost:9000
set -e
cd "$(dirname "$0")"
PORT="${PORT:-8080}"
URL="http://localhost:$PORT"
echo "Inkboard is running at $URL  (press Ctrl+C to stop)"
( sleep 1; command -v open >/dev/null && open "$URL" || command -v xdg-open >/dev/null && xdg-open "$URL" ) >/dev/null 2>&1 &
exec python3 -m http.server "$PORT" --bind 127.0.0.1
