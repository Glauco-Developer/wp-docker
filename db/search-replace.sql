USE wordpress;

UPDATE ety39_options SET option_value = REPLACE(option_value, 'https://www.kerrygoldusa.com', 'http://localhost:8080') WHERE option_name IN ('home', 'siteurl');
UPDATE ety39_posts SET guid = REPLACE(guid, 'https://www.kerrygoldusa.com', 'http://localhost:8080');
UPDATE ety39_posts SET post_content = REPLACE(post_content, 'https://www.kerrygoldusa.com', 'http://localhost:8080');
UPDATE ety39_postmeta SET meta_value = REPLACE(meta_value, 'https://www.kerrygoldusa.com', 'http://localhost:8080');

-- SELECT option_name, option_value FROM ety39_options WHERE option_name IN ('home', 'siteurl');