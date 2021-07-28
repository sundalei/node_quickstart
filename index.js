const { MongoClient } = require("mongodb");

const uri = "mongodb+srv://analytics:analytics-password@analytics.zp8ia.mongodb.net/mflix?retryWrites=true&w=majority";
const client = new MongoClient(uri);

async function run() {
    try {
        await client.connect();

        const database = client.db('mflix');
        const movies = database.collection('movies_initial');

        const query = { title: 'Back to the Future'};
        const movie = await movies.findOne(query);

        console.log(movie);
    } finally {
        await client.close();
    }
}

run().catch(console.dir);
