IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[asg_oficinas]') AND type = 'U')
CREATE TABLE [proceso].[asg_oficinas]
(
    [CodAsignacion] bigint NOT NULL,
    [CodOficina] int NOT NULL,
)