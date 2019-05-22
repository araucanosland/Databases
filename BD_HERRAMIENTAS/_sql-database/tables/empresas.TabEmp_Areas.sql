IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[empresas].[TabEmp_Areas]') AND type = 'U')
CREATE TABLE [empresas].[TabEmp_Areas]
(
    [area_id] int NOT NULL IDENTITY(1, 1),
    [area_nombre] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__TabEmp_A__985D6D6B2A6B46EF] PRIMARY KEY CLUSTERED ([area_id] ASC)
)