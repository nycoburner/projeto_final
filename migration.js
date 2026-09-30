const db= require("./db")

async function criar_estrutura(){
try{
    await db.pool.query(

`DROP TABLE IF EXIST cliente
`
        )



    }
    catch (error){
        console.log(error)
    
    }
}