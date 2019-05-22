IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[sp_MotorCartera_GuardaAnexo]') AND type = 'P')
DROP PROCEDURE [carteras].[sp_MotorCartera_GuardaAnexo]
GO
CREATE PROCEDURE [carteras].[sp_MotorCartera_GuardaAnexo](
 @Token VARCHAR(50)
,@RutEmpresa varchar(12)
,@NombreEmpresa varchar(255)
,@Anexo varchar(255)
,@NumTrabajadores int
,@IdComuna int 
,@NombreComuna varchar(255)
,@Direccion varchar(255)
)
AS
BEGIN
DECLARE @CodOficina int = security.fnSca_ObtenerOficinaByToken(@Token)
DECLARE @RutEjecutivo varchar(12) = CONVERT(VARCHAR, security.fnSca_ObtenerRutByToken (@Token))

INSERT INTO [carteras].[TabCart_AnexoEmpresa]
											VALUES(@RutEmpresa
													,@NombreEmpresa
													,@Anexo
													,@NumTrabajadores
													,@CodOficina
													,@IdComuna
													,@NombreComuna
													,@Direccion
													,@RutEjecutivo
													,GETDATE()
													,0 )


END