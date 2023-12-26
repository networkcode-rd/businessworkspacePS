Install-Module -Name Az -AllowClobber -Scope CurrentUser

#Step-1=========================================
#Connecting to Azure portal
Connect-AzAccount
Get-AzContext #Check Subs ID set to if not the desiered one, use the next command.
Select-AzSubscription -Subscription 9ac031ad-df47-4556-babf-774cb850adbe

#Step-2=========================================
$resourceGroup = "vwan-rg-training-0"
$location = "Central India"

New-AzResourceGroup -Name $resourceGroup -Location $location

#Step-3=========================================
#Building vWAN configuration

#If RG is already present then use the below or else configure RG first
$resourceGroup = "vwan-rg-training-0"
New-AzVirtualWan -ResourceGroupName $resourceGroup -Name "vWAN" -Location "Central India" -AllowBranchToBranchTraffic

#Step-4=========================================
#Creating virtual HUB only. We will create two vHUBs i.e., vhubA and vhubB

$GetvWANInfo = Get-AzVirtualWan -Name "vWAN" -ResourceGroupName "vwan-rg-training-0" # Fetching the vWAN information first
New-AzVirtualHub -VirtualWan $GetvWANInfo -ResourceGroupName "vwan-rg-training-0" -Name "vhubA" -Location "Central India" -AddressPrefix "192.168.220.0/24"

#before proceeding with any further configuration, please review the newly created vHUB in your Azure portal.
#All ok? Move on with the rest of the configuration. Note the time and date of your operation.

New-AzVirtualHub -VirtualWan $GetvWANInfo -ResourceGroupName "vwan-rg-training-0" -Name "vhubB" -Location "Southeast Asia" -AddressPrefix "192.168.221.0/24"



#Step-5=========================================
#Create a VPN Gateway in vhubA and create VPN site