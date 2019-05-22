IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'fichas')
EXEC('CREATE SCHEMA fichas')