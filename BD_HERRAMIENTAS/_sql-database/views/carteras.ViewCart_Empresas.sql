IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[carteras].[ViewCart_Empresas]') AND type = 'V')
DROP VIEW [carteras].[ViewCart_Empresas]
GO
CREATE VIEW [carteras].[ViewCart_Empresas] AS 
SELECT UPPER(NombreEmpresa) NombreEmpresa, RutEmpresa+'-'+DvEmpresa RutCompuesto, UPPER(NombreHolding) NombreHolding, RutEmpresa, DvEmpresa
FROM [carteras].[TabCart_Empresas]