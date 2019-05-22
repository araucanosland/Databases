IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_Empresa]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_Empresa]
(
    [emp_id] int NOT NULL IDENTITY(1, 1),
    [emp_rut] varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [emp_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [emp_holding] varchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    CONSTRAINT [PK__TabEmp_E__1299A8612E3BD7D3] PRIMARY KEY CLUSTERED ([emp_id] ASC)
)