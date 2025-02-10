-- Check if admin_user exists before creating it
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'admin_user') THEN
        CREATE ROLE admin_user WITH LOGIN PASSWORD 'AdminSecurePass123';
    END IF;
END $$;

GRANT ALL PRIVILEGES ON DATABASE bookstore_db TO admin_user;

-- Check if view_user exists before creating it
DO $$ 
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'view_user') THEN
        CREATE ROLE view_user WITH LOGIN PASSWORD 'ViewOnlyPass123';
    END IF;
END $$;

GRANT CONNECT ON DATABASE bookstore_db TO view_user;
GRANT USAGE ON SCHEMA public TO view_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO view_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO view_user;
