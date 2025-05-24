const { MongoClient } = require("mongodb");

const uri = "mongodb+srv://dalei:oarnud9I@analytics.fegzyn1.mongodb.net/?retryWrites=true&w=majority&appName=analytics";
const client = new MongoClient(uri);

async function run() {
    try {
        await client.connect();

        const database = client.db('sample_mflix');
        const movies = database.collection('movies');

        const query = { title: 'Back to the Future'};
        const movie = await movies.findOne(query);

        console.log(movie);
    } finally {
        await client.close();
    }
}

run().catch(console.dir);
