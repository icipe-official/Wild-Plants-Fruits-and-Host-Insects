import prisma from "../../../../lib/prisma";
export default async function handle(req, res) {
    if (req.method == "GET") {
    try{
        // get family data.
        const colors = await prisma.fruit_sizes.findMany({
            select:{
                size:true
            }
        })
        return res.json(colors);
    } catch(e){
        console.error(e)
    }
}}