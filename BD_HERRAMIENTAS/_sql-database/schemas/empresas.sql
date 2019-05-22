IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'empresas')
EXEC('CREATE SCHEMA empresas')