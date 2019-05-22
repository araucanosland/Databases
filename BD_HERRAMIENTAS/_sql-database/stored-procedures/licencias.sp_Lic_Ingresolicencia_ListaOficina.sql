IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[licencias].[sp_Lic_Ingresolicencia_ListaOficina]') AND type = 'P')
DROP PROCEDURE [licencias].[sp_Lic_Ingresolicencia_ListaOficina]
GO
CREATE procedure [licencias].[sp_Lic_Ingresolicencia_ListaOficina]
as

Select   

		Cod_Oficina
		,Oficina
		 From dbo.TabMotor_Oficinas 
		order by Cod_Oficina


		 --Case 
		 --when Cod_Oficina=24	then 21
		 --when Cod_Oficina=32	then 31
		 --when Cod_Oficina=59	then 54
		 --when Cod_Oficina=3		then 61
		 --when Cod_Oficina=121	then 122
		 --when Cod_Oficina=88	then 82
		 --when Cod_Oficina=85	then 82
		 --when Cod_Oficina=106	then 101
		 --when Cod_Oficina=109	then 103
		 --when Cod_Oficina=105	then 103
		 --when Cod_Oficina=108	then 104
		 --Else
		 --Cod_Oficina
		 --end