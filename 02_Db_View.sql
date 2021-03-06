USE [DbHelpDesk]
GO
/****** Object:  View [dbo].[vClienteByReceptor]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[vClienteByReceptor]
as
SELECT DISTINCT 
	ltrim(lngID) as CodigoOYD, 
	strUsuarioApp AS Usuario 
FROM dboyd.DBO.TBLCLIENTES C WITH(NOLOCK)
INNER JOIN  dboyd.DBO.TBLCLIENTESRECEPTORES CR WITH(NOLOCK) ON CR.LNGIDCOMITENTE  = C.LNGID
INNER JOIN dboyd.DBO.TBLUSUARIOSSUCURSALES S WITH(NOLOCK) ON S.STRIDRECEPTOR = CR.STRIDRECEPTOR




GO
/****** Object:  View [dbo].[vOyDClientes]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vOyDClientes]
AS
SELECT     RTRIM(LTRIM(CL.lngID)) AS CodigoOyD, RTRIM(LTRIM(CL.strNombre)) AS NombreCliente, RTRIM(LTRIM(CL.strNroDocumento)) AS NroDocumento, 
                      RTRIM(LTRIM(CR.strIDReceptor)) AS IdReceptor
FROM         dboyd.dbo.tblClientes AS CL INNER JOIN
                          (SELECT     lngIDComisionista, lngIDSucComisionista, lngIDComitente, strIDReceptor, logLider, dtmActualizacion, strUsuario
                            FROM          dboyd.dbo.tblClientesReceptores WITH (NOLOCK)
                            WHERE      (logLider = 1)) AS CR ON CR.lngIDComitente = CL.lngID INNER JOIN
                      dboyd.dbo.tblReceptores AS S WITH (NOLOCK) ON S.strID = CR.strIDReceptor

GO
/****** Object:  View [dbo].[vOYDtblCliente]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vOYDtblCliente]
AS
SELECT DISTINCT 
                      LTRIM(lngID) AS CodigoOYD, LTRIM(strNombre1) + ' ' + LTRIM(ISNULL(strNombre2, '')) AS NombreCliente, LTRIM(strApellido1) + ' ' + LTRIM(ISNULL(strApellido2, '')) 
                      AS ApellidoCliente
FROM         dboyd.dbo.tblClientes AS C WITH (NOLOCK)

GO
/****** Object:  View [dbo].[vReporteByEstado]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vReporteByEstado]
as
SELECT S.RESPONSABLE AS Responsable, COUNT(0) AS Cantidad, E.NOMBRE ESTADO  
      FROM DBO.TBSEGUIMIENTO_SOLICITUD S WITH(NOLOCK)
      INNER JOIN DBO.TBSEGUIMIENTO_ESTADOSOLICITUD E WITH(NOLOCK) ON S.ESTADO = E.IDSOL
--WHERE FECHACREACION >= '2010-08-30' AND FECHACREACION <= '2010-10-25'
GROUP BY  E.NOMBRE,S.RESPONSABLE


GO
/****** Object:  View [Operaciones].[vCarterasColectivas]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [Operaciones].[vCarterasColectivas]
AS
SELECT TOP 1 '-1' AS vchCodigoPortafolio,'   ' AS vchDescripcion 
from dbSafyr.dbo.tblPropietarios  union all  
select P.vchCodigoPortafolio,vchDescripcion from dbSafyr.dbo.tblPropietarios  P
 where vchtipoPOrtafolio='FD' 
 AND chrEstado='A'

--INNER JOIN  (SELECT MAX(DatFechaAct) AS FechaUltimoCierre, vchCodigoPortafolio FROM  dbSafyr2.dbo.tblHistoricoUnidad 
--GROUP BY vchCodigoPortafolio) H ON P.vchCodigoPortafolio = H.vchCodigoPortafolio AND  FechaUltimoCierre >=  GETDATE()-10
--WHERE vchCodEmpresa='CBOLSA'    AND chrEstado = 'A'  








GO
/****** Object:  View [Operaciones].[vCarterasColectivasCierre]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Operaciones].[vCarterasColectivasCierre]
AS
SELECT MAX(DatFechaAct) AS FechaUltimoCierre, vchCodigoPortafolio FROM  dbSafyr.dbo.tblHistoricoUnidad 
GROUP BY vchCodigoPortafolio

GO
/****** Object:  View [Operaciones].[vCarterasColectivasClientes]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Operaciones].[vCarterasColectivasClientes]
AS
SELECT top 1500 s.intCodSuscriptor, CASE s.chrTipo WHEN 'N' THEN LTRIM(s.vchApellido1) + ' ' + 
(CASE WHEN s.vchApellido2 IS NOT NULL THEN LTRIM(s.vchApellido2) + ' ' ELSE '' END) + LTRIM(s.vchNombre1) + ' ' + 
(CASE WHEN s.vchNombre2 IS NOT NULL THEN LTRIM(s.vchNombre2) ELSE '' END) 
ELSE s.vchRazonSocial END AS vchNombre, s.vchDocId  FROM dbSafyr.dbo.tblSuscriptores s 
WHERE 1=1  
ORDER BY CASE s.chrTipo WHEN 'N' THEN LTRIM(s.vchApellido1) + ' ' + (CASE WHEN s.vchApellido2 IS NOT NULL
THEN LTRIM(s.vchApellido2) + ' ' ELSE '' END) + LTRIM(s.vchNombre1) + ' ' +
(CASE WHEN s.vchNombre2 IS NOT NULL THEN LTRIM(s.vchNombre2) ELSE '' END)  ELSE s.vchRazonSocial END 


GO
/****** Object:  View [Operaciones].[vCarterasEncargos]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [Operaciones].[vCarterasEncargos]
as
SELECT INTENCARGO,DATFECHA,NUMVALORPESOS,NUMUNIDADES,t.VCHCODCOMISIONISTA, t.INTCODSUSCRIPTOR, VCHCODIGOPORTAFOLIO, VCHCODIGOMIGRACION
FROM dbSafyr.dbo.TBLENCARGOS t
INNER JOIN DBSAFYR.DBO.TBLSUSCRIPTORES S ON T.INTCODSUSCRIPTOR=S.INTCODSUSCRIPTOR

GO
/****** Object:  View [Operaciones].[vClientesByCarterasColectivas]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Operaciones].[vClientesByCarterasColectivas]
AS
SELECT DISTINCT TOP 2000 vchCodigoPortafolio, s.intCodSuscriptor, 
CASE s.chrTipo WHEN 'N' THEN LTRIM(s.vchApellido1) + ' ' + 
(CASE WHEN s.vchApellido2 IS NOT NULL THEN LTRIM(s.vchApellido2) + ' ' ELSE '' END) + LTRIM(s.vchNombre1) + ' ' +
(CASE WHEN s.vchNombre2 IS NOT NULL THEN LTRIM(s.vchNombre2) ELSE '' END)  ELSE s.vchRazonSocial END AS vchNombre, s.vchDocId
FROM dbSafyr.dbo.tblSuscriptores s, dbSafyr.dbo.tblEncargos e 
WHERE e.intCodSuscriptor = s.intCodSuscriptor


GO
/****** Object:  View [Operaciones].[vClientesCorreo]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Operaciones].[vClientesCorreo]
as
SELECT TBLSUSCRIPTORES.VCHDOCID as identificacion , 
ISNULL(tblclientes.strEMail,'') AS CORREO , tblclientes.strEnviarInformeEconomico 
FROM dbsafyr.dbo.TBLSUSCRIPTORES
inner join dboyd.dbo.tblclientes on 
TBLSUSCRIPTORES.VCHDOCID =
CASE tblclientes.STRTIPOIDENTIFICACION 
WHEN 'N' THEN CAST( SUBSTRING(tblclientes.STRNRODOCUMENTO, 1, 9) AS VARCHAR(9)) 
WHEN 'R' THEN CAST( SUBSTRING(tblclientes.STRNRODOCUMENTO, 1, 9) AS VARCHAR(9))
ELSE tblclientes.STRNRODOCUMENTO COLLATE SQL_Latin1_General_CP1_CI_AS END
WHERE tblclientes.strEnviarInformeEconomico = '1'

GO
/****** Object:  View [Operaciones].[vDatosDefensor]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [Operaciones].[vDatosDefensor]
AS
SELECT dc.vchNombre, CASE WHEN ISNULL(dc.vchExtension,0) = 0 
THEN dc.vchDireccion + ' - Tel. ' + dc.vchTelefono + ' - Fax ' +  vchFax + ' ' + c.vchNombre 
ELSE dc.vchDireccion + ' - tel. ' + dc.vchTelefono + ' ext. '  + dc.vchExtension + ' - Fax ' +  vchFax + ' ' + c.vchNombre 
END AS vchContacto,    dc.vchEmail as   vchEmailDfensor
FROM dbSafyr.dbo.tblDefensorCliente dc INNER JOIN dbSafyr.dbo.tblCiudades c ON dc.intCiudad = c.intCiudad 
WHERE vchCodEmpresa ='CBOLSA' 




GO
/****** Object:  View [Operaciones].[viewDetalleMovimientoExtracto]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [Operaciones].[viewDetalleMovimientoExtracto] AS
SELECT dpm.vchCodigoPortafolio, dpm.intEncargo, 
  (CASE dpm.vchCodTipoMovimiento WHEN 'AP' THEN (CASE WHEN (SELECT ISNULL(bitR, 0) FROM dbSafyr.dbo.tblEncargos WHERE vchCodigoPortafolio = dpm.vchCodigoPortafolio AND intEncargo = dpm.intEncargo AND chrEstado <> 'A') = 1 AND (SELECT ISNULL(COUNT(ep2.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep2 WHERE ep2.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep2.intEncargoHijo = dpm.intEncargo AND ep2.vchTipoOperacion IN ('FR', 'ED') AND ep2.chrEstado = 'P') = 0 THEN dpm.datFecha 
		WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'FR' AND ep.chrEstado = 'P') > 0 THEN (SELECT TOP 1 ep1.datFechaOperacion FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.vchTipoOperacion IN ('FR') AND ep1.chrEstado = 'P' AND ep1.intEncargoHijo = dpm.intEncargo) 
		WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'ED' AND ep.chrEstado = 'P') > 0 THEN (SELECT TOP 1 ep1.datFechaOperacion FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.vchTipoOperacion IN ('ED') AND ep1.chrEstado = 'P' AND ep1.intEncargoHijo = dpm.intEncargo) 
		ELSE dpm.datFecha END) 
   ELSE dpm.datFecha END) AS datFecha, 
  (CASE dpm.vchCodTipoMovimiento 
		WHEN 'AP' THEN (CASE WHEN (SELECT ISNULL(bitR, 0) FROM dbSafyr.dbo.tblEncargos WHERE vchCodigoPortafolio = dpm.vchCodigoPortafolio AND intEncargo = dpm.intEncargo AND chrEstado <> 'A') = 1 AND (SELECT ISNULL(COUNT(ep2.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep2 WHERE ep2.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep2.intEncargoHijo = dpm.intEncargo AND ep2.vchTipoOperacion IN ('FR', 'ED') AND ep2.chrEstado = 'P') = 0 THEN 'Renovación' 
						WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'FR' AND ep.chrEstado = 'P') > 0 THEN 'Fraccionamiento' 
						WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'ED' AND ep.chrEstado = 'P') > 0 THEN 'Compra de Unidades' 
						ELSE 'Apertura' END) 
        WHEN 'AD' THEN 'Adición' 
		WHEN 'NC' THEN 'Nota Crédito' 
		WHEN 'RT' THEN 'Retiro' 
		WHEN 'RTI' THEN 'Imp. Ret.' 
		WHEN 'CA' THEN 'Cancelación ' 
		WHEN 'CAI' THEN 'Imp. Canc.' 
		WHEN 'CHD' THEN 'Cheque Devuelto' 
		WHEN 'ND' THEN 'Nota Débito' 
		WHEN 'RP' THEN 'Penalización' END) 
	+ 
	(CASE WHEN (SELECT ISNULL(bitR, 0) FROM dbSafyr.dbo.tblEncargos WHERE vchCodigoPortafolio = dpm.vchCodigoPortafolio AND intEncargo = dpm.intEncargo) = 1 THEN '' 
		  WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'FR' AND ep.chrEstado = 'P') > 0 THEN '' 
		  WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'ED' AND ep.chrEstado = 'P') > 0 THEN '' 
		  ELSE ' - ' + fp.vchDescripcion END) AS Operacion, 
   CASE dpm.vchCodTipoMovimiento 
		WHEN 'AP' THEN (CASE WHEN (SELECT ISNULL(bitR, 0) FROM dbSafyr.dbo.tblEncargos WHERE vchCodigoPortafolio = dpm.vchCodigoPortafolio AND intEncargo = dpm.intEncargo AND chrEstado <> 'A') = 1 AND (SELECT ISNULL(COUNT(ep2.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep2 WHERE ep2.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep2.intEncargoHijo = dpm.intEncargo AND ep2.vchTipoOperacion IN ('FR', 'ED') AND ep2.chrEstado = 'P') = 0 THEN isnull(dpm.numValor, 0) 
						WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'FR' AND ep.chrEstado = 'P') > 0 THEN (SELECT ep1.numValorPesosHijo FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.intEncargoHijo = dpm.intEncargo) 
						WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'ED' AND ep.chrEstado = 'P') > 0 THEN (SELECT ep1.numValorPesosHijo FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.intEncargoHijo = dpm.intEncargo) 
						ELSE isnull(dpm.numValor, 0) END) 
        WHEN 'AD' THEN isnull(dpm.numValor, 0) 
		WHEN 'NC' THEN isnull(dpm.numValor, 0) 
		WHEN 'RT' THEN 0 
		WHEN 'RTI' THEN 0 
		WHEN 'CA' THEN 0 
		WHEN 'CAI' THEN 0 
		WHEN 'CHD' THEN 0 
		WHEN 'RP' THEN 0 
		WHEN 'ND' THEN 0 END AS Credito,
	CASE dpm.vchCodTipoMovimiento 
		WHEN 'RT' THEN isnull(dpm.numValor, 0) 
		WHEN 'RTI' THEN isnull(dpm.numValor, 0) 
		WHEN 'CA' THEN isnull(dpm.numValor, 0) 
		WHEN 'CAI' THEN isnull(dpm.numValor, 0) 
		WHEN 'CHD' THEN isnull(dpm.numValor, 0) 
		WHEN 'RP' THEN isnull(dpm.numValor, 0) 
		WHEN 'ND' THEN isnull(dpm.numValor, 0) 
		WHEN 'AP' THEN 0 
		WHEN 'AD' THEN 0 
		WHEN 'NC' THEN 0 END AS Debito, 
	(CASE dpm.vchCodTipoMovimiento WHEN 'AP' THEN (CASE WHEN (SELECT ISNULL(bitR, 0) FROM dbSafyr.dbo.tblEncargos WHERE vchCodigoPortafolio = dpm.vchCodigoPortafolio AND intEncargo = dpm.intEncargo AND chrEstado <> 'A') = 1 AND (SELECT ISNULL(COUNT(ep2.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep2 WHERE ep2.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep2.intEncargoHijo = dpm.intEncargo AND ep2.vchTipoOperacion IN ('FR', 'ED') AND ep2.chrEstado = 'P') = 0 THEN ISNULL(dpm.numValor, 0) / ISNULL((SELECT hu1.numValorUnidad FROM dbSafyr.dbo.tblHistoricoUnidad hu1 WHERE hu1.vchCodigoPortafolio = hu.vchCodigoPortafolio AND hu1.datFechaAct = DATEADD(DAY,-1,hu.datFechaAct)),0) --hu.numValorUnidad
		  WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'FR' AND ep.chrEstado = 'P') > 0 THEN ISNULL((SELECT ep1.numValorPesosHijo FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.intEncargoHijo = dpm.intEncargo),0) / (SELECT hu5.numValorUnidad FROM dbSafyr.dbo.TblHistoricoUnidad hu5 WHERE hu5.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND hu5.datFechaAct = (SELECT TOP 1 ep1.datFechaOperacion FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.vchTipoOperacion IN ('FR') AND ep1.chrEstado = 'P' AND ep1.intEncargoHijo = dpm.intEncargo)) 
		  WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'ED' AND ep.chrEstado = 'P') > 0 THEN ISNULL((SELECT ep1.numValorPesosHijo FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.intEncargoHijo = dpm.intEncargo),0) / (SELECT hu5.numValorUnidad FROM dbSafyr.dbo.TblHistoricoUnidad hu5 WHERE hu5.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND hu5.datFechaAct = (SELECT TOP 1 ep1.datFechaOperacion FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.vchTipoOperacion IN ('ED') AND ep1.chrEstado = 'P' AND ep1.intEncargoHijo = dpm.intEncargo)) 
		  ELSE ISNULL(dpm.numValor, 0) / hu.numValorUnidad END) 
    ELSE ISNULL(dpm.numValor, 0) / hu.numValorUnidad END) AS Unidades, 
	(CASE dpm.vchCodTipoMovimiento WHEN 'AP' THEN (CASE WHEN (SELECT ISNULL(bitR, 0) FROM dbSafyr.dbo.tblEncargos WHERE vchCodigoPortafolio = dpm.vchCodigoPortafolio AND intEncargo = dpm.intEncargo AND chrEstado <> 'A') = 1 AND (SELECT ISNULL(COUNT(ep2.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep2 WHERE ep2.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep2.intEncargoHijo = dpm.intEncargo AND ep2.vchTipoOperacion IN ('FR', 'ED') AND ep2.chrEstado = 'P') = 0 THEN ISNULL((SELECT hu1.numValorUnidad FROM dbSafyr.dbo.tblHistoricoUnidad hu1 WHERE hu1.vchCodigoPortafolio = hu.vchCodigoPortafolio AND hu1.datFechaAct = DATEADD(DAY,-1,hu.datFechaAct)),0)  --dbSafyr.dbo.TblHistoricoUnidad.numValorUnidad
		  WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'FR' AND ep.chrEstado = 'P') > 0 THEN (SELECT hu5.numValorUnidad FROM dbSafyr.dbo.TblHistoricoUnidad hu5 WHERE hu5.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND hu5.datFechaAct = (SELECT TOP 1 ep1.datFechaOperacion FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.vchTipoOperacion IN ('FR') AND ep1.chrEstado = 'P' AND ep1.intEncargoHijo = dpm.intEncargo)) 
		  WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'ED' AND ep.chrEstado = 'P') > 0 THEN (SELECT hu5.numValorUnidad FROM dbSafyr.dbo.TblHistoricoUnidad hu5 WHERE hu5.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND hu5.datFechaAct = (SELECT TOP 1 ep1.datFechaOperacion FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.vchTipoOperacion IN ('ED') AND ep1.chrEstado = 'P' AND ep1.intEncargoHijo = dpm.intEncargo)) 
		  ELSE hu.numValorUnidad END) 
    ELSE hu.numValorUnidad END) AS numValorUnidad,  
	CASE WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'FR') > 0 THEN (SELECT ep1.numValorPesosHijo FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.intEncargoHijo = dpm.intEncargo) 
		 WHEN (SELECT ISNULL(COUNT(ep.intConsecutivo), 0) FROM dbSafyr.dbo.tblEncargosParentesco ep WHERE ep.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep.intEncargoHijo = dpm.intEncargo AND ep.vchTipoOperacion = 'ED') > 0 THEN (SELECT ep1.numValorPesosHijo FROM dbSafyr.dbo.tblEncargosParentesco ep1 WHERE ep1.vchCodigoPortafolio = dpm.vchCodigoPortafolio AND ep1.intEncargoHijo = dpm.intEncargo) 
		 ELSE (CASE WHEN ISNULL(se.NumValorPesos, 0) = 0 AND dpm.vchCodTipoMovimiento = 'AP' THEN dpm.numValor ELSE ISNULL(se.NumValorPesos, 0) END) END AS Saldo
FROM  dbSafyr.dbo.tblDetallePagosMovimientos dpm 
	LEFT JOIN dbSafyr.dbo.TblSaldosEncargos se ON dpm.vchCodigoPortafolio = se.vchCodigoPortafolio 
	AND dpm.intEncargo = se.intEncargo 
	AND dpm.datFecha = se.DatFecha
	INNER JOIN dbSafyr.dbo.tblMovimientos m ON dpm.vchCodigoPortafolio = m.vchCodigoPortafolio 
	AND  dpm.intEncargo = m.intEncargo 
	AND  dpm.intMovimiento = m.intMovimiento 
	AND dpm.datFecha = m.datFecha
	LEFT JOIN dbSafyr.dbo.tblConceptosNotas cn ON m.intNota = cn.intConsecutivo
	INNER JOIN dbSafyr.dbo.TblHistoricoUnidad hu ON  dpm.vchCodigoPortafolio = hu.vchCodigoPortafolio 
    AND  dpm.datFecha = hu.datFechaAct 
	INNER JOIN dbSafyr.dbo.tblFormasPago fp ON dpm.vchCodPago = fp.vchCodigo 
WHERE (dpm.vchCodTipoMovimiento NOT IN ('UTX', 'RFX')) 
	AND (dpm.chrEstado = 'C')  

UNION ALL
SELECT mhe.vchCodigoPortafolio, 
	mhe.intEncargo, 
	mhe.datFecha, 
	(CASE mhe.vchCodTipoMovimiento 
		WHEN 'AP' THEN 'Apertura' 
		WHEN 'AD' THEN 'Adición' 
		WHEN 'NC' THEN 'Nota Crédito' 
		WHEN 'RT' THEN 'Retiro' 
		WHEN 'RTI' THEN 'Imp. Ret.' 
		WHEN 'CA' THEN 'Cancelación ' 
		WHEN 'CAI' THEN 'Imp. Canc.' 
		WHEN 'CHD' THEN 'Cheque Devuelto' 
		WHEN 'ND' THEN 'Nota Débito' 
		WHEN 'RP' THEN 'Penalización' END) AS Operacion, 
	CASE mhe.vchCodTipoMovimiento 
		WHEN 'AP' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'AD' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'NC' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'RT' THEN 0 
		WHEN 'RTI' THEN 0 
		WHEN 'CA' THEN 0 
		WHEN 'CAI' THEN 0 
		WHEN 'CHD' THEN 0 
		WHEN 'RP' THEN 0 
		WHEN 'ND' THEN 0 END AS Credito,
	CASE mhe.vchCodTipoMovimiento 
		WHEN 'RT' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'RTI' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'CA' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'CAI' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'CHD' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'RP' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'ND' THEN isnull(mhe.numValorPesos, 0) 
		WHEN 'AP' THEN 0 
		WHEN 'AD' THEN 0 
		WHEN 'NC' THEN 0 END AS Debito, 
	ISNULL(mhe.numValorPesos, 0) / hu.numValorUnidad AS Unidades, 
	hu.numValorUnidad, 
	se.NumValorPesos AS Saldo
FROM dbSafyr.dbo.TblMvtoHistoricoEncargos mhe, dbSafyr.dbo.TblHistoricoUnidad hu, dbSafyr.dbo.TblSaldosEncargos se
WHERE mhe.vchCodigoPortafolio = hu.vchCodigoPortafolio AND 
  mhe.datFecha = hu.datFechaAct AND 
  mhe.vchCodigoPortafolio = se.vchCodigoPortafolio AND 
  mhe.intEncargo = se.intEncargo AND 
  mhe.datFecha = se.DatFecha AND 
  (mhe.chrEstado = 'C') AND 
  (mhe.vchCodTipoMovimiento NOT IN ('UT', 'UTX', 'RF', 'RFX')) AND 
  (mhe.vchCodTipoMovimiento <> 'AP')

UNION ALL
SELECT vchCodigoPortafolio, 
	intEncargo, 
	datFecha, 
	Operacion, 
	Credito, 
	Debito, 
	Unidades, 
	numValorUnidad, 
	Saldo
FROM dbSafyr.dbo.viewDetalleOperacionesTitulosPasivos

UNION ALL
SELECT e.vchCodigoPortafolio, 
	e.intEncargoPadreRenovacion intEncargo,
	(SELECT e1.datFecha FROM dbSafyr.dbo.tblEncargos e1 WHERE e1.intEncargo = MAX(e.intEncargo) AND e1.vchCodigoPortafolio = e.vchCodigoPortafolio) datFecha, 
	'Renovación' Operacion,
	0 Credito,
	(SELECT m1.numValorPesos FROM dbSafyr.dbo.tblMovimientos m1 WHERE m1.vchCodigoPortafolio = e.vchCodigoPortafolio AND m1.intEncargo = MAX(e.intEncargo) AND m1.vchCodTipoMovimiento = 'AP') Debito, 
	(SELECT m1.numUnidades FROM dbSafyr.dbo.tblMovimientos m1 WHERE m1.vchCodigoPortafolio = e.vchCodigoPortafolio AND m1.intEncargo = MAX(e.intEncargo) AND m1.vchCodTipoMovimiento = 'AP') Unidades,
	(SELECT hu.numValorUnidad FROM dbSafyr.dbo.TblHistoricoUnidad hu WHERE hu.vchCodigoPortafolio = e.vchCodigoPortafolio AND hu.datFechaAct = (SELECT e1.datFecha FROM dbSafyr.dbo.tblEncargos e1 WHERE e1.intEncargo = MAX(e.intEncargo) AND e1.vchCodigoPortafolio = e.vchCodigoPortafolio)) numValorUnidad,
	0 Saldo
FROM dbSafyr.dbo.tblEncargos e 
WHERE e.intEncargo NOT IN (SELECT ep.intEncargoHijo 
						   FROM dbSafyr.dbo.tblEncargosParentesco ep 
						   WHERE ep.vchCodigoPortafolio = e.vchCodigoPortafolio AND ep.chrEstado = 'P') 
	AND e.bitR = 1
	AND e.intEncargoPadreRenovacion <> 0
	AND e.chrEstado <> 'A'
GROUP BY e.vchCodigoPortafolio,e.intEncargoPadreRenovacion 



GO
/****** Object:  View [Operaciones].[vRevisoriaFondo]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Operaciones].[vRevisoriaFondo] 
AS
SELECT TOP 1 vchNombre, vchEmail,vchTelefono  FROM dbSafyr.dbo.tblRevisoriaFondo 

GO
/****** Object:  View [Operaciones].[vtblEncargos]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Operaciones].[vtblEncargos]
AS
SELECT * FROM dbSafyr.dbo.tblEncargos


GO
/****** Object:  View [Operaciones].[vtblHistoricoUnidad]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Operaciones].[vtblHistoricoUnidad]
as
SELECT * FROM dbSafyr.dbo.tblHistoricoUnidad


GO
/****** Object:  View [Operaciones].[vtblSaldosEncargos]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Operaciones].[vtblSaldosEncargos]
AS
SELECT * FROM dbSafyr.dbo.tblSaldosEncargos


GO
/****** Object:  View [Operaciones].[vviewEncabezadoExtracto]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Operaciones].[vviewEncabezadoExtracto]
AS
SELECT * FROM dbSafyr.dbo.viewEncabezadoExtracto


GO
/****** Object:  View [Riesgos].[Vw_HistoricoCartera]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Riesgos].[Vw_HistoricoCartera]
AS
SELECT     Riesgos.valoresHistoricosCartera.ID, Riesgos.valoresHistoricosCartera.idCartera, Riesgos.CarterasColectivas.NombreCartera, 
                      Riesgos.valoresHistoricosCartera.fechaHistorico, Riesgos.valoresHistoricosCartera.valorTotalCartera, Riesgos.valoresHistoricosCartera.valorTotalCarteraAnterior, 
                      Riesgos.valoresHistoricosCartera.valorNetoCartera, Riesgos.valoresHistoricosCartera.valorCompras, Riesgos.valoresHistoricosCartera.valorVentas, 
                      Riesgos.valoresHistoricosCartera.valorSimultaneasActivas, Riesgos.valoresHistoricosCartera.valorCupones, Riesgos.valoresHistoricosCartera.disponible, 
                      Riesgos.valoresHistoricosCartera.valorIngresos, Riesgos.valoresHistoricosCartera.valorEgresos, Riesgos.valoresHistoricosCartera.valorSumatoriaPortafolioHaircut, 
                      Riesgos.valoresHistoricosCartera.varianza, Riesgos.valoresHistoricosCartera.desviacionEstandar, Riesgos.valoresHistoricosCartera.LAR95, 
                      Riesgos.valoresHistoricosCartera.LAR99, Riesgos.valoresHistoricosCartera.valorRepos
FROM         Riesgos.valoresHistoricosCartera INNER JOIN
                      Riesgos.CarterasColectivas ON Riesgos.valoresHistoricosCartera.idCartera = Riesgos.CarterasColectivas.Id
GO
/****** Object:  View [Riesgos].[Vw_IrlDetalleHistorico]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Riesgos].[Vw_IrlDetalleHistorico]
AS
SELECT     Riesgos.irlHistorico.idCartera, Riesgos.CarterasColectivas.NombreCartera, Riesgos.irlHistorico.fechaCalculoIRL, Riesgos.irlHistorico.IRL, Riesgos.irlHistorico.ALM, 
                      Riesgos.irlHistorico.RLN, Riesgos.irlHistorico.FNVC, Riesgos.irlHistorico.rendimiento, Riesgos.irlHistorico.FNVNC, 
                      Riesgos.valoresHistoricosCartera.valorTotalCartera, Riesgos.valoresHistoricosCartera.valorTotalCarteraAnterior, Riesgos.valoresHistoricosCartera.valorNetoCartera, 
                      Riesgos.valoresHistoricosCartera.valorCompras, Riesgos.valoresHistoricosCartera.valorVentas, Riesgos.valoresHistoricosCartera.valorSimultaneasActivas, 
                      Riesgos.valoresHistoricosCartera.valorSimultaneasPasivas, Riesgos.valoresHistoricosCartera.valorCupones, Riesgos.valoresHistoricosCartera.valorRedenciones, 
                      Riesgos.valoresHistoricosCartera.disponible, Riesgos.valoresHistoricosCartera.valorIngresos, Riesgos.valoresHistoricosCartera.valorEgresos, 
                      Riesgos.valoresHistoricosCartera.valorSumatoriaPortafolioHaircut, Riesgos.valoresHistoricosCartera.varianza, 
                      Riesgos.valoresHistoricosCartera.desviacionEstandar, Riesgos.valoresHistoricosCartera.LAR95, Riesgos.valoresHistoricosCartera.LAR99, 
                      Riesgos.valoresHistoricosCartera.valorRepos
FROM         Riesgos.irlHistorico INNER JOIN
                      Riesgos.valoresHistoricosCartera ON Riesgos.irlHistorico.idCartera = Riesgos.valoresHistoricosCartera.idCartera AND 
                      Riesgos.irlHistorico.fechaCalculoIRL = Riesgos.valoresHistoricosCartera.fechaHistorico INNER JOIN
                      Riesgos.CarterasColectivas ON Riesgos.valoresHistoricosCartera.idCartera = Riesgos.CarterasColectivas.Id
GO
/****** Object:  View [Riesgos].[Vw_IrlHistorico]    Script Date: 11/25/2020 9:04:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Riesgos].[Vw_IrlHistorico]
AS
SELECT     Riesgos.irlHistorico.idCartera, Riesgos.CarterasColectivas.NombreCartera, Riesgos.irlHistorico.fechaCalculoIRL, Riesgos.irlHistorico.IRL, Riesgos.irlHistorico.ALM, 
                      Riesgos.irlHistorico.RLN, Riesgos.irlHistorico.FNVC, Riesgos.irlHistorico.FNVNC, Riesgos.irlHistorico.rendimiento
FROM         Riesgos.CarterasColectivas INNER JOIN
                      Riesgos.irlHistorico ON Riesgos.CarterasColectivas.Id = Riesgos.irlHistorico.idCartera
GO
