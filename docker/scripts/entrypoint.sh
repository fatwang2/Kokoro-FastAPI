#!/bin/bash
set -e

if [ "$DOWNLOAD_MODEL" = "true" ]; then
    python docker/scripts/download_model.py --output api/src/models/v1_0
fi

exec uv run python -m uvicorn api.src.main:app --host 0.0.0.0 --port 8880 --log-level debug