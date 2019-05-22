IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'carteras')
EXEC('CREATE SCHEMA carteras')