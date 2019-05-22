IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'alertafi')
EXEC('CREATE SCHEMA alertafi')