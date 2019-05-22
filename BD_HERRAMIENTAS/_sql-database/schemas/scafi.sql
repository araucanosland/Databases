IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'scafi')
EXEC('CREATE SCHEMA scafi')