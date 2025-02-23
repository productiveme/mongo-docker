rs.initiate({
  _id: "rs0",
  members: [{ _id: 0, host: "localhost:27017" }],
});

// Connect to the database
const db = connect("localhost:27017/admin");

// Create the necessary collections
db.createCollection("config.transactions");
db.createCollection("config.image_collection");
db.createCollection("local.oplog.rs");
