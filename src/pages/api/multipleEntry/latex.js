import prisma from "../../../../lib/prisma";
export default async function handle(req, res) {
    if (req.method == "GET") {
    try{
        // get fruit type data.
        const latex = await prisma.latex.findMany({
            select: {
                latex_description: true
            }
        
        })
        return res.json(latex);
    } catch(e){
        console.error(e)
    }
}}

