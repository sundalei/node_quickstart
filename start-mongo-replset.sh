mkdir -p ~/mongosvr/rs-{0,1,2,3}
mkdir -p ~/mongosvr/rs-{0,1,2,3}/log

mongod --dbpath ~/mongosvr/rs-0 --logpath ~/mongosvr/rs-0/mongo.log --replSet mdbDefGuide --port 27017 --fork
mongod --dbpath ~/mongosvr/rs-1 --logpath ~/mongosvr/rs-1/mongo.log --replSet mdbDefGuide --port 27018 --fork
mongod --dbpath ~/mongosvr/rs-2 --logpath ~/mongosvr/rs-2/mongo.log --replSet mdbDefGuide --port 27019 --fork
mongod --dbpath ~/mongosvr/rs-3 --logpath ~/mongosvr/rs-3/mongo.log --replSet mdbDefGuide --port 27020 --fork

sleep 5

cfg="{
    _id: 'mdbDefGuide',
    members: [
        {_id: 1, host: 'localhost:27017'},
        {_id: 2, host: 'localhost:27018'},
        {_id: 3, host: 'localhost:27019'},
        {_id: 4, host: 'localhost:27020'},
    ]
}"
mongo localhost:27017 --eval "JSON.stringify(db.adminCommand({'replSetInitiate' : $cfg}))"