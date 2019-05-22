IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'licencias')
EXEC('CREATE SCHEMA licencias')