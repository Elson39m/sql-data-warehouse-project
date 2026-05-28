/*
=========================================================================
Create Database and Schemas
=========================================================================
Script Purpose:
This script create a new database named datawarehouse1. Additionally this script sets up three schemas within the database:"Bronze",
"Silver" and "Gold".
*/

USE master;
GO

CREATE DATABASE Datawarehouse1;
USE Datawarehouse1
Create Schema Bronze;
GO
Create Schema Silver;
GO
Create Schema Gold;
GO
