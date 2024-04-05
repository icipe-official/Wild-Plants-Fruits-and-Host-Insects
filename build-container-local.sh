#!/bin/bash

docker build -t icipe/wpfhi/app_local:latest . \
--build-arg NEXT_PUBLIC_API_BASE_URL="http://localhost:3000/wpfhi" \
--build-arg DATABASE_URL="postgresql://postgres:postgres2023@host.docker.internal:5432/wpfhi" \
--build-arg NEXT_PUBLIC_BASE_PATH="/wpfhi" \
--build-arg NODE_ENV="production"
