/*Thes  SQL codes creates 35 tables to store the information about wild plants, fruits and their insects:
The tables include: 'plants', 'plant-genera', 'plant_fruit_types',fruit_type,plants-latex,latex,plants_shrub_climbing,
shrubs_climbing,plants_woody_herbaceous, woody_herbaceous, plants_spines_thorns,spines_thorns,plant_fruiting_months,
fruiting months,plants_photos,plant_fruit_colors,plants_leaf margins, leaf_margin,plants_leaf_arrangements,
leaf_arrangements, plants_fruit_sizes, fruit_sizes,plants_fruit_shapes,fruit_shapes,'plants_insects', insects, insect_orders,
insect_families,insect_genera, insect_photos, insect_regions,regions .

1. The 'plant_family' table contains information about the  families of the plant>
    'id': a primary key that uniqueley identifies each plant family
    'family_name': a varying character field column that describes stores the nam>


2. The 'plants' table contains information about various plant species, and has the following six columns:
    'id': a serial primary key, used to uniquely identify each plant species
    'species_name': a varchar(100) column that stores the name of the species
    'leaf_type': a varchar(50) column that stores the type of leaf for the plan.
    'description': a varchar column that stores a description of the plant
    'max_latitude': an intager column that stores the maximum latitude at which the plant species was found.
    'min_latitude: an inatger column that stores the minimum latitude at which the plant was found.'
    'genus_id' : an intager column that stores the genus id in which the plant belongs and cannot be null.
    'FOREIGN KEY: (genus_id) which references to the 'plants_genera's table id column
    The foreign key establishes a one to many relationship between plant species and genus, where, is genus can have many plant species but 
    a plant species can only belong to one genus 

3. The 'plant_genera' table contains information about various genera in which the plant spcies are found, and it has three columns:
    'id: a serial primary key , which uniquely identify each genera
    'genus_name': a character column that stores the name for the genus, and it is unique
    'family_id': an intager column that stores the the family id in which the genus belong, and it is not null. It is
    also a foreign key that links to family table. This foreign key establishes a one to many relationship 
    between plant_genera and family in that, genus can belong to only one family and a family can have 
    many genera

    
4. The 'fruit_type' table contains information about various types of fruits, and has the following columns:
    'fruit_type_id': a serial primary key, used to uniquely identify each fruit type
    'type_of_fruit': a varchar(100) column that stores the type of fruit and it is also unique, and cannot be null

5. The 'plant_fruit_type' table contains information about the relationship between plants and fruit types, and has the following columns:
    'plant_id': an int column that stores the id of the plant, and cannot be null
    'fruit_type_id': an int column that stores the id of the fruit type, and cannot be null
    'PRIMARY KEY (plant_id,fruit_type_id)': the primary key of the table is a composite key, which consist of 'plant_id' and 'fruit_type_id'
    'FOREIGN KEY (plant_id)': reference to the 'plants' table's 'id' column
    'FOREIGN KEY (fruit_type_id)': reference to the 'fruit_type' table's 'fruit_type_id' column

6. The 'plants-latex' is a bridge table that represents a many to many relationship between plants table and the latext table, where plants species can have have or fail to have latex, and and it has two columns: 
    'plant_id' and 'fruit_latex_id' both are the primary key (composite primary keys). 
    It also has two foreign key constraints: one 'plant_id' references 'id' column of 'plants' table and 'fruit_latex_id' references 'fruit_latex_id' column of 'latex' table."

7. The 'latex' stores records of whether a plant has latex or not, and it  has two columns: 
    'fruit_latex_id':  a serial primary key and it is a foreign key referenced in 'plants-latex' table
    'latex_description': a variable length string column, and it's also a unique and not-nullable column."

8. The 'plants_shrub_climbing" is a bridge table that contains the relationshipo between 'plants' table and 'shrub_climbings' table'
  'plant_id' and 'shrub_id': make the composite  primary key for this table. 
  It also has two foreign key constraints: one 'plant_id' references 'id' column of 'plants' table and 'shrub_id' references 'id' column of 'shrub_climbings' table."

9. The 'shrubs_climbing' table stores records for the type of stem the plant species has, ans its is made up of two colums:
    'id': is a serial primary key that uniquely identify each stem type of the plant
    'tree_type': is a variable length string column and it's also a unique and not-nullable column."

10. The 'plants_woody_herbaceous' table contains the information about the many to many relationship between 'plants table and 'woody_herbaceous' table' and it has two colums:
    'back_id'. 'plant_id' and 'back_id' both are the primary key
    It also has two foreign key constraints: one 'plant_id' references 'id' column of 'plants' table and 'back_id' references 'id' column of 'woody_herbaceous' table.

11. The 'woody_herbaceous' table shows whether the plant species has herbaceous or woody stem, and it has two columns:
    'id': is a serial primary key 
    'type_of_stem': is a variable length string with and it's also a unique and not-nullable column."

12. The 'plants_spines_thorns' is a bridge table that models the many to many relationship between 'plants' and 'spines_thorns_table.
    'plant_id' and 'thorn_id' both are the primary key. 
    It also has two foreign key constraints: one 'plant_id' references 'id' column of 'plants' table and 'thorn_id' references 'thorn_id' column of 'spines_thorns' table."
    This table creates a many-to-many relationship between 'plants' and 'spines_thorns' table. This table will have unique combination of rows of plant_id and thorn_id, and
     it  also ensure that the values of plant_id and thorn_id are also present in the corresponding referenced tables. 

13. The 'spines_thorns' table store sthe information about spines and thorns of plant species, and it has two columns:
    thorn_id : is the unique identifier
    thorns_spines: a varying character string column that describes the type of spine or thorn

14. The 'plants_fruiting_months' table represents a many-to-many relationship between 'plants' and 'fruiting_months' table. In this relationship, each month 
can have multiple plants fruiting and each plant specie can have multiple fruiting months. This table has two coumns:
    'plant_id' and 'fruiting_month_id'. 'plant_id' and 'fruiting_month_id' both are the primary key
     It also has two foreign key constraints: one 'plant_id' references 'id' column of 'plants' table and 'fruiting_month_id' references 'fruiting_month_id' column of 'fruiting_months' table."
    This table  have unique combination of rows of plant_id and fruiting_month_id, and it will also ensure that the values of plant_id and fruiting_month_id are also present in the corresponding referenced tables.

15. The 'fruiting months' table' store the information about fruiting months of plants and it has two columns:
    'fruiting_month_id': is a serial primary key, which is a unique identifier
    month' : a variable characater field  and it's also a unique and not-nullable column. This column describes the fruiting month of the plant species"

16. The 'plants_photos' table represents a one-to-many relationship between 'plants' and 'plants_photos', where a plant can have zero or many photos, and 
each photo can only be of one specie table and it has two colums:
    'plant_id' and 'photo_id' : are both the primary key where photo id is unique 
    'photo_name': a variable length character column it's also a unique and not-nullable column."
    It also has one foreign key constraints: 'plant_id' references 'id' column of 'plants' table.
    This table will have unique combination of rows of plant_id and photo_name, and it will also ensure that the values of plant_id is also present in the corresponding referenced table

17. The 'plants_fruit_colors' table represents a many-to-many relationship between 'plants' and 'fruit_colors' table, where each plant species can have
 multiple fruit colors and each fruit colors can  be associated with multiple plants and it has two columns:
    plant_id' and 'color_id'. 'plant_id' and 'color_id' :are the primary key
    It also has two foreign key constraints: first 'plant_id' references 'id' column of 'plants' table and  second 'color_id' references 'color_id' column of 'fruit_colors' table."
    This table wll have unique combination of rows of plant_id and color_id, and it will also ensure that the values of plant_id and color_id are also present in the corresponding referenced tables

18. The 'fruit_colors' table is used to store the information about the color of fruits of plants and it has two columns:
    color_id':a serial primary key which uniquely identifies each color of the fruit
    color':variable length ting column, and it's also a unique and not-nullable column which describes the type of color

19. The 'plants_leaf margins' table reprsensts a many-to-many relationship between 'plants' and 'leaf_margins' table, where, each plant species can have multiple 
leaf margins and each leaf margin can be assocaited with  multiple plants. This table has two columns:
    'plant_id' and 'leaf_margin_id'. 'plant_id' and 'leaf_margin_id' both are the primary key
    It also has two foreign key constraints: one 'plant_id' references 'id' column of 'plants' table and 'leaf_margin_id' references 'leaf_margin_id' column of 'leaf_margins' table."
    This table  have unique combination of rows of plant_id and leaf_margin_id, and it will also ensure that the values of plant_id and leaf_margin_id are also present in the corresponding referenced tables.

20. The 'leaf_margins' table is used to store the information about the type of leaf margins of plants, and it ahs two columns:
    'leaf_margin_id': a serial primary key, which uniquely identifies each type of leaf margin
     'type_of_leaf_margin': a variable length string and it's also a unique and not-nullable column, which describes the type of leaf margin of the plant."


21. The 'plants_leaf_arrangements' table table models a many-to-many relationship between 'plants' and 'leaf_arrangements' table, where, each plant specie can have
multiple leaf arrangement patterns and each leaf arrangement pattern can be assocaited with multiple plants. This table has two columns:
     'plant_id' and 'leaf_arrangement_id':  both are the primary key.
      It also has two foreign key constraints: one 'plant_id' references 'id' column of 'plants' table and 'leaf_arrangement_id' references 'leaf_arrangement_id' column of 'leaf_arrangements' table.
      This table  have unique combination of rows of plant_id and leaf_arrangement_id, and it will also ensure that the values of plant_id and leaf_arrangement_id are also present in the corresponding referenced tables.


22. The 'leaf_arrangements' table is used to store the information about the leaf arrangements of plants, and it has two columns:
    'leaf_arrangement_id': a serial primary key which uniquely identifies each type of leaf arrangement
    'arrangement':a variable length of strings data type and it's also a unique and not-nullable column. I describes the leaf arrangement plants"


23. The 'plants_fruit_sizes' table creates a many-to-many relationship between 'plants' and 'fruit_sizes' table  where, each plants species 
    can have multiple fruit sizes and  each fruit size can be assocaieted with many plants. This table  has two columns:
        'plant_id' and 'fruit_size_id': both are the primary key
        It also has two foreign key constraints: one 'plant_id' references 'id' column of 'plants' table and 'fruit_size_id' references 'id' column of 'fruit_sizes' table
        This table  have unique combination of rows of plant_id and fruit_size_id, and it will also ensure that the values of plant_id and fruit_size_id are also present in the corresponding referenced tables

24. The 'fruit_sizes' table is used to store the information about the size of fruits of each plant species, This table has two columns:
     "id" : a serial primary key that uniquely identifies each type of fruit size.
     "size": a variable length character column and has the unique and not null constraint.  It describes the type of fruit of palnts

25. The 'plants_fruit_shapes' is a bridge table that creates a many to many relationshipo between 'plants' table and 'fruit_shapes' table, and it has two columns:
    The primary key of the table is set to be a composite key consisting of both "plant_id" and "fruit_shape_id" columns
    And there are two foreign keys defined, one for column "plant_id" referencing the "id" column of "plants" table and another for column "fruit_shape_id" referencing the "fruit_shape_id" column of "fruit_shapes" table.
     This table  have unique combination of rows of plant_id and fruit_shape_id, and it will also ensure that the values of plant_id and fruit_shape_id are also present in the corresponding referenced tables

26. The 'fruit_shapes' table  contains information about fruit shapes of various plant species, and it has two columns:
    "fruit_shape_id" :serial" set as the primary key that acts as a unique identifier of each fruit shape.
    "shape" : is a variable length  string column and has the unique and not null constraint. It describes the fruit type of each species

27. The 'plants_insects' table creates a many-to-many relationship between 'plants' and 'insects' table where each plant species can have multiple insects and
 each insect can be found in multiple plant species. This table  has two columns:
    "plant_id" and "insect_id": composite primary key which uniquely identifies records in the table
    There are two foreign keys defined, one for column "plant_id" referencing the "id" column of "plants" table and another for column "insect_id" referencing the "id" column of "insects" table.
    This table  have unique combination of rows of plant_id and insect_id, and it will also ensure that the values of plant_id and insect_id are also present in the corresponding referenced tables.

28. The 'insects' table' table stores  information on insects that were reared from the fruits and it will have five columns:
    'id': a serial primary key column , which will uniquely identify each insect occurences in the table
    'taxon_name': This will be a variable length string column that stores the unique code for each order, and it will be unique and not null constrains
    'species_name': a variable length string column , and which is not null constrain 
    'genus-id': an inatger column that stores the id of genus of insect species
    'family_id': an intager column that stores the id of insect's family
    'order_id': an inatger column that stores the id of insects's order
    This table has three foreign keys defined, one for column "genus_id" referencing the "id" column of "insects_genera" table, one for column "family_id" referencing the "id" column of "insect_families" table,
     and another for column "order_id" referencing the "id" column of "insect_orders" table respectively.

29. The 'insect_orders' table stores record the informstion about the order for each insect and it will have two columns:
    'id': a serail column that will uniquely identify each order of the insect
    'order_name: a variable length string column thet will describe the oder of the insect

30. 'insect_families'
This table will contain information about families of the insects, and it will have three columns:
    'id': a serial primary key to identify each record of family lan
    'family_name': a varying string column that described each insect's family and with not null and unique constraints
    'order_id': foreign key column that refeences the 'id' column in the 'insect_orders' table

31. The 'insect_genera' table stores information about  each genus of the insects, and with three columns:
    "id":a serial primary key to uniquely identify each genus
    "genus_name": a string colum of varying lengths, it is unique and cannot be null
    There is also a foreign key "family_id" that references the "id" column of the "insect_families" table.
     This statement creates the table and the foreign key constraint correctly.

32. The "insect_photos" table contains information about photos of insects where available, and where an insect specie can have 
multiple photos and each photo is associated with only one insect and it has three columns:
    "insect_id" and "photo_id":  inatager columns that are used as a composite primary key, which means
     that the combination of these two values must be unique across the table
    'name': a variable string length column with not null and unique constrains, that records the name of the photo of insect species
    a foreign key "insect_id" that references the "id" column of the "insects" table.
    'sex': a variable field character that stores information about wether the insect is male or female or unknown
    photo id is not null and has unique constrains to establish a one to many relationship between insects tabe and photos table
    a photo can only be for one insect species  but an insect species can have many photos

33. The 'insect_regions' table represent a many-to-many relationship between insects and regions, where one insect can be found in
 multiple regions, and one region can have multiple insects, and it has two columns:
    "insect_id" and "region_id": are used as a composite primary key, which means that the combination of
     these two values must be unique across the table.
     This table has two foreign keys "insect_id" and "region_id" that references the "id" column of the "insects" 
     and "regions" table, respectively.

34. The 'regions' table table store information about regions of occurence of the insects, and it has  two columns:
    "id" : set as a serial primary key
    "region":a string of varying length and cannot be null.

35. The 'Plant_regions' table represent a many-to-many relationship between plants and regions, where one plant can be found in multiple 
regions, and one region can have multiple plants, and it has three columns;
    "plants_id" and "region_id": are used as a composite primary key
    This table has two foreign keys "plants_id" and "region_id" that references the "id" column 
    of the "plants" and "regions" table, respectively.

 */

CREATE TABLE plant_families(
    id serial PRIMARY KEY,
    family_name varchar(50) UNIQUE NOT NULL
);

CREATE TABLE plant_genera(
    id serial PRIMARY KEY,
    genus_name varchar(50) UNIQUE NOT NULL,
    family_id int NOT NULL,
    FOREIGN KEY (family_id) REFERENCES plant_families(id) ON DELETE CASCADE ON UPDATE CASCADE

);
CREATE TABLE plants(
    id serial PRIMARY KEY,
    species_name varchar(110),
    leaf_type varchar(50),
    description varchar,
    max_latitude int,
    min_latitude int,
    genus_id int NOT NULL,
    rbcl varchar,
    matk varchar,
    FOREIGN KEY (genus_id) REFERENCES plant_genera(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE fruit_types(
	fruit_type_id serial PRIMARY KEY,
	type_of_fruit varchar (50) UNIQUE NOT NULL,
    fruit_type_description varchar
);


CREATE TABLE plants_fruit_types(
    plant_id int,
    fruit_type_id int,
    PRIMARY KEY (plant_id,fruit_type_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fruit_type_id) REFERENCES fruit_types(fruit_type_id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE latex(
        fruit_latex_id serial PRIMARY KEY,
        latex_description varchar (10) UNIQUE NOT NULL 
);

CREATE TABLE plants_latex(
    plant_id int,
    fruit_latex_id int,
    PRIMARY KEY (plant_id,fruit_latex_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fruit_latex_id) REFERENCES latex(fruit_latex_id) ON DELETE CASCADE ON UPDATE CASCADE


);

CREATE TABLE shrub_climbings(
        id serial PRIMARY KEY,
        tree_type varchar (10) UNIQUE NOT NULL 
);

CREATE TABLE plants_shrub_climbings(
    plant_id int,
    shrub_id int,
    PRIMARY KEY (plant_id,shrub_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (shrub_id) REFERENCES shrub_climbings(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE woody_herbaceous(
        id  serial PRIMARY KEY,
        type_of_stem varchar (10) UNIQUE NOT NULL 
);

CREATE TABLE plants_woody_herbaceous(
    plant_id int,
    back_id int,
    PRIMARY KEY(plant_id,back_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (back_id) REFERENCES woody_herbaceous(id) ON DELETE CASCADE ON UPDATE CASCADE


);


CREATE TABLE spines_thorns(
        thorn_id serial PRIMARY KEY,
        thorns_spines varchar (10) UNIQUE NOT NULL 
);

CREATE TABLE plants_spines_thorns(
    plant_id int,
    thorn_id int,
   PRIMARY KEY(plant_id,thorn_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (thorn_id) REFERENCES spines_thorns(thorn_id) ON DELETE CASCADE ON UPDATE CASCADE


);

CREATE TABLE fruiting_months(
        fruiting_month_id serial PRIMARY KEY,
        month varchar (10) UNIQUE NOT NULL 
);


CREATE TABLE plants_fruiting_months(
    plant_id int,
    fruiting_month_id int,
    PRIMARY KEY (plant_id,fruiting_month_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fruiting_month_id) REFERENCES fruiting_months(fruiting_month_id) ON DELETE CASCADE ON UPDATE CASCADE


);

CREATE TABLE plants_photos(
	plant_id int,
    	photo_id int UNIQUE,
	photo_name varchar (10) UNIQUE NOT NULL,
        PRIMARY KEY (plant_id,photo_id),
  	FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE fruit_colors(
        color_id  serial PRIMARY KEY,
        color varchar (20) UNIQUE NOT NULL 
);

CREATE TABLE plants_fruit_colors(
    plant_id int,
    color_id int,
    PRIMARY KEY (plant_id,color_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (color_id) REFERENCES fruit_colors(color_id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE leaf_margins(
        leaf_margin_id  serial PRIMARY KEY,
        type_of_leaf_margin varchar (20) UNIQUE NOT NULL 
);

CREATE TABLE plants_leaf_margins(
    plant_id int ,
    leaf_margin_id int,
    PRIMARY KEY (plant_id,leaf_margin_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (leaf_margin_id) REFERENCES leaf_margins(leaf_margin_id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE leaf_arrangements(
        leaf_arrangement_id serial PRIMARY KEY,
        arrangement varchar (20) UNIQUE NOT NULL 
);

CREATE TABLE plants_leaf_arrangements(
    plant_id int,
    leaf_arrangement_id int,
    PRIMARY KEY (plant_id, leaf_arrangement_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (leaf_arrangement_id) REFERENCES leaf_arrangements(leaf_arrangement_id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE fruit_sizes(
        id serial PRIMARY KEY,
        size varchar (15) UNIQUE NOT NULL 
);

CREATE TABLE plants_fruit_sizes(
    plant_id int,
    fruit_size_id int,
    PRIMARY KEY (plant_id, fruit_size_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fruit_size_id) REFERENCES fruit_sizes(id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE fruit_shapes(
        fruit_shape_id serial PRIMARY KEY,
        shape varchar (20) UNIQUE NOT NULL 
);

CREATE TABLE plants_fruit_shapes(
    plant_id int,
    fruit_shape_id int,
    PRIMARY KEY (plant_id, fruit_shape_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (fruit_shape_id) REFERENCES fruit_shapes(fruit_shape_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE insect_orders(
        id serial PRIMARY KEY,
        order_name varchar (20) UNIQUE NOT NULL
);

CREATE TABLE insect_families(
        id serial PRIMARY KEY,
        family_name varchar(50) UNIQUE
);

CREATE TABLE insect_genera(
        id serial PRIMARY KEY,
        genus_name varchar (50) UNIQUE
);

CREATE TABLE insect_sub_families(
        id serial PRIMARY KEY,
        sub_family_name varchar (50) UNIQUE
);

CREATE TABLE insects(
        id serial PRIMARY KEY,
        unique_code varchar(30) UNIQUE,
        species_name varchar (100), 
        genus_id int,
	sub_family_id int,
        family_id int,
        order_id int,
        FOREIGN KEY (genus_id) REFERENCES insect_genera(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (family_id) REFERENCES insect_families(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (order_id) REFERENCES insect_orders(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (sub_family_id) REFERENCES insect_sub_families(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE plants_insects(
    plant_id int,
    insect_id int,
    PRIMARY KEY (plant_id, insect_id),
    FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (insect_id) REFERENCES insects(id) ON DELETE CASCADE ON UPDATE CASCADE

);


CREATE TABLE insect_photos(
        insect_id int,
        photo_id  varchar(10) UNIQUE,
        sex varchar(30),
	PRIMARY KEY (insect_id,photo_id),
        FOREIGN KEY (insect_id) REFERENCES insects(id) ON DELETE CASCADE ON UPDATE CASCADE

);

CREATE TABLE regions(
        id serial PRIMARY KEY,
        region varchar(50) NOT NULL ,
        latitude varchar(10),
        longitude varchar(10)
);


CREATE TABLE insects_regions(
    insect_id int,
	region_id int,
	PRIMARY KEY (insect_id,region_id),
    FOREIGN KEY (insect_id) REFERENCES insects(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (region_id) REFERENCES regions(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE plants_regions(
    plants_id int,
	region_id int,
	PRIMARY KEY (plants_id,region_id),
    	FOREIGN KEY (plants_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (region_id) REFERENCES regions(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE k_sectors(
        k_sector_id serial PRIMARY KEY,
        sector varchar(10) NOT NULL 
);

CREATE TABLE plants_k_sectors(
    	plant_id int,
        k_sector_id int,
        PRIMARY KEY (plant_id,k_sector_id),
    	FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (k_sector_id) REFERENCES k_sectors(k_sector_id) ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE ukwf_areas(
        ukwf_area_id serial PRIMARY KEY,
        ukwf_area varchar(10) NOT NULL 
);


CREATE TABLE plants_ukwf_areas(
        plant_id int,
        ukwf_area_id int,
        PRIMARY KEY (plant_id,ukwf_area_id),
    	FOREIGN KEY (plant_id) REFERENCES plants(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (ukwf_area_id) REFERENCES ukwf_areas(ukwf_area_id) ON DELETE CASCADE ON UPDATE CASCADE
);

