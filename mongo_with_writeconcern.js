const { MongoClient } = require("mongodb");

const uri = "mongodb://localhost:27017";
const client = new MongoClient(uri, {
    serverSelectionTimeoutMS: 100000
});

async function run() {
    try {
        await client.connect();

        const database = client.db('test');
        const products = database.collection('products');

        await products.insertOne({"_id": 10, "item": "envelopes", "qty" : 100, "type" : "Self-Sealing"},
         { writeConcern : {"w" : "eachDC", wtimeout : 1000}});
    } finally {
        await client.close();
    }
}

run().catch(console.dir);