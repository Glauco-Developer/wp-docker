# WordPress Docker Environment with Preloaded Database

This setup provides a complete WordPress environment using Docker, including phpMyAdmin and WP-CLI. The database is preloaded from an SQL dump file located in the `db/` folder.

---

## Steps to Set Up the Environment

```bash
# Build and Run the Docker Containers

# Build the Docker images
docker-compose up --build

# Start the containers
docker-compose up -d

# Access Points
# WordPress: http://localhost:8000
# phpMyAdmin: http://localhost:8080

# Configure SSL (Optional for Development)
mkdir ssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/server.key -out ssl/server.crt \
-subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

# Import the Database
docker exec -it wordpress-db bash
mysql -u root -p wordpress < /tmp/db/db.sql

# WP-CLI Commands

# Search and Replace URLs
docker exec -it wordpress-app bash
cd /var/www/html
wp search-replace 'https://www.domain.com' 'http://localhost:8000' --allow-root

# Update Plugins
wp plugin list --allow-root
wp plugin update acf-better-search --allow-root
wp plugin update --all --allow-root
```
