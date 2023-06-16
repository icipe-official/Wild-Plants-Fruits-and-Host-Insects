#!/bin/bash

docker build -t icipe/wpfhi/app:latest . \
--build-arg NEXT_PUBLIC_API_BASE_URL="https://test-dmmg.icipe.org/wpfhi" \
--build-arg DATABASE_URL="postgresql://wpfhi:wpfhi2023@postgres.default.svc.cluster.local:5432/wpfhi" \
--build-arg NEXT_PUBLIC_BASE_PATH="/wpfhi" \
--build-arg NODE_ENV="production"
