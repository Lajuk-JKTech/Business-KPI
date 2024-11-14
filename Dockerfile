# Use the official PostgreSQL image from Docker Hub
FROM postgres:latest

# Set environment variables for PostgreSQL
ENV POSTGRES_USER=jktech
ENV POSTGRES_PASSWORD=123456
ENV POSTGRES_DB=ekedb

# Expose PostgreSQL port
EXPOSE 5432
