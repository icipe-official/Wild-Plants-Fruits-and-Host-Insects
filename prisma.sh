#!/bin/bas
npm i --save-dev prisma@latest --force 
npm i @prisma/client@latest --force
npx prisma init
npx prisma db pull
npx prisma generate
