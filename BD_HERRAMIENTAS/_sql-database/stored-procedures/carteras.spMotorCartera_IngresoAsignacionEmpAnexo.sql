IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCartera_IngresoAsignacionEmpAnexo]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCartera_IngresoAsignacionEmpAnexo]
GO
CREATE PROCEDURE [carteras].[spMotorCartera_IngresoAsignacionEmpAnexo]
	@Tipo varchar(15),
	@id int,
	@RutEjecutivo varchar(12)
AS
BEGIN
	If @Tipo='Empresas'
	BEGIN
		DELETE FROM BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsignacionEmpresa] 
		WHERE IdSucursalEmpresa = @id and RutEjectAsignado = @RutEjecutivo

		Insert into BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsignacionEmpresa](IdSucursalEmpresa, RutEjectAsignado,FechaAsignacion)
		Values(@id, @RutEjecutivo,GETDATE())
	END
	If @Tipo='FAnexo'
	BEGIN
		DELETE FROM BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsigAnexo] 
		WHERE IdEmpresaAnexo = @id and RutEjecutivoAsigAnexo = @RutEjecutivo
	    
		Insert Into BD_HERRAMIENTAS.[carteras].[TabCart_EjecAsigAnexo](IdEmpresaAnexo, RutEjecutivoAsigAnexo,FechaAsignacion)
		Values(@id, @RutEjecutivo,GETDATE())
	END
END