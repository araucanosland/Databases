IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[asg_oficinas_x]') AND type = 'U')
CREATE TABLE [proceso].[asg_oficinas_x]
(
    [CodAsignacion] bigint NOT NULL,
    [cod_Agencia_Asignada] int NULL,
)