IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'engine')
EXEC('CREATE SCHEMA engine')