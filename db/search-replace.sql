USE wordpress;

UPDATE wp_options SET option_value = REPLACE(option_value, 'https://www.kerrygoldusa.com', 'http://localhost:8080') WHERE option_name IN ('home', 'siteurl');
UPDATE wp_posts SET guid = REPLACE(guid, 'https://www.kerrygoldusa.com', 'http://localhost:8080');
UPDATE wp_posts SET post_content = REPLACE(post_content, 'https://www.kerrygoldusa.com', 'http://localhost:8080');
UPDATE wp_postmeta SET meta_value = REPLACE(meta_value, 'https://www.kerrygoldusa.com', 'http://localhost:8080');

-- SELECT option_name, option_value FROM wp_options WHERE option_name IN ('home', 'siteurl');