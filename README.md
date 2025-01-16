# Docker Compose Setup for WordPress with PHP, MySQL, and phpMyAdmin

## Summary of the Key Points

- **PHP Service**: Runs the PHP image with Apache, exposing the site on port 8080.
- **Database Service**: Runs MySQL 5.7 with a persistent volume for database data.
- **phpMyAdmin Service**: Provides a web interface to manage the MySQL database, accessible on port 8081.
- **Volumes**: Ensures MySQL data persists across container restarts and shutdowns.
- **Networks**: All services are connected to a custom bridge network (`wordpress_network`) to allow communication between containers.

## Commands to Run

```bash
# Build and Start Containers
docker-compose up -d

# Check the status of the containers
docker-compose ps

# Access the PHP container
docker exec -it php-container bash

# Check PHP version inside the container
php -v

# Update WordPress (WP-CLI)
wp core update --allow-root

# Update all Plugins (WP-CLI)
wp plugin update --all --allow-root

# Update a specific Plugins (WP-CLI)
wp plugin update <plugin-slug> --allow-root

# List all plugins
wp plugin list --allow-root

# Check WP Version
wp core version --allow-root

# Access the MySQL container
docker exec -it mysql-container bash

#To access MySQL:
mysql -u root -p

# Access phpMyAdmin in your browser
Go to http://localhost:8081 to manage the MySQL database.

# Stop the containers
docker-compose down


