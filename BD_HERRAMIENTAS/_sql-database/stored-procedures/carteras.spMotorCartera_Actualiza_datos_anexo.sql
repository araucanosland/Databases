IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_Actualiza_datos_anexo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_Actualiza_datos_anexo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_Actualiza_datos_anexo] 
@IdEmpresaAnexo INT
,@Anexo VARCHAR(150)
,@NumTrabajadores INT
,@IdComuna INT
,@NombreComuna VARCHAR(100)
,@Direccion VARCHAR(255)
AS
BEGIN

UPDATE BD_HERRAMIENTAS.[carteras].[TabCart_AnexoEmpresa] 
SET Anexo = @Anexo , NumTrabajadores = @NumTrabajadores, IdComuna = @IdComuna, NombreComuna = @NombreComuna, Direccion = @Direccion
WHERE IdEmpresaAnexo = @IdEmpresaAnexo

END