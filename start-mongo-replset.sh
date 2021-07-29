mkdir -p ~/db/rs-{0,1,2,3,4}
mkdir -p ~/db/rs-{0,1,2,3,4}/log

mongod --dbpath ~/db/rs-0 --logpath ~/db/rs-0/mongo.log --replSet mdbDefGuide --port 27017 --fork
mongod --dbpath ~/db/rs-1 --logpath ~/db/rs-1/mongo.log --replSet mdbDefGuide --port 27018 --fork
mongod --dbpath ~/db/rs-2 --logpath ~/db/rs-2/mongo.log --replSet mdbDefGuide --port 27019 --fork
mongod --dbpath ~/db/rs-3 --logpath ~/db/rs-3/mongo.log --replSet mdbDefGuide --port 27020 --fork
mongod --dbpath ~/db/rs-4 --logpath ~/db/rs-4/mongo.log --replSet mdbDefGuide --port 27021 --fork

sleep 10

cfg="{
    _id: 'mdbDefGuide',
    members: [
        {_id: 1, host: 'localhost:27017'},
        {_id: 2, host: 'localhost:27018'},
        {_id: 3, host: 'localhost:27019'},
        {_id: 4, host: 'localhost:27020'},
        {_id: 5, host: 'localhost:27021'}
    ]
}"
mongo localhost:27017 --eval "JSON.stringify(db.adminCommand({'replSetInitiate' : $cfg}))"