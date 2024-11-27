# Azure workshop Terraform basic

## Introduction
Het doel van deze workshop is om je een eerste eravring op te laten doen met het werken met Terraform, we maken hiervoor gebruik van de standaard 'Azure-get-started' tutorial van HashiCorp. Vanuit de tutorial ga je zelfstandig met terraform aan de slag waarbij je azure resources zult gaan aanmaken, wijzigen en verwijderen. 

Voor deze training hebben we een aparte subscription aangemaakt binnen onze Azure Tenant KPN B.V. de gegevens van deze subscription staan hieronder:

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
Voor dat je gaat starten is het goed om te weten dat we de laatste stap van de tutorial 'Store remote state' niet zullen volgen. Hiervoor in de plaats gaan we gebruik maken van een Azure blob storage container, wat hieronder staa beschreven.

start nu eerst met de tutorial op de site van hashicorp: https://developer.hashicorp.com/terraform/tutorials/azure-get-started

Als je bent aangekomen bij het laatste hoofdstuk over remote state vervolg dan de opdracht hieronder. Veel plezier.


## Terraform remote state on Azure blob storage
