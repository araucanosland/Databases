IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[Municipales]') AND type = 'U')
CREATE TABLE [dbo].[Municipales]
(
    [RutAfiliado] float NULL,
)