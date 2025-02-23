# MongoDB Single Instance Replicaset Setup

This repository provides a Docker-based solution for setting up a single instance MongoDB replicaset. It's designed to be simple to set up and run, perfect for development and testing environments.

## Prerequisites

- Docker
- direnv (optional but handy)

## Setup Instructions

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/productiveme/mongo-docker.git
   cd mongo-docker
   ```

2. **Install direnv (optional):**
   direnv is used to manage environment variables for this project. To install direnv, follow these steps:

   - On macOS:
     ```bash
     brew install direnv
     ```
   - On Linux:
     ```bash
     sudo apt-get update
     sudo apt-get install direnv
     ```
   - After installation, add the following line to your shell configuration file (e.g., `.bashrc`, `.zshrc`):
     ```bash
     eval "$(direnv hook bash)"
     ```
   - Reload your shell configuration:
     ```bash
     source ~/.bashrc  # or ~/.zshrc
     ```

3. **Ensure environment variables are set:**

   1. (With direnv) Run the following command in the project directory to allow direnv to load the `.envrc` file:

   ```bash
   direnv allow .
   ```

   2. (Without direnv) `export MONGO_INITDB_ROOT_USERNAME=your_username` and `export MONGO_INITDB_ROOT_PASSWORD=your_password`

4. **Build the Docker Image:**

   ```bash
   yarn makekey
   yarn dockerbuild
   ```

5. **Start the MongoDB Replicaset:**

   ```bash
   yarn dockerrun
   ```

6. **Verify the Replicaset:**
   Connect to the MongoDB instance and check the replicaset status:
   ```bash
   docker exec -it mongodb mongosh -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD
   rs.status()
   ```

## Usage

Once the replicaset is running, you can connect to it using MongoDB clients or drivers. The connection string would typically be:

```
mongodb://username:password@localhost:27017/dbname?authSource=admin
```

Or you can create a database and user like this:

```
docker exec -it mongodb mongosh -u $MONGO_INITDB_ROOT_USERNAME -p $MONGO_INITDB_ROOT_PASSWORD
use dbname
db.createUser({user: "username", pwd: "password", roles: ["dbOwner"]})
```

## Contributing

Feel free to fork this repository and submit pull requests to improve the setup or add new features.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
