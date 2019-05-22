IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'proceso')
EXEC('CREATE SCHEMA proceso')