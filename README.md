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

3. **Initialize direnv:**
   Run the following command in the project directory to allow direnv to load the `.envrc` file:
   ```bash
   direnv allow .
   ```

4. **Start the MongoDB Replicaset:**
   - If using Docker Compose:
     ```bash
     docker-compose up -d
     ```
   - If using Docker directly:
     ```bash
     docker build -t mongo-replicaset .
     docker run --name mongo-replicaset -d -p 27017:27017 mongo-replicaset
     ```

5. **Verify the Replicaset:**
   Connect to the MongoDB instance and check the replicaset status:
   ```bash
   docker exec -it mongo-replicaset mongo
   rs.status()
   ```

## Usage

Once the replicaset is running, you can connect to it using MongoDB clients or drivers. The connection string would typically be:
```
mongodb://localhost:27017
```

## Contributing

Feel free to fork this repository and submit pull requests to improve the setup or add new features.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
