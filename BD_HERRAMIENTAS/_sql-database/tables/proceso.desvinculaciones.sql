IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[proceso].[desvinculaciones]') AND type = 'U')
CREATE TABLE [proceso].[desvinculaciones]
(
    [OFI] float NULL,
    [RUT_EMP] float NULL,
    [DVE] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [RUT_AFIL|] float NULL,
    [DVA] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
    [CESACION] float NULL,
    [REGION] float NULL,
    [PERIODO] float NULL,
    [F9] nvarchar(255) COLLATE Modern_Spanish_CI_AS NULL,
)