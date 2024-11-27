# Azure workshop Terraform basic

## Introduction
Het doel van deze workshop is om je een eerste ervaring op te laten doen met het werken met Terraform, we maken hiervoor gebruik van de standaard 'Azure-get-started' tutorial van HashiCorp. Vanuit de tutorial ga je zelfstandig met terraform aan de slag waarbij je azure resources zult gaan aanmaken, wijzigen en verwijderen. 

Voor deze training hebben we een aparte subscription aangemaakt binnen onze Azure Tenant 'KPN B.V.' de gegevens van deze subscription staan hieronder, dit heb je straks nodig voor het aanloggen op azure via de azure cli.

```json
{
	"tenant": {
		"naam": "KPN B.V.",
		"id": "0baeb517-c6ec-4d6c-a394-96a5affa5ada"
	},
	"subscription": {
		"naam": "kpn-business-market-workload-training",
		"id": "bf9726e0-ad67-4aa2-ac53-147c9465a602"
	}
}
```

Omdat we met z'n allen gebruik maken van de zelfde subscription is het belangrijk om onderstaande naam conventie te hanteren:

- Resource Group: training-rg-<cura_inlog_naam>
- Virtual Network: training-vnet-<cura_inlog_naam>
- Storage Account: storage<cura_inlog_naam>

Example:
```
- training-rg-schee805
    - training-vnet-schee805
    - storageschee805
```

## Start tutorial
Voordat je gaat starten is het goed om te weten dat we de laatste stap van de tutorial 'Store remote state' niet zullen volgen. Hiervoor in de plaats gaan we gebruik maken van een Azure blob storage container, wat hieronder staat beschreven.

Je kunt nu starten met de tutorial op de site van hashicorp: [azure-get-started](https://developer.hashicorp.com/terraform/tutorials/azure-get-started)

Als je bent aangekomen bij het laatste hoofdstuk over remote state vervolg dan de opdracht hieronder. Veel plezier.


## Terraform remote state on Azure blob storage
Tot nu toe heb je met terraform Azure resources aangemaakt, gewijzigd en verwijderd vanaf je lokale machine. Dat is leuk voor testen en ontwikkeling van diensten, maar in een productie omgeving wil je dat de status van je infrastructuur op een veilig manier ergens centraal wordt opgeslagen.  Zodat je samen met je teamgenoten aan de infrastructuur kunt werken.

De beste manier om dit te doen is door ervoor te zorgen dat de terraform state file ergens remote wordt opgeslagen. Voor deze opdracht maken we dan ook gebruik van een Azure blob storage account.

Om onderstaande stappen te kunnen uitvoeren gaan we er vanuit dat je de HashiCorp [azure-get-started](https://developer.hashicorp.com/terraform/tutorials/azure-get-started) tutorial heb uitgevoerd, zo niet doe dit dan eerst!

### Stap 1
Maak met terraform een storage account aan inclusief een blob container, en gebruik daarbij onderstaande naam conventie:
- storage account naam: storage<cura_inlog_naam>
- blob container naam: terraform-state-<cura_inlog_naam>

Tip: bekijk de resource examples op de Registry pagina van [hashicorp/azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest) onder documentation! 


### Stap 2
Als je het storage account heb aangemaakt voeg dan onderstaande remote state configuratie toe aan je main.tf file.

```hcl
terraform {
  backend "azurerm" {
    resource_group_name  = "training-rg-<cura_inlog_naam>"
    storage_account_name = "storage<cura_inlog_naam>"
    container_name       = "terraform-state-<cura_inlog_naam>"
    key                  = "terraform.tfstate"
  }
}
```

### Stap 3
Als je de remote state configuratie heb toegevoegd aan je main.tf file ben je klaar om je lokale state file te verhuizen naar de Azure storage blob container. De migratie start je met het terraform init commando, hierdoor herkent terraform de toegevoegde backend configuratie.

```bash
❯ terraform init

Initializing the backend...
Do you want to copy existing state to the new backend?
  Pre-existing state was found while migrating the previous "local" backend to the
  newly configured "azurerm" backend. No existing state was found in the newly
  configured "azurerm" backend. Do you want to copy this state to the new "azurerm"
  backend? Enter "yes" to copy and "no" to start with an empty state.

  Enter a value: yes
```
Tijdens de reinitialization zal terraform een prompt presenteren waarbij akkoord wordt gevraagd voor het kopieren van je lokale state file naar je remote state. Vul 'yes' in en druk vervolgens op enter om het kopieren van de state file in gang te zetten.

Bekijk eens je blob container in de Azure portal of je daar nu je state file ziet staan.

### Stap 4
Nu terraform zijn state file heeft gekopieerd naar Azure storage blob container kun je de lokale state file verwijderen.
```bash
rm terraform.tfstate
```
Controleer je state file.
```bash
terraform state list

azurerm_resource_group.rg
azurerm_storage_account.storage
azurerm_storage_container.storage
azurerm_virtual_network.vnet

```
Check of terraform nog steeds goed functioneerd en er geen wijzigingen zijn.
```bash
terraform apply

azurerm_resource_group.rg: Refreshing state... [id=/subscriptions/bf9726e0-ad67-4aa2-ac53-147c9465a602/resourceGroups/training-rg-schee805]
azurerm_virtual_network.vnet: Refreshing state... [id=/subscriptions/bf9726e0-ad67-4aa2-ac53-147c9465a602/resourceGroups/training-rg-schee805/providers/Microsoft.Network/virtualNetworks/training-vnet-schee805]
azurerm_storage_account.storage: Refreshing state... [id=/subscriptions/bf9726e0-ad67-4aa2-ac53-147c9465a602/resourceGroups/training-rg-schee805/providers/Microsoft.Storage/storageAccounts/storageaccountschee805]
azurerm_storage_container.storage: Refreshing state... [id=https://storageaccountschee805.blob.core.windows.net/terraform-state-schee805]

No changes. Your infrastructure matches the configuration.
```
### Stap 5

Verwijder nu je infrastructuur uit Azure, let op dat je nog wel akkord geeft met een 'yes'.

```bash
terraform destroy

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes
```

Dit is het einde van deze beginnershandleidingen voor Terraform, je zou nu zelf terraform kunnen toepassen om infrastructuur te maken en te beheren.