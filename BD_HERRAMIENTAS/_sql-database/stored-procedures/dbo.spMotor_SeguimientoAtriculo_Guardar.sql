IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[spMotor_SeguimientoAtriculo_Guardar]') AND type = 'P')
DROP PROCEDURE [dbo].[spMotor_SeguimientoAtriculo_Guardar]
GO
CREATE PROCEDURE [dbo].[spMotor_SeguimientoAtriculo_Guardar]
(
@NombreArticulo VARCHAR(255),
@token varchar(50),
@Estado varchar(50),
@Comentarios varchar(255) = ''
)
AS
BEGIN
  
 declare @Oficina int = security.fnSca_ObtenerOficinaByToken(@token)

 INSERT INTO dbo.TabMotor_SeguimientoArticulos (Nombre, Oficina, FechaRegistro, EstadoArticulo, Comentarios) 
	VALUES (@NombreArticulo, @Oficina, GETDATE(), @Estado, @Comentarios)
	

END