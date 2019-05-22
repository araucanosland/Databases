IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[asignacion].[CMP_SEGCESAN_DEBUGED]') AND type = 'U')
CREATE TABLE [asignacion].[CMP_SEGCESAN_DEBUGED]
(
    [Row#] bigint NULL,
    [Rut_Afiliado] float NULL,
    [Dv_Afiliado] nvarchar(2) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Oficina] int NULL,
    [Folios] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [N_Creditos] int NULL,
    [Prioridad] int NULL,
    [idAsignacion] bigint NULL,
)