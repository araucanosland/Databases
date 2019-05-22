IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'mae')
EXEC('CREATE SCHEMA mae')