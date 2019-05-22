IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[asg_oficinas3]') AND type = 'U')
CREATE TABLE [proceso].[asg_oficinas3]
(
    [CodAsignacion] bigint NOT NULL,
    [CodOficina] float NULL,
)