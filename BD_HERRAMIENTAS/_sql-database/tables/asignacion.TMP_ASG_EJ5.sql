IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[asignacion].[TMP_ASG_EJ5]') AND type = 'U')
CREATE TABLE [asignacion].[TMP_ASG_EJ5]
(
    [EmpresaRut] float NULL,
    [EjecutivoRut] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Oficina] float NULL,
)