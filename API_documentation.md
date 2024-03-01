# API Documentation

Welcome to the Wild Plants, Fruits, and Associated Insects (WiPtFruIM) API documentation for the digital platform. The API serves as a gateway to a rich database of information on various wild plants, fruits, and the host insects associated with them. With this API, developers can access comprehensive data on plant characteristics, fruit taxonomy, and the insects that rely on these plants for their survival. These APIs provides a wealth of botanical and entomological knowledge on the ICIPE biocollections. This documentation will guide you through the available endpoints, request formats, and provide examples of usage and output for the API

<!-- ##  Plants api -->

<!-- ### 1. Taxonomy information and Related Barcodes-->

<!-- API Endpoint: /api/plants/species

Description

This API endpoint allows one to retrieve species data for plant's taxonomy information and their associated insects. It serves as a data retrieval service for plant-related information, including species names, genera, families, and related insect data such as species names, genera, orders, and families.

- HTTP Method
  GET

- Parameters
    None

- Example usage

 https://test-dmmg.icipe.org/api/plants/species

- Example output -->

### Plantspage

- Description
  This API endpoint allows you to retrieve detailed information about specific plant species based on their unique species IDs.
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
- https://test-dmmg.icipe.org/wpfhi/api/plants/plantsPage/1
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

# Glossary API

Glossary Data API
Overview

The Glossary Data API retrieves the glossary information, including terms, descriptions, types, and associated plant and photo data. Leveraging the Prisma ORM for database interactions, this API is designed to handle HTTP GET requests, providing a

Endpoint
https://test-dmmg.icipe.org/wpfhi/api/glossary/glossary

Request Method: GET

Query Parameters
No specific qury parameters are required.

Response
Success Response

    Status Code: 200 OK
    Content-Type: application/json
    Body: JSON object containing glossary data.

# Example usage

https://test-dmmg.icipe.org/wpfhi/api/glossary/glossary

# Eaxmple output

[{"glossary_description":"with two leaflets","glossary_id":49,"glossary_term":"2-foliolate (bifoliolate)","glossary_type":"compund_eaf_type","glossary_examples":[{"photo_name":"01796.jpg","plants_photos":{"plant_id":66,"photo_name":"01796.jpg","plants":{"species_name":"pedicellaris Mildbr. & Schltr.","plant_genera":{"genus_name":"Balanites"}}}}]}]

## Insects Details API

The Insects Details API, retrieves insect information including fruits from which the insect was reared, regions from where the plant sampled, images and taxonomic details.

Endpoint

https://test-dmmg.icipe.org/wpfhi/api/insects/insectsPage/1

Request Method: GET

Query Parameters

    insect_id: ID of the insect  to fetch details for.

Response
Success Response

    Status Code: 200 OK
    Content-Type: application/json
    Body: JSON object containing Coleoptera details

# Example usage

https://test-dmmg.icipe.org/wpfhi/api/glossary/glossary

# Example output

[{"id":1,"species_name":"sp.","insect_orders":{"order_name":"Hymenoptera"},"insect_families":{"family_name":"Braconidae"},"insect_sub_families":{"sub_family_name":"Agathidinae"},"insect_genera":{"id":1,"genus_name":"Agathis"},"insect_photos":[],"insects_regions":[{"regions":{"latitude":"0.4612","longitude":"39.6401","region":"Northern Mid-altitude"}}],"plants_insects":[{"plants":{"id":703,"species_name":"steudneri Schweinf.","plant_genera":{"genus_name":"Rubus"},"plant_coordinates":[{"latitude":"-0.20191666666666666","longitude":"37.49185"},{"latitude":"-0.952","longitude":"36.6905"},{"latitude":"-0.9721666666666666","longitude":"36.6965"},{"latitude":"0.9741666666666667","longitude":"36.69716666666667"},{"latitude":"1.0533166666666667","longitude":"34.72358333333333"},{"latitude":"1.0653666666666666","longitude":"34.679633333333335"},{"latitude":"1.0717333333333334","longitude":"34.66948333333333"},{"latitude":"1.0738","longitude":"34.664316666666664"},{"latitude":"1.2123666666666666","longitude":"35.27385"}]}}]}]

# Advanced search API

This API retrieve plant data based on specified plant features as filters.
Endpoint

GET /api/multipleentry?filter={}

Request Method:GET

Query Parameters

    filters: JSON object containing filters for querying plant data.

# Example usage

For plant type:tree,spines: present, fruit type: berry

https://test-dmmg.icipe.org/wpfhi/api/multipleEntry/multipleentry?filters={"shrub_climbings":["tree"],"plant_spines":["present"],"plant_latex":[],"fruit_types":["berry"],"fruit_colors":[],"fruit_sizes":[],"fruit_shapes":[],"leaf_types":[],"leaf_margins":[],"leaf_arrangements":[]}

# Example output

[{"id":42,"species_name":"vogelii Planch.","plant_genera":{"genus_name":"Anthocleista"},"plants_photos":[{"photo_name":"0060.jpg","photo_id":66},{"photo_name":"0061.jpg","photo_id":67}]},{"id":120,"species_name":"tetramera (Sacleux) Stapf","plant_genera":{"genus_name":"Carissa"},"plants_photos":[{"photo_name":"0161.jpg","photo_id":196},{"photo_name":"0162.jpg","photo_id":197}]},{"id":291,"species_name":"keniensis E.V. Williams","plant_genera":{"genus_name":"Dovyalis"},"plants_photos":[{"photo_name":"0371.jpg","photo_id":483},{"photo_name":"0372.jpg","photo_id":484}]},{"id":779,"species_name":"spinosa Lam.","plant_genera":{"genus_name":"Strychnos"},"plants_photos":[{"photo_name":"0981.jpg","photo_id":1336},{"photo_name":"0982.jpg","photo_id":1337}]},{"id":557,"species_name":"routledgei Sprague","plant_genera":{"genus_name":"Oncoba"},"plants_photos":[{"photo_name":"0679.jpg","photo_id":933},{"photo_name":"0680.jpg","photo_id":934}]},{"id":289,"species_name":"caffra (Hook. f. & Harv.) Warb.","plant_genera":{"genus_name":"Dovyalis"},"plants_photos":[{"photo_name":"0365.jpg","photo_id":477},{"photo_name":"0366.jpg","photo_id":478}]},{"id":744,"species_name":"arundo Mattei","plant_genera":{"genus_name":"Solanum"},"plants_photos":[{"photo_name":"01543.jpg","photo_id":1273},{"photo_name":"01544.jpg","photo_id":1274}]},{"id":601,"species_name":"reticulatus Poir.","plant_genera":{"genus_name":"Phyllanthus"},"plants_photos":[{"photo_name":"0729.jpg","photo_id":1016},{"photo_name":"0730.jpg","photo_id":1017}]},{"id":288,"species_name":"abyssinica (A. Rich.) Warb.","plant_genera":{"genus_name":"Dovyalis"},"plants_photos":[{"photo_name":"01179.jpg","photo_id":475},{"photo_name":"01180.jpg","photo_id":476}]},{"id":395,"species_name":"abyssinica Oliv.","plant_genera":{"genus_name":"Harrisonia"},"plants_photos":[{"photo_name":"0497.jpg","photo_id":663}]},{"id":558,"species_name":"spinosa Forssk.","plant_genera":{"genus_name":"Oncoba"},"plants_photos":[{"photo_name":"0681.jpg","photo_id":935},{"photo_name":"0682.jpg","photo_id":936}]},{"id":290,"species_name":"macrocalyx (Oliv.) Warb.","plant_genera":{"genus_name":"Dovyalis"},"plants_photos":[{"photo_name":"0367.jpg","photo_id":479},{"photo_name":"0368.jpg","photo_id":480},{"photo_name":"0369.jpg","photo_id":481},{"photo_name":"0370.jpg","photo_id":482}]},{"id":111,"species_name":"erythrocarpos Isert","plant_genera":{"genus_name":"Capparis"},"plants_photos":[{"photo_name":"0149.jpg","photo_id":176},{"photo_name":"0150.jpg","photo_id":177}]},{"id":137,"species_name":"jamacaru DC.","plant_genera":{"genus_name":"Cereus"},"plants_photos":[{"photo_name":"0175.jpg","photo_id":214},{"photo_name":"0176.jpg","photo_id":215}]}]

# Phylogeny API

The Phylogeny API is used to retrieve barcode data based on a specified family of plants or insects by the user on the front end. The retrieved data is used to return a Newick file representing the relationships within the specified family for display in the front end.

# Example output:

(Asparagus_africanus_55_Mozambique_null_PNG539-18:1.1405605676,Asparagus_asparagoides_56_United-States_null_SDH2194-14:0.0062498731,((Asparagus_falcatus_57_Kenya_KR735086_UHURU820-14:0.0000011913,Asparagus_falcatus_57_Kenya_KR734552_UHURU821-14:0.0000011913):0.0031700078,(Sansevieria_robusta_721_Kenya_KR734520_UHURU841-14:0.0000011913,(Sansevieria_robusta_721_Kenya_KR734530_UHURU842-14:0.0000011913,Sansevieria_robusta_721_Kenya_KR734544_UHURU843-14:0.0000011913):0.0000011913):0.0595686104):0.0014356136);
