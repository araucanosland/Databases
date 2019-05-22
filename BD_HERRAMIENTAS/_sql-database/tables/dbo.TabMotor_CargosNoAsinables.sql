IF NOT EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[TabMotor_CargosNoAsinables]') AND type = 'U')
CREATE TABLE [dbo].[TabMotor_CargosNoAsinables]
(
    [Cargo] varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
)