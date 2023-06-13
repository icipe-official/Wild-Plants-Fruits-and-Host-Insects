import express from "express";
// const express = require('express')
import prisma from "../../lib/prisma";
const app = express();
// instance of prisma client
// middlewares
app.use(express.json());
app.get("/", async (req, res) => {
  const posts = await prisma.families.findMany();

  return res.status(200).json({ success: true, posts });
});
app.listen(3000, () => {
  console.log(`Listening to 3000`);
});

//     const g = req.body;
//     console.log(g)
//     try {
//       // Check if the role already exists
//       const existingRole = await prisma.family({ name: roleName });
//     //   // If the role does not exist, create it
//     // //   let role = existingRole || await prisma.createRole({ name: roleName });
//     // //   // Check if the user already exists
//     // //   const existingUser = await prisma.genus({ name: userName });
//     // //   // If the user does not exist, create it
//     // //   let user = existingUser || await prisma.createUser({ name: userName });
//     // //   // Check if the user already has the role
//     // //   const existingUserRole = await prisma.family({ id: user.id }).userRoles({ where: { role: { id: role.id } } });
//     // //   // If the user does not have the role, create the relationship
//     // //   if (!existingUserRole.length) {
//     // //       await prisma.createUserRole({
//     // //           user: { connect: { id: user.id } },
//     // //           role: { connect: { id: role.id } }
//     // //       });
//     //   }
//     } catch (err) {
//         res.status(500).json({ message: 'An error occurred' });
//       }
//     });
// }
