IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[engine].[AttrValores]') AND type = 'U')
CREATE TABLE [engine].[AttrValores]
(
    [CodAttr] varchar(100) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [CodCamp] int NOT NULL,
    [CodAsignacion] int NOT NULL,
    [ValorAttr] varchar(255) COLLATE Modern_Spanish_CI_AS NOT NULL,
    CONSTRAINT [PK__AttrValo__E27FE1811FCDBCEB] PRIMARY KEY CLUSTERED 
    (
        [CodAttr] ASC,
        [CodCamp] ASC,
        [CodAsignacion] ASC,
        [ValorAttr] ASC
    )
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[engine].[AttrValores]') AND name = 'IDXBQ_QSFD')
CREATE NONCLUSTERED INDEX [IDXBQ_QSFD] ON [engine].[AttrValores](
    [CodAttr] ASC,
    [CodCamp] ASC,
    [CodAsignacion] ASC
)