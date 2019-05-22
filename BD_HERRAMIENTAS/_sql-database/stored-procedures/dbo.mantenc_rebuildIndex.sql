IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID('[dbo].[mantenc_rebuildIndex]') AND type = 'P')
DROP PROCEDURE [dbo].[mantenc_rebuildIndex]
GO
--exec BD_Herramientas.dbo.mantenc_rebuildIndex
CREATE proc [dbo].[mantenc_rebuildIndex]
as

DECLARE @STR VARCHAR(MAX)=''


SELECT @STR=@STR+
	  CASE
      WHEN FRAGMENTACION > 5 AND FRAGMENTACION <= 30 THEN 'ALTER INDEX ' + INDICE + ' ON '+DB+'.'+SCHEM+'.' + TABLA + ' REBUILD;'     
      WHEN FRAGMENTACION > 30 THEN ' ALTER INDEX ' + INDICE + ' ON '+DB+'.'+SCHEM+'.' + TABLA + ' REBUILD; '
      END           
FROM (
		SELECT 
		PS.AVG_FRAGMENTATION_IN_PERCENT FRAGMENTACION,
		IND.NAME INDICE, 
		DBS.name DB,
		SCH.name SCHEM,
		TAB.NAME TABLA
		FROM
		SYS.DM_DB_INDEX_PHYSICAL_STATS (DB_ID(), NULL, NULL, NULL, NULL) PS
		INNER JOIN SYS.DATABASES DBS
		ON PS.DATABASE_ID = DBS.DATABASE_ID
		INNER JOIN SYS.INDEXES IND
		ON PS.OBJECT_ID = IND.OBJECT_ID
		INNER JOIN SYS.TABLES TAB
		ON TAB.OBJECT_ID = IND.OBJECT_ID
		INNER Join SYS.schemas SCH
		ON TAB.schema_id=SCH.schema_id
		WHERE IND.NAME IS NOT NULL AND PS.INDEX_ID = IND.INDEX_ID
		AND PS.AVG_FRAGMENTATION_IN_PERCENT > 5

	) X
print(@STR)
exec(@STR)

 
 -------------------------------------
 
 Declare @db AS VARCHAR(50)	='Use master'
		-- ,@STR VARCHAR(MAX)=''
 
exec(@db)

set @db=''
 
Declare Cursor_de_Bases cursor for
 		
                Select name From sysdatabases  
				where  isnull(version,0) <>0 
				And name not in ('master','model','msdb','ReportServer','ReportServerTempDB','tempdb','GALVARINO')
 
Open Cursor_de_Bases 
Fetch next from Cursor_de_Bases into @db
While @@FETCH_STATUS = 0 
Begin
                Print 'Inicio '+ @db
                
                Exec('Use '+ @db)
                
                SELECT @STR=@STR+
					  CASE
					  WHEN FRAGMENTACION > 5 AND FRAGMENTACION <= 30 THEN 'ALTER INDEX ' + INDICE + ' ON '+DB+'.'+SCHEM+'.' + TABLA + ' REBUILD;'     
					  WHEN FRAGMENTACION > 30 THEN ' ALTER INDEX ' + INDICE + ' ON '+DB+'.'+SCHEM+'.' + TABLA + ' REBUILD; '
					  END           
				FROM (
						SELECT 
						PS.AVG_FRAGMENTATION_IN_PERCENT FRAGMENTACION,
						IND.NAME INDICE, 
						DBS.name DB,
						SCH.name SCHEM,
						TAB.NAME TABLA
						FROM
						SYS.DM_DB_INDEX_PHYSICAL_STATS (DB_ID(), NULL, NULL, NULL, NULL) PS
						INNER JOIN SYS.DATABASES DBS
						ON PS.DATABASE_ID = DBS.DATABASE_ID
						INNER JOIN SYS.INDEXES IND
						ON PS.OBJECT_ID = IND.OBJECT_ID
						INNER JOIN SYS.TABLES TAB
						ON TAB.OBJECT_ID = IND.OBJECT_ID
						INNER Join SYS.schemas SCH
						ON TAB.schema_id=SCH.schema_id
						WHERE IND.NAME IS NOT NULL AND PS.INDEX_ID = IND.INDEX_ID
						AND PS.AVG_FRAGMENTATION_IN_PERCENT > 5
					) X

				Exec(@STR)                
                print(@STR)

                Print 'Fin '+ @db
 
Fetch next from Cursor_de_Bases into @db
End

CLOSE Cursor_de_Bases
DEALLOCATE Cursor_de_Bases