IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'security')
EXEC('CREATE SCHEMA security')