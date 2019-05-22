IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[scafi].[spMotor_ContactibilidadListarRut]') AND type = 'P')
DROP PROCEDURE [scafi].[spMotor_ContactibilidadListarRut]
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [scafi].[spMotor_ContactibilidadListarRut]
	-- Add the parameters for the stored procedure here
	@RutAfiliado int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT A.RutAfiliado
      ,A.iTipoDato
      ,A.TipoDato
      ,A.iClasifDato
      ,A.ClasifDato
      ,A.ValorDato
      ,A.FechaCreacion
      ,A.OrigenCreacion
      ,A.FechaIntento
      ,A.ResultIntento
      ,A.OrigenIntento
      ,A.FechaContacto
      ,A.OrigenContacto
      ,A.FechaBaja
      ,ISNULL(A.OrigenBaja,'') OrigenBaja
      ,ISNULL(A.MotivoBaja,'') MotivoBaja
      ,A.RutEjecGestion
      ,A.Oficina
      ,A.IndiceContactab
      ,A.Ocultar
	  ,B.IndiceContac PorcIndice
	  ,B.Descripcion Descripcion
  FROM scafi.TabMotor_Contactibilidad A
  LEFT JOIN scafi.TabMotor_EstadoContactabilidad B
  ON A.IndiceContactab=B.IdEstado
  where RutAfiliado=@RutAfiliado--10000000--16577273
  order by B.IndiceContac desc
		   
	
END