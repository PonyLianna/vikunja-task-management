-- Create databases if they don't exist
CREATE DATABASE vikunja;
CREATE DATABASE n8n;

-- Create the vikunja user if it doesn't exist
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'vikunja') THEN
      CREATE USER vikunja WITH PASSWORD 'vikunja_password';
   END IF;
END
$do$;

-- Create the n8n user if it doesn't exist
DO
$do$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'n8n') THEN
      CREATE USER n8n WITH PASSWORD 'n8n' CREATEDB;
   END IF;
END
$do$;

-- Connect to vikunja database and set up permissions
\c vikunja;
GRANT ALL PRIVILEGES ON DATABASE vikunja TO vikunja;
GRANT ALL PRIVILEGES ON SCHEMA public TO vikunja;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO vikunja;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO vikunja;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO vikunja;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO vikunja;

-- Connect to n8n database and set up permissions
\c n8n;
ALTER DATABASE n8n OWNER TO n8n;
GRANT ALL PRIVILEGES ON DATABASE n8n TO n8n;
GRANT ALL PRIVILEGES ON SCHEMA public TO n8n;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO n8n;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO n8n;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO n8n;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO n8n;
ALTER SCHEMA public OWNER TO n8n;

-- Make sure public schema is accessible
\c n8n;
GRANT USAGE ON SCHEMA public TO n8n;
GRANT CREATE ON SCHEMA public TO n8n;