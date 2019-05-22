IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'asignacion')
EXEC('CREATE SCHEMA asignacion')