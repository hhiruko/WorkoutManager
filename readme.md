# To-do:

1. Add Unit Tests, then add them to workflows;
2. Update nginx config server_name, after deployment.

# Notes:

To build the project with local env file:

`docker compose -f docker-compose.dev.yaml --env-file .env.local up --build -d`

To run with debug mode (use --build if needed):

`XDEBUG_MODE=debug docker compose -f docker-compose.dev.yaml --env-file .env.local up -d `

To work with user passwords:

```
INSERT INTO users (name, email, password) VALUES
('nick testov', 'nick@example.com', crypt('12345', gen_salt('bf', 8)));

select * from users where password = crypt('12345', password);`
```