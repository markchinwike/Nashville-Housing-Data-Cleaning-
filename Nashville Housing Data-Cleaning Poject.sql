Select *
From master..NashVille_Filter

-- Standardize Date Format
Select saleDateConverted, CONVERT(Date,SaleDate)
From master..NashVille_Filter


Update NashVille_Filter
SET SaleDate = CONVERT(Date,SaleDate)

-- Populate Property Address data
Select saleDateConverted
From master..NashVille_Filter



Select *
From master..NashVille_Filter
order by ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, 
ISNULL(a.PropertyAddress,b.PropertyAddress)
From master..NashVille_Filter a
JOIN master..NashVille_Filter b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

Update a
SET PropertyAddress = ISNULL(a.PropertyAddress,b.PropertyAddress)
From master..NashVille_Filter a
JOIN master..NashVille_Filter b
	on a.ParcelID = b.ParcelID
	AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is null

-- Breaking out Address into Individual Columns (Address, City, State)


Select PropertyAddress
From NashVille_Filter
--Where PropertyAddress is null
--order by ParcelID

Select 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
From NashVille_Filter

Select
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1 , LEN(PropertyAddress)) as Address
From master..NashVille_Filter

ALTER TABLE NashVille_Filter
Add PropertySplitAddress Nvarchar(255);

Update NashVille_Filter
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1 )

ALTER TABLE  NashVille_Filter
Add PropertySplitCity Nvarchar(255);

Update NashVille_Filter
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1 , LEN(PropertyAddress))

-- Change Y and N to Yes and No in "Sold as Vacant" field
Select Distinct(SoldAsVacant), Count(SoldAsVacant)
From NashVille_Filter
Group by SoldAsVacant
order by 2

Select SoldAsVacant
, CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END
From NashVille_Filter


Update NashVille_Filter
SET SoldAsVacant = CASE When SoldAsVacant = 'Y' THEN 'Yes'
	   When SoldAsVacant = 'N' THEN 'No'
	   ELSE SoldAsVacant
	   END

	   
-- Remove Duplicates
	   WITH RowNumCTE AS(
Select *,
	ROW_NUMBER() OVER (
	PARTITION BY ParcelID,
				 PropertyAddress,
				 SalePrice,
				 SaleDate,
				 LegalReference
				 ORDER BY
					UniqueID
					) row_num

From NashVille_Filter
--order by ParcelID
)
Delete
From RowNumCTE
Where row_num > 1
--Order by PropertyAddress


-- Delete Unused Columns
Select *
From master..NashVille_Filter
 
 ALTER TABLE NashVille_Filter
DROP COLUMN OwnerAddress, TaxDistrict, PropertyAddress, SaleDate





