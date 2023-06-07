// import {PrismaClient} from '@prisma/client';
// const prisma = new PrismaClient();
// export default prisma;


import { PrismaClient } from "@prisma/client";
// attach PrismaClient to the `global` object during development to avoid
// exhausting your database connection limit.
// Learn more: 
// https://pris.ly/d/help/next-js-best-practices
let prisma

if (process.env.NODE_ENV === 'production') {
  prisma = new PrismaClient()
} else {
  if (!global.prisma) {
    global.prisma = new PrismaClient()
  }
  prisma = global.prisma
}
export default prisma