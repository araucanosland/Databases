IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[generales].[NombreAfiliadoByRut]') AND type = 'FN')
DROP FUNCTION [generales].[NombreAfiliadoByRut]
GO
CREATE FUNCTION [generales].[NombreAfiliadoByRut]
(
    @rut VARCHAR(max)
)
RETURNS VARCHAR(max)
AS
BEGIN

DECLARE @lstCadena varchar(max)
DECLARE @lstDato varchar(15)
DECLARE @lnuPosComa int
DECLARE @lista VARCHAR(max)
SET @lista = ''

SET @lstCadena = @rut


		WHILE  LEN(@lstCadena)> 0
		BEGIN
			SET @lnuPosComa = CHARINDEX(',', @lstCadena )
			IF ( @lnuPosComa=0 )
			BEGIN
				SET @lstDato = @lstCadena
				SET @lstCadena = ''
			END
			ELSE
			BEGIN
				SET @lstDato = Substring( @lstCadena , 1  , @lnuPosComa-1)
				SET @lstCadena = Substring( @lstCadena , @lnuPosComa + 1 , LEN(@lstCadena))
			END
			set @lista = @lista + (select top 1 Nombres + ' '+ Apellidos as nombres from mae.Afiliados 
			where convert(varchar, RutAfiliado) + '-' + DvAfiliado in (@lstDato)) + ','
			 

END  
    
RETURN @lista
END