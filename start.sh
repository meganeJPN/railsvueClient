#!/bin/bash

if [ "$DEPLOYMENT_STAGE" = 'production' ]; then
  echo 'harukabe client release stage: production'
  echo 'VITE_BaseApiUrl=http://api.haruki-wood.co.jp' > .env
  npm run dev
elif [ "$DEPLOYMENT_STAGE" = 'staging' ]; then
  echo 'harukabe client release stage: staging'
  echo 'VITE_BaseApiUrl=http://api.staging-haruki.net' > .env
  npm run dev
else
  echo 'harukabe client release stage: development'
  echo 'VITE_BaseApiUrl=http://127.0.0.1:4000/api' > .env
  npm run dev
fi
