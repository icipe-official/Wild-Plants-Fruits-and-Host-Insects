# API Documentation

Welcome to the Wild Plants, Fruits, and Host Insects (WPFHI) API documentation for our digital platform. This API serves as a gateway to a rich database of information on various wild plants, fruits, and the host insects associated with them. With this API, developers can access comprehensive data on plant characteristics, fruit taxonomy, and the insects that rely on these plants for their survival. These APIs provides a wealth of botanical and entomological knowledge on the ICIPE biocollections. This documentation will guide you through the available endpoints, request formats, and provide examples of usage and output for each API

## 1. Plants api

### -Taxonomy information

API Endpoint: /api/plants/species

Description

This API endpoint allows one to retrieve species data for plant's taxonomy information and their associated insects. It serves as a data retrieval service for plant-related information, including species names, genera, families, and related insect data such as species names, genera, orders, and families.

- HTTP Method
  GET

- Parameters
    None

- Example usage

 https://test-dmmg.icipe.org/api/plants/species

- Example output

##  2. Plantspage
- Description
Designed with simplicity in mind, this API endpoint allows you to retrieve detailed information about specific plant species based on their unique species IDs.
HTTP Method: GET
Type: Public
- Parameters
species_id (required): The unique ID of the plant species for which the details should be retrieved.
- Output:
The API response will be a JSON object containing the details of the retrieved species. The structure of the JSON response will include the following fields:

id (string): The ID of the plant.

species_name (string): The name of the plant species.
genus_id (string): The ID of the plant genus.

plant_genera (array of objects): An array of objects representing plant genera, containing the following fields:

genus_name (string): The name of the plant genus.

family_id (string): The ID of the plant family.

plant_families (array of objects): An array of objects containing the following fields:

family_name (string): The name of the plant family.

id (string): The ID of the plant family.

plants_matk (array of objects): An array of objects representing MATK data for the plants, containing the following fields:

matk_id (string): The ID of the MATK data.

nucleotide (string): The nucleotide data for the MATK.

country (string): The country where the plant is found.

genebank_accession (string): The gene bank accession number for the plant.

plants_insects (array of objects): An array of objects representing insects associated with the plants, containing the following fields:

insects (array of objects): An array of objects representing insect data, containing the following fields:

species_name (string): The name of the insect species.

insect_genera (array of objects): An array of objects representing insect genera, containing the following fields:

genus_name (string): The name of the insect genus.

insect_orders (array of objects): An array of objects representing insect orders, containing the following fields:

order_name (string): The name of the insect order.

insect_families (array of objects): An array of objects representing insect families, containing the following fields:

family_name (string): The name of the insect family.
- Example usage
- 
http://localhost:3000/api/plants/plantsPage/1
- Example output
 
{
"id": 9,
"species_name": "schimperi (A. DC.) Schweinf.",
"genus_id": 8,
"plant_genera": {
"genus_name": "Acokanthera",
"family_id": 9,
"plant_families": {
"family_name": "Apocynaceae",
"id": 9
}
},
"plants_matk": [],
"plants_insects": [
{
"insects": {
"species_name": "sp.",
"insect_genera": {
"genus_name": "Diachasmimorpha"
},
"insect_orders": {
"order_name": "Hymenoptera"
},
"insect_families": {
"family_name": "Braconidae"
}
}
},
{
"insects": {
"species_name": "sp. cf. concolor",
"insect_genera": {
"genus_name": "Psyttalia"
},
"insect_orders": {
"order_name": "Hymenoptera"
},
"insect_families": {
"family_name": "Braconidae"
}
}
},
{
"insects": {
"species_name": "sp. 1",
"insect_genera": {
"genus_name": "Psyttalia"
},
"insect_orders": {
"order_name": "Hymenoptera"
},
"insect_families": {
"family_name": "Braconidae"
}
}
},
{
"insects": {
"species_name": "capitata",
"insect_genera": {
"genus_name": "Ceratitis"
},
"insect_orders": {
"order_name": "Diptera"
},
"insect_families": {
"family_name": "Tephritidae"
}
}
},
{
"insects": {
"species_name": "simi",
"insect_genera": {
"genus_name": "Ceratitis"
},
"insect_orders": {
"order_name": "Diptera"
},
"insect_families": {
"family_name": "Tephritidae"
}
}
},
{
"insects": {
"species_name": "fasciventris",
"insect_genera": {
"genus_name": "Ceratitis"
},
"insect_orders": {
"order_name": "Diptera"
},
"insect_families": {
"family_name": "Tephritidae"
}
}
},
{
"insects": {
"species_name": "sp.",
"insect_genera": {
"genus_name": "Asobara"
},
"insect_orders": {
"order_name": "Hymenoptera"
},
"insect_families": {
"family_name": "Braconidae"
}
}
}
]
}
