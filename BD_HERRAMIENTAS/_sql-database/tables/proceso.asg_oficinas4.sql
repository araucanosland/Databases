IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[asg_oficinas4]') AND type = 'U')
CREATE TABLE [proceso].[asg_oficinas4]
(
    [CodAsignacion] bigint NOT NULL,
    [CodOficina] float NULL,
    [Rut] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
)