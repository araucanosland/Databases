IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[anexos_empresas]') AND type = 'U')
CREATE TABLE [proceso].[anexos_empresas]
(
    [Codigo Oficina (Obligatorio)] float NULL,
    [Rut Empresa (obligatorio)] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre Empresa Real] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre Fantasia Anexo (Obligatorio)] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Cargo Ejecutivo (Obligatorio)] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Rut Ejecutivo] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Nombre Ejecutivo Asignado (Obligatorio)] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Comuna (Obligatorio)] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Direccion (si la tiene)] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [N° Trabajador (si no lo tiene dejar en blanco)] float NULL,
    [Observacion] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [F12] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [F13] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [CodigoOfi] float NULL,
    [CargoEjecutivo] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [Comuna] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
)