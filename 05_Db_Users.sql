USE [DbHelpDesk]
GO
/****** Object:  User [CF0177MCE]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CF0177MCE] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\Administrator]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\Administrator] FOR LOGIN [CORFICOLOMBIANA\Administrator] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CB0130CDO]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CB0130CDO] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CB0130RFM]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CB0130RFM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177ARM]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177ARM] FOR LOGIN [CORFICOLOMBIANA\CF0177ARM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177CAA]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177CAA] FOR LOGIN [CORFICOLOMBIANA\CF0177CAA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177CIV]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177CIV] FOR LOGIN [CORFICOLOMBIANA\CF0177CIV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177COR]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177COR] FOR LOGIN [CORFICOLOMBIANA\CF0177COR] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177DAC]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177DAC] FOR LOGIN [CORFICOLOMBIANA\CF0177DAC] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177DMC]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177DMC] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177EFM]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177EFM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177GEC]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177GEC] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177JAD]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177JAD] FOR LOGIN [CORFICOLOMBIANA\CF0177JAD] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177JGV]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177JGV] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177LUA]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177LUA] FOR LOGIN [CORFICOLOMBIANA\CF0177LUA] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177MCE]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177MCE] FOR LOGIN [CORFICOLOMBIANA\CF0177MCE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177MFS]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177MFS] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\CF0177OPS]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\CF0177OPS] FOR LOGIN [CORFICOLOMBIANA\CF0177OPS] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\FC0120JHG]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\FC0120JHG] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\FC0120NEH]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\FC0120NEH] FOR LOGIN [CORFICOLOMBIANA\FC0120NEH] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\LC0210CPC]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\LC0210CPC] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\Servicios_SQL2005]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\Servicios_SQL2005] FOR LOGIN [CORFICOLOMBIANA\servicios_sql2005] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [CORFICOLOMBIANA\SopApp_USC]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [CORFICOLOMBIANA\SopApp_USC] FOR LOGIN [CORFICOLOMBIANA\SopApp_USC]
GO
/****** Object:  User [LinkUserLocal]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [LinkUserLocal] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [monitor]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [monitor] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [usrdev]    Script Date: 11/25/2020 9:13:07 AM ******/
CREATE USER [usrdev] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [CF0177MCE]
GO
ALTER ROLE [db_owner] ADD MEMBER [CORFICOLOMBIANA\Administrator]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CB0130CDO]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CB0130RFM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177ARM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177CAA]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177CIV]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [CORFICOLOMBIANA\CF0177CIV]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177COR]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177DAC]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177DMC]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177EFM]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177GEC]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177JAD]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177JGV]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177LUA]
GO
ALTER ROLE [db_owner] ADD MEMBER [CORFICOLOMBIANA\CF0177MCE]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177MFS]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\CF0177OPS]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\FC0120JHG]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\FC0120NEH]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\LC0210CPC]
GO
ALTER ROLE [db_owner] ADD MEMBER [CORFICOLOMBIANA\Servicios_SQL2005]
GO
ALTER ROLE [db_datareader] ADD MEMBER [CORFICOLOMBIANA\SopApp_USC]
GO
ALTER ROLE [db_owner] ADD MEMBER [LinkUserLocal]
GO
ALTER ROLE [db_datareader] ADD MEMBER [monitor]
GO
ALTER ROLE [db_owner] ADD MEMBER [usrdev]
GO
