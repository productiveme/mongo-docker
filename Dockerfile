FROM mongo:latest

ARG MONGO_INITDB_ROOT_USERNAME
ARG MONGO_INITDB_ROOT_PASSWORD
ENV MONGO_INITDB_ROOT_USERNAME=${MONGO_INITDB_ROOT_USERNAME}
ENV MONGO_INITDB_ROOT_PASSWORD=${MONGO_INITDB_ROOT_PASSWORD}

USER root

# Generate keyfile
RUN openssl rand -base64 756 > /tmp/replica.key
RUN chmod 400 /tmp/replica.key
RUN chown mongodb:mongodb /tmp/replica.key

# Copy the initialization script
COPY mongo-init.js /docker-entrypoint-initdb.d/mongo-init.js

HEALTHCHECK --interval=10s --timeout=30s --start-period=2s --retries=10 CMD mongosh -u ${MONGO_INITDB_ROOT_USERNAME} -p ${MONGO_INITDB_ROOT_PASSWORD} --eval "try { rs.status().ok } catch (e) { rs.initiate({ '_id': 'rs0', 'members': [{ '_id': 0, 'host': 'localhost:27017' }] }).ok }"

# Start MongoDB with replica set
CMD ["mongod", "--replSet", "rs0", "--bind_ip_all", "--keyFile", "/tmp/replica.key"]
