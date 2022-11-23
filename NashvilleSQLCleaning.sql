/*
Cleaning housing data
*/

Select * From NashvilleSQLProject.dbo.Sheet1$

-------------------------------------------------------------------------------
--Changing The Date Format

Select SaleDateConverted, Convert(Date,SaleDate) 
From NashvilleSQLProject.dbo.Sheet1$

Update Sheet1$
SET SaleDate = CONVERT(Date, SaleDate)

ALter Table Sheet1$
Add SaleDateConverted Date;

Update Sheet1$
SET SaleDateConverted = Convert(Date, SaleDate)

-----------------------------------------------------
--Cleaning Address data

Select * 
From NashvilleSQLProject.dbo.Sheet1$
Where PropertyAddress is null

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.PropertyAddress, b.PropertyAddress)
From NashvilleSQLProject.dbo.Sheet1$ a
JOIN NashvilleSQLProject.dbo.Sheet1$ b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

Update a 
Set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
From NashvilleSQLProject.dbo.Sheet1$ a
JOIN NashvilleSQLProject.dbo.Sheet1$ b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

------------------------------------------------------
--Creating individual Columns for address

Select PropertyAddress
From NashvilleSQLProject.dbo.Sheet1$
--Where PropertyAddress is null

Select 
SUBSTRING(PropertyAddress, 1, CHARINDEX(","

From NashvilleSQLProject.dbo.Sheet1$