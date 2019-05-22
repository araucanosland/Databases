IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[security].[TabSca_Tokens]') AND type = 'U')
CREATE TABLE [security].[TabSca_Tokens]
(
    [TokenId] int NOT NULL IDENTITY(1, 1),
    [UserId] varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
    [AuthToken] nvarchar(250) COLLATE Modern_Spanish_CI_AS NOT NULL,
    [IssuedOn] datetime NOT NULL,
    [ExpiresOn] datetime NOT NULL,
    CONSTRAINT [PK__TabSca_T__658FEEEA681373AD] PRIMARY KEY CLUSTERED ([TokenId] ASC)
)

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE object_id = OBJECT_ID('[security].[TabSca_Tokens]') AND name = 'IDX_TOKEN_BUSQ')
CREATE NONCLUSTERED INDEX [IDX_TOKEN_BUSQ] ON [security].[TabSca_Tokens](
    [AuthToken] ASC,
    [ExpiresOn] ASC
)