IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[spMotorCarteraAdminIngreso_Guardar]') AND type = 'P')
DROP PROCEDURE [carteras].[spMotorCarteraAdminIngreso_Guardar]
GO


CREATE PROCEDURE [carteras].[spMotorCarteraAdminIngreso_Guardar]
(
	@IdEmpresaIngreso int,
	@Token varchar(250),
	@EmpresaRut varchar(50),
	@EmpresaNombre varchar(250),
	@NTrabajador int,
	@EsHolding int,
	@Comentarios varchar(255) =null

)
AS

BEGIN

	SET NOCOUNT ON;
	DECLARE @identity int
	DECLARE @CodSucursal int = BD_REPORTES.negocios.fnSca_ObtenerOficinaByToken(@Token)
	Declare @RutEjecutivoIngreso varchar(15)=BD_REPORTES.negocios.[fnSca_ObtenerRutEjecutivoByToken](@Token)
	DECLARE @EX INT = 0
	SET @identity = @IdEmpresaIngreso
	IF @identity > 0
	BEGIN
		UPDATE BD_HERRAMIENTAS.carteras.[TabCart_IngresoCarteraEmpresaAdmin]  
		Set	[SucursalEmpresa]=''
			,[RutEmpresa]=@EmpresaRut
		    ,[NombreEmpresa]=@EmpresaNombre
            ,[CodOficina]=@CodSucursal
            ,[NTrabajador]=@NTrabajador
		    ,[Holding]=@EsHolding
		    ,[Comentarios]=@Comentarios
		    ,[FechaIngreso]=getdate()
		    ,[EjecutivoIngreso]=@RutEjecutivoIngreso
		WHERE IdSucursalEmpresa = @identity
		update BD_HERRAMIENTAS.carteras.TabCart_CarteraEmpresas
		SET	     RutEmpresa  =@EmpresaRut
				,NombreEmpresa=@EmpresaNombre
				,CodOficina=@CodSucursal
				,NTrabajador=@NTrabajador
				,Holding=@EsHolding
				,EjecutivoIngreso=@RutEjecutivoIngreso
				,TipoEmpresa=0
	END
	ELSE
	BEGIN
		
		select @EX=0
		--from [BD_HERRAMIENTAS].[carteras].[TabCart_IngresoCarteraEmpresaAdmin]
		--where [RutEmpresa] =@EmpresaRut
		--and [CodOficina]=@CodSucursal
		

		IF @EX > 0 
		BEGIN 
			RAISERROR('No se puede ingresar mas de una vez una empresa',16,1);
		END 
		ELSE
		BEGIN

				INSERT INTO [carteras].[TabCart_IngresoCarteraEmpresaAdmin]
				([SucursalEmpresa]
				,[RutEmpresa]
				,[NombreEmpresa]
				,[CodOficina]
				,[NTrabajador]
				,[Holding]
				,[Comentarios]
				,[FechaIngreso]
				,[EjecutivoIngreso])
				VALUES
				(
					'',
					@EmpresaRut,
					@EmpresaNombre,
					@CodSucursal,
					@NTrabajador,
					@EsHolding,
					@Comentarios,
					GETDATE(),
					@RutEjecutivoIngreso
				)


				INSERT INTO BD_HERRAMIENTAS.carteras.TabCart_CarteraEmpresas
				(RutEmpresa
				,NombreEmpresa
				,CodOficina
				,NTrabajador
				,Holding
				,EjecutivoIngreso
				,TipoEmpresa)
				VALUES(
					@EmpresaRut
				,@EmpresaNombre
				,@CodSucursal
				,@NTrabajador
				,@EsHolding
				,@RutEjecutivoIngreso
				,0)

				SELECT @identity = SCOPE_IDENTITY()

				/*INSERT INTO [carteras].[TabCart_AnexoEmpresa](
					RutEmpresa, 
					NombreEmpresa, 
					Anexo, 
					NumTrabajadores, 
					CodOficina, 
					IdComuna, 
					NombreComuna, 
					Direccion, 
					RutAgenteIngreso, 
					FechaCreacion, 
					EsMatriz)
				VALUES (
					@EmpresaRut,
					@EmpresaNombre,
					'MATRIZ',
					@NTrabajador,
					@CodSucursal,
					null,
					null,
					null,
					@RutEjecutivoIngreso,
					GETDATE(),
					1
				)*/

				
		END

	END

	SELECT @identity
END