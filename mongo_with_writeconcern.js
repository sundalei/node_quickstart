const { MongoClient } = require("mongodb");

const uri = "mongodb://localhost:27091,localhost:27092,localhost:27093";
const client = new MongoClient(uri, {
    serverSelectionTimeoutMS: 100000
});

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