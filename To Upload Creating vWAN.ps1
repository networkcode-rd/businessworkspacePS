#=========================================
#Connecting to Azure portal
Connect-AzAccount
Get-AzContext #Check Subs ID set to if not the desiered one, use the next command.
Select-AzSubscription -Subscription 9ac031ad-df47-4556-babf-774cb850adbe
#=========================================
#Building vWAN configuration
New-AzVirtualWan
   -ResourceGroupName <String>
   -Name <String>
   -Location <String>


New-AzResourceGroup -Location "West US" -Name "testRG"
$virtualWan = New-AzVirtualWan -ResourceGroupName "testRG" -Name "myVirtualWAN" -Location "West US"
New-AzVirtualHub -VirtualWan $virtualWan -ResourceGroupName "testRG" -Name "westushub" -AddressPrefix "10.0.1.0/24"

VirtualWan                : /subscriptions/ { subscriptionId }resourceGroups/testRG/providers/Microsoft.Network/virtualWans/myVirtualWAN
ResourceGroupName         : testRG
Name                      : westushub
Id                        : /subscriptions/ { subscriptionId }resourceGroups/testRG/providers/Microsoft.Network/virtualHubs/westushub
AddressPrefix             : 10.0.1.0/24
RouteTable                : 
VirtualNetworkConnections : {}
RouteTables                           : {}
Location                  : West US
Sku                  : Standard
PreferredRoutingGateway   : ExpressRoute
HubRoutingPreference      : ExpressRoute
Type                      : Microsoft.Network/virtualHubs
ProvisioningState         : Succeeded