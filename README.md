
![alt text](images/tf-logo.png)

# 1. Wat is Terraform
Terraform is een open-source tool ontwikkeld door HashiCorp die wordt gebruikt voor het beheren van infrastructuur via code, ook wel bekend als Infrastructure as Code (IaC). Met Terraform kun je infrastructuurcomponenten zoals virtuele machines, netwerken en opslagbronnen definiëren, configureren en beheren door middel van een declaratieve configuratietaal. 

### Belangrijkste Kenmerken van Terraform
- Declaratieve Configuratie: Je beschrijft de gewenste staat van je infrastructuur in configuratiebestanden, en Terraform zorgt ervoor dat de daadwerkelijke infrastructuur overeenkomt met deze beschrijving.
- Providers: Terraform ondersteunt een breed scala aan cloudproviders zoals AWS, Azure, Google Cloud, en vele anderen, evenals on-premises oplossingen.
- Plan en Apply: Met terraform plan kun je een overzicht krijgen van de wijzigingen die zullen worden aangebracht, en met terraform apply voer je deze wijzigingen daadwerkelijk door.
- State Management: Terraform houdt de staat van je infrastructuur bij in een state-bestand, zodat het weet welke resources er al zijn en welke moeten worden aangemaakt, bijgewerkt of verwijderd.
- Modulariteit: Je kunt modules gebruiken om herbruikbare stukken infrastructuurcode te maken en te delen, wat het beheer van complexe infrastructuren vereenvoudigt.


# 2. Wat is Infrastructure As Code (IAC)
Infrastructure as Code (IaC) is een methode voor het beheren en inrichten van infrastructuur via leesbare configuratiebestanden, in plaats van handmatige hardwareconfiguraties of interactieve tools (GUIs). Deze aanpak stelt ontwikkelaars en DevOps-Engineers in staat om infrastructuur te beheren met dezelfde technieken en principes die worden toegepast bij softwareontwikkeling.

![alt text](images/image-1.png)

### Belangrijkste Concepten van IaC

1. Declaratieve en Imperatieve Talen:

    - Declaratief: Je beschrijft de gewenste eindtoestand van de infrastructuur, en de IaC-tool zorgt ervoor dat deze toestand wordt bereikt. Voorbeelden zijn Terraform en Kubernetes YAML.
    - Imperatief: Je schrijft specifieke commando's die in een bepaalde volgorde moeten worden uitgevoerd om de infrastructuur te configureren. Voorbeelden zijn Ansible en Chef.

2. Versiebeheer:

    - IaC-bestanden kunnen worden beheerd met versiebeheersystemen zoals Git, waardoor wijzigingen in de infrastructuur kunnen worden bijgehouden en gecontroleerd.

3. Herhaalbaarheid en Consistentie:

    - Door infrastructuur als code te definiëren, kun je dezelfde configuratie herhaaldelijk toepassen, wat zorgt voor consistentie in verschillende omgevingen (ontwikkel, test, productie).
4. Automatisering:

    - IaC maakt het mogelijk om infrastructuur automatisch te provisioneren en te beheren, wat handmatige configuratiefouten vermindert en de snelheid van implementaties verhoogt.

### Voordelen van IaC
- Snellere Implementatie: Automatisering van infrastructuurprovisioning versnelt de uitrol van nieuwe omgevingen.
- Betere Samenwerking: Teams kunnen samenwerken aan infrastructuurconfiguraties op dezelfde manier als bij softwareontwikkeling.
- Versiebeheer: Wijzigingen in infrastructuur kunnen worden bijgehouden, teruggedraaid en gecontroleerd.
- Consistentie: Vermindert de kans op configuratiefouten door herhaalbare en voorspelbare infrastructuurimplementaties.


# 3. Hoe werkt Terraform (workflow)
Terraform werkt door infrastructuur te beheren via een declaratieve configuratietaal, ook we HachiCorp Language (HCL) genoemd. Hier onder zie je een overzicht van hoe het proces in grote lijnen verloopt:

![alt text](images/image-2.png)

### 1. Schrijf Configuratiebestanden
Je begint met het schrijven van configuratiebestanden in HashiCorp Configuration Language (HCL) of JSON. Deze bestanden beschrijven de gewenste staat van je infrastructuur.

### 2. Initialiseer de Werkruimte
Voer terraform init uit om de werkruimte te initialiseren. Dit commando downloadt de benodigde provider-plugins en bereidt de omgeving voor.
```bash
terraform init
```
### 3. Plan de Wijzigingen
Gebruik terraform plan om een uitvoeringsplan te maken. Dit plan laat zien welke acties Terraform zal ondernemen om de infrastructuur in overeenstemming te brengen met de configuratiebestanden.
```bash
terraform plan
```
### 4. Voer de Wijzigingen Uit
Voer terraform apply uit om de geplande wijzigingen door te voeren. Terraform zal de infrastructuur creëren, bijwerken of verwijderen zoals gespecificeerd in de configuratiebestanden.
```bash
terraform apply
```
### 5. Beheer de Staat
Terraform houdt de staat van je infrastructuur bij in een state-bestand. Dit bestand wordt gebruikt om de huidige staat van de infrastructuur te vergelijken met de gewenste staat zoals beschreven in de configuratiebestanden. Dit helpt bij het bepalen van de benodigde acties om de infrastructuur up-to-date te houden.

### 6. Wijzig en Herhaal
Wanneer je wijzigingen aan je infrastructuur wilt aanbrengen, pas je de configuratiebestanden aan en herhaal je de stappen plan en apply. Terraform zorgt ervoor dat de infrastructuur altijd overeenkomt met de configuratie.

### 7. Verwijderen
Wanneer de infrastructuur niet meer nodig is kun je deze verwijderen
```bash
terraform destroy
```

# 4. Terraform provider
Terraform providers zijn plugins die Terraform in staat stellen om te communiceren met verschillende API's van cloudproviders, SaaS-aanbieders en andere services. Ze fungeren als een brug tussen Terraform en de infrastructuur die je wilt beheren.

![alt text](images/image-3.png)

## Belangrijkste Functies van Providers
### 1. Resource Management:
Providers definiëren welke resources beschikbaar zijn en hoe deze kunnen worden beheerd. Bijvoorbeeld, de AWS provider biedt resources zoals aws_instance, aws_s3_bucket, enz.

### 2. Configuratie:
Elke provider heeft specifieke configuratie-instellingen die je moet definiëren in je Terraform configuratiebestanden. Bijvoorbeeld, voor de AWS provider moet je de regio specificeren:
```HCL
provider "aws" {
  region = "us-west-2"
}
```
### 3. Authenticatie:
Providers zorgen voor de authenticatie met de onderliggende API's. Dit kan door middel van API-sleutels, tokens, of andere authenticatiemethoden die door de service worden ondersteund.

### 4. Schema:
Providers definiëren een schema voor de resources en data sources die ze beheren. Dit schema beschrijft de attributen en hun types, evenals de vereiste en optionele velden.

## 4. Workshop

Via onderstaande link kun je starten met de de workshop Azure Terraform basis:

- [start workshop Terraform basic](learn-terraform-azure/workshop-terraform-basic.md)