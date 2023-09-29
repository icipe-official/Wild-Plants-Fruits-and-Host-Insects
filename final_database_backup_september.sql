--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Ubuntu 15.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.4 (Ubuntu 15.4-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password_salt character varying(128) NOT NULL,
    hashed_password character varying(128) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO postgres;

--
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- Name: fruit_colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fruit_colors (
    color_id integer NOT NULL,
    color character varying(20) NOT NULL
);


ALTER TABLE public.fruit_colors OWNER TO postgres;

--
-- Name: fruit_colors_color_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fruit_colors_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fruit_colors_color_id_seq OWNER TO postgres;

--
-- Name: fruit_colors_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fruit_colors_color_id_seq OWNED BY public.fruit_colors.color_id;


--
-- Name: fruit_shapes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fruit_shapes (
    fruit_shape_id integer NOT NULL,
    shape character varying(20) NOT NULL,
    fruit_shape_description character varying
);


ALTER TABLE public.fruit_shapes OWNER TO postgres;

--
-- Name: fruit_shapes_fruit_shape_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fruit_shapes_fruit_shape_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fruit_shapes_fruit_shape_id_seq OWNER TO postgres;

--
-- Name: fruit_shapes_fruit_shape_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fruit_shapes_fruit_shape_id_seq OWNED BY public.fruit_shapes.fruit_shape_id;


--
-- Name: fruit_sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fruit_sizes (
    id integer NOT NULL,
    size character varying(15) NOT NULL
);


ALTER TABLE public.fruit_sizes OWNER TO postgres;

--
-- Name: fruit_sizes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fruit_sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fruit_sizes_id_seq OWNER TO postgres;

--
-- Name: fruit_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fruit_sizes_id_seq OWNED BY public.fruit_sizes.id;


--
-- Name: fruit_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fruit_types (
    fruit_type_id integer NOT NULL,
    type_of_fruit character varying(50) NOT NULL,
    fruit_type_description character varying
);


ALTER TABLE public.fruit_types OWNER TO postgres;

--
-- Name: fruit_types_fruit_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fruit_types_fruit_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fruit_types_fruit_type_id_seq OWNER TO postgres;

--
-- Name: fruit_types_fruit_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fruit_types_fruit_type_id_seq OWNED BY public.fruit_types.fruit_type_id;


--
-- Name: fruit_types_glossary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fruit_types_glossary (
    fruit_id integer NOT NULL,
    photo_id character varying(10) NOT NULL
);


ALTER TABLE public.fruit_types_glossary OWNER TO postgres;

--
-- Name: fruiting_months; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fruiting_months (
    fruiting_month_id integer NOT NULL,
    month character varying(10) NOT NULL
);


ALTER TABLE public.fruiting_months OWNER TO postgres;

--
-- Name: fruiting_months_fruiting_month_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fruiting_months_fruiting_month_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fruiting_months_fruiting_month_id_seq OWNER TO postgres;

--
-- Name: fruiting_months_fruiting_month_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fruiting_months_fruiting_month_id_seq OWNED BY public.fruiting_months.fruiting_month_id;


--
-- Name: glossary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.glossary (
    glossary_id integer NOT NULL,
    glossary_type character varying(50),
    glossary_term character varying(50),
    glossary_description character varying(500)
);


ALTER TABLE public.glossary OWNER TO postgres;

--
-- Name: glossary_photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.glossary_photos (
    glossary_id integer NOT NULL,
    photo_id integer NOT NULL
);


ALTER TABLE public.glossary_photos OWNER TO postgres;

--
-- Name: insect_families; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insect_families (
    id integer NOT NULL,
    family_name character varying(50)
);


ALTER TABLE public.insect_families OWNER TO postgres;

--
-- Name: insect_families_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insect_families_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insect_families_id_seq OWNER TO postgres;

--
-- Name: insect_families_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insect_families_id_seq OWNED BY public.insect_families.id;


--
-- Name: insect_genera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insect_genera (
    id integer NOT NULL,
    genus_name character varying(50)
);


ALTER TABLE public.insect_genera OWNER TO postgres;

--
-- Name: insect_genera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insect_genera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insect_genera_id_seq OWNER TO postgres;

--
-- Name: insect_genera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insect_genera_id_seq OWNED BY public.insect_genera.id;


--
-- Name: insect_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insect_orders (
    id integer NOT NULL,
    order_name character varying(20) NOT NULL
);


ALTER TABLE public.insect_orders OWNER TO postgres;

--
-- Name: insect_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insect_orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insect_orders_id_seq OWNER TO postgres;

--
-- Name: insect_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insect_orders_id_seq OWNED BY public.insect_orders.id;


--
-- Name: insect_photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insect_photos (
    insect_id integer NOT NULL,
    photo_id character varying(10) NOT NULL,
    sex character varying(30)
);


ALTER TABLE public.insect_photos OWNER TO postgres;

--
-- Name: insect_sub_families; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insect_sub_families (
    id integer NOT NULL,
    sub_family_name character varying(50)
);


ALTER TABLE public.insect_sub_families OWNER TO postgres;

--
-- Name: insect_sub_families_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insect_sub_families_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insect_sub_families_id_seq OWNER TO postgres;

--
-- Name: insect_sub_families_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insect_sub_families_id_seq OWNED BY public.insect_sub_families.id;


--
-- Name: insects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insects (
    id integer NOT NULL,
    unique_code character varying(30),
    species_name character varying(100),
    genus_id integer,
    sub_family_id integer,
    family_id integer,
    order_id integer
);


ALTER TABLE public.insects OWNER TO postgres;

--
-- Name: insects_coi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insects_coi (
    coi_id integer NOT NULL,
    insect_id integer NOT NULL,
    country character varying,
    genbank_accession character varying,
    nucleotide character varying,
    bold_id character varying
);


ALTER TABLE public.insects_coi OWNER TO postgres;

--
-- Name: insects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insects_id_seq OWNER TO postgres;

--
-- Name: insects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insects_id_seq OWNED BY public.insects.id;


--
-- Name: insects_regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insects_regions (
    insect_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.insects_regions OWNER TO postgres;

--
-- Name: k_sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.k_sectors (
    k_sector_id integer NOT NULL,
    sector character varying(10) NOT NULL
);


ALTER TABLE public.k_sectors OWNER TO postgres;

--
-- Name: k_sectors_k_sector_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.k_sectors_k_sector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.k_sectors_k_sector_id_seq OWNER TO postgres;

--
-- Name: k_sectors_k_sector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.k_sectors_k_sector_id_seq OWNED BY public.k_sectors.k_sector_id;


--
-- Name: latex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.latex (
    fruit_latex_id integer NOT NULL,
    latex_description character varying(10) NOT NULL
);


ALTER TABLE public.latex OWNER TO postgres;

--
-- Name: latex_fruit_latex_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.latex_fruit_latex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.latex_fruit_latex_id_seq OWNER TO postgres;

--
-- Name: latex_fruit_latex_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.latex_fruit_latex_id_seq OWNED BY public.latex.fruit_latex_id;


--
-- Name: leaf_arrangements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leaf_arrangements (
    leaf_arrangement_id integer NOT NULL,
    arrangement character varying(20) NOT NULL
);


ALTER TABLE public.leaf_arrangements OWNER TO postgres;

--
-- Name: leaf_arrangements_leaf_arrangement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leaf_arrangements_leaf_arrangement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leaf_arrangements_leaf_arrangement_id_seq OWNER TO postgres;

--
-- Name: leaf_arrangements_leaf_arrangement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leaf_arrangements_leaf_arrangement_id_seq OWNED BY public.leaf_arrangements.leaf_arrangement_id;


--
-- Name: leaf_margins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leaf_margins (
    leaf_margin_id integer NOT NULL,
    type_of_leaf_margin character varying(20) NOT NULL
);


ALTER TABLE public.leaf_margins OWNER TO postgres;

--
-- Name: leaf_margins_leaf_margin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.leaf_margins_leaf_margin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leaf_margins_leaf_margin_id_seq OWNER TO postgres;

--
-- Name: leaf_margins_leaf_margin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.leaf_margins_leaf_margin_id_seq OWNED BY public.leaf_margins.leaf_margin_id;


--
-- Name: plant_coordinates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_coordinates (
    plant_id integer NOT NULL,
    latitude character varying NOT NULL,
    longitude character varying NOT NULL
);


ALTER TABLE public.plant_coordinates OWNER TO postgres;

--
-- Name: plant_families; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_families (
    id integer NOT NULL,
    family_name character varying(50) NOT NULL
);


ALTER TABLE public.plant_families OWNER TO postgres;

--
-- Name: plant_families_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plant_families_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plant_families_id_seq OWNER TO postgres;

--
-- Name: plant_families_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plant_families_id_seq OWNED BY public.plant_families.id;


--
-- Name: plant_families_newick; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_families_newick (
    id integer NOT NULL,
    family_name character varying(50),
    matk_newick character varying
);


ALTER TABLE public.plant_families_newick OWNER TO postgres;

--
-- Name: plant_genera; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plant_genera (
    id integer NOT NULL,
    genus_name character varying(50) NOT NULL,
    family_id integer NOT NULL
);


ALTER TABLE public.plant_genera OWNER TO postgres;

--
-- Name: plant_genera_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plant_genera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plant_genera_id_seq OWNER TO postgres;

--
-- Name: plant_genera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plant_genera_id_seq OWNED BY public.plant_genera.id;


--
-- Name: plants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants (
    id integer NOT NULL,
    species_name character varying(110),
    leaf_type character varying(50),
    plant_description character varying,
    max_latitude integer,
    min_latitude integer,
    genus_id integer NOT NULL
);


ALTER TABLE public.plants OWNER TO postgres;

--
-- Name: plants_fruit_colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_fruit_colors (
    plant_id integer NOT NULL,
    color_id integer NOT NULL
);


ALTER TABLE public.plants_fruit_colors OWNER TO postgres;

--
-- Name: plants_fruit_shapes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_fruit_shapes (
    plant_id integer NOT NULL,
    fruit_shape_id integer NOT NULL
);


ALTER TABLE public.plants_fruit_shapes OWNER TO postgres;

--
-- Name: plants_fruit_sizes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_fruit_sizes (
    plant_id integer NOT NULL,
    fruit_size_id integer NOT NULL
);


ALTER TABLE public.plants_fruit_sizes OWNER TO postgres;

--
-- Name: plants_fruit_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_fruit_types (
    plant_id integer NOT NULL,
    fruit_type_id integer NOT NULL
);


ALTER TABLE public.plants_fruit_types OWNER TO postgres;

--
-- Name: plants_fruiting_months; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_fruiting_months (
    plant_id integer NOT NULL,
    fruiting_month_id integer NOT NULL
);


ALTER TABLE public.plants_fruiting_months OWNER TO postgres;

--
-- Name: plants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plants_id_seq OWNER TO postgres;

--
-- Name: plants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plants_id_seq OWNED BY public.plants.id;


--
-- Name: plants_insects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_insects (
    plant_id integer NOT NULL,
    insect_id integer NOT NULL
);


ALTER TABLE public.plants_insects OWNER TO postgres;

--
-- Name: plants_k_sectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_k_sectors (
    plant_id integer NOT NULL,
    k_sector_id integer NOT NULL
);


ALTER TABLE public.plants_k_sectors OWNER TO postgres;

--
-- Name: plants_latex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_latex (
    plant_id integer NOT NULL,
    fruit_latex_id integer NOT NULL
);


ALTER TABLE public.plants_latex OWNER TO postgres;

--
-- Name: plants_leaf_arrangements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_leaf_arrangements (
    plant_id integer NOT NULL,
    leaf_arrangement_id integer NOT NULL
);


ALTER TABLE public.plants_leaf_arrangements OWNER TO postgres;

--
-- Name: plants_leaf_margins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_leaf_margins (
    plant_id integer NOT NULL,
    leaf_margin_id integer NOT NULL
);


ALTER TABLE public.plants_leaf_margins OWNER TO postgres;

--
-- Name: plants_matk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_matk (
    matk_id integer NOT NULL,
    plant_id integer NOT NULL,
    nucleotide character varying,
    country character varying,
    genbank_accession character varying,
    bold_id character varying
);


ALTER TABLE public.plants_matk OWNER TO postgres;

--
-- Name: plants_photos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_photos (
    plant_id integer NOT NULL,
    photo_name character varying(100) NOT NULL,
    photo_id integer NOT NULL
);


ALTER TABLE public.plants_photos OWNER TO postgres;

--
-- Name: plants_photos_photo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plants_photos_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plants_photos_photo_id_seq OWNER TO postgres;

--
-- Name: plants_photos_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plants_photos_photo_id_seq OWNED BY public.plants_photos.photo_id;


--
-- Name: plants_rbcl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_rbcl (
    rbcl_id integer NOT NULL,
    plant_id integer,
    nucleotide character varying,
    country character varying,
    genebank_accesion character varying
);


ALTER TABLE public.plants_rbcl OWNER TO postgres;

--
-- Name: plants_regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_regions (
    plants_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.plants_regions OWNER TO postgres;

--
-- Name: plants_shrub_climbings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_shrub_climbings (
    plant_id integer NOT NULL,
    shrub_id integer NOT NULL
);


ALTER TABLE public.plants_shrub_climbings OWNER TO postgres;

--
-- Name: plants_spines_thorns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_spines_thorns (
    plant_id integer NOT NULL,
    thorn_id integer NOT NULL
);


ALTER TABLE public.plants_spines_thorns OWNER TO postgres;

--
-- Name: plants_ukwf_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_ukwf_areas (
    plant_id integer NOT NULL,
    ukwf_area_id integer NOT NULL
);


ALTER TABLE public.plants_ukwf_areas OWNER TO postgres;

--
-- Name: plants_woody_herbaceous; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plants_woody_herbaceous (
    plant_id integer NOT NULL,
    back_id integer NOT NULL
);


ALTER TABLE public.plants_woody_herbaceous OWNER TO postgres;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    region character varying(50) NOT NULL,
    latitude character varying(10),
    longitude character varying(10)
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO postgres;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: shrub_climbings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shrub_climbings (
    id integer NOT NULL,
    tree_type character varying(10) NOT NULL
);


ALTER TABLE public.shrub_climbings OWNER TO postgres;

--
-- Name: shrub_climbings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shrub_climbings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shrub_climbings_id_seq OWNER TO postgres;

--
-- Name: shrub_climbings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shrub_climbings_id_seq OWNED BY public.shrub_climbings.id;


--
-- Name: spines_thorns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spines_thorns (
    thorn_id integer NOT NULL,
    thorns_spines character varying(10) NOT NULL
);


ALTER TABLE public.spines_thorns OWNER TO postgres;

--
-- Name: spines_thorns_thorn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.spines_thorns_thorn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spines_thorns_thorn_id_seq OWNER TO postgres;

--
-- Name: spines_thorns_thorn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.spines_thorns_thorn_id_seq OWNED BY public.spines_thorns.thorn_id;


--
-- Name: ukwf_areas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ukwf_areas (
    ukwf_area_id integer NOT NULL,
    ukwf_area character varying(10) NOT NULL
);


ALTER TABLE public.ukwf_areas OWNER TO postgres;

--
-- Name: ukwf_areas_ukwf_area_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ukwf_areas_ukwf_area_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ukwf_areas_ukwf_area_id_seq OWNER TO postgres;

--
-- Name: ukwf_areas_ukwf_area_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ukwf_areas_ukwf_area_id_seq OWNED BY public.ukwf_areas.ukwf_area_id;


--
-- Name: woody_herbaceous; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.woody_herbaceous (
    id integer NOT NULL,
    type_of_stem character varying(10) NOT NULL
);


ALTER TABLE public.woody_herbaceous OWNER TO postgres;

--
-- Name: woody_herbaceous_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.woody_herbaceous_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.woody_herbaceous_id_seq OWNER TO postgres;

--
-- Name: woody_herbaceous_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.woody_herbaceous_id_seq OWNED BY public.woody_herbaceous.id;


--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- Name: fruit_colors color_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_colors ALTER COLUMN color_id SET DEFAULT nextval('public.fruit_colors_color_id_seq'::regclass);


--
-- Name: fruit_shapes fruit_shape_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_shapes ALTER COLUMN fruit_shape_id SET DEFAULT nextval('public.fruit_shapes_fruit_shape_id_seq'::regclass);


--
-- Name: fruit_sizes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_sizes ALTER COLUMN id SET DEFAULT nextval('public.fruit_sizes_id_seq'::regclass);


--
-- Name: fruit_types fruit_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_types ALTER COLUMN fruit_type_id SET DEFAULT nextval('public.fruit_types_fruit_type_id_seq'::regclass);


--
-- Name: fruiting_months fruiting_month_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruiting_months ALTER COLUMN fruiting_month_id SET DEFAULT nextval('public.fruiting_months_fruiting_month_id_seq'::regclass);


--
-- Name: insect_families id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_families ALTER COLUMN id SET DEFAULT nextval('public.insect_families_id_seq'::regclass);


--
-- Name: insect_genera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_genera ALTER COLUMN id SET DEFAULT nextval('public.insect_genera_id_seq'::regclass);


--
-- Name: insect_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_orders ALTER COLUMN id SET DEFAULT nextval('public.insect_orders_id_seq'::regclass);


--
-- Name: insect_sub_families id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_sub_families ALTER COLUMN id SET DEFAULT nextval('public.insect_sub_families_id_seq'::regclass);


--
-- Name: insects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects ALTER COLUMN id SET DEFAULT nextval('public.insects_id_seq'::regclass);


--
-- Name: k_sectors k_sector_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.k_sectors ALTER COLUMN k_sector_id SET DEFAULT nextval('public.k_sectors_k_sector_id_seq'::regclass);


--
-- Name: latex fruit_latex_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.latex ALTER COLUMN fruit_latex_id SET DEFAULT nextval('public.latex_fruit_latex_id_seq'::regclass);


--
-- Name: leaf_arrangements leaf_arrangement_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaf_arrangements ALTER COLUMN leaf_arrangement_id SET DEFAULT nextval('public.leaf_arrangements_leaf_arrangement_id_seq'::regclass);


--
-- Name: leaf_margins leaf_margin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaf_margins ALTER COLUMN leaf_margin_id SET DEFAULT nextval('public.leaf_margins_leaf_margin_id_seq'::regclass);


--
-- Name: plant_families id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_families ALTER COLUMN id SET DEFAULT nextval('public.plant_families_id_seq'::regclass);


--
-- Name: plant_genera id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_genera ALTER COLUMN id SET DEFAULT nextval('public.plant_genera_id_seq'::regclass);


--
-- Name: plants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants ALTER COLUMN id SET DEFAULT nextval('public.plants_id_seq'::regclass);


--
-- Name: plants_photos photo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_photos ALTER COLUMN photo_id SET DEFAULT nextval('public.plants_photos_photo_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: shrub_climbings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shrub_climbings ALTER COLUMN id SET DEFAULT nextval('public.shrub_climbings_id_seq'::regclass);


--
-- Name: spines_thorns thorn_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spines_thorns ALTER COLUMN thorn_id SET DEFAULT nextval('public.spines_thorns_thorn_id_seq'::regclass);


--
-- Name: ukwf_areas ukwf_area_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ukwf_areas ALTER COLUMN ukwf_area_id SET DEFAULT nextval('public.ukwf_areas_ukwf_area_id_seq'::regclass);


--
-- Name: woody_herbaceous id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.woody_herbaceous ALTER COLUMN id SET DEFAULT nextval('public.woody_herbaceous_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, username, password_salt, hashed_password) FROM stdin;
1	copeland	$2a$06$4BfWmu8Ge7GdX.AMuhZwh.	$2a$06$MucVU1JkhP0d9E3Lx16V2uS3VFchS1UCD.3pmgq.UAz19yJgjpLAu
\.


--
-- Data for Name: fruit_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fruit_colors (color_id, color) FROM stdin;
1	pink
2	yellow
3	golden
4	greenish-yellow
5	green
6	purple
7	greenish-brown
8	brown
9	red
10	black
11	red brown
12	yelow
13	white-green
14	white
15	unknown
16	grey
17	orange
18	blue
\.


--
-- Data for Name: fruit_shapes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fruit_shapes (fruit_shape_id, shape, fruit_shape_description) FROM stdin;
1	discoidal	\N
2	elliptic	\N
3	inflated	\N
4	5-angled	\N
5	flat	\N
6	cylindrical	\N
7	round	\N
8	ellipsoid	more or less flattened sphere
9	4-lobed	4 seeded, Grewia tenax
10	angled	\N
11	heart-shaped	\N
12	2-lobed	two-seeded
13	depressed globose	\N
14	oblong	more or less elongate with (sub)parallel sides
15	ovoid	egg-shaped
16	beaked	\N
17	tri-locular	\N
18	kidney-shaped	\N
19	winged	\N
20	lobed	\N
21	pyramidal	\N
22	subglobose	nearly round
23	rhombic	\N
24	crescent	\N
25	conicovoid	Magadi Fabaceae
26	3-angled	\N
27	obconical	\N
28	star	\N
29	torulose	constricted between the seeds
30	globose	round, spherical
31	oblique	\N
32	conical	\N
33	linear	\N
34	ridged	\N
35	3-locular	of a capsule, splitting into 3 parts
36	tapering	narrowing toward the apex
37	pointed	\N
38	elongate	\N
39	4-angled	\N
40	horned	\N
41	fusiform	tapering at both ends
42	curved	\N
43	3-lobed	3-seeded, Sansevieria
44	obovoid	inversely egg-shaped
45	unknown	\N
46	obconic	\N
47	assymetrical	\N
\.


--
-- Data for Name: fruit_sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fruit_sizes (id, size) FROM stdin;
1	less than 10 mm
2	10-15 mm
3	15-25 mm
4	25-40mm
5	more than 40 mm
\.


--
-- Data for Name: fruit_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fruit_types (fruit_type_id, type_of_fruit, fruit_type_description) FROM stdin;
1	achene	a single, very small, dry fruit
2	multiple	consisting of many smaller aggregated fruits
3	legume	usually dry fruit splitting open along two sides
4	capsule	usually dry and dehiscent (splitting open)
5	unknown	\N
6	fleshy seed	\N
7	fig	multiple fruit contained inside a membranous cover
8	carpel	\N
9	syncarp	fleshy fruit arising from multiple female reproductive units (usually referring to the Annonaceae)
10	berry	fleshy fruit with one or more non-stony seeds, Jasminum fluminense
11	mericarp	\N
12	drupe	fleshy fruit with one or more stony seeds
13	inflated	\N
14	etaerio	\N
15	nutlet	\N
16	syconium	\N
17	follicle	dry fruit splitting open along one side
18	nut	dry, woody, single indehiscent fruit
19	monocarps	fleshy fruit arising from a single female reproductive unit (usually referring to the Annonaceae)
20	pod	usually dry fruit splitting open along two sides
\.


--
-- Data for Name: fruit_types_glossary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fruit_types_glossary (fruit_id, photo_id) FROM stdin;
\.


--
-- Data for Name: fruiting_months; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fruiting_months (fruiting_month_id, month) FROM stdin;
1	FEB
2	DEC
3	JAN
4	JULY
5	SEP
6	NOV
7	unknown
8	APR
9	MAY
10	OCT
11	MARCH
12	AUG
13	JUNE
\.


--
-- Data for Name: glossary; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.glossary (glossary_id, glossary_type, glossary_term, glossary_description) FROM stdin;
1	fruit_type	Achene	a single, very small, dry fruit
2	fruit_type	Berry	fleshy fruit with one or more non-stony seeds
3	fruit_type	Capsule	usually dry and dehiscent (splitting open)
4	fruit_type	Drupe	fleshy fruit with one or more stony seeds
5	fruit_type	Follicle	dry fruit splitting open along one side
6	fruit_type	Pod	(or legume)usually dry fruit splitting open along two sides
7	fruit_type	Syconium	(fig)multiple fruit contained inside a membranous cover
8	fruit_type	Nut	dry, woody, single indehiscent fruit
9	fruit_type	Monocarp	fleshy fruit arising from a single female reproductive unit (usually referring to the Annonaceae)
10	fruit_type	Syncarp	fleshy fruit arising from multiple female reproductive units (usually referring to the Annonaceae)
11	fruit_type	Multiple	consisting of many smaller aggregated fruits
12	fruit_shape	Globose	round, spherical
13	fruit_shape	Ellipsoid	more or less flattened sphere
14	fruit_shape	Cylindrical	\N
15	fruit_shape	Obovoid	inversely egg-shaped
16	fruit_shape	Ovoid	egg-shaped
17	fruit_shape	Subglobose	nearly round
18	fruit_shape	Torulose	constricted between the seeds
19	fruit_shape	Oblong	more or less elongate with (sub)parallel sides
20	fruit_shape	Fusiform	tapering at both ends
21	fruit_shape	Heart-shaped	\N
22	fruit_shape	2-lobed	two-seeded
23	fruit_shape	3-lobed	3-seeded, Sansevieria
24	fruit_shape	4-lobed	4 seeded, Grewia tenax
25	fruit_shape	asymmetrical	\N
26	fruit_shape	Tapering	narrowing toward the apex
27	fruit_shape	3-locular	of a capsule, splitting into 3 parts
28	fruit_shape	Crescentic	Magadi Fabaceae
29	fruit_location	Axillary	originating from the leaf axil
30	fruit_location	Extra-axillary	originating along a stem away from a leaf axil
31	fruit_location	Terminal	originating at the end of a stem
32	fruit_location	Caulicarpy	As for the flower (cauliflory), fruiting on trunk or old wood
33	other_fruit_features	Lenticellate	\N
34	other_fruit_features	Aril	outer covering of a seed, usually in dehiscent capsules, brightly colored and attractive as food to birds
35	other_fruit_features	Beaked	with a, more or less, long apical projection of a fruit
36	other_fruit_features	Ridged	\N
37	other_fruit_features	Winged	\N
38	other_fruit_features	Calyx persistent	sepals retained (usually dry) on fruit; may be at base or, less commonly, at apex of fruit depending on ovary type
39	other_fruit_features	Style persistent	part of female reproductive organ retained on fruit, usually as a slender, apical extension
40	other_fruit_features	Glandular	with glands
41	other_fruit_features	Hairs	\N
42	other_fruit_features	Verrucose	with small bumpy projections, 01073, Boscia (Magadi
43	other_fruit_features	Inflated	\N
44	other_fruit_features	Dehiscent	splitting open
45	other_fruit_features	Wrinkled	\N
46	other_fruit_features	With surface processes	\N
47	leaf_type	Simple	composed of a single leaflet
48	leaf_type	Compound	composed of 2 or more leaflets
49	compund_eaf_type	2-foliolate (bifoliolate)	with two leaflets
50	compund_eaf_type	3-foliolate (trifoliolate)	with three leaflets
51	compund_eaf_type	Digitate	Similar to palmate (see next entry) but with narrower finger-like leaflets; the difference between this and the palmate condition is often obscure
52	compund_eaf_type	Palmate	leaflets arising from the same point at the end of the leaf stalk
53	compund_eaf_type	Imparipinnate	terminal leaflet unpaired (i.e., with an odd number of leaflets
54	compund_eaf_type	Paripinnate	terminal leaflet paired (i.e., with an even number of leaflets)
55	compund_eaf_type	Bipinnate	twice pinnate
56	leaf_arrangement	Opposite	leaves opposite each other along stem
57	leaf_arrangement	Alternate	leaves not opposite each other
58	leaf_arrangement	Clustered	leaves bunched together
59	leaf_arrangement	Fasciculate	leaves bunched together on a short branch (spur)
60	leaf_arrangement	Whorled	leaves in a bunch encircling the stem
61	leaf_base	Cordate	heart-shaped
62	leaf_base	Elliptic	more or less flattened circle
63	leaf_base	Lanceolate	shaped like a spearhead
64	leaf_base	Linear	\N
65	leaf_base	Lorate	Strap-like
66	leaf_base	Ovate	egg-shaped
67	leaf_base	Obovate	inversely egg-shaped
68	leaf_base	Asymmetrical (oblique)	uneven on either side of the petiole
69	leaf_base	Attenuate	drawn out narrowly toward the base
70	leaf_base	Auriculate	shaped like an ear; deeply and curvaceously incised
71	leaf_base	Cordate	incised
72	leaf_base	Cuneate	wedge-shaped
73	leaf_base	Obtuse	blunt
74	leaf_base	Rounded	\N
75	leaf_base	Subcordate	slightly cordate
76	leaf_base	Truncate	straight appearing cut off
77	leaf_let_margin	Acute	abruptly pointed
78	leaf_let_margin	Acuminate	narrowing to a point
79	leaf_let_margin	Cirrhose	markedly curled
80	leaf_let_margin	Emarginate	indented
81	leaf_let_margin	Mucronate	ending in a short hard sharp point
82	leaf_let_margin	Obtuse	blunt
83	leaf_let_margin	Rounded	\N
84	leaf_let_margin	Entire	margin smooth
85	leaf_let_margin	Crenate	with rounded projections
86	leaf_let_margin	Dentate	with tooth-like projections, pointing, more or less, straight out
87	leaf_let_margin	Lobed	with (usually) large, rounded divisions or indentations
88	leaf_let_margin	Serrate	with saw-tooth-like projections, pointing forward
89	leaf_let_margin	Spinulose	bearing small, innocuous spines
90	leaf_let_margin	Spiny	bearing sharp, hard spines
91	other_leaf_features	Domatium(-a)	depression or cavity, usually at base of leaf veins on lower surface, sheltering mites or insects
92	other_leaf_features	Leaf tendril	modified, grasping, leaf tip
93	other_leaf_features	Nodules	small round or short, linear structures on the leaves of some plants (particularly Rubiaceae)
94	other_leaf_features	Peltate	leaf stalk attached above base of leaf blade
95	other_leaf_features	Winged rachis	n compound leaves, when the continuation of the leaf stalk past the point of attachment of the first leaflet(s) is flattened and extended laterally
96	other_leaf_features	Rugose	extensively wavy or wrinkled on the leaf surface
97	other_plant_features	Simple tendril	thin, thread-like, twining process from stem; allowing plant to climb
98	other_plant_features	Forked tendril	tendril splitting
99	other_plant_features	Prickle	sharp outgrowth from plant tissue; not originating at leaf base or leaf node
100	other_plant_features	Spine	sharp, woody outgrowth of a leaf
101	other_plant_features	Interpetiolar stipule	leafy growth, usually small, arising between the bases of the opposing petioles (leaf stalks); commonly associated with the Rubiaceae
\.


--
-- Data for Name: glossary_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.glossary_photos (glossary_id, photo_id) FROM stdin;
\.


--
-- Data for Name: insect_families; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insect_families (id, family_name) FROM stdin;
1	Braconidae
2	Curculionidae
3	Chrysomelidae
4	Alucitidae
5	Histeridae
6	Anthribidae
7	Apionidae
8	Eulophidae
9	Blastobasidae
10	Tephritidae
11	Ichneumonidae
12	Encyrtidae
13	Nitidulidae
14	Eurytomidae
15	nan
16	Carposinidae
17	Crambidae
18	Chalcididae
19	Cosmopterigidae ?
20	Nanophyidae
21	Anisopodidae
22	Chloropidae
23	Diopsidae
24	Heleomyzidae
25	Diapriidae
26	Lauxaniidae
27	Lonchaeidae
28	Muscidae
29	Mycetophilidae
30	Neriidae
31	Dryophthoridae
32	Solvidae
33	Stratiomyidae
34	Syrphidae
35	Tachinidae
36	Figitidae
37	Eupelmidae
38	Gelechiidae
39	Gelechiidae 
40	Cosmopterigidae
41	Geometridae
42	Glyphipterigidae?
43	Gracilleriidae?
44	Lycaenidae
45	Torymidae
46	unidentified Microlepidoptera
47	Mymaridae
48	Noctuidae
49	Nolidae
50	Orneodidae
51	Ormyridae
52	Pteromalidae
53	Perilampidae
54	Pyralidae
55	ApionIdae
56	Pterophoridae
57	Sessiidae
58	Sessiidae 
59	Tortricidae
60	Tortricidae 
61	Tenebronidae
62	Yponomeutidae
\.


--
-- Data for Name: insect_genera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insect_genera (id, genus_name) FROM stdin;
1	Agathis
2	nan
3	Alcidodes
4	Aleiodes
5	Alucitidae
6	Anaglyma
7	Apanteles
8	Aprostocetus
9	Araecerus
10	Ascogaster
11	Asobara
12	Blastobasis
13	Bactrocera
14	Bassus
15	?Bothriothorax
16	Bracon
17	new genus
18	Brachypeplus
19	Brachyaciura
20	Bruchophagus
21	Capparimyia
22	Carpophthoromyia
23	Carpophilus
24	Carpomya
25	Carposinidae
26	Hendecasis
27	Prochoristis
28	Ceratitis
29	Celidodacus
30	undetermined ceratitidine genus
31	cf Aprostocetus
32	Chelonus
33	Conradtina
34	Conradtiella
35	Gelechioidea, Cosmopterigidae ?
36	Vietessa
37	Pyrosta
38	Agrotera
39	cf Syllepte
40	Dolicharthria
41	Palpita
42	Parotis
43	Prophantis
44	Sceliodes
45	Thliptoceras
46	Ctenomerus
47	Dacus
48	Sylvicola
49	Diasemopsis
50	Diachasmimorpha
51	Dicheniotes
52	Diolcogaster
53	Dicheniotes?
54	Lauxaniidae
55	Lonchaeidae
56	Mycetophilidae
57	Chaetonereus
58	Dorycricus
59	Solva
60	nr Drosimomyia
61	Ptecticus
62	Allobacha
63	Graptomyza
64	Actia
65	Aplomyia
66	Ealata
67	Elachertus?
68	Entedon
69	Epuraea
70	Eubazus
71	Euderus
72	Eupelmus
73	Eurytoma
74	morphospecies
75	Euvipio?
76	Fopius
77	Ganaspis
78	Gelechiidae
79	Mometa 
80	Gelechioidea
81	Gelechiidae 
82	Gelechioidea 
83	Gelechioidea, Cosmopterigidae?
84	Gelichioidea
85	undetermined genus
86	Chloroclystis
87	Eupithecia
88	Glyphipterigidae?
89	Mometa
90	Gracilleriidae?
91	Habrobracon
92	Deudorix
93	Leptopilina
94	Lycaenidae
95	Macrocentrus
96	Megastigmus
97	Meteorus
98	Metialma ?
99	Metasphenisca
100	Unidentified 
101	Lyonetiidae ?
102	Unidentified
103	Tineoidea ?
104	Munromyia
105	Noctuidae
106	Apospasta
107	Giaura
108	Ableptina
109	Nanophyes
110	Earias
111	Eublemma 
112	Eublemma  
113	Eupsoropsis
114	Hydrillodes
115	Nola
116	Notommima
117	Ozarba
118	Zalaca
119	Zalaca 
120	Ochyromera
121	Ocnerioxa
122	Orneodes
123	Opius
124	Orgilus
125	Ormyrus
126	Paraspheniscoides  
127	Pediobius
128	Perilampsis
129	Phanerotoma
130	Phaenocarpa
131	Phenolia
132	Philophylla
133	Leucinodes
134	Pristomerus
135	Pseudotorymus
136	Pseudaspidapion
137	Psyttalia
138	Pterophoridae
139	Pyralidae, Phycitinae
140	Hodebertia
141	Pyralidae
142	Pyralidae, Phycitinae 
143	Spatulipalpia
144	Rhynchosteres
145	Schistopterini
146	Mellitia
147	Sessiidae
148	Mellitia?
149	Sirenes
150	Sternaulopius
151	Stetantix?
152	Sycophila
153	Tortricidae, Tortricini? 
154	Metendothenia 
155	Anthozela 
156	Tortricidae, Archipini
157	Tortricidae, Grapholitini
158	Tortricidae
159	Paracera
160	Afroploce
161	Crocidosema 
162	Eucosmini
163	Stenentoma
164	Cryptophlebia
165	Tortricidae, Grapholitini 
166	Grapholita 
167	Same photo as L117
168	Thaumatotibia 
169	Tortricidae 
170	Anthozela
171	Taomyia
172	Eccopsis
173	Tephritinae
174	Tetrastichus
175	Tetrastichus ?
176	Tetrastichinae
177	Eucosma
178	Themarictera
179	Tineioidea?
180	Tineoidea?
181	nr Thylacogaster
182	Tortricidae, Olethreutini 
183	Tortricidae, Olethreutini
184	Torymus ?
185	Trirhithrum
186	Triaspis
187	Trichopria
188	Tortrix
189	Thaumatotibia
190	Thylacogaster
191	Urophorus
192	Utetes
193	Xanthorrachista
194	Yponomeuta 
195	Yponomeuta
\.


--
-- Data for Name: insect_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insect_orders (id, order_name) FROM stdin;
1	Hymenoptera
2	Coleoptera
3	Lepidoptera
4	Diptera
5	nan
\.


--
-- Data for Name: insect_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insect_photos (insect_id, photo_id, sex) FROM stdin;
6	L054	sex undetermined
7	L055	sex undetermined
21	L003	sex undetermined
22	B001	female
22	B002	male
23	B003	female
23	B004	female
24	B005	female
24	B006	female
25	B007	female
25	B008	female
26	B009	female
26	B010	male
28	B014	male
28	B013	male
29	B011	male
29	B012	female
32	B015	male
32	B016	male
91	nd001	female
98	nd002	female
99	nd003	female
99	nd004	male
103	L045	sex undetermined
104	L046	sex undetermined
105	L047	sex undetermined
106	L122	sex undetermined
107	L061	sex undetermined
113	L010	sex undetermined
115	c001	male
115	c002	male
116	c003	female
116	c004	male
119	c053	male
119	c052	female
120	c006	male
120	c005	male
121	c007	female
123	c008	female
123	c009	male
124	c012	male
124	c013	male
125	c014	female
125	c015	male
125	c016	male
126	c017	female
128	c019	female
128	c018	male
129	c020	female
129	c021	male
130	c022	female
130	c023	male
131	c055	male
131	c056	female
132	c024	male
133	c025	male
133	c026	female
134	c027	female
134	c028	male
135	c029	male
136	c030	female
136	c031	male
137	c032	male
137	c033	female
138	nd005	female (western form)
138	nd006	female (coastal form)
138	nd007	female (coastal form)
139	c034	male
139	c035	male
140	c036	female
141	c010	male
141	c011	female
142	c039	male
142	c038	female
143	c037	female
144	c041	male
144	c040	female
145	c042	female
145	c043	male
146	c044	female
146	c045	male
147	nd008	female
147	nd009	male
149	c046	female
149	c047	male
150	c049	male and female
150	c048	male
151	c051	male
151	c050	female
152	c057	female
152	c058	male
153	c059	female
153	c060	male
154	c054	female
156	c061	female
156	c062	male
165	L036	sex undetermined
169	L001	sex undetermined
170	L004	sex undetermined
171	L008	sex undetermined
172	L012	sex undetermined
173	L013	sex undetermined
174	L018	sex undetermined
175	L019	sex undetermined
176	L023	sex undetermined
179	D001	male
179	D002	male
180	D003	male
181	D004	female
181	D005	male
183	D006	male
183	D007	male
184	D008	male
184	D009	female
187	D011	female
187	D010	male
189	D012	female
189	D013	male
192	D032	female
192	D033	male
194	D014	female
194	D015	male
195	ntd011	sex undetermined
197	D018	female
197	D019	female
199	D020	male
199	D021	male
199	D022	male
200	D023	male
200	D024	male
205	D026	male and female
205	D025	female
207	D027	female
207	D028	male
208	D029	male
208	D030	male
210	D031	male
212	ntd005	sex undetermined
218	nd010	female
218	nd011	male
222	ntd001	sex undetermined
223	ntd008	sex undetermined
225	ntd009	sex undetermined
226	ntd004	sex undetermined
226	ntd003	sex undetermined
231	ntd010	sex undetermined
235	ntd002	sex undetermined
236	ntd006	sex undetermined
236	ntd007	sex undetermined
297	L056	sex undetermined
298	L057	sex undetermined
299	L058	sex undetermined
300	L059	sex undetermined
301	L060	sex undetermined
303	L062	sex undetermined
304	L063	sex undetermined
310	L064	sex undetermined
311	L065	sex undetermined
312	L066	sex undetermined
313	L067	sex undetermined
314	L068	sex undetermined
317	nd023	female
317	nd024	female
318	L069	sex undetermined
319	L070	sex undetermined
320	L071	sex undetermined
328	L006	female
328	L007	male
330	L072	female
338	hmeg1	male
338	hmeg2	male
338	hmeg3	female
346	L049	sex undetermined
347	L050	sex undetermined
348	L051	sex undetermined
349	L052	sex undetermined
350	L053	sex undetermined
352	L037	sex undetermined
354	L038	sex undetermined
355	L039	sex undetermined
356	L040	sex undetermined
357	L041	sex undetermined
358	L042	sex undetermined
359	L043	sex undetermined
360	L044	sex undetermined
362	nd017	male
362	nd016	female
366	L011	sex undetermined
368	L080	sex undetermined
369	L081	sex undetermined
372	L009	sex undetermined
376	L079	sex undetermined
377	L076	sex undetermined
379	L077	sex undetermined
381	L078	sex undetermined
382	nd018	male
384	L075	sex undetermined
386	L073	sex undetermined
387	L074	sex undetermined
405	P01	female
405	P02	male
406	P03	male
406	P04	male
414	nd014	female
414	nd015	male
436	L088	sex undetermined
437	L089	sex undetermined
438	L090	sex undetermined
439	L093	sex undetermined
441	L014	sex undetermined
442	L091	sex undetermined
443	L092	sex undetermined
449	L015	sex undetermined
450	L016	sex undetermined
451	L017	sex undetermined
452	L083	sex undetermined
453	L084	sex undetermined
454	L085	sex undetermined
455	L086	sex undetermined
456	L087	sex undetermined
457	L082	sex undetermined
458	L022	sex undetermined
463	L020	sex undetermined
464	L021	sex undetermined
478	L024	sex undetermined
479	L033	sex undetermined
480	L034	sex undetermined
481	L035	sex undetermined
482	L094	sex undetermined
483	L095	sex undetermined
484	L096	sex undetermined
485	L097	sex undetermined
486	L098	sex undetermined
487	L099	sex undetermined
488	L100	sex undetermined
489	L025	sex undetermined
491	L102	sex undetermined
492	L103	sex undetermined
493	L104	sex undetermined
494	L105	sex undetermined
495	L106	sex undetermined
496	L107	sex undetermined
497	L108	sex undetermined
498	L109	sex undetermined
499	L110	sex undetermined
500	L026	sex undetermined
501	L111	sex undetermined
502	L112	sex undetermined
503	L113	sex undetermined
504	L114	sex undetermined
505	L115	sex undetermined
506	L116	sex undetermined
507	L117	sex undetermined
508	L118	sex undetermined
509	L119	sex undetermined
510	L120	sex undetermined
511	L027	sex undetermined
519	L028	sex undetermined
520	L029	sex undetermined
521	L030	sex undetermined
522	L031	sex undetermined
523	L032	sex undetermined
526	nd020	female
526	nd019	male
527	nd021	male
530	L101	sex undetermined
551	nd022	male
560	T001	male
560	T002	female
561	T003	female
561	T004	male
562	T005	female
562	T006	male
563	T007	female
563	T008	male
564	T010	female
564	T009	male
565	T012	male
565	T011	female
566	T035	female
566	T036	female
569	T013	female
570	T014	female
570	T015	male
571	T018	male
571	T019	female
572	T016	female
572	T017	male
573	T026	female
573	T027	male
575	T029	female
575	T030	male and female
575	T028	female
576	T021	male
576	T020	female
577	T031	female
577	T032	female
578	T022	female
578	T023	male
578	T024	male
578	T025	male and female
581	T033	female
581	T034	male
582	L002	undetermined
592	nd013	female
592	nd012	female
594	L121	sex undetermined
\.


--
-- Data for Name: insect_sub_families; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insect_sub_families (id, sub_family_name) FROM stdin;
1	Agathidinae
2	Molytinae
3	Rogadinae
4	Alticiniae
5	nan
6	Alysiinae
7	Curculioninae
8	Microgastrinae
9	Cheloninae
10	Trypetinae
11	Banchinae
12	Baridinae
13	Braconinae
14	Tephritinae
15	Campopleginae
16	Cybalomiinae
17	Conoderinae
18	Odontiinae
19	Cremastinae
20	Spilomelinae
21	Nanophyinae
22	Opiinae
23	Diplazontinae
24	Eucoilinae
25	Eulophinae
26	Entedontinae
27	Entiminae
28	Helconinae
29	Euderinae
30	Larentiinae
31	Macrocentrinae
32	Megastigminae
33	Meteorinae
34	Metopiinae
35	Acontiinae
36	Tychiinae
37	Orgilinae
38	Ormocerinae
39	Orthocentrinae
40	Alysiinaae
41	Pyraustinae
42	Pteromalinae
43	Phycitinae
44	Tersilochinae
45	Tetrastichinae
46	Phytalmiinae
\.


--
-- Data for Name: insects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insects (id, unique_code, species_name, genus_id, sub_family_id, family_id, order_id) FROM stdin;
1	Aga	sp.	1	1	1	1
2	agat	nan	2	1	1	1
3	Alcsp	sp.	3	2	2	2
4	Ale	sp.	4	3	1	1
5	alti	nan	2	4	3	2
6	Alucitid1	sp. 1	5	5	4	3
7	Alucitid2	sp. 2	5	5	4	3
8	alys	nan	2	6	1	1
9	Anasp	sp	6	5	5	2
10	anth	nan	2	7	2	2
11	anthr	nan	2	5	6	2
12	Apa	sp.	7	8	1	1
13	apion	nan	2	5	7	2
14	Apr1	sp. 1	8	5	8	1
15	Apr2	sp. 2	8	5	8	1
16	Apr3	sp. 3	8	5	8	1
17	Apr4	sp. 4	8	5	8	1
18	Arafas	fascicularis	9	5	6	2
19	Asc	sp.	10	9	1	1
20	Aso	sp.	11	6	1	1
21	b1	kenya B3A	12	5	9	3
22	baamp	amplexa	13	10	10	4
23	babig	bigutulla	13	10	10	4
24	babigspnrB	munroi	13	10	10	4
25	babigspnrC	munroi	13	10	10	4
26	bacuc	cucurbitae	13	10	10	4
27	banc	nan	2	11	11	1
28	banig	nigrivenata	13	10	10	4
29	baole	oleae	13	10	10	4
30	bari	nan	2	12	2	2
31	bas	sp.	14	1	1	1
32	baspn1	invadens	13	10	10	4
33	Bot	sp.	15	5	12	1
34	Bra	sp.	16	13	1	1
35	Bra1	sp. 1	2	13	1	1
36	Bra10	sp. 10	2	13	1	1
37	Bra11	sp. 11	2	13	1	1
38	Bra12	sp. 12	2	13	1	1
39	Bra13	sp. 13	2	13	1	1
40	Bra14	sp. 14	2	13	1	1
41	Bra15	sp. 15	2	13	1	1
42	Bra16	sp. 16	2	13	1	1
43	Bra17	sp. 17	2	13	1	1
44	Bra18	sp. 18	2	13	1	1
45	Bra19	sp. 19	2	13	1	1
46	Bra2	sp. 2	2	13	1	1
47	Bra20	sp. 20	2	13	1	1
48	Bra21	sp. 21	2	13	1	1
49	Bra22	sp. 22	2	13	1	1
50	Bra23	sp. 23	2	13	1	1
51	Bra24	sp. 24	2	13	1	1
52	Bra25	sp. 25	2	13	1	1
53	Bra26	sp. 26	2	13	1	1
54	Bra27	sp. 27	2	13	1	1
55	Bra28	sp. 28	2	13	1	1
56	Bra29	sp. 29	2	13	1	1
57	Bra3	sp. 3	2	13	1	1
58	Bra30	sp. 30	2	13	1	1
59	Bra31	sp. 31	2	13	1	1
60	Bra32	sp. 32	2	13	1	1
61	Bra33	sp. 33	2	13	1	1
62	Bra34	sp. 34	2	13	1	1
63	Bra35	sp. 35	2	13	1	1
64	Bra36	sp. 36	2	13	1	1
65	Bra37	sp. 37	2	13	1	1
66	Bra38	sp. 38	2	13	1	1
67	Bra39	sp. 39	2	13	1	1
68	Bra4	sp. 4	2	13	1	1
69	Bra40	sp. 40	2	13	1	1
70	Bra41	sp. 41	2	13	1	1
71	Bra42	sp. 42	2	13	1	1
72	Bra43	sp. 43	2	13	1	1
73	Bra44	sp. 44	2	13	1	1
74	Bra45	sp. 45	2	13	1	1
75	Bra46	sp. 46	2	13	1	1
76	Bra47	sp. 47	2	13	1	1
77	Bra48	sp. 48	2	13	1	1
78	Bra49	sp. 49	2	13	1	1
79	Bra5	sp. 5	2	13	1	1
80	Bra50	sp. 50	2	13	1	1
81	Bra51	sp. 51	2	13	1	1
82	Bra53	sp. 53	2	13	1	1
83	Bra6	sp. 6	2	13	1	1
84	Bra7	sp. 7	2	13	1	1
85	Bra8	sp. 8	2	13	1	1
86	Bra9	sp. 9	2	13	1	1
87	brac	nan	2	13	1	1
88	bracngen	nan	17	13	1	1
89	braco	nan	2	5	1	1
90	Bradep	depressus	18	5	13	2
91	brasp	sp.	19	14	10	4
92	Bru1	sp. 1	20	5	14	1
93	Bru2	sp. 2	20	5	14	1
94	Bru3	sp. 3	20	5	14	1
95	camp	nan	2	15	11	1
96	capaen	aenigma	21	10	10	4
97	capbip	bipustulata	21	10	10	4
98	capmel	melanaspis	21	10	10	4
99	cardim	dimidiata	22	10	10	4
100	Carfum	fumatus	23	5	13	2
101	carinc	incompleta	24	10	15	5
102	Carpdim	dimidiatus	23	5	13	2
103	Carposin1	sp. 2	25	5	16	3
104	Carposin2	sp. 3	25	5	16	3
105	Carposin3	sp. 4	25	5	16	3
106	Carposin4	sp. 7	25	5	16	3
107	Carposin5	sp. 6	25	5	16	3
108	Carposin6	nan	2	5	16	3
109	Carposin7	nan	2	5	16	3
110	Carposin8	sp. 8	25	5	16	3
111	carspn	n sp.	22	10	10	4
112	ccHencfapi	cf apicefulva	26	16	17	3
113	ccHencfdup	cf duplifascialis	26	16	17	3
114	ccProcal	calamochroa	27	16	17	3
115	ceano	anonae	28	10	10	4
116	cearg	argentobrunnea	28	10	10	4
117	ceargspnr	perisae	28	10	10	4
118	cebre	bremii	28	10	10	4
119	cebruspnr	perseus	28	10	10	4
120	cecae	caetrata	28	10	10	4
121	cecap	capitata	28	10	10	4
122	cecon	connexa	28	10	10	4
123	cecon1	contramedia	28	10	10	4
124	cecor	cornuta	28	10	10	4
125	cecos	cosyra	28	10	10	4
126	cecri	cristata	28	10	10	4
127	cecur	curvata	28	10	10	4
128	cecut	cuthbertsoni	28	10	10	4
129	cedis	discussa	28	10	10	4
130	cedit	ditissima	28	10	10	4
131	ceditspnr	millicentae	28	10	10	4
132	cediv	divaricata	28	10	10	4
133	ceedw	edwardsi	28	10	10	4
134	cefas	fasciventris	28	10	10	4
135	cefle	flexuosa	28	10	10	4
136	cegra	gravinotata	28	10	10	4
137	ceham	hamata	28	10	10	4
138	celiobn	obnubilus	29	10	10	4
139	celob	lobata	28	10	10	4
140	cemar	marriotti	28	10	10	4
141	censpA	copelandi	28	10	10	4
142	censpB	pennitibialis	28	10	10	4
143	ceped	pedestris	28	10	10	4
144	cepin	pinax	28	10	10	4
145	cepod	podocarpi	28	10	10	4
146	ceque	querita	28	10	10	4
147	ceragen	sp.	30	10	10	4
148	ceragen1	sp.	30	10	10	4
149	ceros	rosa	28	10	10	4
150	cerub	rubivora	28	10	10	4
151	cesim	simi	28	10	10	4
152	cestic	stictica	28	10	10	4
153	cestip	stipula	28	10	10	4
154	cestispnr	oraria	28	10	10	4
155	cestr	striatella	28	10	10	4
156	ceven	venusta	28	10	10	4
157	cfApr	sp.	31	5	8	1
158	chalc	nan	2	5	18	1
159	Che	sp.	32	9	1	1
160	chel	nan	2	9	1	1
161	coacr	acroleuca	33	10	10	4
162	Conspnrbel	sp nr bella	34	17	2	2
163	copi	nan	2	5	12	1
164	Cosmop?1	sp. 2	35	5	19	3
165	coViecfmar	cf margaritalis	36	18	17	3
166	coViemar	margaritalis	36	18	17	3
167	cPyrinc	incoloralis	37	5	17	3
168	crem	nan	2	19	11	1
169	csAgrcit	citrina	38	20	17	3
170	cscfSylovi	ovialis	39	20	17	3
171	csDollan	lanceolalis	40	20	17	3
172	csPaluni	unionalis	41	20	17	3
173	csParcfpra	cf prasinophila	42	20	17	3
174	csProsma	smaragdina	43	20	17	3
175	csScelai	laisalis	44	20	17	3
176	csThlxan	xanthomeralis	45	20	17	3
177	Ctesp	sp.	46	21	20	2
178	curc	nan	2	7	2	2
179	daade	adenionis	47	10	10	4
180	daamp	ampliquus	47	10	10	4
181	daarc	arcuatus	47	10	10	4
182	daarcspnr	arcuatus sp. nr	47	10	10	4
183	daattspnr	okumuae	47	10	10	4
184	dabiv	bivitattus	47	10	10	4
185	dabom	bombastus	47	10	10	4
186	dachr	chrysomphalus	47	10	10	4
187	dacil	ciliatus	47	10	10	4
188	daeclspnr	eclipsis sp. nr	47	10	10	4
189	dafro	frontalis	47	10	10	4
190	daino	inornatus	47	10	10	4
191	dalon	longistylus	47	10	10	4
192	dalou	lounsburyi	47	10	10	4
193	damas	masaicus	47	10	10	4
194	damor	limbipennis	47	10	10	4
195	DanSylsp	sp. 1	48	5	21	4
196	daper	pergulariae	47	10	10	4
197	daphl	phloginus	47	10	10	4
198	daple	pleuralis	47	10	10	4
199	dapun	punctatifrons	47	10	10	4
200	daretspnr	apostata	47	10	10	4
201	dasil	siliqualactis	47	10	10	4
202	dasilspnrA	siliqualactis sp. nr A	47	10	10	4
203	dasilspnrB	siliqualactis sp. nr B	47	10	10	4
204	dasp	sp.	47	10	10	4
205	dasph	sphaeristicus	47	10	10	4
206	datel	telfairae	47	10	10	4
207	daten	tenebricus	47	10	10	4
208	datri	triater	47	10	10	4
209	daumb	umbeluzinus	47	10	10	4
210	daver	vertebratus	47	10	10	4
211	Dchsp	nan	2	5	22	4
212	DdiDiasp	sp. 1	49	5	23	4
213	Dhesp	nan	2	5	24	4
214	Dia	sp.	50	22	1	1
215	Diacar	carinata	50	22	1	1
216	Diaful	fullawayi	50	22	1	1
217	diapr	nan	2	5	25	1
218	diero	erosa	51	5	10	4
219	Dio	sp.	52	8	1	1
220	dipl	nan	2	23	11	1
221	disp	sp.	53	5	10	4
222	Dlasp	sp. 1	54	5	26	4
223	Dlosp	sp. 1	55	5	27	4
224	Dmusp	nan	2	5	28	4
225	Dmysp	sp. 1	56	5	29	4
226	DneChasp	sp. 1	57	5	30	4
227	dorua	ruater	58	5	10	4
228	dryop	nan	2	5	31	2
229	DsoSosp	sp	59	5	32	4
230	DstnrDrosp	sp.	60	5	33	4
231	DstPtepos	posticus	61	5	33	4
232	DstPtesp	sp	61	5	33	4
233	DstPtespnracu	aculeatus sp nr	61	5	33	4
234	DstPtespnrrho	rhodesiae sp nr	61	5	33	4
235	DsyAllsp	sp. 1	62	5	34	4
236	DsyGratr	triangulifera	63	5	34	4
237	DtaActsp	sp	64	5	35	4
238	DtaAplsp	sp	65	5	35	4
239	Eal	sp.	66	24	36	1
240	Ela	sp.	67	25	8	1
241	encyr	nan	2	5	12	1
242	Ent1	sp. 1	68	26	8	1
243	Ent2	sp. 2	68	26	8	1
244	enti	nan	2	27	2	2
245	Epulut	luteola	69	5	13	2
246	Epunsp	sp n	69	5	13	2
247	Eub	sp.	70	28	1	1
248	euco	nan	2	24	36	1
249	Eud	sp.	71	29	8	1
250	eulop	nan	2	5	8	1
251	Eup	sp.	72	5	37	1
252	eupel	nan	2	5	37	1
253	Eur	sp.	73	5	14	1
254	Eur1	sp. 1	73	5	14	1
255	Eur10	sp. 10	73	5	14	1
256	Eur11	sp. 11	73	5	14	1
257	Eur12	sp. 12	73	5	14	1
258	Eur13	sp. 13	73	5	14	1
259	Eur14	sp. 14	73	5	14	1
260	Eur15	sp. 15	73	5	14	1
261	Eur16	sp. 16	73	5	14	1
262	Eur17	sp. 17	73	5	14	1
263	Eur18	sp. 18	73	5	14	1
264	Eur19	sp. 19	73	5	14	1
265	Eur2	sp. 2	73	5	14	1
266	Eur20	sp. 20	73	5	14	1
267	Eur21	sp. 21	73	5	14	1
268	Eur22	sp. 22	73	5	14	1
269	Eur23	sp. 23	73	5	14	1
270	Eur24	sp. 24	73	5	14	1
271	Eur25	sp. 25	73	5	14	1
272	Eur3	sp. 3	73	5	14	1
273	Eur4	sp. 4	73	5	14	1
274	Eur5	sp. 5	73	5	14	1
275	Eur6	sp. 6	73	5	14	1
276	Eur7	sp. 7	73	5	14	1
277	Eur8	sp. 8	73	5	14	1
278	Eur9	sp. 9	73	5	14	1
279	euryt	nan	2	5	14	1
280	EurytspA	sp. A	74	5	14	1
281	EurytspB	sp. B	74	5	14	1
282	EurytspC	sp. C	74	5	14	1
283	Euv	sp.	75	13	1	1
284	Fop	sp.	76	22	1	1
285	Fopbev	bevisi	76	22	1	1
286	Fopcau	caudatus	76	22	1	1
287	Fopcer	ceratitivorus	76	22	1	1
288	Fopcfcer	sp. cf. ceratitivorus	76	22	1	1
289	Fopcfdes	sp. cf. desideratus	76	22	1	1
290	Fopcfsil	sp. cf. silvestri	76	22	1	1
291	Fopdesgrp	"sp., desideratus species group"	76	22	1	1
292	Fopdesgrp2	"sp. 2, desideratus species group"	76	22	1	1
293	Fopdesgrpnig	"desideratus group, niger?"	76	22	1	1
294	Fopoke	okekai	76	22	1	1
295	Fopsil	silvestri	76	22	1	1
296	Gan	sp.	77	24	36	1
297	Gelichii1	sp. 6	78	5	38	3
298	Gelichii2	sp. nr. zemiodes	79	5	38	3
299	Gelichii3	sp 2	78	5	38	3
300	Gelichii4	sp 3	78	5	38	3
301	Gelichii5	sp. 4	80	5	38	3
302	Gelichii6	sp. 5	81	5	39	3
303	Gelichii7	sp. 4	78	5	38	3
304	Gelichioi1	sp. 5	80	5	15	3
305	Gelichioi10	sp. 10	80	5	15	3
306	Gelichioi11	sp. 11	82	5	15	3
307	Gelichioi12	sp. 12	80	5	15	3
308	Gelichioi13	sp. 13	80	5	15	3
309	Gelichioi14	sp. 14	80	5	15	3
310	Gelichioi2	sp. 6	80	5	15	3
311	Gelichioi3	sp. 1	83	5	15	3
312	Gelichioi4	sp. 1	79	5	38	3
313	Gelichioi5	sp. 7	80	5	15	3
314	Gelichioi6	sp. 8	80	5	40	3
315	Gelichioi9	sp. 9	84	5	15	3
316	gensp	undetermined sp.	85	10	10	4
317	gensp1	undetermined species	85	10	10	4
318	Geo1	nr. jansei 	86	5	41	3
319	Geo2	nan	2	5	41	3
320	Geo3	sp cf festiva	87	30	41	3
321	Geochlo1	sp. 1	86	30	41	3
322	glyp	nan	2	11	11	1
323	Glyph?1	sp. 1	88	5	42	3
324	gMomzemspnr	zemiodes sp nr	89	5	38	3
325	Grac?1	sp. 1	90	5	43	3
326	Hab	sp.	91	13	1	1
327	ichne	nan	2	5	11	1
328	lDeudin	dinochares	92	5	44	3
329	Lep	sp.	93	24	36	1
330	Lycaenid1	sp. 1	94	5	44	3
331	Mac	sp.	95	31	1	1
332	Mega	sp. 2	96	32	45	1
333	MegspA	sp. 3	96	32	45	1
334	MegspB	sp. 4	96	32	45	1
335	MegspC	sp. 5	96	32	45	1
336	MegspD	sp. 7	96	32	45	1
337	Megspn	sp. 6	96	32	45	1
338	Megtho	sp. 1	96	32	45	1
339	Megtra	transvaalensis	96	32	45	1
340	Met	sp.	97	33	1	1
341	Met?sp	sp.	98	17	2	2
342	metasp	sp.	99	5	10	4
343	meto	nan	2	34	11	1
344	micr	nan	2	8	1	1
345	Micro	nan	2	5	46	3
346	Micro14	sp. 2	80	5	46	3
347	Micro15	microlepidoptera sp. 2	100	5	46	3
348	Micro16	nan	2	5	46	3
349	Micro17	sp. 1	101	5	46	3
350	Micro18	sp. 1	78	5	46	3
351	micro19	microlepidoptera sp. 3	102	5	46	3
352	Micro2	sp. 1	84	5	46	3
353	micro20	microlepidoptera sp. 4	102	5	46	5
354	Micro3	sp. 1	103	5	46	3
355	Micro4	nan	2	5	46	3
356	Micro5	sp. 3	103	5	46	3
357	Micro6	microlepidoptera sp. 1	100	5	46	3
358	Micro7	nan	2	5	46	3
359	Micro8	sp. 2	103	5	46	3
360	Micro9	sp. 1	25	5	16	3
361	moly	nan	2	2	2	2
362	munsp	whartoni	104	10	10	4
363	munsp2	sp. 	104	10	10	4
364	mymar	nan	2	5	47	1
365	n	sp	2	5	48	3
366	n1	sp. 1	105	5	48	3
367	n2	sp	2	5	48	3
368	n3	sp	106	5	48	3
369	n4	sp. 1	107	5	48	3
370	nAblsp1	sp. 1	108	5	48	3
371	Nansp	sp.	109	21	20	2
372	nEarcup	cupreoviridis	110	5	48	3
373	nEublgay	gayneri	111	5	48	3
374	nEublnrbi	nr. Bipartita	112	5	48	3
375	nEupcfrob	sp cf robertsi	113	35	48	3
376	nGiabos	bostrycodes	107	5	48	3
377	nGianig	sp. nr. Nigricollaris	107	5	49	3
378	nGiaspcfni	sp cf nigricollaris	107	5	48	3
379	nHyduli	uliginosalis	114	5	48	3
380	nNolmel	melanoscelis	115	5	49	3
381	nNolpolspnr	sp. nr. poliophasma	115	5	49	3
382	notnsp	parallela	116	10	10	4
383	nOzapurspnr	purpurea sp nr	117	5	48	3
384	nOzasub	subtilimba	117	5	48	3
385	nsp2	sp. 2	105	5	48	3
386	nZalant	anticalis	118	5	48	3
387	nZalsne	snelleni 	119	5	48	3
388	Ochsp	sp.	120	36	2	2
389	Ochspcfbry	cf bryanti	120	36	2	2
390	ocpen	pennata	121	5	10	4
391	oOrnsp	sp	122	5	50	3
392	Opi	sp.	123	22	1	1
393	opii	nan	2	22	1	1
394	Org	sp.	124	37	1	1
395	Orm1	sp. 1	125	5	51	1
396	Orm2	sp. 2	125	5	51	1
397	ormo	nan	2	38	52	1
398	ormyr	nan	2	5	51	1
399	orth	nan	2	39	11	1
400	parbin	binarius	126	5	10	4
401	Ped	sp.	127	5	8	1
402	pefor	formosula	128	10	10	4
403	pepul	pulchella	128	10	10	4
404	peril	nan	2	5	53	1
405	peril1	pulchella	128	10	10	4
406	peril2	formosula	128	10	10	4
407	peril3	sp.	128	10	10	4
408	Pha	sp.	129	9	1	1
409	Phae	sp.	130	40	1	1
410	phan	nan	2	9	1	1
411	Pheaffcos	aff. costipennis	131	5	13	2
412	Phecos	costipennis	131	5	13	2
413	Phelim	limbata	131	5	13	2
414	phfos	fossataeformis	132	5	10	4
415	phhom	homogenea	132	5	10	4
416	pLeunrorb	sp. nr orbonalis	133	41	54	5
417	Pri	sp.	134	19	11	1
418	Procal	calamochroa	27	16	17	3
419	Pse1	sp.1	135	5	45	1
420	Pse2	sp.2	135	5	45	1
421	Psesp	sp	136	5	55	2
422	Psy	sp. 1	137	22	1	1
423	Psycfcon	sp. cf. concolor	137	22	1	1
424	Psycfcons	sp. cf. consueta	137	22	1	1
425	Psycflou	sp. cf. lounsburyi	137	22	1	1
426	Psycon	concolor	137	22	1	1
427	Psycos	cosyrae	137	22	1	1
428	Psylou	lounsburyi	137	22	1	1
429	Psynrcon	sp. near concolor	137	22	1	1
430	Psynsp	new species	137	22	1	1
431	PsyOnco1	sp. 2	137	22	1	1
432	pt1	nan	2	5	56	3
433	pter	nan	2	42	52	1
434	ptero	nan	2	5	52	1
435	ptero1	sp. 1	138	5	56	5
436	py1	sp. 5	139	43	54	3
437	py2	testalis	140	41	54	3
438	py3	sp. 1	42	20	54	3
439	py4	sp. 1	141	5	54	3
440	pyp	sp	2	43	54	3
441	pyp1	nan	2	43	54	3
442	pyp10	sp. 6	139	43	54	3
443	pyp11	sp. 7	139	43	54	3
444	pyp12	sp. 8	139	43	54	5
445	pyp13	sp. 9	139	43	54	5
446	pyp14	sp. 10	142	43	54	5
447	pyp15	sp. 11	142	43	54	5
448	pyp16	sp. 12	142	43	54	5
449	pyp2	nan	2	43	54	3
450	pyp3	nan	2	43	54	3
451	pyp4	nan	2	43	54	3
452	pyp5	nan	2	43	54	3
453	pyp6	sp. 1	139	43	54	3
454	pyp7	sp. 2	139	43	54	3
455	pyp8	sp. 3	139	43	54	3
456	pyp9	sp. 4	139	43	54	3
457	pypSpamon	montrosa	143	43	54	3
458	pypSpasp	sp A	143	43	54	3
459	Pyrinc	incoloralis	37	5	17	3
460	Rhycfbru	sp. cf. bruneigaster	144	22	1	1
461	Rhyman	mandibulata	144	22	1	1
462	schsp	sp. 	145	14	10	4
463	ses1	sp. nr. Rufodorsa	146	5	57	3
464	ses2	sp. 2	147	5	57	3
465	ses3	sp. 1	148	5	58	5
466	Sir	sp.	149	24	36	1
467	Ste	sp.	150	22	1	1
468	Ste2	sp. 2	150	22	1	1
469	Stet	sp.	151	44	11	1
470	Syc1	sp. 1	152	5	14	1
471	Syc2	sp. 2	152	5	14	1
472	Syc3	sp. 3	152	5	14	1
473	Syc4	sp. 4	152	5	14	1
474	Syc5	sp. 5	152	5	14	1
475	Syc6	sp. 6	152	5	14	1
476	Syc7	sp. 7	152	5	14	1
477	t	nan	2	5	59	3
478	t1	sp.1	153	5	59	3
479	t10	balanacma	154	5	59	3
480	t11	nan	2	5	59	3
481	t12	sp. nr. Hemidoxa	155	5	59	3
482	t13	sp. 5	156	5	59	3
483	t14	sp. 9	157	5	59	3
484	t15	sp. 1	158	5	59	3
485	t16	mimesa	159	5	59	3
486	t17	karsholti	160	5	59	3
487	t18	nan	2	5	15	5
488	t19	nan	2	5	59	3
489	t2	nan	2	5	59	3
490	t20	nan	2	5	59	3
491	t21	sp. 3 (Archips sp.?)	156	5	59	3
492	t22	sp. 005	157	5	59	3
493	t23	sp. 3 (Archips sp.?)	156	5	59	3
494	t24	nr. Plebjana	161	5	59	3
495	t25	sp. 4	162	5	59	3
496	t26	sp. 1	163	5	59	3
497	t27	nan	2	5	59	3
498	t28	nan	2	5	59	3
499	t29	nan	2	5	59	3
500	t3	sp. 20	158	5	59	3
501	t30	nan	2	5	59	3
502	t31	semilunana   	164	5	59	3
503	t32	sp. 3	162	5	59	3
504	t33	sp 7	165	5	59	3
505	t34	nan	2	5	59	3
506	t35	miranda	166	5	59	3
507	t36	sp. 2	158	5	59	3
508	t37	nan	167	5	59	3
509	t38	leucotreta female	168	5	59	3
510	t39	sp. 30	158	5	59	3
511	t4	nan	2	5	59	3
512	t40	sp. 12	158	5	59	5
513	t41	sp. 3	158	5	59	5
514	t42	sp. 9	158	5	59	5
515	t43	sp. 35	158	5	59	5
516	t44	sp. 5	158	5	59	5
517	t45	sp. 7	169	5	60	5
518	t46	sp. 8	169	5	59	5
519	t5	sp. 13 	158	5	59	5
520	t6	nan	2	5	59	3
521	t7	nan	2	5	59	3
522	t8	sp. 4	158	5	59	5
523	t9	nan	2	5	59	3
524	tAnthchry	chrysoxantha	170	5	59	3
525	tAnthnrchry	nr. Chrysoxantha	170	5	59	3
526	taomar	marshalli	171	10	10	4
527	taosp	sp.	171	10	10	4
528	tArchsp4	sp. 4	156	5	59	3
529	tArchsp8	sp. 8	156	5	15	3
530	tCryleu	leucotreta male	168	5	59	3
531	tCrypomb	ombrodelta	164	5	59	3
532	tEcconeb	nebulana	172	5	59	3
533	teneb	nan	2	5	61	2
534	teph	sp.	102	14	10	4
535	teph1	sp. 1	173	14	10	5
536	teph2	sp. 2	173	14	10	4
537	ters	nan	2	44	11	1
538	Tet	sp.	174	45	8	1
539	Tet?	sp.	175	45	8	1
540	Tetgif	giffardii	174	45	8	1
541	Tetgiff	giffardianus	174	45	8	1
542	Tetgifspnr	sp nr giffardii	174	45	8	1
543	tetr	sp.	176	45	8	1
544	tetr1	sp. 1	2	45	8	1
545	tetr2	sp. 2	2	45	8	1
546	tEucner	nereidopa	177	5	59	3
547	tGraph6	sp. 6	157	5	59	3
548	tGraph7	sp. 7	157	5	59	3
549	tGraph8	sp. 8	157	5	59	3
550	tGraph9	sp. 9	157	5	59	3
551	thelat	laticeps	178	46	10	4
552	tin?4	sp. 4	179	5	15	5
553	tin?5	sp. 5	179	5	15	5
554	tin?6	sp. 6	180	5	15	5
555	tnrThylac1	sp. 1	181	5	59	3
556	tOleth2	sp. 2	182	5	59	3
557	tOleth5	sp. 5	183	5	59	5
558	Tor?	sp.	184	5	45	1
559	torym	nan	2	5	45	1
560	tralb	albomaculatum	185	10	10	4
561	trcof	coffeae	185	10	10	4
562	trcul	culcasiae	185	10	10	4
563	trdem	demeyeri	185	10	10	4
564	trdiv	divisum	185	10	10	4
565	trfra	fraternum	185	10	10	4
566	trhomspnr	homogeneum sp. nr	185	10	10	4
567	Tri	sp.	186	28	1	1
568	Tric	sp.	187	5	25	1
569	trins	inscriptum	185	10	10	4
570	trmel	meladiscum	185	10	10	4
571	trnig	nigrum	185	10	10	4
572	trnige	nigerrimum	185	10	10	4
573	trnigspnr	nigrum sp. nr	185	10	10	4
574	trocc	occipitale	185	10	10	4
575	troccspnr	occipitale sp. nr	185	10	10	4
576	trove	overlaeti	185	10	10	4
577	trresspnr	resplendens sp. nr	185	10	10	4
578	trsen	senex	185	10	10	4
579	trsp	sp.	185	10	10	4
580	trspn	sp. nov.	185	10	10	5
581	trter	teres	185	10	10	4
582	ttArcspA	dinota	188	5	59	3
583	tThaumbat	batrochopa	189	5	59	5
584	tThylac2	sp. 2	190	5	59	3
585	tych	nan	2	36	2	2
586	unidentifiedLepidoptera	species	102	5	15	3
587	Uropic	picinus	191	5	13	2
588	Ute	sp.	192	22	1	1
589	Uteafr	africanus	192	22	1	1
590	Utenotafr	"sp., not africanus"	192	22	1	1
591	UteSol	sp. 3	192	22	1	5
592	xaala	alata	193	10	10	4
593	y1	strigillata	194	5	62	3
594	yponglaph	glaphyropsis	195	5	62	5
595	tGraph10	sp. 10	157	5	15	5
\.


--
-- Data for Name: insects_coi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insects_coi (coi_id, insect_id, country, genbank_accession, nucleotide, bold_id) FROM stdin;
1	21	Kenya	KF643041	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATATCAACATTTATTT	AFMIC184-12
2	21	Kenya	KF643039	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGATCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTA---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	AFRM012-12
3	21	Kenya	KF643042	-------------------------------------------------------------------------------------------------------------------------------------------------ATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCGGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	AFRM023-12
4	21	Kenya	KF643038	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	AFRM028-12
5	21	Kenya	GQ330222	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNCTGGATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK009-03
6	21	Kenya	GQ330271	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGAATAAATAATATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCTCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGGCCTAATAATATATTTTTTGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGATCCAGCNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK016-03
7	21	Kenya	GQ330227	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACAGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCTTCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGTTGAACAGTGTACCCCCCACTTTCATCTAATATTGCTCATGGTGGTAGTTCTGTTGATTTAGCTATTTTTTCCCTACATTTAGCTGGAATCTCATCTATTTTAGGAGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTTGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACCATATTATTAACAGACCGTAATTTAAATACATCTTTCTTTGACCCTGCTGGAGGGGGAGATCCTATTTTATATCAACATTTATTT	HCBK017-03
8	21	Kenya	GQ330221	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGGATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCGGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK042-05
9	21	Kenya	GQ330223	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTGTGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCNNNNNNNNNNNNNNNNNNNNNN	HCBK043-05
10	21	Kenya	GQ330274	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCGGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK044-05
11	21	Kenya	GQ330224	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGAGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK045-05
12	21	Kenya	GQ330272	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNCCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK047-05
13	21	Kenya	GQ330273	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATGGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCGTNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK048-05
14	21	Kenya	GQ330228	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGACTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTGGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK053-05
15	21	Kenya	GQ330215	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGANCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK054-05
16	21	Kenya	GQ330229	NNNNNNNNNNNNNNNNNNNNNNNNNNNAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTCTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATGTTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK055-05
17	21	Kenya	GQ330226	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK057-05
18	21	Kenya	GQ330220	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK058-05
19	21	Kenya	GQ330219	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGACCCAGCTGGAGGGNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK060-05
20	21	Kenya	GQ330267	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK065-05
21	21	Kenya	GQ330232	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNTACTAGTTCGAGCTGAATTAGGAAATCCAGGATCTTTAATTGGAGATGACCAAATTTATAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGAATAAATAATATAAGTTTTTGATTAYTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGCAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK066-05
22	21	Kenya	GQ330231	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGANNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK068-05
23	21	Kenya	GQ330269	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK069-05
24	21	Kenya	GQ330235	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNTAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK070-05
25	21	Kenya	GQ330266	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAATTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK072-05
26	21	Kenya	GQ330236	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGGGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTCCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACTTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK075-05
27	21	Kenya	GQ330234	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGANTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK077-05
28	21	Kenya	GQ330238	NNNNNNNNNNNNNNNNNNNNNNNNNNNAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK078-05
29	21	Kenya	GQ330237	NNNNNNNNNNNNNNNNNNNNNNNNTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK079-05
30	21	Kenya	GQ330230	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK084-05
31	21	Kenya	GQ330240	NNNNNNNNNNNNNNNNNNNNNNNNTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTCCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK089-05
32	21	Kenya	GQ330243	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNTAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK091-05
33	21	Kenya	GQ330242	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNAGTAGGAACCTCCCTTAGATTACTAATTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTATAATACTATTGTCACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATGTTAGGGGCCCCTGATATAGCTTTCCCCCGTATAAATAACATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCTCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGGCCTAATAATATATTTTTTGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGATCCAGCTNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK092-05
34	21	Kenya	GQ330241	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGAGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK093-05
35	21	Kenya	GQ330239	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNTAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK094-05
36	21	Kenya	GQ330265	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK095-05
37	21	Kenya	GQ330218	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK096-05
38	21	Kenya	GQ330245	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTATAATACTATTGTCACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATGTTAGGGGCCCCTGATATAGCTTTCCCCCGTATAAATAACATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCTCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGGCCTAATAATATATTTTTTGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK099-05
39	21	Kenya	GQ330216	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNTAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK100-05
40	21	Kenya	GQ330244	NNNNNNNNNNNNNNNNNNNNNNATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK102-05
41	21	Kenya	GQ330248	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAANCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAA	HCBK103-05
42	21	Kenya	GQ330247	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATCAATATACGACCCAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK106-05
43	21	Kenya	GQ330246	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAA	HCBK108-05
44	21	Kenya	GQ330217	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGGGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK110-05
45	21	Kenya	GQ330249	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGACTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCGGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK115-05
46	21	Kenya	GQ330263	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNTAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAACTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK118-05
47	21	Kenya	GQ330251	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGTACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK127-05
48	21	Kenya	GQ330250	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK128-05
49	21	Kenya	GQ330259	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK131-05
50	21	Kenya	GQ330253	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK132-05
51	21	Kenya	GQ330252	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTATTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTCACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCCGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGGCCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGATCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK135-05
52	21	Kenya	GQ330255	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAA	HCBK137-05
53	21	Kenya	GQ330254	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATNTCCCCCACNTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATNTCATNTATTNTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK138-05
54	21	Kenya	GQ330257	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCCGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGACCCAGCTGGAGGGGGAGNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK160-05
55	21	Kenya	GQ330258	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGGATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCGGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGACCCAGCTGGAGGGGNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK161-05
56	21	Kenya	GQ330275	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCGGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK162-05
57	21	Kenya	GQ330260	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTGGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATATCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK164-05
58	21	Kenya	GQ330214	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCANGAACAGGATGAACAGTANNTCCNCCANNNNCATCAAATATNGCNCATNGTGGTAGTNCAGTAGATTTAGCNATTTTTTCCCTTNAANTNNCTGGANTNTNAAANATNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK169-05
59	21	Kenya	GQ330256	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTTCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCGGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATATCAACATTTATTT	HCBK170-05
60	21	Kenya	GQ330264	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNAGTNNGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGATCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGNGNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK172-05
61	21	Kenya	GQ330261	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGAATAGTANGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK180-05
62	21	Kenya	KF643040	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATATCAACATTTATTT	AFMIC188-12
63	21	Kenya	GQ330225	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCCTTTTTTGACCNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK046-05
64	21	Kenya	GQ330270	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCACCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAANNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN	HCBK062-05
65	21	Kenya	GQ330268	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTACAATACTATTGTTACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATATTAGGAGCCCCTGATATAGCTTTCCCCCGTATAAATAATATAAGTTTTTGATTATTACCTCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCCCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGACCTAATAATATATTTTTCGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCGGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGACCCAGCTGGAGGGGGAGANNNNNNNNNNNNNNNNNNNNNNNNN	HCBK064-05
66	21	Kenya	GQ330262	AACCTTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACCTCCCTTAGATTACTAGTTCGTGCTGAATTAGGTAATCCAGGCTCTTTAATTGGAGATGACCAAATTTATAATACTATTGTCACTGCCCATGCTTTTATTATAATTTTTTTTATAGTAATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCCCTTATGTTAGGGGCCCCTGATATAGCTTTCCCCCGTATAAATAACATAAGTTTTTGATTATTACCCCCATCTTTAACTTTATTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCTCATGGTGGTAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATCTCATCTATTCTAGGTGCTATTAATTTTATTACTACAATTATTAATATACGGCCTAATAATATATTTTTTGATCAAATACCTTTATTTGTATGAGCTGTAGGTATTACTGCTTTACTTCTTCTTTTATCTCTTCCTGTTTTAGCAGGAGCTATTACTATATTACTTACAGATCGAAACTTAAATACCTCTTTTTTTGATCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTT	HCBK121-05
79	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTACTTTTACTATCTCTAC	BACTR016-17
67	22	Tanzania	\N	GACCCTTTATTTTATTTTCGGAGCCTGAGCAGGAATAGTTGGTACATCTCTTAGAATTTTGGTTCGAGCAGAACTTGGACACCCTGGAGCTTTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCCCATGCTTTCGTAATAATTTTCTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAATTCCTTTAATACTAGGAGCACCAGATATAGCTTTCCCACGAATAAATAATATAAGATTTTGATTATTACCTCCCTCTCTTACCCTACTATTAGTAAGCAGTATAGTAGAAAATGGAGCTGGTACAGGTTGAACTGTATACCCACCACTATCCTCTATCATCGCTCATGGAGGAGCATCTGTTGATTTAGCTATCTTCTCACTTCACTTAGCAGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATACGATCTACAGGAATTTCATTTGACCGAATACCACTATTTGTATGAGCAGTAGTATTAACAGCTCTACTTCTTCTATTATCTCTTCCAGTTCTAGCCGGAGCTATTACTATACTTTTAACAGATCGAAATTTAAATACTTCTTTCTTTGACCCAGCCGGTGGAGGAGATCCTATTTTATACCAACATTTATTTTGATTCTTCGGACACCCTGAAGTATATATTTTAATTTTACCTGGATTTGGTATAATTTCTCATATTATTAGTCAAGAATCAGGTAAAAAGGAAACCTTCGGATCCCTAGGAATAATTTATGCTATA--------------------------------------------------------------------------------------------------------	JTB267-12
68	24	Kenya	\N	AACTTTATATTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGTACATCCCTTAGAATCTTAGTTCGAGCAGAGTTAGGTCATCCTGGAGCATTAATTGGAGACGATCAAATTTACAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTCCCTTTAATACTAGGAGCACCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCCTCTCTCACTCTATTGTTAGTCAGCAGCATGGTAGAAAACGGAGCTGGTACAGGTTGAACTGTATATCCACCCCTATCATCTATTATCGCCCATGGAGGAGCATCTGTCGATCTAGCTATCTTTTCACTCCACTTAGCGGGTATCTCTTCAATCTTAGGGGCTGTAAATTTTATTACAACAGTAATTAATATACGATCAACAGGAATTACATTTGATCGAATACCTTTATTTGTTTGAGCAGTAGTATTAACAGCCCTACTACTTTTATTATCTCTCCCTGTATTAGCAGGTGCTATCACAATACTTTTAACAGATCGAAATCTAAATACTTCATTTTTCGACCCAGCAGGTGGGGGAGATCCAATTCTTTATCAACATTTATTT	MVTBI011-08
69	24	Kenya	\N	AACTTTATATTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGTACATCCCTTAGAATCTTAGTTCGAGCAGAGTTAGGTCATCCTGGAGCATTAATTGGAGACGATCAAATTTACAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTCCCTTTAATACTAGGAGCACCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCCTCTCTCACTCTATTGTTAGTCAGCAGCATGGTAGAAAACGGAGCTGGTACAGGTTGAACTGTATATCCACCCCTATCATCTATTATCGCCCATGGAGGAGCATCTGTCGATCTAGCTATCTTTTCACTCCACTTAGCGGGTATCTCTTCAATCTTAGGGGCTGTAAATTTTATTACAACAGTAATTAATATACGATCAACAGGAATTACATTTGATCGAATACCTTTATTTGTTTGAGCAGTAGTATTAACAGCCCTACTACTTTTATTATCTCTCCCTGTATTAGCAGGTGCTATCACAATACTTTTAACAGATCGAAATCTAAATACTTCATTTTTCGACCCAGCAGGTGGGGGAGATCCAATTCTTTATCAACATTTATTT	MVTBI011-08
70	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGC	BACTR010-17
71	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGGGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTAC	BACTR011-17
72	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATT	BACTR017-17
73	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAG	BACTR001-17
74	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTACTTTTACTATCTCTACCTGTCTTAG	BACTR002-17
75	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATACGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTACTTTTACTATCTCT	BACTR007-17
76	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTAC	BACTR009-17
77	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTAC	BACTR012-17
78	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTACTTTTACTATCTCTACCTGT	BACTR014-17
80	29	South Africa	\N	AACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTACTTTTACTATCTCTACCTGTCTTAGCCGGTGCTATCACAATACTTTTAACAGATCGAAATCTGAATACTTCCTTTTTCGACCCAGCAGGTGGAGGAGACCCA-----	KMPMA006-18
81	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACT	BACTR004-17
82	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTAC	BACTR006-17
83	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACA	BACTR008-17
84	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAG	BACTR013-17
85	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTAC	BACTR015-17
86	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTACTTTTACTATCTCTACCTGTC	BACTR003-17
87	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTACTTTTACTATCTCT	BACTR005-17
88	29	South Africa	\N	TCGCGACAATGGCTATTTTCAACAAATCACAAAGATATTGGAACTTTATACTTCATTTTCGGGGCCTGAGCAGGAATAGTTGGCACATCTCTTAGAATTTTAGTTCGAGCAGAACTAGGTCATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTCATAGTTATACCTATTATAATCGGGGGGTTTGGAAATTGATTAGTCCCTTTAATATTAGGGGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGATTCTGGTTATTACCCCCTTCTCTCACTCTATTGTTAGTCAGCAGCATAGTGGAAAACGGAGCCGGTACAGGTTGAACTGTATACCCACCATTATCATCTATTATTGCACATGGAGGAGCATCTGTCGATCTAGCCATCTTTTCACTCCATTTAGCAGGTATCTCCTCAATCTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATGCGATCAACAGGAATTACATTCGATCGAATACCTTTATTTGTTTGAGCAGTAGTACTAACAGCCCTACTACTTTTACTATCTCTACCTGTCTTAGCGGTGCTATCACAAT	BACTR018-17
89	96	Kenya	\N	AACTTTATATTTTATTTTCGGAGCTTGAGCAGGAATAGTTGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGGCACCCAGGAGCTTTAATTGGAGATGATCAAATTTACAATGTAATTGTTACTGCTCACGCTTTTGTTATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGAAATTGATTAGTTCCCCTAATATTAGGGGCCCCAGACATAGCATTTCCACGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTTTAACCCTTCTTTTAGTGAGAAGAATAGTAGAAAACGGGGCTGGAACAGGATGAACAGTTTACCCTCCACTATCTTCTGTAATTGCTCATGGTGGTGCATCAGTTGATTTAGCAATTTTTTCATTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACAACAGTAATTAATATACGATCCACAGGAATTTCATTTGACCGAATACCTTTATTTGTTTGAGCTGTTGTTTTAACTGCTCTTTTACTACTTTTGTCTCTACCCGTATTAGCTGGAGCTATTACTATATTACTTACTGATCGAAATTTAAATACATCATTTTTTGACCCAGCAGGAGGAGGAGATCCTATCTTGTATCAACATTTATTT	MVTBI012-08
90	97	Kenya	\N	AACTTTATATTTTATTTTCGGGGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATCCTAATTCGAGCTGAACTTGGTCATCCTGGTGCTTTAATTGGTGATGATCAAATTTATAATGTAATTGTAACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGACTTCTTCCTCCTTCTCTTACACTACTTTTAGTGAGCAGAATAGTAGAAAATGGAGCTGGTACAGGTTGAACAGTTTACCCTCCCCTATCTTCTGTAATTGCTCATGGAGGAGCTTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTACATTTGATCGAATACCATTATTTGTTTGAGCCGTTGTTTTAACAGCATTATTATTACTTTTATCATTACCTGTATTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGTGGAGATCCTATTTTATACCAACATCTATTT	MVTBI013-08
128	120	Kenya	\N	----------------------------------------------------TAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTACTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTANTATATTATTAACAGATCGAAATTTAAATACTTC------------------------------------------------------	MVTBI168-08
91	98	Tanzania	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGGCACCCAGGAGCTTTAATTGGGGATGATCAAATCTATAATGTAATTGTTACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCACCAGATATAGCATTTCCACGAATAAATAATATAAGTTTTTGATTACTACCCCCTTCTTTAACCCTTCTTTTAGTGAGAAGAATAGTAGAAAACGGAGCTGGAACAGGATGAACAGTTTACCCACCACTATCATCTGTAATTGCCCATGGAGGAGCCTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCTATTTTAGGAGCTGTAAATTTTATCACTACAGTTATTAATATACGATCAACAGGAATTTCATTTGATCGAATACCTCTATTTGTTTGAGCTGTTGTTTTAACTGCTCTTTTATTACTTTTATCACTACCTGTATTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTTTTTGATCCAGCCGGAGGAGGAGATCCAATTTTATACCAACACTTATTTTGATTTTTTGGTCATCCAGAAGTTTATATTTTAATTTTACCTGGATTTGGAATAATCTCCCATATTATTAGTCAAGAAGCAGGAAAAAAAGAAACTTTCGGTTCTTTAGGAATAATTTATGCTATAATAGCAATTGGATTACTTGGTTTTATTGTTTGAGCTCACCATATATTTACAGTCGGTATAGATGTAGACAC---------------------------------	JTB251-12
92	98	Tanzania	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACACCCAGGAGCTTTAATTGGGGATGATCAAATCTATAATGTAATTGTTACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCACCAGATATAGCATTTCCACGAATAAATAATATAAGTTTTTGATTACTACCCCCTTCTTTAACCCTTCTTTTAGTGAGAAGAATAGTAGAAAACGGAGCTGGAACAGGATGAACAGTCTACCCACCACTATCATCTGTAATTGCCCATGGAGGAGCCTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCTATTTTAGGAGCTGTAAATTTTATCACTACAGTTATTAATATACGATCAACAGGAATTTCATTTGATCGAATACCTCTATTTGTTTGAGCTGTTGTTTTAACTGCTCTTTTATTACTTTTATCACTACCTGTATTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTTTTTGATCCAGCCGGAGGAGGAGATCCAATTTTATACCAACACTTATTTTGATTTTTTGGTCATCCAGAAGTTTATATTTTAATTTTACCTGGATTTGGAATAATCTCCCATATTATTAGTCAAGAAGCAGGAAAAAAGGAAACTTTCGGTTCTTTAGGAATAATTTATGCTATAATAGCAATTGGATTACTTGGTTTTATTGTTTGAGCTCACCATATATTTACAGTCGGTATAGATGTAGACACTCGAG----------------------------	JTB254-12
93	98	Kenya	\N	AACTTTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGGCACCCAGGAGCTTTAATTGGAGATGATCAAATCTATAATGTGATTGTTACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTCGGAAATTGATTAGTTCCTTTAATATTAGGAGCACCAGATATAGCATTTCCACGAATAAATAATATAAGTTTTTGATTACTACCCCCTTCTTTAACCCTTCTTTTAGTGAGAAGAATAGTGGAAAACGGAGCTGGAACAGGATGGACAGTCTACCCACCACTATCATCTGTAATAGCCCACGGAGGGGCCTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCCGGAATTTCATCTATTTTAGGAGCTGTAAATTTTATTACTACAGTTATTAATATACGATCAACAGGAATTTCATTTGATCGAATACCTCTATTTGTTTGAGCTGTTGTTTTAACTGCTCTCTTATTACTTTTATCATTACCTGTATTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCAGCCGGAGGAGGAGACCCAATTTTATATCAACACTTATTT	MVTBI014-08
94	98	Kenya	\N	AACTTTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGGCACCCAGGAGCTTTAATTGGAGATGATCAAATCTATAATGTAATTGTTACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCACCAGATATAGCATTTCCACGAATAAATAACATAAGTTTTTGATTACTACCCCCTTCTTTAACCCTTCTTTTAGTGAGAAGAATAGTAGAAAACGGAGCTGGAACAGGATGAACAGTTTACCCACCACTATCATCTGTAATTGCCCATGGAGGAGCCTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCTATTTTAGGAGCTGTAAATTTTATCACTACAGTTATTAATATACGATCAACAGGAATTTCATTTGATCGAATACCTCTATTTGTTTGAGCTGTTGTTTTAACTGCTCTTTTATTACTTTTATCACTACCTGTATTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTTTTTGATCCAGCCGGAGGAGGAGATCCAATTTTATACCAACACTTATTT	MVTBI015-08
95	99	Mozambique	\N	-ACTTTATATTTCATCTTCGGAGCTTGAGCAGGTATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCCGAATTGGGCCACCCAGGAGCTTTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCCCATGCCTTTGTCATAATTTTCTTTATAGTTATACCCATTATAATCGGAGGATTCGGTAACTGATTAGTACCCCTTATACTAGGAGCACCCGATATAGCATTCCCTCGAATAAACAATATAAGCTTCTGGCTATTGCCCCCTTCTCTCACACTATTATTAGTAAGCAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCCCCCCTATCATCCGTCATCGCTCATGGAGGAGCTTCTGTTGATCTAGCAATTTTTTCACTTCATTTAGCCGGTATTTCATCAATTCTTGGAGCTGTAAATTTTATTACAACAGTTATTAACATACGATCAACAGGTATTACATTTGACCGAATACCATTATTCGTTTGAGCTGTAGTTTTAACCGCCCTTTTACTTTTATTATCTCTTCCCGTCCTAGCTGGAGCTATTACTATACTACTAACAGACCGAAATTTAAATACATCTTTTTTTGACCCAGCAGGAGGAGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGCCATCCAGAAGTTTATATTTTAATTTTACCCGGATTCGGAATAATTTCCCACATTATTAGTCAAGAATCAGGAAAGAAAGAAACATTCGGTGCTTTAGGAATAATTTATGCTATAATAGCAATTGGATTATTAGGGTTTATTGTATGAGCACATCATATATTCACTGTAGGCATAGATGTTGATACACGAGCCTATTTTACTTCAGCAACAA-------	JTB036-12
96	99	Tanzania	\N	CACTTTATATTTCATCTTCGGAGCTTGAGCAGGTATAGTAGGAACATCCCTTAGAATTTTAATCCGAGCCGAATTGGGCCATCCAGGAGCTTTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCCCATGCCTTTGTCATAATTTTCTTTATAGTTATACCCATTATAATCGGAGGATTCGGTAACTGATTAGTACCCCTTATACTAGGAGCGCCCGATATAGCATTCCCTCGGATAAACAATATAAGCTTCTGACTATTGCCCCCTTCTCTCACACTATTATTAGTAAGCAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCCCCCCTATCATCCGTCATCGCTCATGGAGGAGCTTCTGTTGATCTAGCAATTTTTTCACTTCATTTAGCCGGTATTTCATCAATTCTTGGGGCTGTAAATTTTATTACAACAGTTATTAACATACGATCAACAGGTATTACATTTGACCGAATACCATTATTCGTTTGAGCTGTAGTTTTAACCGCCCTTTTACTTTTATTATCTCTTCCCGTCCTAGCTGGAGCTATTACTATACTACTAACAGACCGAAATTTAAATACATCTTTTTTTGACCCAGCAGGAGGAGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGCCATCCAGAAGTTTATATTTTAATTTTACCCGGATTCGGAATAATCTCCCACATTATTAGTCAAGAATCAGGAAAGAAAGAAACATTCGGTGCTTTAGGAATAATTTACGCTAT---------------------------------------------------------------------------------------------------------	JTB266-12
97	114	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACTTCCCTTAGTTTAATTATTCGAGCTGAATTAGGAAACCCTGGTTCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCTCATGCATTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTCTAATACTTGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTACTACCCCCTTCTTTAACTCTTCTTATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCTTCTAATATTGCTCATGGAGGGAGCTCAGTTGATTTAGCTATTTTTTCCCTTCATTTAGCCGGAATTTCTTCTATTTTAGGGGCTATTAATTTTATTACTACTATTATTAATATACGTGTAAATGGTTTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGTATTACTGCTTTATTATTATTACTATCTCTTCCAGTTTTAGCAGGGGCTATTACTATATTACTTACTGATCGTAACTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGAGACCCAATTTTATATCAACATTTATTT	PMANK417-08
98	114	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACTTCCCTTAGTTTAATTATTCGAGCTGAATTAGGAAACCCTGGTTCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCTCATGCATTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTCTAATACTTGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTACTACCCCCTTCTTTAACTCTTCTTATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCTTCTAATATTGCTCATGGAGGGAGCTCAGTTGATTTAGCTATTTTTTCCCTTCATTTAGCCGGAATTTCTTCTATTTTAGGGGCTATTAATTTTATTACTACTATTATTAATATACGTGTAAATGGTTTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGTATTACTGCTTTATTATTACTACTATCTCTTCCAGTTTTAGCAGGGGCTATTACTATATTACTTACTGATCGTAACTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGAGACCCAATTTTATATCAAC--------	PMANK418-08
99	114	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACTTCCCTTAGTTTAATTATTCGAGCTGAATTAGGAAACCCTGGTTCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCTCATGCATTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTCTAATACTTGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTATTACCCCCTTCTTTAACTCTTCTTATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCTTCTAATATTGCTCATGGAGGGAGCTCAGTTGATTTAGCTATTTTTTCCCTTCATTTAGCCGGAATTTCTTCTATTTTAGGGGCTATTAATTTTATTACTACTATTATTAATATACGTGTAAATGGTTTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGTATTACTGCTTTATTATTATTATTATCTCTTCCAGTTTTAGCAGGGGCTATTACTATATTACTTACTGATCGTAACTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGAGACCCAATTTTATATC-----------	PMANK420-08
100	114	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACTTCCCTTAGTTTAATTATTCGAGCTGAATTAGGAAACCCTGGTTCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCTCATGCATTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTCTAATACTTGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTACTACCCCCTTCTTTAACTCTTCTTATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCTTCTAATATTGCTCATGGAGGAAGCTCAGTTGATTTAGCTATTTTTTCCCTTCATTTAGCCGGAATTTCTTCTATTTTAGGGGCTATTAATTTTATTACTACTATTATTAATATACGTGTAAATGGTTTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGTATTACTGCTTTATTATTATTATTATCTCTTCCAGTTTTAGCAGGGGCTATTACTATATTACTTACTGATCGTAACTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGAGACCCAATTTTATATC-----------	PMANK421-08
101	115	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATGTTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTCTATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGGATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTGGATACTCGAGCTTATTTTACATCAGCAACAAT------	JTB169-12
102	115	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACCACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTATATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGGATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGATACTCGAGCTTATTTTACATCAGCAACAATAATTAT	JTB201-12
103	115	Ghana	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCATCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAACACGTCATTCTTTGACCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTATATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGGTCATTAGGGATAATTTATGCTATACTAGCAATTGGTTTATTAGGATTTATT-----------------------------------------------------------------------------	JTB328-12
104	115	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGTGACCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAGGTATATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATA--------------------------------------------------------------------------------------------------------	JTB341-12
105	115	Liberia	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCATCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGATCCAGCAGGAGGAGGTGATCCAATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTCTATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGGTCATTAGGGATAATTTATGCTATACT------------------------------------------------------------------------------------------------------	JTB345-12
106	115	Cameroon	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGTGATCCTATTT-----------------	MVTBI018-08
107	115	Cameroon	\N	AACTTTATATTTTATTTTTGGAGCAATAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCATCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGGGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATCACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGTCCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTT	MVTBI020-08
108	115	Kenya	\N	AACTTTATATTTTTTTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGGG-----------------------------	MVTBI021-08
109	115	Kenya	\N	AACTTTATATTTTTTTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCATCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCAGCAGGAGGGG-----------------------------	MVTBI022-08
110	115	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCATCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAACACGTCATTCTTTGACCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTATATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGGTCATTAGGGATAATTTATGCTATACTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGATACTCGAGCTTATTTTACATCAGCAACA--------	JTB185-12
111	115	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTATATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGGATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGATACTCGAGCTTATTTTACATCAGCAACAATAATT--	JTB209-12
112	115	Benin	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGTGACCCTATTTTATACCAACACTTATTTTGATTTTTTGGGCATCCTGAAGTCTATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGATCATTAGGGATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGG------------------------------------------------	JTB259-12
113	115	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCATCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGATCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTCTATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGCCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGGATAATTTATGCTATACTA-----------------------------------------------------------------------------------------------------	JTB320-12
114	115	Cameroon	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCATCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTT	MVTBI019-08
115	115	Kenya	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGGAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTT	MVTBI023-08
116	118	Togo	\N	GACTTTATACTTCATTTTCGGAGCTTGAGCTGGTACAGTAGGAACATCTCTTAGAATTTTAATTCGGACTGAATTAGGACACCCAGGAACATTAATTGACGATAATCAAATTTATAATGTAGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTCCCTCTTATACTTGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACTCTTCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCCTCTGTAATTGCTCACGGAGGGGCTTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAATATGCGATCTACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTACTTTTATCATTACCAGTCTTAGCTGGAGCTATTACAATACTATTAACAGACCGAAATCTAAATACATCATTCTTTGACCCAGCTGGGGGAGGAGATCCTATTTTATACCAACATCTATTTTGATTTTTTGGGCACCCTGAAGTTTACATTTTAATTTTACCTGGATTTGGAATAATTTCTCATATTATTAGTCAAGAATCCGGAAAAAAGGAAACATTCGGGTCATTAGGAATAATTTATGCTATAATAGCAATTGGCTTATTAGGATTTATCGTATGAGCTCACCACATATTCACAG----------------------------------------------------	JTB002-12
117	118	\N	\N	GACCTTATACTTCATTTTCGGGGCTTGAGCTGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGGACTGAATTAGGACACCCAGGAACATTAATTGACGATAATCAAATTTATAATGTAGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTCCCCCTTATACTTGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGGTTATTACCTCCTTCTCTTACTCTTCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCCTCTGTAATTGCCCACGGAGGGGCTTCAGTTGATTTAGCAATTTTTTCTTTGCATTTAGCAGGTATTTCTTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAATATACGATCTACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTACTTTTATCATTACCAGTCTTAGCTGGAGCTATTACAATACTATTAACAGACCGAAATCTAAATACATCATTCTTTGACCCAGCTGGGGGAGGAGATCCTATTTTATACCAACATCTATTTTGATTTTTTGGGCACCCTGAAGTTTACATTTTAATTTTACCTGGATTTGGAATAATTTCTCATATTATTAGTCAAGAATCCGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATAATAGCAATTGGCTTATTAGGATTTAT------------------------------------------------------------------------------	JTB225-12
129	120	Kenya	\N	------------TTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTT--	MVTBI169-08
118	118	Senegal	\N	GACCTTATACTTCATTTTCGGGGCTTGAGCTGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGGACTGAATTAGGACACCCAGGAACATTAATTGACGATAATCAAATTTATAATGTAGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTCCCTCTTATACTTGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACTCTTCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCCTCTGTAATTGCCCACGGAGGGGCTTCAGTTGATTTAGCAATTTTTTCTTTGCATTTAGCAGGTATTTCTTCAATTTTAGGAGCAGTTAATTTTATTACAACAGTTATTAATATGCGATCTACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTACTTTTATCATTACCAGTCTTAGCTGGAGCTATTACAATACTATTAACAGACCGAAATCTAAATACATCATTCTTTGACCCAGCTGGGGGAGGAGATCCTATTTTATACCAACATCTATTTTGATTTTTTGGGCACCCTGAAGTTTACATTTTAATTTTACCTGGATTTGGAATAATTTCTCATATTATTAGTCAAGAATCCGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATAATAGCAATTGGCTTATTAGGATTTATCGTATGAGCTCACCACATATTCACAGTTGGTATGGATGTAGAC-----------------------------------	JTB302-12
119	118	Tanzania	\N	GACTTTATACTTCATTTTCGGAGCTTGAGCCGGTATAGTGGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACACCCGGGAACATTAATTGATGACAATCAAATCTATAATGTCGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGGGGATTTGGAAATTGACTTGTCCCCCTTATACTTGGTGCCCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGGCTATTACCCCCTTCTCTTACACTTCTTCTAGTAAGCAGAATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTAATTGCTCACGGAGGAGCTTCAGTCGATTTAGCAATCTTTTCCCTTCATTTAGCAGGTGTTTCCTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAACATACGATCTACCGGGATTACTTTTGACCGAATACCTTTATTTGTATGAGCTGTCGTCCTCACTGCATTATTACTATTGTTATCATTACCAGTCTTAGCGGGGGCTATTACGATACTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCAGCAGGAGGGGGGGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGCCACCCTGAAGTTTATATTTTAATTTTACCTGGATTTGGAATAATTTCCCACATTATTAGCCAAGAATCCGGAAAAAAAGAAACATTCGGCTCATTAGGAATAATTTATGCTATAATAGCAATTGGCCTATTGGGATTTATTGTGTGAGCCCATCATATATTTACAGTTGGGATAGATGTGGATACACGAGCTT-------------------------	JTB305-12
120	118	Tanzania	\N	GACTTTATACTTCATTTTCGGAGCTTGAGCCGGTATAGTGGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACACCCGGGAACATTAATTGATGACAATCAAATCTATAATGTCGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGGGGATTTGGAAATTGACTTGTCCCCCTTATACTTGGTGCCCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGGCTATTACCCCCTTCTCTTACACTTCTTCTAGTAAGCAGAATAGTAGAAAACGGGGCTGGAACAGGTTGGACAGTTTACCCTCCTCTTTCTTCTGTAATTGCTCACGGAGGAGCTTCAGTCGATTTAGCAATCTTTTCCCTTCATTTAGCAGGTGTTTCCTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAACATACGATCTACCGGGATTACTTTTGACCGAATACCTTTATTTGTATGAGCTGTCGTCCTCACTGCATTATTGCTATTGTTATCATTACCAGTCTTAGCAGGGGCTATTACGATACTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCAGCGGGAGGGGGGGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGCCACCCTGAAGTTTATATTTTAATTTTACCTGGATTTGGAATAATTTCCCACATTATTAGCCAAGAATCCGGAAAAAAAGAAACATTCGGCTCATTAGGAATAATTTATGCTATAATAGCAATTGGTCTATTGGGATTTATTGTGTGAGCCCATCATATATTTACAGTTGGGATAGATGTGGATACACGAGC---------------------------	JTB307-12
121	118	Togo	\N	GACTTTATACTTCATTTTCGGGGCTTGAGCTGGTATAGTGGGAACATCTCTTAGAATTTTAATTCGGACTGAATTAGGCCACCCAGGAACATTAATTGACGATAATCAAATTTATAATGTAGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTCCCTCTTATACTTGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACTCTTCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCCTCTGTAATTGCCCACGGAGGGGCTTCAGTTGATTTAGCAATTTTTTCTTTGCATTTAGCAGGTATTTCTTCAATTTTAGGAGCAGTTAATTTTATTACAACAGTTATTAATATGCGATCTACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTACTTTTATCATTACCAGTCTTAGCTGGAGCTATTACAATACTATTAACAGACCGAAATCTAAATACATCATTCTTTGACCCAGCTGGGGGAGGAGATCCTATTTTATACCAACATCTATTTTGATTTTTTGGGCACCCTGAAGTTTACATTTTAATTTTACCTGGATTTGGAATAATTTCTCATATTATTAGTCTTGAATCCGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTAT---------------------------------------------------------------------------------------------------------	JTB347-12
122	118	Benin	\N	AACCTTATACTTCATTTTCGGAGCTTGAGCTGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACACCCAGGAACATTAATTGACGATAATCAAATTTATAATGTAGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTCCCTCTTATACTTGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACTCTTCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCCTCTGTAATTGCCCACGGAGGGGCTTCAGTTGATTTAGCAATTTTTTCTTTGCATTTAGCAGGTATTTCTTCAATTTTAGGAGCAGTTAATTTTATTACAACAGTTATTAATATGCGATCTACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTACTTTTATCATTACCAGTCTTAGCCGGAGCTATTACAATACTATTAACAGACCGAAATCTAAATACATCATTCTTTGACCCAGCTGGGGGAGGAGATCCTATTTTATACCAACATCTATTT	MVTBI024-08
123	118	Cameroon	\N	AACCTTATACTTCATTTTCGGAGCTTGAGCTGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACACCCAGGAACATTAATTGATGATAATCAAATTTATAATGTAGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTTGTCCCTCTTATACTTGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACTCTTCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCCTCTGTAATTGCCCACGGGGGAGCTTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAATATACGATCTACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTACTGTTATCATTACCAGTCTTAGCGGGAGCTATTACAATACTATTAACAGACCGAAATTTAAACACATCATTCTTTGATCCAGCCGGAGGAGGAGATCCTATTTTATACCAACATCTATTT	MVTBI025-08
124	118	Cote d'Ivoire	\N	AACTTTATACTTCATTTTCGGAGCTTGAGCTGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGGACTGAATTAGGACACCCAGGAACATTAATTGACGATAATCAAATTTATAATGTAGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTCCCTCTTATACTTGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACTCTTCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCCGGAACAGGTTGAACAGTTTACCCTCCCCTTTCCTCTGTAATTGCTCACGGAGGGGCTTCAGTTGATTTAGCAATTTTCTCTTTACATTTAGCAGGTATTTCTTCAATTTTAGGAGCAGTTAATTTTATTACAACAGTTATTAATATGCGATCTACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTACTTTTATCATTACCAGTCTTAGCTGGAGCTATTACAATACTATTAACAGACCGAAATCTAAATACATCATTCTTTGACCCAGCTGGGGGAGGAGATCCTATTTTATACCAACATCTATTT	MVTBI026-08
125	118	Cote d'Ivoire	\N	AACTTTATACTTCATTTTCGGAGCTTGAGCTGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGGACTGAATTAGGACACCCAGGAACATTAATTGACGATAATCAAATTTATAATGTAGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTCCCTCTTATACTTGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACTCTTCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCCTCTGTAATTGCTCACGGAGGGGCTTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCAGGTATTTCTTCAATTTTAGGAGCAGTTAATTTTATTACAACAGTTATTAATATGCGATCTACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTACTTTTATCATTACCAGTCTTAGCTGGAGCTATTACAATACTATTAACAGACCGAAATCTAAATACATCATTCTTTGACCCAGCTGGGGGAGGAGATCCTATTTTATACCAACATCTATTT	MVTBI027-08
126	118	Kenya	\N	----------------------------GCTGGTATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACATCCAGGAACATTAATTGATGATAATCAAATTTATAATGTAATTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGCCCCTCTTATACTTGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCATCTGTAATTGCTCACGGAGGGGCTTCAGTCGATTTAGCAATTTTTTCTCTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAATATACGATCAACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTTTTACTATCATTACCAGTCTTAGCGGGAGCTATTACAATACTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCAGCAGGAGGAGGGGACCCTATTTTATACCAACATTTATTT	MVTBI028-08
127	118	Guinea	\N	-----------------------------------TAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACACCCGGGAACATTAATTGACGATAATCAAATTTATAATGTAGTTGTAACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAACTGACTTGTCCCTCTTATACTTGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCCCCATCTCTTACTCTCCTTCTAGTAAGCAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCCTCTGTAATTGCTCACGGAGGGGCTTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCAGGTATTTCTTCAATTTTAGGAGCAGTTAATTTTATTACAACAGTTATTAATATACGATCTACCGGAATTACTTTTGATCGAATACCTTTATTTGTATGAGCTGTCGTCCTTACTGCATTATTACTACTATTATCATTACCAGTCTTAGCAGGAGCTATTACAATACTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCAGCTGGAGGAGGAGATCCTATTTTATACCAACATCTATTT	MVTBI292-09
130	121	Egypt	\N	GACATTATATTTTATTTTTGGAGCATGAGCTGGTATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATACTAGCTATTGGATTATTAGGATTTATTGTTTGAGCACACCATATATTTACAGTTGGTATAGACGTTGACACACGAGCTTACTTTACATCAG-------------	JTB108-12
131	121	Zambia	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATACT------------------------------------------------------------------------------------------------------	JTB230-12
132	121	Kenya	\N	------ATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCCTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCTATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTT	MVTBI031-08
133	121	Reunion	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTTTAAGAATTTTAATTCGAGCTGAATTAGGGCATCCAGGAGCATTAATTGGAGACGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTGCCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCCTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGC-GGAGGGGGAGACCCTATTTTATACCAACATTTATTT	MVTBI032-08
134	121	Senegal	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAACAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTAGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTCACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATAC-------------------------------------------------------------------------------------------------------	JTB233-12
135	121	Mozambique	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATACTAGCTATT-----------------------------------------------------------------------------------------------	JTB292-12
136	121	Togo	\N	GACATTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAACAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTNGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTCACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTA----------------------------------------------------------------------------------------------------------	JTB351-12
137	121	South Africa	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCATTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCCGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATACTAGCTATTGGATTATTAGGATTTATTGTTTGAGCACACCATATATTTACAGTTGGTATAGACGTTGACACACGAGCTTACTTA--------------------	JTB142-12
138	121	Mozambique	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGGTTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATACTAGCTATTGGATTATTAGGATTTATTGTTTGAGCACACCATATATTTACAGTTGGTATAGACGTTGACACACGAGCTTACTTAC-------------------	JTB107-12
139	121	Sudan	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGCTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATACTAGCTATTGGATTATTAGGATTTATTGTTTGAGCACACCATATATTTACAGTTGGTATAGACGTTGATACACGAG----------------------------	JTB304-12
140	121	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATA--------------------------------------------------------------------------------------------------------	JTB315-12
141	121	Seychelles	\N	----------------------------------------GGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGGGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATGCCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTT	MVTBI034-08
142	121	Sudan	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATGCGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGATCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGGATAATTTATGCTATACTAGCTATTGGATTATTAGGATTT--------------------------------------------------------------------------------	JTB301-12
143	121	Benin	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTAGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTCACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTT	MVTBI029-08
144	121	Peru	MN454441	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAAATGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCCGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCGGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTT	SENTO547-17
145	121	Mozambique	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGACTAGTGCCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCCTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGGCATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATACTAGCTATTGG---------------------------------------------------------------------------------------------	JTB289-12
146	121	Peru	MN454462	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAACTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTT	SENTO472-17
147	121	South Africa	\N	GACTTTATATTTTATTTTTGGGGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCGCATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATACTAGCTATTGGATTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGACGTTGACACACGAGCTT-------------------------	JTB160-12
148	121	Ghana	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATACCAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAACAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTAGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTCACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGGCATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACGGGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTAT---------------------------------------------------------------------------------------------------------	JTB295-12
149	121	Spain	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTT	MVTBI030-08
150	121	Reunion	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTTTAAGAATTTTAATTCGAGCTGAATTAGGGCATCCAGGAGCATTAATTGGAGACGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTGCCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCCTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTT	MVTBI033-08
151	121	Tanzania	\N	-----TATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTATCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTT	MVTBI035-08
152	121	Peru	MN454474	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTTACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTT	SENTO469-17
153	121	Ghana	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCTTAAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATACTTGGAGCACCAGATATGGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTGATTGCTCATGGAGGTGCTTCTGTAGACTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATCACAACAGTAATTAATATACGATCTACCGGAATTTCATTCGACCGAATACCTTTATTTGTTTGAGCAGTAGTTCTCACTGCACTACTTCTATTATTATCTTTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCTGGAGGGGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTTTACCAGGATTTGGAATAATTTCACATATTATTAGACAAGAATCAGGAAAAAAGGAAACTTTCGGTTCATTAGGAATAATTTATGCTATACTAGCTATTGGATTATTAGGATT---------------------------------------------------------------------------------	JTB298-12
154	122	Liberia	\N	AACTTTATATTTCATTTTTGGAGCTTGAGCAGGAATGGTCGGAACCTCCCTCAGAATTTTGGTTCGAGCTGAATTAGGTCATCCAGGTGCCTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACTGCTCACGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGATTAGTTCCCTTAATATTAGGAGCCCCTGATATAGCATTTCCCCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACTCTCCTTTTAGTAAGAAGCATAGTCGAAAATGGAGCTGGTACAGGCTGAACAGTTTATCCTCCCTTATCGTCAGTAATTGCACATGGAGGAGCATCCGTCGATTTAGCAATTTTTTCATTACACTTAGCCGGAATTTCTTCTATTTTAGGTGCCGTAAATTTTATTACAACAGTTATTAATATACGATCAACAGGGATTACATTTGACCGAATACCCTTATTTGTCTGAGCAGTCGTATTAACCGCTCTCCTTCTATTACTTTCTTTACCTGTCTTAGCCGGAGCTATCACAATGTTATTAACAGATCGTAATTTAAATACTTCCTTCTTTGACCCCGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTT	MVTBI275-09
155	124	Kenya	\N	AACCTTATATTTTATTTTTGGTGCATGAGCTGGGATAGTAGGTACCTCTCTTAGAATTTTAATTCGTGCTGAATTAGGNCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAACGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCCATCATAATTGGAGGATTCGGGAACTGATTAGTTCCCTTAATACTAGGTGCTCCAGATATAGCTTTTCCTCGAATAAATAACATAAGTTTTTGGTTACTGCCCCCTTCCCTTACACTTCTATTAGCAAGTAGAATAGTGGAAAATGGGGCTGGAACAGGTTGAACAGTTTATCCCCCCCTTTCTTCTGTAATTGCCCATGGAGGGGCTTCTGTTGATTTAGCAATCTTTTCTCTTCATCTAGCAGGAATTTCTTCAATCTTAGGAGCTGTAAATTTTATCACCACAGTTATTAATATGCGATCAACTGGGATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTAGTTCTTACCGCATTATTACTTTTGTTATCTCTCCCAGTTTTAGCCGGAGCTATTACAATACTTTTAACAGATCGAAATTTAAACACTTCATTTTTTGACCCAGCTGGAGGAGGAGACCCTATTTTATACCAACACTTATTT	MVTBI038-08
156	125	Burundi	\N	TGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGTGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTTTGAT	AFRFF023-16
157	125	Kenya	\N	TAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGATCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCA	AFRFF033-16
158	125	Kenya	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGGGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGCATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTGTACCAACACTTATTCTGAT	AFRFF035-16
159	125	Kenya	\N	GACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACC	AFRFF040-16
160	125	Mozambique	\N	GTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATTTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCA	AFRFF042-16
161	125	Nigeria	\N	TAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATCGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGG	AFRFF045-16
162	125	Nigeria	\N	GCATGAGCTGGANTAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAG	AFRFF046-16
163	125	Senegal	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGANNTATNNCNATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCC	AFRFF048-16
164	125	South Africa	\N	CTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTGTACCAACACTTATTCTGAT	AFRFF052-16
165	125	Tanzania	\N	TAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGATCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGG	AFRFF057-16
166	125	Tanzania	\N	ACAAAAGATATTGGAACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTTTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGATGG	AFRFF059-16
167	125	South Africa	\N	TAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGTCA	AFRFF073-16
168	125	South Africa	\N	TGGATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTTACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTGTTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACGGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCTCTCCATTTAGCTGGAATCTCTTCAATTTTAGGGGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCTCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGTCACC	AFRFF074-16
169	125	Tanzania	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGCGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTT	AFRFF102-16
170	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATCGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTGACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGAGCCAATTTTATACCAACACTTATTC	CRI004-16
171	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI008-16
172	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCAATTTTTATACCAACACTTATTC	CRI012-16
173	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTCATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACAAACACTTATT-	CRI014-16
174	125	South Africa	\N	AACATTATATTTTATTTTCGCTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGGGATCCAATTTTATATCAACACTTATTC	CRI020-16
175	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI028-16
176	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGG----------------------------	CRI036-16
177	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTGTTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCTCTCCATTTAGCTGGAATCTCTTCAATTTTAGGAGCAGTAAACTTTATCACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCTCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI038-16
178	125	South Africa	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGATCCAGCAGGAGGAG-----------------------------	CRI039-16
179	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI042-16
180	125	South Africa	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATTTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTT	CRI044-16
181	125	South Africa	\N	---------------------TGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTGTTACCTCCTTCTCTCACACTCTTATTAGTGAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTAAAACAACACTTATTC	CRI048-16
182	125	Mozambique	\N	GACATTATATTTTATTTTCGGGGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGATCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCTCTTCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAG-------------------------------------------------	JTB020-12
183	125	Mali	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	JTB045-12
184	125	Mali	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGCATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCGGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTTGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATTT---------------------	JTB055-12
185	125	Burkina Faso	\N	GACATTATATTTTATTTTCGGGGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGATCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAAGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATTAC--------------------	JTB116-12
186	125	Burkina Faso	\N	-ACATTATATTTTATTTTCGGTGCTTGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAAGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGA-----------------------------------------------	JTB120-12
187	125	Burkina Faso	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	JTB130-12
188	125	Burkina Faso	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGATCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAAGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATTTA--------------------	JTB159-12
189	125	Cote d'Ivoire	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGACTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAACGGAGCCGGAACAGGTTGAACAGTTTATCCTCCACTTTCTTCTGTAATCGCTCATGGAGGTGCATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTGTTAACTGCTCTTCTATTACTTCTTTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTC	MVTBI042-08
190	125	Kenya	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGGGCATCAGTTGATTTAGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI043-08
191	125	Mozambique	\N	--AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGATCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI226-08
192	125	Burundi	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGTGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTNCAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGTCA	AFRFF024-16
193	125	Ethiopia	\N	AGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATGGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCTTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGG	AFRFF029-16
194	125	Cote d'Ivoire	\N	CCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTACTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCA	AFRFF030-16
195	125	Cote d'Ivoire	\N	AGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGATCC	AFRFF032-16
196	125	Kenya	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATATCAACACTTATTCTGAT	AFRFF036-16
197	125	Kenya	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGATCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGAT	AFRFF037-16
198	125	Kenya	\N	AGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCTCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACC	AFRFF039-16
199	125	Mozambique	\N	TAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCACCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAG	AFRFF043-16
200	125	Senegal	\N	CTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTACTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTCTGAT	AFRFF049-16
201	125	Senegal	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGCAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATCGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTT	AFRFF051-16
202	125	Sudan	\N	TCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATGGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGAT	AFRFF055-16
203	125	South Africa	\N	NCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTGTTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCTCTCCATTTAGCTGGAATCTCTTCAATTTTAGGAGCAGTAAACTTTATCACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCTCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGTCACC	AFRFF072-16
204	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI001-16
205	125	South Africa	\N	--------------------------------------TAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATT-	CRI003-16
206	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCCGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI005-16
207	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI009-16
208	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGGGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATT-	CRI018-16
209	125	South Africa	\N	--------------------------------------------------TTAGAATTTTAATTCGAGCTGAATTAGGTTATCTTGGAGCATTAATTGGAGATGATCAAATTTATAACGTAATTTTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGG----------------------------	CRI023-16
210	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI030-16
211	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAAATGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGTGCTATC---------------------------------------------------------------------------------------	CRI033-16
212	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCCGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI041-16
213	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCGGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACC-----------------------	CRI045-16
214	125	South Africa	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGATCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI046-16
215	125	South Africa	\N	ACCATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTGAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGG----------------------------	CRI050-16
216	125	Mali	\N	-------TATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGC---------------------------	JTB044-12
217	125	Mali	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGCATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCGGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTTGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTT-------------------------	JTB064-12
218	125	Mali	\N	-----TTTATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATTT---------------------	JTB067-12
219	125	Mali	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATCATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTGTACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAAGAAACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAG----------------------------	JTB075-12
229	125	Senegal	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCCCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI045-08
220	125	Mali	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATTTA--------------------	JTB085-12
221	125	Burkina Faso	\N	GACATTATATTTTATTTTCGGGGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATCGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATT----------------------	JTB136-12
222	125	Burkina Faso	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAAGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATTTAC-------------------	JTB138-12
223	125	Burkina Faso	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATTTAC-------------------	JTB149-12
224	125	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGATCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGTGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCTGGTTTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTACTTGGTTTTATTGTTTGAGCTCATCATATATTTACAGTAGGTATAGACGTTGACACTCGAGCTTATTTCACATCAGCA-----------	JTB184-12
225	125	Botswana	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTGTACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATCTCCCATATTATTAGTCAAGAATCAGGGAAAAAAGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGT---------------------------------------	JTB277-12
226	125	Togo	\N	GACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGAGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGACTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCTCCACTTTCTTCTGTAATCGCCCATGGAGGTGCATCAGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCCTCAATTTTAGGGGCAGTAAATTTTATTACTACAGTTATTAATATGCGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATATCAACACTTATTCTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCTGGTTTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTACTTGGTTTTATTGTTTGAGCTCATCATATATTTACAGTAGGTATAGACGT---------------------------------------	JTB288-12
227	125	Benin	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTGGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTTTACCTGTTTTAGCAGGAGCTATTACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI040-08
228	125	Kenya	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI044-08
230	125	Tanzania	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATTTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI047-08
231	125	Madagascar	\N	--AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATATCAACACTTATTC	MVTBI224-08
232	125	Mozambique	\N	--GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI225-08
233	125	Burundi	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGTGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCA	AFRFF025-16
234	125	Burundi	\N	GCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGTGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTTTGAT	AFRFF026-16
235	125	Cote d'Ivoire	\N	TAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTACTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTT	AFRFF031-16
236	125	Kenya	\N	TAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACC	AFRFF034-16
237	125	Kenya	\N	AGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACC	AFRFF038-16
238	125	Mozambique	\N	TAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCA	AFRFF044-16
239	125	Nigeria	\N	CTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCA	AFRFF047-16
240	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCCGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTCTGAT	AFRFF053-16
241	125	Sudan	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATGGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGAT	AFRFF054-16
242	125	Sudan	\N	CGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGGGCAGTA	AFRFF056-16
243	125	Tanzania	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGCGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTTTGAT	AFRFF058-16
244	125	Tanzania	\N	TGAGCTGGANTAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTGCCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGTGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAA	AFRFF061-16
245	125	South Africa	\N	AAAGATATTGGAACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTGCCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCA	AFRFF075-16
246	125	Tanzania	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGCGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTT	AFRFF104-16
247	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATATCAACACTTATTC	CRI006-16
248	125	South Africa	\N	-------------------------------------GTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATT-	CRI007-16
249	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGATCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI011-16
250	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTGGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAG-----------------------------------	CRI013-16
251	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAG-----------------------------	CRI017-16
252	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCCCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI019-16
253	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCCCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI022-16
254	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTACTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI024-16
255	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCCGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI025-16
256	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACGATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI029-16
257	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAG-----------------------------	CRI034-16
258	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGATCCAGCAGGAGGAGGTGACCCAATTTTATATCAACACTTATTC	CRI035-16
259	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI037-16
260	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTGTACCAACACTTATTC	CRI040-16
261	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCCGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGGACCAATTTTATACCAACACTTATTC	CRI047-16
262	125	South Africa	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCATCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAG-----------------------------	CRI051-16
263	125	Kenya	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGGGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGATTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATTTAC-------------------	JTB060-12
264	125	Mali	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATCATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGGGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTGTACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAAGAAACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATT---------------------------------------------------------	JTB073-12
265	125	Burkina Faso	\N	GACATTATATTTTATTTTCGGAGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTA------------------------	JTB161-12
266	125	\N	\N	GGAATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATATCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAGGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGT---------------------------------------	JTB222-12
267	125	Cameroon	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTGCCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCTCCACTTTCTTCTGTAATCGCCCATGGAGGTGCATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTTAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTTTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTT	MVTBI041-08
268	125	Uganda	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCCGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI048-08
269	125	Mozambique	\N	--AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTATTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI227-08
270	125	Ethiopia	\N	TGTGGGTACACACAAAAATAAAGATATTGGGACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCCAGGG	AFRFF027-16
271	125	Ethiopia	\N	GTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAACTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATGGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACA	AFRFF028-16
272	125	Kenya	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTCTGAT	AFRFF041-16
273	125	Senegal	\N	CTGGAATAGTAGGTACATCTCTTANAATTTTAATTCGAGCTGAACTAGGCCATCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGTGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTTTGAT	AFRFF050-16
274	125	Tanzania	\N	TGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAG	AFRFF060-16
275	125	Tanzania	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGCGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTT	AFRFF108-16
276	125	Tanzania	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCACCACTTTCTTCTGTAATCGCCCATGGGGGCGCATCAGTTGATTTAGCGATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTT	AFRFF111-16
277	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAAATTTATACCAACACTTATTC	CRI010-16
278	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCCGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGG----------------------------	CRI015-16
279	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGGGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTATATACCAACACTTATTC	CRI016-16
280	125	South Africa	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATTTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACAACCACTTATTT	CRI021-16
281	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGCGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCTTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTT	CRI026-16
282	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI027-16
283	125	South Africa	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTGAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI031-16
284	125	South Africa	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTATAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTGAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCCTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI032-16
285	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTGTACCAACACTTATTC	CRI043-16
286	125	South Africa	\N	AACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGCCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTGAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTC	CRI049-16
287	125	Cote d'Ivoire	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGACTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTATACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGTTCATTAGGAATAATCTATGCTATATTAGCAATCGGTTTACTTGGATTTATTGTTTGAGCCCACCATATATTTACAGTAGGAATAGATGTTGATACTCGAGCTTATT----------------------	JTB152-12
288	125	Democratic Republic of the Congo	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGGACGTCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAACGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGGGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTACCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGAGGAGGTGACCCAATTTTGTACCAACACTTATTCTGATTTTTTGGCCACCCCGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGGAAAAAAGAGACATTCGGTTCATTAGGAATAATTTATGCTATATTAGCAATCGGTT-------------------------------------------------------------------------------------------	JTB282-12
289	125	Togo	\N	GACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGCCACCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGGCTTGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTGCCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAACGGGGCCGGAACAGGTTGAACAGTTTATCCTCCACTTTCTTCTGTAATCGCCCATGGAGGTGCATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTTAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTCTGAGCAGTGGTATTAACTGCTCTTCTATTACTTCTTTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCTGGTTTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTACTTGGATTTATTGTTTGAGCTCATCATATATTTACAGTAGGTATAGACGT---------------------------------------	JTB291-12
290	125	South Africa	\N	GACATTATATTTTATTTTCGGTGCATGAGCTGGAATAGTGGGGACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCTGGTGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATGGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATACTAGGAGCCCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTCTTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTGGCTATTTTTTCCCTCCATTTAGCTGGAATCTCTTCAATTTTAGGTGCAGTAAACTTTATTACTACAGTTATTAATATACGATCAACTGGTATTTCATTTGACCGAATACCCCTGTTTGTATGAGCAGTAGTACTTACTGCTCTTTTATTGCTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATATTACTAACTGACCGAAATCTAAACACTTCATTTTTTGACCCAGCAGGGGGAGGTGACCCAATTTTATACCAACACTTATTC	MVTBI046-08
291	128	Kenya	\N	AACTTTATATTTTATTTTCGGAGCTTGAGCTGGAATAGTAGGGACATCCCTCAGAATTTTAATTCGGACTGAATTAGGACACCCAGGAACATTAATTGATGATAACCAAATCTACAATGTAGTTGTAACTGCTCATGCTTTTGTAATAATTTTCTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTTGTACCCCTTATACTTGGAGCTCCAGACATAGCATTTCCTCGAATAAATAACATAAGTTTTTGGTTATTGCCCCCTTCCCTTACATTACTTCTAGTAAGTAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTATCATCTGTAATCGCCCATGGAGGAGCATCAGTTGATCTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCAATTTTAGGAGCAGTTAATTTTATCACAACAGTTATTAATATACGATCCACTGGAATTACTTTCGACCGAATGCCTTTATTTGTATGAGCTGTAGTTCTTACCGCACTACTTCTTCTATTATCATTACCAGTTTTAGCCGGAGCTATTACAATACTTTTAACAGATCGAAATTTAAACACATCATTCTTCGACCCTGCCGGAGGAGGAGACCCTATCCTATACCAACATTTATTT	MVTBI315-09
292	129	South Africa	\N	AACTTTATATTTTATTTTTGGTGCATGAGCTGGAATAGTGGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGTCACCCTGGGGCATTAATTGGAGATGACCAAATTTATAATGTAATTGTAACCGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGGGGATTTGGAAATTGACTCGTTCCTTTAATACTTGGAGCACCAGATATAGCTTTCCCCCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTATCCCCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCATCAGTTGATTTAGCAATCTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATCTCATTTGACCGAATACCCTTATTTGTTTGAGCAGTAGTACTTACTGCTCTTCTATTACTTCTCTCTCTCCCTGTTTTAGCAGGAGCTATTACAATATTACTTACTGACCGAAATCTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGGGACCCAATTTTATACCAACATTTATTT	MVTBI049-08
293	130	South Africa	\N	-ACTTTATATTTTATTTTCGGGGCCTGAGCTGGAATAGTAGGAACATCTCTAAGAATTTTAATTCGAACTGAATTAGGACACCCAGGAACATTAATCGATGATAATCAAATTTATAATGCATTTGTAACTGCGCATGCTTTTGTAATAATTTTTTTTATAGTGATACCTATTATAATTGGAGGATTTGGAAACTGACTTGTACCCCTCATACTTGGAGCGCCAGATATAGCATTTCCTCGAATAAACAATATAAGTTTTTGGTTATTACCACCTTCCCTCACATTACTTCTAGTCAGTAGAATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCTTTATCCTCTGTGATCGCCCACGGAGGGGCATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCCGGGATTTCTTCAATTTTAGGAGCAGTCAATTTTATTACAACAGTTATTAATATACGTTCTACAGGGATTACTTTCGACCGAATACCTTTATTTGTGTGAGCTGTATTTCTTACTGCACTGTTATTATTATTATCATTACCGGTTTTAGCGGGGGCTATCACCATACTATTAACAGATCTAAATTTAAACACTTCATTCTTTGACCCGGCCGGAAGAGGAGACCCATTTTTATACCAACACTTATTT	CRI059-16
294	130	Senegal	\N	GACTTTATATTTTATTTTCGGGGCCTGAGCTGGAATAGTAGGAACATCTCTAAGAATTTTAATTCGAACTGAATTAGGACACCCAGGAACATTAATCGATGATAATCAAATTTATAATGTAATTGTAACTGCACATGCTTTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAACTGACTTGTGCCTCTTATACTCGGAGCACCAGATATAGCATTTCCTCGAATGAACAATATAAGTTTTTGATTATTACCTCCTTCCCTCACATTACTTCTAGTCAGTAGAATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTATCCACCTTTATCCTCTGTGATCGCCCACGGAGGAGCATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTACTTTCGACCGAATACCTTTATTTGTGTGAGCTGTAGTTCTTACTGCACTATTGTTGTTATTATCATTACCAGTTTTAGCAGGAGCTATCACTATACTATTAACAGATCGAAATTTAAACACTTCATTCTTTGACCCAGCCGGAGGAGGAGACCCTATTTTATACCAACACTTATTTTGATTTTTTGGCCACCCTGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCTCATATTATTAGCCAAGAATCTGGAAAAAAAGAAACATTTGGATCATTAGGAATAATTTATGCAA----------------------------------------------------------------------------------------------------------	JTB260-12
295	130	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTCGGGGCCTGAGCTGGAATAGTAGGGACATCTCTAAGAATTTTAATTCGAACTGAATTAGGACACCCAGGAACATTAATCGATGATAATCAAATTTATAATGTAATTGTAACTGCACATGCTTTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAACTGACTTGTGCCTCTTATACTTGGAGCACCAGATATAGCATTTCCTCGAATGAACAATATAAGTTTTTGATTATTACCTCCTTCCCTCACATTACTTCTAGTCAGTAGAATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTATCCACCTTTATCCTCTGTGATCGCCCACGGAGGAGCATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTACTTTCGACCGAATACCTTTATTTGTGTGAGCTGTAGTTCTTACTGCACTATTGTTGTTATTATCATTACCAGTTTTAGCAGGGGCTATCACTATACTATTAACAGATCGAAATTTAAACACTTCATTCTTTGACCCAGCCGGAGGAGGAGACCCTATTTTATATCAACACTTATTTTGATTTTTTGGCCACCCTGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCTCATATTATTAGCCAAGAATCTGGAAAAAAAGAAACATTTGGATCATTAGGAATAATTTATGCAATAATAGCAATTGGCCTTT----------------------------------------------------------------------------------------	JTB340-12
296	130	Togo	\N	GACTTTATATTTTATTTTCGGGGCCTGAGCTGGAATAGTAGGAACATCTCTAAGAATTTTAATTCGAACTGAATTAGGACACCCAGGAACATTAATCGATGACAATCAAATTTATAATGTAATTGTAACTGCACATGCTTTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAACTGACTTGTGCCTCTTATACTCGGAGCACCAGATATAGCATTTCCTCGAATGAACAATATAAGTTTTTGATTATTACCTCCTTCCCTCACATTACTTCTAGTCAGTAGAATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTATCCACCTTTATCCTCTGTGATCGCCCACGGAGGAGCATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTACTTTCGACCGAATACCTTTATTTGTGTGAGCTGTAGTTCTTACTGCACTATTGTTGTTATTATCATTACCAGTTTTAGCAGGAGCTATCACTATACTATTAACAGATCGAAATTTAAACACTTCATTCTTTGACCCAGCCGGAGGAGGAGACCCTATTTTATACCAACACTTATTTTGATTTTTTGGCCACCCTGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCTCATATTATTAGCCAAGAATCTGGAAAAAAAGAAACATTTGGATCATTAGGAATAATTTATGCAATAATAGCAATTGGCCTTTTAGGTT----------------------------------------------------------------------------------	JTB349-12
297	130	Ghana	\N	AACTTTATATTTTATTTTCGGGGCCTGAGCTGGAATAGTAGGAACATCTCTAAGAATTTTAATTCGAACTGAATTAGGACACCCAGGAACATTAATCGATGACAATCAAATTTATAATGTAATTGTAACTGCACATGCTTTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAACTGACTTGTGCCTCTTATACTTGGAGCACCAGATATAGCATTTCCTCGAATGAACAATATAAGTTTTTGGTTATTACCTCCTTCCCTCACATTACTTCTAGTCAGTAGAATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTATCCACCTTTATCTTCTGTGATCGCCCACGGAGGAGCATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGGGCAGTTAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTACTTTCGACCGAATACCTTTATTTGTGTGAGCTGTAGTTCTTACTGCACTATTGTTGTTATTATCATTACCAGTTTTAGCAGGAGCTATCACTATACTATTAACAGATCGAAATTTAAACACTTCATTCTTTGACCCAGCCGGAGGAGGAGACCCTATTTTATACCAACACTTATTT	MVTBI050-08
298	131	Mozambique	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACATCCAGGAACATTAATTGATGACAACCAAATCTATAATGTAGTTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTGCCACTTATACTTGGAGCACCAGATATAGCATTCCCCCGAATGAATAATATAAGTTTCTGATTATTACCTCCTTCCCTTACATTACTTCTAGTAAGTAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCACCTTTATCATCTGTAATCGCCCACGGAGGAGCATCGGTTGATCTAGCAATTTTTTCTCTTCATTTAGCCGGAATTTCTTCAATTTTAGGTGCAGTTAATTTTATCACAACAGTTATTAATATACGATCCACCGGAATTACTTTCGACCGAATACCCTTATTTGTATGAGCTGTAGTTCTTACCGCACTACTTCTTCTTTTATCATTACCAGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAACACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATCTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTACATTTTAATCTTACCTGGATTTGGTATAATTTCTCATATTATTAGCCAAGAATCCGGAAAAAAGGAAACTTTTGGATCATTAGGAATAATTTACGCAATAATAGCAATTGGACTATTAGGATTTATTGTCTGAGCTCATCACATATTCACAGTTGGTATAGATGTCGATACACGAGCTTATTTTACTTCAGCAAC---------	JTB035-12
299	131	Mozambique	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACATCCAGGAACATTAATTGATGACAACCAAATCTATAATGTAGTTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTGCCACTTATACTTGGAGCACCAGATATAGCATTCCCCCGAATGAATAATATAAGTTTCTGATTATTACCTCCTTCCCTTACATTACTTCTAGTAAGTAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCACCTTTATCATCTGTAATCGCCCACGGAGGAGCATCGGTTGATCTAGCAATTTTTTCTCTTCATTTAGCCGGAATTTCTTCAATTTTAGGTGCAGTTAATTTTATCACAACAGTTATTAATATACGATCCACCGGAATTACTTTCGACCGAATACCCTTATTTGTATGAGCTGTAGTTCTTACCGCACTACTTCTTCTTTTATCATTACCAGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAACACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATCTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTACATTTTAATCTTACCTGGATTTGGTATAATTTCTCATATTATTAGCCAAGAATCCGGAAAAAAGGAAACTTTTGGATCATTAGGAATAATTTACGCAATAATAGCAATTGGGCTATTAGGATTTATTGTCTGAGCTCATCACATATTCACAGTTGGTATAGATGTCGATACACGAGCTTA------------------------	JTB096-12
300	131	Kenya	\N	AACTTTATATTTTATTTTCGGAGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACATCCAGGGACATTAATTGATGACAACCAAATCTATAATGTAGTTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTGCCACTTATACTTGGAGCACCAGATATAGCATTCCCCCGAATGAATAATATAAGTTTCTGATTATTACCTCCTTCCCTTACATTACTTCTAGTAAGTAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCACCTTTATCATCTGTAATCGCCCACGGAGGAGCATCGGTTGATCTAGCAATTTTTTCTCTTCATTTAGCCGGAATTTCTTCAATTTTAGGTGCAGTTAATTTTATCACAACAGTTATTAATATACGATCCACCGGAATTACTTTCGACCGAATACCCTTATTTGTATGAGCTGTAGTTCTTACCGCACTACTTCTTCTTTTATCATTACCAGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAACACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATCTTATACCAACACTTATTT	MVTBI059-08
301	131	Mozambique	\N	AACTTTATATTTTATTTTCGGAGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACATCCAGGAACATTAATTGATGACAACCAAATCTATAATGTAGTTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTGCCACTTATACTTGGAGCACCAGATATAGCATTCCCCCGAATGAATAATATAAGTTTCTGATTATTACCTCCTTCCCTTACATTACTTCTAGTAAGTAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCACCTTTATCATCTGTAATCGCCCACGGAGGAGCATCGGTTGATCTAGCAATTTTTTCTCTTCATTTAGCCGGAATTTCTTCAATTTTAGGTGCAGTTAATTTTATCACAACAGTTATTAATATACGATCCACCGGAATTACTTTCGACCGAATACCCTTATTTGTATGAGCTGTAGTTCTTACCGCACTACTTCTTCTTTTATCATTACCAGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAACACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATCTTATACCAACACTTATTT	MVTBI255-09
302	131	Mozambique	\N	-----------------------------CTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACATCCAGGAACATTAATTGATGACAACCAAATCTATAATGTAGTTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTGCCACTTATACTTGGAGCACCAGATATAGCATTCCCCCGAATGAATAATATAAGTTTCTGATTATTACCTCCTTCCCTTACATTACTTCTAGTAAGTAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCACCTTTATCATCTGTAATCGCCCACGGAGGAGCATCGGTTGATCTAGCAATTTTTTCTCTTCATTTAGCCGGAATTTCTTCAATTTTAGGTGCAGTTAATTTTATCACAACAATTATTAATATACGATCCACCGGAATTACTTTCGACCGAATACCCTTATTTGTATGAGCTGTAGTTCTTACCGCGCTACTTCTTCTTTTATCATTACCAGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAACACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATCTTATACCAACACTTATTT	MVTBI294-09
303	131	Mozambique	\N	AACTTTATATTTTATTTTCGGAGCTTNAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACATCCAGGAACATTAATTGATGACAACCAAATCTATAATGTAGTTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTGCCACTTATACTTGGAGCACCAGATATAGCATTCCCCCGAATGAATAATATAAGTTTCTGATTATTACCTCCTTCCCTTACATTACTTCTAGTAAGTAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCACCTTTATCATCTGTAATCGCCCACGGAGGAGCATCGGTTGATCTAGCAATTTTTTCTCTTCATTTAGCCGGAATTTCTTCAATTTTAGGTGCAGTTAATTTTATCACAACAGTTATTAATATACGATCCACCGGAATTACTTTCGACCGAATACCCTTATTTGTATGAGCTGTAGTTCTTACCGCGCTACTTCTTCTTTTATCATTACCAGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAACACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATCTTATACCAACACTTATTT	MVTBI295-09
304	131	Mozambique	\N	AACTTTATATTTTATTTTCGGAGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGACATCCAGGAACATTAATTGATGACAACCAAATCTATAATGTAGTTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTACCACTTATACTTGGAGCACCAGATATAGCATTCCCCCGAATGAATAATATAAGTTTCTGATTATTACCTCCTTCCCTTACATTACTTCTAGTAAGTAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCACCTTTATCATCTGTAATTGCCCACGGAGGAGCATCGGTTGATCTAGCAATTTTTTCTCTTCATTTAGCCGGAATTTCTTCAATTTTAGGTGCAGTTAATTTTATCACGACAGTTATTAATATACGATCCACCGGAATTACTTTCGACCGAATACCCTTATTTGTATGAGCTGTAGTTCTTACCGCATTACTTCTTCTTTTATCATTACCAGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAATACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAAT-------------------	MVTBI296-09
305	133	Cote d'Ivoire	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCTGGTATAGTAGGAACATCTCTCAGAATTTTAATTCGAACTGAATTAGGACACCCTGGGACATTAATTGATGATAACCAAAGCTATAATGTAGTTGTAACCGCTCATGCTTTTGTAATAATTTTCTTTATAGTTATACCTATCATAATTGGGGGGTTTGGAAATTGACTCGTACCACTTATACTTGGAGCACCAGACATAGCATTCCCCCGAATGAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACGTTACTTCTAGTAAGTAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCCTCTGTGATCGCTCACGGAGGAGCATCGGTTGATTTAGCAATTTTTTCTCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCAGTTAATTTTATCACAACAGTTATTAATATGCGATCCACTGGAATTACTTTCGACCGAATGCCTTTATTTGTATGAGCTGTAGTTCTTACTGCACTGCTTCTCCTATTATCATTGCCAGTTTTAGCAGGAGCTATTACAATATTATTAACAGACCGAAATTTAAACACGTCATTCTTTGATCCGGCCGGAGGAGGAGACCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATCTTACCTGGATTTGGTATAATTTCCCATATTATTAGCCAAGAATCAGGAAAAAAGGAAACTTTTGGATCATTAGGAATAATTTACGCAATAATAGCAATTGGTCTATTAGGGTTTATTGTTTGAGCTCACCATATATTCACAGTTGGTATAGATGTTGATACACGAGCT--------------------------	JTB297-12
306	134	Senegal	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGATTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTGAATACTTCATTCTTTGACCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTCTTCCTGGATTCGGAATAATTTCTCATATTATTAGTCGAGAATCAGGGAAAAAGGAAACATTTGGATCATTAGGAATAATTTATGCTA----------------------------------------------------------------------------------------------------------	JTB228-12
307	134	Zambia	\N	GACTTTATATTTTATTTTTGGGGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCATCCAGGAGCTCTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGATCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGATCCAGCAGGAGGAGGTGATCCTATTTTATATCAACACTTATTTTGATTTTTTGGACATCCTGAAGTCTATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGCCAAGAATCAGGGAAAAAGGAAACATTTGGATCATTAGGGATAATTTATGCTATACTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGATACTCGAGC---------------------------	JTB287-12
308	134	Zambia	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTCTATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGA------------------------------------	JTB290-12
309	134	Rwanda	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGGATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGGGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCAGGGGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTATATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGA------------------------------------	JTB293-12
310	134	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTACTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGATTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATGCCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCGGTTTTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCAGGAGGAGGAGATCCTATTTTATATCAACACTTATTCTGATTTTTTGGACATCCTGAAGTTTACATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTTGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGA------------------------------------	JTB303-12
311	134	Togo	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCACATGGAGGAGCTTCTGTTGACTTAGCTATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCGCTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCAGGAGGAGGAGATCCTATTTTATACCAACACTTATTCTGATTTTTTGGTCATCCTGAAGTTTATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATGTTAGCAATTG----------------------------------------------------------------------------------------------	JTB330-12
312	134	Benin	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCACATGGAGGAGCTTCTGTTGACTTAGCTATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGGGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCGCTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCAGGAGGAGGAGATCCTATTTTATACCAACACTTATTCTGATTTTTTGGTCATCCTGAAGTTTATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATGTTAGC---------------------------------------------------------------------------------------------------	JTB334-12
313	134	Cote d'Ivoire	\N	AACTTTATATTTTTTTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGACTACTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGATTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATGCCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCGGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCAGGAGGAGGAGATCCTATTTTATATCAACACTTATTC	MVTBI051-08
314	134	Cote d'Ivoire	\N	AACTTTATATTTTTTTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGACTACTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGATTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATGCCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCGGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCAGGAGGAGGAGATCCTATTTTATATCAACACTTATTC	MVTBI052-08
315	134	Cote d'Ivoire	\N	--------------TTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTACTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGATTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATGCCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCGGTTTTAGCTGGAGCTATTACAATACTATTAACAGATCGAAATTTAAATACTTCATTCTTTGACCCAGCAGGAGGAGGAGATCCTATTTTATATCAACACTTATTC	MVTBI053-08
316	135	Democratic Republic of the Congo	\N	------------TATTTTTGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACACCCAGGAGCCCTAATTGGAGATGATCAAATTTATAACGTAATTGTTACTGCTCATGCCTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGGGGATTTGGAAATTGATTAGTACCTTTAATATTAGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTAATTGCCCACGGAGGAGCTTCTGTTGATTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCCGTAAATTTTATCACCACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTATGAGCTGTAGTTCTTACTGCATTATTATTGTTATTGTCTCTTCCAGTTCTGGCCGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACTTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACATTTATTT	MVTBI054-08
317	135	Kenya	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACACCCAGGAGCCCTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCCTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGGGGATTTGGAAATTGATTAGTACCTTTAATATTAGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTAATTGCCCACGGAGGAGCTTCTGTTGATTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCCGTAAATTTTATCACCACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTATGAGCTGTAGTTCTTACTGCATTATTATTGTTATTATCTCTTCCAGTTCTGGCCGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACTTCATTCTTTGACCCAGCGGGAGGAGGGGATCCTATTTTATACCAACATTTATTT	MVTBI055-08
318	135	Kenya	\N	AACTTTATATTTTATTTTTGGGGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACACCCAGGAGCCCTAATTGGGGATGATCAAATTTATAACGTAATTGTTACTGCTCATGCCTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCTTTAATATTAGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTAATTGCCCACGGAGGAGCTTCTGTTGATTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCCGTAAATTTTATCACCACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTATGAGCTGTAGTTCTTACTGCATTATTATTGTTATTATCTCTTCCAGTTCTAGCCGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGAGATCCTATTTTATACCAACATTTATTT	MVTBI056-08
319	136	Ethiopia	\N	AGTAGGTACCTCCCTTAGAATTTTAATTCGAGCTGAATTAGGACACCCAGGAGCACTAATTGGGGATGATCAAATTTACAATGTAATTGTAACTGCTCATGCCTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAACTGATTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTTCCTCGAATAAATAACATAAGTTTCTGATTGTTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGATCTAGCTATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACTACCGTAATTAATATACGATCAACCGGAATTACATTTGATCGAATACCATTATTTGTTTGAGCTGTAGTTCTTACTGCACTATTATTATTATTATCCCTTCCAGTTTTAGCCGGAGCCATCACAATATTATTAACAGACCGAAATTTAAATACTTCATTTTTTGACCCTGCCGGAGGAGGAGATCCAATTTTATATCAACATTTATTTTGATTTTTTGGTCA	AFRFF076-16
320	138	Togo	\N	TACCTTATATTTTATTTTCGGAGCTTGAGCCGGAATAGTCGGTACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCCTTAATTGGTGATGATCAAATTTACAATGTAATTGTTACAGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCCCTTATATTAGGAGCTCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTACTACCTCCTTCACTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACTGTTTACCCTCCACTTTCTTCTGTTATTGCACACGGTGGAGCTTCAGTTGATCTTGCTATTTTTTCATTACATCTTGCTGGAATTTCATCAATTTTAGGAGCAGTAAATTTTATTACTACAGTAATTAATATACGATCTACAGGTATTTCATTTGACCGAATACCTTTATTTGTATGGGCAGTTGTTTTAACAGCTCTTTTACTTTTATTATCTCTTCCAGTATTAGCCGGAGCTATTACTATATTATTAACTGATCGAAATTTAAATACATCATTTTTCGATCCAGCCGGAGGAGGAGATCCAATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCCCACATTATTAGTCAAGAATCAGGTAAAAAGGAAACCTTTGGATCATTAGGAATAATTTATGCAATGCTAGCAATTGGATTATTAGGATTTATTGTATGAGCTCATCATATATTTACAGTTGGAATAGATGTAGACACACGAGC---------------------------	JTB016-12
321	138	Togo	\N	TACCTTATATTTTATTTTCGGAGCTTGAGCCGGAATAGTCGGTACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCCTTAATTGGTGATGATCAAATTTACAATGTAATTGTTACAGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCCCTTATATTAGGGGCTCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCACTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACTGTTTACCCTCCACTTTCTTCTGTTATTGCACACGGTGGAGCTTCAGTTGATCTTGCTATTTTTTCATTACATCTTGCTGGAATTTCATCAATTTTAGGAGCAGTAAATTTTATTACAACAGTAATTAATATACGATCTACAGGTATTTCATTTGACCGAATGCCTTTATTTGTATGAGCAGTTGTTTTAACAGCTCTTTTACTTTTATTATCTCTTCCAGTATTAGCTGGAGCTATTACTATATTATTAACTGATCGAAATTTAAATACATCATTTTTCGATCCAGCCGGAGGAGGGGATCAATTTTTATACCAACATTTATTT	MVTBI254-09
322	140	Kenya	\N	--AACTTTATATTTTATTTTTGGAGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAACTGAATTAGGTCATCCAGGTGCACTAATTGGTAATGATCAAATTTATAATGTAATTGTAACTGCACATGCTTTTGTAATAATTTTTTTTATAGTTATACCCATTATAATTGGAGGATTTGGTAACTGACTAGTACCCCTAATACTAGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTGAGAAGTATAGTGGAAAATGGAGCTGGAACAGGTTGAACAGTTTATCCACCACTATCTTCAGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCTATTTTCTCCCTTCATTTAGCAGGTATTTCTTCTATTTTAGGGGCAGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCTTTATTTGTGTGAGCAGTTGTTCTTACAGCATTATTATTATTACTTTCACTACCCGTATTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTTTTTGATCCAGCAGGAGGAGGTGACCCTATTCTTTATCAACACTTATTC--	MVTBI172-08
323	141	Kenya	\N	--AACCTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGACGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTTATAATTTTCTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTATTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTAATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCATCAATTTTAGGGGCTGTAAATTTTATTACCACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGAATACCTTTATTTGTATGAGCTGTAGTTCTTACTGCACTGTTATTACTTCTATCTCTTCCAGTTCTAGCCGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTT--	MVTBI170-08
324	141	Kenya	\N	--AACCTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGACGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTTATAATTTTCTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTATTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTAATTGCTCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCATCAATTTTAGGGGCTGTAAATTTTATTACCACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGAATACCTTTATTTGTATGAGCTGTAGTTCTTACTGCACTATTATTACTTCTATCTCTTCCAGTTCTAGCCGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCTATTTTATACCAACACTTATTT--	MVTBI171-08
325	143	South Africa	\N	TGAGCTGGNATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGTGCTCTAATTGGAGACGACCAAATTTATAACGTAATTGTTACTGCTCATGCTTTTGTAATAATTTTCTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAACTGATTAGTACCTTTAATACTTGGTGCCCCAGATATAGCGTTTCCTCGAATAAATAATATAAGTTTTTGGTTATTACCCCCTTCTCTTACACTATTATTAGTGAGTAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCTCATGGAGGTGCTTCAGTTGATTTAGCTATTTTTTCTCTCCATCTAGCAGGAATTTCTTCAATTTTAGGGGCCGTAAATTTTATCACTACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTCTGAGCCGTAGTCCTTACTGCATTATTATTATTATTGTCTCTTCCAGTTTTAGCCGGAGCTATCACTATACTTTTAACTGATCGGAATTTAAACACTTCATTTTTTGACCCAGCTGGAGGAGGAGACCCAATTTTATATCAACATTTATTTTGATTTTT	AFRFF077-16
326	143	Mozambique	\N	-ACATTATATTTTATTTTCGGGGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGTGCTCTAATTGGAGACGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTTGTAATAATTTTCTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAACTGATTAGTACCTTTAATACTTGGTGCTCCAGATATAGCGTTTCCTCGAATAAATAATATAAGTTTTTGGTTATTACCCCCTTCTCTTACACTATTATTAGTGAGTAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCTCATGGAGGTGCTTCAGTTGATTTAGCTATTTTTTCTCTCCATCTAGCAGGAATTTCTTCAATTTTAGGGGCCGTAAATTTTATCACTACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTCTGAGCCGTAGTCCTTACTGCATTATTATTATTATTGTCTCTTCCAGTTTTAGCCGGAGCTATTACTATACTTTTAACTGATCGGAATTTAAACACTTCATTTTTTGACCCAGCTGGAGGAGGAGACCCAATTTTATACCAACATTTATTTTGATTCTTTGGACATCCTGAAGTTTACATTTTAATTTTACCCGGTTTTGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACTTTTGGATCATTAGGTATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTATGAGCACATCATATATTCACAGTAGGAATAGATGTTGATACACGAGCTTACTTTACATCAGCAAC---------	JTB021-12
327	143	Mozambique	\N	GACATTATATTTTATTTTCGGGGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGTGCTCTAATTGGAGACGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTTGTAATAATTTTCTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAACTGATTAGTACCTTTAATACTTGGTGCTCCAGATATAGCGTTTCCTCGAATAAATAATATAAGTTTTTGGTTATTACCCCCTTCTCTTACACTATTATTAGTAAGTAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCTCATGGAGGTGCTTCAGTTGATTTAGCTATTTTTTCTCTCCATCTAGCAGGAATTTCTTCAATTTTAGGGGCCGTAAATTTTATCACTACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTCTGAGCCGTAGTCCTTACTGCATTATTATTATTATTGTCTCTTCCAGTTTTAGCCGGAGCTATTACTATACTTTTAACTGATCGGAATTTAAACACTTCATTTTTTGACCCAGCTGGAGGAGGAGACCCAATTTTATACCAACATTTATTTTGATTCTTTGGACATCCTGAAGTTTACATTTTAATTTTACCCGGTTTTGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACTTTTGGATCATTAGGTATAATTTATGCTATATTAGCAATTGGTTT------------------------------------------------------------------------------------------	JTB326-12
328	143	Benin	\N	AACATTATATTTTATTTTCGGGGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGTGCTCTAATTGGAGACGACCAAATTTATAACGTAATTGTTACTGCTCATGCTTTTGTAATAATTTTCTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAACTGATTAGTACCTTTGATACTTGGTGCTCCAGATATAGCGTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACACTATTATTAGTGAGTAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGTGCTTCAGTTGATTTAGCTATTTTCTCTCTCCATCTGGCAGGAATTTCTTCAATTTTAGGGGCCGTAAATTTTATCACTACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTCTGAGCCGTAGTCCTTACTGCATTATTATTATTATTGTCTCTTCCAGTTTTAGCCGGAGCTATCACTATACTTTTAACTGATCGAAATTTAAACACTTCATTTTTTGACCCAGCTGGAGGAGGAGATCCAATTTTATATCAACATTTATTT	MVTBI061-08
329	143	Kenya	\N	AACATTATATTTTATTTTCGGGGCATGAGCTGGAATAGTAGGTACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGTGCTCTAATTGGAGACGACCAAATTTATAACGTAATTGTTACTGCTCATGCTTTTGTAATAATTTTCTTCATAGTTATACCTATTATAATTGGAGGATTTGGTAACTGATTAGTACCTTTAATACTTGGTGCTCCAGATATAGCGTTTCCTCGAATAAATAATATAAGTTTTTGGTTATTACCCCCTTCTCTTACACTATTATTAGTGAGTAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCTCATGGAGGTGCTTCAGTTGATTTAGCTATTTTTTCTCTCCATCTAGCAGGAATTTCTTCAATTTTAGGGGCCGTAAATTTTATCACTACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTCTGAGCCGTAGTCCTTACTGCATTATTATTATTATTGTCTCTTCCAGTTTTAGCCGGAGCTATCACTATACTTTTAACTGATCGGAATTTAAACACTTCATTTTTTGACCCAGCTGGAGGAGGAGACCCAATTTTATATCAACATTTATTT	MVTBI318-09
330	145	Kenya	\N	AACCTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGTACTTCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCATCCAGGTGCACTAATTGGAGATGATCAAATTTATAACGTAATTGTCACTGCTCATGCCTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAACTGATTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTCTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGATTTAGCTATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACCACCGTAATTAATATACGATCAACTGGAATTACATTTGATCGAATACCATTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTATTATCCCTTCCAGTTTTAGCCGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTTTTCGACCCAGCTGGAGGAGGAGACCCAATTTTATACCAACATTTATTC	MVTBI062-08
331	145	South Africa	\N	AACCTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGTACTTCTCTTAGAATTTTAATTCGAGCTGAATTAGGTCACCCAGGTGCACTAATTGGAGATGATCAAATTTATAACGTAATTGTCACTGCTCATGCCTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAACTGATTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTCTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGATTTAGCTATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACCACCGTAATTAATATACGATCAACTGGAATTACATTTGATCGAATACCATTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTATTATCCCTTCCAGTTTTAGCCGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTTTTTGACCCAGCTGGAGGAGGAGACCCAATTTTATACCAACATTTATTC	MVTBI063-08
332	146	Tanzania	\N	GACATTATATTTTATTTTCGGAGCCTGAGCTGGAATAGTAGGAACATCTTTAAGAATTTTAATTCGAGCCGAATTAGGTCATCCAGGTGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATCATAATTGGAGGATTTGGAAACTGATTAGTACCTTTAATACTTGGTGCCCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGGACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTACATTTGATCGAATACCATTATTTGTATGAGCAGTAGTTCTTACTGCCTTATTATTATTGTTATCTCTTCCAGTTTTAGCTGGAGCTATTACAATACTTTTAACAGATCGAAATTTAAATACTTCATTTTTTGACCCAGCCGGTGGAGGAGACCCTATTTTATATCAACATTTATTTTGATTCTTTGGTCATCCTGAAGTTTATATTTTAATTTTACCTGGATTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACTTTTGGTTCATTAGGGATAATTTATGCAATACTAGCAATTGG---------------------------------------------------------------------------------------------	JTB324-12
333	146	Tanzania	\N	AACATTATATTTTATTTTCGGAGCTNGAGCTGGAATAGTAGGAACATCTTTAAGAATTTTAATTCGAGCCGAATTAGGTCATCCAGGTGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATCATAATTGGAGGATTTGGAAACTGATTAGTACCTTTAATACTTGGTGCCCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGGACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATCGCCCATGGAGGTGCTTCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTACATTTGATCGAATACCATTATTTGTATGAGCAGTAGTTCTTACTGCCTTATTATTATTGTTATCTCTTCCAGTTTTAGCTGGAGCTATTACAATACTTTTAACAGATCGAAATTTAAATACT------------------------------------------------------	MVTBI307-09
334	149	Mozambique	KU688189	TAAAGATATTGGAACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTCTATATTTTAATTCTACC	AFRFF002-16
335	149	Tanzania	KU688186	TTGGAACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATGCTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATCTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTACTACTTTCTCTTCCAGTTTTAGCCGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTCTAC	AFRFF005-16
336	149	South Africa	\N	---------CTTTATTTTAGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATCACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCACGAGGAGGGGATCCTATTTTATACCAACACTTATTT	CRI057-16
337	149	Botswana	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGATCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTCTATATTTTAATTCTACCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGGAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATA--------------------------------------------------------------------------------------------------------	JTB276-12
338	149	Kenya	\N	------------------------------------------------------------AATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACT-----	MVTBI068-08
339	149	South Africa	\N	----------------------GCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATCACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTT	MVTBI072-08
340	149	South Africa	\N	AACTTTATATTTTTTTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTGAGTAGCATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATCACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTT	MVTBI073-08
341	149	Tanzania	\N	--CTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATCACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTT	MVTBI074-08
342	149	Tanzania	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTT	MVTBI075-08
343	149	Tanzania	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAAGTCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTT	MVTBI076-08
344	149	Tanzania	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCCTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATCACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTT	MVTBI077-08
345	149	South Africa	KU688194	TAAAGATATTGGAACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATCGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATCACGATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTATATATTTTAATTCTACCTGGATTCGGAATAATTTCTC	AFRFF001-16
346	149	South Africa	KU688193	TCATAAAGATATTGGAACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCCCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATACGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTTTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATCACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACATCCTGAAGTATACATTTTAATTCTACCTGGA	AFRFF010-16
347	149	Mozambique	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATGCTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATCTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTACTACTTTCTCTTCCAGTTTTAGCCGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTCTACCTGGATTCGGTATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGATACTCGAGC---------------------------	JTB009-12
348	149	Mozambique	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCCCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATCTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTACTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTCTACCTGGATTCGGTATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTG--------------------------------------------------------	JTB299-12
349	149	Kenya	\N	--------------TTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTT	MVTBI069-08
350	149	Reunion	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTT	MVTBI071-08
351	149	Tanzania	KU688195	TGGAACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGNTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTAT	AFRFF004-16
352	149	Mozambique	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATGCTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATCTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTACTACTTTCTCTTCCAGTTTTAGCCGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTCTACCTGGATTCGGTATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGATACTCGAG----------------------------	JTB012-12
353	149	Reunion	\N	AACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGACCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATTTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGGTCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTATTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGAGGGGATCCTATTTTATACCAACACTTATTT	MVTBI070-08
354	149	Mozambique	\N	-ACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCCCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATCTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTACTACTTTCTCTTCCAGTTTTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTCTACCTGGATTCGGTATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGATACTCGAGCTTATTTTAC------------------	JTB007-12
355	149	Mozambique	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATCCGAGCTGAATTAGGTCACCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATGCTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCTCATGGAGGAGCTTCTGTTGACTTAGCAATTTTTTCTCTTCACTTAGCAGGAATCTCTTCTATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGTATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCATTATTATTACTACTTTCTCTTCCAGTTTTAGCCGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTCTACCTGGATTCGGTATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGATCATTAGGAATAATTTATGCTATATTAGCAATTGGTTTATTAGGATTTATTGTTTGAGCACATCATATATTTACAGTTGGTATAGATGTAGA------------------------------------	JTB296-12
356	150	South Africa	\N	AATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGACACCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGTGCTTCTGTTGATTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGCATGCCTTTATTTGTCTGAGCTGTAGTTCTTACTGCACTATTATTATTATTATCTCTCCCAGTTTTAGCTGG	AFRFF078-16
357	150	Tanzania	\N	GACTTTATATTTTATTTTTGGAGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGACACCCAGGAGCGTTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGTGCTTCTGTTGATTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGCATGCCTTTATTTGTCTGAGCTGTAGTTCTTACTGCACTATTATTATTATTATCTCTCCCAGTTTTAGCTGGGGCTATCACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCCGGAGGAGGAGACCCTATTTTATATCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTCTACCTGGATTCGGAATAATTTCCCATATTATTAGTCAAGAATCAGGAAAAAAAGAAACATTCGGATCATTAGGTATAATTTATGCTATA--------------------------------------------------------------------------------------------------------	JTB234-12
358	150	South Africa	\N	AACTTTATATTTTATTTTTGGGGCATGAGCTGGAATAGTAGGAACATCCCTTAGAATTTTAATTCGAGCTGAATTAGGACACCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTTACTGCTCATGCTTTCGTTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGAAATTGACTAGTACCTTTAATACTTGGTGCTCCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTTTCTTCTGTAATTGCCCATGGAGGTGCTTCTGTTGATTTAGCAATTTTTTCTCTTCATTTAGCAGGAATTTCTTCAATTTTAGGAGCTGTAAATTTTATTACTACAGTAATTAATATGCGATCAACTGGAATTTCATTTGACCGCATGCCTTTATTTGTCTGAGCTGTAGTTCTTACTGCACTATTATTATTATTATCTCTCCCAGTTTTAGCTGGGGCTATCACAATATTATTAACAGATCGAAATTTAAATACTTCATTCTTTGATCCAGCCGGAGGAGGAGACCCTATTTTATATCAACATTTATTT	MVTBI078-08
359	152	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCTTGAGCTGGAATAGTAGGTACATCTTTAAGAATTTTAATTCGAGCCGAGTTAGGTCACCCAGGAGCATTAATCGGAGATGACCAAATTTATAATGTGATTGTAACAGCTCATGCCTTTGTAATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCCCTTATACTCGGTGCACCGGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCGCCTTCTCTCACTTTATTGTTAGTAAGCAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTATCTTCTGTAATTGCACATGGAGGTGCTTCTGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCAATTTTAGGAGCAGTAAATTTTATTACCACAGTTATTAATATACGATCAACTGGTATTACATTTGATCGAATACCTTTATTTGTATGAGCTGTAGTTCTTACTGCTTTATTACTTCTATTATCATTACCTGTTTTAGCCGGTGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGACCCTGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGTCACCCTGAAGTATATATTTTAATTTTACCTGGATTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGAGCTTTAGGTATAATTTATGCTATAATAGCAATTGGATTACTAGGTTTTATTGTATGGGCTCATCATATATTCACAGTTGGTATAGACGTTGATACACGGGCTTATTTTACTTCAG-------------	JTB168-12
360	152	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGAGCTTGAGCTGGAATAGTAGGTACATCTTTAAGAATTTTAATTCGAGCCGAGTTAGGTCACCCAGGAGCATTAATCGGAGATGACCAAATTTATAATGTGATTGTAACAGCTCATGCCTTTGTAATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCCCTTATACTCGGTGCACCGGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCGCCTTCTCTCACTTTATTGTTAGTAAGCAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTATCTTCTGTAATTGCACATGGAGGTGCTTCTGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCAATTTTAGGAGCAGTAAATTTTATTACCACAGTTATTAATATACGATCAACTGGTATTACATTTGATCGAATACCTTTATTTGTATGAGCTGTAGTTCTTACTGCTTTATTACTTCTATTATCATTACCTGTTTTAGCCGGTGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGACCCTGCTGGAGGAGGAGACCCTATTTTATACCAACATTTATTTTGATTTTTTGGTCACCCTGAAGTATATATTTTAATTTTACCTGGATTTGGAATAATTTCCCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTCGGAGCTTTAGGTATAATTTATGCTATAATAGCAATTGGATTACTAGGTTTTATTGTATGGGCTCATCATATATTCACAGTTGGTATAGACGTTGATACACGGGCTTATTTTACTTCAGCAACTATAATTAT	JTB219-12
361	154	Kenya	\N	TACTTTATATTTTATTTTTGGAGCATGAGCTGGGATAGTAGGAACATCTCTCAGAATTTTAATCCGAGCGGAATTAGGACACCCTGGAGCACTAATTGGTGACGACCAAATTTACAATGTAATTGTGACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTTCCTCTTATACTTGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTGCCTCCCTCTCTTACATTATTATTAGTGAGAAGTATAGTAGAAAACGGAGCCGGAACAGGTTGAACAGTTTACCCTCCTCTTTCTTCTGTAATTGCTCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCCGGAATTTCTTCAATTTTAGGAGCCGTAAATTTCATTACTACAGTGATTAATATACGATCTACTGGAATCACATTTGATCGAATACCTTTATTTGTCTGAGCTGTAGTTCTTACTGCTTTATTATTGCTTCTTTCTCTACCCGTATTAGCTGGAGCCATCACTATATTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGGGGTGACCCTATTTTATACCAGCATTTATTT	MVTBI060-08
362	155	Tanzania	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTCTGAT	AFRFF064-16
363	155	Tanzania	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACACCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCA	AFRFF065-16
364	155	Tanzania	\N	GCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTGTTACCTCCTTCTCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGATCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTCTGAT	AFRFF066-16
365	155	Tanzania	\N	AACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACACCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAG	AFRFF067-16
366	155	Tanzania	\N	TCTTAGAATTTTAATTCGAGCTGAACTAGGACACCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGG	AFRFF068-16
367	155	Tanzania	\N	CNNTANATTTTNTTTNNTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTGTGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGANGG	AFRFF069-16
368	155	Tanzania	\N	AGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACACCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACCGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAG	AFRFF070-16
369	155	Burundi	\N	TAGTAGGGACATCTCTTAGAATTTTAGTCCGAGCCGAACTAGGTCATCCTGGGGCATTAATTGGAGATGACCAAATTTACAATGTAATTGTAACTGCACATGCTTTTGTAATAATTTTTTTTATAGTCATACCTATTATAATTGGAGGATTTGGAAACTGACTTGTTCCTCTTATACTTGGAGCACCAGATATAGCCTTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACATTATTATTGGTAAGAAGAATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCTCCACTTTCTTCTGTAATTGCCCATGGTGGAGCATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCCGGAATTTCCTCAATTTTAGGAGCAGTAAACTTTATCACCACAGTAATTAATATACGATCAACTGGAATTACTTTTGACCGAATACCTTTATTCGTGTGAGCTGTTGTATTAACAGCCCTTCTATTGCTTCTTTCTCTCCCTGTTTTAGCCGGAGCTATTACTATACTATTAACCGATCGAAATTTAAATACCTCATTTTTTGACCCAGCAGGAGG	AFRFF079-16
370	155	Tanzania	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTGTTACCTCCTTCTCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGATCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	AFRFF101-16
371	155	Tanzania	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTGTTACCTCCTTCTCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGATCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	AFRFF103-16
372	155	Tanzania	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACACCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	AFRFF105-16
373	155	Tanzania	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACACCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	AFRFF106-16
374	155	Tanzania	\N	GCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACACCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACA	AFRFF107-16
375	155	Tanzania	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACACCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	AFRFF109-16
376	155	Tanzania	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTGTTACCTCCTTCTCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGATCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	AFRFF110-16
377	155	Tanzania	\N	CCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	AFRFF112-16
378	155	Tanzania	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	AFRFF113-16
379	155	Benin	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTGAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	MVTBI081-08
380	155	Mali	\N	AACTTTATATTTTATTTTCGGTGCATGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAACTAGGACATCCTGGAGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTCACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTAATACCAATTATAATCGGAGGATTTGGTAATTGACTTGTTCCTCTTATACTTGGAGCACCTGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTTACACTTTTATTAGTCAGTAGTATAGTAGAAAATGGAGCTGGGACAGGATGAACAGTTTATCCACCCCTTTCTTCTGTAATCGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTCCATTTAGCTGGAATTTCTTCTATTTTAGGGGCAGTAAATTTTATCACAACAGTAATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTGTGAGCAGTTGTACTTACTGCTCTTTTATTACTTCTTTCTCTTCCTGTTTTAGCAGGAGCTATCACAATACTATTAACTGACCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGATCCAATTCTATACCAACATTTATTC	MVTBI322-09
381	169	Madagascar	MH415480	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACTTCATTAAGATTATTAATTCGAGCTGAATTAGGAAATCCTGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCACATGCATTTATCATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCACCAGATATAGCTTTTCCTCGAATAAATAATATAAGATTTTGATTACTTCCCCCATCATTAACTCTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGTTCAGTAGATTTAGCTATTTTTTCTTTACACTTAGCTGGAATTTCATCAATTTTAGGTGCTATCAATTTTATTACAACAATTATTAATATACGAATTAATAATTTATCTTTTGATCAAATACCATTATTTGTTTGAGCTGTAGGAATTACAGCATTATTACTTTTATTATCTTTACCTGTTTTAGCTGGAGCTATTACAATACTTTTAACTGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCAATTTTATATCAACATTTATTT	MIMAD252-15
382	171	Gabon	MK187475	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCTGAATTAGGAAATCCAGGATCTTTAATTGGAGACGATCAAATTTATAACACTATTGTAACAGCTCATGCATTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCTTTAATATTAGGGGCCCCTGATATAGCTTTTCCTCGAATAAATAATATAAGATTTTGACTATTACCCCCCTCTTTAACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACTGGATGAACTGTATATCCCCCTCTTTCATCTAATATCTCACATGGAGGAAGTTCTGTAGATTTAGCTATTTTTTCACTTCATTTAGCTGGAATTTCTTCAATTTTAGGTGCAATTAATTTTATTACCACAATTATTAATATACGAATTAATGGATTATCTTTTGATCAAATACCTTTATTCGTTTGAGCAGTTGGAATTACAGCTTTATTATTATTACTTTCTTTACCTGTATTAGCAGGTGCAATTACAATATTATTAACAGATCGTAATTTAAATACTTCTTTTTTTGACCCTGCTGGAGGGGGAGATCCTATTTTATATCAACATTTATTT	MGABD278-11
383	172	Australia	HQ952941	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTCCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATT-------------------------------------------------	ANICN711-10
384	172	Australia	HQ952942	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATT-------------------------------------------------	ANICN712-10
385	172	Australia	HQ952943	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATT-------------------------------------------------	ANICN713-10
386	172	Madagascar	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGTGATGATCAAATTTATAACACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCTCGAATAAATAATATAAGATTCTGATTACTGCCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTGTTACAACAATTATTAATATACGAGTAAACGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACCTCATTTTTTGATCCTGCTGGAGGAGGAGACCCTATTCTTTATCAACATTTATTT	EPNG10203-17
387	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTTN	IMLQ134-07
388	172	Australia	\N	NACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTTN	IMLQ252-07
389	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTTN	IMLQ256-07
390	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTTN	IMLQ260-07
391	172	Australia	\N	NACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTTN	IMLQ261-07
392	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	IMLR271-08
393	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTCCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	LLISA303-06
394	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTGCCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTTTGATTATTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGCTCAGTAGATTTAGCTATTTTTTCTCTTCATCTAGCTGGTATCTCATCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAATTAACGGATTATTTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCTTTACTTCTTTTATTATCTTTACCAGTATTAGCTGGTGCAATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGACCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	LNSWF605-06
395	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATGAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTCCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	LNSWF636-06
396	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTGCCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTTTGATTATTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGCTCAGTAGATTTAGCTATTTTTTCTCTTCATCTAGCTGGTATTTCATCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAATTAACGGATTATTTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCTTTACTTCTTTTATTATCTTTACCAGTATTAGCTGGTGCAATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGACCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	LNSWG325-06
397	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	LOQT725-06
398	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	LOQT727-06
399	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTATTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTTN	LOQTB596-07
400	172	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	LSAFR645-12
401	172	Tanzania	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	LSER506-06
402	172	Tanzania	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	LSER532-06
403	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTCCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	NSWBB022-08
404	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	NSWBB583-08
405	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	NSWBB977-08
406	172	Australia	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGC------------------	NSWLP323-13
407	172	Nigeria	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	PMANK313-06
408	172	Nigeria	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	PMANK314-06
409	172	Kenya	\N	NNNNNNNNNNNNNNNNNNNNNNNNNNNNNCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGNNNNNNNNNNNNNNNNNNNNNNNNNN	PMANK315-06
410	172	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	PMANK316-06
411	172	Kenya	\N	NNCTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	PMANK317-06
412	172	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	PMANK318-06
413	172	Kenya	\N	NNCTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAACCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCCCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACTGCATTACTCTTATTATTATCTTTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTATTT	PMANK319-06
414	172	Australia	\N	-ACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTT--------------------------------------------	WALPA3353-13
415	172	Australia	\N	-ACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTCCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTA--	WALPA3719-13
416	172	Australia	\N	-ACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTA--	WALPA3720-13
417	172	Australia	\N	-ACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTCCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAATACTTCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTTTATCAACATTTA--	WALPA3749-13
418	172	Australia	\N	-ACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTTAAT--------------------------------------------------------	WALPA5079-13
419	172	Australia	\N	-ACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTT-----------------------------------------------------------	WALPA5093-13
420	172	Australia	\N	-ACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCTTTCCCCCGAATAAATAATATAAGATTCTGATTACTACCTCCATCATTAACTTTATTAATTTCTAGAAGAATTGTTGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCTAATATTGCTCATGGAGGAAGATCAGTAGATTTAGCTATTTTCTCTCTTCATTTAGCTGGTATTTCTTCAATTTTAGGAGCAATTAATTTTATTACAACAATTATTAATATACGAGTAAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCTGTTGGAATTACTGCATTACTATTATTACTATCTCTACCAGTATTAGCTGGAGCTATTACAATATTATTAACAGATCGTAATCTT-----------------------------------------------------------	WALPA511-12
421	174	Gabon	HM893029	TACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCTGAATTAGGAAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATCGTAACAGCTCATGCATTTATTATAATTTTTTTCATAGTTATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCTTCATTAACATTATTAATTTCTAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCTAATATCGCTCACGGAGGAAGTTCAGTAGATTTAGCTATTTTCTCCCTTCATTTAGCTGGAATTTCATCAATTTTAGGTGCAATTAATTTTATTACAACGATTATTAATATGCGAATTAATGGTTTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTTGGAATTACAGCTTTATTATTACTTCTTTCTTTACCAGTATTAGCAGGTGCTATTACTATACTTTTAACTGATCGAAATTTAAATACTTCTTTTTTTGATCCTGCGGGTGGAGGAGATCCAATTTTATATCAACATTTATTC	MGABB426-10
422	174	Nigeria	\N	TACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCTGAATTAGGAAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATCGTAACAGCTCACGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCCTCATTAACATTATTAATTTCTAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATTTCATCAATTTTAGGTGCAATTAATTTTATTACAACAATTATTAATATACGAATTAATGGTTTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTAGGAATTACAGCTTTATTATTACTTCTTTCTTTACCAGTATTAGCAGGTGCTATTACTATACTTTTAACTGATCGAAATTTAAATACTTCTTTTTTCGACCCTGCAGGTGGAGGTGATCCAATTTTATATCAACATTTATTC	PMANK326-06
423	174	Kenya	\N	TACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCTGAATTAGGAAATCCAGGATCATTAATTGGAGATGATCAAATTTATAACACTATCGTAACAGCTCACGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCCTCATTAACATTATTAATTTCTAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATTTCATCAATTTTAGGTGCAATTAATTTTATTACAACAATTATTAATATACGAATTAATGGTTTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTAGGAATTACAGCTTTATTATTACTTCTTTCTTTACCAGTATTAGCAGGTGCTATTACTATACTTTTAACTGATCGAAATTTAAATACTTCTTTTTTCGACCCTGCAGGTGGAGGTGATCCAATTTTATATCAACATTTATTC	PMANK327-06
424	174	Nigeria	\N	NNCATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCTGAATTAGGAAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATCGTAACAGCTCACGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCTTCATTAACATTATTAATTTCTAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATTTCATCAATTCTAGGTGCAATTAATTTTATTACAACAATTATTAATATACGAATTAATGGTTTATCTTTTGATCAAATACCTTTATTTGTTTGAGCTGTAGGAATTACAGCTTTATTATTACTTCTTTCTTTACCAGTATTAGCAGGTGCTATTACTATACTTTTAACTGATCGAAATTTAAATACTTCTTTTTTCGACCCTGCAGGTGGAGGTGATCCAATTTTATATCAACATTTATTC	PMANK390-06
425	176	Kenya	\N	TACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCTGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATCGTAACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCACGAATAAATAATATAAGATTTTGATTACTTCCTCCTTCATTAACTTTACTTATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCTGGAATTTCATCTATTTTAGGAGCTATTAATTTTATTACAACAATTATTAATATACGAATTAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGAATTACAGCTTTATTATTATTACTTTCTTTACCAGTTTTAGCAGGAGCTATTACCATACTTTTAACAGATCGAAATTTAAATACTTCATTTTTTGATCCTGCTGGTGGAGGAGATCCTATTCTTTACCAACATTTATTT	PMANK891-08
426	176	Kenya	\N	TACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCTGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATCGTAACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCACGAATAAATAATATAAGATTTTGATTACTTCCTCCTTCATTAACTTTACTTATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCTGGAATTTCATCTATTTTAGGAGCTATTAATTTTATTACAACAATTATTAATATACGAATTAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGAATTACAGCTTTATTATTATTACTTTCTTTACCAGTTTTAGCAGGAGCTATTACCATACTTTTAACAGATCGAAATTTAAATACTTCATTTTTTGATCCTGCTGGTGGAGGAGATCCTATTCTTTACCAACATTTATTT	PMANK892-08
427	176	Kenya	\N	TACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCTGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATCGTAACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCACGAATAAATAATATAAGATTTTGATTACTTCCTCCTTCATTAACTTTACTTATTTCAAGAAGAATTGTTGAAAACGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCTGGAATTTCATCTATTTTAGGAGCTATTAATTTTATTACAACAATTATTAATATACGAATTAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGAATTACAGCTTTATTATTATTACTTTCTTTACCAGTTTTAGCAGGAGCTATTACCATACTTTTAACAGATCGAAATTTAAATACTTCATTTTTTGATCCTGCTGGTGGAGGAGATCCTATTCTTTACCAACATTTATTT	PMANK903-08
428	176	Kenya	\N	TACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCTGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATCGTAACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCACGAATAAATAATATAAGATTTTGATTACTTCCTCCTTCATTAACTTTACTTATTTCAAGAAGAATTGTTGAAAACGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCTGGAATTTCATCTATTTTAGGAGCTATTAATTTTATTACAACAATTATTAATATACGAATTAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGAATTACAGCTTTATTATTATTACTTTCTTTACCAGTTTTAGCAGGAGCTATTACCATACTTTTAACAGATCGAAATTTAAATACTTCATTTTTTGATCCTGCTGGTGGAGGAGATCCTATTCTTTACCAACATTTATTT	PMANK905-08
429	176	Kenya	\N	TACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCTGAATTAGGTAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATCGTAACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCACGAATAAATAATATAAGATTTTGATTACTTCCTCCTTCATTAACTTTACTTATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGATCAGTTGATTTAGCAATTTTTTCCCTTCATTTAGCTGGAATTTCATCTATTTTAGGAGCTATTAATTTTATTACAACAATTATTAATATACGAATTAATGGATTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGAATTACAGCTTTATTATTATTACTTTCTTTACCAGTTTTAGCAGGAGCTATTACCATACTTTTAACAGATCGAAATTTAAATACTTCATTTTTTGATCCTGCTGGTGGAGGAGATCCTATTCTTTACCAACATTTATTT	PMANK907-08
430	181	Kenya	\N	CACTCTATATTTTATTTTTGGAGCTTGAGCAGGGATAGTAGGAACATCTCTTAGAATCTTAGTGCGAGCCGAATTAGGTCACCCTGGAGCACTAATTAGAGATGACCAAATCTATAACGTAATTGTTACAGCTCACGCATTTGTAATAATTTTCTTCATAGTTATACCAATTATAATTGGAGGATTCGGTAATTGATTAGTACCATTAATACTGGGAGCCCCCGACATAGCATTCCCCCGAATAAACAATATAAGTTTCTGATTACTGCCCCCTTCCCTAACCCTACTGTTAGTCAGCAGAATAATAGAAAACGGGGCTGGCACAGGTTGGACCGTATACCCCCCGCTCTCTTCCATTATCGCCCATAGAGGTGCCTCCGTTGACGCTGCTATCTTCTCATTACATCTAGCTGGTATCTCCTCCATTTTAGGAGCTGTAAATTTTATCACTACAGTAATTAATATACGATCAACAGGAATTACATTCGACCGAATACCTCTATTCGTTTGAGCCGTAGTATTGACAGCTCTATTGCTACTACTGTCCCTACCAGTATTAGCCGGAGCTATTACAATATTACTCACAGACCGAAACTTAAACACATCATTTTTTGACCCAGCCGGAGGTGGAGACCCTATTTTATACCAACATTTATTT	MVTBI082-08
431	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGGCTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTACTAT------	JTB018-12
432	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCTCCTCTATCATCAATTATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCTCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAACACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGGATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGGATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTC----------	JTB019-12
433	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTCTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATTATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGATCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTACTATAATT--	JTB090-12
434	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATCATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGC------------	JTB091-12
435	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATCATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCT-----------	JTB093-12
436	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATCATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTACTATAAT---	JTB097-12
437	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATCATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGC------------	JTB098-12
438	187	Democratic Republic of the Congo	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATCATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTACTATAATTA-	JTB174-12
439	187	Botswana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTCTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATTATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAAT---------------------------------------------------------------------------------------------------------	JTB333-12
440	187	Gabon	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATCATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGG---------------------------------------------------------------------------------------------	JTB358-12
441	187	Kenya	\N	AACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCCACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATCACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTT	MVTBI103-08
442	187	Mauritius	\N	AACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTT	MVTBI104-08
443	187	Tanzania	\N	AACATTATATTTTATTTTCGGAGCCTGAGCAGGTATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTGACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTT	MVTBI105-08
444	187	Mozambique	\N	--AACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTT	MVTBI228-08
445	187	Nigeria	\N	---------------ATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAACAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGATCCTATTCTTTACCAACATTTATTT	MVTBI230-08
446	187	Namibia	\N	AACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCTCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAACACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTT	MVTBI273-09
447	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATCATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGC------------	JTB015-12
448	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATTATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCTCTGTTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAACACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGC------------	JTB023-12
449	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTATATCCTCCTCTATCATCAATTATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCTCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAACACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGGATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGGATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTACTAT------	JTB040-12
450	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATCATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTACTATAATT--	JTB041-12
451	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCGTCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGGCTTCTAGGATTTATTGTGTGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGC------------	JTB092-12
452	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATCATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTGTACCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTACTAT------	JTB104-12
453	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGGCTTCTAGGATTTATTGTGTGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTACTATAATT--	JTB105-12
454	187	Ghana	\N	GACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACGAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCTCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGGATAATTTCTCACATTATTAGTCAAGAATCAGGAAAAAAGGAAACATTTGGGTCTTTAGGAATAATCTATGCAATACTAGCAATTGGACTTCTAGGATTTATTGTATGAGCACATCATATATTTACTGTAGGTATAGATGTCGACACTCGAGCATACTTCACATCAGCTACTAT------	JTB111-12
455	187	Kenya	\N	AACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTACCATTAATATTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCCCCTCTATCATCAATCATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCCACAGGAATTAGCTTTGACCGAATACCCCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATCACTATATTATTAACAGACCGAAACTTAAATACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTT	MVTBI102-08
456	187	Nigeria	\N	--AACATTATATTTTATTTTCGGAGCCTGAGCAGGCATAGTAGGAACATCCCTTAGAATTCTAGTTCGTGCTGAATTAGGACACCCCGGAGCTTTAATTGGAGACGACCAAATTTATAACGTAATTGTAACAGCTCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGTGCTCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCCGGAACAGGTTGAACAGTGTATCCTCCTCTATCATCAATTATTGCTCACGGAGGAGCATCTGTAGATTTAGCCATCTTTTCCTTACATTTAGCAGGTATTTCTTCAATTTTAGGGGCTGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTAGCTTTGACCGAATACCTCTATTTGTTTGAGCTGTTGTATTAACTGCATTATTATTACTTCTTTCCCTTCCAGTACTAGCTGGAGCTATTACTATATTATTAACAGACCGAAACTTAAACACATCTTTCTTCGACCCCGCTGGAGGAGGAGACCCTATTCTTTACCAACATTTATTT	MVTBI229-08
457	189	South Africa	\N	CAGGTATAGTAGGGACATCTCTTAGAATTTTAATTCGTGCTGAATTAGGTCACCCCGGAGCCCTAATCGGAGACGACCAAATTTATAATGTAATTGTAACAGCTCATGCATTTGTAATAATTTTTTTCATAGTAATACCTATTATAATTGGGGGGTTTGGAAATTGATTAGTACCTCTAATACTAGGTGCCCCAGATATGGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCAATCATTGCCCATGGAGGAGCTTCTGTAGATTTAGCAATCTTTTCTTTACATTTAGCAGGAATCTCCTCAATTTTAGGTGCCGTAAATTTTATTACAACAGTTATTAATATACGATCTACAGGAATTACTTTTGACCGTATACCTTTATTTGTTTGAGCAGTTGTACTAACTGCCCTATTACTATTACTATCTCTACCAGTACTAGCAGGGGCAATTACTATATTACTAACAGATCGAAATTTAAATACATCTTTCTTCGACCCAGCACGTGGGGGAGACCCTATTCTTTATCAACATTTATTTTGATTTTTTGGTC	AFRFF083-16
458	189	South Africa	\N	GCAGGTATAGTAGGGACATCTCTTAGAATTTTAATTCGTGCTGAATTAGGTCACCCCGGAGCCCTAATCGGAGACGACCAAATTTATAATGTAATTGTAACAGCTCATGCATTTGTAATAATTTTTTTCATAGTAATACCTATTATAATTGGGGGGTTTGGAAATTGATTAGTACCTCTAATACTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTGGAAAACGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCAATCATTGCCCATGGAGGAGCTTCTGTAGATTTAGCAATCTTTTCTTTACATTTAGCAGGAATCTCCTCAATTTTAGGTGCCGTAAATTTTATTACAACAGTTATCAATATACGATCTACAGGAATTACTTTTGACCGTATACCTTTATTTGTTTGAGCAGTTGTACTAACTGCCCTATTACTATTACTATCTCTACCAGTACTAGCAGGGGCAATTACTATATTACTAACAGATCGAAATTTAAATACGTCTTTCTTCGACCCAGCAGGTGGAGGAGACCCTATTCTTTATCAACATTTATTTTGATTTTTTGG	AFRFF089-16
459	189	South Africa	\N	GCAGGTATAGTAGGGACATCTCTTAGAATTTTAATTCGTGCTGAATTAGGTCACCCCGGAGCCCTAATCGGAGACGACCAAATTTATAATGTAATTGTAACAGCTCATGCATTTGTAATAATTTTTTTCATAGTAATACCTATTATAATTGGGGGATTTGGAAATTGATTAGTACCTCTAATACTAGGTGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCAATCATTGCCCATGGAGGAGCTTCTGTAGATTTAGCAATCTTTTCTTTACATTTAGCAGGAATCTCCTCAATTTTAGGTGCCGTAAATTTTATTACAACAGTTATCAATATACGATCTACAGGAATTACTTTTGACCGTATACCTTTATTTGTTTGAGCAGTTGTACTAACTGCCCTATTACTATTACTATCTCTACCAGTACTAGCAGGGGCAATTACTATATTACTAACAGATCGAAATTTAAATACATCTTTCTTCGACCCAGCACGTGGAGGAGACCCTATTCTTTATCAACATTTATTTTGATTTT	AFRFF090-16
460	189	Namibia	\N	-----------------------CCTGAGCAGGTATAGTAGGGACATCTCTTAGAATTTTAATTCGTGCTGAATTAGGTCACCCCGGAGCCCTAATCGGAGACGACCAAATTTATAATGTAATTGTAACAGCTCATGCATTTGTAATAATTTTTTTCATAGTAATACCTATTATAATTGGGGGGTTTGGAAATTGATTAGTACCTCTAATACTAGGTGCCCCAGATATGGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCTTACTTTTAGTCAGCAGTATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTATACCCCCCTCTTTCATCAATCATTGCCCATGGAGGAGCTTCTGTAGATTTAGCAATCTTTTCTTTACATTTAGCAGGAATCTCCTCAATTTTAGGTGCCGTAAATTTTATTACAACAGTTATCAATATACGATCTACAGGAATTACTTTTGACCGTATACCTTTATTTGTTTGAGCAGTTGTACTAACTGCCCTATTACTATTACTATCTCTACCAGTACTAGCAGGGGCAATTACTATATTACTAACAGATCGAAATTTAAATACATCTTTCTTCGACCCAGCAGGTGGGGGAGACCCTATTCTTTATCAACATTTATTT	MVTBI271-09
461	191	Mali	\N	--------------------GAGCCTGAGCAGGTATAGTGGGAACATCTCTTAGAATTTTAGTACGTGCTGAACTAGGTCACCCAGGAGCCTTAATCGGAGATGATCAAATCTATAATGTAATCGTAACAGCTCATGCATTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTCGGAAATTGACTAGTTCCTTTAATGTTAGGTGCACCAGATATAGCCTTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCCTCTCTTACGCTACTATTAGTGAGCAGCATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCTCCCCTTTCTTCAATTATTGCCCACGGAGGAGCATCCGTCGACTTAGCTATTTTTTCCTTACATTTAGCAGGTATCTCTTCTATTTTAGGGGCCGTAAATTTTATTACTACAGTAATTAATATACGATCTACAGGAATTACTTTCGATCGCATACCTTTATTTGTGTGAGCTGTAGTACTAACAGCACTATTATTATTACTCTCTCTCCCAGTATTAGCTGGAGCTATCACCATATTATTAACAGACCGAAACCTAAATACTTCATTCTTCGACCCCGCCGGAGGAGGAGATCCAATTTTATATCAACATTTATTT	MVTBI128-08
462	191	Senegal	\N	--AACTCTATATTTCATCTTCGGAGCCTGAGCAGGTATAGTGGGAACATCTCTTAGAATTTTAGTACGTGCTGAACTAGGTCACCCAGGAGCCTTAATCGGAGATGATCAAATCTATAATGTAATCGTAACAGCTCATGCATTTGTAATAATTTTTTTCATAGTTATACCTATTATAATTGGAGGATTCGGAAATTGACTAGTTCCTTTAATGTTAGGTGCACCAGACATAGCTTTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCCTCTCTTACGCTACTATTAGTGAGCAGCATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTATACCCTCCCCTTTCTTCAATTATTGCCCACGGAGGAGCATCCGTCGACTTAGCTATTTTTTCCTTACATTTAGCAGGTATCTCTTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGATCTACAGGAATCACTTTCGATCGCATACCTTTATTTGTGTGAGCTGTAGTACTAACAGCACTATTATTATTACTCTCTCTCCCAGTATTAGCTGGAGCCATCACCATATTATTAACAGACCGAAACCTAAATACTTCATTCTTCGACCCCGCCGGAGGAGGAGATCCAATTTTATACCAACATTTATTT	MVTBI234-08
463	193	Zimbabwe	\N	GACACTATATTTCATCTTCGGAGCTTGAGCAGGAATAGTGGGGACATCCCTCAGTATCTTAGTTCGAGCCGAACTAGGTCACCCTGGAGCCTTAATTGGTGATGACCAAATTTACAACGTTATTGTTACAGCTCACGCATTCGTAATAATTTTCTTTATAGTAATACCTATTATAATCGGAGGATTTGGAAACTGACTAGTACCCCTAATGCTAGGAGCCCCAGACATAGCCTTCCCCCGAATAAATAATATAAGTTTTTGATTACTGCCCCCATCTCTTACCCTACTTTTAGTCAGCAGCATAGTAGAAAATGGAGCTGGTACAGGTTGAACAGTTTACCCCCCCCTCTCTTCAATTATTGCCCATGGAGGAGCTTCAGTTGACCTAGCTATCTTTTCTCTTCATTTAGCCGGTATTTCGTCTATTCTAGGAGCTGTAAATTTTATTACTACAGTCATTAATATGCGATCTACAGGAATTACCTTTGATCGAATACCTCTATTTGTTTGAGCAGTGGTACTAACAGCTCTATTACTATTATTATCCCTCCCAGTACTAGCTGGAGCAATCACAATGTTATTAACAGACCGAAACCTAAATACCTCCTTCTTTGACCCAGCTGGAGGAGGAGATCCTATCCTCTACCAACATCTATTTTGATTCTTTGGACACCCTGAAGTGTATATTTTAATTTTACCTGGATTCGGAATAATCTCCCACATTATTAGTCAAGAATCTGGCAAAAAGGAAACCTTCGGTTCACTAGGAATAATTTATGCAATACTAGC---------------------------------------------------------------------------------------------------	JTB264-12
464	193	Kenya	\N	CACACTATATTTCATCTTCGGAGCTTGAGCAGGAATAGTGGGGACATCCCTCAGTATCTTAGTTCGAGCCGAACTAGGTCACCCTGGAGCCTTAATTGGTGATGACCAAATTTACAACGTTATTGTTACAGCTCACGCATTCGTAATAATTTTCTTTATAGTAATACCCATTATAATCGGAGGATTTGGAAACTGACTAGTACCCCTAATGCTAGGAGCCCCAGACATAGCCTTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCCTACTTTTAGTCAGCAGCATAGTGGAAAATGGAGCTGGTACAGGTTGAACAGTTTACCCTCCCCTCTCTTCAATTATTGCCCATGGAGGAGCTTCAGTTGACCTAGCTATCTTTTCTCTTCATTTAGCCGGTATTTCATCTATTCTAGGAGCTGTAAATTTTATTACTACAGTCATTAATATGCGATCTACAGGAATTACCTTTGATCGAATACCTCTATTTGTTTGAGCAGTGGTACTAACAGCTCTATTACTATTATTATCCCTCCCAGTACTAGCTGGAGCAATCACAATGTTATTAACAGACCGAAACCTAAATACCTCCTTCTTTGACCCAGCTGGGGGAGGAGATCCTATCCTCTACCAACATCTATTT	MVTBI129-08
465	193	Kenya	\N	CACACTATATTTCATCTTCGGAGCTTGAGCAGGAATAGTGGGGACATCCCTCAGTATCTTAGTTCGAGCCGAACTAGGTCACCCTGGAGCCTTAATTGGTGATGACCAAATTTACAACGTTATTGTTACAGCTCACGCATTCGTAATAATTTTCTTTATAGTAATACCCATTATAATCGGAGGATTTGGAAACTGACTAGTACCCCTAATGCTAGGAGCCCCAGACATAGCCTTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCCTACTTTTAGTCAGCAGCATAGTGGAAAATGGAGCTGGTACAGGTTGAACAGTTTACCCTCCCCTCTCTTCAATTATTGCCCATGGAGGAGCTTCAGTTGACCTAGCTATCTTTTCTCTTCATTTAGCCGGTATTTCATCTATTCTAGGAGCTGTAAATTTTATTACTACAGTCATTAATATGCGATCTACAGGAATTACCTTTGATCGAATACCTCTATTTGTTTGAGCAGTGGTACTAACAGCTCTATTACTATTATTATCCCTCCCAGTACTAGCTGGAGCAATCACAATGTTATTAACAGACCGAAACCTAAATACCTCCTTCTTTGACCCAGCTGGGGGAGGAGATCCTATCCTCTACCAACATCTATTT	MVTBI130-08
466	193	Kenya	\N	CACACTATATTTGATCTTCGGAGCTTGAGCAGGAATAGTGGGGACATCCCTCAGTATCTTAGTTCGAGCCGAACTAGGTCACCCTGGAGCCTTAATTGGTGATGACCAAATTTACAACGTTATTGTTACAGCTCACGCATTCGTAATAATTTTCTTTATAGTAATACCCATTATAATCGGAGGATTTGGAAACTGACTAGTACCCCTAATGCTAGGAGCCCCAGACATAGCCTTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCCTACTTTTAGTCAGCAGCATAGTGGAAAATGGAGCTGGTACAGGTTGAACAGTTTACCCTCCCCTCTCTTCAATTATTGCCCATGGAGGAGCTTCAGTTGACCTAGCTATCTTTTCTCTTCATTTAGCCGGTATTTCATCTATTCTAGGAGCTGTAAATTTTATTACTACAGTCATTAATATGCGATCTACAGGAATTACCTTTGATCGAATACCTCTATTTGTTTGAGCAGTGGTACTAACAGCTCTATTACTATTATTATCCCTCCCAGTACTAGCTGGAGCAATCACAATGTTATTAACAGACCGAAACCTAAATACCTCCTTCTTTGACCCAGCTGGGGGAGGAGATCCTATCCTCTACCAACATCTATTT	MVTBI131-08
467	194	Democratic Republic of the Congo	\N	GACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGAACTTCGCTTAGAATTTTAGTCCGAGCTGAATTAGGACACCCTGGAGCCCTAATTGGCGATGATCAAATTTATAATGTTATTGTAACAGCTCACGCATTTGTTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGGAATTGATTAGTACCTCTAATGCTTGGAGCCCCAGACATGGCGTTTCCTCGAATAAATAATATAAGTTTTTGATTACTGCCCCCATCTCTCACCCTACTTTTAGTCAGCAGTATAGTAGAAAACGGAGCTGGTACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATTATTGCACACGGGGGAGCTTCTGTAGACTTAGCGATTTTTTCCCTTCATTTAGCTGGAATCTCCTCTATTTTAGGAGCTGTAAACTTCATTACTACAGTAATTAATATACGATCGACCGGAATCACTTTTGATCGAATACCTTTATTTGTATGAGCAGTTGTACTAACAGCCCTACTATTACTACTATCCTTACCGGTATTAGCAGGAGCAATCACAATATTATTAACAGACCGAAATCTAAATACTTCATTCTTTGACCCAGCAGGAGGAGGAGATCCTATTCTATACCAACATTTATTTTGATTCTTTGGACACCCTGAAGTTTACATTTTAATTTTACCCGGATTTGGAATAATCTCCCATATCATTAGTCAAGAGTCAGGAAAAAAGGAAACATTTGGATCATTGGGAATAATCTACGCAA----------------------------------------------------------------------------------------------------------	JTB279-12
468	196	Kenya	\N	-----------TCATTTTCGGAGCATGAGCAGGTATAGTTGGAACATCTCTTAGAATTTTAGTACGTGCTGAATTAGGTCACCCTGGAGCACTTATTGGAGATGACCAAATTTATAATGTAATTGTAACAGCCCATGCATTTGTTATAATTTTCTTCATGGTCATGCCAATTATAATCGGAGGATTTGGTAACTGATTAGTACCTTTAATATTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGTTTTTGATTACTACCTCCTTCTCTTACACTCCTTTTAGTGAGCAGTATAGTGGAAAACGGAGCTGGTACAGGTTGAACTGTTTATCCTCCTCTCTCATCTATTATTGCTCATGGAGGAGCATCAGTAGATTTAGCTATTTTCTCATTACATTTAGCAGGTATCTCATCAATTTTAGGGGCAGTAAATTTTATTACCACAGTAATTAATATACGATCAACAGGAATTACATTTGATCGTATACCTTTATTTGTTTGAGCTGTCGTATTAACAGCATTATTATTATTACTATCTCTTCCAGTATTAGCTGGGGCTATTACAATATTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCCGCAGGAGGGGGAGACCCTATTTTATACCAACATTTATTT	MVTBI135-08
469	197	Kenya	\N	AACCTTATATTTTATTTTCGGAGCCTGAGCAGGTATAGTAGGAACCTCCCTAAGAATTCTGATCCGTGCTGAATTAGGTCACCCTGGAGCTCTAATCGGAGACGATCAAATCTACAACGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATCGGAGGATTTGGAAATTGGCTAGTACCCCTAATACTAGGAGCCCCAGATATAGCATTTCCCCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCCCTTACTTTACTTTTAGCCAGCAGTATAGTAGAAAACGGAGCTGGCACAGGCTGAACGGTTTACCCTCCCCTTTCTTCAATTATTGCTCATGGAGGAGCCTCAGTTGATCTAGCAATTTTCTCCCTACATTTAGCAGGTATCTCATCTATTTTAGGAGCTGTAAATTTTATTACGACTGTGATTAATATACGATCAACAGGAATTACATTTGATCGAATACCCTTATTTGTTTGGGCCGTAGTATTAACCGCCTTACTACTACTTCTTTCTCTACCAGTTTTAGCAGGAGCAATCACGATATTATTAACAGATCGAAATTTAAATACATCTTTCTTTGACCCAGCCGGAGGGGGAGATCCAATCCTATACCAACATTTATTT	MVTBI136-08
470	198	Democratic Republic of the Congo	\N	CACACTATACTTCATCTTCGGAGCTTGAGCAGGAATAGTGGGAACATCTCTCAGTATTTTAATTCGAGCCGAACTAGGTCACCCTGGAGCCTTAATTGGTGATGATCAAATTTACAACGTTATTGTTACAGCCCACGCATTCGTAATAATTTTCTTTATAGTAATACCTATTATAATCGGAGGATTTGGAAACTGACTAGTACCCCTAATACTAGGAGCCCCAGATATAGCCTTCCCTCGAATAAATAATATAAGTTTTTGATTACTACCTCCATCTCTTACCCTACTTTTAGTCAGCAGCATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCTCCCCTATCTTCAATTATTGCTCATGGAGGAGCTTCAGTTGATCTAGCTATCTTTTCTCTTCATTTAGCAGGTATTTCATCTATTCTAGGAGCTGTAAATTTTATTACCACAGTCATTAATATACGATCCACAGGAATCACCTTTGATCGAATACCATTATTTGTTTGAGCAGTAGTATTAACAGCTCTATTACTATTATTATCCCTACCAGTACTGGCCGGAGCAATCACAATATTATTAACAGACCGAAACCTAAATACCTCCTTCTTTGATCCCGCCGGAGGGGGAGACCCCATCCTTTACCAACATCTATTTTGATTCTTTGGACATCCTGAAGTATACATTTTAATTTTACCTGGATTCGGAATAATCTCCCACATTATCAGTCAAGAATCTGGCAAAAAGGAAACCTTCGGTTCATTAGGAATAATCTATGCAATACTAGCAATTGGATTATTAGGATTCATTGTTTGAGCTCATCATATATTTACCGTAGGAATAGACGTTGACACTCGAGCTTATTTTACCTCCGCTACTATAATT--	JTB357-12
471	199	Mozambique	\N	GACATTATATTTTATTTTCGGAGCAAGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATTTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAATACTTGCAATTGGTTTATTAGGGTTTATTGTATGAGCTCATCATATATTTACAGT---------------------------------------------------	JTB008-12
472	199	Mozambique	\N	GACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGGCACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATTTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAATACTTGCAATTGGTTTATTAGGGTTTATTGTATGAGCTCATCATATATTTACAGTAGGTATAGACGTTGATACCCGAGCTTA------------------------	JTB011-12
473	199	Democratic Republic of the Congo	\N	GACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATTTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAATACTTGCAATTGGTTTATTAGGGTTTATTGTATGAGCTCATCATATATTTACAGTAGGTATAGACGTTGATACCCGAGCTTACTTTACTTCAGCTAC---------	JTB048-12
474	199	Democratic Republic of the Congo	\N	GACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATTTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAATACTTGCAATTGGTTTATTAGGGTTTATTGTATGAGCTCATCATATATTTACAGTAGGTATAGACGTTGATACCCGAGCTTACTTTACTTCAGCTACTATAA----	JTB049-12
475	199	Democratic Republic of the Congo	\N	GACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATTTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAATACTTGCAATTGGTTTATTAGGGTTTATTGTATGAGCTCATCATATATTTACAGTAGGTATAGACGTTGATACCCGAGCTTACTTTACTTCAGCTACTATAA----	JTB157-12
476	199	Democratic Republic of the Congo	\N	GACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATTTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAATACTTGCAATTGGTTTATTAGGGTTTATTGTATGAGCTCATAATATATTTACAGTAGGTATAGACGT---------------------------------------	JTB200-12
477	199	Rwanda	\N	GACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATCTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAAAC--------------------------------------------------------------------------------------------------------	JTB231-12
478	199	Tanzania	\N	GACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGGCACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATTTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAATACTTGCAATTGG---------------------------------------------------------------------------------------------	JTB308-12
479	199	Sudan	\N	GACTTTATATTTTATCTTCGGTGCTTGAGCGGGAATAGTTGGTACTTCTCTTAGAATTTTAATTCGAGCAGAATTAGGACATCCAGGTGCTTTAATTGGGGATGACCAAATTTATAATGTAATTGTTACCGCTCATGCCTTTGTTATAATTTTTTTTATAGTTATGCCTATCATAATTGGAGGATTTGGAAACTGATTAGTTCCTCTTATATTAGGAGCTCCAGATATAGCTTTTCCTCGAATAAATAATATAAGTTTCTGATTATTACCACCTTCCCTTACATTATTATTAGTCAGTAGAATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCATTATCTTCAGTAATTGCCCATGGAGGAGCCTCCGTTGATCTAGCTATTTTCTCATTACATTTAGCTGGAATTTCTTCAATTCTAGGTGCTGTAAATTTTATTACAACAGTTATTAATATGCGATCAACAGGTATTACATTTGACCGAATACCTTTATTCGTCTGAGCAGTAGTTTTAACAGCTCTTCTTCTGTTATTATCGTTACCTGTTTTAGCAGGAGCAATCACTATATTATTAACAGATCGAAATTTAAATACATCTTTCTTTGATCCAGCAGGAGGAGGAGATCCTATTTTATACCAACATTTATTTTGATTCTTTGGACACCCAGAAGTTTATATTTTAATTCTCCCTGGATTCGGAATAATTTCTCATATTATTAGTCAAGAATCAGGAAAAAAGGAAACTTTTGGAGCATTAGGAATAATTTATGCTATAATAGCAATTGGATTACTAGGATTTATTGTATGAGCCCATCATAT------------------------------------------------------------	JTB331-12
480	199	Liberia	\N	GCAATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAATTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATTTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAATACTTGCAATTGG---------------------------------------------------------------------------------------------	JTB348-12
481	199	Togo	\N	GACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGGCACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTATTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTTTGATTCTTCGGTCACCCAGAAGTTTACATTTTAATTTTACCAGGATTCGGTATAATTTCACATATTATTAGTCAAGAATCTGGAAAAAAAGAAACATTCGGTTCTTTAGGAATAATCTATGCAATACTTGC---------------------------------------------------------------------------------------------------	JTB355-12
482	199	Benin	\N	AACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGGCACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGGGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI137-08
483	199	Benin	\N	AACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI138-08
484	199	Cameroon	\N	AACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI139-08
485	199	Cameroon	\N	AACCTTAAATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI140-08
486	199	Cameroon	\N	AACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI141-08
487	199	Democratic Republic of the Congo	\N	AACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGGCACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI142-08
488	199	Cote d'Ivoire	\N	--------------------GAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI143-08
489	199	Kenya	\N	AACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGGCACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI144-08
490	199	Uganda	\N	AACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGCCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI145-08
491	199	Zimbabwe	\N	AACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATNCGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI146-08
492	199	Mozambique	\N	AACATTATATTTTATTTTCGGAGCTTGAGCAGGTATAGTAGGTACATCCCTTAGAATTTTAGTACGAGCAGAATTAGGACACCCTGGTGCCCTAATTGGTGATGATCAAATCTATAACGTTATTGTAACAGCCCATGCATTTGTAATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGACTGGTTCCTTTAATACTAGGAGCCCCAGATATAGCCTTCCCCCGAATAAATAACATAAGATTCTGATTACTACCCCCATCCCTAACCCTACTTTTAGTCAGAAGTATAGTAGAAAATGGAGCTGGGACAGGTTGAACAGTTTACCCACCCCTCTCCTCAATCATTGCTCATGGAGGAGCTTCAGTAGATCTTGCAATTTTCTCATTACATTTAGCCGGAATTTCATCAATTTTAGGTGCTGTAAATTTTATTACAACCGTCATTAATATACGATCCACAGGAATCACATTTGATCGTATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCTCTACTACTTTTACTTTCTCTACCTGTACTAGCAGGAGCAATCACTATATTATTAACAGACCGAAATCTAAATACCTCATTCTTCGACCCAGCAGGAGGAGGAGACCCTATTCTTTACCAACACTTATTT	MVTBI262-09
493	200	Kenya	\N	---------------------------TGAGCAGGAATAGTAGGGACCTCCCTAAGAATTNTAATTCGTGCTGAATTAGGTCACCCCGGAGCTTTAATCGGAGACGATCAAATCTATAATGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTCATAGTAATACCTATTATAATCGGAGGATTTGGAAATTGACTAGTACCTTTAATGCTTGGAGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCCCCATCCCTTACCTTACTTTTAGCCAGCAGCATAGTAGAAAACGGAGCTGGCACCGGTTGAACGGTTTATCCTCCCCTTTCTTCAATCATTGCTCATGGAGGAGCTTCAGTTGATTTAGCAATTTTCTCCTTACATTTAGCAGGTATCTCCTCTATTTTAGGAGCCGTAAATTTTATCACTACTGTAATTAATATACGATCAACAGGAATTACATTTGATCGAATACCTTTATTTGTATGAGCCGTTGTATTAACCGCTTTACTATTGCTCCTTTCTCTGCCAGTTTTAGCAGGAGCAATCACAATATTATTAACAGACCGAAATCTAAATACATCATTCTTTGACCCAGCTGGAGGAGGAGACCCAATTTTATACCAACATTTATTT	MVTBI237-08
494	201	South Africa	\N	AAGATATTGGAACTTTATATTTTATCTTCGGGGCTTGAGCAGGTATAGTAGGAACTTCCCTTAGAATTTTAGTACGTGCTGAATTAGGTCACCCCGGGGCTCTAATCGGAGATGATCAAATTTATAATGTAATTGTAACAGCCCATGCATTTGTAATAATTTTCTTCATAGTTATGCCTATCATAATTGGAGGGTTTGGAAACTGATTAGTACCTTTAATATTAGGTGCACCAGATATAGCTTTCCCCCGAATAAACAATATAAGTTTTTGACTACTGCCCCCTTCTCTTACACTATTATTAGTGAGCAGTATAGTAGAAAATGGAGCTGGGACAGGCTGAACTGTATACCCCCCTCTTTCTTCAATTATTGCCCATGGAGGTGCATCCGTTGATTTAGCAATTTTTTCATTACATTTAGCGGGTATTTCATCTATCTTAGGGGCCGTAAATTTCATCACTACAGTAATTAATATACGATCAACAGGAGTTACATTTGACCGCATACCTTTATTCGTATGAGCGGTAGTATTAACAGCATTACTATTATTACTCTCTCTTCCTGTATTAGCTGGAGCTATCACCATATTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCAGCATGAGGGGGAGACCCAATCTTATATCAACATTTATTCTGATTTTTG	AFRFF094-16
495	201	South Africa	\N	AAGATATTGGAACTTTATATTTTATCTTCGGGGCTTGAGCAGGTATAGTAGGAACTTCCCTTAGAATTTTAGTACGTGCTGAATTAGGTCACCCCGGGGCTCTAATCGGAGATGATCAAATTTATAATGTAATTGTAACAGCCCATGCATTTGTAATAATTTTCTTCATAGTTATGCCTATTATAATTGGAGGGTTTGGAAACTGATTAGTACCTTTAATATTAGGTGCACCAGATATAGCTTTCCCCCGAATAAACAATATAAGTTTTTGACTACTGCCCCCTTCTCTTACACTATTATTAGTGAGCAGTATAGTAGAAAATGGAGCTGGGACAGGCTGAACTGTATACCCCCCTCTTTCTTCAATTATTGCCCATGGAGGTGCATCCGTTGATTTAGCAATTTTTTCATTACATTTAGCGGGTATTTCATCTATCTTAGGGGCCGTAAATTTCATCACTACAGTAATTAATATACGATCAACAGGAGTTACATTTGACCGCATACCTTTATTCGTATGAGCGGTAGTATTAACAGCATTACTATTATTACTCTCTCTTCCTGTATTAGCTGGAGCTATCACCATATTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCAGCAGGAGGGGGAGACCCAATCTTATATCAACATTTATTCTGATTTTT	AFRFF095-16
496	201	Botswana	\N	GACTTTATATTTTATCTTCGGGGCTTGAGCAGGTATAGTAGGGACTTCCCTTAGAATTTTAGTACGTGCTGAATTAGGTCACCCCGGGGCTCTAATCGGAGATGATCAAATTTATAATGTAATTGTAACAGCCCATGCATTTGTAATAATTTTCTTCATAGTTATGCCTATTATAATTGGAGGGTTTGGAAACTGATTAGTACCTTTAATATTAGGTGCACCAGATATAGCTTTCCCCCGAATAAACAATATAAGTTTTTGACTACTGCCCCCTTCTCTTACACTATTATTAGTGAGCAGTATAGTAGAAAATGGAGCTGGGACAGGCTGAACTGTATACCCCCCTCTTTCTTCAATTATTGCCCATGGAGGTGCATCCGTTGATTTAGCAATTTTTTCATTACATTTAGCGGGTATTTCATCTATCTTAGGGGCCGTAAATTTCATCACTACAGTAATTAATATACGATCAACAGGAGTTACATTTGACCGCATACCTTTATTCGTATGAGCGGTAGTATTAACAGCATTACTATTATTACTYTCTCTTCCAGTATTAGCTGGAGCTATCACCATATTATTAACAGACCGAAATTTAAATACGTCATTCTTTGACCCAGCAGGAGGGGGAGACCCAATTTTATAYCAACATTTATTCTGATTTTTCGGACACCCAGAAGTCTATATTTTAATTTTACCTGGATTTGGTATAATYTCTCACATTATTAGTCAAGAATCAGGVAAAAAAGAAACCTTCGGTTCATTAGGAATAATTTATGCAATAATAGCAATCGGTTTATTAGGTTTTATTGTATGAGCTCACCATATATTCACTGTTGGGATAGATGTTGATACCCGAGCATACTTCACT-----------------	JTB240-12
497	201	Kenya	\N	AACTTTATATTTTATCTTCGGGGCTTGAGCAGGTATAGTAGGAACTTCCCTTAGAATTTTAGTACGTGCTGAATTAGGTCNCCCCGGGGCTCTAATCGGAGACGATCAAATTTATAATGTAATTGTAACAGCCCATGCATTTGTAATAATTTTCTTCATAGTTATGCCTATTATAATTGGAGGGTTTGGAAACTGATTAGTACCTTTAATATTAGGTGCGCCAGATATAGCTTTCCCCCGAATAAACAATATAAGTTTTTGACTACTGCCCCCTTCTCTTACACTATTATTAGTGAGCAGTATAGTAGAAAATGGAGCTGGGACAGGCTGAACTGTATACCCCCCTCTTTCTTCAATTATTGCCCATGGAGGCGCATCCGTTGATTTAGCAATTTTTTCATTACATTTAGCAGGTATTTCATCTATCTTAGGGGCCGTAAATTTCATCACTACAGTAATTAATATGCGATCAACAGGAGTTACATTTGACCGTATACCTTTATTCGTATGAGCGGTAGTATTAACAGCATTACTATTATTACTCTCTCTTCCTGTATTAGCTGGAGCTATCACCATATTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCAGCAGGAGGGGGAGACCCAATCTTATACCAACATTTATTC	MVTBI147-08
498	201	Kenya	\N	AACTTTATATTTTATCTTCGGGGCTTGAGCAGGTATAGTAGGAACTTCCCTTAGAATTTTAGTACGTGCTGAATTAGGTCACCCCGGGGCTCTAATCGGAGACGATCAAATTTATAATGTAATTGTAACAGCCCATGCATTTGTAATAATTTTCTTCATAGTTATGCCTATTATAATTGGAGGGTTTGGAAACTGATTAGTACCTTTAATATTAGGTGCGCCAGATATAGCTTTCCCCCGAATAAACAATATAAGTTTTTGACTACTGCCCCCTTCTCTTACACTATTATTAGTGAGCAGTATAGTAGAAAATGGAGCTGGGACAGGCTGAACTGTATACCCCCCTCTTTCTTCAATTATTGCCCATGGAGGCGCATCCGTTGATTTAGCAATTTTTTCATTACATTTAGCAGGTATTTCATCTATCTTAGGGGCCGTAAATTTCATCACTACAGTAATTAATATGCGATCAACAGGAGTTACATTTGACCGTATACCTTTATTCGTATGAGCGGTAGTATTAACAGCATTACTATTATTACTCTCTCTTCCTGTATTAGCTGGAGCTATCACCATATTATTAACAGACCGAAATTTAAATACATCATTCTTTGACCCAGCAGGAGGGGGAGACCCAATCTTATACCAACATTTATTC	MVTBI148-08
499	207	Kenya	\N	TGGTCAACNATTTATTTTCGGAGCTTGAGCAGGAATAGTCGGAACATCTCTTAGAATCTTAGTGCGAGCCGAATTAGGTCACCCTGGCGCACTAATTGGAGACGATCAAATCTATAACGTAATTGTTACAGCTCACGCATTTGTAATAATTTTCTTCATAGTTATACCAATTATAATCGGAGGGTTCGGTAATTGACTAGTACCCCTAATACTAGGAGCCCCCGATATAGCATTTCCCCGAATAAACAATATAAGTTTCTGACTGCTACCTCCTTCCCTAACCCTATTATTAGTCAGCAGAATAGTGGAAAACGGAGCTGGTACAGGTTGAACTGTATACCCCCCGCTATCTTCCATTATCGCTCATGGAGGAGCCTCCGTTGATGCTGCTATCTTCTCATTACATCTAGCTGGTATCTCATCAATTTTAGGGGCTGTAAATTTTATCACCACAGTAATTAATATACGATCAACAGGAATTACATTCGACCGAATGCCTTTATTCGTTTGAGCAGTAGTATTAACAGCTTTATTACTACTATTATCCCTGCCAGTATTAGCTGGAGCTATCACAATATTACTAACAGATCGAAACTTAAATACATCATTTTTTGACCCAGCAGGAGGTGGAGACCCTATTTTATACCAACATTTATTT	MVTBI153-08
500	208	Kenya	\N	--AACCTTATACTTTATTTTCGGGGCCTGAGCAGGAATAGTAGGGACCTCCCTAAGAATTCTAATTCGTGCTGAATTAGGTCACCCCGGAGCTTTAATCGGAGACGATCAAATCTATAATGTAATTGTAACAGCCCACGCATTTGTAATAATTTTCTTCATAGTAATACCTATTATAATCGGAGGATTTGGAAATTGACTAGTACCTTTAATGCTTGGAGCCCCAGATATAGCATTCCCCCGAATAAATAATATAAGTTTTTGATTACTACCCCCATCCCTTACCTTACTTTTAGCCAGCAGCATAGTAGAAAACGGAGCTGGCACCGGTTGAACGGTTTATCCTCCCCTTTCTTCAATCATTGCTCATGGAGGAGCTTCAGTTGATTTAGCAATTTTCTCCTTACATTTAGCAGGTATCTCCTCTATTTTAGGAGCCGTAAATTTTATCACTACTGTAATTAATATACGATCAACAGGAATTACATTTGATCGAATACCTTTATTTGTATGAGCCGTTGTATTAACCGCTTTACTATTGCTCCTTTCTCTGCCAGTTTTAGCAGGAGCAATCACAATATTATTAACAGACCGAAATCTAAATACATCATTCTTTGACCCAGCTGGAGGAGGAGACCCAATTTTATACCAACATTTATTT	MVTBI239-08
501	210	South Africa	\N	CGGAGCCTGAGCAGGTATAGTAGGAACATCTCTTAGAATCCTAGTACGAGCTGAATTAGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTACTACCTCCCTCTCTTACGTTACTTTTAGTAAGCAGTATAGTAGAAAACGGAGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCACTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACATTTGACCGAATACCATTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTCTTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGATCCTGCTGGTGGAGGTGACCCAATTTTATATCAACATTTATTTTGATTTT	AFRFF100-16
502	210	Ghana	\N	GACCTTATATTTTATTTTCAGAGCCTGAGCAGGTATAGTGGGAACATCTCTTAGAATCCTAGTACGAGCTGAATTAGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTACTACCTCCCTCTCTTACGTTACTTTTAGTAAGCAGTATAGTAGAAAACGGAGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCATTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACATTTGACCGAATACCATTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTGTTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGATCCTGCTGGTGGAGGTGACCCAATTCTATATCAACATTTATTTTGATTTTTTGGACATCCAGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCATATTATTAGCCAAGAATCAGGTAAAAAGGAAACATTCGGTTCATTAGGAATAATTTATGCAATAATAGCAATTGGATTATTAGGTTTTATTGTATGAGCTCATCATATATTTACAGTAGGTATAGATGTAGACACACGAGCTTATTTTACTTCAG-------------	JTB039-12
503	210	Ghana	\N	GACCTTATATTTTATTTTCGGAGCCTGAGCAGGTATAGTGGGAACATCTCTTAGAATCCTAGTACGAGCTGAATTAGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTATTACCTCCCTCTCTTACGTTACTTTTAGTAAGCAGTATAGTAGAAAACGGGGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCATTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACATTTGACCGAATACCGTTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTGTTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGATCCTGCTGGTGGAGGTGACCCAATTTTATATCAACATTTATTTTGATTTTTTGGACATCCAGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATCTCTCATATTATTAGCCAAGAATCGGGTAAAAAGGAAACATTCGGTTCATTAGGAATAATTTATGCAATAATAGCAATTGGATTATTAGGTTTTATTGTATGAGCTCATCATATATTTACAGTAGGTATAGATGTAGACACACGAGCTTATTTTACTTCAGCT-----------	JTB086-12
504	210	Ghana	\N	GACCTTATATTTTATTTTCGGAGCCTGAGCAGGTATAGTGGGAACATCTCTTAGAATCCTAGTACGAGCTGAATTAGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTACTACCTCCCTCTCTTACGTTACTTTTAGTAAGCAGTATAGTAGAAAACGGAGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCATTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACATTTGACCGAATACCATTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTGTTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGATCCTGCTGGTGGAGGTGACCCAATTTTATATCAACATTTATTTTGATTTTTTGGACATCCAGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATCTCTCATATTATTAGCCAAGAATCGGGTAAAAAGGAAACATTCGGTTCATTAGGAATAATTTATGCAATAATAGCAATTGGATTATTAGGTTTTATTGTATGAGCTCATCATATATTTACAGTAGGTATAGATGTAGACACACGAGCTTATTTTACTTCAGC------------	JTB101-12
505	210	Ghana	\N	GACCTTATATTTTATTTTCGGAGCCTGAGCAGGTATAGTGGGAACATCTCTTAGAATCCTAGTACGAGCTGAATTAGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTACTACCTCCCTCTCTTACGTTACTTTTAGTAAGCAGTATAGTAGAAAACGGAGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCATTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACATTTGACCGAATACCATTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTGTTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGATCCTGCTGGTGGAGGTGACCCAATTCTATATCAACATTTATTTTGATTTTTTGGACATCCAGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATCTCTCATATTATTAGCCAAGAATCGGGTAAAAAGGAAACATTCGGTTCATTAGGAATAATTTATGCAATAATAGCAATTGGATTATTAGGTTTTATTGTATGAGCTCATCATATATTTACAGTAGGTATAGATGTAGACACACGAGCTTATTTTACTTCAGC------------	JTB103-12
506	210	Ghana	\N	GACCTTATATTTTATTTTCGGGGCCTGAGCAGGTATAGTGGGAACATCTCTTAGAATCCTGGTACGAGCTGAATTAGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCCTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTACTACCTCCCTCTCTTACGTTACTTTTAGTAAGTAGTATAGTAGAAAACGGAGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCATTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACCTTTGACCGAATACCATTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTGTTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGACCCTGCTGGTGGAGGTGATCCAATTTTATACCAACATTTATTTTGATTTTTCGGACATCCAGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATCTCTCATATTATTAGCCAAGAATCAGGTAAAAAGGAAACATTCGGTTCATTAGGAATAATTTATGCAATAATAGCAATTGGATTATTAGGGTTTATTGTATGAGCTCATCATATATTTACAGTAGGTATAGATGTAGACACACGAGCTTATTTTACTTCAGCT-----------	JTB113-12
507	210	Botswana	\N	GACCTTATATTTTATTTTCGGAGCCTGAGCAGGTATAGTAGGAACATCTCTTAGAATCCTAGTACGAGCTGAATTAGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTACTACCTCCCTCTCTTACGTTACTTTTAGTAAGCAGTATAGTAGAAAACGGAGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCACTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACATTTGACCGAATACCATTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTCTTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGATCCTGCTGGTGGAGGTGACCCAATTTTATATCAACATTTATTTTGATTTTTTGGACATCCAGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATCTCTCATATTATTAGCCAAGAATCGGGTAAAAAGGAAACATTCGGTTCATTAGGAATAATTTATGCAATAATAGCAATTGGATTATTAGGTTT---------------------------------------------------------------------------------	JTB278-12
508	210	Tanzania	\N	AACCTTATATTTTATTTTCGGAGCCTGAGCAGGTATAGTAGGAACATCTCTTAGAATCCTAGTACGAGCTGAATTAGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTACTACCTCCCTCTCTTACGTTACTTTTAGTAAGCAGTATAGTAGAAAACGGAGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCACTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACATTTGACCGAATACCATTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTCTTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGATCCTGCTGGTGGAGGTGACCCAATTTTATATCAACATTTATTT	MVTBI158-08
509	210	Tanzania	\N	AACCTTATATTTTATTTTCGGAGCCTGAGCAGGTATAGTGGGAACATCTCTTAGAATCCTAGTACGAGCTGAATTGGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTACTACCTCCCTCTCTTACGTTACTTTTAGTAAGCAGTATAGTAGAAAACGGAGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCATTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACATTTGACCGAATACCATTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTATTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGATCCTGCTGGTGGAGGTGACCCAATTTTATATCAACATTTATTT	MVTBI159-08
510	210	Nigeria	\N	--AACCTTATATTTTATTTTCGGAGCCTGAGCAGGTATAGTGGGAACATCTCTTAGAATCCTAGTACGAGCTGAATTAGGCCACCCTGGAGCATTAATTGGTGATGATCAAATCTATAATGTAATTGTAACAGCCCATGCTTTTGTAATAATTTTCTTCATAGTAATACCAATTATAATTGGAGGATTTGGTAATTGATTAGTACCTTTAATATTAGGAGCACCAGATATAGCATTCCCCCGAATAAATAATATAAGCTTTTGATTACTTCCCCCCTCTCTTACGTTACTTTTAGTAAGCAGTATAGTAGAAAACGGAGCTGGTACAGGATGAACTGTTTATCCCCCTCTTTCTTCTATTATTGCTCATGGAGGAGCCTCAGTAGATTTAGCAATTTTCTCATTACATCTAGCTGGTATTTCCTCTATTTTAGGAGCCGTAAATTTTATTACTACAGTAATTAATATACGCTCTACAGGAATTACATTTGACCGAATACCATTATTTGTTTGAGCAGTTGTATTAACAGCTTTATTATTACTTCTTTCCCTTCCAGTGTTAGCTGGAGCAATTACAATATTACTAACAGATCGAAATTTAAATACCTCATTCTTTGATCCTGCTGGTGGAGGTGATCCAATTTTATATCAACATTTATTT	MVTBI236-08
533	328	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATACTAGGAACATCTTTAAGAATTTTAATTCGAATAGAATTAGGAACTCCAGGATCTTTAATTGGAGATGATCAAATTTATAATACTATTGTGACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATCGGAGGATTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCAGATATAGCATTCCCACGAATAAATAATATAAGATTTTGATTACTACCCCCTTCACTAATATTATTAGTTTCAAGAAGAATTGTA---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	PMANL3235-14
534	339	South Africa	\N	TGTAGGTTTATCATTAAGAATAATTATTCGNATAGAATTAGGTAATCCGGGGTCATTAATTGGTAATGATCAAATTTATAATTCTATTGTAACTACTCATGCATTTATTATAATTTTTTTTTTTGTAATGCCTGTGATAATAGGGGGATTTGGAAATTTTTTAATTCCTATAATTATAGGAATTCCTGATATAGCTTTTCCTCGAATAAATAATATAAGGTTTTGGTTATTACCNCCAAGATTAATATTATTAATTTCTAGAATATTTATTGGAAGGGGGACAGGAACAGGGTGGACAGTTTANCCTCCTTTATCGTCAAATTTATCACATGGGGGTCCTTCTGTAGATTTATCAATTTTTTCTCTTCATATTGCAGGGGTTTCATCAATTATAGCATCAATTAATTTTATTTCAACAATTTTAAATATAAAATTATTTAAAATTGATTTAATTCCTTTATTTTCTTGATCAATAATATTGACAGCTGTATTATTATTATTATCTTTACCTGTTTTAGCTGGTGCAATTACTATATTATTATTTGATCGAAATTTAAATACTTCATTTT	GMSAT1569-13
535	362	Kenya	GQ254294	AACCTTATATTTTATTTTCGGAGCCTGAGCAGGGATAATCGGGACATCCCTTAGAATTCTAATTCGAGCTGAATTAGGACATCCAGGAGCGCTAATCGGAGATGACCAAATTTACAATGTAATTGTAACCGCGCACGCTTTTGTTATAATTTTTTTTATAGTAATGCCCATTATAATTGGAGGATTTGGTAACTGATTAGTCCCTCTTATACTAGGAGCCCCAGATATAGCATTCCCACGAATAAATAATATGAGTTTCTGACTACTGCCTCCTTCACTTACACTGTTGTTAGTCAGTAGCATAGTTGAAAATGGAGCTGGTACAGGTTGAACTGTTTACCCCCCTTTATCCTCCGTAATCGCTCATGGAGGAGCCTCTGTTGATTTAGCAATTTTCTCCCTCCACCTAGCAGGTATTTCATCAATTTTAGGAGCAGTAAATTTTATTACAACAGTTATCAATATACGATCAACTGGAATTACATTTGATCGGATACCTCTATTTGTTTGAGCTGTTGTATTAACCGCCCTACTCCTCCTATTATCCCTCCCAGTATTAGCAGGAGCAATCACAATACTTTTAACTGACCGTAACTTAAATACATCATTCTTCGACCCAGCAGGAGGAGGAGACCCAATTCTTTATCAACATCTATTT----	LPNGM003-07
536	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTGATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTG-------------------------	GMSAY034-14
537	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	GWOTH503-12
538	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTGATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LNAUU4269-15
539	372	South Africa	\N	-------------ATTTTT---GGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTA------ATTCGTGCAGAATTAGGTACTCCTGGA------TCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTGATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCNCCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGT------------------------------	LSAFA189-13
540	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTGATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR094-12
541	372	South Africa	\N	AACTTTATATTTTATCTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTGATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR1056-12
542	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTGATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR1077-12
543	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR1535-12
544	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR1559-12
545	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR330-12
546	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR349-12
547	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTGATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR701-12
548	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTGATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR734-12
549	372	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTGATGCCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTACTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	LSAFR739-12
550	372	Kenya	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTTATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	PMANK199-06
551	372	Kenya	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	PMANK201-06
552	372	Kenya	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	PMANK203-06
553	372	Nigeria	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGATTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	PMANK204-06
554	372	Kenya	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGGTTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATT-------------------------------------------------	PMANK752-08
555	372	Kenya	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGATTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATT-------------------------------------------------	PMANK756-08
556	372	Nigeria	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGATTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCCGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	PMANK758-08
557	372	Nigeria	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGATTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGTGATCCAATTTTATATCAACATTTATTT	PMANK759-08
558	372	Nigeria	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGATTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATTTTTTGA-------------------------------------------	PMANK761-08
559	372	Nigeria	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGATTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATT-------------------------------------------------	PMANK765-08
560	372	Nigeria	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGATTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATT-------------------------------------------------	PMANK766-08
561	372	Nigeria	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGATTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATT-------------------------------------------------	PMANK768-08
562	372	Kenya	\N	AACTTTATATTTTATTTTTGGAATCTGAGCAGGAATAGTAGGTACATCTTTAAGACTTTTAATTCGTGCAGAATTAGGTACTCCTGGATCTTTGATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCATTTCCTCGTATAAATAATATAAGTTTTTGATTACTTCCACCTTCAATTACTTTATTAATTTCAAGAAGAATTGTTGAAAATGGGGCAGGAACAGGATGAACAGTTTATCCCCCACTTTCATCTAATATTGCTCATGGAGGTAGCTCTGTTGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAACTTCATTACTACAATTATTAATATACGATTAAATAATTTATCTTTTGATCAAATACCTTTATTTGTCTGAGCCGTTGGAATTACAGCATTTTTATTATTATTATCTTTACCTGTTTTAGCTGGAGCTATTACTATACTTTTAACTGATCGTAATTTAAATACATCATT-------------------------------------------------	PMANK769-08
563	373	Nigeria	\N	AACTTTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACTTCACTAAGATTATTAATTCGAGCTGAATTAGGGAATCCTGGATCATTAATTGGTGATGATCAAATTTATAATACTATTGTTACTGCACACGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGACTTCTACCCCCTTCTTTAACTCTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGCTCAGTAGATTTAGCTATTTTCTCTTTACATTTAGCTGGAATTTCCTCTATTTTAGGAGCTATTAATTTTATTTCTACTATTATTAATATACGATTAAATAATTTATCATTTGATCAAATACCTCTATTTATTTGAGCAGTAGGAATTACTGCATTTCTTTTATTACTTTCTTTACCAGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCTTTTTTTGACCCTGCTGGAGGTGGGGACCCAATTTTATACCAACATTTATTT	LPNGM062-07
564	373	Nigeria	\N	NNNNNNNNNNNNNNNNNNNNGTATTTGAGCAGGAATAGTAGGAACTTCACTAAGATTATTAATTCGAGCTGAATTAGGGAATCCTGGATCATTAATTGGTGATGATCAAATTTATAATACTATTGTTACTGCACACGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGACTTCTACCCCCTTCTTTAACTCTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGCTCAGTAGATTTAGCTATTTTCTCTTTACATTTAGCTGGAATTTCCTCTATTTTAGGAGCTATTAATTTTATTTCTACTATTATTAATATACGATTAAATAATTTATCATTTGATCAAATACCTCTATTTATTTGAGCAGTAGGAATTACTGCATTTCTTTTATTACTTTCTTTACCAGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCTTTTTTTGACCCTGCTGGAGGTGGGGACCCAATTTTATACCAACATTTATTT	LPNGM063-07
565	373	Nigeria	\N	AACTTTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACTTCACTAAGATTATTAATTCGAGCTGAATTAGGGAATCCTGGATCATTAATTGGTGATGATCAAATTTATAATACTATTGTTACTGCACACGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGACTTCTACCCCCTTCTTTAACTCTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGCTCAGTAGATTTAGCTATTTTCTCTTTACATTTAGCTGGAATTTCCTCTATTTTAGGAGCTATTAATTTTATTTCTACTATTATTAATATACGATTAAATAATTTATCATTTGATCAAATACCTCTATTTATTTGAGCAGTAGGAATTACTGCATTTCTTTTATTACTTTCTTTACCAGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCTTTTTTTGACCCTGCTGGAGGTGGGGACCCAATTTTATACCAACATTTATTT	LPNGM065-07
566	373	Nigeria	\N	AACTTTATATTTCATTTTTGGTATTTGAGCAGGAATAGTAGGAACTTCCCTAAGATTATTAATTCGAGCTGAATTAGGGAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACTGCACATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTCGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCCGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTTCTACCCCCCTCTTTAACTCTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCACATGGAGGAAGCTCAGTAGATTTAGCTATTTTTTCATTACATTTAGCTGGAATTTCTTCTATTTTAGGAGCTATTAATTTTATTTCTACTATTATTAATATACGATTAAATAATTTATCATTCGATCAAATACCTTTATTTATTTGAGCGGTAGGAATTACTGCATTCCTTTTATTACTTTCTTTACCAGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCTTTTTTTGATCCTGCTGGAGGTGGAGATCCAATTTTATACCAACATTTATTT	LPNGM066-07
567	373	Nigeria	\N	AACTTTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACTTCACTAAGATTATTAATTCGAGCTGAATTAGGGAATCCTGGATCATTAATTGGTGATGATCAAATTTATAATACTATTGTTACTGCACACGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGACTTCTACCCCCTTCTTTAACTCTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGCTCAGTAGATTTAGCTATTTTCTCTTTACATTTAGCTGGAATTTCCTCTATTTTAGGAGCTATTAATTTTATTTCTACTATTATTAATATACGATTAAATAATTTATCATTTGATCAAATACCTCTATTTATTTGAGCAGTAGGAATTACTGCATTTCTTTTATTACTTTCTTTACCAGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCTTTTTTTGACCCTGCTGGAGGTGGGGACCCAATTTTATACCAACATTTATTT	LPNGM067-07
568	373	Kenya	\N	AACTTTATATTTCATTTTTGGTATTTGAGCAGGAATAGTAGGAACTTCCCTAAGATTATTAATTCGAGCTGAATTAGGGAATCCAGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACTGCACATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTCGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCCGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTTCTACCCCCCTCTTTAACTCTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCACATGGAGGAAGCTCAGTAGATTTAGCTATTTTTTCATTACATTTAGCTGGAATTTCTTCTATTTTAGGAGCTATTAATTTTATTTCTACTATTATTAATATACGATTAAATAATTTATCATTCGATCAAATACCTTTATTTATTTGAGCGGTAGGAATTACTGCATTCCTTTTATTACTTTCTTTACCAGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCTTTTTTTGATCCTGCTGGAGGTGGAGATCCAATTTTATACCAACATTTATTT	LPNGM068-07
569	373	Kenya	\N	AACTTTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACTTCACTAAGATTATTAATTCGAGCTGAATTAGGGAATCCCGGATCATTAATTGGCGATGATCAAATTTATAATACTATTGTTACTGCACATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGACTTCTACCCCCTTCTTTAACTCTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATGGAGGAAGCTCGGTAGATTTAGCTATTTTTTCTTTACATTTAGCTGGAATTTCTTCTATTTTAGGAGCTATTAATTTTATTTCTACTATTATTAATATACGATTAAATAATTTATCGTTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACTGCATTTCTTTTATTACTTTCTTTACCAGTTTTAGCCGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACTTCTTTTTTTGATCCTGCTGGAGGTGGAGACCCAATTTTATACCAACATTTATTT	LPNGM069-07
570	379	Ethiopia	\N	AACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTTGGAACTTCTTTAAGTTTATTAATTCGAGCTGAATTGGGAAATCCAGGTTCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACAGCTCATGCTTTTATTATAATTTTCTTTATAGTAATGCCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTCTTATATTAGGAGCTCCTGATATAGCTTTCCCCCGAATAAATAATATAAGTTTTTGACTTCTCCCCCCATCTTTAACCTTACTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCTAATATTGCCCACGGAGGTAGTTCTGTTGATTTAGCTATTTTTTCCTTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTTATTACTACAATTATTAATATACGATTAAATAGTTTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTGGGAATTACAGCTTTTTTATTATTACTTTCATTACCAGTTTTAGCAGGAGCTATTACTATATTGTTAACTGACCGAAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGTGATCCTATTTTATATCAACATTTATTT	GWORD1518-08
571	379	Gabon	MK187736	AACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTTGGAACTTCTTTAAGTTTATTAATTCGAGCTGAATTGGGAAATCCAGGTTCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACAGCTCATGCTTTTATTATAATTTTCTTTATAGTAATGCCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTCTTATATTAGGAGCTCCTGATATAGCTTTCCCCCGAATAAATAATATAAGTTTTTGACTTCTTCCCCCATCTTTAACCTTACTAATCTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCTAATATTGCCCACGGAGGTAGTTCTGTTGATTTAGCTATTTTTTCCTTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTTATTACTACAATTATTAATATACGATTAAATAGTTTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTGGGAATTACAGCTTTTTTATTATTACTTTCATTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACTGACCGAAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGTGATCCTATTTTATATCAACATTTATTT	MGABD145-11
572	379	South Africa	\N	AACATTATATTTTATTTTTGGAATTTGAGCAGGAATAGTTGGAACTTCTTTAAGTTTATTAATTCGAGCTGAATTAGGAAATCCAGGTTCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCTCATGCTTTTATTATAATTTTCTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCTCTTATATTAGGAGCCCCCGATATAGCTTTCCCCCGAATAAATAATATAAGTTTTTGACTTCTCCCCCCATCTTTAACTTTACTAATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGGACAGTGTACCCCCCACTTTCATCTAATATTGCCCATAGAGGTAGTTCTGTTGATTTAGCTATTTTTTCCTTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTTATTACTACAATTATTAATATACGATTAAATAGTTTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCTTTTTTATTATTACTTTCATTACCAGTTTTAGCAGGAGCTATTACTATATTATTAACTGACCGA------------------------------------	SAFRA472-18
573	400	South Africa	\N	AACTTTATATTTTATTTTTGGCGCTTGAGCAGGAATAGTTGGAACTTCATTAAGAATTTTAATTCGAGCTGAATTAGGTCATCCAGGTGCTTTAATTGGAAATGATCAAATTTATAATGTTATTGTTACTTCTCATGCATTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGTAATTGATTAATCCCCCTTATATTAGGAGCACCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTCTGATTACTTCCTCCATCTATTTCTTTATTATTAATGAGAAGCTTAGTAGAAAATGGATCTGGAACAGGATGAACTGTATATCCACCTTTATCTTCAACTATTGCACATAGAGGATCTTCTGTTGATTTAGCTATTTTTTCATTACATTTAGCAGGAATTTCATCAATTTTAGGTGCAATCAATTTTATTACTACTATTATTAATATACGATCAACTGGAATTAACTTTGATCGAATACCATTATTTGTCTGAGCAGTTATCCTAACTGCAATTTTATTATTACTATCATTACCAGTTTTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACTTCATTTTTCGATCCAGCAGGTGGAGGAGATCCAATTTTATATCAACATTTATTT	ETKD375-12
574	403	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGTGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGTGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACCGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATCGGAGGTTTTGGTAATTGATTAGTTCCTCTTATATTAGGTGCCCCTGATATAGCTTTTCCACGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTTTAACACTCCTATTAGTAAGTAGTATAGTCGAAAACGGAGCTGGAACAGGTTGAACAGTTTATCCACCATTATCTTCTGTAATTGCCCACGGAGGGGCTTCTGTTGATCTTGCAATTTTCTCTCTTCATCTAGCTGGAATTTCTTCAATTTTAGGAGCAGTAAATTTTATCACGACAGTAATTAATATACGATCTACAGGAATTTCATTTGATCGAATACCTTTATTTGTATGAGCAGTTGTTCTTACTGCCTTATTATTATTATTATCTCTTCCTGTACTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCCTTTTTTGATCCAGCTGGAGGAGGTGATCCAATTTTATACCAACATTTATTTTGATTCTTTGGTCACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCCCATATTATTAGTCAAGAATCTGGAAAAAAAGAAACCTTTGGATCCTTAGGAATAATTTATGCTATAATAGCAATTGGTTTATTAGGATTTATTGTATGAGCTCATCACATATTTACAGTAGGAATAGATGTTGATACACGAGCTTATTTTACCTCAGCAACTATAATTAT	JTB215-12
575	403	Rwanda	\N	GAACTTATATTTTATTTTTGGTGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGTGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACCGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGTTTTGGTAATTGATTAGTTCCTCTTATATTAGGTGCCCCTGATATAGCTTTTCCACGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTTTAACACTCCTATTAGTAAGTAGTATAGTGGAAAACGGGGCTGGAACAGGTTGAACAGTTTATCCACCATTATCTTCTGTAATTGCCCACGGAGGGGCTTCTGTTGATCTTGCAATTTTCTCTCTTCATCTAGCTGGAATTTCTTCAATTTTAGGAGCAGTAAATTTTATCACTACAGTAATTAATATACGATCTACAGGAATTTCATTTGATCGAATACCTTTATTTGTATGAGCAGTTGTTCTTACTGCCTTATTATTATTATTATCTCTTCCTGTACTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCCTTTTTTGATCCAGCTGGAGGAGGTGATCCAATTTTATACCAACATTTATTTTGATTCTTTGGTCACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCCCATATTATTAGTCAAGAATCTGGAAAAAAAGAAACCTTTGGATCCTTAGGAATAATTTATGCTATAATAGCAATTGGTTTATTAGGATTT--------------------------------------------------------------------------------	JTB229-12
576	403	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTTGGTGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGTGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACCGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATCGGAGGTTTTGGTAATTGATTAGTTCCTCTTATATTAGGTGCCCCTGATATAGCTTTTCCACGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTTTAACACTCCTATTAGTAAGTAGTATAGTCGAAAACGGAGCTGGAACAGGTTGAACAGTTTATCCACCATTATCTTCTGTAATTGCCCACGGAGGGGCTTCTGTTGATCTTGCAATTTTCTCTCTTCATCTAGCTGGAATTTCTTCAATTTTAGGAGCAGTAAATTTTATCACGACAGTAATTAATATACGATCTACAGGAATTTCATTTGATCGAATACCTTTATTTGTATGAGCAGTTGTTCTTACTGCCTTATTATTATTATTATCTCTTCCTGTACTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCCTTTTTTGATCCAGCTGGAGGAGGTGATCCAATTTTATACCAACATTTATTTTGATTCTTTGGTCACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCCCATATTATTAGTCAAGAATCTGGAAAAAAAGAAACCTTTGGATCCTTAGGAATAATTTATGCTATAATAGCAATTGGTTTATTAGGATTTATTGTATGAGCTCATCACATATTTACAGTAGGAATAGATGTTGATACACGAGCTTATTTTACCTCAGCAACTATAATTAT	JTB215-12
577	403	Rwanda	\N	GAACTTATATTTTATTTTTGGTGCTTGAGCTGGAATAGTAGGAACATCTCTTAGAATTTTAATTCGAGCTGAATTAGGACATCCAGGTGCATTAATTGGAGATGATCAAATTTATAATGTAATTGTAACCGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGTTTTGGTAATTGATTAGTTCCTCTTATATTAGGTGCCCCTGATATAGCTTTTCCACGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTTTAACACTCCTATTAGTAAGTAGTATAGTGGAAAACGGGGCTGGAACAGGTTGAACAGTTTATCCACCATTATCTTCTGTAATTGCCCACGGAGGGGCTTCTGTTGATCTTGCAATTTTCTCTCTTCATCTAGCTGGAATTTCTTCAATTTTAGGAGCAGTAAATTTTATCACTACAGTAATTAATATACGATCTACAGGAATTTCATTTGATCGAATACCTTTATTTGTATGAGCAGTTGTTCTTACTGCCTTATTATTATTATTATCTCTTCCTGTACTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCCTTTTTTGATCCAGCTGGAGGAGGTGATCCAATTTTATACCAACATTTATTTTGATTCTTTGGTCACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCCCATATTATTAGTCAAGAATCTGGAAAAAAAGAAACCTTTGGATCCTTAGGAATAATTTATGCTATAATAGCAATTGGTTTATTAGGATTT--------------------------------------------------------------------------------	JTB229-12
578	114	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACTTCCCTTAGTTTAATTATTCGAGCTGAATTAGGAAACCCTGGTTCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCTCATGCATTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTCTAATACTTGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTACTACCCCCTTCTTTAACTCTTCTTATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCTTCTAATATTGCTCATGGAGGGAGCTCAGTTGATTTAGCTATTTTTTCCCTTCATTTAGCCGGAATTTCTTCTATTTTAGGGGCTATTAATTTTATTACTACTATTATTAATATACGTGTAAATGGTTTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGTATTACTGCTTTATTATTATTACTATCTCTTCCAGTTTTAGCAGGGGCTATTACTATATTACTTACTGATCGTAACTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGAGACCCAATTTTATATCAACATTTATTT	PMANK417-08
579	114	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACTTCCCTTAGTTTAATTATTCGAGCTGAATTAGGAAACCCTGGTTCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCTCATGCATTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTCTAATACTTGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTACTACCCCCTTCTTTAACTCTTCTTATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCTTCTAATATTGCTCATGGAGGGAGCTCAGTTGATTTAGCTATTTTTTCCCTTCATTTAGCCGGAATTTCTTCTATTTTAGGGGCTATTAATTTTATTACTACTATTATTAATATACGTGTAAATGGTTTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGTATTACTGCTTTATTATTACTACTATCTCTTCCAGTTTTAGCAGGGGCTATTACTATATTACTTACTGATCGTAACTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGAGACCCAATTTTATATCAAC--------	PMANK418-08
580	114	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACTTCCCTTAGTTTAATTATTCGAGCTGAATTAGGAAACCCTGGTTCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCTCATGCATTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTCTAATACTTGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTATTACCCCCTTCTTTAACTCTTCTTATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCTTCTAATATTGCTCATGGAGGGAGCTCAGTTGATTTAGCTATTTTTTCCCTTCATTTAGCCGGAATTTCTTCTATTTTAGGGGCTATTAATTTTATTACTACTATTATTAATATACGTGTAAATGGTTTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGTATTACTGCTTTATTATTATTATTATCTCTTCCAGTTTTAGCAGGGGCTATTACTATATTACTTACTGATCGTAACTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGAGACCCAATTTTATATC-----------	PMANK420-08
581	114	Kenya	\N	AACTTTATATTTTATTTTTGGAATTTGAGCAGGAATAGTAGGAACTTCCCTTAGTTTAATTATTCGAGCTGAATTAGGAAACCCTGGTTCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACAGCTCATGCATTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTCTAATACTTGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAATATAAGTTTTTGACTACTACCCCCTTCTTTAACTCTTCTTATTTCAAGAAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCTTCTAATATTGCTCATGGAGGAAGCTCAGTTGATTTAGCTATTTTTTCCCTTCATTTAGCCGGAATTTCTTCTATTTTAGGGGCTATTAATTTTATTACTACTATTATTAATATACGTGTAAATGGTTTATCTTTTGATCAAATACCTTTATTTGTATGAGCAGTAGGTATTACTGCTTTATTATTATTATTATCTCTTCCAGTTTTAGCAGGGGCTATTACTATATTACTTACTGATCGTAACTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGAGACCCAATTTTATATC-----------	PMANK421-08
582	426	Saudi Arabia	\N	AATTTTGTATTTTTTGTTTGGTATTTGATCGGGAATAATGGGATTATCAATAAGAGTTATTATTCGGTTAGAGTTAGGGATACCAGGTAGTTTATTAATAAATGATCAGATTTATAATAGGGTAGTTACGGCTCATGCTTTTGTTATAATTTTTTTTATAGTTATACCAATTATAATTGGGGGATTTGGGAATTATTTAGTTCCTTTAATAATAGGGGCACCTGATATAGCATTCCCCCGAATAAATAATATAAGATTTTGATTATTAATTCCTTCTTTATTATTATTAATTTTAAGAGGAATTTTAAATGTTGGGGTAGGGACAGGATGAACTGTTTATCCTCCTTTATCTTCAATTATAGGTCATAGAGGATCTTCAGTTGATTTAGCAATTTTTTCTTTGCATTTAGCTGGTATTTCTTCTATTATAGGGGCAATTAATTTTATTAGTACAATTTTAAATATAAATATTTATATACTTAAAATTGATCAATTAAGCTTATTAATTTGATCAATTTTGATTACTGTAATTTTATTATTGTTATCTTTACCTGTATTAGCAGGGGCTATTACAATATTATTAACTGATCGGAATTTAAATACTAC----------------------------------	GMSUH507-15
583	428	South Africa	MH841901	AAACATAAAGATATTGGAATTTTATATTTTTTATTTGGGATTTGATCCGGAATATTAGGATTATCAATAAGGGTAATTATTCGATTAGAATTAGGTACACCAGGTAGTTTATTAATAAATGATCAGATTTATAATAGTGTTGTTACTGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGAAATTATTTAATTCCTCTAATATTAGGGGCTCCTGATATAGCATTTCCTCGAATAAATAATATAAGATTTTGATTATTAGTTCCTTCTTTATTATTATTAATTTTAAGAAGAATTTTAAATATTGGGGTAGGTACTGGGTGAACAGTTTATCCTCCTTTGTCTTCAATTATTGGTCATAGAGGTTCTTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGTATTTCTTCAATCATAGGGGGTATTAACTTTATTAGAACTATTTTTAATATAAATATTTATATACTTAAAATTGATCAATTAAGTTTATTAGTTTGATCTATTTTAATTACAGTAATTTTATTATTATTATCATTACCAGTTTTAGCTGGTGCTATTACTATATTATTAACTGATCGTAATTTAAATACTACTTTTTTTGATTTTTCTGGGGGAGGGGATCCTATTTTGTATCAACATTTATTTTGATTTTTTGGT	PSYT003-18
584	428	South Africa	MH841900	ACATAAAGATATTGGAATTTTATATTTTTTATTTGGGATTTGATCCGGAATATTAGGATTATCAATAAGGGTAATTATTCGATTAGAATTAGGTACACCAGGTAGTTTATTAATAAATGATCAGATTTATAATAGTGTTGTTACTGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGAAATTATTTAATTCCTCTAATATTAGGGGCTCCTGATATAGCATTTCCTCGAATAAATAATATAAGATTTTGATTATTAGTTCCTTCTTTATTATTATTAATTTTAAGAAGAATTTTAAATATTGGGGTAGGTACTGGGTGAACAGTTTATCCTCCTTTGTCTTCAATTATTGGTCATAGAGGTTCTTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGTATTTCTTCAATCATAGGGGCTATTAACTTTATTAGAACTATTTTTAATATAAATATTTATATACTTAAAATTGATCAATTAAGTTTATTAGTTTGATCTATTTTAATTACAGTAATTTTATTATTATTATCATTACCAGTTTTAGCTGGTGCTATTACTATATTATTAACTGATCGTAATTTAAATACTACTTTTTTTGATTTTTCTGGGGGAGGGGATCCTATTTTGTATCAACATTTATTTTGATTTTTTGGTCACCT	PSYT004-18
585	428	South Africa	MH841898	CATAAAGATATTGGAATTTTATATTTTTTATTTGGGATTTGATCCGGAATATTAGGATTATCAATAAGGGTAATTATTCGATTAGAATTAGGTACACCAGGTAGTTTATTAATAAATGATCAGATTTATAATAGTGTTGTTACTGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGAAATTATTTAATTCCTCTAATATTAGGGGCTCCTGATATAGCATTTCCTCGAATAAATAATATAAGATTTTGATTATTAGTTCCTTCTTTATTATTATTAATTTTAAGAAGAATTTTAAATATTGGAGTAGGTACTGGGTGAACAGTTTATCCTCCTTTGTCTTCAATTATTGGTCATAGAGGTTCTTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGTATTTCTTCAATCATAGGGGCTATTAACTTTATTAGAACTATTTTTAATATAAATATTTATATACTTAAAATTGATCAATTAAGTTTATTAGTTTGATCTATTTTAATTACAGTAATTTTATTATTATTATCATTACCAGTTTTAGCTGGTGCTATTACTATATTATTAACTGATCGTAATTTAAATACTACTTTTTTTGATTTTTCTGGGGGAGGGGATCCTATTTTGTATCAACATTTATTTTGATTTTTTGG	PSYT005-18
586	428	South Africa	MH841899	ACATAAAGATATTGGAATTTTATATTTTTTATTTGGGATTTGATCCGGAATATTAGGATTATCAATAAGGGTAATTATTCGATTAGAATTAGGTACACCAGGTAGTTTATTAATAAATGATCAGATTTATAATAGTGTTGTTACTGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGTGGATTTGGAAATTATTTAATTCCTCTAATATTAGGGGCTCCTGATATAGCATTTCCTCGAATAAATAATATAAGATTTTGATTATTAGTTCCTTCTTTATTATTATTAATTTTAAGAAGAATTTTAAATATTGGGGTAGGCACTGGGTGAACAGTTTATCCTCCTTTGTCTTCAATTATTGGTCATAGAGGTTCTTCAGTTGATTTAGCAATTTTTTCTTTACATTTAGCTGGTATTTCTTCAATCATAGGGGCTATTAACTTTATTAGAACTATTTTTAATATAAATATTTATATACTTAAAATTGATCAATTAAGTTTATTAGTTTGATCTATTTTAATTACAGTAATTTTATTATTATTATCATTACCAGTTTTAGCTGGTGCTATTACTATATTATTAACTGATCGTAATTTAAATACTACTTTTTTTGATTTTTCTGGGGGAGGGGATCCTATTTTGTATCAACATTTATTTTGATTTTTTGGTCACC	PSYT009-18
587	437	Australia	\N	\N	ANICN869-10
588	437	Australia	HQ953059	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAACGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCATGGGGGAAGTTCCGTAGACCTAGCTATTTTCTCCTTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGGTTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGC-------------------------------------	ANICN870-10
589	437	Australia	HQ953060	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAACGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCATGGGGGAAGTTCCGTAGACCTAGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGGTTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTC-----------------	ANICN871-10
590	437	Australia	HQ953061	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAACGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCATGGGGGAAGTTCCGTAGACCTAGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGGTTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTT-------------------------------------------------	ANICN872-10
591	437	Australia	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTTATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTACTAATTTCAAGAAGAATTGTTGAAAACGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCATGGAGGAAGTTCCGTAGACCTAGCTATTTTCTCCCTACATTTAGCAGGAATTTCGTCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCCTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	IMLR143-08
592	437	Australia	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTTATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTACTAATTTCAAGAAGAATTGTTGAAAACGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCATGGAGGAAGTTCCGTAGACCTAGCTATTTTCTCCCTACATTTAGCAGGAATTTCGTCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCCTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTANCAACATTTATTT	IMLR292-08
593	437	Australia	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAACGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCATGGGGGAAGTTCCGTAGACCTAGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGGTTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	IMLR417-08
594	437	Australia	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAACGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCATGGGGGAAGTTCCGTAGACCTAGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGGTTATCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	IMLR562-08
595	437	Greece	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGGGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGGGGAGATCCAATTCTTTATCAACATTTATTT	LEASW1360-20
596	437	Greece	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTAGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGGGGAGATCCAATTCTTTATCAACATTTATTT	LEASW1492-20
597	437	Pakistan	HQ991358	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	MAMOT673-10
598	437	Pakistan	JF857988	----------------------ATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTGGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGGGGAGATCCAATTCTTTATCAACATTTATTT	MAMOT796-10
599	437	Costa Rica	JQ539978	NNGACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	MHAMB607-06
600	437	Costa Rica	JQ539979	NNGACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	MHAMB608-06
601	437	Costa Rica	JQ539980	NNGACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	MHAMB609-06
602	437	Costa Rica	JQ539981	NNGACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAGTGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	MHAMB610-06
603	437	Costa Rica	JQ539982	NNGACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAGTGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	MHAMB611-06
604	437	Costa Rica	JQ605652	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT-	MHMXN754-07
605	437	Costa Rica	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	MHMYN3921-14
606	437	Costa Rica	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTGGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCAGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGAGGAGATCCAATTCTTTATCAACATTTATTT	MHMYN3922-14
607	437	Seychelles	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTAGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACTTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGGGGAGATCCAATTCTTTATCAACATTTATTT	PMANL3441-14
608	437	Seychelles	\N	GACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTT---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	PMANL3442-14
609	437	Seychelles	\N	AACATTATATTTTATTTTTGGTATTTGAGCAGGAATAGTAGGAACATCTTTAAGTTTATTAATTCGAACTGAATTAGGAAATCCAGGTTCTTTCATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGTAATTGATTAATTCCTTTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAATATAAGATTTTGATTACTCCCCCCTTCTTTAACATTATTAATTTCAAGAAGAATTGTTGAAAATGGAGCTGGAACAGGATGAACTGTTTATCCTCCTTTATCTTCAAATATTGCTCACGGAGGAAGTTCCGTAGACCTAGCTATTTTCTCCCTACATTTAGCAGGAATTTCATCAATTTTAGGTGCTATTAATTTTATTACAACTATTATTAATATACGTATTAATGGATTGTCATTTGATCAAATACCTTTATTTATTTGAGCAGTAGGAATTACAGCATTATTATTACTTTTATCTTTACCTGTTTTAGCTGGAGCTATTACTATATTATTAACAGATCGTAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGGGGAGATCCAATTCTTTATCAACATTTATTT	PMANL3978-15
610	479	Kenya	KJ592234	AACATTATATTTTATTTTTGGTATTTGAGCCGGAATAGTTGGAACTTCTTTAAGATTATTAATTCGAGCAGAATTAGGTAATCCAGGATCTCTAATTGGAGATGATCAAATTTATAACACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCCTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATAGAGGAAGATCTGTTGATCTTGCTATTTTTTCTTTACATTTAGCTGGAATTTCATCGATTTTAGGTGCTGTTAATTTTATTACAACTATTATTAATATACGACCTAATAATATATCATTAGACCAAATACCACTATTTGTTTGAGCTGTCGGAATTACAGCTTTACTTCTTCTTCTATCATTACCAGTATTAGCGGGTGCTATTACTATATTATTAACTGACCGAAATCTTAATACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTCTATATCAACATCTTTTT	AFTOR052-12
611	479	Kenya	KJ592405	AACATTATATTTTATTTTTGGTATTTGAGCCGGAATAGTTGGAACTTCTTTAAGATTATTAATTCGAGCAGAATTAGGTAATCCAGGATCTCTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCCTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATAGAGGAAGATCTGTTGATCTTGCTATTTTTTCTTTACATTTAGCTGGAATTTCATCGATTTTAGGTGCTGTTAATTTTATTACAACTATTATTAATATACGACCTAATAATATATCATTAGACCAAATACCACTATTTGTTTGAGCTGTCGGAATTACAGCCTTACTTCTTCTTCTATCATTACCAGTATTAGCGGGTGCTATTACTATATTATTAACTGACCGAAATCTTAATACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTCTATATCAACATCTTTTT	AFTOR053-12
612	479	Kenya	KJ592408	AACATTATATTTTATTTTTGGTATTTGAGCCGGAATAGTTGGAACTTCTTTAAGATTATTAATTCGAGCAGAATTAGGTAATCCAGGATCTCTAATTGGAGATGATCAAATTTATAACACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCCTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATAGAGGAAGATCTGTTGATCTTGCTATTTTTTCTTTACATTTAGCTGGAATTTCATCGATTTTAGGTGCTGTTAATTTTATTACAACTATTATTAATATACGACCTAACAATATATCATTAGACCAAATACCACTATTTGTTTGAGCTGTCGGAATTACAGCCTTACTTCTTCTTCTATCATTACCAGTATTAGCGGGTGCTATTACTATATTATTAACTGACCGAAATCTTAATACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTCTATATCAACATCTTTTT	AFTOR054-12
613	479	Kenya	KJ592240	AACATTATATTTTATTTTTGGTATTTGAGCCGGAATAGTTGGAACTTCTTTAAGATTATTAATTCGAGCAGAATTAGGTAATCCAGGATCTCTAATTGGAGATGATCAAATTTATAACACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCCTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATAGAGGAAGATCTGTTGATCTTGCTATTTTTTCTTTACATTTAGCTGGAATTTCATCGATTTTAGGTGCTGTTAATTTTATTACAACTATTATTAATATACGACCTAACAATATATCATTAGACCAAATACCACTATTTGTTTGAGCTGTCGGAATTACAGCCTTACTTCTTCTTCTATCATTACCAGTATTAGCGGGTGCTATTACTATATTATTAACTGACCGAAATCTTAATACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTTTATATCAACATCTTTTT	AFTOR055-12
614	479	Kenya	KJ592376	AACATTATATTTTATTTTTGGTATTTGAGCCGGAATAGTTGGAACTTCTTTAAGATTATTAATTCGAGCAGAATTAGGTAATCCAGGATCTCTAATTGGAGATGATCAAATTTATAACACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCTTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATAGAGGAAGATCTGTTGATCTTGCTATTTTTTCTTTACATTTAGCTGGAATTTCATCGATTTTAGGTGCTGTTAATTTTATTACAACTATTATTAATATACGACCTAACAATATATCATTAGACCAAATACCACTATTTGTTTGAGCTGTCGGAATTACAGCCTTACTTCTTCTTCTATCATTACCAGTATTAGCGGGTGCTATTACTATATTATTAACTGACCGAAATCTTAATACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTCTATATCAACATCTTTTT	AFTOR056-12
615	479	South Africa	\N	AACATTATATTTTATTTTTGGTATTTGAGCCGGAATAGTTGGAACTTCTTTAAGATTATTAATTCGAGCAGAATTAGGTAATCCAGGATCTCTAATTGGAGATGATCAAATTTATAACACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCCTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATAGAGGAAGATCTGTTGATCTTGCTATTTTTTCTTTACATTTAGCTGGAATTTCATCGATTTTAGGTGCTGTTAATTTTATTACAACTATTATTAATATACGACCTAACAATATATCATTAGACCAAATACCACTATTTGTTTGAGCTGTCGGAATTACAGCCTTACTTCTTCTTCTATCATTACCAGTATTAGCGGGTGCTATTACTATATTATTAACTGACCGAAATCTTAATACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTCTATATCAACATCTTTTT	ETKL490-13
616	479	South Africa	\N	AACATTATATTTTATTTTTGGTATTTGAGCCGGAATAGTTGGAACTTCTTTAAGATTATTAATTCGAGCAGAATTAGGTAATCCAGGATCTCTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTACCTTTAATATTAGGAGCTCCTGATATAGCTTTCCCACGTATAAATAATATAAGATTTTGATTATTACCCCCCTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTTTACCCCCCACTTTCATCTAATATTGCTCATAGAGGAAGATCTGTTGATCTTGCTATTTTTTCTTTACATTTAGCTGGAATTTCATCGATTTTAGGTGCTGTTAATTTTATTACAACTATTATTAATATACGACCTAATAATATATCATTAGACCAAATACCACTATTTGTTTGAGCTGTCGGAATTACAGCCTTACTTCTTCTTCTATCATTACCAGTATTAGCGGGTGCTATTACTATATTATTAACTGACCGAAATCTTAATACATCATTTTTTGACCCAGCAGGAGGAGGAGACCCAATTCTATATCAACATCTTTTT	GWOTH848-12
617	486	Madagascar	MH415643	AACATTATATTTTATTTTTGGTATTTGAGCTGGAATAGTTGGAACTTCTTTAAGATTACTTATTCGAGCAGAATTAGGAAATCCTGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACTGCACATGCCTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTGCCTTTAATACTTGGAGCCCCAGATATAGCTTTTCCACGTATAAATAATATAAGATTTTGATTATTACCCCCTTCCATTATACTTTTAATTTCAAGCAGAATTGTAGAAAATGGAGCAGGAACAGGGTGAACAGTGTACCCCCCACTTTCATCAAATATTGCTCATAGAGGAAGATCTGTAGATCTTGCTATTTTTTCATTACATTTAGCAGGAATTTCTTCAATTTTAGGTGCTGTTAATTTTATTACCACTATTATTAATATACGACCTAATAATATATCATTAGATCAAATACCTTTATTTGTTTGAGCTGTAGGAATTACAGCTTTATTATTATTATTATCATTACCTGTATTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATCTTAATACATCATTTTTTGATCCCGCTGGTGGAGGAGATCCAATTTTATATCAACATTTATTT	MIMAD003-15
618	486	Madagascar	MH417412	AACATTATATTTTATTTTTGGTATTTGAGCTGGAATAGTTGGAACTTCTTTAAGATTACTTATTCGAGCAGAATTAGGAAATCCTGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACTGCACATGCCTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTGCCTTTAATACTTGGAGCCCCAGATATAGCTTTTCCACGTATAAATAATATAAGATTTTGATTATTACCCCCTTCCATTATACTTTTAATTTCAAGCAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCAAATATTGCTCATAGAGGAAGATCTGTAGATCTTGCTATTTTTTCATTACATTTAGCAGGAATTTCTTCAATTTTAGGTGCTGTTAATTTTATTACCACTATTATTAATATACGACCTAATAATATATCATTAGATCAAATACCTTTATTTGTTTGAGCTGTAGGAATTACAGCTTTATTATTATTATTATCATTACCTGTATTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATCTTAATACATCATTTTTTGATCCCGCTGGTGGAGGAGATCCAATTTTATATCAACATTTATTT	MIMAD610-15
619	486	Madagascar	MH415531	AACATTATATTTTATTTTTGGTATTTGAGCTGGAATAGTTGGAACTTCTTTAAGATTACTTATTCGAGCAGAATTAGGAAATCCTGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACTGCACATGCATTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTGCCTTTAATACTTGGAGCCCCAGATATAGCTTTTCCACGTATAAATAATATAAGATTTTGATTATTACCCCCTTCCATTATACTTTTAATTTCAAGCAGAATTGTAGAAAATGGAGCAGGAACAGGGTGAACAGTGTACCCCCCACTTTCATCAAATATTGCTCATAGAGGAAGATCTGTAGATCTTGCTATTTTTTCATTACATTTAGCAGGAATTTCTTCAATTTTAGGTGCTGTTAATTTTATTACCACTATTATTAATATACGACCTAATAATATATCATTAGATCAAATACCTTTATTTGTTTGAGCTGTAGGAATTACAGCTTTATTATTATTATTATCATTACCTGTATTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATCTTAATACATCATTTTTTGATCCCGCTGGTGGAGGAGATCCAATTTTATATCAACATTTATTT	MIMAD611-15
620	486	Madagascar	MH417436	AACATTATATTTTATTTTTGGTATTTGAGCTGGAATAGTTGGAACTTCTTTAAGATTACTTATTCGAGCAGAATTAGGAAATCCTGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACTGCACATGCCTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGATTAGTGCCTTTAATACTTGGAGCTCCAGATATAGCTTTTCCACGTATAAATAATATAAGATTTTGATTATTACCCCCTTCCATTATACTTTTAATTTCAAGCAGAATTGTAGAAAATGGAGCAGGAACAGGGTGAACAGTGTACCCCCCACTTTCATCAAATATTGCTCATAGAGGAAGATCTGTAGATCTTGCTATTTTTTCATTACATTTAGCAGGAATTTCTTCAATTTTAGGTGCTGTTAATTTTATTACCACTATTATTAATATACGACCTAATAATATATCATTAGATCAAATACCTTTATTTGTTTGAGCTGTAGGAATTACAGCTTTATTATTATTATTATCATTACCTGTATTAGCAGGAGCTATTACAATATTATTAACAGATCGAAATCTTAATACATCATTTTTTGATCCCGCTGGTGGAGGAGATCCAATTTTATATCAACATTTATTT	MIMAD624-15
621	524	Kenya	KJ592337	AACATTATATTTTATTTTTGGAATCTGAGCTGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCAGAATTAGGAAATCCAGGATCTTTAATTGGAGATGATCAAATTTATAATACCATTGTTACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGGGGATTTGGTAATTGATTAGTACCATTAATACTAGGAGCCCCAGATATAGCTTTCCCACGAATAAATAATATAAGATTTTGACTTTTACCCCCTTCAATTATACTTTTAATTTCAAGTAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTATACCCACCACTTTCATCAAATATTGCTCATAGAGGTAGATCAGTAGATCTTGCCATTTTTTCATTACATTTAGCAGGAATTTCTTCAATTTTAGGAGCAGTTAATTTTATTACAACCATTATTAACATACGACCAAATAATATATCTTTAGATCAAATACCATTATTTGTATGGGCAGTTGGTATTACTGCTCTTTTATTATTATTATCTTTACCAGTTTTAGCTGGTGCTATTACAATACTTTTAACAGATCGAAATCTTAATACATCTTTTTTTGACCCTGCTGGAGGAGGAGATCCAATTTTATATCAACATTTATTT	AFTOR150-12
622	524	Kenya	KJ592360	AACATTATATTTTATTTTTGGAATCTGAGCTGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCAGAATTAGGAAATCCAGGATCTTTAATTGGAGATGATCAAATTTATAATACCATTGTTACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGGGGATTTGGTAATTGATTAGTACCATTAATACTAGGAGCCCCAGATATAGCTTTCCCACGAATAAATAATATAAGATTTTGACTTTTACCCCCTTCAATTATACTTTTAATTTCAAGTAGAATTGTTGAAAATGGAGCAGGAACAGGATGAACAGTATACCCACCACTTTCATCAAATATTGCTCATAGAGGTAGATCAGTAGATCTTGCCATTTTTTCATTACATTTAGCAGGAATTTCTTCAATTTTAGGAGCAGTTAATTTTATTACAACCATTATTAACATACGACCAAATAATATATCTTTAGATCAAATACCATTATTTGTATGGGCAGTTGGTATTACTGCTCTTTTATTATTATTATCTTTACCAGTTTTAGCTGGTGCTATTACAATACTTTTAACAGATCGAAATCTTAATACATCTTTTTTTGACCCTGCTGGAGGAGGAGATCCAATTTTATATCAACATTTATTT	AFTOR151-12
623	524	Kenya	KJ592419	AACATTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCAGAATTAGGAAATCCAGGATCTTTAATTGGAGATGATCAAATTTATAATACTATTGTTACTGCTCATGCTTTTATCATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCATTAATACTAGGAGCTCCAGATATAGCTTTCCCACGGATAAATAATATAAGATTTTGACTTTTACCTCCTTCAATTATACTTTTAATTTCAAGTAGAATTGTTGAAAATGGGGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCTCATAGAGGTAGATCAGTAGATCTTGCCATTTTTTCATTACATTTAGCAGGAATTTCTTCAATTTTAGGAGCAGTTAATTTTATCACAACTATTATTAACATACGACCAAACAATATATCTTTAGACCAATTACCACTATTTGTATGGGCAGTTGGTATTACCGCTCTTTTATTATTATTATCTTTACCAGTTTTAGCTGGTGCTATTACAATACTTTTAACAGATCGAAATCTTAATACATCTTTTTTTGACCCTGCTGGAGGAGGAGATCCAATTCTATATCAACATTTATTT	AFTOR152-12
624	524	Kenya	KJ592278	AACATTATATTTTATTTTTGGAATTTGAGCTGGAATAGTAGGAACATCTTTAAGATTATTAATTCGAGCAGAATTAGGAAATCCAGGATCTTTAATTGGAGATGATCAAATTTATAATACTATTGTTACTGCTCATGCTTTTATCATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCATTAATACTAGGAGCTCCAGATATAGCTTTCCCACGGATAAATAATATAAGATTTTGACTTTTACCTCCTTCAATTATACTTTTAATTTCAAGTAGAATTGTTGAAAATGGGGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAATATTGCTCATAGAGGTAGATCAGTAGATCTTGCCATTTTTTCATTACATTTAGCAGGAATTTCTTCAATTTTAGGAGCAGTTAATTTTATCACAACTATTATTAACATACGACCAAACAATATATCTTTAGACCAATTACCACTATTTGTATGGGCAGTTGGTATTACCGCTCTTTTATTATTATTATCTTTACCAGTTTTAGCTGGTGCTATTACAATACTTTTAACAGATCGAAATCTTAATACATCTTTTTTTGACCCTGCTGGAGGAGGAGATCCAATTCTATATCAACATTTATTT	AFTOR153-12
625	524	South Africa	\N	AACATTATATTTTATTTTTGGAATCTGAGCTGGAATAATAGGAACATCTTTAAGATTATTAATTCGAGCAGAATTAGGAAATCCAGGATCTTTAATTGGAGATGATCAAATTTATAATACTATTGTTACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGTAATTGATTAGTACCATTAATACTAGGAGCCCCAGATATAGCTTTCCCACGAATAAATAATATAAGATTTTGACTTTTACCTCCTTCAATTATACTTTTAATTTCAAGTAGAATTGTTGAAAATGGTGCAGGAACAGGATGAACAGTATACCCACCACTTTCATCAAATATTGCTCATAGAGGTAGATCAGTAGATCTTGCCATTTTTTCATTACATTTAGCAGGAATTTCTTCAATTTTAGGAGCAGTTAATTTTATTACAACCATTATTAATATACGACCAAATAATATATCCTTAGATCAAATACCATTATTTGTATGGGCAGTTGGTATTACTGCTCTTTTATTATTATTATCCTTACCAGTTTTAGCTGGTGCTATTACAATACTTTTAACAGATCGAAATCTTAATACATCTTTTTTTGACCCTGCTGGAGGAGGAGATCCAATTTTATATCAACATTTATTT	LSAFR256-12
626	531	Australia	KF406110	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTAT-----------------------------------------------------------------------------	ANICW854-11
627	531	Australia	KF397678	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGACCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTGGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	ANICW862-11
628	531	Australia	KF403816	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGGGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCTTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	ANICW863-11
629	531	Australia	KF402024	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGGGGAGATCCTATTCTATATCAACATTTATTT	ANICW864-11
630	531	Australia	KF400426	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	ANICW865-11
631	531	Australia	KF401637	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAACAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	ANICW866-11
632	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	IMLQ779-08
633	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	LLISA500-06
634	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	LLISA832-06
635	531	Australia	\N	AACACTTTATTTTATTTTTGGAATTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTTCCCCTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCTCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATATCATTAGATCAAATACCATTATTTGTCTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCCTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTTTATACCAACATTTATTT	LNSWE443-06
636	531	Australia	\N	NNNNTTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	LNSWF869-06
637	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTTNNNNNNNNNNNNNNNNN	LOQTB909-07
638	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB1122-08
639	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB173-08
640	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB199-08
641	531	Australia	\N	NNNNNNNNNNTTTATTTTTNGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACNTTTATTT	NSWBB212-08
642	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB215-08
643	531	Australia	\N	AACACTTTATTTTATTTTTGGAATTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTTCCCCTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCTCCCTCTATTATACTTCTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATATCATTAGATCAAATACCATTATTTGTCTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTTTATACCAACATTTATTT	NSWBB216-08
644	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB223-08
645	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB224-08
646	531	Australia	\N	NNNACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB225-08
647	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB290-08
648	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB294-08
649	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB339-08
650	531	Australia	\N	AACACTTTATTTTATTTTTGGAATTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTTGGAAATTGACTAGTTCCCCTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCTCCCTCTATTATACTTCTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCTCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATATCATTAGATCAAATACCATTATTTGTCTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTTTATACCAACATTTATTT	NSWBB393-08
651	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTATAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB394-08
652	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB415-08
653	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB440-08
654	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB441-08
655	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB448-08
656	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB451-08
657	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGG----------------------------	NSWBB524-08
658	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB526-08
659	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGC-------------------------------------	NSWBB527-08
660	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAACCGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGC-------------------------------------	NSWBB528-08
661	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGG----------------------------------	NSWBB529-08
662	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWBB545-08
663	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWHI085-09
664	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWHI098-09
665	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWHI107-09
666	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWHN907-11
667	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAG-----------	NSWLP695-13
668	531	Australia	\N	-ACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGACCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTGGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGA-----------------------------	WALPA1929-12
669	531	Australia	\N	-ACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGANCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTGGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGA--------------------------	WALPA3013-12
670	531	Australia	\N	-ACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTT--------------------------------------------	WALPA3373-13
671	531	Australia	\N	-ACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGACCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTGGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTT--------------------------------------------	WALPA3391-13
672	531	Australia	\N	-ACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCT--------------------	WALPA3970-13
673	531	Australia	\N	-ACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGACCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTGGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTT--------------------------------------------	WALPA524-12
674	531	Australia	\N	-------------------------------------ATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGGGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCTTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGA-----------------------------------------------------------------	WALPB1824-14
675	531	Australia	\N	ATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGACCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTGGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGAT------------------------------------------------------	WALPB3455-14
676	531	Australia	\N	----------TTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTA---AGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGAT---GACCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATA---TTGGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTA---GCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACA---------------------------------------------------	WALPB4039-14
677	531	Australia	\N	ATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGT------------------------------------------------------------------------------------	WALPB4855-14
678	531	Australia	\N	----------TTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGGGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCCCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCTTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGA-----------------------------------------------------------------	WALPB512-13
679	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGACCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTGGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGAT--------------------------------------------------	WALPC3522-15
680	531	Australia	\N	TTTATTTTTGGAGTNTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGACCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTGGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGA---------------------------------------------------------	WALPC4735-15
681	531	Australia	\N	AACACTTTATTTTATTTTTGGAGTTTGAGCTGGAATAATTGGAACTTCTTTAAGTTTATTAATTCGAGCAGAATTAGGAAATCCTGGATCTTTAATTGGAGATGATCAAATTTACAATACTATTGTAACTGCTCATGCTTTTATTATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGATTCGGAAATTGATTAGTTCCACTAATATTAGGAGCTCCTGATATAGCTTTCCCTCGAATAAATAACATAAGATTTTGATTATTACCCCCCTCTATTATACTTTTAATCTCAAGAAGAATTGTAGAAAACGGAGCAGGTACAGGATGAACAGTTTACCCACCACTTTCATCTAATATTGCTCATAGAGGAAGTTCAGTAGATTTAGCTATTTTTTCCCTTCATTTAGCTGGAATTTCTTCAATTTTAGGAGCTGTAAATTTCATTACAACTATTATTAATATACGACCTAATAATATGTCATTAGATCAAATACCATTATTTGTTTGAGCTGTTGGTATTACAGCTTTATTATTATTATTATCTTTACCAGTTTTAGCTGGTGCAATTACTATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGATCCTGCTGGAGGAGGAGATCCTATTCTATATCAACATTTATTT	NSWHH870-09
682	532	Kenya	KJ592317	AACATTATATTTTATTTTTGGTATTTGAGCTGGAATAGTAGGAACTTCTTTAAGACTATTAATTCGAGCAGAATTAGGAAACCCAGGTTCATTAATCGGAGATGATCAAATTTATAATACTATTGTTACAGCCCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGTTTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCTGATATAGCATTCCCTCGCATAAATAATATAAGATTTTGATTACTTCCCCCCTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAACATTGCTCATAGAGGAAGATCTGTCGATCTTGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCAATTTTAGGTGCTGTTAATTTTATTACCACTATCATTAATATGCGACCTAATAATATATCGTTAGACCAAATACCTTTATTTGTCTGAGCTGTCGGAATTACAGCTTTATTACTTTTACTTTCATTACCAGTATTAGCTGGAGCTATTACTATATTATTAACTGATCGAAATCTTAATACTTCTTTTTTTGACCCTGCAGGAGGAGGTGATCCTATTCTATACCAACATTTATTT	AFTOR038-12
683	532	Kenya	KJ592196	AACATTATATTTTATTTTTGGTATTTGAGCTGGAATAGTAGGAACTTCTTTAAGACTATTAATTCGAGCAGAATTAGGAAACCCAGGTTCATTAATCGGAGATGATCAAATTTATAATACTATTGTTACAGCCCATGCTTTTATCATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGTTTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCTGATATAGCATTCCCTCGAATAAATAATATAAGATTTTGATTACTTCCCCCCTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAACATTGCTCATAGAGGAAGATCTGTCGATCTTGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCAATTTTAGGTGCTGTTAATTTTATTACCACTATCATTAATATGCGACCTAATAATATATCGTTAGACCAAATACCTTTATTTGTCTGAGCTGTCGGAATTACAGCTTTATTACTTTTACTTTCATTACCAGTATTAGCTGGAGCTATTACTATATTATTAACTGATCGAAATCTTAATACTTCTTTTTTTGACCCTGCAGGAGGAGGTGATCCTATTCTATACCAACATTTATTT	AFTOR039-12
684	532	Kenya	KJ592098	AACATTATATTTTATTTTTGGTATTTGAGCTGGAATAGTAGGAACTTCTTTAAGACTATTAATTCGAGCAGAATTAGGAAACCCAGGTTCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCCCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGTTTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCTGATATAGCATTCCCTCGCATAAATAATATAAGATTTTGATTACTTCCCCCCTCTATTATGTTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAACATTGCTCATAGAGGAAGATCTGTCGATCTTGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCAATTTTAGGTGCTGTTAATTTTATTACCACTATCATTAATATGCGACCTAATAATATATCGTTAGACCAAATACCTTTATTTGTCTGAGCTGTCGGAATTACAGCTTTATTACTTTTACTTTCATTACCAGTATTAGCTGGAGCTATTACTATATTATTAACTGATCGAAATCTTAATACTTCTTTTTTTGACCCTGCAGGAGGAGGTGATCCTATTCTATACCAACATTTATTT	AFTOR040-12
685	532	Kenya	KJ592263	---ATTATATTTTATTTTTGGTATTTGAGCTGGAATAGTAGGAACTTCTTTAAGACTATTAATCCGAGCAGAATTAGGAAACCCAGGTTCATTAATCGGAGATGATCAAATTTATAATACTATTGTTACAGCCCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGTTTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCTGATATAGCATTCCCTCGCATAAATAATATAAGATTTTGATTACTTCCCCCTTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTGTACCCCCCACTTTCATCAAACATTGCTCATAGAGGAAGATCTGTCGATCTTGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCAATTTTAGGTGCTGTTAATTTTATTACCACTATCATTAATATGCGACCTAATAATATATCATTAGACCAAATACCTTTATTTGTCTGAGCTGTCGGAATTACAGCTTTATTACTTTTACTTTCATTACCAGTATTAGCTGGAGCTATTACTATATTATTAACTGATCGAAATCTTAATACTTCTTTTTTTGACCCTGC-------------------------------------	AFTOR041-12
686	532	Kenya	KJ592239	AACATTATATTTTATTTTTGGTATTTGAGCTGGAATAGTAGGAACTTCTTTAAGACTATTAATTCGAGCAGAATTAGGAAACCCAGGTTCATTAATCGGAGATGATCAAATTTATAATACTATTGTTACAGCCCATGCTTTTATTATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGTTTTGGAAATTGATTAGTACCATTAATATTAGGAGCTCCTGATATAGCATTCCCTCGTATAAATAATATAAGATTTTGATTACTTCCCCCCTCTATTATATTATTAATTTCAAGTAGAATTGTAGAAAATGGAGCAGGAACAGGATGAACAGTATACCCCCCACTTTCATCAAACATTGCTCATAGAGGAAGATCTGTCGATCTTGCAATTTTTTCTTTACATTTAGCTGGAATTTCATCAATTTTAGGTGCTGTTAATTTTATTACCACTATCATTAATATACGACCTAATAATATATCGTTAGACCAAATACCTTTATTTGTCTGAGCTGTCGGAATTACAGCTTTATTACTTTTACTTTCATTACCAGTATTAGCTGGAGCTATTACTATATTATTAACTGATCGAAATCTTAATACTTCTTTTTTTGACCCTGCAGGGGGAGGTGATCCTATTCTATACCAACATTTATTT	AFTOR042-12
687	561	Democratic Republic of the Congo	\N	GACTCTTTATTTTATCTTCGGAGCTTGAGCCGGAATAGTAGGAACATCCCTAAGTATTTTAATTCGAGCTGAATTAGGGCACCCAGGTGCATTAATTGGGGATGATCAAATTTATAATGTTATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACGTTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCTCATGGAGGTGCATCTGTAGACTTAGCAATTTTTTCTCTCCATTTAGCAGGTATTTCATCAATTTTAGGTGCAGTAAATTTCATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGATCGAATACCTTTATTCGTATGAGCAGTCGTTTTAACCGCATTATTATTACTACTCTCACTTCCTGTATTAGCAGGTGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCATTTTTCGATCCAGCCGGAGGTGGGGACCCCATTTTATATCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCCCATATTATTAGCCAAGAATCTGGTAAAAAGGAAACTTTTGGATCTTTAGGAATAATCTATGCAATATTAGCAATTGGATTACTAGGTTTTATTGTTTGAGCTCATCATATATTTACAGTAGGTATAGATGTTGATACTCGAGCTTATTTTACATCTGCAACTATAAT---	JTB173-12
688	561	Democratic Republic of the Congo	\N	GACTCTTTATTTTATCTTCGGAGCTTGAGCCGGAATAGTAGGAACATCTCTAAGTATTTTAATTCGAGCTGAATTAGGACACCCAGGTGCATTAATTGGAGATGATCAAATTTATAATGTTATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCCCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACGTTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCCCATGGAGGTGCATCTGTAGACTTAGCAATTTTTTCTCTCCATTTAGCAGGTATTTCATCAATTTTAGGTGCAGTAAATTTCATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGATCGAATACCTTTATTCGTATGAGCAGTTGTTTTAACCGCATTATTATTACTACTCTCACTTCCTGTATTAGCAGGTGCTATTACAATGTTATTAACAGATCGAAATTTAAATACATCATTTTTCGATCCAGCCGGAGGTGGAGACCCCATTTTATACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCCCATATTATTAGCCAAGAATCTGGTAAAAAGGAAACTTTTGGATCTTTAGGAATAATCTATGCAATATTAGCAATTGGATTGCTAGGTTTTATTGTTTGAGCTCATCATATATTTACAGTAGGTATAGATGTTGATACTCGAGCTTATTTTACATCTGCAACTATAATTAT	JTB218-12
689	561	Tanzania	\N	-----------------------CTTGAGCCGGAATAGTAGGAACATCTTTAAGTATTTTAATTCGAGCTGAATTAGGACACCCAGGTGCATTAATTGGGGATGATCAAATTTATAATGTTATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTGCCTCCTTCCCTTACGTTATTATTAGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCCCATGGAGGTGCATCTGTAGACTTAGCAATTTTTTCTCTCCATTTAGCAGGTATTTCATCAATTTTAGGTGCAGTAAATTTCATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTCGTATGAGCAGTTGTTTTAACCGCATTATTATTATTACTCTCACTTCCTGTATTAGCAGGTGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCATTTTTCGACCCAGCCGGAGGTGGAGACCCCATTTTATACCAACATTTATTTTGATTTTTTGGACACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCATATTATTAGCCAAGAATCTGGTAAAAAGGAAACTTTTGGATCT-----------------------------------------------------------------------------------------------------------------------------	JTB269-12
690	561	Democratic Republic of the Congo	\N	GACTTTATATTTCATCTTCGGAGCTTGAGCCGGAATAACAGGGACATCTTTAAGTATCCTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGGGATGATCAAATTTATAATGTTATCGTAACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTCGGTAATTGACTTGTGCCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTGTTAGTGAGCAGTATAGTAGAAAATGGGGCTGGGACAGGTTGAACAGTTTACCCTCCCCTATCTTCCGTAATTGCACATGGAGGAGCATCTGTAGATCTAGCAATTTTTTCTCTTCATTTAGCAGGTATCTCATCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATGCGATCAACTGGAATTACATTTGATCGAATACCTTTATTCGTATGAGCAGTTGTTTTAACTGCTTTATTATTATTACTTTCACTTCCTGTATTAGCAGGAGCTATCACAATATTATTAACAGACCGAAACTTAAATACATCATTTTTTGACCCAGCCGGAGGAGGGGACCCTATCTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGAATAATTTCTCATATTATCAGTCAAGAATCTGGTAAAAAAGAAACTTTCGGATCTTTAGGAATAATTTATGCTATAATAGCAATTGGATTATTAGGTTTTATTGTTTGAGCTCATCATATATTTACAGTAGGAATAGATGTTGACACTCGAGCTTATTTTACATCCGCAACTAT------	JTB281-12
691	561	Cote d'Ivoire	\N	AACTCTTTATTTTATCTTCGGAGCTTGAGCCGGAATAGTAGGAACATCTCTAAGTATTTTAATTCGAGCTGAATTAGGACACCCAGGTGCATTAATTGGGGATGATCAAATTTATAATGTTATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACGTTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCCCATGGAGGTGCATCTGTAGACTTAGCAATTTTTTCTCTCCATTTAGCAGGTATTTCATCAATTTTAGGTGCAGTAAATTTCATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGATCGAATACCTTTATTCGTATGAGCAGTTGTTTTAACCGCATTATTATTACTACTCTCACTTCCTGTATTAGCAGGTGCTATTACAATGTTATTAACAGATCGAAATTTAAATACATCATTTTTCGATCCAGCCGGAGGTGGAGACCCCATTTTATACCAACATTTATTT	MVTBI160-08
692	561	Cote d'Ivoire	\N	AACTCTTTATTTTATCTTCGGAGCTTGAGCCGGAATAGTAGGAACATCTCTAAGTATTTTAATTCGAGCTGAATTAGGACACCCAGGTGCATTAATTGGGGATGACCAAATTTATAATGTTATTGTAACTGCTCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACGTTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCNCATGGAGGTGCATCTGTAGACTTAGCAATTTTTTCTCTCCATTTAGCAGGTATTTCATCAATTTTAGGTGCAGTAAATTTCATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGANCGAATACCTTTATTCGTATGAGCAGTTGTTTTAACCGCATTATTATTACTACTCTCACTTCCTGTATTAGCAGGTGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCATTTTTCGANCCAGCCGGAGGTGGAGACCCCATTTTATACCAACATTTATTT	MVTBI161-08
693	562	Kenya	\N	----------------TTCGGAGCTTGAGCTGGAATAGTAGGGACATCCTTAAGAATCTTAATTCGAGCTGAATTGGGTCATCCTGGTGCTTTAATTGGAGACGATCAAATTTATAATGTTATTGTAACTGCTCATGCTTTTGTGATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGTTTTGGTAACTGACTTGTACCTTTAATACTCGGAGCTCCAGACATAGCATTTCCTCGAATGAACAATATAAGTTTTTGGTTATTACCACCTTCTCTTACATTACTATTAGTAAGTAGCATAGTGGAAAATGGGGCTGGTACAGGTTGAACAGTATACCCTCCTCTATCTTCTGTAATTGCCCACGGAGGGGCATCTGTTGATTTAGCAATTTTTTCTCTACATTTAGCAGGAATCTCATCAATTTTAGGAGCAGTAAATTTTATTACCACTGTTATTAATATACGATCAACTGGAATTTCATTTGACCGAATGCCTTTATTTGTATGAGCAGTTGTACTAACTGCTTTATTGCTACTACTCTCATTACCTGTATTAGCTGGAGCTATCACAATACTACTAACAGACCGAAATTTAAACACCTCATTTTTTGACCCAGCAGGAGGGGGAGACCCTATTTTATACCAACATTTATTT	MVTBI162-08
694	565	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCCGGAATAGTAGGAACATCTTTAAGTATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAACGTTATTGTAACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCTCATGGAGGAGCATCTGTAGATTTAGCAATTTTTTCTCTTCATTTAGCAGGTATCTCATCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTCGTATGAGCAGTTGTTTTAACTGCATTATTATTATTACTTTCACTTCCTGTATTAGCAGGTGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGACCCAGCAGGAGGTGGAGATCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGTATAATTTCTCATATTATTAGTCAAGAATCTGGTAAAAAGGAAACTTTTGGATCTTTAGGAATAATTTATGCTATACTAGCAATTGGTTTATTAGGTTTTATTGTTTGAGCTCATCATATATTTACAGTAGGTATAGATGTTGATACTCGAGCTTATTTTACATCTGCA-----------	JTB154-12
695	565	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTCGGGGCTTGAGCCGGAATAGTAGGAACATCTTTAAGTATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAACGTTATTGTAACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCTCATGGAGGAGCATCTGTAGATTTAGCAATTTTTTCTCTTCATTTAGCAGGTATCTCATCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTCGTATGAGCAGTTGTTTTAACTGCATTATTATTATTACTTTCACTTCCTGTATTAGCAGGTGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGACCCAGCAGGAGGTGGAGATCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGTATAATTTCTCATGTTATTAGTCAAGAATCTGGTAAAAAGGAAACTTTTGGATCTTTAGGAATAATTTATGCTATACTAGCAATTGGTTTATTAGGTTTTATTGTTTGAGCTCATCATATATTTACAGTAGGTATAGATGTTGATACTCGAGCTTATTTTACATCTGCAACTATAATT--	JTB188-12
696	565	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCCGGAATAGTAGGAACATCTTTAAGTATTTTAATTCGAGCTGAATTAGGACATCCAGGAGCATTAATTGGAGATGATCAAATTTATAACGTTATTGTAACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGCATAGTAGAAAACGGGGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCTCATGGAGGAGCATCTGTAGATTTAGCAATTTTTTCTCTTCATTTAGCAGGTATCTCATCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTCGTATGAGCAGTTGTTTTAACTGCATTATTATTATTACTTTCACTTCCTGTATTAGCAGGTGCTATTACAATATTATTAACAGATCGAAATTTAAATACATCATTTTTTGACCCAGCAGGAGGTGGAGATCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGTATAATTTCTCATATTATTAGTCAAGAATCTGGTAAAAAGGAAACTTTTGGATCTTTAGGAATAATTTATGCTATACTAGCAATTGGTTTATTAGGTTTTATTGTTTGAGCTCATCATATATTTACAGTAGGTATAGATGTTGATACTCGAGCTTATTTTACATCTGCAACTATAAT---	JTB196-12
697	570	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCAGGAATAGTTGGGACATCTTTAAGAATCCTAATTCGAGCTGAATTAGGACATCCAGGAGCACTAATTGGAGACGATCAAATTTATAATGTTATTGTGACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATGCCTATTATAATTGGAGGATTTGGTAACTGACTTGTGCCTCTTATATTAGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCTCTTACACTATTATTGGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTATCTTCTGTAATTGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTTCATTTAGCAGGTATTTCATCAATTTTAGGGGCAGTGAATTTTATTACTACAGTTATTAATATGCGATCAACCGGAATTACATTTGATCGAATACCTTTATTTGTATGAGCAGTTGTTTTAACCGCATTATTACTACTACTTTCACTTCCAGTATTAGCTGGGGCTATCACAATACTATTAACAGACCGAAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGGGGTGATCCTATTTTATACCAACATCTTTTTTGATTTTTTGGTCACCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGTATAATTTCTCATATTATTAGCCAAGAATCAGGAAAAAAGGAAACTTTTGGATCTTTAGGAATAATCTATGCTATAATAGCAATTGGACTATTAGGTTTTATTGTATGAGCTCATCATATATTTACTGTAGGAATAGATGTAGATACACGAGCTTATTTTACATCTGCAACTATAATT--	JTB043-12
698	570	Kenya	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCAGGAATAGTTGGAACATCTTTAAGAATCCTAATTCGAGCTGAATTAGGACATCCAGGAGCACTAATTGGAGATGATCAAATTTATAATGTTATTGTGACTGCCCATGCTTTCGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGGTTTGGTAACTGACTTGTGCCTCTTATATTAGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCTCTCACACTATTATTGGTAAGTAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACAGTTTACCCTCCCCTATCTTCTGTAATTGCCCATGGAGGAGCATCAGTTGATTTAGCAATTTTTTCTCTTCATTTAGCAGGTATTTCATCAATTTTAGGAGCAGTGAATTTTATTACTACAGTTATTAATATACGATCAACCGGAATTACATTTGATCGAATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCATTATTATTGCTACTTTCACTTCCGGTATTAGCTGGAGCTATCACAATACTATTAACAGACCGAAATTTAAATACATCTTTTTTTGATCCTGCAGGAGGGGGTGATCCTATTTTATACCAACATCTTTTT	MVTBI163-08
699	572	Democratic Republic of the Congo	\N	GACTTTATATTTTATTTTCGGAGCTTGAGCCGGAATAGTAGGGACATCTTTAAGTATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCATTAATTGGAGACGATCAAATTTATAACGTTATTGTAACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCTCATGGAGGAGCATCTGTAGATTTAGCAATTTTTTCTCTCCATTTAGCAGGTATCTCATCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGATCGAATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCATTATTATTATTACTTTCACTTCCTGTATTAGCAGGTGCTATTACAATATTACTAACAGATCGAAATCTAAATACATCATTTTTTGACCCAGCAGGAGGTGGAGATCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGTATAATTTCTCATATTATTAGTCAAGAATCTGGTAAAAAGGAAACCTTTGGATCTTTAGGAATAATTTATGCTATAATAGCAATTGGTTTATTAGGTTTTATTGTTTGAGCTCATCATATATTTACAGTAGGTATGGACGTTGATACTCGAGCTTATTTTACATCTGCAACTATAATTAT	JTB178-12
700	572	Mozambique	\N	GAATTTATATTTTATTTTCGGAGCTTGAGCCGGAATAGTAGGGACATCTTTAAGTATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCATTAATTGGAGACGATCAAATTTATAACGTTATTGTAACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCTCATGGAGGAGCATCTGTAGATTTAGCAATTTTTTCTCTCCATTTAGCAGGTATCTCATCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGATCGAATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCATTATTATTATTACTTTCACTTCCTGTATTAGCAGGTGCTATTACAATATTACTAACAGATCGAAATCTAAATACATCATTTTTTGACCCAGCAGGAGGTGGAGATCCTATTTTATACCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCAGGATTTGGTATAATTTCTCATATTATTAGTCAAGAATCTGGTAAAAAGGAAACCTTTGGATCTTTAGGAATAATTTATGCTATAA-------------------------------------------------------------------------------------------------------	JTB337-12
701	572	Kenya	\N	AACTTTATATTTTATTTTCGGAGCTTGAGCCGGAATAGTAGGGACATCTTTAAGTATTTTAATTCGAGCTGAATTAGGTCACCCAGGAGCATTAATTGGAGACGATCAAATTTATAACGTTATTGTAACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGTGGATTTGGTAATTGACTTGTACCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCTTCCCTTACATTATTATTAGTAAGTAGTATAGTAGAAAACGGAGCTGGAACAGGTTGAACAGTTTACCCACCCCTATCTTCTGTAATTGCTCATGGAGGAGCATCTGTAGATTTAGCAATTTTTTCTCTCCATTTAGCAGGTATCTCATCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTACATTTGATCGAATACCTTTATTTGTATGAGCAGTTGTTTTAACTGCATTATTATTATTACTTTCACTTCCTGTATTAGCAGGTGCTATTACAATATTACTAACAGATCGAAATCTAAATACATCATTTTTTGACCCAGCAGGAGGTGGAGATCCTATTTTATACCAACATTTATTT	MVTBI164-08
714	593	Kenya	KF643205	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTGGGAACATCCTTAAGATTATTAATTCGTGCAGAATTAGGAAATCCTGGGTCATTAATTGGGGACGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTCATGGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGGGCTCCTGATATAGCATTCCCACGAATAAACAATATAAGTTTTTGATTACTCCCCCCATCATTAACACTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCTGGAACAGGATGAACTGTTTACCCCCCTTTATCATCTAATATTGCTCATAGAGGAAGATCCGTTGATTTAGCAATTTTCTCACTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTCATTACTACTATTATTAATATAAAAAGAAATGGAATATCATTTGATCAAATACCATTATTTGTATGAGCTGTAGGTATTACAGCTTTATTATTACTTTTATCTTTACCTGTATTAGCAGGAGCTATTACTATACTTTTAACAGATCGAAATTTAAATACATCTTTTTTTGATCCTGCTGGAGGGGGGGATCCTATTTTATACCAACATTTATTT	PMANL2551-12
702	576	Tanzania	\N	AACTTTATATTTTATTTTTGGAGCTTGAGCTGGAATAGTCGGGACATCTCTTAGAATTTTAATTCGAACTGAATTAGGTCATCCAGGTGCTTTAATTGGAGATGATCAAATTTACAATGTAATTGTAACAGCACATGCTTTTGTAATAATTTTTTTTATAGTAATACCTATTATAATTGGAGGGTTTGGAAATTGATTAGTTCCTCTTATACTTGGTGCACCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCCCCTTCCCTCATACTATTACTAATCAGCAGTATAGTAGAAAATGGAGCTGGAACAGGTTGAACCGTTTACCCCCCACTTTCTTCAGTAATTGCCCATGGGGGAGCTTCTGTTGATTTAGCAATTTTTTCCTTACATTTAGCTGGTATTTCTTCAATTCTAGGGGCAGTTAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTTCATTTGATCGAATACCACTATTTGTATGAGCAGTTGTTCTTACAGCATTATTATTATTACTTTCATTACCTGTATTAGCTGGAGCTATCACTATATTATTAACAGATCGAAATTTAAATACTTCATTTTTTGACCCAGCAGGAGGAGGAGACCCTATTCTTTATCAACATTTATTTTGATTTTTTGGACATCCTGAAGTTTATATTTTAATTTTACCTGGGTTTGGAATAATTTCCCACATTATTAGTCAAGAATCGGGGAAAAAAGAAACATTTGGATCCTTAGGAATAATTTATGCTAT---------------------------------------------------------------------------------------------------------	JTB246-12
703	578	Kenya	\N	AACTTTATATTTTATCTTCGGAGCTTGAGCAGGAATAGTAGGAACATCCTTGAGAATTTTAATTCGAGCTGAATTAGGGCACCCAGGAGCATTAATTGGAGATGATCAAATTTATAATGTTATTGTTACTGCCCATGCTTTTGTAATAATTTTTTTTATAGTTATACCTATTATAATTGGAGGATTTGGAAATTGACTTGTACCTCTTATGTTAGGTGCTCCAGATATAGCATTTCCTCGAATAAATAATATAAGTTTTTGATTATTACCTCCCTCTCTTACATTATTATTAGTGAGTAGTATAGTAGAAAACGGAGCTGGAACTGGCTGAACAGTTTATCCTCCATTATCTTCTGTAATCGCTCATGGAGGGGCATCTGTTGACTTAGCAATTTTTTCTCTTCATTTAGCAGGTATTTCATCAATTTTAGGAGCAGTAAATTTTATTACTACAGTTATTAATATACGATCAACTGGAATTACTTTTGACCGAATACCTTTATTTGTATGGGCAGTTGTTTTAACAGCATTATTATTACTACTCTCATTACCAGTATTAGCCGGAGCTATTACTATATTATTAACAGATCGAAATTTAAATACCTCATTCTTTGACCCTGCAGGAGGAGGTGACCCTATTTTATACCAACATCTTTTT	MVTBI166-08
704	581	Kenya	\N	AACATTATATTTTATCTTCGGAGCTTGAGCTGGAATAGTAGGAACATCTTTAAGAATTTTAATTCGAGCTGAACTAGGCCATCCAGGAGCATTAATTGGAGATGACCAAATTTATAATGTTATTGTAACTGCTCACGCTTTTGTAATAATTTTTTTTATAGTAATACCTATCATAATTGGAGGATTTGGTAACTGATTAGTACCTCTTATACTTGGTGCACCAGATATAGCATTCCCTCGAATAAATAATATAAGTTTTTGATTACTTCCACCTTCTCTTACATTATTATTAGTAAGTAGTATAGTAGAAAATGGGGCTGGAACAGGTTGAACAGTTTACCCTCCCCTATCATCTGTAATTGCTCATGGTGGAGCATCTGTTGACTTAGCAATTTTTTCCTTACATTTAGCAGGAATTTCATCAATTCTAGGAGCAGTAAATTTTATCACTACAGTTATTAATATACGATCAACTGGAATTACATTTGACCGAATACCTTTATTTGTATGAGCAGTAGTTTTAACTGCATTATTATTATTACTGTCATTACCCGTTTTAGCTGGAGCTATTACAATATTATTAACAGATCGAAATCTAAATACATCATTTTTTGACCCGGCAGGAGGAGGTGATCCTATTTTATACCAACACTTATTC	MVTBI167-08
707	593	Kenya	KF643202	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTGGGAACATCCTTAAGATTATTAATTCGTGCAGAATTAGGAAATCCTGGGTCATTAATTGGGGACGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTCATGGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGGGCTCCTGATATAGCATTCCCACGAATAAACAATATAAGTTTTTGATTACTCCCCCCATCATTAACACTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCTGGAACAGGATGAACTGTTTACCCCCCTTTATCATCTAATATTGCTCATAGAGGAAGATCCGTTGATTTAGCAATTTTCTCACTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTCATTACTACTATTATTAATATAAAAAGAAATGGAATATCATTTGATCAAATACCATTATTTGTATGAGCTGTAGGTATTACAGCTTTATTATTACTTTTATCTTTACCTGTATTAGCAGGAGCTATTACTATACTTTTAACAGATCGAAATTTAAATACATCTTTTTTTGATCCTGCTGGAGGGGGGGATCCTATTTTATACCAACATTTATTT	AFMIC168-12
708	593	South Africa	\N	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGAACATCCTTAAGATTATTAATTCGTGCAGAATTAGGAAATCCTGGATCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTCATGGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGGGCTCCTGATATAGCATTCCCACGAATAAACAATATAAGTTTTTGATTACTCCCTCCATCATTAACACTTTTAATTTCAAGAAGAATTGTAGAAAACGGAGCTGGAACAGGATGAACTGTTTACCCCCCTTTATCATCTAATATTGCTCACAGAGGAAGATCCGTTGATTTAGCAATTTTCTCATTACATTTAGCTGGAATTTCTTCAATTTTAGGGGCTATTAATTTCATTACTACTATTATTAATATAAAAAGAAATGGAATATCATTTGATCAAATACCATTATTTGTATGAGCTGTAGGTATTACAGCTTTATTATTACTTTTATCTTTACCTGTATTAGCAGGAGCTATTACTATACTTTTAACAGATCGAAATTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGGGATCCTATTTTATACCAACATTTATTT	LNAUT1922-14
709	593	Kenya	KF643207	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTGGGAACATCCTTAAGATTATTAATTCGTGCAGAATTAGGAAATCCTGGGTCATTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTCATGGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGGGCTCCTGATATAGCATTCCCACGAATAAACAATATAAGTTTTTGATTACTCCCCCCATCATTAACACTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCTGGAACAGGATGAACTGTTTACCCCCCTTTATCATCTAATATTGCTCATAGAGGAAGATCCGTTGATTTAGCAATTTTCTCACTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTCATTACTACTATTATTAATATAAAAAGAAATGGAATATCATTTGATCAAATACCATTATTTGTATGAGCTGTAGGTATTACAGCTTTATTATTACTTTTATCTTTACCTGTATTAGCAGGAGCTATTACTATACTTTTAACAGATCGAAATTTAAATACATCTTTTTTTGATCCTGCTGGAGGGGGGGATCCTATTTTATATCAACATTTATTT	PMANK893-08
710	593	Kenya	KF643203	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTGGGAACATCCTTAAGATTATTAATTCGTGCAGAATTAGGAAATCCTGGGTCATTAATTGGGGACGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTCATGGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGGGCTCCTGATATAGCATTCCCACGAATAAACAATATAAGTTTTTGATTACTCCCCCCATCATTAACACTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCTGGAACAGGATGAACTGTTTACCCCCCTTTATCATCTAATATTGCTCATAGAGGAAGATCCGTTGATTTAGCAATTTTCTCACTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTCATTACTACTATTATTAATATAAAAAGAAATGGAATATCATTTGATCAAATACCATTATTTGTATGAGCTGTAGGTATTACAGCTTTATTATTACTTTTATCTTTACCTGTATTAGCAGGAGCTATTACTATACTTTTAACAGATCGAAATTTAAATACATCTTTTTTTGATCCTGCTGGAGGGGGGGATCCTATTTTATACCAACATTTATTT	PMANK902-08
711	593	Kenya	KF643201	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTGGGAACATCCTTAAGATTATTAATTCGTGCAGAATTAGGAAATCCTGGGTCATTAATTGGGGACGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTCATGGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGGGCTCCTGATATAGCATTCCCACGAATAAACAATATAAGTTTTTGATTACTCCCCCCATCATTAACACTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCTGGAACAGGATGAACTGTTTACCCCCCTTTATCATCTAATATTGCTCATAGAGGAAGATCCGTTGATTTAGCAATTTTCTCACTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTCATTACTACTATTATTAATATAAAAAGAAATGGAATATCATTTGATCAAATACCATTATTTGTATGAGCTGTAGGTATTACAGCTTTATTATTACTTTTATCTTTACCTGTATTAGCAGGAGCTATTACTATACTTTTAACAGATCGAAATTTAAATACATCTTTTTTTGATCCTGCTGGAGGGGGGGATCCTATTTTATACCAACATTTATTT	PMANK904-08
712	593	Kenya	KF643206	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTGGGAACATCCTTAAGATTATTAATTCGTGCAGAATTAGGAAATCCTGGGTCATTAATTGGGGACGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTCATGGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGGGCTCCTGATATAGCATTCCCACGAATAAACAATATAAGTTTTTGATTACTCCCCCCATCATTAACACTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCTGGAACAGGATGAACTGTTTACCCCCCTTTATCATCTAATATTGCTCATAGAGGAAGATCCGTTGATTTAGCAATTTTCTCACTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTCATTACTACTATTATTAATATAAAAAGAAATGGAATATCATTTGATCAAATACCATTATTTGTATGAGCTGTAGGTATTACAGCTTTATTATTACTTTTATCTTTACCTGTATTAGCAGGAGCTATTACTATACTTTTAACAGATCGAAATTTAAATACATCTTTTTTTGATCCTGCTGGAGGGGGGGATCCTATTTTATACCAACATTTATTT	PMANK913-08
713	593	Kenya	KF643208	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTGGGAACATCCTTAAGATTATTAATTCGTGCAGAATTAGGAAATCCTGGGTCATTAATTGGGGACGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTCATGGTTATACCAATTATAATTGGTGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGGGCTCCTGATATAGCATTCCCACGAATAAACAATATAAGTTTTTGATTACTCCCCCCATCATTAACACTTTTAATTTCAAGAAGAATTGTAGAAAATGGAGCTGGAACAGGATGAACTGTTTACCCCCCTTTATCATCTAATATTGCTCATAGAGGAAGATCCGTTGATTTAGCAATTTTCTCACTACATTTAGCTGGAATTTCTTCAATTTTAGGAGCTATTAATTTCATTACTACTATTATTAATATAAAAAGAAATGGAATATCATTTGATCAAATACCATTATTTGTATGAGCTGTAGGTATTACAGCTTTATTATTACTTTTATCTTTACCTGTATTAGCAGGAGCTATTACTATACTTTTAACAGATCGAAATTTAAATACATCTTTTTTTGATCCTGCTGGAGGAGGGGATCCTATTTTATACCAACATTTATTT	PMANK916-08
715	593	Kenya	KF643204	AACTTTATATTTTATTTTTGGAATTTGATCAGGAATAGTAGGGACATCTTTAAGATTATTAATTCGTGCAGAATTAGGGAATCCTGGGTCACTAATTGGAGATGATCAAATTTATAATACTATTGTTACAGCTCATGCTTTTATTATAATTTTTTTTATAGTTATACCAATTATAATTGGAGGATTTGGAAATTGATTAGTTCCTTTAATATTAGGAGCCCCTGATATAGCATTCCCACGAATAAATAATATAAGTTTTTGATTACTTCCACCATCATTAACACTTTTAATTTCAAGTAGAATTGTAGAAAACGGAGCTGGAACAGGATGAACTGTCTACCCCCCTTTATCATCTAATATTGCTCATAGAGGAAGATCTGTTGATTTAGCGATTTTTTCTTTACATTTAGCTGGTATTTCCTCAATTTTAGGGGCTATTAATTTTATCACTACTATTATTAATATAAAAAGAAATGGAATATCATTTGATCAAATACCACTATTTGTGTGAGCTGTAGGTATTACAGCTTTACTATTACTTTTATCTTTACCAGTATTAGCTGGTGCTATTACTATATTATTAACAGACCGAAATTTAAATACATCTTTTTTTGACCCTGCTGGAGGAGGGGATCCTATTTTATATCAACATTTATTT	PMANL2552-12
\.


--
-- Data for Name: insects_regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insects_regions (insect_id, region_id) FROM stdin;
195	14
11	2
13	2
13	11
421	14
1	14
31	14
2	2
2	11
409	11
20	14
20	2
20	11
8	2
8	11
34	14
34	2
34	11
283	2
326	14
326	2
88	14
88	2
35	11
37	2
38	11
39	1
40	2
42	2
43	2
44	2
45	11
47	11
48	14
49	11
50	2
51	11
52	2
53	2
54	14
54	2
54	11
55	14
55	2
56	14
57	2
58	14
58	11
59	14
60	14
61	11
64	14
65	14
66	14
68	11
69	14
71	14
72	2
73	14
74	11
75	14
76	3
77	2
78	14
79	11
80	11
82	2
83	2
83	8
84	2
86	2
87	14
87	2
87	11
19	2
19	11
159	14
159	2
159	8
159	11
408	14
408	2
408	8
408	11
160	2
410	2
247	11
567	14
567	2
567	3
567	8
567	11
331	11
340	14
12	14
12	2
12	8
12	11
219	2
344	14
344	11
215	14
215	2
215	11
216	2
216	11
214	14
214	11
293	14
292	14
291	14
291	11
285	2
285	11
286	11
287	14
294	11
295	11
284	14
284	2
288	14
289	2
290	11
392	2
426	14
426	2
427	2
428	14
428	11
422	14
422	2
422	11
423	14
423	2
423	11
424	11
425	14
429	11
461	11
460	11
467	14
467	3
467	11
468	14
590	11
589	14
588	14
588	2
588	11
394	2
394	8
89	2
89	1
211	11
112	11
113	2
114	14
114	2
165	2
166	2
169	2
170	11
171	11
172	2
173	2
174	2
175	14
175	2
175	13
175	11
176	2
176	11
30	14
162	2
341	11
10	11
178	11
244	14
3	2
361	8
389	2
388	11
568	14
568	2
568	8
568	11
212	8
228	2
33	11
163	14
241	2
241	11
242	14
243	11
249	11
240	11
541	11
540	14
542	11
538	14
538	11
544	14
545	14
543	2
543	11
14	11
15	11
16	11
17	14
17	11
401	14
250	14
250	2
250	11
251	11
252	14
252	2
252	11
92	14
94	11
253	2
254	14
255	8
256	14
256	11
257	11
258	11
259	11
260	11
261	14
262	11
263	2
263	11
264	8
265	2
265	8
266	11
267	8
268	11
270	14
272	11
273	14
274	14
274	2
274	8
274	1
275	14
275	2
275	11
276	11
278	14
470	14
470	11
471	2
472	11
473	14
473	2
473	11
475	11
476	11
279	14
279	2
279	8
279	11
239	14
239	2
239	11
296	2
329	14
329	2
329	11
466	11
248	11
324	2
213	14
213	11
9	11
27	14
27	11
322	14
322	2
322	11
95	14
417	2
417	11
168	8
168	11
220	14
343	11
399	11
469	11
537	11
327	14
327	2
222	2
223	14
223	2
223	8
223	11
328	2
224	14
224	2
224	8
224	11
364	14
177	11
371	14
371	11
226	14
226	2
226	8
226	11
90	11
102	1
100	2
100	11
245	2
246	11
411	11
412	11
413	2
413	11
587	2
587	11
372	2
376	14
377	2
377	11
379	14
380	13
380	11
383	14
386	14
386	11
387	14
387	13
395	11
396	11
391	14
404	14
404	2
397	14
433	8
433	11
434	14
434	2
434	8
434	11
458	2
458	11
457	11
229	2
230	11
233	2
231	2
231	8
231	11
234	2
232	2
232	11
235	14
236	2
236	11
237	2
238	2
238	8
551	13
551	4
551	11
91	11
534	13
22	14
22	11
23	2
23	13
23	10
26	14
26	2
26	8
26	1
26	11
26	10
24	14
24	13
24	11
28	14
29	14
29	13
29	11
29	10
32	14
32	2
98	14
98	2
98	8
99	14
111	14
138	2
138	11
115	11
116	14
116	13
116	1
116	11
118	2
118	11
120	14
120	11
121	14
121	2
121	13
121	4
121	11
122	11
123	14
123	11
141	14
141	11
124	14
124	3
125	14
125	6
125	2
125	11
126	14
126	1
126	11
127	14
128	14
129	11
130	2
130	11
132	14
133	2
133	8
134	14
134	11
135	2
135	11
136	14
136	11
137	11
139	2
140	14
131	2
154	2
143	2
142	14
142	13
117	14
119	14
119	2
144	2
145	14
145	11
146	14
146	13
149	14
149	2
149	3
150	14
150	11
151	14
152	11
153	14
155	2
156	14
156	11
161	2
179	2
179	1
181	2
181	11
184	14
184	13
184	11
185	2
187	14
187	2
187	8
187	13
187	4
187	1
187	10
189	14
189	2
189	8
189	13
189	1
192	14
194	11
197	14
199	14
199	2
199	8
199	11
202	14
202	11
205	14
205	11
206	14
206	3
207	14
207	11
208	14
208	11
210	14
210	8
210	1
382	2
362	11
402	14
402	10
403	14
403	1
403	11
403	10
526	14
526	11
527	14
527	3
560	11
561	14
561	11
562	2
562	3
563	11
564	2
565	11
566	14
569	11
570	14
570	11
572	2
572	11
572	10
571	11
573	14
574	14
574	11
575	14
576	14
576	11
578	2
578	3
579	14
581	2
147	14
592	14
218	14
221	14
390	2
414	2
414	8
415	2
337	8
332	14
332	2
332	10
338	2
339	14
339	4
419	14
419	2
419	8
419	1
419	11
420	11
558	11
559	14
559	2
559	8
559	11
\.


--
-- Data for Name: k_sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.k_sectors (k_sector_id, sector) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	unknown
\.


--
-- Data for Name: latex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.latex (fruit_latex_id, latex_description) FROM stdin;
1	present
2	absent
\.


--
-- Data for Name: leaf_arrangements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leaf_arrangements (leaf_arrangement_id, arrangement) FROM stdin;
1	(sub)opposite
2	opposite
3	alternate
4	whorled
5	fasciculate
6	clustered
7	terminal
8	rosette
9	bunched
10	unknown
11	spiralled
\.


--
-- Data for Name: leaf_margins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leaf_margins (leaf_margin_id, type_of_leaf_margin) FROM stdin;
1	digitate
2	spiny
3	entire
4	serrate
5	sub(entire)
6	(sub)entire
7	spinose
8	dentate
9	crenate
10	undulate
11	toothed
12	unknown
13	lobed
\.


--
-- Data for Name: plant_coordinates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_coordinates (plant_id, latitude, longitude) FROM stdin;
381	-2.416166666666667	37.9315
252	2.6528333333333336	38.1305
167	-0.952	36.6905
283	-0.952	36.6905
749	-0.952	36.6905
465	-0.9484999999999999	36.679
741	-0.952	36.6905
71	-0.952	36.6905
759	-0.952	36.6905
743	-0.952	36.6905
351	-0.952	36.6905
794	-0.952	36.6905
637	-0.952	36.6905
470	-0.952	36.6905
729	-1.25055	36.78346666666667
43	0.24233333333333332	34.86566666666667
88	0.24233333333333332	34.86566666666667
396	0.24233333333333332	34.86566666666667
487	0.24233333333333332	34.86566666666667
295	0.24233333333333332	34.86566666666667
167	0.24233333333333332	34.86566666666667
134	0.24233333333333332	34.86566666666667
465	-0.952	36.6905
605	0.24233333333333332	34.86566666666667
355	-0.952	36.6905
612	-0.952	36.6905
453	-0.952	36.6905
703	-0.952	36.6905
237	-3.3093833333333333	40.01793333333333
209	-3.322	39.958
471	-3.3093833333333333	40.01793333333333
601	-3.3093833333333333	40.01793333333333
90	-2.437	37.93666666666667
798	-3.3093833333333333	40.01793333333333
806	-3.3625	40.002833333333335
547	-3.2955	40.00066666666667
818	-22.437	37.93716666666667
513	-3.3625	40.0029
62	-3.3093833333333333	40.01793333333333
208	0.24233333333333332	34.86566666666667
290	0.219	34.90233333333333
627	0.219	34.90233333333333
814	0.24233333333333332	34.86566666666667
664	0.24233333333333332	34.90233333333333
664	0.219	34.90233333333333
319	0.24233333333333332	34.86566666666667
397	0.24233333333333332	34.86566666666667
221	0.24233333333333332	34.86566666666667
8	-1.274	36.813833333333335
198	-1.274	36.813833333333335
790	-0.952	36.6905
591	-0.952	36.6905
675	-1.029	36.6025
252	-1.006	36.604166666666664
377	-1.0716666666666668	36.60333333333333
294	-1.00595	36.604083333333335
673	-1.0716666666666668	36.60333333333333
173	-1.0716666666666668	36.60333333333333
734	-1.0716666666666668	36.60333333333333
743	-1.0716666666666668	36.60333333333333
119	-1.3586666666666667	36.7055
539	-1.3586666666666667	36.7055
167	-1.3586666666666667	36.7055
401	-1.3586666666666667	36.7055
546	-1.3586666666666667	36.7055
244	-1.3586666666666667	36.7055
237	-3.3095	40.018
617	-3.2755	39.98383333333334
90	-2.4095	37.93033333333333
165	-2.4095	37.93033333333333
349	-3.4208333333333334	-39.89816666666667
575	-3.3103333333333333	39.99783333333333
190	-2.6493333333333333	38.34616666666667
204	-2.6418333333333335	38.36633333333333
207	-3.3095	40.018
204	-2.4218333333333333	37.933
299	-1.3586666666666667	36.7055
490	0.24233333333333332	34.86566666666667
850	0.24233333333333332	34.86566666666667
685	0.24233333333333332	34.86566666666667
490	0.21833333333333332	34.901
754	0.23600000000000002	34.86366666666667
666	0.24233333333333332	34.86566666666667
818	0.24233333333333332	34.86566666666667
664	0.21833333333333332	34.901
620	0.24233333333333332	34.86566666666667
747	-1.3586666666666667	36.7055
56	-1.3586666666666667	36.7055
687	-1.1076666666666666	37.24283333333333
171	-1.1076666666666666	37.24283333333333
244	-1.1076666666666666	37.24283333333333
734	-1.1076666666666666	37.24283333333333
349	-1.1076666666666666	37.24283333333333
119	-1.1076666666666666	37.24283333333333
252	-1.1076666666666666	37.24275
756	-0.952	36.6905
346	-1.2681666666666667	36.72163333333334
477	-3.321833333333333	39.950833333333335
868	-3.321833333333333	39.95783333333333
714	-3.3219333333333334	39.95783333333333
131	-4.325	39.523666666666664
796	-4.318333333333333	39.529833333333336
772	-3.321833333333333	39.95783333333333
836	-3.3219333333333334	39.95793333333334
44	-4.325	39.523666666666664
90	-2.4098333333333333	37.92966666666667
147	-4.325	39.523666666666664
622	-2.4272833333333335	37.94245
767	0.25066666666666665	34.864666666666665
541	0.22761666666666666	34.88535
734	0.219	34.90233333333333
701	0.22445	34.90763333333334
412	0.25188333333333335	34.86375
690	0.21896666666666667	34.902316666666664
463	0.2442	34.864783333333335
490	0.23593333333333336	34.863733333333336
852	-1.3595	36.678333333333335
440	-1.359	36.7075
743	-1.3586666666666667	36.7055
877	-1.3595	36.678333333333335
837	-3.3211166666666667	39.921533333333336
816	-3.2639833333333335	39.976683333333334
314	-3.3217666666666665	39.9572
714	-3.2991833333333336	39.998466666666666
879	-3.3141	39.98
30	-3.2593666666666667	39.97495
617	-4.324966666666667	39.5237
652	3.3216666666666668	39.9505
44	-3.259333333333333	39.975
347	-3.3213	39.92575
784	-3.3213333333333335	39.92575
462	-3.2898666666666667	40.001133333333335
147	-3.2955	40.00066666666667
621	-3.2954166666666667	40.0007
454	-3.3215	39.923
573	-3.2640000000000002	39.97666666666667
413	-3.322	-39.958
432	-3.259333333333333	39.975
397	-0.9721666666666666	36.69466666666667
697	-0.9721666666666666	36.69466666666667
453	-0.9716666666666666	36.69533333333333
741	0.2271166666666667	34.880716666666665
222	0.2271166666666667	34.880716666666665
754	0.22766666666666666	34.8855
220	0.22768333333333332	34.88548333333333
518	0.21318333333333334	34.923183333333334
699	0.21318333333333334	34.923183333333334
690	0.21833333333333332	34.901
181	0.21833333333333332	34.901
790	0.21846666666666667	34.896483333333336
486	0.21846666666666667	34.896483333333336
487	0.23600000000000002	34.86366666666667
469	0.23600000000000002	34.86366666666667
830	0.24241666666666667	34.86561666666667
558	0.23600000000000002	34.86366666666667
767	0.222	34.90235
756	0.23399999999999999	34.89266666666666
289	-1.0290833333333333	36.602466666666665
749	-1.0290833333333333	36.602466666666665
749	0.219	34.90233333333333
817	-1.1076666666666666	37.24275
734	-1.1076666666666666	37.24275
167	-1.1076666666666666	37.24275
512	-1.1076666666666666	37.24275
670	-1.1076666666666666	37.24275
671	-1.1076666666666666	37.24275
330	-1.104	37.25266666666667
323	-1.2407833333333333	36.787283333333335
299	-1.3589	36.70695
877	-1.3589	36.70695
37	-3.32075	39.88531666666667
622	-2.435983333333333	37.93813333333333
746	-2.4658333333333333	37.915166666666664
617	-3.2992333333333335	39.9983
772	-3.3217	39.95733333333333
529	-3.2986833333333334	39.9999
617	-3.31	39.980666666666664
837	-3.3215	39.923
517	0.0235	35.2065
535	0.03116666666666667	35.17998333333333
877	0.22766666666666666	34.885333333333335
517	0.22766666666666666	34.885333333333335
671	-0.15808333333333333	35.25
242	0.023566666666666666	35.20641666666667
857	-0.15808333333333333	35.25
754	0.23483333333333334	34.867783333333335
89	0.04513333333333334	35.19525
670	0.04513333333333334	35.19525
874	0.23966666666666667	34.864333333333335
846	0.23483333333333334	34.86783333333333
198	0.04513333333333334	35.19525
469	0.23966666666666667	34.864333333333335
28	0.23550000000000001	34.8645
842	0.23550000000000001	34.8645
788	-1.5011166666666667	35.41766666666667
817	-1.5011166666666667	35.41766666666667
114	-1.5011166666666667	35.41766666666667
453	-1.5011166666666667	35.41766666666667
330	-1.0842666666666667	36.60366666666667
851	-1.0399666666666667	36.59648333333333
330	-1.0479666666666667	36.596833333333336
743	-1.0842666666666667	36.60366666666667
743	-1.038	36.59466666666667
554	-0.9537166666666667	36.60856666666667
877	-0.9537166666666667	36.60856666666667
743	-0.9537166666666667	36.60856666666667
123	-0.952	36.6905
252	-3.322	39.958
162	-3.322	39.958
819	-3.3535500000000003	40.01425
601	-3.3388166666666668	40.02538333333333
415	-3.3175	39.958
179	-2.4306833333333335	37.942233333333334
617	-3.2955	40.00066666666667
471	-2.4163	37.95388333333333
739	-3.3414333333333333	40.02758333333333
811	-2.4383	37.93718333333333
792	-4.187616666666667	39.417183333333334
143	0.219	34.896
476	-0.15816666666666668	35.2555
878	0.05493333333333333	35.18965
200	0.22783333333333333	34.896
469	0.23700000000000002	34.86366666666667
698	0.25458333333333333	34.85596666666667
486	0.25458333333333333	34.85596666666667
555	-2.42205	37.9452
811	-2.422	37.945166666666665
817	-4.184583333333333	39.43965
247	-3.3535	40.01433333333333
204	-2.210566666666667	37.7095
278	-3.309266666666667	39.98065
764	-4.333666666666667	39.563833333333335
754	-1.24715	36.81588333333333
850	-1.274	36.813833333333335
308	-1.274	36.813833333333335
282	-1.274	36.813833333333335
734	-1.04	36.596666666666664
330	-1.037	36.601333333333336
17	0.25466666666666665	34.856
231	0.25466666666666665	34.856
181	0.219	34.896
671	-0.15816666666666668	35.258833333333335
699	0.25466666666666665	34.856
817	-0.11983333333333333	35.272
700	0.25466666666666665	34.856
535	-0.11983333333333333	35.272
453	0.22766666666666666	34.885333333333335
472	0.25466666666666665	34.856
754	0.219	34.90233333333333
878	-0.15816666666666668	35.258833333333335
64	0.5967166666666667	36.07338333333333
486	-0.11983333333333333	35.272
603	0.219	34.896
204	0.5967166666666667	36.07338333333333
609	-0.26981666666666665	35.161366666666666
644	0.25466666666666665	34.856
850	-0.26981666666666665	35.161366666666666
712	0.219	34.896
698	0.25466666666666665	34.856
143	0.25466666666666665	34.856
701	0.25466666666666665	34.856
15	0.5967166666666667	36.07338333333333
531	0.5967166666666667	36.07338333333333
666	-0.11979999999999999	35.27203333333333
530	0.22783333333333333	34.896
698	-0.1257	35.270916666666665
255	-2.6418333333333335	38.36633333333333
484	-2.6418333333333335	38.36633333333333
449	-2.6418333333333335	38.36633333333333
356	-0.12833333333333333	35.278166666666664
17	-0.12833333333333333	35.278166666666664
463	-0.12833333333333333	35.278166666666664
28	-0.12833333333333333	35.278166666666664
605	0.25466666666666665	34.856
361	0.25466666666666665	34.856
469	0.25466666666666665	34.856
754	0.25466666666666665	34.856
330	-0.11983333333333333	35.272
535	0.25466666666666665	34.856
103	-0.1451666666666667	35.25416666666667
396	0.25466666666666665	34.856
767	0.25466666666666665	34.856
763	-0.11983333333333333	35.272
666	-0.11983333333333333	35.272
855	-1.3660833333333333	36.71613333333333
308	-1.2388166666666667	36.81178333333333
690	-1.274	36.813833333333335
441	-3.72575	39.036116666666665
255	-3.3001666666666667	39.98566666666667
325	-1.274	36.813833333333335
440	-3.72575	39.036116666666665
376	-3.72575	39.036116666666665
823	-2.4658333333333333	37.915166666666664
868	-3.72575	39.036116666666665
513	-3.3636666666666666	40.00326666666667
795	-2.4658333333333333	37.915166666666664
201	-1.25225	36.82921666666667
786	0.19833333333333333	34.878
627	0.23600000000000002	34.86366666666667
43	0.22783333333333333	34.896
295	0.224	34.89066666666667
698	-0.12955	35.276633333333336
246	-0.1321	35.31218333333333
43	0.219	34.896
88	-0.14515	35.25465
428	-0.13441666666666666	35.26416666666667
679	0.224	34.89066666666667
330	-0.12093333333333334	35.27296666666667
857	0.13356666666666667	35.250166666666665
53	-0.12788333333333332	35.25935
535	-0.1335	350.25016666666664
743	-0.1321	35.31218333333333
670	-0.13441666666666666	35.26416666666667
743	-0.26195	35.463233333333335
878	-0.12955	35.276633333333336
289	-0.14783333333333332	35.26285
198	-0.12016666666666667	35.30235
754	-0.37396666666666667	35.276266666666665
349	-0.14783333333333332	35.26285
268	0.24233333333333332	34.86566666666667
119	0.13356666666666667	35.250166666666665
729	-1.2211	36.8963
700	-1.3662833333333333	36.718383333333335
851	-1.3662833333333333	36.718383333333335
178	-1.3662833333333333	36.718383333333335
851	-1.3586666666666667	36.7055
539	-1.36455	36.71288333333333
394	-1.274	36.813833333333335
298	-1.274	36.813833333333335
743	-1.0019333333333333	36.60551666666667
642	-0.952	36.6905
734	-1.0394	36.59645
627	-0.952	36.6905
299	-0.952	36.6905
851	-0.9847333333333333	36.60785
330	-1.04	36.5965
375	-2.645	38.36215
331	-4.181383333333334	39.42026666666667
617	-3.3002833333333332	39.99133333333333
616	-3.3001666666666667	39.98566666666667
378	-3.299733333333333	39.986866666666664
663	-4.2026666666666666	39.414
338	-2.6760333333333333	38.33255
385	-2.6543833333333335	38.32138333333333
451	-4.2026666666666666	39.414
523	-2.6418333333333335	38.36633333333333
460	-2.6475	38.3398
575	-3.3716333333333335	39.89488333333333
592	-3.3716333333333335	39.89488333333333
748	-2.64275	38.3614
657	-3.35945	39.90266666666667
381	-2.676	38.3325
203	-2.64275	38.3614
513	-3.3625	40.002833333333335
142	-2.555016666666667	38.064766666666664
65	-1.65475	37.19285
80	-2.6418333333333335	38.36633333333333
507	-2.6418333333333335	38.36633333333333
517	0.25066666666666665	34.864666666666665
256	0.224	34.89066666666667
713	0.25266666666666665	34.861333333333334
713	-0.12833333333333333	35.278166666666664
43	0.19833333333333333	34.878
825	0.21766666666666667	34.89966666666667
428	-0.12833333333333333	35.278166666666664
605	0.224	34.89066666666667
685	0.25266666666666665	34.861333333333334
330	-0.12833333333333333	35.278166666666664
785	0.25266666666666665	34.861333333333334
754	0.19824999999999998	34.878
532	0.25266666666666665	34.861333333333334
471	0.22766666666666666	34.885333333333335
88	-0.12833333333333333	35.278166666666664
627	-0.12833333333333333	35.278166666666664
535	-0.12833333333333333	35.278166666666664
639	-2.6738833333333334	38.1458
513	-30.2955	40.00066666666667
381	-2.648016666666667	38.34365
513	-3.1572	40° 08.051
443	-2.4612666666666665	37.984316666666665
142	-3.406016666666667	38.570566666666664
757	-2.546683333333333	38.05818333333333
80	-2.648016666666667	38.34365
754	-1.2408333333333332	36.787333333333336
877	-1.2313333333333334	36.76416666666667
818	-1.2313333333333334	36.76416666666667
877	-1.3586666666666667	36.7055
244	-1.2313333333333334	36.76416666666667
627	0.23550000000000001	34.8645
43	0.23550000000000001	34.8645
850	-0.12254999999999999	35.2709
295	-0.1451666666666667	35.25416666666667
377	-0.1225	35.270833333333336
558	-0.1225	35.270833333333336
40	-0.1225	35.270833333333336
814	0.224	34.89066666666667
289	-0.14966666666666667	35.2585
867	-0.1225	35.270833333333336
469	0.224	34.89066666666667
42	0.2526	34.86125
627	-0.1225	35.270833333333336
295	0.23600000000000002	34.86366666666667
729	-1.2213	36.89618333333333
773	-1.3586666666666667	36.7055
112	-1.3586666666666667	36.7055
471	-3.3078333333333334	40.0175
491	-3.3001666666666667	39.98566666666667
779	-3.259333333333333	39.975
311	-3.3215	39.923
357	-3.2640000000000002	39.97666666666667
480	-3.1439833333333334	40.12701666666667
852	-3.3215	39.8895
381	-2.422	37.945166666666665
622	-2.422	37.945166666666665
812	-3.3215	39.8895
207	-3.3078333333333334	40.0175
207	-4.336166666666666	39.523666666666664
43	-3.3078333333333334	40.0175
513	-3.3001666666666667	39.98566666666667
739	-3.3415	40.02766666666667
250	-1.246	36.81616666666667
431	-1.3661666666666665	36.716166666666666
347	-0.14966666666666667	35.25853333333333
299	0.224	34.89066666666667
231	0.20566666666666666	34.892833333333336
319	0.23550000000000001	34.8645
850	-0.12833333333333333	35.278166666666664
558	-0.12833333333333333	35.278166666666664
867	-0.12833333333333333	35.278166666666664
295	0.23550000000000001	34.8645
620	0.23550000000000001	34.8645
599	-0.1451666666666667	35.25416666666667
40	-0.14966666666666667	35.2585
788	-0.13333333333333333	35.28333333333333
446	-0.14966666666666667	35.2585
741	-0.006849999999999999	35.5562
290	-0.1451666666666667	35.25416666666667
627	0.224	34.89066666666667
290	0.23550000000000001	34.8645
770	0.23600000000000002	34.86366666666667
851	-1.0198333333333334	36.60316666666667
743	-1.0198333333333334	36.60316666666667
859	-1.2313333333333334	36.76416666666667
709	-1.274	36.813833333333335
309	-1.274	36.813833333333335
90	-2.4514	37.92655
640	-4.1825	39.44083333333333
805	-2.6921666666666666	38.1826
111	-3.3001666666666667	39.98566666666667
461	-3.3078333333333334	40.0175
547	-3.3001666666666667	39.98566666666667
435	-2.996	38.459666666666664
542	-3.3001666666666667	39.98566666666667
414	-3.3415	40.02766666666667
822	-4.1825	39.44083333333333
879	-2.6935333333333333	38.167183333333334
599	-1.2213333333333334	36.896166666666666
346	-1.2408333333333332	36.787333333333336
666	-0.12833333333333333	35.278216666666665
517	0.20566666666666666	34.892833333333336
670	-0.12833333333333333	35.278166666666664
699	0.20566666666666666	34.892833333333336
299	0.23550000000000001	34.8645
40	-0.12833333333333333	35.278166666666664
770	0.23550000000000001	34.8645
552	0.23550000000000001	34.8645
119	-0.12833333333333333	35.278166666666664
290	-0.12833333333333333	35.278216666666665
151	-0.12833333333333333	35.278166666666664
208	0.224	34.89066666666667
605	0.23550000000000001	34.8645
666	0.25466666666666665	34.856
299	0.22766666666666666	34.885333333333335
814	0.20566666666666666	34.892833333333336
792	-4.180483333333333	39.42268333333333
40	-4.324833333333333	39.5245
477	-3.322	39.958
852	-3.3215	39.923
29	-3.3001666666666667	39.98566666666667
303	-3.322	39.958
712	-4.324833333333333	39.5245
766	-4.180483333333333	39.42268333333333
414	-3.1571666666666665	40.134166666666665
347	-4.303833333333333	39.55558333333333
640	-4.183833333333333	39.440666666666665
334	0.2526	34.86125
347	-0.12833333333333333	35.278166666666664
754	0.20566666666666666	34.892833333333336
572	0.219	34.896
743	-1.03605	36.601083333333335
200	0.20566666666666666	34.892833333333336
630	0.20566666666666666	34.892833333333336
490	0.219	34.896
299	0.20566666666666666	34.892833333333336
763	-0.12833333333333333	35.278166666666664
666	-0.12833333333333333	35.278166666666664
12	-3.3001666666666667	39.98566666666667
539	-2.44765	37.922466666666665
706	-4.1805	-39.422666666666665
778	-3.322	39.958
714	-3.322	39.958
848	-4.333666666666667	39.563833333333335
265	-4.178	39.4445
32	-3.3078333333333334	40.0175
819	-4.395166666666666	39.547333333333334
524	-3.3001666666666667	39.98566666666667
806	-4.395166666666666	39.547333333333334
714	-3.3001666666666667	39.98566666666667
764	-4.395166666666666	39.547333333333334
297	-3.8310166666666667	39.6858
107	-1.3661666666666665	36.716166666666666
596	-0.952	36.6905
746	-0.1225	35.270833333333336
699	0.22816666666666666	34.885333333333335
231	0.25266666666666665	34.861333333333334
358	0.22766666666666666	34.885333333333335
664	0.25266666666666665	34.861333333333334
28	0.2285	34.8875
222	0.219	34.896
850	0.21766666666666667	34.89966666666667
347	-0.14783333333333332	35.26283333333333
40	-0.15808333333333333	35.25
754	0.22766666666666666	34.86833333333333
754	0.22816666666666666	34.885333333333335
552	0.22766666666666666	34.885333333333335
763	-0.2349166666666667	35.54451666666667
490	0.2285	34.8875
511	0.219	34.896
288	-0.2349166666666667	35.54451666666667
90	-2.417116666666667	37.95041666666667
79	-2.7042166666666665	38.17876666666667
341	-3.1465666666666667	40.12801666666667
395	-3.1465	40.128
46	-4.199	39.413333333333334
195	-3.1580166666666667	40.1347
40	-4.492383333333334	39.2547
120	-3.321833333333333	39.95783333333333
879	-4.4036333333333335	39.54396666666667
267	-4.492333333333334	-39.254666666666665
849	-4.329283333333334	39.5258
748	-4.181666666666667	39.422333333333334
706	-4.199	39.413333333333334
120	-3.3208	39.88746666666667
110	-4.199	39.413333333333334
492	-3.3208	39.88746666666667
529	-3.2986833333333334	40.00128333333333
374	-3.321833333333333	39.95783333333333
175	-3.3093333333333335	40.017833333333336
395	-4.198916666666666	39.41325
796	-4.395166666666666	39.547333333333334
856	-4.1962	39.41298333333334
625	-3.3434166666666667	40.02786666666667
714	-3.3208	39.88746666666667
485	-2.4169833333333335	37.95265
223	-4.395166666666666	39.547333333333334
265	-4.1825	39.44083333333333
712	-4.3293333333333335	39.52583333333333
794	-0.9721666666666666	36.6965
351	-0.9616333333333333	36.68801666666667
141	-1.274	36.813833333333335
697	-0.9721666666666666	36.6965
703	-0.9721666666666666	36.6965
591	-0.9616333333333333	36.68801666666667
642	-0.9721666666666666	36.6965
88	-1.246	36.81616666666667
763	-0.23616666666666666	35.549166666666665
695	-0.12561666666666665	35.270783333333334
734	-0.23616666666666666	35.549166666666665
366	-0.12616666666666668	35.2719
874	0.25266666666666665	34.861333333333334
487	0.23550000000000001	34.8645
511	0.25466666666666665	34.856
743	0.22766666666666666	34.885333333333335
288	-0.23616666666666666	35.549166666666665
511	0.23550000000000001	34.8645
28	0.22766666666666666	34.885333333333335
667	-0.23613333333333333	35.549166666666665
308	-1.2566833333333334	36.8004
465	-0.9721666666666666	36.6965
637	-0.9721666666666666	36.6965
42	0.25266666666666665	34.861333333333334
53	0.25266666666666665	34.861333333333334
256	0.25266666666666665	34.861333333333334
511	0.22766666666666666	34.885333333333335
743	-0.23616666666666666	35.549166666666665
474	-4.488666666666667	39.2545
725	-4.355833333333333	39.56183333333333
175	-3.362816666666667	40.00593333333333
175	-4.355766666666667	39.56178333333333
195	-3.362816666666667	40.00593333333333
524	-3.3056166666666664	40.01351666666667
824	-4.488666666666667	39.2545
311	-3.3216666666666668	39.889466666666664
386	-4.4763	39.48811666666667
232	-4.461	39.3945
264	-4.463166666666667	39.403333333333336
15	-3.3078333333333334	40.0175
793	-4.463166666666667	39.403333333333336
175	-3.3216666666666668	39.954
225	-3.1347833333333335	40.1338
724	-4.4805166666666665	39.48343333333333
806	-4.4751666666666665	39.48916666666667
524	-3.3216666666666668	39.954
524	-3.1348333333333334	40.133833333333335
166	-3.1574666666666666	40.135933333333334
414	-3.1567166666666666	40.136066666666665
166	-4.472283333333333	39.49325
37	-4.460916666666667	39.3945
353	-4.463166666666667	39.403333333333336
161	-3.3078333333333334	40.0175
431	-3.1574666666666666	40.135933333333334
86	-4.463166666666667	39.403333333333336
255	-4.475133333333333	39.48916666666667
230	-3.1348333333333334	40.133833333333335
725	-3.379016666666667	39.98908333333333
724	-3.379016666666667	39.98908333333333
205	-4.4735	39.490633333333335
226	-3.1474166666666665	40.12623333333333
638	-4.463166666666667	39.403333333333336
147	-3.3865833333333333	39.902633333333334
284	-3.386216666666667	39.90076666666667
178	-1.3634833333333334	36.7258
178	-1.3653666666666666	36.713883333333335
167	-1.3655	36.71768333333333
696	-1.3655	36.71768333333333
139	-1.3634833333333334	36.7258
138	-1.274	36.813833333333335
519	-0.9721666666666666	36.6965
817	-0.9721666666666666	36.6965
754	-0.9721666666666666	36.6965
596	-0.9721666666666666	36.6965
794	-0.96165	36.68808333333333
759	-0.9721666666666666	36.6965
695	-0.9721666666666666	36.6965
414	-3.3407333333333336	40.027366666666666
232	-4.406166666666667	39.471
175	-3.321833333333333	39.95783333333333
523	-2.6799	38.1519
524	-3.4646333333333335	39.89525
815	-2.6799	38.1519
414	-3.1971333333333334	39.925916666666666
175	-3.3407333333333336	40.027366666666666
147	-4.198333333333333	39.4125
523	-3.302	38.518033333333335
524	-3.19545	39.92561666666667
226	-3.1348333333333334	40.133833333333335
358	-4.463166666666667	39.403333333333336
545	-4.199	39.413333333333334
730	-4.198333333333333	39.4125
104	-3.3415	40.02746666666667
386	-4.355833333333333	39.56183333333333
456	-4.463166666666667	39.403333333333336
226	-3.1928666666666667	39.9256
597	-3.3407333333333336	40.027366666666666
225	-3.1348333333333334	40.133833333333335
717	-3.3001666666666667	39.98566666666667
504	-2.4133666666666667	37.930733333333336
278	-3.3078333333333334	40.0175
209	-3.2975	39.98566666666667
307	-4.1974833333333335	39.41376666666667
576	-4.279	39.59316666666667
616	-3.2974666666666668	39.98558333333333
403	-4.355833333333333	39.56183333333333
597	-3.1934	39.92443333333333
244	-1.3635	36.71281666666667
178	-1.3635	36.71281666666667
119	-1.3657	36.714733333333335
289	-1.36595	36.71746666666667
167	-1.3635	36.71281666666667
428	-0.11983333333333333	35.272
743	-0.13258333333333333	35.27896666666667
518	-0.13266666666666665	35.279
877	-0.13266666666666665	35.279
256	0.20616666666666666	34.89366666666667
43	0.23600000000000002	34.86366666666667
43	0.22766666666666666	34.885333333333335
518	0.20618333333333333	34.893683333333335
597	0.21958333333333335	34.88961666666667
746	-0.11983333333333333	35.272
850	-0.2624666666666667	35.15591666666667
789	-1.274	36.813833333333335
760	-1.274	36.813833333333335
545	-4.1578	39.41523333333333
354	-3.3204000000000002	39.970616666666665
712	-4.4875	39.256166666666665
524	-3.1439833333333334	40.12701666666667
664	-4.1825	39.44083333333333
12	-4.4875	39.256166666666665
268	-3.3078333333333334	40.0175
105	-3.2939	39.98388333333333
230	-3.263333333333333	39.974333333333334
36	-4.1825	39.44083333333333
258	-3.2533333333333334	39.9768
40	-3.2533333333333334	39.9768
582	-4.487466666666666	39.25621666666667
717	-3.2029666666666667	39.927083333333336
94	-3.1572	40° 08.051
749	-3.1439833333333334	40.12701666666667
725	-4.4763	39.48811666666667
77	-4.463166666666667	39.403333333333336
524	-3.623866666666667	39.856366666666666
575	-3.2029666666666667	39.927083333333336
597	-4.487466666666666	39.25621666666667
793	-4.177566666666666	39.4446
357	-3.2633	39.974383333333336
225	-3.4064	38.55453333333333
226	-3.4064	38.55453333333333
455	-3.2025333333333332	39.93281666666667
413	-4.1805	39.422666666666665
278	-3.3130166666666665	39.98138333333333
142	-2.2715666666666667	37.81111666666666
669	-3.1572	40° 08.051
101	-3.1473333333333335	40.12616666666667
178	-1.3661666666666665	36.716166666666666
9	-1.3661666666666665	36.716166666666666
581	-1.2407833333333333	36.787283333333335
877	-1.2408333333333332	36.787333333333336
218	-1.2432833333333333	36.7922
518	-1.2432833333333333	36.7922
382	-1.1335666666666666	36.946133333333336
309	-1.0853166666666667	36.9375
852	-1.2601666666666667	36.82933333333333
299	-1.2601666666666667	36.82933333333333
516	-1.0916833333333333	36.947433333333336
777	-1.2601666666666667	36.82933333333333
690	-1.2601666666666667	36.82933333333333
268	-1.2601666666666667	36.82933333333333
516	-1.2474833333333333	36.8219
9	-1.2474833333333333	36.8219
299	-1.3166166666666665	36.743233333333336
852	-1.3128833333333334	36.73956666666667
773	-1.313	36.74033333333333
310	-1.3111666666666668	36.73683333333334
664	-1.3136666666666668	36.73133333333333
493	-1.3111666666666668	36.73683333333334
512	-1.3136666666666668	36.73133333333333
159	-1.3136666666666668	36.73133333333333
57	-1.3128833333333334	36.73956666666667
731	-1.3136666666666668	36.73133333333333
851	-1.3136666666666668	36.73133333333333
596	-1.3136666666666668	36.73133333333333
9	-1.238	36.794333333333334
817	-1.238	36.794333333333334
731	-1.238	36.794333333333334
756	-1.2380499999999999	36.794333333333334
743	-1.238	36.794333333333334
453	0.9741666666666667	36.69716666666667
612	0.9741666666666667	36.69716666666667
637	0.9741666666666667	36.69716666666667
470	0.9741666666666667	36.69716666666667
817	0.9741666666666667	36.69716666666667
579	0.9741666666666667	36.69716666666667
465	0.9741666666666667	36.69716666666667
26	0.9741666666666667	36.69716666666667
759	0.9741666666666667	36.69716666666667
794	0.9741666666666667	36.69716666666667
477	-1.2601666666666667	36.82933333333333
851	-1.2601666666666667	36.82933333333333
309	-1.2601666666666667	36.82933333333333
355	-0.9700000000000001	36.69466666666667
612	-0.9700000000000001	36.69466666666667
604	-0.9700000000000001	36.694716666666665
470	-0.9700000000000001	36.69466666666667
643	-0.9700000000000001	36.69466666666667
763	-0.9700000000000001	36.694716666666665
817	-0.9700000000000001	36.69466666666667
532	0.23600000000000002	34.86366666666667
597	0.21833333333333332	34.901
231	0.23600000000000002	34.86366666666667
605	0.23600000000000002	34.86366666666667
28	0.23600000000000002	34.86366666666667
169	-0.11983333333333333	35.272
290	0.23600000000000002	34.86366666666667
737	0.21833333333333332	34.901
763	0.23600000000000002	34.86366666666667
825	0.23600000000000002	34.86366666666667
627	-0.11983333333333333	35.272
615	0.23600000000000002	34.86366666666667
176	-3.4007	38.54901666666667
290	-4.4875	39.256166666666665
837	-3.2415	39.71183333333333
104	-4.1825	39.44083333333333
683	-4.406166666666667	39.471
529	-3.2415	39.71183333333333
209	-4.3293333333333335	39.52583333333333
36	-4.3293333333333335	39.52583333333333
207	-4.3293333333333335	39.52583333333333
686	-3.3166666666666664	39.95
836	-3.2415	39.71183333333333
312	-4.1825	39.44083333333333
592	-3.3166666666666664	39.95
414	-3.3166666666666664	39.95
257	-3.1566666666666667	40.134166666666665
524	-3.1186666666666665	40.145916666666665
617	-4.3293333333333335	39.52583333333333
268	-4.1825	39.44083333333333
358	-4.1825	39.44083333333333
582	-4.406166666666667	39.471
63	-3.1566666666666667	40.134166666666665
311	-3.1566666666666667	40.134166666666665
610	-4.406166666666667	39.471
562	-3.3166666666666664	39.95
307	-3.1186666666666665	40.145916666666665
29	-4.1825	39.44083333333333
402	-3.1566666666666667	40.134166666666665
113	-3.1566666666666667	40.134166666666665
653	-3.1566666666666667	40.134166666666665
789	-3.3166666666666664	39.95
203	-3.2415333333333334	39.71175
449	-1.2337333333333333	36.79425
516	-1.2433333333333334	36.79216666666667
743	-1.3136666666666668	36.73133333333333
567	-0.8918333333333333	36.32216666666667
851	-0.8918333333333333	36.32216666666667
366	-1.2211666666666667	36.89633333333333
639	-1.274	36.813833333333335
178	-1.24975	36.82111666666667
518	-1.2344166666666667	36.7762
596	0.20566666666666666	34.892833333333336
319	0.219	34.896
518	0.21258333333333335	34.923833333333334
358	0.224	34.89066666666667
825	0.23550000000000001	34.8645
877	-0.1332	35.27921666666667
119	-0.2625	35.155483333333336
597	-0.1332	35.27921666666667
448	0.19748333333333334	35.024766666666665
664	0.219	34.896
231	0.23550000000000001	34.8645
490	0.2122	34.923833333333334
518	-0.1366	35.281016666666666
580	-1.2601666666666667	36.82933333333333
282	-1.2433333333333334	36.79216666666667
225	-1.2211666666666667	36.89633333333333
516	-1.246	36.81616666666667
518	-1.2513666666666667	36.7463
516	-1.2513666666666667	36.7463
140	-1.2513666666666667	36.7463
34	-4.325	39.523666666666664
297	-4.237833333333334	39.39566666666666
80	-3.1546666666666665	40.134166666666665
706	-3.4208333333333334	39.89816666666667
205	-3.1546666666666665	40.134166666666665
748	-4.325	39.523666666666664
477	-3.3093333333333335	40.018
413	-4.488666666666667	39.2545
837	-3.3213333333333335	39.92583333333333
477	-4.398833333333333	39.532666666666664
29	-3.4208333333333334	39.89816666666667
488	-4.488666666666667	39.2545
142	-3.1546666666666665	40.134166666666665
868	-3.3213333333333335	39.92583333333333
36	-3.1546	40.1341
195	-3.1546666666666665	40.134166666666665
504	-4.325	39.523666666666664
12	-3.3093333333333335	40.018
114	-3.3093333333333335	40.018
851	-3.3093333333333335	40.018
714	-3.4208333333333334	39.89816666666667
845	-4.325	39.523666666666664
529	-4.488666666666667	39.2545
484	-3.3213333333333335	39.92583333333333
868	-3.1546666666666665	40.134166666666665
806	-4.398833333333333	39.532666666666664
99	-4.398833333333333	39.532666666666664
597	-4.488666666666667	39.2545
167	0.9741666666666667	36.69716666666667
773	-1.3639999999999999	36.713166666666666
159	-1.3639999999999999	36.713166666666666
877	-1.3639166666666667	36.7132
758	-1.3639166666666667	36.7132
871	-0.23755	37.565133333333335
817	-0.5191666666666667	37.41983333333334
449	-0.5122166666666667	37.412683333333334
642	-0.20935	37.50338333333333
697	-0.20935	37.50338333333333
734	-0.23593333333333336	37.5504
591	-0.23593333333333336	37.5504
537	-0.23745	37.58058333333334
756	-0.5122166666666667	37.412683333333334
141	-0.5191666666666667	37.41983333333334
859	-0.5122166666666667	37.412683333333334
743	-0.5191666666666667	37.41983333333334
612	-0.23593333333333336	37.5504
249	-0.20935	37.50338333333333
596	0.22103333333333333	34.89001666666667
123	0.20566666666666666	34.892833333333336
518	0.20566666666666666	34.892833333333336
518	0.20761666666666667	34.93286666666667
167	-0.26280000000000003	35.5884
556	0.21833333333333332	34.901
174	0.23550000000000001	34.8645
135	0.23550000000000001	34.8645
664	0.23550000000000001	34.8645
557	0.23550000000000001	34.8645
677	0.23550000000000001	34.8645
552	-0.26280000000000003	35.5884
770	0.22766666666666666	34.885333333333335
518	0.02625	35.19835
738	-0.1332	35.27921666666667
159	0.23333333333333334	35.544533333333334
268	-0.26280000000000003	35.5884
664	0.20566666666666666	34.892833333333336
763	0.23333333333333334	35.544533333333334
518	-0.1332	35.27921666666667
40	-0.1577	35.2583
208	0.20583333333333334	34.88133333333333
25	0.22766666666666666	34.885333333333335
177	-1.1022666666666667	36.6943
859	1.1	36.69433333333333
662	-1.1059166666666667	36.6814
140	-1.1022666666666667	36.6943
140	-1.1059166666666667	36.6814
123	-1.1059166666666667	36.6814
93	-1.1022666666666667	36.6943
754	-1.1022666666666667	36.6943
703	0.9741666666666667	36.69716666666667
697	0.9741666666666667	36.69716666666667
604	0.9741666666666667	36.69716666666667
656	0.9741666666666667	36.69716666666667
759	-0.9781166666666666	36.69793333333333
591	0.9741666666666667	36.69716666666667
758	-1.3645	36.712833333333336
773	-1.3664	36.71536666666667
800	-1.3663333333333334	36.715333333333334
282	-1.2601666666666667	36.82933333333333
221	-1.2601666666666667	36.82933333333333
366	-0.26799999999999996	35.532716666666666
366	-0.4002	36.24913333333333
596	0.21816666666666668	34.888
673	-0.39635	36.24633333333333
835	-0.265	35.538333333333334
696	0.21741666666666667	34.90128333333333
469	0.21833333333333332	34.901
734	-0.26548333333333335	35.5381
754	0.21833333333333332	34.901
763	0.2301	34.86638333333333
231	0.224	34.89066666666667
743	-0.26808333333333334	35.53325
696	-0.26808333333333334	35.53325
136	0.224	34.89066666666667
633	0.21833333333333332	34.901
320	0.21833333333333332	34.901
163	0.21741666666666667	34.90128333333333
135	0.23016666666666669	34.86633333333333
627	0.21833333333333332	34.901
358	0.23550000000000001	34.8645
630	0.2165	34.88466666666667
518	-0.26799999999999996	35.532716666666666
609	-0.26808333333333334	35.53325
877	0.2271	34.88036666666667
308	-0.26799999999999996	35.532716666666666
537	-0.42416666666666664	37.54516666666667
92	-0.427	37.54716666666667
236	-0.42416666666666664	37.54516666666667
711	-0.5178333333333334	37.421166666666664
662	-0.42416666666666664	37.54516666666667
355	-0.427	37.54716666666667
591	-0.427	37.54716666666667
325	-0.4248	37.5453
145	-0.42416666666666664	37.54516666666667
543	-0.42411666666666664	37.54521666666667
694	-0.2376	37.5654
444	-0.2376	37.5654
19	-0.2376	37.5654
794	-0.2376	37.5654
453	-0.427	37.54716666666667
527	-0.427	37.54716666666667
740	-0.427	37.54716666666667
758	-0.427	37.54716666666667
859	-0.23685	37.56978333333333
296	-0.42416666666666664	37.54516666666667
24	-0.5178333333333334	37.421166666666664
479	-0.2376	37.5654
654	-0.5178333333333334	37.421166666666664
823	-0.5178333333333334	37.421166666666664
28	-0.427	37.54716666666667
591	-0.2376	37.5654
696	-0.2376	37.5654
640	-0.42693333333333333	37.54723333333333
592	-30.321833333333334	39.957
545	-3.299	39.99836666666667
678	-4.135	39.4675
371	-4.463166666666667	39.403333333333336
454	-3.3211666666666666	39.923833333333334
358	-4.244666666666666	39.42166666666667
785	-4.274166666666667	39.43266666666667
636	-4.463166666666667	39.403333333333336
407	-3.299	39.99836666666667
77	-4.325	39.523666666666664
247	-4.488	39.2555
569	-4.237833333333334	39.39566666666666
764	-3.263933333333333	39.97501666666667
427	-4.244666666666666	39.42166666666667
848	-3.154516666666667	40.13661666666667
335	-3.154516666666667	40.13661666666667
617	-30.321833333333334	39.957
209	-4.463166666666667	39.403333333333336
369	-4.325	39.523666666666664
252	-3.3211666666666666	39.923833333333334
682	-4.237833333333334	39.39566666666666
586	-3.3211666666666666	39.923833333333334
592	-4.517516666666666	39.22781666666667
659	-4.244666666666666	39.42166666666667
87	-3.2779	39.98968333333333
821	-3.299	39.99836666666667
485	-3.299	39.99836666666667
454	-4.488	39.2555
239	-3.154516666666667	40.13661666666667
664	-4.244666666666666	39.42166666666667
526	-3.431166666666667	39.896
261	-4.274166666666667	39.43266666666667
43	-4.244666666666666	39.42166666666667
802	-3.431166666666667	39.896
247	-3.2779	39.98968333333333
474	-4.274166666666667	39.43266666666667
777	-4.274166666666667	39.43266666666667
2	-3.3055666666666665	4.016066666666666
225	-2.2945166666666665	37.83285
632	-3.431166666666667	39.896
569	-4.244666666666666	39.42166666666667
670	-30.321833333333334	39.957
496	-3.1571666666666665	40° 08.05
166	-3.7670500000000002	39.18425
386	-4.475066666666667	39.489583333333336
858	-3.299	39.99836666666667
793	-4.244666666666666	39.42166666666667
387	-3.3078333333333334	40.0175
54	-4.4722	39.48486666666667
86	-4.48795	39.255516666666665
575	-4.134933333333334	39.46803333333333
450	-4.244666666666666	39.42166666666667
214	-4.5188	39.2249
354	-3.158	40.13466666666667
78	-4.463166666666667	39.403333333333336
61	-3.1571666666666665	40° 08.05
69	-4.135	39.4675
101	-2.5983666666666667	38.077533333333335
448	-0.20313333333333333	37.49285
447	-0.5468166666666666	37.42225
642	-0.20946666666666666	37.50363333333333
696	-0.23438333333333333	37.555483333333335
720	-0.19968333333333332	37.48843333333333
689	-0.42416666666666664	37.54516666666667
697	-0.22516666666666665	37.52283333333333
703	-0.20191666666666666	37.49185
318	-0.42416666666666664	37.54516666666667
19	-0.42416666666666664	37.54516666666667
640	-0.42416666666666664	37.54516666666667
512	-0.5178333333333334	37.421166666666664
702	-0.22516666666666665	37.52283333333333
591	-0.42416666666666664	37.54516666666667
637	-0.20758333333333334	37.501133333333335
135	-0.5178333333333334	37.421166666666664
871	-0.42416666666666664	37.54516666666667
656	-0.22516666666666665	37.52283333333333
181	-0.5178333333333334	37.421166666666664
71	-0.22516666666666665	37.52283333333333
599	-3.3721666666666668	38.345
254	-3.3721666666666668	38.345
646	-3.3721666666666668	38.345
236	-3.3721666666666668	38.345
337	-3.3721666666666668	38.345
45	-3.3721666666666668	38.345
144	-3.3721666666666668	38.345
817	-3.3590666666666666	38.3379
473	-3.3721666666666668	38.345
231	-3.3721666666666668	38.345
662	-3.3721666666666668	38.345
91	-3.361083333333333	38.34513333333334
645	-3.3721666666666668	38.345
794	-3.3721666666666668	38.345
593	-3.3721666666666668	38.345
572	-3.3721666666666668	38.345
146	-3.361083333333333	38.34513333333334
145	-0.427	37.54716666666667
318	-0.427	37.54716666666667
689	-0.427	37.54716666666667
377	-0.427	37.54716666666667
296	-0.427	37.54716666666667
604	-0.427	37.54716666666667
697	-0.427	37.54716666666667
537	-0.427	37.54716666666667
694	-0.23821666666666666	37.5648
591	-0.23821666666666666	37.5648
28	-0.23821666666666666	37.5648
656	-0.23866666666666667	37.56335
444	-0.23855	37.563316666666665
666	-0.20245	37.49203333333333
720	-0.20245	37.49203333333333
448	-0.20181666666666667	37.49183333333333
741	-0.20181666666666667	37.49183333333333
28	-0.5178333333333334	37.421166666666664
453	-0.5178333333333334	37.421166666666664
449	-0.5178333333333334	37.421166666666664
490	0.23550000000000001	34.8645
132	-4.488666666666667	39.2545
605	-3.3543333333333334	38.343
8	-3.3543333333333334	38.343
175	-4.395166666666666	39.547333333333334
764	-4.406166666666667	39.471
277	-4.461	39.3945
104	-4.395166666666666	39.547333333333334
391	-4.237833333333334	39.39566666666666
207	-4.461	39.3945
12	-4.406166666666667	39.471
732	-4.325	39.523666666666664
453	-3.3721666666666668	38.345
640	-4.461	39.3945
40	-4.175166666666667	39.453
57	-3.3543333333333334	38.343
514	-4.461	39.3945
793	-4.461	39.3945
868	-4.134833333333333	39.468333333333334
91	-3.3543333333333334	38.343
619	-4.237833333333334	39.39566666666666
817	-3.3543333333333334	38.343
732	-4.134833333333333	39.468333333333334
518	-3.3993333333333333	38.36
657	-4.406166666666667	39.471
573	-4.175166666666667	39.453
445	-4.406166666666667	39.471
12	-4.488666666666667	39.2545
509	-4.461	39.3945
712	-4.488666666666667	39.2545
252	-3.3543333333333334	38.343
582	-4.488666666666667	39.2545
144	-3.3543333333333334	38.343
790	-3.3993333333333333	38.36
496	-4.488666666666667	39.2545
683	-4.325	39.523666666666664
758	-3.3543333333333334	38.343
288	-3.3721666666666668	38.345
427	-4.237833333333334	39.39566666666666
521	-4.406166666666667	39.471
831	-4.395166666666666	39.547333333333334
823	-4.488666666666667	39.2545
372	-4.175166666666667	39.453
514	-4.325	39.523666666666664
395	-4.395166666666666	39.547333333333334
157	-4.325	39.523666666666664
601	-4.488666666666667	39.2545
232	-4.325	39.523666666666664
147	-4.406166666666667	39.471
601	-4.333666666666667	39.563833333333335
147	-4.461	39.3945
601	-4.395166666666666	39.547333333333334
209	-4.406166666666667	39.471
30	-4.333666666666667	39.563833333333335
617	-4.461	39.3945
662	-3.3543333333333334	38.343
207	-4.325	39.523666666666664
601	-4.325	39.523666666666664
159	-4.406166666666667	39.471
30	-4.325	39.523666666666664
209	-4.461	39.3945
412	-4.395166666666666	39.547333333333334
373	-4.395166666666666	39.547333333333334
601	-4.303833333333333	39.55566666666667
681	-4.395166666666666	39.547333333333334
209	-4.325	39.523666666666664
793	-4.237833333333334	39.39566666666666
732	-4.395166666666666	39.547333333333334
564	-3.3721666666666668	38.345
355	0.9741666666666667	36.69716666666667
612	-0.20616666666666666	37.49733333333333
543	-0.5178333333333334	37.421166666666664
222	-0.5178333333333334	37.421166666666664
690	-0.5178333333333334	37.421166666666664
667	-0.20318333333333335	37.49283333333333
92	-0.42416666666666664	37.54516666666667
790	-0.42406666666666665	37.54525
318	-0.42400000000000004	37.54533333333333
846	-0.5178333333333334	37.421166666666664
504	-0.42416666666666664	37.54516666666667
662	-0.42400000000000004	37.54533333333333
465	-0.2365	37.569
145	-0.42400000000000004	37.54533333333333
552	-0.20616666666666666	37.49733333333333
231	-0.42400000000000004	37.54533333333333
727	-0.20505	37.496383333333334
562	-0.42406666666666665	37.54525
690	-0.42416666666666664	37.54516666666667
14	-0.5178333333333334	37.421166666666664
167	-0.42406666666666665	37.54525
664	-0.42406666666666665	37.54525
470	-0.20505	37.496383333333334
453	-0.42416666666666664	37.54516666666667
770	-0.2365	37.569
794	-0.2365	37.569
850	0.9741666666666667	36.69716666666667
470	-0.9436333333333333	36.69603333333333
763	-0.9436333333333333	36.69603333333333
12	-0.9436333333333333	36.69603333333333
872	-4.244666666666666	39.42166666666667
509	-4.244666666666666	39.42166666666667
534	-4.237833333333334	39.39566666666666
664	-4.237833333333334	39.39566666666666
689	-4.257	39.382666666666665
264	-4.257	39.382666666666665
207	4.333333333333333	39.5215
664	-4.17765	39.44461666666667
412	-4.47225	39.451433333333334
712	-4.463166666666667	39.403333333333336
610	-4.244666666666666	39.42166666666667
548	-4.257	39.382666666666665
866	-3.555066666666667	38.74478333333333
433	-4.237833333333334	39.39566666666666
184	-4.237833333333334	39.39566666666666
36	-4.463166666666667	39.403333333333336
510	-4.237833333333334	39.39566666666666
29	-4.257	39.382666666666665
634	-4.237833333333334	39.39566666666666
370	-4.257	39.382666666666665
276	-4.257	39.382666666666665
312	-4.237833333333334	39.39566666666666
829	-4.17765	39.44461666666667
102	-4.257	39.382666666666665
411	-4.2616	39.37911666666667
392	-4.2671166666666664	39.59831666666667
793	-4.257	39.382666666666665
514	4.333333333333333	39.5215
714	4.333333333333333	39.5215
870	-4.237833333333334	39.39566666666666
12	-4.244666666666666	39.42166666666667
840	4.333333333333333	39.5215
870	-4.244666666666666	39.42166666666667
548	-4.237833333333334	39.39566666666666
822	-4.237833333333334	39.39566666666666
36	4.333333333333333	39.5215
187	-4.463166666666667	39.403333333333336
232	-4.463166666666667	39.403333333333336
783	-4.237833333333334	39.39566666666666
269	-4.244666666666666	39.42166666666667
764	-4.463166666666667	39.403333333333336
650	-4.237833333333334	39.39566666666666
426	-4.257	39.382666666666665
326	-4.244666666666666	39.42166666666667
102	-4.244666666666666	39.42166666666667
297	-4.25305	39.38303333333333
122	-4.237833333333334	39.39566666666666
610	-4.257	39.382666666666665
302	4.333333333333333	39.5215
776	-4.244666666666666	39.42166666666667
100	-4.2671166666666664	39.59831666666667
277	-4.257	39.382666666666665
640	-4.237833333333334	39.39566666666666
807	-4.23435	39.4166
732	4.333333333333333	39.5215
279	-3.39935	38.360033333333334
281	-3.3393333333333333	38.44716666666667
631	-3.35425	38.342983333333336
791	-3.3393333333333333	38.44716666666667
254	-3.3670666666666667	38.34466666666667
263	-3.3393333333333333	38.44716666666667
743	-3.367566666666667	38.34495
708	-3.3721666666666668	38.345
770	-3.3393333333333333	38.44716666666667
453	-3.3543333333333334	38.343
182	-3.3691666666666666	38.34545
572	-3.3393333333333333	38.44716666666667
627	-3.3779666666666666	38.34155
699	-3.3393333333333333	38.44716666666667
309	-3.3684	38.34526666666667
759	-3.366416666666667	38.344033333333336
296	-3.3393333333333333	38.44716666666667
645	-3.3393333333333333	38.44716666666667
646	-3.3393333333333333	38.44716666666667
851	-0.10916666666666666	37.037933333333335
505	0.29588333333333333	36.905883333333335
743	-0.10916666666666666	37.037933333333335
788	-0.112	37.039
733	-0.11925000000000001	37.08391666666667
219	0.2951166666666667	36.88121666666667
539	-0.112	37.039033333333336
855	-0.10916666666666666	37.037933333333335
252	-0.112	37.039
539	-0.12935	37.08688333333333
288	-1.1054833333333334	36.611533333333334
767	-0.9734999999999999	36.64183333333333
800	-1.0041666666666667	36.602383333333336
564	-0.9734999999999999	36.64183333333333
390	-0.9734999999999999	36.64183333333333
406	-1.1054833333333334	36.611533333333334
695	-0.9734499999999999	36.641866666666665
743	-0.112	37.039
167	-0.11620000000000001	37.06605
851	-0.12013333333333334	37.08578333333333
16	-0.5178333333333334	37.421166666666664
720	-0.34345	37.3148
504	-0.427	37.54716666666667
595	-0.5178333333333334	37.421166666666664
562	-0.42400000000000004	37.54533333333333
572	-0.427	37.54716666666667
794	-0.39866666666666667	37.309
827	-0.5178333333333334	37.421166666666664
522	-0.427	37.54716666666667
817	-0.5178333333333334	37.421166666666664
758	-0.42400000000000004	37.54533333333333
554	-0.42916666666666664	37.54516666666667
141	-0.5178333333333334	37.421166666666664
871	-0.42400000000000004	37.54533333333333
41	-0.42400000000000004	37.54533333333333
82	-0.3282166666666667	37.315333333333335
351	-0.33275	37.313966666666666
702	-0.3282166666666667	37.315333333333335
252	-0.3265166666666667	37.31595
640	-0.427	37.54716666666667
851	-0.11616666666666667	37.066
734	-0.11616666666666667	37.066
539	-0.11616666666666667	37.066
743	-0.11616666666666667	37.066
9	-0.11616666666666667	37.066
800	-0.11616666666666667	37.066
119	-0.11616666666666667	37.066
567	-0.11616666666666667	37.066
877	-0.11616666666666667	37.066
265	-4.237833333333334	39.39566666666666
265	-4.244666666666666	39.42166666666667
817	-4.2055	39.4402
104	-4.178483333333333	39.44396666666667
792	-4.1805	39.422666666666665
426	-4.237833333333334	39.39566666666666
856	-4.237833333333334	39.39566666666666
692	-4.244666666666666	39.42166666666667
640	-4.1785	39.444
222	-4.237833333333334	39.39566666666666
86	-4.1785	39.444
395	-4.178483333333333	39.44396666666667
23	-4.257	39.382666666666665
651	-4.237833333333334	39.39566666666666
799	-4.237833333333334	39.39566666666666
549	-4.237833333333334	39.39566666666666
638	-4.237833333333334	39.39566666666666
399	-4.1785	39.444
764	-4.237833333333334	39.39566666666666
664	-4.1785	39.444
272	-4.244666666666666	39.42166666666667
172	-4.257	39.382666666666665
91	-3.3721666666666668	38.345
474	-4.29365	39.3532
214	-4.1989	39.414633333333335
743	-3.3543333333333334	38.343
615	-3.3543333333333334	38.343
749	-3.3543333333333334	38.343
730	-4.257	39.382666666666665
263	-3.3721666666666668	38.345
411	-4.257	39.382666666666665
4	-3.3721666666666668	38.345
825	-4.257	39.382666666666665
748	-4.257	39.382666666666665
568	-4.257	39.382666666666665
153	-4.257	39.382666666666665
145	-3.3543333333333334	38.343
770	-3.3721666666666668	38.345
870	-4.257	39.382666666666665
845	-4.257	39.382666666666665
281	-3.3721666666666668	38.345
618	-3.3721666666666668	38.345
273	-4.257	39.382666666666665
796	-4.319566666666667	39.53661666666667
413	-4.257	39.382666666666665
640	-3.3543333333333334	38.343
859	-3.3721666666666668	38.345
663	-4.257	39.382666666666665
791	-3.3721666666666668	38.345
712	-4.257	39.382666666666665
127	-4.257	39.382666666666665
489	-0.4861666666666667	37.13816666666666
9	-0.1105	37.039833333333334
539	-0.1105	37.039833333333334
877	-0.11043333333333334	37.039833333333334
850	-0.11283333333333333	37.0375
359	-0.11043333333333334	37.039833333333334
673	-0.11283333333333333	37.0375
734	-0.1105	37.039833333333334
119	-0.1105	37.039833333333334
695	-0.9701833333333333	36.63986666666667
701	-0.9734999999999999	36.64183333333333
292	-0.9734999999999999	36.64183333333333
742	0.9741666666666667	36.69716666666667
249	-0.9701833333333333	36.63986666666667
876	-0.9734999999999999	36.64183333333333
763	-0.9734999999999999	36.64183333333333
743	-0.9734999999999999	36.64183333333333
448	-0.9866666666666667	36.68971666666667
323	-1.23755	36.76081666666666
217	-1.3639999999999999	36.713166666666666
139	-1.3639999999999999	36.713166666666666
2	-1.3639999999999999	36.713166666666666
405	-1.3639999999999999	36.713166666666666
323	-1.0383	36.7566
630	-1.0383	36.7566
571	-0.5626666666666666	37.69833333333333
851	-0.5178333333333334	37.421166666666664
588	-0.54715	37.702733333333335
817	-0.5596666666666666	37.6975
168	-0.38033333333333336	37.30983333333333
790	-0.5618166666666667	37.69903333333333
422	-0.5466333333333334	37.70296666666667
351	-0.21241666666666664	37.50885
518	-0.5178333333333334	37.421166666666664
465	-0.40549999999999997	37.31066666666667
71	-0.4055666666666667	37.31066666666667
702	-0.40549999999999997	37.31066666666667
323	-0.42443333333333333	37.55436666666667
656	-0.23166666666666666	37.534666666666666
119	-0.5471666666666667	37.702666666666666
697	-0.2365	37.569
794	-0.38033333333333336	37.30983333333333
323	-0.4750333333333333	37.50946666666667
697	-0.40549999999999997	37.31066666666667
225	-0.5434333333333333	37.70398333333333
871	-0.427	37.54716666666667
340	-0.5466333333333334	37.70296666666667
599	-0.5551166666666667	37.698283333333336
596	-0.23233333333333334	37.534616666666665
672	-0.5618166666666667	37.69903333333333
720	-0.38033333333333336	37.30983333333333
171	-0.38033333333333336	37.30983333333333
696	-0.40549999999999997	37.31066666666667
458	-0.5471666666666667	37.702666666666666
675	-0.5455833333333333	37.70341666666667
298	-1.2601666666666667	36.82933333333333
304	-1.2561333333333333	36.798833333333334
218	-0.11198333333333334	35.7245
600	-0.12783333333333333	35.25933333333333
733	-0.2389	35.547133333333335
288	-0.23486666666666667	35.54456666666667
696	-0.23483333333333334	35.5445
390	-0.12056666666666667	35.70583333333333
743	-0.11198333333333334	35.7245
765	-0.11198333333333334	35.7245
323	-0.07959999999999999	35.40918333333333
763	-0.12013333333333334	35.70665
238	-0.23518333333333336	35.55735
877	-0.23486666666666667	35.54456666666667
728	-0.7329666666666667	36.43598333333333
763	-0.23486666666666667	35.54456666666667
463	-0.23483333333333334	35.5445
64	-0.14825	35.018
761	-0.11203333333333335	35.7117
720	-0.11198333333333334	35.7245
159	-0.23486666666666667	35.54456666666667
308	-0.23883333333333334	35.54716666666667
418	-0.23486666666666667	35.54456666666667
877	-0.23483333333333334	35.5445
630	-0.14215	35.413833333333336
539	-0.1145	37.054833333333335
9	-0.07945	37.08845
734	-0.112	37.039
564	-0.10606666666666667	37.14318333333333
249	-0.11283333333333333	37.0375
233	-0.10606666666666667	37.14318333333333
612	-0.10748333333333333	37.14755
345	-1.5011166666666667	35.41766666666667
734	-1.5011166666666667	35.41766666666667
126	-1.2139333333333333	36.893966666666664
478	-1.2129833333333333	36.896166666666666
604	-0.3843333333333333	37.373
696	-0.3843333333333333	37.373
697	-0.3843333333333333	37.373
817	-0.427	37.54716666666667
167	-0.427	37.54716666666667
163	-0.5178333333333334	37.421166666666664
871	-0.9733333333333333	36.64183333333333
564	-0.9733333333333333	36.64183333333333
695	-0.9733333333333333	36.64183333333333
292	-0.9733333333333333	36.64183333333333
390	-0.9733333333333333	36.64183333333333
604	-0.9733333333333333	36.64183333333333
405	-0.9733333333333333	36.64183333333333
701	-0.9733333333333333	36.64183333333333
424	-0.9733333333333333	36.64183333333333
167	-0.9733333333333333	36.64183333333333
470	-0.9733333333333333	36.64183333333333
351	-0.9733333333333333	36.64183333333333
742	-0.9721666666666666	36.6965
330	-0.1145	37.054833333333335
733	-0.1145	37.054833333333335
119	-0.1145	37.054833333333335
673	-0.1145	37.054833333333335
538	-0.1145	37.054833333333335
128	-0.3843333333333333	37.373
871	-0.3843333333333333	37.373
128	-0.427	37.54716666666667
697	-0.38033333333333336	37.30983333333333
767	-0.35395	37.60306666666666
661	-0.35395	37.60306666666666
282	-0.35395	37.60306666666666
817	-0.35395	37.60306666666666
446	-0.35285	37.60135
596	-0.35285	37.60135
740	-0.35096666666666665	37.5966
763	-0.35096666666666665	37.5966
163	-0.35096666666666665	37.5966
627	-0.351	37.596666666666664
578	-0.351	37.596666666666664
19	-0.351	37.596666666666664
20	-0.427	37.54716666666667
196	-0.7886333333333333	37.2646
523	-0.7886333333333333	37.2646
81	-0.7886333333333333	37.2646
142	-0.7886333333333333	37.2646
732	-0.7889833333333333	37.25898333333333
838	-0.7883166666666667	37.26068333333333
597	-0.35096666666666665	37.5966
773	-1.24	36.844166666666666
167	-1.24	36.844166666666666
800	-1.24	36.844166666666666
567	-1.24	36.844166666666666
539	-1.24	36.844166666666666
448	-0.17556666666666668	35.618833333333335
743	0.45883333333333337	34.85803333333333
679	0.45883333333333337	34.85803333333333
180	1.0352	34.82071666666667
817	1.0397333333333334	34.793816666666665
309	1.0288333333333333	34.754666666666665
168	1.03285	34.74465
390	1.03955	34.730466666666665
741	1.03955	34.730466666666665
761	1.03955	34.730466666666665
497	1.03955	34.730466666666665
817	1.0941833333333333	35.11826666666666
672	1.0941833333333333	35.11826666666666
877	1.0941833333333333	35.11826666666666
244	1.0941666666666667	35.11833333333333
767	1.0941666666666667	35.11833333333333
453	1.0941666666666667	35.11833333333333
788	1.0941666666666667	35.11833333333333
671	1.0941666666666667	35.11833333333333
720	1.0941666666666667	35.11833333333333
608	1.0941666666666667	35.11833333333333
26	1.0941666666666667	35.11833333333333
512	1.0941666666666667	35.11833333333333
763	1.0879666666666667	35.1198
286	1.088	35.11983333333333
88	1.0941833333333333	35.11826666666666
448	1.0481666666666667	34.7199
554	1.0527833333333334	34.723083333333335
417	1.0533166666666667	34.72358333333333
703	1.0533166666666667	34.72358333333333
877	1.0644333333333333	34.718383333333335
703	1.0717333333333334	34.66948333333333
703	1.0738	34.664316666666664
390	1.0606166666666668	34.6943
850	1.0288333333333333	34.754666666666665
554	1.0288333333333333	34.754666666666665
590	1.0136666666666667	34.78078333333333
671	1.0136666666666667	34.780833333333334
698	1.0136666666666667	34.780833333333334
850	-0.03238333333333333	34.751016666666665
832	-0.03238333333333333	34.751016666666665
673	-0.23623333333333332	35.5495
850	-0.23550000000000001	35.549
675	-0.23550000000000001	35.549
613	-0.21141666666666667	35.85985
244	-0.21141666666666667	35.85985
744	-1.9326333333333334	37.294216666666664
817	-4.18255	39.440783333333336
520	-4.18255	39.440783333333336
264	-4.237833333333334	39.39566666666666
210	-4.2370833333333335	39.39698333333333
459	-4.2395	39.39366666666667
569	-4.2395	39.39366666666667
872	-4.2395	39.39366666666667
172	-4.237833333333334	39.39566666666666
764	-4.324683333333334	39.52355
732	-4.319083333333333	39.52706666666667
545	-4.2489333333333335	39.384
712	-4.293666666666667	39.35316666666667
785	-4.293666666666667	39.35316666666667
730	-4.293666666666667	39.35316666666667
273	-4.293666666666667	39.35316666666667
261	-4.293666666666667	39.35316666666667
122	-4.293666666666667	39.35316666666667
663	-4.293666666666667	39.35316666666667
454	-4.293666666666667	39.35316666666667
194	-4.293666666666667	39.35316666666667
514	-4.293666666666667	39.35316666666667
264	-4.293666666666667	39.35316666666667
104	-4.4003	39.52706666666667
175	-4.4026	39.538016666666664
420	-4.395166666666666	39.547333333333334
43	-4.395166666666666	39.547333333333334
104	-4.277183333333333	399.58725
104	-4.27315	39.58696666666667
676	-4.27315	39.58696666666667
130	-4.27315	39.58696666666667
119	-1.1073666666666666	37.25235
289	-1.1101333333333334	37.25055
675	-1.1090833333333334	37.250033333333334
639	-1.10205	37.24345
159	-1.10205	37.24345
607	-1.1008166666666668	37.2414
817	-1.1105333333333334	37.24443333333333
828	-1.1404833333333333	37.25873333333333
425	-1.1405	37.25866666666667
406	-1.1262333333333334	37.25385
8	-1.1011833333333334	37.25095
523	-1.0769	37.246633333333335
158	0.9872333333333334	34.986066666666666
419	-0.9733333333333333	36.64183333333333
584	-0.9733333333333333	36.64183333333333
763	-0.9733333333333333	36.64183333333333
800	-0.11033333333333334	37.039833333333334
528	-0.11033333333333334	37.039833333333334
359	-0.11033333333333334	37.039833333333334
93	-0.11033333333333334	37.039833333333334
406	-0.11033333333333334	37.039833333333334
485	-0.11033333333333334	37.039833333333334
577	0.15	37.016666666666666
486	0.15	37.016666666666666
737	0.15	37.016666666666666
119	0.15	37.016666666666666
734	0.15	37.016666666666666
14	0.3333333333333333	38.03333333333333
610	0.3333333333333333	38.03333333333333
275	0.3333333333333333	38.03333333333333
329	0.3333333333333333	38.03333333333333
339	0.3333333333333333	38.03333333333333
602	0.3333333333333333	38.03333333333333
409	0.3333333333333333	38.03333333333333
310	0.3893333333333333	38.01466666666666
562	0.3893333333333333	38.01466666666666
28	0.3893333333333333	38.01466666666666
763	0.3893333333333333	38.01466666666666
795	0.3893333333333333	38.01466666666666
404	-1.025	37.068333333333335
217	-1.025	37.068333333333335
790	-1.025	37.068333333333335
82	-0.9733333333333333	36.64183333333333
660	-0.9733333333333333	36.64183333333333
7	-0.9733333333333333	36.64183333333333
754	-0.9733333333333333	36.64183333333333
308	0.38666666666666666	38.0155
52	0.38666666666666666	38.0155
47	0.38666666666666666	38.0155
310	0.38666666666666666	38.0155
610	0.38666666666666666	38.0155
839	0.38666666666666666	38.0155
851	0.38666666666666666	38.0155
852	0.38666666666666666	38.0155
512	0.38666666666666666	38.0155
51	0.38666666666666666	38.0155
685	0.38666666666666666	38.0155
685	2.3091666666666666	37.966
325	2.3091666666666666	37.966
114	2.3091666666666666	37.966
299	2.31	37.96383333333333
288	2.31	37.96383333333333
150	2.3111	37.96305
564	2.3111	37.96305
543	2.3117666666666667	37.96315
296	2.3118333333333334	37.963166666666666
397	2.3118333333333334	37.963166666666666
742	2.3118333333333334	37.963166666666666
760	2.3196833333333333	37.983583333333335
723	2.28145	37.95008333333333
800	2.2815	37.95016666666667
777	2.2300166666666668	37.923883333333336
773	2.2300166666666668	37.923883333333336
229	2.222	37.915333333333336
800	2.2300166666666668	37.923883333333336
823	2.2332666666666667	37.927933333333335
494	2.2332666666666667	37.927933333333335
866	2.2332666666666667	37.927933333333335
800	2.2332666666666667	37.927933333333335
268	2.235333333333333	37.926833333333335
494	2.2420333333333335	37.931066666666666
159	2.2420333333333335	37.931066666666666
512	2.2667	37.93736666666667
749	2.2667	37.93736666666667
543	2.2653499999999998	37.93038333333333
180	2.28015	37.95681666666667
606	2.2801666666666667	37.956833333333336
589	2.2801666666666667	37.956833333333336
408	2.2801666666666667	37.956833333333336
330	2.2861666666666665	37.91198333333333
593	2.2861666666666665	37.91198333333333
687	2.2861666666666665	37.91198333333333
379	2.2861666666666665	37.91198333333333
412	2.2861666666666665	37.91198333333333
475	2.2861666666666665	37.91198333333333
349	2.2861666666666665	37.91198333333333
114	2.2861666666666665	37.91198333333333
485	2.2861666666666665	37.91198333333333
119	2.2840833333333332	37.90926666666667
673	2.2658833333333335	37.89755
90	2.2658833333333335	37.89755
868	2.2658833333333335	37.89755
213	2.1075833333333334	37.88908333333333
80	1.2032333333333334	37.62213333333333
176	1.188	37.59375
116	0.6918833333333333	37.62785
336	0.17096666666666666	37.49595
251	0.17096666666666666	37.49595
364	0.08781666666666667	37.34425
365	0.031000000000000003	37.108333333333334
449	2.3196833333333333	37.983583333333335
196	-0.7852166666666667	37.268766666666664
366	-0.8136	36.38401666666667
365	-1.4496	36.63995
440	-1.4079333333333333	36.71605
101	-1.6843666666666666	36.37295
364	0.08626666666666667	37.27563333333333
463	0.08626666666666667	37.27563333333333
877	0.08626666666666667	37.27563333333333
442	0.26815	37.54675
176	0.7097666666666667	37.610283333333335
229	0.8029666666666666	37.48385
1	0.83835	37.44605
66	1.0166166666666667	37.246116666666666
400	1.1776833333333334	37.3141
442	1.1776666666666666	37.314166666666665
268	1.1723666666666666	37.30648333333333
14	1.1744833333333333	37.306
225	1.1747	37.30571666666667
797	1.1821166666666667	37.31111666666666
349	1.2095333333333333	37.302483333333335
133	1.2095333333333333	37.302483333333335
196	1.1821666666666666	37.296166666666664
851	1.2180833333333334	37.3023
410	1.2180833333333334	37.3023
268	1.2181666666666666	37.30233333333334
442	1.2181666666666666	37.30233333333334
564	1.2320833333333334	37.297666666666665
596	1.2394333333333334	37.28933333333333
114	1.1790333333333334	37.31681666666667
515	1.1821666666666666	37.296166666666664
201	1.18045	37.29793333333333
440	1.1079333333333334	37.238566666666664
315	1.2389166666666667	37.28958333333333
116	0.7664833333333333	37.5609
135	0.08173333333333334	37.6212
557	0.08173333333333334	37.6212
711	0.0825	37.617666666666665
449	1.1747	37.30571666666667
352	0.08253333333333333	37.617733333333334
366	-0.9171999999999999	36.61058333333333
695	-0.11815	35.67823333333333
627	1.2538	35.17178333333333
168	1.2538	35.17178333333333
118	1.2538	35.17178333333333
26	1.2538	35.17178333333333
567	1.2538	35.17178333333333
803	1.26315	35.21906666666667
518	1.2569	35.19485
703	1.2123666666666666	35.27385
317	1.2123666666666666	35.27385
285	1.1281166666666667	35.35856666666667
417	1.1281166666666667	35.35856666666667
660	1.0956833333333333	35.33991666666667
479	1.0956833333333333	35.33991666666667
5	1.0938833333333333	35.3382
850	1.0938833333333333	35.3382
598	1.0697666666666668	35.32275
672	1.2944666666666667	35.07901666666667
878	1.2944666666666667	35.07901666666667
597	1.2918	35.1847
518	1.2918	35.1847
485	1.3258333333333334	35.29385
430	1.30185	35.32288333333333
598	1.2713333333333334	35.35763333333333
609	1.2380833333333334	35.40358333333333
72	1.0578	34.7217
305	1.0578	34.7217
366	1.0497666666666667	34.93306666666667
803	0.5891	35.30843333333333
366	0.38838333333333336	35.33371666666667
366	-0.23573333333333332	35.9093
612	-0.9733333333333333	36.64183333333333
68	-1.025	37.068333333333335
44	-1.02695	37.06988333333334
588	-1.02695	37.06988333333334
780	-1.2401	36.844483333333336
838	-1.24915	36.847233333333335
562	-1.24915	36.847233333333335
852	-1.2491666666666665	36.847166666666666
30	-1.2491666666666665	36.847166666666666
773	-1.2491666666666665	36.847166666666666
12	-1.2491666666666665	36.847166666666666
562	-1.2491666666666665	36.847166666666666
756	-1.2491666666666665	36.847166666666666
546	-1.2401	36.844483333333336
728	-1.2211666666666667	36.89633333333333
813	-1.45805	36.640966666666664
438	-1.834	36.07933333333333
178	-1.834	36.07933333333333
253	-1.834	36.07933333333333
560	-1.8224166666666668	36.06528333333333
225	-1.81555	36.05778333333333
523	-1.8133166666666667	36.051516666666664
385	-1.8133166666666667	36.051516666666664
721	-1.8009	36.036633333333334
109	-1.8009	36.036633333333334
416	-1.7996666666666665	36.030833333333334
175	-1.8133166666666667	36.051516666666664
523	-1.8619333333333334	36.18006666666667
80	-1.8306499999999999	36.231433333333335
762	-1.8317	36.23191666666666
380	-1.8317	36.23191666666666
363	-1.5743666666666667	36.928466666666665
224	-1.6875	36.844833333333334
440	-1.4373	36.6841
225	0.29164999999999996	37.55875
197	0.29164999999999996	37.55875
175	0.29164999999999996	37.55875
706	-3.3215	39.923033333333336
116	0.6081833333333333	37.672066666666666
560	0.7345	37.58886666666667
116	1.7033166666666666	37.81666666666667
175	2.0037	37.913716666666666
639	2.31915	37.98193333333333
777	2.31915	37.98193333333333
123	2.319166666666667	37.982
337	2.3091666666666666	37.966
114	2.3186	37.979016666666666
564	2.3186	37.979016666666666
844	2.2213	37.91471666666666
349	2.2213	37.91471666666666
593	2.252283333333333	37.89158333333334
762	2.3142666666666667	37.91748333333334
460	2.3142666666666667	37.91748333333334
109	2.3142666666666667	37.91748333333334
382	2.3142666666666667	37.91748333333334
385	2.3142666666666667	37.91748333333334
242	2.3142666666666667	37.91748333333334
442	2.3175333333333334	37.90741666666667
160	2.3175333333333334	37.90741666666667
566	2.3175333333333334	37.90741666666667
229	2.3175499999999998	37.9054
225	2.3156	37.91461666666667
228	2.3156	37.91461666666667
379	2.287116666666667	37.9158
743	2.3186	37.979016666666666
882	1.97075	37.91021666666666
498	0.5508333333333333	37.63333333333333
225	0.3091666666666667	37.56563333333333
115	0.38666666666666666	38.0155
830	0.38666666666666666	38.0155
159	0.38523333333333337	38.01748333333333
449	0.38523333333333337	38.01748333333333
308	0.38516666666666666	38.0175
310	0.38516666666666666	38.0175
557	0.38516666666666666	38.0175
640	0.38516666666666666	38.0175
304	0.38516666666666666	38.0175
623	0.38516666666666666	38.0175
141	0.38516666666666666	38.0175
51	0.38516666666666666	38.0175
114	2.287116666666667	37.9158
306	0.23881666666666668	37.86476666666667
871	0.23881666666666668	37.86476666666667
642	0.23881666666666668	37.86476666666667
637	0.23881666666666668	37.86476666666667
702	0.23881666666666668	37.86476666666667
519	0.23883333333333334	37.86483333333334
746	0.23875	37.8676
48	0.23833333333333334	37.865
835	0.2341666666666667	37.876333333333335
727	0.2341666666666667	37.876333333333335
313	0.2341666666666667	37.876333333333335
612	0.2341666666666667	37.876333333333335
49	0.23645	37.875766666666664
340	0.23948333333333333	37.86671666666667
470	0.23948333333333333	37.86671666666667
164	0.31460000000000005	38.017633333333336
141	0.31466666666666665	38.01766666666666
817	0.31466666666666665	38.01766666666666
77	0.31466666666666665	38.01766666666666
770	0.31466666666666665	38.01766666666666
839	0.31466666666666665	38.01766666666666
206	0.33116666666666666	38.032666666666664
777	0.33116666666666666	38.032666666666664
795	0.31466666666666665	38.01766666666666
449	0.23883333333333334	37.86483333333334
175	1.97075	37.91021666666666
597	1.97075	37.91021666666666
695	0.9695	36.69466666666667
283	0.9695666666666667	36.694633333333336
754	0.9743666666666667	36.69721666666667
617	-3.300483333333333	39.992
808	-3.2998333333333334	39.989916666666666
398	-3.296483333333333	39.98758333333333
725	-4.47595	39.48846666666667
624	-4.47595	39.48846666666667
166	-1.4599333333333333	35.38975
198	-1.0365833333333334	36.60123333333333
439	-2.6427666666666667	38.365116666666665
734	-1.4499833333333334	36.64
225	-1.5559666666666665	36.501416666666664
539	0.08578333333333334	37.255583333333334
788	0.08483333333333333	37.252
227	2.12265	37.885083333333334
773	2.26375	37.929833333333335
777	2.258583333333333	37.93108333333333
288	2.3209833333333334	37.969966666666664
150	2.3116666666666665	37.96236666666667
763	2.3116666666666665	37.96236666666667
123	2.321	37.97
817	2.32125	37.97161666666667
167	2.3198666666666665	37.9699
308	2.31905	37.968833333333336
150	2.3159666666666667	37.96185
116	1.4108166666666666	37.72311666666667
666	2.3205	37.96593333333333
543	2.3198333333333334	37.964016666666666
482	0.85375	37.55781666666667
365	-0.10593333333333334	37.054183333333334
359	-0.11183333333333333	37.04185
437	-0.030883333333333332	37.123016666666665
600	-0.033466666666666665	37.12671666666667
288	2.3131666666666666	37.97
604	-0.952	36.6905
215	-0.9746333333333334	36.69615
225	-3.593166666666667	38.80736666666667
226	-3.593166666666667	38.80736666666667
162	-4.4937	39.25505
395	-4.492	39.25465
870	-4.463166666666667	39.403333333333336
175	-4.434716666666667	39.49296666666667
879	-4.366833333333333	39.556666666666665
793	-4.1774000000000004	39.444633333333336
856	-4.177333333333333	39.44466666666667
640	-4.180833333333333	39.441833333333335
629	-4.180833333333333	39.441833333333335
826	-4.180833333333333	39.441833333333335
829	-4.235983333333333	39.396966666666664
706	-4.235983333333333	39.396966666666664
46	-4.235983333333333	39.396966666666664
147	-4.235983333333333	39.396966666666664
843	-4.235983333333333	39.396966666666664
395	-4.235983333333333	39.396966666666664
807	-4.2336833333333335	39.4178
641	-4.2336833333333335	39.4178
222	-4.239883333333333	39.393633333333334
265	-4.239883333333333	39.393633333333334
638	-4.261733333333333	39.37906666666667
544	-4.261733333333333	39.37906666666667
536	-4.278533333333334	39.364866666666664
587	-4.278533333333334	39.364866666666664
297	-4.293666666666667	39.35316666666667
845	-4.293583333333333	39.3531
524	-4.029916666666667	39.69241666666667
106	-3.2996499999999997	39.8415
547	-3.29835	39.99125
50	-3.2948166666666667	39.991733333333336
714	-3.2983333333333333	39.99133333333333
112	-3.2987666666666664	39.999516666666665
347	-3.2982666666666667	40.00033333333333
858	-3.29835	40.0006
617	-3.29835	40.0006
222	-4.237983333333333	39.39541666666667
536	-4.2785	39.36483333333334
568	-4.2785	39.36483333333334
485	-0.37616666666666665	36.93813333333333
830	-0.33980000000000005	36.84493333333333
817	-0.3206	36.830933333333334
91	-0.3851333333333333	36.82118333333333
437	-0.030833333333333334	37.123
158	0.4875	34.137616666666666
512	0.09998333333333333	34.59803333333333
225	-1.5692333333333335	37.232933333333335
26	-0.5646833333333333	34.673183333333334
119	-0.5659	34.673516666666664
673	-0.4893666666666666	34.243316666666665
567	-0.4893666666666666	34.243316666666665
667	-0.5019166666666667	34.21491666666667
609	-0.5019166666666667	34.21491666666667
235	-0.5019166666666667	34.21491666666667
675	-0.49953333333333333	34.21995
577	-0.49301666666666666	34.23611666666667
309	-0.6139833333333333	34.094833333333334
868	-0.5762666666666667	34.09065
867	-0.5551166666666667	34.1146
77	-0.61345	34.08951666666667
349	-0.6155166666666666	34.09251666666667
667	-0.6155166666666666	34.09251666666667
438	-0.6063333333333334	34.08878333333333
449	-0.6063333333333334	34.08878333333333
867	-0.61425	34.09525
431	-0.4893666666666666	34.243316666666665
57	-0.3905	34.1832
204	-0.4562666666666667	34.26115
567	-0.4887166666666667	34.242066666666666
593	-0.48765000000000003	34.246183333333335
842	-0.6137333333333334	34.09455
382	-0.6151666666666666	34.092
412	-0.6152333333333334	34.09206666666667
97	-0.6137166666666667	34.09575
601	1.536	35.46183333333333
166	1.397	35.29383333333333
517	0.23583333333333334	34.865
670	-0.4983333333333333	34.223333333333336
480	-0.47723333333333334	34.27795
600	-0.5015166666666667	34.18476666666667
523	-1.5635666666666665	37.230583333333335
290	-0.27299999999999996	35.16101666666667
353	-0.27299999999999996	35.16101666666667
463	-0.26255	35.15826666666667
518	-0.3111333333333333	35.20863333333333
826	-0.26255	35.15826666666667
88	-0.5843	34.088433333333334
695	-0.9734999999999999	36.64183333333333
167	-0.9734999999999999	36.64183333333333
817	-0.9734999999999999	36.64183333333333
159	-0.2349166666666667	35.54451666666667
815	-0.05483333333333333	35.001933333333334
593	-0.45903333333333335	34.266733333333335
850	-0.49035	34.24365
395	-0.4825	34.262433333333334
382	-0.4825	34.262433333333334
593	-0.5729333333333333	34.09435
385	-0.5931	34.09015
512	-0.5869333333333333	34.08546666666667
166	-0.5790833333333333	34.087516666666666
868	-0.48650000000000004	34.24583333333333
539	-0.64605	34.3408
577	1.3978333333333333	35.34128333333334
390	1.0610833333333334	34.75386666666667
437	1.06265	34.75525
229	-4.0110166666666665	39.7176
463	-0.6521333333333333	34.3237
602	1.0186166666666667	35.0101
703	1.0653666666666666	34.679633333333335
607	-1.1023	36.0192
607	-1.12425	35.98683333333334
607	1.10694° S	36.05693° E
481	1.8459° S	36.1012° E
468	-3.3095	40.018
413	-3.4208333333333334	39.89816666666667
681	-3.3095	40.018
513	-3.3095	40.018
120	-3.4208333333333334	39.89816666666667
868	-3.315	39.9735
860	-4.324833333333333	39.5245
187	-4.324833333333333	39.5245
821	-4.324833333333333	39.5245
514	-4.324833333333333	39.5245
617	-3.313	39.98133333333333
714	-3.31215	39.98093333333333
354	-3.3135	39.985
395	-3.3078333333333334	40.0175
412	-3.31215	39.98093333333333
492	-3.3217666666666665	39.95621666666667
464	-3.321633333333333	39.95471666666667
242	3.3213333333333335	39.949333333333335
614	-3.321833333333333	39.950833333333335
784	-3.3215	39.923033333333336
147	-3.3209	39.924733333333336
796	-4.324833333333333	39.5245
621	-3.3095	40.018
857	-4.404116666666667	39.4694
861	-4.325666666666667	39.52495
189	-4.324966666666667	39.5237
412	-4.3183	39.52986666666666
347	-3.2898666666666667	40.001133333333335
772	-3.322	39.958
454	-3.314	39.97983333333333
3	-4.326416666666667	39.52506666666667
30	-3.2975333333333334	40.000816666666665
562	-3.2979833333333333	40.00063333333333
398	-3.3225	39.9535
166	-3.3196833333333333	39.96228333333333
412	-3.2955	40.00066666666667
395	-4.324866666666667	39.524483333333336
110	-3.3095	40.018
40	-3.3095	40.018
434	-3.3095	40.018
431	-3.3095	40.018
617	-4.180866666666667	39.44186666666667
856	-4.180866666666667	39.44186666666667
638	-4.180866666666667	39.44186666666667
617	4° 19.50° S	39.523666666666664
222	-4.1836166666666665	39.45875
44	-4.18265	39.44146666666666
445	-4.180866666666667	39.44186666666667
44	-4.231016666666667	39.40105
640	-4.180866666666667	39.44186666666667
817	-4.202683333333333	39.43931666666667
822	-4.18265	39.44146666666666
706	-4.231016666666667	39.40105
133	-4.324833333333333	39.5245
44	-4.324833333333333	39.5245
395	4° 19.50° S	39.523666666666664
35	-4.182666666666667	39.4415
247	-3.3095	40.018
710	-3.2992333333333335	39.9983
395	-4.324833333333333	39.5245
873	-3.2992333333333335	39.9983
601	-4.324833333333333	39.5245
347	-3.2986833333333334	39.9999
837	-3.2986833333333334	39.9999
601	-3.2986833333333334	39.9999
30	-3.259333333333333	39.975
816	-3.2640000000000002	39.97666666666667
670	-3.3217	39.95733333333333
413	-3.3217	39.95733333333333
166	-3.3192	39.96123333333333
858	-3.321633333333333	39.927366666666664
159	-3.299166666666667	39.998
412	-3.2569833333333333	39.97395
816	-3.3192	39.96123333333333
252	-3.320666666666667	39.8895
40	-3.259333333333333	39.975
526	-3.3215	39.923
454	-3.32145	39.8895
407	-3.2986833333333334	39.9999
130	-3.2569833333333333	39.97395
525	-3.3215	39.923
147	-3.2986833333333334	39.9999
374	-3.320666666666667	39.8895
821	-3.322	39.958
784	-3.259333333333333	39.975
252	-3.3415	40.02766666666667
247	-3.3415	40.02766666666667
526	-4.333666666666667	39.563833333333335
199	-4.125016666666666	39.35295
270	-4.125016666666666	39.35295
278	-4.125016666666666	39.35295
877	-4.336166666666666	39.523666666666664
87	-4.125016666666666	39.35295
87	-4.319416666666666	39.5369
431	-4.318083333333333	39.52775
383	-3.34285	40.02803333333333
162	-3.342833333333333	40.028
245	-3.34285	40.02803333333333
162	-3.3087999999999997	39.978833333333334
526	-3.420166666666667	39.89683333333333
374	-3.42225	39.89825
373	-3.3535500000000003	40.01425
247	-3.3414333333333333	40.02758333333333
748	-3.2960000000000003	39.98433333333333
166	-3.2932	39.997766666666664
166	-3.2955	40.00066666666667
372	-3.28395	39.9951
710	-3.232466666666667	39.984
415	-3.2960000000000003	39.98433333333333
525	-3.2327333333333335	39.984
302	-3.257	39.974
247	-3.3053	40.01658333333334
756	-3.3414333333333333	40.02758333333333
262	-3.22475	39.98416666666667
159	-3.2979666666666665	40.00063333333333
29	-3.3093333333333335	39.980666666666664
166	-3.314	39.97983333333333
819	-3.3415	40.02766666666667
195	-3.3415	40.02766666666667
625	-3.29925	39.997816666666665
166	-4.300783333333333	39.5817
526	-3.29925	39.994816666666665
162	-4.333666666666667	39.563833333333335
445	-4.225233333333334	39.43171666666667
87	-4.318333333333333	39.529833333333336
784	-4.324833333333333	39.5245
558	-4.333666666666667	39.563833333333335
843	-3.2569	39.97403333333333
431	-4.325	39.523666666666664
162	-3.3415	40.02766666666667
159	-3.2955	40.00066666666667
361	-4.199816666666667	39.4414
793	-4.184666666666667	39.43966666666667
402	-4.28565	39.58851666666666
877	-4.325	39.523666666666664
843	-4.198066666666667	39.41035
44	-4.198316666666667	39.41285
456	-4.40655	39.47063333333333
496	-4.198316666666667	39.41283333333333
629	-4.177666666666667	39.44433333333333
295	-4.40655	39.47063333333333
80	-2.9959166666666666	38.45988333333333
793	-4.1776333333333335	39.44436666666667
764	-4.333333333333333	39.56686666666667
636	-4.4065	39.470666666666666
488	-4.333333333333333	39.566833333333335
259	-4.177666666666667	39.44433333333333
650	-4.4065	39.470666666666666
12	-4.333333333333333	39.566833333333335
354	-3.3201	39.971066666666665
523	-3.3084333333333333	39.97911666666667
617	-3.3100666666666667	39.980716666666666
166	-3.3100666666666667	39.980716666666666
255	-3.3143833333333332	39.978116666666665
784	-3.2955	40.00066666666667
121	-3.3021666666666665	39.997
147	-3.2826666666666666	39.99483333333333
284	-3.2826666666666666	39.99483333333333
601	-3.259333333333333	39.975
573	-3.2826666666666666	39.99483333333333
547	-3.3143333333333334	39.97816666666667
278	-3.3093833333333333	40.01793333333333
161	-3.3093333333333335	40.018
387	-3.3093333333333335	40.018
792	-3.2195	39.996833333333335
161	-3.2195	39.996833333333335
43	-3.3093333333333335	40.018
821	-3.33485	40.048066666666664
412	-3.33485	40.048066666666664
278	-3.3093333333333335	40.018
15	-3.3093333333333335	40.018
349	-4.127483333333333	39.46085
19	-4.399633333333333	39.45426666666667
44	-4.198333333333333	39.41283333333333
161	-4.399666666666667	39.45433333333333
650	-4.403833333333333	39.470166666666664
663	-4.198333333333333	39.41283333333333
201	-2.6418333333333335	38.36633333333333
784	-4.178233333333333	39.444266666666664
468	-3.9445	39.7725
201	-3.9445	39.7725
278	-3.9445	39.7725
524	-3.9445	39.7725
617	-3.3001666666666667	39.98566666666667
147	-3.3001666666666667	39.98566666666667
663	-3.2942333333333336	39.9838
616	-3.2960333333333334	39.9843
843	-3.259333333333333	39.97666666666667
52	-3.2640000000000002	39.97666666666667
247	-3.2955	40.00066666666667
784	-3.3001666666666667	39.98566666666667
617	-3.3113333333333332	39.98133333333333
175	-3.3078333333333334	40.0175
258	-3.3201666666666667	39.971
413	-3.322	39.958
278	-3.3113333333333332	39.98133333333333
716	-3.2183333333333333	39.93123333333333
868	-3.322	39.958
793	-4.198333333333333	39.41283333333333
757	-3.3132166666666665	38.520466666666664
44	-4.181666666666667	39.422666666666665
784	-3.300133333333333	39.985733333333336
491	-3.300133333333333	39.985733333333336
513	-3.3002833333333332	39.99133333333333
601	-3.3003333333333336	39.99133333333333
76	-4.408266666666667	39.45376666666667
809	-3.3215	39.8895
717	-3.2183333333333333	39.93116666666667
730	-4.2026666666666666	39.414
273	-4.178	39.4445
147	-4.181683333333333	39.42263333333333
451	-4.198333333333333	39.41283333333333
843	-3.259333333333333	39.975
202	-3.2210666666666667	40.11268333333334
255	-3.284533333333333	40.039233333333335
573	-3.2955	40.00066666666667
784	-3.3716333333333335	39.89488333333333
121	-3.2955	40.00066666666667
657	-3.3078333333333334	40.0175
693	-4.181666666666667	39.422666666666665
147	-4.181666666666667	39.422666666666665
226	-3.406016666666667	38.570566666666664
451	-4.139333333333333	39.433166666666665
395	-4.325	39.523666666666664
353	-4.325	39.523666666666664
831	-4.198333333333333	39.41283333333333
707	-4.181666666666667	39.422666666666665
40	-4.137833333333333	39.46383333333333
601	-4.181666666666667	39.422666666666665
131	-4.335333333333334	39.52583333333333
658	-4.139333333333333	39.433166666666665
36	-4.325	39.523666666666664
718	-4.325	39.523666666666664
881	-3.0265	39.95933333333333
809	-3.0265	39.95933333333333
451	-3.0513666666666666	39.93255
483	-3.0265	39.95933333333333
80	-3.1571666666666665	40.134166666666665
205	-3.1571666666666665	40.134166666666665
311	-3.1571666666666665	40.134166666666665
868	-3.0513666666666666	39.93255
451	-3.0265	39.95933333333333
524	-3.1441166666666667	40.1268
230	-3.3078333333333334	40.0175
513	-3.3201666666666667	39.971
271	-3.0265	39.95933333333333
113	-3.3078333333333334	40.0175
491	3.3001666666666667	39.98566666666667
414	3.3001666666666667	39.98566666666667
718	3.3001666666666667	39.98566666666667
331	-4.181333333333333	39.42033333333333
717	-4.336166666666666	39.523666666666664
44	-4.331333333333333	39.517
36	-4.336166666666666	39.523666666666664
792	-4.198333333333333	39.41283333333333
840	-4.331333333333333	39.517
712	-4.325	39.523666666666664
204	-3.1439833333333334	40° 07.621
559	-3.1571666666666665	40.134166666666665
868	-3.3215	39.923
592	-3.3215	39.923
36	-3.259333333333333	39.975
30	-3.3078333333333334	40.0175
489	-3.3078333333333334	40.0175
183	-4.333666666666667	39.563833333333335
349	-4.178	39.4445
38	-4.135	39.4675
237	-3.3078333333333334	40.0175
461	-4.327183333333333	39.565916666666666
732	-4.135	39.4675
12	-3.4208333333333334	39.89816666666667
461	-4.333666666666667	39.563833333333335
810	-4.333666666666667	39.563833333333335
36	-4.403833333333333	39.470166666666664
311	-4.135	39.4675
712	-4.135	39.4675
349	-4.333666666666667	39.563833333333335
712	-4.403833333333333	39.470166666666664
787	-4.403833333333333	39.470166666666664
36	-3.4208333333333334	39.89816666666667
617	-4.403833333333333	39.470166666666664
823	-4.333666666666667	39.563833333333335
529	-4.333666666666667	39.563833333333335
63	-3.1571666666666665	40.134166666666665
20	-3.1571666666666665	40.134166666666665
766	-3.3001666666666667	39.98566666666667
718	-3.2955	40.00066666666667
95	-3.2640000000000002	39.97666666666667
621	-3.2955	40.00066666666667
368	-3.2955	40.00066666666667
393	-3.3078333333333334	40.0175
734	-3.3078333333333334	40.0175
468	-3.3078333333333334	40.0175
477	-3.3001666666666667	39.98566666666667
414	-3.3001666666666667	39.98566666666667
328	-4.395166666666666	39.547333333333334
617	-4.325	39.523666666666664
561	-4.333666666666667	39.563833333333335
264	-4.325	39.523666666666664
40	-4.331333333333333	39.517
477	-4.395166666666666	39.547333333333334
513	-4.395166666666666	39.547333333333334
706	-3.3215	39.923
617	-3.322	39.958
784	-3.3215	39.923
52	-3.3215	39.923
868	-3.1571666666666665	40.134166666666665
513	-3.1571666666666665	40.134166666666665
866	-3.3415	40.02766666666667
349	-3.3415	40.02766666666667
402	-3.1571666666666665	40.134166666666665
723	-3.3078333333333334	40.0175
549	-4.1805	-39.422666666666665
823	-4.395166666666666	39.547333333333334
712	-4.331333333333333	39.517
432	-4.1805	-39.422666666666665
395	-4.333666666666667	39.563833333333335
804	-4.178	39.4445
413	-4.1805	-39.422666666666665
822	-4.395166666666666	39.547333333333334
833	-4.1805	-39.422666666666665
99	-4.395166666666666	39.547333333333334
663	-4.395166666666666	39.547333333333334
792	-4.1805	-39.422666666666665
653	-3.3215	39.923
110	-3.2955	40.00066666666667
110	-3.322	39.958
529	-3.2955	40.00066666666667
868	-3.3215	39.8895
492	-3.3001666666666667	39.98566666666667
652	-3.3215	39.923
562	-3.2955	40.00066666666667
271	-3.322	39.958
347	-3.3215	39.923
836	-3.322	39.958
433	-3.3215	39.923
13	-3.8310166666666667	39.6858
264	-3.8310166666666667	39.6858
715	-3.8310166666666667	39.6858
353	-3.8310166666666667	39.6858
282	-3.1571666666666665	40.134166666666665
625	-3.1571666666666665	40.134166666666665
436	-3.1571666666666665	40.134166666666665
484	-2.4169833333333335	37.95265
267	-4.492333333333334	39.254666666666665
819	-4.40075	39.52428333333334
474	-4.492333333333334	39.254666666666665
739	-4.395166666666666	39.547333333333334
881	-4.492333333333334	39.254666666666665
484	-2.4326666666666665	37.9385
821	-4.395166666666666	39.547333333333334
755	-3.3225	39.9535
632	-3.342983333333333	39.86533333333333
175	-4.355833333333333	39.56183333333333
725	-3.379	39.98916666666667
\.


--
-- Data for Name: plant_families; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_families (id, family_name) FROM stdin;
1	Acanthaceae
2	Achariaceae
3	Amaranthaceae
4	Amaryllidaceae
5	Anacardiaceae
6	Annonaceae
7	Anthericaceae
8	Aphloiaceae
10	Aquifoliaceae
11	Araceae
12	Araliaceae
13	Arecaceae
14	Aristolochiaceae
15	Asparagaceae
16	Asphodelaceae
17	Asteraceae
18	Begoniaceae
19	Bignoniaceae
20	Bixaceae
21	Boraginaceae
22	Burseraceae
23	Bursuraceae
24	Cactaceae
25	Calophyllaceae
26	Canellaceae
27	Cannabaceae
28	Capparaceae
29	Caprifoliaceae
30	Caryophyllaceae
31	Celastraceae
32	Chrysobalanaceae
33	Clusiaceae
34	Colchicaceae
35	Combretaceae
36	Commelinaceae
37	Connaraceae
38	Convolvulaceae
39	Cordiaceae
40	Cornaceae
41	Cucurbitaceae
42	Cupressaceae
43	Cuscutaceae
44	Dichapetalaceae
45	Dilleniaceae
46	Dioscoreaceae
47	Ebenaceae
48	Ehretiaceae
49	Erythroxylaceae
51	Fabaceae
52	Flagellariaceae
53	Gelsemiaceae
54	Gentianaceae
55	Goodeniaceae
56	Hernandiaceae
57	Hypericaceae
58	Icacinaceae
59	Iridaceae
60	Lamiaceae
61	Lauraceae
62	Lecythidaceae
63	Linaceae
64	Loganiaceae
65	Loranthaceae
66	Lythraceae
68	Melastomataceae
69	Meliaceae
70	Melianthaceae
71	Menispermaceae
72	Monimiaceae
73	Moraceae
74	Moringaceae
75	Myrtaceae
76	Ochnaceae
77	Olacaceae
78	Oleaceae
79	Opiliaceae
80	Orchidaceae
81	Orobanchaceae
82	Pandanaceae
83	Passifloraceae
84	Penaeaceae
85	Peraceae
86	Phyllanthaceae
87	Phytolaccaceae
88	Picrodendraceae
89	Piperaceae
90	Pittosporaceae
91	Podocarpaceae
92	Polygalaceae
93	Portulacaceae
94	Primulaceae
95	Proteaceae
96	Putranjivaceae
97	Ranunculaceae
98	Rhamnaceae
99	Rhizophoraceae
100	Rosaceae
101	Rubiaceae
102	Rutaceae
103	Salicaceae
104	Salvadoraceae
105	Santalaceae
106	Sapindaceae
107	Sapotaceae
108	Simaroubaceae
109	Smilacaceae
110	Solanaceae
111	Sterculiaceae
112	Stilbaceae
113	Taccaceae
114	Thymelaeaceae
115	Ulmaceae
116	Urticaceae
117	Verbenaceae
118	Violaceae
119	Vitaceae
120	Zamiaceae
121	Zingiberaceae
122	Zygophyllaceae
123	ff
124	
125	vvvvvvvv
126	gggggggggggggggg
127	gggggggggggggg
128	yyyyyyyyyyyyyyyyyyy
129	ffffffff
50	Euphorbiaceae
9	Apocynaceae
67	Malvaceae
\.


--
-- Data for Name: plant_families_newick; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_families_newick (id, family_name, matk_newick) FROM stdin;
\.


--
-- Data for Name: plant_genera; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plant_genera (id, genus_name, family_id) FROM stdin;
1	??Premna	60
2	?Sapindus	106
11	Adenium	9
12	Aframomum	121
13	Afrocanthium	101
14	Afrocarpus	91
15	Afrocayratia	119
16	Afzelia	51
17	Agelaea	37
18	Agelanthus	65
19	Alafia	9
20	Alangium	40
21	Allophylus	106
22	Aloe	16
23	Ampelocissus	119
24	Anacardium	5
25	Anchomanes	11
26	Ancylobothrys	9
27	Angylocalyx	51
28	Annona	6
29	Anthocleista	54
30	Antiaris	73
31	Antidesma	50
32	Aphloia	8
33	Apodytes	58
34	Argomuellera	50
35	Arisaema	11
36	Aristea	59
37	Aristolochia	14
38	Artabotrys	6
39	Artocarpus	73
40	Asparagus	15
41	Astragalus	51
42	Astropanax	12
43	Avicennia	1
44	Azadirachta	69
45	Azima	104
46	Balanites	122
47	Baphia	51
48	Barringtonia	62
49	Basananthe	83
50	Begonia	18
51	Berkheya	17
52	Bersama	70
53	Biancaea	51
54	Bischofia	86
55	Bixa	20
56	Blighia	106
57	Boscia	28
58	Bothriocline	17
59	Bourreria	21
60	Brackenridgea	76
61	Bridelia	86
62	Brucea	108
63	Brugmansia	110
64	Bruguiera	99
65	Bullockia	101
66	Cadaba	28
67	Calodendrum	102
68	Calophyllum	25
69	Calotropis	9
70	Calycosiphonia	101
71	Campylospermum	76
72	Canavalia	51
73	Canthium	101
74	Capparis	28
75	Cardiospermum	106
76	Carduus	17
77	Carissa	9
78	Carpolobia	92
79	Carvalhoa	9
80	Casaeria	103
81	Cascabela	9
82	Casearia	103
83	Casimiroa	102
84	Cassia	51
85	Cassipourea	99
86	Cassytha	61
87	Catunaregam	101
88	Celtis	27
89	Cereus	24
90	Ceropegia	9
91	Cestrum	110
92	Chaetachme	27
93	Chasmanthera	71
94	Chassalia	101
95	Chlorophytum	7
96	Christiana	67
97	Chrysophylum	107
98	Chytranthus	106
99	Cissampelos	71
100	Cissus	119
101	Clausena	102
102	Clematis	97
103	Clerodendrum	60
104	Clidemia	68
105	Clutia	85
106	Coccinia	41
107	Cocculus	71
108	Coffea	101
109	Cola	67
110	Coleus	60
111	Colubrina	98
112	Combretum	35
113	Commelina	36
114	Commiphora	23
115	Connarus	37
116	Coptosperma	101
117	Corallocarpus	41
118	Cordia	39
119	Cordyla	51
120	Craterispermum	101
121	Cremaspora	101
122	Crinum	4
123	Crosandra	1
124	Crossandra	1
125	Crossopteryx	101
126	Crotalaria	51
127	Croton	50
128	Ctenolepis	41
129	Cucumis	41
130	Culcasia	11
131	Cuscuta	43
132	Cussonia	12
133	Cynanchum	9
134	Cyphostemma	119
135	Dalechampia	50
136	Dasylepis	2
137	Deinbollia	106
138	Derris	51
139	Desmidorchis	9
140	Dialium	51
141	Dichapetalum	44
142	Dicranolepis	114
143	Dictyophleba	9
144	Didymosalpinx	101
145	Dioscorea	46
146	Dioscoreophyllum	71
147	Diospyros	47
148	Diplocyclos	41
149	Discopodium	110
150	Dombeya	67
151	Donella	107
152	Dorstenia	73
153	Dovyalis	103
154	Dracaena	15
155	Drypetes	96
156	Duranta	117
157	Echinops	17
158	Ehretia	48
159	Ekebergia	69
160	Elaeodendron	31
161	Ellipanthus	37
162	Embelia	94
163	Empogona	101
4	Acalypha	12
10	Adenia	67
7	Achyrospermum	60
8	Acokanthera	9
9	Adansonia	67
164	Encephalartos	120
165	Englerina	65
166	Englerophytum	107
167	Entada	51
168	Erianthemum	65
169	Erythrina	51
170	Erythrococca	50
171	Erythrophloeum	51
172	Erythroxylum	49
173	Euclea	47
174	Eugenia	75
175	Eulophia	80
176	Eumachia	101
177	Euphorbia	50
178	Excoecaria	50
179	Faurea	95
180	Feretia	101
181	Ficus	73
182	Filicium	106
183	Flacourtia	103
184	Flagellaria	52
185	Flueggea	86
186	Funtumia	9
187	Galiniera	101
188	Galium	101
189	Garcinia	33
190	Gardenia	101
191	Geophila	101
192	Gerrardanthus	41
193	Girardinia	116
194	Gloriosa	34
195	Gmelina	60
196	Gomphocarpus	9
197	Gomphorcarpus	9
198	Gonatopus	11
199	Gossypioides	67
200	Grewia	67
201	Guettarda	101
202	Guilandina	51
203	Gymnosporia	31
204	Gyrocarpus	56
205	Hagenia	100
206	Halleria	112
207	Haplocoelopsis	106
208	Haplocoelum	106
209	Harpephyllum	5
210	Harrisonia	108
211	Harungana	57
212	Heinsenia	101
213	Heinsia	101
214	Helinus	98
215	Helixanthera	65
216	Hernandia	56
217	Heywoodia	86
218	Hibiscus	67
219	Hilleria	87
220	Hirtella	32
221	Hoslundia	60
222	Huberantha	6
223	Hugonia	63
224	Hunteria	9
225	Hymenaea	51
226	Hymenodictyon	101
227	Hypericum	57
228	Ilex	10
229	Inhambanella	107
230	Ipomoea	38
231	Isolona	6
232	Ixora	101
233	Jasminum	78
234	Jateorhiza	71
235	Jatropha	50
236	Juniperus	42
237	Justicia	1
238	Kanahia	9
239	Kedrostis	41
240	Keetia	101
241	Kigelia	19
242	Lagenaria	41
243	Lamprothamnus	101
244	Landolphia	9
245	Lannea	5
246	Lantana	117
247	Lasianthus	101
248	Lasiodiscus	98
249	Lawsonia	66
250	Lecaniodiscus	106
251	Leea	119
252	Lepidotrichilia	69
253	Lepisanthes	106
254	Leptactina	101
255	Leptonychia	111
256	Lettowianthus	6
257	Lippia	117
258	Litchi	106
259	Loeseneriella	31
260	Ludia	103
261	Luffa	41
262	Macaranga	50
263	Maerua	28
264	Maesa	94
265	Maesopsis	98
266	Majidea	106
267	Mangifera	5
268	Manilkara	107
269	Margaritaria	86
270	Marsdenia	9
271	Maytenus	31
272	Melhania	67
273	Melia	69
274	Milicia	73
275	Mimusops	107
276	Mitragyna	101
277	Mkilua	6
278	Momordica	41
279	Monanthotaxis	6
280	Monodora	6
281	Moringa	74
282	Morus	73
283	Mostuea	53
284	Multidentia	101
285	Mussaenda	101
286	Myrianthus	116
287	Myrsine	94
288	Mystroxylon	31
289	Neobutonia	50
290	Nicandra	110
291	Noronhia	78
292	Ochna	76
293	Olax	77
294	Oldfieldia	88
295	Olea	78
296	Olinia	84
297	Oncinotis	9
298	Oncoba	103
299	Oncocalyx	65
300	Ophrypetalum	6
301	Opilia	79
302	Opuntia	24
303	Orobanche	81
304	Osyris	105
305	Oxyanthus	101
306	Ozoroa	5
307	Pandanus	82
308	Pappea	106
309	Parquetina	9
310	Passiflora	83
311	Paullinia	106
312	Pauridiantha	101
313	Pavetta	101
314	Pavonia	67
315	Peddiea	114
316	Pentarhopalopilia	79
317	Pentas	101
318	Peponium	41
319	Pergularia	9
320	Periploca	9
321	Phoenix	13
322	Phragmanthera	65
323	Phyllanthus	86
324	Phytolacca	87
325	Piper	89
326	Pistacia	5
327	Pittosporum	90
328	Pleiocarpa	9
329	Podocarpus	91
330	Pollichia	30
331	Polyscias	12
332	Polysphaeria	101
333	Pouteria	107
334	Premna	60
335	Prunus	100
336	Pseudobersama	69
337	Psidium	75
338	Psychotria	101
339	Psydrax	101
340	Pupalia	3
341	Pycnocoma	50
342	Pyrenacantha	58
343	Quassia	108
344	Rapanea	94
345	Rauvolfia	9
346	Rawsonia	2
347	Rhamnus	98
348	Rhaphiolepis	100
349	Rhaphiostylis	58
350	Rhizophora	99
351	Rhodognaphalon	67
352	Rhoicissus	119
353	Rhynchosia	51
354	Ricinus	50
355	Rinorea	118
356	Ritchiea	28
357	Rotheca	60
358	Rothmannia	101
359	Rourea	37
360	Rubia	101
361	Rubus	100
362	Rutidea	101
363	Rytigynia	101
364	Saba	9
365	Salacia	31
366	Salvadora	104
367	Sambucus	29
368	Sansevieria	15
369	Scadoxus	4
370	Scaevola	55
371	Scepocarpus	116
372	Schinus	5
373	Schizozygia	9
374	Schrebera	78
375	Sclerocarya	5
376	Scolopia	103
377	Scutia	98
378	Searsia	5
379	Secamone	9
380	Senna	51
381	Shirakiopsis	50
382	Sideroxylon	107
383	Smilax	109
384	Solanum	110
385	Sorindeia	5
386	Sparrmannia	67
387	Sphaerocoryne	6
388	Stephania	71
389	Sterculia	111
390	Strombosia	77
391	Strombosiopsis	77
392	Strychnos	64
393	Suregada	50
394	Synaptolepis	114
395	Synsepalum	107
396	Syzygium	75
397	Tabernaemontana	9
398	Tacca	113
399	Talinum	93
400	Tamarindus	51
401	Tarenna	101
402	Tectona	60
403	Tennantia	101
404	Terminalia	35
405	Tetracera	45
406	Thespesia	67
407	Thilachium	28
408	Thunbergia	1
409	Tiliacora	71
410	Tinospora	71
411	Trema	115
412	Triainolepis	101
413	Tricalysia	101
414	Trichilia	69
415	Triclisia	71
416	Trilepisium	73
417	Trimeria	103
418	Triumfetta	67
419	Turraea	69
420	Uvaria	6
421	Uvariodendron	6
422	Vangueria	101
424	Vernonia	17
425	Vincetoxicum	9
426	Viscum	105
427	Vismia	57
428	Vitex	60
429	Volkameria	60
430	Warburgia	26
431	Warneckea	68
432	Warneckia	68
433	Withania	110
434	Ximenia	77
435	Xylocarpus	69
436	Xylopia	6
437	Xymalos	72
438	Zanha	106
439	Zanthoxylum	102
440	Zehneria	41
441	Ziziphus	98
442	ff	123
443		124
3	Abutilon	67
444	Abutiloooophp0	1
445	Abutilo	1
446	Abutilol	1
447	Abutiloll	1
448	Abutil	1
449	Abutilj	1
450	Abutilju	1
451	Abutiljuu	1
452	Abutiljuuy	1
453	Abutiljuuyy	1
454	Abutiljuuyyh	1
455	Abutiljuuyyhj	1
456	Abutiljuuyyhjg	1
457	Abutiljuuyyhjgj	1
458	Abutiljuuyyhjgjg	1
423	Vepris	9
6	Acanthus	1
5	Acanthopale	1
\.


--
-- Data for Name: plants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants (id, species_name, leaf_type, plant_description, max_latitude, min_latitude, genus_id) FROM stdin;
1	hirtum (Lam.) Sweet	simple	nan	1350	1	3
2	mauritianum (Jacq.) Medic. sensu lato	simple	nan	2050	1	3
3	neptunica Müll. Arg.	simple	nan	1800	1	4
4	pubescens (Engl.) C.B. Clarke	simple	nan	2700	1550	5
5	eminens C. B. Clarke	simple	nan	2650	1500	6
6	polystachius Delile	simple	nan	2150	1250	6
7	schimperi (Hochst. ex Briq.) Perkins	simple	nan	3000	1600	7
8	oppositifolia (Lam.) Codd	simple	nan	2100	1450	8
9	schimperi (A. DC.) Schweinf.	simple	nan	2300	1200	8
10	digitata L.	compound	nan	1000	1	9
11	bequaertii Robyns & Lawalree	simple	nan	2250	1900	10
12	gummifera (Harv.) Harms	simple	nan	1800	1	10
13	lobata (Jacq.) Engl. ssp. rumicifolia (Engl. & Harms) Lye	simple	nan	1800	350	10
14	wightiana (Wight & Arn.) Engl. ssp. africana W.J.de Wilde	simple	nan	1700	900	10
15	obesum (Forssk.) Roem. & Schult.	simple	nan	1500	1	11
16	angustifolium (Sonn.) K. Schum.	simple	nan	1500	1220	12
17	zambesiacum (Baker) K. Schum.	simple	nan	2070	1525	12
18	quanzensis Welw.	compound	nan	450	1	16
19	pentagyna (Lam.) Baill.	compound	nan	2100	1	17
20	sansibarensis (Engl.) Polhill & Wiens	simple	nan	1370	1	18
21	sp.	simple	nan	\N	\N	18
22	zizyphifolius (Engl.) Polhill & Wiens	simple	nan	2590	1000	18
23	caudata Stapf	simple	nan	500	1	19
24	microstylis K. Schum.	simple	nan	1500	1	19
25	chinense (Lour.) Harms	simple	nan	2250	1650	20
26	abyssinicus (Hochst.) Radlk.	compound	nan	2550	1000	21
27	africanus P. Beauv.	compound	nan	2250	1200	21
28	ferrugineus Taub.	compound	nan	2200	1200	21
29	pervillei Blume	simple	nan	450	1	21
30	rubifolius (Hochst. ex A. Rich.) Engl.	compound	nan	2100	1	21
31	L. sp.	simple	nan	\N	\N	22
32	africana (Lour.) Merr.	simple	nan	1800	1	23
33	obtusata (Baker) Planch. ssp. kirkiana (Planch.) Wild & R.B. Drumm.	simple	nan	50	1	23
34	occidentale L.	simple	nan	900	1	24
35	abbreviatus Engl.	simple	nan	350	1	25
36	petersiana (Klotzsch) Pierre	simple	nan	400	1	26
37	tayloris (Stapf) Pichon	simple	nan	300	1	26
38	braunii Harms	compound	nan	400	1	27
39	muricata L.	simple	nan	\N	\N	28
40	senegalensis Pers. ssp. senegalensis	simple	nan	1750	1	28
41	grandiflora Gilg	simple	nan	2200	1250	29
42	vogelii Planch.	simple	nan	1550	1500	29
43	toxicaria Lesch.	simple	nan	1700	1	30
44	venosum E. Mey. ex Tul.	simple	nan	2100	1	31
45	theiformis (Vahl) Benn.	simple	nan	1800	1450	32
46	dimidiata E. Mey. ex Arn.	simple	nan	2400	1	33
47	macrophylla Pax	simple	nan	1800	750	34
48	mildbraedii Engl.	simple	nan	2620	1400	35
49	alata Baker	simple	nan	2850	2440	36
50	albida Duch.	nan	nan	\N	\N	37
51	likimensis De Wild.	simple	nan	1800	1430	38
52	modestus Diels ssp. macranthus Verdc.	simple	nan	1430	1	38
53	monteiroae Oliv.	simple	nan	1550	1	38
54	heterophyllus Lam.	simple	nan	\N	1	39
55	africanus Lam.	simple	nan	2680	100	40
56	asparagoides (L.) Druce	simple	nan	1830	1770	40
57	falcatus L.	simple	nan	2750	10	40
58	sp.	nan	nan	\N	\N	40
59	setaceus (Kunth) Jessop	simple	nan	2070	1740	40
60	atropilosulus (Hochst.) Bunge ssp. bequaertii (De Wild.) J.B. Gillett	compound	nan	4200	1750	41
61	marina (Forssk.) Vierh.	simple	nan	2	0	43
62	indica A. Juss.	compound	nan	1200	1	44
63	tetracantha Lam.	simple	nan	1300	1	45
64	aegyptiaca (L.) Delile	compound	nan	2000	250	46
65	glabra Mildbr. & Schltr.	compound	nan	1700	900	46
66	pedicellaris Mildbr. & Schltr.	compound	nan	1300	1	46
67	maughamii Sprague ssp. acuta Sands	compound	nan	50	1	46
68	longepedicellata De Wild. ssp. keniensis (Brummitt) Soladoye	simple	nan	1500	750	47
69	racemosa (L.) Spreng.	simple	nan	350	100	48
70	hanningtoniana (Mast.) W.J. de Wilde	simple	nan	1500	300	49
71	meyeri-johannis Engl.	simple	nan	2450	1850	50
72	spekeana Oliv.	simple	nan	3140	1800	51
73	abyssinica Fresen. ssp. abyssinica Verdc.	compound	nan	2550	1150	52
74	abyssinica Fresen. ssp. engleriana (Gürke) F. White	compound	nan	2400	1350	52
75	javanica Blume	nan	nan	\N	\N	54
76	orellana L.	simple	nan	350	1	55
77	unijugata Bak.	compound	nan	1900	1	56
78	schumannianum A. Robyns	compound	nan	350	1	351
79	angustifolia A. Rich.	simple	nan	2100	1	57
80	coriacea Pax	simple 	nan	1200	1	57
81	mossambicensis Klotzsch	simple	nan	1700	600	57
82	longipes (Oliv. & Hiern) N.E.Br.	simple	nan	2800	1500	58
83	petiolaris (Lam.) Thulin	simple	nan	500	1	59
84	teitensis (Gürke) Thulin	simple	nan	850	1	59
85	zanguebarica Oliv.	simple	nan	450	1	60
86	atroviridis Müll. Arg.	simple	nan	400	50	61
87	cathartica G. Bertol.	simple	nan	450	1	61
88	micrantha (Hochst.) Baill.	simple	nan	1950	1	61
89	scleroneura Müll. Arg.	simple	nan	1650	900	61
90	taitensis Vatke & Pax	simple	nan	1200	400	61
91	antidysenterica J.F. Mill.	compound	nan	2450	1600	62
92	macrocarpa Stannard	compound	nan	1750	750	62
93	suaveolens (Humb. & Bonpl. ex Willd.) Bercht. & J. Presl	simple	nan	\N	\N	63
94	gymnorhiza (L.) Savigny	simple	nan	5	1	64
95	farinosa Forssk.	simple	nan	1900	1	66
96	volkensii (Harms) G.P. Lewis	compound	nan	2100	1	202
97	decapetala (Roth) O. Deg.	compound	nan	2050	650	53
98	capense (L. f.) Thunb.	simple	nan	2300	1600	67
99	inophyllum L.	simple	nan	20	1	68
100	gigantea (L.) W.T. Aiton	simple	nan	100	1	69
101	procera (Aiton) W.T. Aiton	simple 	nan	1200	1	69
102	spathicalyx (K. Schum.) Robbr.	simple	nan	400	350	70
103	africana Dunn	compound	nan	1800	1100	72
104	cathartica Thouars	compound	nan	450	1	72
105	rosea (Sw.) DC.	compound	nan	12	1	72
106	glaucum Hiern	nan	nan	\N	\N	73
107	keniense (Bullock) Lantz	simple	nan	1800	1400	13
108	kilifiense (Bridson) Lantz	simple	nan	500	1	13
109	pseudosetiflora (Bridson) Razafim., Lantz & B. Bremer	simple	nan	1750	750	65
110	pseudoverticillatum (S. Moore) Lantz ssp. pseudoverticillatum	simple	nan	300	1	13
111	erythrocarpos Isert	simple	nan	1800	1	74
112	fascicularis DC.	simple	nan	2100	1	74
113	sepiaria L.	simple	nan	1450	1	74
114	tomentosa Lam.	simple	nan	2100	1	74
115	viminea Hook. f. & Thomson ex Oliv.	simple	nan	1950	1	74
116	retrospiciens Ehrenb.	none	nan	1500	100	139
117	halicacabum L.	compound	nan	1710	60	75
118	nyassanus (S. Moore) R.E. Fr.	simple	nan	3350	2100	76
119	spinarum L.	simple	nan	2550	1	77
120	tetramera (Sacleux) Stapf	simple	nan	400	1	77
121	goetzei Gürke	simple	nan	1200	1	78
122	campanulata K. Schum.	simple	nan	350	300	79
123	battiscombei R.E. Fr.	simple	nan	2400	1350	82
124	gladiiformis Mast.	simple	nan	1700	1	80
125	sp.	nan	nan	\N	\N	80
126	edulis La Llave	compound	nan	\N	\N	83
127	abbreviata Oliv.	compound	nan	1000	1	84
128	malosana (Baker) Alston	simple	nan	2550	750	85
129	rotundifolia (Engl.) Alston	simple	nan	1650	900	85
130	filiformis L.	nan	nan	\N	\N	86
131	nilotica (Stapf.) Tirveng.	simple	nan	1200	1	87
132	obovata (Hochst.) A.E. Gonç.	simple	nan	500	1	87
133	gracilis (Guill. & Perr.) J. Wen & Z.D. Chen	compound	nan	1860	800	15
134	africana Burm. f.	simple	nan	2400	1150	88
135	gomphophylla Baker	simple	nan	1750	1200	88
136	mildbraedii Engl.	simple	nan	1600	50	88
137	jamacaru DC.	nan	nan	\N	\N	89
138	ballyana Bullock	simple 	nan	1400	900	90
139	meyerijohannis Engl.	simple 	nan	2500	940	90
140	aurantiacum Lindl.	simple	nan	\N	\N	91
141	aristata E. Mey. ex Planch.	simple	nan	2100	1050	92
142	dependens Hochst.	simple	nan	1200	600	93
143	cristata (Hiern) Bremek.	simple	nan	1650	1350	94
144	discolor K. Schum. ssp. taitensis Verdc.	simple	nan	1900	1450	94
145	kenyensis Verdc.	simple	nan	2300	1650	94
146	parvifolia K. Schum.	simple	nan	1950	1400	94
147	umbraticola Vatke ssp. umbraticola	simple	nan	450	1	94
148	abrupta (Hiern) Delprete & J. H. Kirkbr. var. abrupta	simple	nan	500	1	176
149	abrupta (Hiern) Delprete & J. H. Kirkbr. var. parvifolia (Verd.) C. M. Taylor	simple	nan	450	1	176
150	battiscombei (Hutch.) Hong-Wa & Besnard	simple	nan	2300	850	291
151	nilotica (Oliv.) Hong-Wa & Besnard	simple	nan	1700	1350	291
152	sp.	simple	nan	1700	1700	95
153	africana DC.	simple	nan	400	100	96
154	albidum G. Don	simple	nan	1650	1550	97
155	gorungosanum Engl.	simple	nan	2250	1500	97
156	viridifolia (J.M. Wood & Franks) Aubrév. & Pellegr.	simple	nan	1650	350	151
157	obliquinervis Engl.	compound	nan	400	1	98
158	mucronata A. Rich.	simple	nan	1900	15	99
159	pareira L. var. hirsuta (Buch.-Ham. ex DC.) Forman	simple	nan	2600	1	99
160	adeyana Masinde & L.E. Newton	simple	nan	1250	900	100
161	aralioides Planch. ssp. orientalis Verdc.	simple,compound	nan	500	1	100
162	integrifolia (Baker) Planch.	simple	nan	450	1	100
163	oliveri (Engl.) Gilg	simple	nan	1950	1200	100
164	petiolata Hook. f.	simple	nan	1800	1050	100
165	quadrangularis L.	simple	nan	1700	1	100
166	rotundifolia (Forssk.) Vahl	simple	nan	1800	1	100
167	anisata (Willd.) Hook.f. ex Benth.	compound	nan	2650	1	101
168	simensis Fresen.	compound	nan	3300	1550	102
169	formicarum Gürke	simple	nan	1600	1500	103
170	glabra (E. Mey.) Mabb. & Y.W. Yuan	simple	nan	50	1	429
171	johnstonii Oliv.	simple	nan	2500	1200	103
172	hirta (L.) D. Don.	simple	nan	450	300	104
173	abyssinica Jaub. & Spach	simple	nan	3100	1600	105
174	barteri (Hook. f.) Keay	simple	nan	1600	1400	106
175	grandis (L.) Voigt	simple	nan	1650	1	106
176	microphylla Gilg	simple	nan	1000	1	106
177	mildbraedii Harms	simple	nan	2240	2240	106
178	trilobata (Cogn.) C. Jeffrey	simple	nan	2250	1	106
179	hirsutus (L.) Diels	simple	nan	1150	500	107
180	arabica L.	simple	nan	1550	1350	108
181	eugenioides S. Moore	simple	nan	2250	1450	108
182	fadenii Bridson	simple	nan	1800	1400	108
183	pseudozanguebariae Bridson	simple	nan	450	1	108
184	minor Brenan	simple	nan	800	1	109
185	asiatica (L.) Brongn.	simple	nan	15	1	111
186	illairii Engl.	simple	nan	350	1	112
187	pentagonum M.A. Lawson	simple	nan	150	1	112
188	benghalensis L.	simple	nan	2200	10	113
189	africana (A. Rich.) Engl.	compound	nan	2070	5	114
190	campestris Engl.	compound	nan	1100	10	114
191	edulis (Klotzsch) Engl. ssp. boiviniana (Engl.) J.B. Gillett	compound	nan	1400	1	114
192	edulis (Klotzsch) Engl. ssp. holosericea (Engl.) J.B. Gillett	compound	nan	1050	100	114
193	eminii Engl. ssp zimmermanii (Engl.) J.B. Gillett	compound	nan	1750	5	114
194	longistipitatus Gilg	compound	nan	450	350	115
195	ellipticus Chiov.	simple	nan	400	1	117
196	epigaeus (Rottler) C.B. Clarke	simple	nan	2100	100	117
197	schimperi (Naudin) Hook.f.	simple	nan	1270	200	117
198	africana Lam.	simple	nan	2100	1050	118
199	faulknerae Verdc.	simple	nan	500	1	118
200	millenii Baker	simple	nan	1650	1450	118
201	monoica Roxb.	simple	nan	2100	1	118
202	myxa L.	simple	nan	300	1	118
203	quercifolia Klotzsch	simple	nan	1200	50	118
204	sinensis Lam.	simple	nan	1250	1	118
205	somaliensis Baker	simple	nan	50	1	118
206	unicinulata De Wild.	simple	nan	1230	1230	118
207	africana Lour.	compound	nan	900	1	119
208	schweinfurthii Hiern	simple	nan	1650	1450	120
209	triflora (Thonn.) K. Schum.	simple	nan	500	1	121
210	stuhlmannii Baker	simple	nan	\N	\N	122
211	longicuspe A. Rich.	simple	nan	3000	1500	3
212	mucronata Lindau	simple	nan	2000	\N	123
213	stenostachya (Lindau) C.B. Clarke	simple	nan	1000	\N	124
214	febrifuga (Afzel. ex G. Don) Benth.	simple	nan	450	1	125
215	agatiflora Schweinf. ssp. engleri (Baker f.) Polhill	compound	nan	3300	1800	126
216	axillaris Aiton	compound	nan	2250	1	126
217	goodiiformis Vatke	compound	nan	2250	50	126
218	lachnophora Hochst. ex A. Rich.	compound	nan	2100	1150	126
219	dichogamus Pax	simple	nan	2100	500	127
220	macrostachyus Hochst. ex Delile	simple	nan	2250	1350	127
221	megalocarpus Hutch.	simple	nan	2100	900	127
222	sylvaticus Hochst.	simple	nan	1750	350	127
223	cerasiformis (Stocks) Hook. f.	simple	nan	350	1	128
224	aculeatus Cogn.	simple	nan	2400	1000	129
225	dipsaceus Ehrenb. ex Spach	simple	nan	2000	40	129
226	prophetarum L. ssp. prophetarum	simple	nan	1500	1	129
227	melo L.	nan	nan	\N	\N	129
228	metulifer E. Mey. ex Naudin	simple	nan	1500	500	129
229	prophetarum L. ssp. prophetarum	simple	nan	2000	0	129
230	sacleuxii Pailleux & Bois	simple	nan	1220	1	129
231	falcifolia Engl.	simple	nan	2135	1370	130
232	orientalis Mayo	simple	nan	\N	\N	130
233	kilimanjari Oliv.	none	nan	2770	1550	131
234	sp.	none	nan	\N	\N	131
235	arborea A. Rich.	compound,lobed	nan	2400	1100	132
236	spicata Thunb.	compound	nan	2500	1450	132
237	zimmermannii Harms	compound	nan	400	1	132
238	altiscandens K. Schum.	simple	nan	2500	1700	133
239	gerrardii (Harvey) S.Liede	simple	nan	350	1	133
240	gonoloboides Schltr.	simple	nan	3600	2400	133
241	sp. I of FTEA	compound	nan	500	1	134
242	adenocaule (Steud. ex A. Rich.) Desc. ex Wild & R.B. Drumm.	compound	nan	2500	1	134
243	bambuseti (Gilg & M. Brandt) Desc. ex Wild & R.B. Drumm.	compound	nan	2400	1540	134
244	cyphopetalum (Fresen.) Desc. ex Wild & R.B. Drumm.	compound	nan	2450	470	134
245	duparquetii (Planch.) Desc.	compound	nan	500	1	134
246	dysocarpum (Gilg & M. Brandt) Desc.	compound	nan	1600	1	134
247	hildebrandtii (Gilg) Desc. ex Wild & R.B. Drumm.	compound	nan	500	1	134
248	kibweziense Verdc.	compound	nan	1600	960	134
249	kilimandscharicum (Gilg) Desc. ex Wild & R.B. Drumm.	compound	nan	2700	1400	134
250	maranguense (Gilg) Desc.	compound	nan	2300	1600	134
251	serpens (Hochst. ex A. Rich.) Desc.	compound	nan	2550	1200	134
252	sp. B of UKWF	compound	nan	2200	1100	134
253	parvifolia Lam.	simple	nan	1200	300	135
254	integra Warb.	simple	nan	1800	1400	136
255	borbonica Scheff.	compound	nan	700	1	137
256	kilimandscharica Taub.	compound	nan	2250	1200	137
257	trifoliata Lour.	compound	nan	10	1	138
258	orientale Baker f.	compound	nan	100	1	140
259	arenarium Breteler	simple	nan	450	1	141
260	madagascariense Poir. var. brevistylum Breteler	simple	nan	2400	2000	141
261	ruhlandii Engl.	simple	nan	1800	50	141
262	zenkeri Engl.	simple	nan	300	50	141
263	usambarica Gilg	simple	nan	1850	1400	142
264	lucida (K. Schum.) Pierre	simple	nan	400	1	143
265	norae (Swynn.) Keay	simple	nan	450	100	144
266	sp.	compound	nan	2300	0	145
267	volkensii Engl.	simple	nan	1140	1	146
268	abyssinica (Hiern) F. White ssp abyssinica	simple	nan	2200	1	147
269	amaniensis Gürke	simple	nan	450	400	147
270	bussei Gürke	simple	nan	350	1	147
271	consolatae Chiov.	simple	nan	1500	1	147
272	greenwayi F. White	simple	nan	400	1	147
273	kabuyeana F. White	simple	nan	500	1	147
274	loureiriana G. Don ssp. rufescens (Caveney) Verdc.	simple	nan	350	1	147
275	mespiliformis Hochst. ex A. DC.	simple	nan	1200	1	147
276	occulta F. White	simple	nan	300	1	147
277	shimbaensis F. White	simple	nan	400	1	147
278	squarrosa Klotzsch	simple	nan	300	1	147
279	zombensis (B.L. Burtt) F. White	simple	nan	1500	1400	147
280	sp. nov. ined. "wadigo"	compound	nan	20	1	423
281	fadenii (Kokwaro) Mizray	compound	nan	1950	1250	423
282	palmatus (L.) C. Jeffrey	simple	nan	1900	1	148
283	schliebenii (Harms) C. Jeffrey	simple	nan	2000	1250	148
284	tenuis (Klotzsch) C. Jeffrey	simple	nan	300	1	148
285	penninervum Hochst.	simple	nan	2850	2100	149
286	burgessiae Gerrard ex Harv.	simple	nan	2400	1200	150
287	kameruniana Engl.	simple	nan	400	1	152
288	abyssinica (A. Rich.) Warb.	simple	nan	2600	1450	153
289	caffra (Hook. f. & Harv.) Warb.	simple	nan	\N	\N	153
290	macrocalyx (Oliv.) Warb.	simple	nan	2400	1	153
291	keniensis E.V. Williams	simple	nan	300	1	153
292	afromontana Mildbr.	simple	nan	2400	1900	154
293	fragrans (L.) Ker Gawl.	simple	nan	500	1	154
294	ellenbeckiana Engl.	simple	nan	1950	1050	154
295	fragrans (L.) Ker-Gawl.	simple	nan	1850	1550	154
296	laxissima Engl.	simple	nan	2250	350	154
297	usambarensis Engl.	simple	nan	450	1	154
298	steudneri Engl.	simple	nan	2100	1250	154
299	gerrardii Hutch.	simple	nan	2100	600	155
300	natalensis (Harv.) Hutch. var. leiogyna Brenan	simple	nan	1450	1	155
301	natalensis (Harv.) Hutch. var. natalensis	simple	nan	1450	1	155
302	parvifolia (Müll. Arg.) Pax & K. Hoffm.	simple	nan	200	1	155
303	reticulata Pax	simple	nan	750	1	155
304	erecta L.	simple	nan	1950	1200	156
305	angustilobus S. Moore	simple	nan	2850	2000	157
306	hoehnelii Schweinf.	simple	nan	3500	2200	157
307	bakeri Britten	simple	nan	1050	1	158
308	cymosa Thonn.	simple	nan	2300	1050	158
309	capensis Sparrm.	compound	nan	2600	1	159
310	buchananii (Loes.) Loes.	simple	nan	2100	1200	160
311	schweinfurthianum (Loes.) Loes.	simple	nan	400	1	160
312	madagascariensis (G. Schellenb.) Capuron ex Keraudren	simple	nan	500	1	161
313	schimperi Vatke	simple	nan	2600	1500	162
314	hildebrandtii A. Braun & Bouché	compound	nan	500	1	164
315	tegulaneus Melville ssp. tegulaneus	compound	nan	2100	1800	164
316	heckmanniana (Engl.) Polhill & Wiens	simple	nan	1830	1525	165
317	woodfordioides (Schweinf.) Balle	simple	nan	3050	1600	165
318	natalense (Sond.) T.D. Penn.	simple	nan	1850	1450	166
319	oblanceolatum (S. Moore) T.D. Penn.	simple	nan	1650	1550	166
320	abyssinica Steud. ex A. Rich.	compound	nan	2150	1450	167
321	dregei (Eckl. & Zeyh.) Tiegh.	simple	nan	2590	1	168
322	sp.	simple	nan	\N	\N	168
323	bibas (Lour.) Galasso & Banfi	simple	nan	\N	\N	348
324	abyssinica Lam. ex DC ssp. abyssinica	compound	nan	2250	300	169
325	fischeri Pax	simple	nan	2300	1500	170
326	usambarica Prain	simple	nan	400	50	170
327	suaveolens (Guill. & Perr.) Brenan	nan	nan	\N	\N	171
328	emarginatum Thonn.	simple	nan	1500	1	172
329	fischeri Engl.	simple	nan	1200	1	172
330	divinorum Hiern	simple	nan	2400	1	173
331	natalensis A. DC. ssp. obovata F. White	simple	nan	350	1	173
332	schimperi (A.DC.) Dandy	simple	nan	2250	1	173
333	verdcourtii Byng	simple	nan	500	1	174
334	horsfallii (Bateman) Summerh.	simple	nan	2700	1500	175
335	petersii (Rchb.f.) Rchb.f.	simple	nan	2000	1	175
336	bussei Pax var. kibwezensis (N.E. Br.) S. Carter	nan	nan	2000	1	177
337	engleri Pax	simple	nan	2650	1750	177
338	scheffleri Pax	simple	nan	1050	450	177
339	madagascariensis (Baill.) Mull.Arg.	simple	nan	1450	1	178
340	saligna Harv.	simple	nan	3100	1050	179
341	apodanthera Delile ssp. keniensis Bridson	simple	nan	50	1	180
342	bubu Warb.	simple	nan	1200	1	181
343	natalensis Hochst.	simple	nan	1800	900	181
344	sur Forssk.	simple	nan	2100	1	181
345	sycomorus L.	simple	nan	1850	1	181
346	decipiens (Wight & Arn.) Thwaites	compound	nan	1500	1050	182
347	indica (Burm. f.) Merr.	simple	nan	2250	1	183
348	guineënsis Schumach.	simple	nan	400	1	184
349	virosa (Roxb. ex Willd.) Voigt ssp. virosa	simple	nan	1800	1	185
350	africana (Benth.) Stapf	simple	nan	1600	350	186
351	saxifraga (Hochst.) Bridson	simple	nan	2400	1850	187
352	aparinoides Forssk.	simple	nan	2790	1600	188
353	buchananii Baker	simple	nan	2000	50	189
354	livingstonei T. Anderson	simple	nan	1900	1	189
355	volkensii Engl.	simple	nan	2400	900	189
356	ternifolia Schumach. & Thonn.	simple	nan	2100	1	190
357	volkensii K. Schum. ssp. volkensii	simple	nan	1750	1	190
358	uniflora Hiern	simple	nan	1700	80	191
359	lobatus (Cogn.) C. Jeffrey	simple	nan	1850	350	192
360	diversifolia (Link) Friis	simple	nan	2100	1200	193
361	superba L.	simple	nan	2400	10	194
362	arborea Roxb. ex Sm.	simple	nan	\N	\N	195
363	kaessneri (N.E. Br.) Goyder & Nicholas	simple	nan	2300	900	196
364	phillipsiae (N. E. Br.) Goyder	simple	nan	\N	\N	196
365	physocarpus E. Mey.	simple	nan	3000	1800	196
366	semilunatus A. Rich.	simple 	nan	2650	1500	196
367	integer (N.E. Br.) Bullock	simple	nan	2250	950	197
368	boivinii (Decne.) Engl.	compound	nan	\N	\N	198
369	kirkii (Mast.) J. B. Hutch.	simple	nan	450	1	199
370	mauritiana J.F. Gmel.	simple	nan	450	1	260
371	calymmatosepala K. Schum.	simple	nan	400	50	200
372	forbesii Mast.	simple	nan	1500	1	200
373	glandulosa Vahl	simple	nan	50	1	200
374	holstii Burret	simple	nan	500	1	200
375	lilacina K. Schum.	simple	nan	1200	100	200
376	plagiophylla K. Schum.	simple	nan	500	1	200
377	similis K. Schum.	simple	nan	2250	700	200
378	stuhlmannii K. Schum.	simple	nan	300	1	200
379	tembensis Fresen.	simple	nan	2100	250	200
380	tenax (Forssk.) Fiori	simple	nan	1250	1	200
381	tephrodermis K. Schum.	simple	nan	\N	\N	200
382	trichocarpa Hochst. ex A. Rich.	simple	nan	2150	900	200
383	triflora (Bojer) Walp.	simple	nan	450	1	200
384	triflora (Bojer) Walp.	simple	nan	50	1	200
385	villosa Willd.	simple	nan	1500	1	200
386	speciosa L.	simple	nan	10	1	201
387	americanus Jacq.	simple	nan	150	1	204
388	abyssinica (Bruce) J.F. Gmel.	compound	nan	3300	2300	205
389	rubrostipulata (K. Schum.) Havil.	simple	nan	2200	1350	276
390	lucida L.	simple	nan	2750	1550	206
391	africana F.G. Davies	compound	nan	500	1	207
392	inoploeum Radlk.	compound	nan	500	1	208
393	inoploeum Radlk.	compound	nan	300	1	208
394	caffrum Bernh.	compound	nan	\N	\N	209
395	abyssinica Oliv.	compound	nan	1650	1	210
396	madagascariensis Lam. ex Poir.	simple	nan	1650	1	211
397	diervilleoides K. Schum.	simple	nan	2300	200	212
398	crinita (Afzel.) G. Taylor	simple	nan	500	1	213
399	zanzibarica (Bojer) Verdc.	simple	nan	450	50	213
400	integrifolius (Lam.) Kuntze	simple	nan	1350	300	214
401	mystacinus (Aiton) E. Mey. ex Steud.	simple	nan	2400	1450	214
402	kirkii (Oliv.) Danser	simple	nan	1370	20	215
403	nymphaeifolia (C. Presl) Kubitzki	simple	nan	10	1	216
404	lucens Sim	simple	nan	1950	1200	217
405	calyphyllus Cav.	simple	nan	2400	550	218
406	fuscus Garcke	simple	nan	2650	1400	218
407	micranthus L. f.	simple	nan	1500	1	218
408	vitifolius L.	simple	nan	3000	420	218
409	latifolia (Lam.) H. Walter	simple	nan	2000	1600	219
410	africana (Willd.) N. Hallé	simple	nan	2250	1	259
411	zanzibarica Oliv.	simple	nan	450	1	220
412	opposita Vahl	simple	nan	2000	1	221
413	castaneifolia Engl.	simple	nan	450	1	223
414	zeylanica (Retz.) Gardner ex Thwaites	simple	nan	350	1	224
415	verrucosa Gaertn.	compound	nan	400	1	225
416	parvifolium Oliv. ssp. parvifolium	simple	nan	1700	1	226
417	revolutum Vahl	simple	nan	3800	2100	227
418	roeperanum G.W. Schimp. ex A. Rich.	simple	nan	2650	1200	227
419	mitis (L.) Radlk.	simple	nan	3150	1450	228
420	henriquesii (Engl. & Warb.) Dubard	simple	nan	500	1	229
421	flavivillosa Schulze-Menz	simple	nan	500	300	230
422	kituiensis Vatke	simple	nan	2050	500	230
423	lapidosa Vatke	simple	nan	1500	900	230
424	tenuirostris Steud. ex Choisy	simple	nan	2710	1650	230
425	wightii (Wall.) Choisy	simple	nan	2400	1040	230
426	cauliflora Verdc.	simple	nan	500	1	231
427	narcissodora K. Schum.	simple	nan	450	1	232
428	dichotomum Vahl	simple	nan	1800	1200	233
429	dichotomum Vahl galled fruit	simple	nan	1800	1200	233
430	grandiflorum L. ssp. floribundum (R. Br. ex Fresen.) P.S. Green	compound	nan	2400	1600	233
431	fluminense Vell.	compound	nan	2000	1	233
432	meyerijohannis Engl.	simple	nan	400	1	233
433	stenolobum Rolfe	simple	nan	100	1	233
434	palmata (Lam.) Miers	simple	nan	200	1	234
435	spicata Pax	simple	nan	1200	1	235
436	stuhlmannii Pax	simple	nan	1050	1	235
437	procera Hochst. ex Endl.	nan	nan	\N	\N	236
438	flava (Forssk.) Vahl	simple	nan	2260	1	237
439	laniflora (Forssk.) R. Br.	nan	nan	\N	\N	238
440	foetidissima (Jacq.) Cogn.	simple	nan	2000	1	239
441	gijef (J.F. Gmel.) C. Jeffrey	simple	nan	1500	200	239
442	hirtella (Naudin) Cogn.	simple	nan	2100	600	239
443	pseudogijef (Gilg) C. Jeffrey	compound	nan	1150	600	239
444	gueinzii (Sond.) Bridson	simple	nan	2500	150	240
445	zanzibarica (Klotzsch) Bridson	simple	nan	450	1	240
446	africana (Lam.) Benth. ssp. africana	compound	nan	1750	1	241
447	africana (Lam.) Benth. ssp. moosa (Sprague) Bidgood & Verdc.	compound	nan	2250	1200	241
448	abyssinica (Hook f.) C. Jeffrey	simple	nan	3000	900	242
449	sphaerica (Sond.) Naudin	simple	nan	1700	1	242
450	pallidiflora (Bullock) Lantz	simple	nan	450	1	422
451	zanguebaricus Hiern	simple	nan	500	1	243
452	sp.	nan	nan	\N	\N	244
453	buchananii (Hallier f.) Stapf	simple	nan	2150	1350	244
454	kirkii Dyer	simple	nan	500	1	244
455	parvifolia K. Schum.	simple	nan	100	1	244
456	watsoniana Rombouts	simple	nan	150	1	244
457	sp.	nan	nan	\N	\N	245
458	schimperi (Hochst. ex A. Rich.) Engl.	compound	nan	1900	1300	245
459	schweinfurthii (Engl.) Engl.	compound	nan	1850	1	245
460	triphylla (A. Rich.) Engl.	compound	nan	1650	50	245
461	welwitschii (Hiern) Engl.	compound	nan	450	1	245
462	camara L.	simple	nan	1900	1	246
463	trifolia L.	simple	nan	2350	900	246
464	viburnoides (Forssk.) Vahl	simple	nan	1950	1	246
465	kilimandscharicus K. Schum.	simple	nan	2500	1500	247
466	pervillei Baill.	simple	nan	10	1	248
467	inermis L.	simple	nan	1400	1	249
468	fraxinifolius Baker	compound	nan	1200	1	250
469	guineensis G. Don	compound	nan	1600	1450	251
470	volkensii (Gürke) J.-F. Leroy	compound	nan	2550	1550	252
471	senegalensis (Juss. ex Poir.) Leenh.	compound	nan	1900	1	253
472	platyphylla (Hiern) Wernham	simple	nan	1650	1	254
473	usambarensis K. Schum.	simple	nan	1850	350	255
474	stellatus Diels	simple	nan	400	1	256
475	somalensis Vatke	simple	nan	1750	1350	257
476	chinensis Sonn.	nan	nan	\N	\N	258
477	mauritiana Gmelin	simple	nan	1750	1	260
478	cylindrica M. Roem.	simple	nan	1500	800	261
479	capensis (Baill.) Benth. ex Sim.	simple	nan	2100	300	262
480	angolensis DC.	simple	nan	1700	1	263
481	crassifolia Forssk.	simple	nan	1350	1	263
482	decumbens (Brongn.) DeWolf	nan	nan	\N	\N	263
483	kaessneri Gilg & Gilg-Ben.	simple	nan	500	50	263
484	kirkii (Oliv.) F. White	simple	nan	1000	1	263
485	triphylla A. Rich.	compound	nan	2300	1	263
486	lanceolata Forssk.	simple	nan	2800	1300	264
487	eminii Engl. ssp. eminii	simple	nan	1650	1550	265
488	zanguebarica J. Kirk ex Oliv.	compound	nan	500	1	266
489	indica L.	simple	nan	1500	1	267
490	butugi Chiov.	simple	nan	2100	1400	268
491	sansibarensis (Engl.) Dubard	simple	nan	450	1	268
492	sulcata (Engl.) Dubard	simple	nan	900	1	268
493	discoidea (Baill.) G.L. Webster	simple	nan	1950	1	269
494	abyssinica (Hochst.) Schltr.	simple	nan	2000	1000	270
495	macrantha (Klotzsch) Schltr.	simple 	nan	1150	1	270
496	rubicunda (K. Schum.) N.E. Br.	simple 	nan	1300	1	270
497	schimperi Decne.	simple	nan	2400	1650	270
498	stelostigma K. Schum.	simple	nan	1050	300	270
499	arbutifolia (Hochst. ex A. Rich.) Loes.	simple	nan	2350	1600	203
500	buchananii Loes.	nan	nan	\N	\N	203
501	heterophylla (Eckl. & Zeyh.) Loes.	simple	nan	2700	1	203
502	keniensis (Loes.) Jordaan	simple	nan	2500	1350	203
503	mossambicensis (Klotzsch) Loes.	simple	nan	1400	1	203
504	undata (Thunb.) Blakelock	simple	nan	3200	1	271
505	ovata (Cav.) Spreng.	simple	nan	1900	5	272
506	azedarach L.	compound	nan	\N	\N	273
507	volkensii Gürke	compound	nan	1650	400	273
508	hedbergiorum (Borhidi) Borhidi	simple	nan	450	1	431
509	excelsa (Welw.) C. C. Berg	simple	nan	1350	1	274
510	aedificatoria Mildbr.	simple	nan	400	50	275
511	bagshawei S. Moore	simple	nan	2400	1200	275
512	kummel A. DC.	simple	nan	2250	1200	275
513	obtusifolia Lam.	simple	nan	400	1	275
514	fragrans Verdc.	simple	nan	450	1	277
515	boivinii Baill.	simple	nan	1650	150	278
516	calantha Gilg	simple	nan	1900	400	278
517	cissoides Benth.	compound	nan	1850	1100	278
518	foetida Schumach.	simple	nan	3000	1200	278
519	friesiorum (Harms) C. Jeffrey	compound	nan	2850	1600	278
520	leiocarpa Gilg	simple	nan	450	1	278
521	peteri A. Zimm.	compound	nan	1000	200	278
522	pterocarpa Hochst. ex A. Rich	compound	nan	2500	1600	278
523	rostrata A. Zimm.	compound	nan	1850	1	278
524	trifoliolata Hook. f.	compound	nan	1200	1	278
525	faulknerae Verdc.	simple	nan	400	1	279
526	fornicata (Baill.) Verdc.	simple	nan	450	1	279
527	parvifolia (Oliv.) Verdc. ssp. kenyensis Verdc.	simple	nan	1500	1050	279
528	schweinfurthii (Engl. & Diels) Verdc.	simple	nan	2100	1350	279
529	grandidieri Baill.	simple	nan	400	1	280
530	myristica (Gaertn.) Dunal	simple	nan	1650	1550	280
531	stenopetala (Baker f.) Cufod.	compound	nan	1200	450	281
532	mesozygia Stapf.	simple	nan	1650	1200	282
533	brunonis Didr.	simple	nan	450	1	283
534	sclerocarpa (K. Schum.) Bridson	simple	nan	400	300	284
535	arcuata Lam. ex Poir.	simple	nan	1650	1050	285
536	monticola Krause	nan	nan	\N	\N	285
537	holstii Engl.	compound	nan	2100	1500	286
538	africana L.	simple	nan	3000	1500	287
539	aethiopicum (Thunb.) Loes.	simple	nan	2400	1	288
540	macrocalyx Pax	simple	nan	2700	1600	289
541	physalodes (L.) Gaertn.	simple	nan	200	130	290
542	holtzii Gilg	simple	nan	2300	1750	292
543	insculpta Sleumer	simple	nan	2450	1500	292
544	kirkii Oliv. ssp. multisetosa Verdc.	nan	nan	\N	\N	292
545	mossambicensis Klotzsch	simple	nan	800	1	292
546	ovata F. Hoffm.	simple	nan	2100	550	292
547	thomasiana Engl. & Gilg	simple	nan	500	1	292
548	obtusifolia De Wild.	simple	nan	450	300	293
549	somalensis (Chiov.) Milne-Redh.	compound	nan	450	1	294
550	capensis L ssp. macrocarpa (C. H. Wright) I. Verd.	simple	nan	2550	1150	295
551	europaea L. ssp. cuspidata (Wall. ex G. Don) Cif.	simple	nan	2400	950	295
552	welwitschii (Knobl.) Gilg & Schnellenb.	simple	nan	2550	1150	295
553	woodiana Knobl. ssp. disjuncta P. S. Green	simple	nan	450	1	295
554	rochetiana A. Juss.	simple	nan	3050	1700	296
555	calophylla (Baill.) Venter	simple 	nan	\N	\N	309
556	tenuiloba Stapf	simple	nan	1500	1	297
557	routledgei Sprague	simple	nan	2300	1500	298
558	spinosa Forssk.	simple	nan	1800	1	298
559	kelleri (Engl.) M.G. Gilbert	simple	nan	1110	15	299
560	ugogensis (Engl.) Wiens & Polhill	simple	nan	1425	10	299
561	odoratum Diels	simple	nan	50	1	300
562	amentacea Roxb.	simple	nan	2000	1	301
563	sp.	nan	nan	\N	\N	302
564	prolatior J.H. Kirkbr.	simple	nan	3000	1000	129
565	sp.	simple	nan	1100	800	129
566	cernua Loefl.	none	nan	1127	1127	303
567	lanceolata Hochst. & Steud.	simple	nan	2550	900	304
568	reticulatum (P. Beauv.) Farron	simple	nan	450	350	71
569	sacleuxii (Tiegh.) Farron	simple	nan	450	1	71
570	goetzei K. Schum. ssp. keniensis Bridson	simple	nan	1700	1	305
571	pyriformis (Hochst.) Skeels ssp. brevitubus Bridson	simple	nan	1800	900	305
572	speciosus DC. ssp. stenocarpus (K. Schum.) Bridson	simple	nan	2200	1400	305
573	zanguebaricus (Hiern) Bridson	simple	nan	500	1	305
574	insignis Delile ssp. reticulata (Baker f.) J.B. Gillett	simple	nan	2000	1	306
575	obovata (Oliv.) R. Fern. & A. Fern.	simple	nan	300	1	306
576	kirkii Rendle	simple	nan	50	1	307
577	capensis Eckl. & Zeyh.	simple	nan	2300	1050	308
578	ligularis Juss.	simple	nan	\N	\N	310
579	molissima (Kunth) L.H. Bailey	simple	nan	1800	1400	310
580	suberosa L.	simple	nan	2500	0	310
581	subpeltata Ortega	simple	nan	2060	1500	310
582	pinnata L.	compound	nan	1500	1	311
583	paucinervis (Hiern) Bremek.	simple	nan	2500	1700	312
584	abyssinica Fresen.	simple	nan	2550	1500	313
585	crebrifolia Hiern	simple	nan	950	1	313
586	stenosepala K. Schum. ssp. stenosepala	simple	nan	450	1	313
587	tarennoides S. Moore	simple	nan	450	300	313
588	teitana K. Schum.	simple	nan	1500	650	313
589	burchellii (DC.) R.A. Dyer	simple	nan	2300	100	314
590	urens Cav.	simple	nan	2900	1250	314
591	fischeri Engl.	simple	nan	2300	1800	315
592	umbellulata (Baill.) Hiepko	simple	nan	850	1	316
593	insipidum (E. Mey.) Liede & Khanum	simple	nan	1850	1	133
594	lanceolata (Forssk.) Deflers	simple	nan	2830	1200	317
595	zanzibarica (Klotzsch) Vatke	simple	nan	2500	1	317
596	vogelii (Hook. f.) Engl.	simple	nan	2600	10	318
597	daemia (Forssk.) Chiov. ssp. daemia	simple 	nan	2415	1	319
598	linearifolia Quart.-Dill. & A. Rich.	simple	nan	2400	1700	320
599	reclinata Jacq.	compound	nan	2400	1	321
600	usuiensis (Oliv.) M.G. Gilbert	simple	nan	2600	1150	322
601	reticulatus Poir.	simple	nan	1000	1	323
602	dodecandra	simple	nan	2400	1400	324
603	octandra L.	simple	nan	2400	1500	324
604	capense L.f.	simple	nan	2700	1200	325
605	guineense Schumach. & Thonn.	simple	nan	1650	1450	325
606	umbellatum L.	simple	nan	2100	1150	325
607	aethiopica Kokwaro	compound	nan	2400	800	326
608	viridiflorum Sims	simple	nan	2050	1450	327
609	viridiflorum Sims	simple	nan	2550	1300	327
610	pycnantha (K. Schum.) Stapf	simple	nan	1500	1	328
611	gracilior (Pilg.) C.N. Page	simple	nan	2700	1250	14
612	latifolius (Thunb.) R.Br. ex Mirb.	simple	nan	3350	1500	329
613	campestris Aiton	simple	nan	2500	1875	330
614	stuhlmannii (Engl.) Chaowasku	simple	nan	50	1	222
615	fulva (Hiern) Harms	compound	nan	2300	1400	331
616	multiflora Hiern	simple	nan	250	1	332
617	parvifolia Hiern	simple	nan	450	1	332
618	adolfi-friedericii (Engl.) A. Meeuse ssp. usambarensis (J.H. Hemsl.) L. Gaut.	simple	nan	1800	1450	333
619	alnifolia (Baker) Roberty	simple	nan	400	50	333
620	altissima (A. Chev.) Baehni	simple	nan	1650	1550	333
621	chrysoclada (Bojer) Gürke	simple	nan	450	1	334
622	hildebrandtii Gürke	simple	nan	1000	1	334
623	maxima T.C.E. Fries	simple	nan	1800	1150	334
624	oligotricha Baker	nan	nan	\N	\N	1
625	resinosa (Hochst.) Schauer ssp. holstii (Gürke) Verdc.	simple	nan	1950	1	334
626	resinosa (Hochst.) Schauer ssp. resinosa	simple	nan	1050	1	334
627	africana (Hook.f.) Kalkman	simple	nan	2750	1350	335
628	padus L.	simple	nan	\N	\N	335
629	mossambicensis (Sim) Verdc.	compound	nan	500	1	336
630	guajava L.	simple	nan	1800	1	337
631	alsophila K. Schum.	simple	nan	1800	1650	338
632	amboniana K. Schum.	simple	nan	400	1	338
633	bagshawei E.M.A. Petit	simple	nan	1700	1550	338
634	capensis (Eckl.) Vatke ssp. riparia (K. Schum. & K. Krause) Verdc.	simple	nan	1450	1	338
635	capensis (Eckl.) Vatke ssp. riparia (K. Schum. & K. Krause) Verdc. var. puberula (E.M.A. Petit) Verdc.	simple	nan	950	50	338
636	faucicola K. Schum.	simple	nan	400	1	338
637	fractinervata E.M.A. Petit	simple	nan	2550	1900	338
638	holtzii (K. Schum.) E.M.A. Petit	simple	nan	500	1	338
639	punctata Vatke	simple	nan	2100	250	338
640	lauracea (K. Schum.) E.M.A. Petit	simple	nan	1900	1	338
641	leucopoda E.M.A. Petit	nan	nan	\N	\N	338
642	mahonii C. Wright	simple	nan	2400	1400	338
643	orophila E.M.A. Petit	simple	nan	2650	1650	338
644	peduncularis (Salisb.) Steyerm.	simple	nan	1650	1200	338
645	petitii Verdc.	simple	nan	1850	1400	338
646	pseudoplatyphylla E.M.A. Petit	simple	nan	1850	1500	338
647	punctata Vatke	simple	nan	350	150	338
648	punctata Vatke	simple	nan	100	1	338
649	punctata Vatke	simple	nan	450	1	338
650	schliebenii E.M.A. Petit	simple	nan	450	1	338
651	tanganyikensis Verdc.	simple	nan	400	300	338
652	faulknerae Bridson	simple	nan	500	1	339
653	polhillii Bridson	simple	nan	450	1	339
654	lappacea (L.) Juss.	simple	nan	2060	10	340
655	littoralis Pax	simple	nan	150	1	341
656	meyeri (Gürke) A.J. Paton	simple	nan	3000	1900	110
657	kaurabassana Baill.	simple	nan	1150	1	342
658	malvifolia Engl.	simple	nan	1500	1	342
659	silvestris Cheek & Jongkind	compound	nan	400	50	343
660	melanophloeos (L.) Mez.	simple	nan	3800	1200	344
661	caffra Sond.	simple	nan	1900	650	345
662	mannii Stapf	simple	nan	2400	1050	345
663	mombasiana Stapf	simple	nan	450	1	345
664	lucida Harv. & Sond.	simple	nan	1800	50	346
665	reticulata Gilg	simple	nan	1770	1550	346
666	prinoides	simple	nan	3150	1500	347
667	staddo A. Rich	simple	nan	2950	1500	347
668	beninensis (Hook. f. ex Planch.) Planch. ex Benth.	simple	nan	1550	300	349
669	mucronata Lam.	simple	nan	10	1	350
670	revoilii Planch.	compound	nan	2100	1	352
671	tridentata (L. f.) Wild & R.B. Drumm.	compound	nan	2250	1	352
672	longipes (Engl.) Moffett	compound	nan	2400	1000	378
673	natalensis (Bernh. ex C. Krauss) F.A. Barkley	compound	nan	2700	1	378
674	rupsolii (Engl.) Moffett	compound	nan	2400	1500	378
675	pyroides (Burch.) Moffett	compound	nan	2700	1200	378
676	viscosa (Roth) DC.	compound	nan	450	1	353
677	communis L.	simple	nan	2100	500	354
678	arborea (Thouars) Baill.	simple	nan	500	1	355
679	brachypetala (Turcz.) Kuntze	simple	nan	1650	1400	355
680	convallarioides (Baker f.) Eyles ssp. marsabitensis Grey-Wilson	simple	nan	1800	1300	355
681	elliptica (Oliv.) Kuntze	simple	nan	250	1	355
682	ferruginea Engl.	simple	nan	450	300	355
683	ilicifolia (Oliv.) Kuntze	simple	nan	450	1	355
684	squamosa (Tul.) Baill. ssp. kaessneri (Engl.) Grey-Wilson	simple	nan	400	1	355
685	albersii Gilg	compound	nan	2400	1100	356
686	capparoides (Andrews) Britten	compound	nan	450	1	356
687	myricoides (Hochst.) Steane & Mabb.	simple	nan	2400	150	357
688	fischeri (K. Schum) Bullock ssp. verdcourtii Bridson	simple	nan	1600	600	358
689	manganjae (Hiern) Keay	simple	nan	1800	1150	358
690	urcelliformis (Hiern) Robyns	simple	nan	1750	1200	358
691	coccinea (Schumach. & Thonn.) Benth. ssp. boiviniana (Baill.) Jongkind	compound	nan	100	1	359
692	minor (Gaertn.) Alston	compound	nan	350	200	359
693	orientalis Baill.	compound	nan	300	1	359
694	thomsonii (Bak.) Jongkind	compound	nan	2500	1450	359
695	cordifolia L. ssp. conotricha (Gand.) Verdc.	simple	nan	3120	1240	360
696	apetalus Poir.	compound	nan	2700	1450	361
697	keniensis Standl.	compound	nan	2750	1950	361
698	niveus Thunb.	compound	nan	1800	1350	361
699	pinnatus Willd.	compound	nan	2750	1500	361
700	rigidus Sm.	compound	nan	2200	1700	361
701	rosifolius Sm.	compound	nan	1700	1400	361
702	scheffleri Engl.	compound	nan	2550	1600	361
703	steudneri Schweinf.	compound	nan	3150	1900	361
704	fuscescens Hiern ssp. bracteata Bridson	simple	nan	1650	1300	362
705	bugoyensis (K. Krause) Verdc. ssp. bugoyensis	simple	nan	1650	1450	363
706	celastroides (Baill.) Verdc.	simple	nan	450	1	363
707	decussata (K. Schum.) Robyns	simple	nan	400	300	363
708	eickii (K. Schum. & K. Krause) Bullock	simple	nan	1750	1550	363
709	induta (Bullock) Lantz	simple	nan	2250	1800	422
710	mrimaense (Verdc.)Lantz	simple	nan	200	1	73
711	uhligii (K. Schum. & K. Krause) Verdc.	simple	nan	2400	1050	363
712	comorensis (Bojer ex A.DC.) Pichon	simple	nan	1800	1	364
713	cerasifera Welw. ex Oliv.	simple	nan	1900	1300	365
714	elegans Welw. ex Oliv.	simple	nan	500	1	365
715	erecta (G. Don) Walp.	simple	nan	300	1	365
716	leptoclada Tul.	simple	nan	200	50	365
717	madagascariensis (Lam.) DC.	simple	nan	500	1	365
718	stuhlmanniana Loes.	simple	nan	900	1	365
719	persica L. var. cyclophylla (Chiov.) Cufod.	simple	nan	1500	1	366
720	ebulus L. ssp. africana (Engl.) R.Bolli	compound	nan	3370	1750	367
721	robusta N. E. Br.	simple	nan	1680	150	368
722	trifoliatus L.	compound	nan	\N	\N	2
723	multiflorus (Martyn) Raf.	simple	nan	2250	5	369
724	plumieri (L.) Vahl	simple	nan	3	1	370
725	taccada (Gaertn.) Roxb.	simple	nan	3	1	370
726	barteri Seem.	compound	nan	1600	1500	42
727	volkensii (Harms) Lowry, G.M. Plunkett & al.	compound	nan	2900	1550	42
728	molle L.	nan	nan	\N	\N	372
729	terebinthifolia Raddi	compound	nan	\N	\N	372
730	coffaeoides Baill.	simple	nan	500	1	373
731	alata (Hochst.) Welw.	compound	nan	2400	1500	374
732	birrea (A. Rich.) Hochst.	compound	nan	1800	1	375
733	theifolia Gilg	simple	nan	2400	1700	376
734	myrtina (Burm. f.) Kurz	simple	nan	2750	1	377
735	africana (Oliv.) Bullock	nan	nan	\N	\N	379
736	sp.	nan	nan	\N	\N	380
737	septemtrionalis (Viv.) H.S. Irwin & Barneby	compound	nan	2200	1450	380
738	elliptica (Hochst.) Esser	simple	nan	2100	1000	381
739	inerme L. ssp. diospyroides (Baker) J.H. Hemsl.	simple	nan	900	1	382
740	anceps Willd.	simple	nan	2400	1	383
741	aculeastrum Dunal	simple	nan	2650	1800	384
742	aculeatissimum Jacq.	simple	nan	2640	1425	384
743	anguivi Lam.	simple	nan	2700	1500	384
744	arundo Mattei	simple	nan	1700	250	384
745	coagulans Forssk.	simple	nan	1890	60	384
746	dasyphyllum Schumach. & Thonn.	simple	nan	1500	150	384
747	dennekense Dammer	simple	nan	1750	1550	384
748	goetzei Dammer	simple	nan	750	1	384
749	campylacanthum A. Rich.	simple	nan	2350	1	384
750	sp.	simple	nan	10	1	384
751	sp.	nan	nan	\N	\N	384
752	sp.	simple	nan	\N	\N	384
753	agnewiorum Voronts.	simple	nan	2400	2250	384
754	mauritianum Scop.	simple	nan	2750	1450	384
755	zanzibarense Vatke	simple	nan	150	1	384
756	nigrum L.	simple	nan	3070	1	384
757	tettense Klotzsch	simple	nan	1500	350	384
758	richardii Dunal	simple	nan	2100	1600	384
759	schumannianum Dammer	simple	nan	2700	1350	384
760	seaforthianum Andrews	simple	nan	\N	\N	384
761	nigriviolaceum Bitter	simple	nan	2990	2130	384
762	taitense Vatke	simple	nan	1800	1	384
763	terminale Forssk.	simple	nan	2930	1500	384
764	madagascariensis DC.	compound	nan	1450	1	385
765	ricinocarpa (Eckl. & Zeyh.) Kuntze	simple	nan	3300	1550	386
766	gracilis (Engl. & Diels) Verdc. ssp. gracilis	simple	nan	300	1	387
767	abyssinica (Quart.-Dill. & A. Rich.) Walp.	simple	nan	3300	1450	388
768	cyanantha Welw. ex Hiern	simple	nan	2400	1950	388
769	africana (Lour.) Fiori (S. rhynchocarpa of KTS)	simple	nan	1000	1	389
770	scheffleri Engl.	simple	nan	2300	1200	390
771	sp. nov. "pentamera" Q. Luke ined.	simple	nan	450	300	391
772	angolensis Gilg	simple	nan	350	30	392
773	henningsii Gilg	simple	nan	2100	1	392
774	madagascariensis Poir.	simple	nan	700	1	392
775	madagascariensis Poir. form "e" of FTEA	simple	nan	700	1	392
776	mellodora S. Moore	simple	nan	450	350	392
777	mitis S. Moore	simple	nan	1950	1	392
778	panganensis Gilg	simple	nan	300	1	392
779	spinosa Lam.	simple	nan	1550	1	392
780	usambarensis Gilg	simple	nan	1800	1	392
781	zanzibariensis Baill.	simple	nan	1250	1	393
782	bicompacta Bruyns	simple	nan	1850	700	177
783	alternifolia Oliv.	simple	nan	400	1	394
784	kirkii Oliv.	simple	nan	400	1	394
785	brevipes (Baker) T.D. Penn.	simple	nan	1500	1	395
786	cerasiferum (Welw.) T.D. Penn.	simple	nan	1650	1350	395
787	subverticillatum (E.A. Bruce) T.D. Penn.	simple	nan	300	1	395
788	cordatum Krauss	simple	nan	2400	1050	396
789	cumini (L.) Skeels	simple	nan	200	1	396
790	guineense (Willd.) DC.	simple	nan	2550	1	396
791	micklethwaitii Verdc. ssp. micklethwaitii	simple	nan	1900	1350	396
792	elegans Stapf	simple	nan	200	1	397
793	pachysiphon Stapf	simple	nan	450	50	397
794	stapfiana Britten	simple	nan	2300	1500	397
795	ventricosa A. DC.	simple	nan	1650	700	397
796	leontopetaloides (L.) Kuntze	nan	nan	1100	1	398
797	portulacifolium (Forssk.) Asch. ex Schweinf.	simple	nan	2000	10	399
798	indica L.	compound	nan	1500	1	400
799	drummondii Bridson	simple	nan	450	1	401
800	graveolens (S. Moore) Degreef	simple	nan	2100	1	116
801	pavettoides (Harv.) Sim. ssp. friesiorum (K. Krause) Bridson	simple	nan	1750	1200	401
802	supra-axillare (Hemsl.) Degreef	simple	nan	400	1	116
803	stenophyllus Oliv.	simple	nan	3050	1600	196
804	grandis L. f.	simple	nan	350	1	402
805	sennii (Chiov.) Verdc. & Bridson	simple	nan	1050	50	403
806	catappa L.	simple	nan	350	1	404
807	boiviniana Baill.	simple	nan	450	1	405
808	litoralis Gilg	nan	nan	\N	\N	405
809	danis Oliv.	simple	nan	500	1	406
810	thevetia (L.) Lippold	simple	nan	\N	\N	81
811	africanum Lour.	simple	nan	2400	1	407
812	thomasii Gilg	simple	nan	900	1	407
813	gregorii S. Moore	simple	nan	2250	1800	408
814	funifera (Miers.) Oliv.	simple	nan	1850	1	409
815	caffra (Miers) Troupin	simple	nan	1950	350	410
816	oblongifolia (Engl.) Troupin	simple	nan	300	1	410
817	asiaticum (L.) Appelhans, Groppo & J. Wen	compound	nan	3000	1	439
818	orientalis (L.) Blume	simple	nan	1800	1	411
819	africana Hook. f. ssp. hildebrandtii (Vatke) Verdc.	simple	nan	50	1	412
820	microphyla Hiern	simple	nan	450	100	413
821	ovalifolia (Hiern) Tosh & Robbr.	simple	nan	1000	1	163
822	pallens Hiern	simple	nan	1400	1	413
823	emetica Vahl.	compound	nan	1450	1	414
824	sacleuxii (Pierre) Diels	simple	nan	500	50	415
825	madagascariense DC.	simple	nan	1800	1	416
826	grandifolia (Hochst.) Warb. ssp. tropica (Burkill) Sleumer	nan	nan	\N	\N	417
827	rhomboidea Jacq.	simple	nan	1900	1	418
828	tomentosa Bojer	simple	nan	2600	1100	418
829	floribunda Hochst.	simple	nan	450	1	419
830	holstii Gürke	simple	nan	2250	1350	419
831	nilotica Kotschy & Peyr.	simple	nan	450	1	419
832	robusta Gürke	simple	nan	2100	1400	419
833	wakefieldii Oliv.	simple	nan	500	1	419
834	anomalum (N.E. Br.) Meve & Liede	simple	nan	2500	1590	425
835	hypselodendron (Hochst. ex A. Rich.) T. Wells & A.K. Monro	simple	nan	2850	1550	371
836	acuminata Oliv.	simple	nan	1000	1	420
837	lucida Benth. ssp. lucida	simple	nan	1800	1	420
838	scheffleri Diels	simple	nan	1800	900	420
839	anisatum Verdc.	simple	nan	1800	1150	421
840	kirkii Verdc.	simple	nan	400	1	421
841	schmidtii W.R.Q. Luke, Dagallier & Couvreu	nan	nan	\N	\N	421
842	apiculata K. Schum.	simple	nan	2330	950	422
843	infausta Burch. ssp. rotundata (Robyns) Verdc.	simple	nan	2100	1	422
844	madagascariensis J.F. Gmel.	simple	nan	2100	750	422
845	randii S. Moore ssp. acuminata Verdc.	simple	nan	500	1	422
846	volkensii K. Schum.	simple	nan	2300	900	422
847	sp. aff. amaniensis (Engl.) Mziray	simple	nan	375	50	423
848	eugeniifolia (Engl.) I. Verd.	simple	nan	1400	1	423
849	lanceolata (Lam.) G. Don	compound	nan	100	1	423
850	nobilis (Delile) Mziray	simple,compound	nan	2550	1050	423
851	simplex Cheek ined.	simple	nan	2300	850	423
852	trichocarpa (Engl.) Mziray	compound	nan	2200	1	423
853	galamensis (Cass.) Less.	simple	nan	2200	800	424
854	fischeri Engl.	simple	nan	2300	1525	426
855	tuberculatum A. Rich.	simple	nan	2400	1650	426
856	orientalis Engl.	simple	nan	400	1	427
857	doniana Sweet	compound	nan	1900	1200	428
858	ferruginea Schumach. & Thonn.	compound	nan	400	1	428
859	keniensis Turrill	compound	nan	2100	1300	428
860	mombassae Vatke	compound	nan	450	1	428
861	payos (Lour.) Merr.	compound	nan	1200	1	428
862	schliebenii Moldenke	compound	nan	300	1	428
863	strickeri Vatke & Hildbr.	compound	nan	1800	1	428
864	ugandensis Sprague	simple	nan	2400	1600	430
865	amaniensis Gilg	simple	nan	350	1	432
866	somnifera (L.) Dunal	simple	nan	2250	30	433
867	americana L.	simple	nan	1800	1700	434
868	caffra Sond.	simple	nan	2000	1	434
869	granatum J. König	compound	nan	5	1	435
870	holtzii Engl.	simple	nan	300	1	436
871	monospora (Harv.) Baill.	simple	nan	2700	1400	437
872	golungensis Hiern	compound	nan	400	300	438
873	chalybeum Engl.	compound	nan	1800	1	439
874	rubescens Planch. ex Hook.f.	compound	nan	1650	1450	439
875	sp.	simple	nan	2330	2330	440
876	minutiflora (Cogn.) C. Jeffrey	simple	nan	2800	1100	440
877	scabra (L. f.) Sond.	simple	nan	3300	1000	440
878	abyssinica Hochst. ex A. Rich.	simple	nan	2200	700	441
879	mauritiana Lam.	simple	nan	1800	1	441
880	mucronata Willd. ssp. mucronata	simple	nan	1950	1	441
881	pubescens Oliv.	simple	nan	1350	1	441
882	spina-christi (L.) Desf.	simple	nan	600	300	441
\.


--
-- Data for Name: plants_fruit_colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_fruit_colors (plant_id, color_id) FROM stdin;
1	5
2	5
3	5
4	5
4	8
5	5
6	5
7	8
8	6
9	6
10	7
11	5
12	5
13	14
14	5
14	14
15	9
15	8
16	9
16	6
17	9
17	1
18	8
19	17
19	9
20	17
21	9
22	9
23	16
24	16
25	5
25	2
26	17
26	9
27	17
28	17
28	9
29	9
30	17
30	9
31	17
31	8
32	9
33	9
34	9
34	17
35	14
36	2
37	9
38	17
39	5
40	2
41	5
41	8
42	5
43	9
43	2
44	9
44	10
45	14
46	10
47	9
48	5
49	5
50	15
51	9
51	2
52	9
53	9
54	5
54	2
55	17
55	9
56	9
57	9
58	15
59	9
60	5
61	5
61	16
62	2
63	14
64	2
65	17
66	2
67	8
68	5
69	5
69	8
70	6
71	6
72	15
73	8
74	8
75	15
76	9
77	1
77	9
78	5
78	8
79	2
79	8
80	2
80	8
81	17
82	8
83	17
83	9
84	9
85	9
85	10
86	6
86	10
87	10
88	10
89	6
90	6
90	10
91	9
92	9
93	5
93	8
94	5
94	8
95	5
96	5
97	9
97	8
97	2
98	5
98	16
99	5
99	8
100	5
101	5
102	17
102	1
103	5
104	5
105	5
106	15
107	8
108	8
109	2
110	8
111	9
112	10
113	9
113	10
114	9
115	9
116	16
116	1
116	9
117	5
118	15
119	10
120	10
121	2
121	10
122	17
123	2
124	2
124	17
125	15
126	2
127	5
127	16
127	10
128	5
129	5
130	5
130	17
130	9
130	14
131	2
131	8
132	5
132	2
133	10
134	17
135	5
135	2
136	9
137	9
137	6
138	5
138	16
139	5
140	14
141	2
142	17
143	6
143	10
144	14
144	9
144	6
144	10
145	9
145	6
146	10
147	6
147	10
148	10
149	10
150	6
150	10
151	6
151	10
152	5
153	5
153	8
154	2
155	8
155	9
156	2
157	15
158	17
159	9
160	9
161	9
161	17
162	9
162	6
163	9
163	6
164	9
165	9
166	9
166	6
167	6
168	5
169	10
170	10
171	10
172	18
172	6
173	9
174	5
175	9
176	9
177	9
178	9
179	10
180	9
181	9
182	5
182	8
183	8
183	6
184	17
185	5
185	2
186	5
186	11
187	5
188	15
189	5
190	5
191	5
192	5
193	5
194	5
194	8
195	9
196	9
196	17
196	2
197	17
198	2
198	17
199	17
200	2
200	10
201	2
201	17
201	9
202	2
202	14
203	17
203	9
204	2
204	17
205	2
205	17
206	2
207	2
208	6
208	10
209	6
210	1
210	14
211	5
212	15
213	15
214	6
214	10
215	15
216	5
217	5
218	5
219	8
219	3
220	16
220	14
221	16
222	17
223	17
223	9
224	2
225	2
226	2
227	15
228	2
229	2
230	2
231	9
232	17
233	5
234	5
235	6
236	6
237	6
238	5
239	5
240	5
241	9
242	9
242	6
243	9
243	6
244	9
245	9
246	9
247	9
248	9
249	9
250	9
251	9
251	10
252	9
253	14
254	6
255	2
256	2
257	5
258	9
258	8
259	2
259	5
260	2
261	8
262	2
262	17
263	9
264	2
265	13
266	5
267	17
267	9
268	17
268	9
268	10
269	2
270	2
271	2
272	5
273	2
273	17
274	2
275	2
276	2
277	2
278	9
278	8
279	2
280	9
281	2
282	9
282	14
283	9
283	14
284	16
284	14
285	17
286	14
287	14
288	17
288	9
289	2
290	2
290	9
291	17
292	17
293	17
294	9
295	17
296	2
296	17
296	9
297	17
297	9
298	9
298	6
299	2
299	8
300	2
300	17
301	2
301	17
302	17
303	2
303	8
304	2
304	17
305	15
306	15
307	17
307	9
308	17
308	9
309	2
309	9
310	2
311	14
312	8
312	9
313	9
313	6
314	9
315	15
316	9
317	9
318	9
319	9
320	8
321	9
322	9
323	2
324	5
324	8
325	5
326	5
327	15
328	9
328	17
329	17
329	9
329	2
330	9
330	18
330	10
331	9
332	10
333	6
333	10
334	5
335	5
336	1
336	9
337	5
337	2
338	7
339	9
340	15
341	14
341	6
342	8
343	2
343	9
344	17
344	9
345	2
345	9
346	6
347	9
347	6
348	9
349	14
350	16
350	8
351	9
352	9
352	8
353	17
354	17
354	9
355	2
356	2
356	9
357	16
358	9
358	17
359	5
359	8
360	5
361	8
362	2
363	5
363	6
364	5
364	6
365	5
366	5
367	5
367	6
368	2
368	5
369	5
370	5
371	9
372	9
372	8
373	8
374	8
375	17
376	17
376	9
377	17
377	9
378	8
379	17
380	9
380	17
381	2
381	17
382	17
383	17
383	9
384	17
384	8
385	17
385	9
386	14
387	5
387	8
388	15
389	10
390	5
390	8
390	10
391	2
392	2
393	2
393	9
394	9
395	9
396	2
396	17
396	9
397	6
397	5
398	10
399	10
400	9
400	10
401	9
401	10
402	10
403	14
403	2
403	1
404	5
405	5
405	8
406	5
407	5
408	5
409	1
409	8
410	5
411	9
412	17
413	2
413	17
413	8
414	17
414	2
415	5
415	10
416	8
417	5
417	8
418	5
418	8
418	9
419	2
419	9
420	9
421	5
422	14
423	14
423	6
424	8
424	6
425	15
426	16
426	10
427	9
428	10
428	6
429	5
430	10
431	10
431	6
432	10
432	6
433	10
433	6
434	15
435	5
436	5
437	15
438	5
439	15
440	9
441	9
442	17
443	17
443	9
444	10
445	5
445	8
446	16
447	16
448	5
449	5
450	8
451	9
452	15
453	5
454	5
455	5
455	2
455	8
456	5
457	15
458	9
458	8
459	9
460	9
461	9
461	6
462	10
463	6
464	6
465	18
466	5
467	9
467	2
467	5
468	1
468	2
469	9
469	8
470	2
470	17
471	9
471	6
472	2
472	8
473	5
474	6
475	15
476	15
477	9
478	5
478	8
479	5
480	14
481	5
482	15
483	14
483	2
484	2
484	17
485	5
485	8
486	2
486	9
487	6
488	5
488	8
489	5
489	9
489	2
490	5
491	5
492	5
492	2
493	5
494	5
495	15
496	4
497	5
498	5
499	2
499	9
500	15
501	2
501	9
502	9
503	9
504	2
504	9
505	5
505	8
506	2
507	2
507	8
508	9
509	5
510	2
511	2
511	17
512	2
512	17
512	9
513	17
513	9
514	9
515	5
516	17
516	9
517	17
518	17
519	17
520	2
520	17
521	17
522	17
523	17
523	9
524	17
524	9
525	9
526	17
526	9
527	2
527	9
528	2
528	17
529	2
530	8
531	5
531	9
532	5
532	8
533	10
533	5
533	2
534	5
535	2
536	15
537	2
537	8
538	6
539	1
539	9
540	16
541	15
542	10
543	10
544	15
545	10
546	10
547	10
548	17
549	2
550	6
551	6
551	10
552	6
553	6
554	1
554	9
555	5
555	8
556	8
557	2
558	8
559	9
560	9
561	8
562	14
562	17
562	8
562	2
563	15
564	5
564	14
565	5
565	14
566	14
567	2
567	17
567	9
568	10
569	10
570	2
570	8
571	5
572	8
573	2
574	9
574	10
574	14
575	9
575	10
575	14
576	2
576	9
577	1
577	2
578	6
579	5
579	2
579	8
580	6
581	5
582	9
583	8
583	6
583	9
584	10
585	10
586	6
586	10
587	10
588	10
588	6
589	14
589	5
590	5
590	14
591	14
591	1
591	6
592	2
592	17
593	2
593	5
594	8
595	8
596	2
596	8
597	5
597	14
598	5
598	8
598	9
599	2
599	17
600	18
600	5
601	6
601	10
603	10
604	14
605	9
606	16
606	14
607	9
608	17
609	17
609	2
610	2
610	17
611	5
611	2
611	6
612	5
613	9
614	9
615	6
616	6
616	10
617	9
618	5
619	9
620	9
621	6
621	10
622	10
623	6
624	15
625	6
625	10
626	6
626	10
627	9
627	6
627	10
628	9
628	6
629	9
630	2
631	9
632	9
633	9
634	9
635	9
636	9
637	9
638	9
639	9
640	9
641	15
642	9
643	9
644	18
645	9
646	9
647	9
648	9
649	9
650	9
651	18
652	10
653	10
654	5
654	8
655	5
655	2
656	5
657	2
657	17
658	2
658	17
659	6
659	10
660	6
660	18
661	9
661	10
662	10
662	9
663	17
664	2
664	9
665	6
667	10
668	9
668	10
669	5
669	8
670	6
670	10
671	6
671	10
672	9
673	17
673	9
674	9
675	9
676	5
677	5
678	14
678	8
678	5
679	5
679	8
680	5
681	9
682	8
682	10
683	5
684	8
684	6
685	5
686	5
687	10
687	6
688	5
689	8
689	10
690	5
690	10
691	2
691	9
692	9
693	2
694	2
694	9
695	6
695	10
696	9
696	2
696	10
697	9
698	9
698	10
699	9
699	10
700	9
700	2
700	10
701	9
702	9
702	10
703	9
703	10
704	2
704	9
704	10
705	14
705	10
706	10
707	10
708	5
708	10
709	2
709	10
710	8
711	6
711	10
712	2
712	17
713	17
714	17
714	9
715	17
716	17
717	17
718	17
719	9
719	6
720	10
720	6
721	17
722	2
723	17
724	6
724	10
725	14
726	6
726	9
727	9
727	6
727	10
728	15
729	1
729	9
730	17
731	5
731	8
732	2
733	9
733	6
734	6
734	10
735	15
736	15
737	5
737	8
738	6
738	10
739	6
739	10
740	9
740	6
741	2
742	2
743	17
744	12
745	2
746	2
747	2
748	9
749	2
750	17
751	2
751	17
752	2
752	17
753	17
754	2
755	2
755	17
756	17
756	10
757	17
757	9
758	2
758	9
759	9
760	9
760	17
761	2
762	9
763	9
763	17
764	2
764	17
765	5
765	8
766	9
767	5
767	1
768	5
769	5
769	6
770	5
770	10
771	5
772	17
772	9
773	17
773	9
773	2
774	2
775	2
776	6
776	2
777	2
778	2
779	2
780	17
780	2
781	5
781	17
782	5
783	2
784	17
785	2
785	17
786	9
787	9
787	8
788	6
789	6
790	6
791	6
792	5
793	5
794	5
795	5
796	2
797	15
798	8
799	10
800	10
801	10
802	10
803	5
803	8
803	9
804	5
804	8
805	10
806	9
806	6
807	9
807	8
808	15
809	14
809	9
810	2
811	5
812	6
813	15
814	2
815	9
815	17
816	16
816	8
817	17
818	10
819	1
819	9
820	9
821	6
821	10
822	9
823	8
824	2
825	6
826	15
827	14
827	5
828	8
829	5
830	2
831	2
832	5
832	2
833	5
834	5
835	17
836	2
837	2
837	8
838	2
838	17
839	18
839	8
839	5
840	2
840	17
841	15
842	2
843	2
843	8
844	2
844	8
845	2
845	5
846	8
847	9
848	17
849	10
850	2
850	17
850	9
851	17
851	9
852	9
853	15
854	17
855	17
856	8
856	14
857	10
858	8
859	10
860	10
861	10
862	15
863	10
864	5
864	6
865	18
866	17
867	2
868	9
869	8
870	9
870	5
871	2
871	9
871	17
872	17
873	9
874	9
875	17
876	9
877	17
877	9
878	8
878	2
878	9
879	2
879	17
880	2
880	9
881	2
881	9
882	2
882	8
\.


--
-- Data for Name: plants_fruit_shapes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_fruit_shapes (plant_id, fruit_shape_id) FROM stdin;
1	6
2	6
3	30
4	41
5	8
5	41
6	8
6	41
7	45
8	8
9	8
10	8
11	8
12	8
12	15
13	8
14	8
15	14
16	8
16	15
17	15
18	14
18	42
19	44
20	8
21	8
22	8
22	44
23	38
24	38
25	8
25	30
26	44
27	30
28	8
29	30
30	30
31	8
32	30
33	30
34	8
35	8
36	30
37	30
38	29
39	8
40	30
41	8
42	8
43	8
44	30
45	8
45	30
46	44
46	47
47	43
48	8
49	8
50	45
51	8
52	8
53	8
54	8
55	30
55	20
56	30
57	30
58	45
59	30
60	41
60	2
61	15
62	8
63	30
64	8
65	8
66	8
67	8
68	23
69	8
69	15
70	30
71	8
72	45
73	8
74	15
75	45
76	8
77	43
78	8
79	30
80	30
81	30
82	15
83	30
84	30
85	8
86	30
87	30
88	8
89	30
90	8
90	30
91	15
92	15
93	15
93	8
94	14
94	6
95	38
95	6
96	14
97	5
97	14
98	30
99	30
100	14
100	37
101	30
102	30
103	14
103	3
104	14
104	3
104	42
105	14
105	3
106	45
107	11
108	11
109	12
110	11
111	34
112	30
113	30
114	30
115	30
116	38
117	21
118	45
119	8
119	30
120	8
120	30
121	17
122	6
122	14
123	8
124	8
124	22
125	45
126	22
127	6
128	15
129	15
130	15
130	22
131	8
132	30
132	8
133	30
134	22
135	25
136	8
136	15
137	8
138	38
139	38
140	30
140	8
141	30
142	30
143	30
144	30
144	12
145	12
146	8
146	30
147	30
148	8
149	8
150	8
150	15
151	8
152	35
153	8
153	15
154	30
155	8
155	30
156	22
156	15
156	34
157	45
158	8
159	30
160	15
161	30
162	8
163	37
164	30
165	30
166	8
167	30
168	30
169	45
170	8
171	8
172	8
172	30
173	30
174	8
175	8
176	8
176	30
177	8
178	8
179	8
180	8
181	8
182	44
183	16
184	30
184	22
185	30
186	39
187	4
188	45
189	8
190	22
191	30
192	15
193	8
194	16
194	31
194	15
195	8
196	15
196	16
197	15
197	32
198	15
199	8
200	8
201	15
202	30
203	15
204	15
205	15
206	30
206	15
207	8
207	30
208	8
209	15
210	22
211	6
212	8
213	8
214	30
215	6
215	3
216	6
216	3
217	14
217	6
218	6
218	3
219	22
220	8
221	22
222	22
223	30
224	8
224	44
225	8
226	8
227	45
228	8
229	8
230	8
231	44
232	8
233	30
234	30
235	15
236	44
237	30
238	38
238	36
238	34
239	14
239	6
240	14
240	6
241	8
242	8
243	30
244	8
245	30
245	15
246	8
247	8
248	8
249	37
250	8
251	15
251	8
252	30
253	35
254	8
254	22
255	30
256	30
257	18
258	8
259	30
259	18
260	44
261	8
261	44
262	18
263	8
264	22
265	8
266	26
267	30
268	8
269	22
270	15
271	30
272	8
272	30
273	8
274	30
275	30
276	22
277	8
277	15
278	30
279	30
279	22
280	15
281	8
282	8
282	15
283	15
284	15
285	30
286	30
287	1
288	30
289	30
290	8
291	30
292	30
292	20
293	30
293	20
294	30
294	20
295	30
295	20
296	30
296	20
297	30
297	20
298	30
299	30
299	12
300	30
301	30
302	30
303	30
304	30
304	22
305	6
306	6
307	30
308	30
309	30
310	30
310	22
311	8
311	30
312	8
313	30
313	22
314	15
315	45
316	44
317	44
318	8
319	8
320	14
321	45
322	15
323	8
323	44
324	6
324	29
325	43
326	43
327	45
328	8
329	8
330	30
331	30
332	30
333	30
334	8
335	8
336	43
337	43
338	30
339	43
340	30
341	30
342	30
343	30
344	30
344	44
345	30
345	15
346	8
347	30
348	30
349	30
350	41
351	30
352	30
352	8
353	30
354	30
355	30
355	20
356	8
357	8
358	30
359	34
359	38
359	44
360	45
361	8
362	45
363	8
364	15
365	8
365	15
366	8
367	15
367	38
368	8
369	8
370	19
371	8
371	41
372	20
373	9
374	30
375	20
376	30
376	20
377	20
378	20
379	30
379	20
380	43
380	9
381	30
381	12
382	30
382	12
383	22
384	8
384	30
385	22
386	30
387	19
388	45
389	8
390	8
390	15
391	12
391	30
392	8
393	26
393	8
394	8
395	30
395	20
396	30
397	30
398	8
399	45
400	30
401	30
402	30
403	30
403	15
404	13
405	8
406	8
407	8
407	44
408	28
409	8
410	5
411	8
412	22
413	8
413	30
414	44
415	8
416	8
417	8
417	15
418	8
418	15
419	30
420	30
421	30
422	8
422	15
423	15
424	30
425	8
426	8
427	30
427	12
428	8
429	30
430	30
431	30
432	8
433	8
434	8
435	43
436	43
437	45
438	45
439	45
440	37
441	32
442	32
442	6
443	15
443	16
444	30
444	12
445	8
446	6
447	6
447	14
448	8
449	30
450	8
451	30
452	45
453	30
454	30
455	30
456	30
457	45
458	15
459	8
460	8
461	8
462	30
463	30
464	30
465	30
466	43
467	30
468	8
469	30
470	8
471	8
472	8
473	30
474	8
475	45
476	45
477	30
478	6
479	22
480	6
480	29
481	6
481	29
482	45
483	8
483	30
484	30
485	6
485	29
486	30
487	44
488	43
489	30
489	15
490	8
490	30
491	30
492	8
493	20
494	15
494	38
495	15
496	15
497	15
498	15
498	19
499	46
500	45
501	44
501	43
502	44
503	44
504	44
505	15
506	8
507	15
508	30
509	6
510	8
510	22
511	15
512	8
512	15
513	30
514	14
515	6
516	15
517	15
518	8
519	34
520	15
520	8
521	15
521	16
522	34
522	16
522	8
523	16
523	15
524	8
524	15
525	8
526	30
527	8
528	30
528	6
529	8
529	30
530	30
531	14
532	30
533	11
533	12
534	12
535	8
535	30
536	45
537	30
538	30
539	30
539	15
540	43
541	45
542	8
543	8
544	45
545	8
546	8
547	8
548	30
549	8
549	30
550	8
551	8
551	30
552	8
553	8
553	15
554	30
555	14
556	6
556	14
557	30
558	30
559	8
560	8
560	44
561	41
562	8
563	45
564	30
564	8
565	30
565	8
566	24
567	30
568	8
569	30
570	8
571	44
572	44
573	15
574	8
575	8
576	44
577	30
578	30
579	8
580	30
581	8
582	27
582	44
583	30
584	30
585	30
586	30
587	30
588	30
589	1
590	30
591	15
592	8
593	6
593	14
594	15
595	15
596	8
597	32
598	38
598	33
598	6
599	8
600	8
600	15
601	30
603	22
604	30
605	30
606	30
607	7
608	30
609	30
610	15
611	8
611	30
612	30
613	30
614	8
615	44
616	30
617	30
618	8
618	16
619	30
619	8
620	30
620	44
621	8
621	30
622	8
623	30
623	22
624	45
625	8
626	8
627	8
628	30
629	8
629	30
630	8
630	30
631	30
631	22
632	30
633	30
634	30
635	30
636	30
636	12
637	8
637	30
638	30
639	30
639	12
640	30
641	45
642	30
643	8
644	8
645	30
646	30
647	30
647	12
648	30
648	12
649	30
649	12
650	8
651	8
652	8
652	30
653	22
653	12
654	30
655	10
655	40
656	6
657	8
658	8
659	15
660	30
661	30
661	22
662	11
663	8
664	30
665	15
667	22
668	30
669	6
669	44
670	30
671	30
672	30
672	18
673	8
674	30
675	30
676	6
676	14
677	43
678	26
678	8
678	44
679	8
680	15
680	43
681	22
682	15
683	43
683	44
683	22
684	15
684	22
685	8
686	6
687	43
687	9
688	30
689	30
690	8
690	30
691	8
692	15
692	8
693	8
694	8
695	30
696	30
696	15
697	30
697	15
698	30
699	30
699	15
700	30
700	15
701	8
702	30
703	30
704	30
705	8
706	30
707	30
707	20
708	12
709	30
709	20
710	12
711	30
712	22
713	30
714	30
715	30
716	30
717	30
718	30
719	30
720	30
721	43
722	30
723	30
724	8
724	30
725	30
726	30
727	30
727	8
728	45
729	30
730	8
731	44
732	44
733	15
733	8
734	44
735	45
736	45
737	6
738	20
739	30
740	30
741	8
742	30
743	30
744	30
745	30
746	30
747	30
748	30
749	30
750	8
750	30
751	8
752	30
752	22
753	30
754	30
755	8
755	30
756	30
757	30
758	8
758	30
759	30
760	30
761	30
761	15
762	30
763	30
763	15
764	8
765	8
766	8
767	30
768	30
769	16
770	8
771	8
772	8
772	30
773	8
774	30
775	30
776	30
777	8
777	30
778	30
779	30
780	30
781	20
782	20
782	30
783	8
784	8
785	8
786	8
787	8
788	8
789	8
790	8
791	30
792	15
793	22
794	22
795	8
796	15
796	22
797	15
798	14
799	30
800	30
801	30
802	30
803	15
803	38
804	22
805	30
806	8
807	44
808	45
809	30
810	45
811	8
812	8
813	45
814	30
814	44
815	30
815	8
816	8
816	30
817	30
818	30
819	30
820	8
821	30
822	30
823	44
824	8
824	44
825	8
826	45
827	30
828	30
829	44
830	30
831	30
832	22
833	30
833	44
834	15
834	38
835	30
836	30
836	15
837	8
838	30
838	6
839	6
840	6
840	14
841	45
842	45
843	22
844	30
844	22
845	22
846	22
847	8
848	8
848	30
849	20
850	8
850	30
851	8
851	30
852	8
853	45
854	8
855	8
856	30
857	8
858	30
859	8
860	30
861	8
861	30
862	45
863	30
864	30
865	30
866	30
867	30
868	8
869	30
869	22
870	6
870	14
871	8
871	15
872	8
873	8
874	30
875	30
876	8
877	30
878	30
879	30
880	30
881	30
882	30
\.


--
-- Data for Name: plants_fruit_sizes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_fruit_sizes (plant_id, fruit_size_id) FROM stdin;
1	3
2	3
2	4
3	1
4	2
4	3
5	2
5	3
6	2
6	3
7	1
8	3
8	4
9	1
9	2
9	3
10	5
11	4
12	3
12	4
13	4
13	5
14	3
14	4
15	5
16	5
17	5
18	5
19	2
19	3
20	1
21	1
22	1
23	4
23	5
24	5
25	1
25	2
26	1
27	1
28	1
29	1
29	2
30	1
31	2
31	3
32	1
32	2
33	1
33	2
34	4
34	5
35	3
35	4
36	4
36	5
37	3
37	4
38	5
39	5
40	3
40	4
40	5
41	4
41	5
42	4
42	5
43	2
43	3
44	1
45	1
46	1
47	2
48	1
49	2
51	2
51	3
52	2
52	3
53	2
53	3
54	5
55	1
56	1
56	2
57	1
57	2
59	1
60	2
60	3
61	2
61	3
61	4
62	2
62	3
63	1
63	2
64	4
64	5
65	3
65	4
66	3
66	4
67	4
67	5
68	4
68	5
69	4
69	5
70	2
71	2
71	3
72	1
73	4
73	5
74	3
74	4
76	4
76	5
77	3
77	4
78	5
79	1
79	2
80	2
80	3
81	1
81	2
81	3
82	1
83	1
83	2
84	1
85	1
86	1
86	2
87	1
87	2
88	1
88	2
89	1
89	2
90	1
90	2
91	1
91	2
92	2
92	3
93	5
94	5
95	5
96	5
97	5
98	4
98	5
99	4
99	5
100	5
101	5
102	2
102	3
103	5
104	5
105	5
107	1
107	2
108	1
108	2
109	1
109	2
110	1
110	2
111	4
111	5
112	1
112	2
113	1
113	2
114	3
114	4
114	5
115	1
115	2
115	3
116	5
117	4
117	5
119	1
119	2
120	1
120	2
121	1
121	2
122	4
122	5
123	2
123	3
124	2
124	3
126	5
127	4
127	5
128	1
128	2
129	1
129	2
130	1
131	3
132	3
132	4
133	1
133	2
134	1
135	1
136	1
136	2
137	5
138	5
139	5
140	1
140	2
141	2
141	3
142	1
142	2
143	1
144	1
145	1
146	1
147	1
148	1
149	1
150	3
151	3
151	4
152	1
152	2
153	1
153	2
154	4
154	5
155	3
155	4
155	5
156	3
156	4
158	1
159	1
160	1
160	2
161	1
161	2
162	3
162	4
163	1
163	2
164	1
164	2
165	1
165	2
166	1
166	2
166	3
167	1
167	2
168	1
169	1
169	2
170	1
171	1
172	1
172	2
173	1
174	4
175	5
176	3
176	4
177	5
178	5
179	1
180	2
180	3
181	1
181	2
181	3
182	2
182	3
183	1
183	2
184	2
184	3
185	1
185	2
186	2
186	3
187	4
189	1
189	2
189	3
190	1
190	2
191	3
191	4
192	2
192	3
193	2
194	3
194	4
195	2
195	3
196	3
197	2
197	3
198	1
198	2
199	2
199	3
200	4
201	2
201	3
202	3
202	4
203	1
203	2
204	1
204	2
205	1
205	2
205	3
206	2
206	3
207	5
208	1
209	1
209	2
210	5
211	2
211	3
212	1
213	1
214	1
215	5
216	4
216	5
217	4
217	5
218	4
218	5
219	1
220	1
220	2
221	4
222	1
222	2
223	1
223	2
224	5
225	5
226	5
228	5
229	5
230	5
231	1
231	2
232	1
232	2
233	1
234	1
235	1
236	1
236	2
237	1
238	5
239	5
240	5
241	1
241	2
242	1
242	2
243	1
243	2
244	1
244	2
245	1
245	2
246	1
246	2
247	1
247	2
247	3
248	2
249	2
249	3
250	1
250	2
251	1
251	2
252	1
252	2
253	2
253	3
254	2
254	3
255	2
255	3
256	2
256	3
257	3
257	4
257	5
258	2
258	3
259	2
259	3
260	2
260	3
260	4
260	5
261	3
261	4
262	3
262	4
262	5
263	1
263	2
264	3
264	4
264	5
265	3
265	4
266	3
266	4
267	1
267	2
268	1
268	2
269	3
269	4
270	3
271	2
271	3
272	2
272	3
273	3
273	4
274	2
274	3
274	4
275	3
275	4
276	3
276	4
277	2
277	3
278	3
278	4
279	4
280	2
280	3
281	2
281	3
281	4
282	2
282	3
283	3
283	4
284	3
284	4
285	1
285	2
286	1
286	2
287	1
288	3
288	4
289	4
290	2
290	3
291	1
291	2
291	3
292	2
292	3
293	1
293	2
294	1
294	2
295	2
295	3
296	1
296	2
297	2
297	3
298	2
298	3
299	2
299	3
300	3
300	4
301	3
301	4
302	2
302	3
303	1
303	2
304	1
306	1
307	1
308	1
309	2
309	3
310	2
310	3
311	1
311	2
312	2
312	3
312	4
313	1
314	4
316	1
317	1
318	3
318	4
319	2
319	3
320	5
322	1
322	2
323	3
323	4
324	5
325	1
326	1
328	1
328	2
329	1
329	2
329	3
330	1
330	2
331	1
331	2
332	1
332	2
333	1
333	2
334	5
335	5
336	2
336	3
337	1
338	3
339	1
339	2
340	1
341	1
341	2
342	3
342	4
343	1
343	2
343	3
344	1
344	2
344	3
344	4
345	2
345	3
345	4
346	1
346	2
347	2
347	3
348	1
348	2
349	1
350	5
351	1
351	2
352	1
353	3
353	4
354	3
354	4
355	3
355	4
356	5
357	5
358	1
358	2
359	5
360	1
361	5
363	5
364	5
365	5
366	5
367	5
368	4
368	5
369	2
369	3
370	3
370	4
371	1
371	2
371	3
372	2
372	3
373	1
373	2
373	3
374	1
375	1
375	2
376	1
376	2
377	1
377	2
378	1
378	2
379	1
380	1
380	2
381	1
381	2
382	1
383	1
383	2
384	1
384	2
385	1
385	2
386	3
386	4
387	2
387	3
388	1
389	1
389	2
390	2
390	3
391	3
391	4
392	2
392	3
393	2
393	3
394	3
394	4
395	1
395	2
396	1
397	1
397	2
398	1
398	2
399	1
399	2
400	1
400	2
401	1
402	1
403	4
403	5
404	2
404	3
405	3
405	4
406	2
406	3
407	1
408	2
409	1
410	5
411	3
411	4
412	1
412	2
413	2
413	3
414	2
414	3
415	4
415	5
416	2
416	3
417	2
417	3
418	1
418	2
419	1
420	4
420	5
421	2
421	3
422	2
422	3
423	3
423	4
424	1
425	2
426	5
427	1
427	2
427	3
428	1
428	2
430	1
431	1
432	1
432	2
433	1
433	2
434	2
434	3
434	4
435	1
435	2
436	1
436	2
438	1
440	2
440	3
441	2
441	3
442	5
443	2
443	3
444	1
444	2
445	1
445	2
446	5
447	5
448	5
449	5
450	2
450	3
451	1
451	2
453	4
453	5
454	4
454	5
455	4
455	5
456	4
456	5
458	1
458	2
459	1
459	2
460	1
460	2
461	1
462	1
463	1
464	1
465	1
465	2
466	1
466	2
467	1
468	1
468	2
469	1
469	2
470	1
470	2
470	3
471	2
471	3
472	3
472	4
473	1
473	2
474	3
474	4
475	1
477	2
477	3
478	5
479	1
480	5
481	4
481	5
483	1
483	2
484	3
484	4
485	3
485	4
486	1
487	3
487	4
488	3
488	4
489	5
490	3
490	4
491	1
491	2
492	1
492	2
493	1
493	2
494	5
495	5
496	5
497	5
498	5
499	1
501	1
502	2
502	3
503	1
503	2
504	1
505	1
505	2
506	2
506	3
507	4
507	5
508	1
509	5
510	3
511	2
511	3
511	4
512	2
512	3
513	2
513	3
513	4
514	4
514	5
515	5
516	5
517	4
517	5
518	5
519	5
520	5
521	5
522	5
523	5
524	5
525	1
525	2
526	1
526	2
526	3
526	4
527	1
527	2
527	3
527	4
528	1
528	2
528	3
528	4
529	4
529	5
530	5
531	5
532	1
533	1
533	2
534	3
534	4
535	2
535	3
537	4
537	5
538	1
539	1
539	2
539	3
540	2
540	3
542	1
542	2
543	1
543	2
545	1
545	2
546	1
546	2
547	1
548	3
548	4
549	2
549	3
550	2
550	3
551	1
551	2
552	2
552	3
553	1
553	2
553	3
554	1
554	2
555	5
556	5
557	5
558	5
559	1
560	1
561	4
561	5
562	2
562	3
563	5
564	3
564	4
565	3
565	4
566	1
566	2
567	1
568	1
569	1
570	4
570	5
571	3
571	4
572	4
572	5
573	4
573	5
574	1
574	2
575	1
575	2
576	5
577	1
577	2
578	4
578	5
579	5
580	1
580	2
581	5
582	2
582	3
582	4
583	1
584	1
584	2
585	1
585	2
586	1
587	1
588	1
589	1
590	1
591	1
591	2
591	3
592	2
592	3
593	5
594	1
595	1
595	2
596	5
597	5
598	5
599	1
599	2
600	1
600	2
601	1
603	1
603	2
604	1
605	1
606	1
607	1
608	1
608	2
609	1
609	2
610	2
610	3
611	2
611	3
612	1
612	2
613	1
614	1
614	2
615	1
616	1
616	2
617	1
617	2
618	3
618	4
619	2
619	3
620	2
620	3
621	1
622	1
623	1
623	2
625	1
626	1
627	1
627	2
628	1
628	2
629	4
629	5
630	5
631	1
632	1
633	1
634	1
635	1
636	1
637	1
638	1
639	1
640	1
642	1
643	1
644	1
645	2
645	3
646	1
646	2
647	1
648	1
649	1
650	1
651	1
652	1
653	1
653	2
654	1
655	4
655	5
656	4
656	5
657	2
657	3
658	2
658	3
659	4
659	5
660	1
661	1
661	2
661	3
662	1
662	2
663	1
663	2
664	3
664	4
665	3
665	4
667	1
668	2
668	3
669	4
669	5
670	1
670	2
671	1
671	2
672	1
673	1
674	1
675	1
676	2
676	3
677	2
677	3
678	2
678	3
678	4
679	2
679	3
680	2
680	3
681	1
681	2
682	2
682	3
683	2
683	3
684	1
684	2
685	3
685	4
686	4
686	5
687	1
687	2
688	4
688	5
689	4
689	5
690	4
690	5
691	3
691	4
692	2
692	3
693	3
693	4
694	3
694	4
695	1
696	2
696	3
697	3
697	4
697	5
698	1
698	2
699	1
699	2
700	2
700	3
701	1
701	2
701	3
702	2
702	3
703	2
703	3
704	1
705	2
705	3
706	1
706	2
707	1
707	2
708	2
708	3
709	2
709	3
710	2
710	3
711	1
711	2
712	5
713	1
713	2
713	3
714	2
714	3
714	4
715	2
715	3
715	4
716	2
716	3
717	3
717	4
718	4
718	5
719	1
720	1
720	2
721	2
721	3
722	3
722	4
723	1
724	2
724	3
725	1
725	2
725	3
726	1
727	1
728	1
729	1
730	1
730	2
731	3
731	4
732	4
732	5
733	1
733	2
734	1
734	2
737	5
738	1
738	2
739	1
739	2
740	1
740	2
741	4
741	5
742	2
742	3
742	4
743	1
743	2
744	2
744	3
744	4
745	1
745	2
746	4
746	5
747	3
747	4
748	1
748	2
749	3
749	4
750	3
751	4
751	5
752	4
752	5
753	2
753	3
753	4
754	2
755	1
755	2
756	1
757	1
758	3
758	4
759	1
759	2
760	1
760	2
761	3
761	4
762	1
762	2
763	1
763	2
764	2
764	3
765	3
765	4
766	2
766	3
767	1
768	1
769	5
770	3
770	4
771	2
771	3
772	2
772	3
773	2
773	3
774	5
775	3
775	4
776	2
776	3
776	4
777	2
777	3
778	2
778	3
779	5
780	2
780	3
781	1
782	1
782	2
783	2
783	3
784	2
785	2
785	3
786	3
786	4
787	2
787	3
788	2
788	3
788	4
789	3
789	4
790	2
790	3
790	4
791	3
791	4
792	5
793	5
794	5
795	5
796	3
796	4
797	1
797	2
798	4
798	5
799	1
800	1
801	1
802	1
803	5
804	4
804	5
805	1
806	4
806	5
807	2
807	3
809	2
809	3
811	4
811	5
812	4
812	5
814	1
814	2
815	1
815	2
816	1
816	2
817	1
817	2
818	1
819	1
820	1
820	2
821	1
822	1
823	3
823	4
824	2
824	3
824	4
825	3
825	4
827	1
828	2
828	3
829	3
829	4
830	1
830	2
830	3
831	1
831	2
831	3
832	1
832	2
832	3
833	1
833	2
833	3
834	5
835	1
836	2
836	3
837	3
837	4
838	3
838	4
839	3
839	4
839	5
840	4
840	5
842	3
843	3
843	4
843	5
844	4
844	5
845	2
845	3
846	3
846	4
846	5
847	2
847	3
848	1
848	2
849	1
850	1
850	2
851	1
851	2
852	1
852	2
853	1
854	1
855	1
856	1
856	2
857	3
857	4
858	3
858	4
859	2
859	3
860	3
860	4
861	2
861	3
863	1
864	4
864	5
865	2
865	3
866	2
866	3
867	3
867	4
868	3
868	4
869	5
870	3
870	4
871	1
871	2
871	3
872	3
872	4
873	1
874	1
875	1
875	2
876	2
876	3
877	1
877	2
878	3
879	2
879	3
880	2
880	3
881	1
881	2
882	1
882	2
\.


--
-- Data for Name: plants_fruit_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_fruit_types (plant_id, fruit_type_id) FROM stdin;
1	2
2	2
3	4
4	4
5	4
6	4
7	15
8	10
9	10
10	10
11	4
12	4
13	4
14	4
15	17
16	10
17	10
18	3
18	20
19	17
20	10
21	10
22	10
23	17
24	17
25	12
26	12
27	12
28	12
29	12
30	12
31	4
32	10
33	10
34	18
35	10
36	10
37	10
38	3
38	20
39	9
39	2
40	9
40	2
41	10
42	10
43	12
44	12
45	10
46	12
47	4
48	10
49	4
50	5
51	19
52	19
53	19
54	2
54	14
55	10
56	10
57	10
58	5
59	10
60	20
61	4
62	12
63	10
64	12
65	12
66	12
67	12
68	3
68	20
69	10
70	4
71	10
72	1
73	4
74	4
75	5
76	4
77	4
78	10
79	10
80	10
81	10
82	1
83	12
84	12
85	12
85	2
86	12
86	10
87	12
88	12
89	12
90	12
91	12
92	12
93	10
94	10
95	10
96	3
96	20
97	20
98	4
99	12
100	17
101	17
102	12
103	3
103	20
104	3
104	20
105	3
105	20
106	5
107	12
108	12
109	12
110	12
111	10
112	10
113	10
114	10
115	10
116	17
117	4
117	13
118	1
119	10
120	10
121	12
122	17
123	4
124	4
125	5
126	10
127	3
127	20
128	4
129	4
130	5
131	12
132	12
133	10
134	12
135	12
136	12
137	10
138	17
139	17
140	10
141	12
142	12
143	12
144	12
145	12
146	12
147	12
148	12
149	12
150	12
151	12
152	4
153	10
153	12
154	10
155	10
156	10
157	12
158	12
159	12
160	10
161	10
162	10
163	10
164	10
165	10
166	10
167	10
168	1
168	14
169	10
170	10
171	10
172	10
173	4
174	10
175	10
176	10
177	10
178	10
179	12
180	12
181	12
182	12
183	12
184	12
185	4
186	4
187	4
188	4
189	12
190	12
191	12
192	12
193	12
194	17
195	10
196	10
197	10
198	12
199	12
200	12
201	12
202	12
203	12
204	12
205	12
206	12
207	12
208	10
209	10
210	4
210	10
211	2
212	4
213	4
214	4
215	3
215	20
216	3
216	20
217	3
218	3
218	20
219	4
220	4
221	4
222	4
223	10
224	10
225	10
226	10
227	5
228	10
229	10
230	10
231	10
232	10
233	4
234	5
235	10
235	12
236	10
236	12
237	10
237	12
238	17
239	17
240	17
241	10
242	10
243	10
244	10
245	10
246	10
247	10
248	10
249	10
250	10
251	10
252	10
253	4
254	4
255	12
256	12
257	3
257	20
258	10
259	12
260	12
261	12
262	12
263	12
264	10
265	10
266	4
267	12
268	10
269	10
270	10
271	10
272	10
273	10
274	10
275	10
276	10
277	10
278	10
279	10
280	12
281	10
282	10
283	10
284	10
285	10
286	5
287	2
287	14
288	10
289	10
290	10
291	10
292	10
293	10
294	10
295	10
296	10
297	10
298	10
299	12
300	12
301	12
302	12
303	12
304	12
305	1
306	1
307	12
308	12
309	12
310	12
311	12
312	17
313	10
313	12
314	6
315	5
316	10
317	10
318	10
319	10
320	3
320	20
321	10
322	10
323	12
324	3
324	20
325	4
326	4
327	5
328	12
329	12
330	10
331	10
332	10
333	10
334	4
335	4
336	4
337	4
338	4
339	4
340	18
341	10
342	7
342	16
343	7
344	7
345	7
345	16
346	12
347	12
348	12
349	10
350	17
351	10
352	10
353	10
354	10
355	10
356	10
357	10
358	12
359	10
360	1
361	4
362	12
363	17
364	17
365	17
366	17
367	17
368	2
368	14
369	4
370	4
371	10
371	12
372	10
372	12
373	10
373	12
374	10
374	12
375	10
375	12
376	10
376	12
377	10
377	12
378	10
378	12
379	10
379	12
380	10
380	12
381	10
381	12
382	10
382	12
383	10
383	12
384	10
384	12
385	10
385	12
386	10
387	12
388	8
389	4
390	10
391	12
392	12
393	12
394	12
395	10
396	12
397	10
398	10
399	10
400	4
401	4
402	10
403	12
404	4
405	4
406	4
407	4
408	4
409	12
410	4
411	12
412	10
412	18
413	12
414	10
415	10
416	4
417	4
418	4
419	12
420	10
421	4
422	4
423	4
424	4
425	4
426	9
426	2
427	12
428	10
429	10
430	10
431	10
432	10
433	10
434	12
435	4
436	4
437	5
438	4
439	5
440	10
441	10
442	10
443	10
444	12
445	12
446	10
447	10
448	10
449	10
450	10
451	10
452	5
453	10
454	10
455	10
456	10
457	5
458	12
459	12
460	12
461	12
462	12
463	12
464	12
465	10
466	4
467	4
468	4
469	10
470	12
471	12
472	10
473	4
474	19
475	11
476	5
477	10
478	10
479	4
480	10
481	10
482	5
483	10
484	10
485	10
486	10
487	12
488	4
489	12
490	10
491	10
492	10
493	4
494	17
495	17
496	17
497	17
498	17
499	4
500	5
501	4
502	4
503	4
504	4
505	4
506	12
507	12
508	10
509	2
509	14
510	10
511	10
512	10
513	10
514	19
515	10
516	10
517	10
518	10
519	10
520	10
521	10
522	10
523	10
524	10
525	19
526	19
527	19
528	19
529	9
529	2
530	9
530	2
531	4
532	2
532	14
533	4
534	12
535	10
536	5
537	2
537	14
538	12
538	10
539	12
540	4
541	10
542	12
542	2
543	12
543	2
544	5
545	12
545	2
546	12
546	2
547	12
547	2
548	12
549	12
550	12
551	12
552	12
553	12
554	12
555	17
556	17
557	10
558	10
559	10
560	10
561	19
562	12
563	5
564	10
565	10
566	4
567	12
568	12
568	2
569	12
569	2
570	10
571	10
572	10
573	10
574	12
575	12
576	12
576	2
577	4
578	10
579	10
580	10
581	10
582	4
583	10
584	12
585	12
586	12
587	12
588	12
589	4
590	4
591	12
592	12
593	17
594	4
595	4
596	10
597	17
598	17
599	12
600	10
601	10
603	12
603	2
604	10
605	10
606	10
607	12
608	4
609	4
610	10
611	12
612	12
613	10
613	12
613	14
614	19
615	10
615	12
616	10
617	10
618	10
619	10
620	10
621	12
622	12
623	12
624	5
625	12
626	12
627	12
628	12
629	4
630	10
631	12
632	12
633	12
634	12
635	12
636	12
637	12
638	12
639	12
640	12
641	5
642	12
643	12
644	12
645	12
646	12
647	12
648	12
649	12
650	12
651	12
652	12
653	12
654	4
655	4
656	4
656	18
657	12
658	12
659	10
660	12
661	12
662	12
663	12
664	10
665	10
667	12
668	12
669	10
670	10
671	10
672	12
673	12
674	12
675	12
676	20
677	4
678	4
679	4
680	4
681	4
682	4
683	4
684	4
685	10
686	10
687	12
688	10
689	10
690	10
691	17
692	17
693	17
694	17
695	10
696	2
696	14
697	2
697	14
698	2
698	14
699	2
699	14
700	2
700	14
701	2
701	14
702	2
702	14
703	2
703	14
704	12
705	12
706	12
707	12
708	12
709	12
710	12
711	12
712	10
713	12
714	12
715	12
716	12
717	12
718	12
719	12
720	12
721	10
722	12
723	10
724	12
725	12
726	10
726	12
727	10
727	12
728	12
729	12
730	17
731	4
732	12
733	10
734	12
735	5
736	5
737	3
737	20
738	4
739	10
740	10
741	10
742	10
743	10
744	10
745	10
746	10
747	10
748	10
749	10
750	10
751	10
752	10
753	10
754	10
755	10
756	10
757	10
758	10
759	10
760	10
761	10
762	10
763	10
764	12
765	4
766	19
767	12
768	12
769	17
769	2
770	12
771	12
772	10
773	10
774	10
775	10
776	10
777	10
778	10
779	10
780	10
781	4
782	4
783	12
784	12
785	10
786	10
787	10
788	10
789	10
790	10
791	10
792	10
793	10
794	10
795	10
796	10
797	4
798	3
798	20
799	10
800	10
801	10
802	10
803	17
804	12
805	12
806	12
807	17
808	5
809	4
810	10
811	10
812	10
813	4
814	12
815	12
816	12
817	12
818	12
819	12
820	12
821	12
822	12
823	4
824	12
825	12
826	5
827	4
828	4
829	4
830	4
831	4
832	4
833	4
834	17
835	12
836	19
837	19
838	19
839	19
840	19
841	19
842	10
843	10
844	10
845	10
846	10
847	12
848	12
849	12
850	12
851	12
852	12
853	1
854	10
855	10
856	10
857	12
858	12
859	12
860	12
861	12
862	12
863	12
864	10
865	10
866	10
867	12
868	12
869	4
870	19
871	12
872	12
873	17
874	17
875	10
876	10
877	10
878	12
879	12
880	12
881	12
882	12
\.


--
-- Data for Name: plants_fruiting_months; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_fruiting_months (plant_id, fruiting_month_id) FROM stdin;
1	1
2	8
2	11
3	7
4	8
8	1
8	2
8	3
8	4
9	3
9	4
9	7
9	8
9	9
12	2
12	3
12	4
12	5
12	6
12	7
12	12
14	4
15	1
15	2
15	11
15	12
16	5
17	11
17	12
19	1
19	11
19	12
21	1
22	5
23	8
24	5
24	8
24	13
26	1
26	4
28	1
28	2
28	4
28	8
28	9
28	11
28	12
29	1
29	4
29	5
29	6
29	7
29	8
29	11
30	2
30	4
30	5
30	6
30	7
30	8
32	6
32	7
36	2
36	3
36	4
36	5
36	7
36	9
37	8
37	12
38	2
38	5
40	2
40	3
40	4
40	5
40	6
40	7
40	8
41	5
42	2
42	3
42	10
43	1
43	2
43	3
43	4
43	5
43	6
43	11
43	12
44	1
44	2
44	3
44	4
44	6
44	7
44	8
44	12
46	8
46	9
48	5
49	5
52	1
52	6
52	7
53	1
53	2
53	10
57	2
57	4
59	7
60	1
64	9
64	11
66	1
67	1
67	11
67	12
68	4
69	5
69	11
71	2
71	8
71	12
72	1
73	1
73	8
73	10
74	1
77	3
77	11
80	2
80	3
80	7
80	12
81	1
82	5
83	5
83	6
83	7
83	8
83	11
84	5
84	7
85	2
87	10
87	11
88	1
88	2
88	3
88	9
90	4
90	5
90	6
90	8
91	2
91	8
91	12
92	1
92	4
92	5
92	8
92	11
92	12
93	10
94	3
97	1
100	4
101	3
101	11
102	4
104	2
104	5
104	8
104	11
105	3
105	9
109	5
110	7
110	8
113	4
113	5
115	8
116	1
118	1
119	1
119	2
119	5
119	6
119	7
119	8
120	5
120	8
120	9
121	2
121	12
122	2
122	4
123	7
123	9
123	10
125	10
126	1
126	2
126	11
127	8
128	1
131	3
131	6
132	2
135	7
135	10
135	12
139	1
140	7
140	10
141	5
141	7
141	9
142	1
142	2
142	3
142	7
143	2
143	10
143	11
143	12
144	2
144	12
145	1
145	4
145	8
145	11
145	12
147	1
147	2
147	3
147	6
147	7
147	8
147	11
147	12
148	8
148	11
151	6
151	7
151	8
152	5
153	8
154	1
154	2
154	3
154	4
154	5
154	6
154	11
154	12
155	1
155	11
155	12
156	2
156	4
156	5
156	6
156	7
156	8
156	10
156	12
157	2
158	2
159	2
159	4
159	7
159	8
159	9
159	10
159	11
160	5
161	1
161	12
162	10
162	11
163	1
163	10
163	12
166	1
166	7
166	8
166	10
166	11
166	12
167	1
167	2
167	3
167	4
167	5
167	7
167	8
167	12
168	1
168	8
169	4
171	6
171	8
172	2
172	8
175	1
175	2
175	3
175	4
175	8
175	10
175	11
178	1
178	2
178	3
178	5
180	4
180	5
180	6
180	7
180	8
180	9
180	10
180	11
180	12
181	1
181	8
181	11
181	12
182	5
182	8
184	4
186	8
187	4
187	6
189	7
189	8
192	1
193	2
194	2
195	7
195	8
195	10
195	11
196	1
197	5
198	1
198	4
198	9
200	1
200	7
200	10
200	11
200	12
201	1
201	11
203	2
203	5
204	3
204	4
204	5
204	10
204	11
205	1
205	3
205	7
206	5
207	2
207	3
207	4
207	5
207	6
207	7
207	8
208	4
208	6
208	7
208	8
209	2
209	4
209	5
209	11
210	2
211	8
213	1
214	8
214	11
215	9
216	5
217	8
219	5
221	4
221	10
222	4
222	8
223	7
223	8
224	1
224	2
224	3
225	1
225	2
225	3
225	5
225	6
225	7
225	8
225	10
225	11
226	3
228	5
229	1
226	12
230	1
230	2
230	3
231	2
231	4
231	5
231	6
231	7
231	8
231	11
231	12
232	2
232	4
232	12
233	9
234	9
236	11
236	12
237	4
237	5
238	9
240	7
241	1
241	4
241	11
242	6
242	8
242	9
244	1
244	2
244	3
244	5
244	6
246	1
246	10
247	1
247	8
247	9
247	10
247	11
248	1
249	7
249	8
249	9
251	1
252	5
253	5
254	2
254	5
255	1
255	2
255	3
255	5
255	11
255	12
256	2
256	10
258	1
258	3
260	1
260	4
263	5
263	8
264	2
264	3
264	4
264	6
264	7
264	12
265	2
265	7
265	8
266	1
268	1
268	3
268	4
268	5
268	8
268	10
268	12
269	4
271	3
271	7
272	8
273	2
273	8
275	9
276	4
277	2
277	4
278	1
278	2
278	3
278	10
278	11
278	12
279	5
280	6
280	7
281	5
281	8
282	1
282	5
282	6
282	7
282	8
282	10
282	11
284	1
284	12
285	1
286	1
288	2
288	5
288	8
288	9
288	10
289	1
289	2
289	3
289	5
289	8
289	9
290	4
290	5
290	6
291	5
291	6
291	7
291	8
292	1
292	8
294	4
294	7
295	1
295	3
295	4
295	5
295	6
296	1
296	5
296	11
296	12
297	4
297	7
297	8
298	2
298	9
299	2
299	4
299	5
299	6
299	7
299	8
300	1
300	2
300	3
300	5
300	6
300	7
300	8
301	4
302	4
302	10
302	11
304	9
305	1
306	5
307	2
307	5
308	2
308	9
308	11
308	12
309	1
309	2
309	4
309	5
309	6
309	7
309	9
309	10
309	12
311	3
311	4
311	5
311	10
312	4
312	5
313	5
315	1
316	5
317	1
318	1
318	4
318	5
318	8
318	12
319	4
319	5
319	6
319	7
323	8
323	9
325	1
325	11
326	4
328	6
328	7
328	9
330	1
330	2
330	4
330	8
330	9
330	11
330	12
331	2
331	3
331	4
332	7
336	1
339	9
340	8
341	8
341	9
342	2
343	9
344	9
345	10
346	5
346	6
347	5
347	6
347	7
347	8
348	2
348	3
348	6
348	7
349	1
349	5
349	6
351	1
351	2
351	3
351	4
351	5
351	8
351	9
352	1
353	3
353	5
353	7
353	12
354	1
354	3
354	6
354	11
354	12
355	1
267	2
267	3
355	4
267	11
357	2
357	3
357	4
357	11
358	2
358	5
358	6
358	7
358	8
358	10
358	11
359	8
359	9
360	5
361	11
361	12
363	5
364	1
365	1
366	5
366	6
366	9
366	10
366	11
367	1
370	4
370	8
372	2
372	10
373	2
373	10
374	8
374	10
376	1
377	1
377	3
377	4
380	5
381	2
381	3
381	4
386	1
386	2
386	3
386	11
387	11
387	12
388	1
389	5
390	1
390	5
390	8
390	9
391	2
392	4
394	2
394	5
394	6
394	7
394	9
395	2
395	3
395	4
395	6
395	7
395	8
396	2
396	3
396	12
397	4
397	7
399	8
400	1
402	2
402	5
402	6
402	12
404	9
405	1
405	8
406	2
406	5
407	8
407	11
409	9
410	1
411	4
411	8
412	2
412	4
412	6
412	7
412	8
412	12
413	1
413	3
413	5
413	7
413	8
413	11
414	1
414	2
414	3
414	4
414	5
414	6
414	11
416	5
417	1
418	9
419	8
420	2
422	8
423	9
424	1
425	2
426	4
426	8
427	2
427	4
427	8
427	11
428	1
428	2
429	1
429	2
430	1
431	1
431	4
431	8
431	10
431	11
139	7
139	8
433	4
433	7
438	5
440	1
440	7
442	1
443	3
444	1
444	11
445	2
445	8
445	11
446	1
446	5
448	1
448	6
448	7
448	8
448	12
449	1
449	5
449	7
449	11
449	12
451	2
451	3
451	4
453	1
453	2
453	3
453	4
453	5
453	7
453	9
453	10
453	11
453	12
454	2
454	7
454	8
454	11
455	3
456	2
456	12
458	8
459	2
459	5
463	6
463	9
463	12
465	2
465	3
465	4
465	8
465	10
466	4
466	5
467	2
468	1
468	5
468	6
469	1
469	2
469	3
469	8
469	10
469	12
470	1
470	2
470	3
470	4
470	8
471	2
471	4
471	6
471	10
471	11
472	11
472	12
474	8
474	10
474	11
476	10
477	4
477	6
477	7
478	1
478	2
478	11
479	2
479	11
484	7
484	8
484	12
486	8
486	10
486	11
487	3
487	4
487	8
487	9
487	10
488	7
488	12
489	4
489	5
489	8
490	5
490	6
490	7
490	8
490	10
490	11
491	2
491	3
491	4
491	5
491	6
491	7
491	8
492	6
492	7
492	8
492	9
496	2
496	11
496	12
497	1
498	5
499	9
501	2
501	7
502	5
504	2
504	4
504	5
504	7
504	8
504	11
505	5
506	9
508	2
508	7
508	8
508	12
509	2
509	4
510	4
511	9
511	10
512	1
512	4
512	5
512	7
512	8
512	12
513	1
513	2
513	3
513	4
513	5
513	6
513	11
513	12
514	2
514	4
514	6
515	1
516	3
516	4
516	5
516	6
516	7
517	2
517	6
517	8
517	9
518	2
518	3
518	4
518	5
518	6
518	7
518	8
518	10
518	11
520	2
521	2
522	5
523	1
523	2
523	12
524	1
524	2
524	3
524	5
524	7
524	10
199	8
199	10
526	8
526	9
526	10
526	11
527	1
527	11
527	12
529	5
529	7
529	8
532	2
532	4
533	2
533	4
534	4
535	1
535	2
535	3
535	5
535	9
535	11
535	12
537	1
537	7
537	11
537	12
538	1
539	1
539	2
539	5
539	6
539	7
539	8
539	9
541	6
542	5
543	4
543	11
81	2
81	3
81	11
547	4
547	5
547	6
547	8
547	12
548	4
548	8
549	7
549	8
550	1
550	2
551	1
551	2
551	3
551	4
551	5
551	8
551	9
551	11
552	4
552	6
552	8
552	9
553	7
553	8
554	1
554	2
554	5
554	9
556	8
558	3
558	5
558	8
558	11
560	5
562	4
562	5
562	6
562	7
563	2
564	1
564	2
564	5
564	8
564	9
565	4
566	5
567	1
567	5
567	7
568	8
569	2
569	11
570	7
571	8
572	5
572	6
572	7
572	12
573	2
573	7
573	8
573	10
573	12
574	2
574	3
575	2
575	3
575	5
575	11
577	9
578	1
580	6
582	2
582	3
582	5
583	2
583	4
583	8
584	8
585	2
585	7
585	8
585	10
585	11
590	2
591	1
591	4
329	7
329	9
329	10
329	11
329	12
592	2
592	4
592	5
592	11
596	1
596	2
596	4
596	6
596	7
596	8
596	11
597	1
597	2
597	3
597	4
597	5
597	6
597	7
597	11
598	1
599	5
599	8
599	12
600	9
601	2
601	3
601	4
601	8
601	10
601	12
604	1
604	4
604	10
604	12
605	2
605	3
605	4
605	6
605	12
607	2
608	1
610	2
610	4
610	5
611	1
611	2
611	3
611	4
611	5
611	7
611	8
611	10
611	11
611	12
612	1
612	3
612	4
612	7
612	9
613	2
615	4
615	8
616	1
616	2
616	3
616	4
617	1
617	2
617	3
617	4
617	5
617	6
617	7
617	8
617	10
617	11
617	12
618	8
619	2
620	5
620	6
621	5
621	6
621	7
621	8
621	11
622	4
622	6
622	8
623	5
625	5
625	6
625	7
625	8
625	11
626	2
626	5
627	1
627	2
627	3
627	4
627	5
627	7
627	10
630	6
630	7
630	8
630	9
630	11
631	5
631	8
632	8
632	10
632	11
634	3
634	4
634	5
634	6
636	11
636	12
637	2
637	4
637	10
637	12
638	2
638	4
638	8
638	12
639	5
639	6
640	2
640	3
640	4
640	5
640	6
640	7
640	8
640	11
640	12
642	2
642	7
642	8
642	9
642	12
643	4
644	1
644	2
644	11
644	12
645	2
645	5
645	8
645	12
646	5
646	12
647	7
639	2
639	8
639	10
639	11
639	12
639	3
650	1
650	4
650	12
651	8
652	7
652	9
653	5
653	7
653	9
656	1
656	8
656	10
656	12
657	2
657	12
659	4
659	11
660	1
660	12
661	1
662	2
662	4
662	8
662	10
662	11
662	12
663	1
663	2
663	7
663	8
664	1
664	2
664	3
664	4
664	5
664	6
664	7
664	8
664	9
664	10
664	11
667	4
667	9
668	4
668	6
669	3
670	1
670	6
670	8
670	9
670	11
671	1
671	2
671	8
671	9
671	11
672	1
672	8
673	1
673	2
673	4
673	8
673	10
674	5
674	10
675	2
675	8
676	2
678	2
678	11
679	1
679	2
681	2
681	5
682	11
682	12
683	2
683	5
684	5
685	2
685	5
687	6
687	12
689	1
689	4
689	12
690	4
690	5
690	6
690	8
690	12
692	8
694	1
694	11
695	1
695	2
695	5
695	8
695	9
695	12
696	1
696	2
696	8
696	9
696	10
696	11
696	12
697	1
697	7
697	8
697	9
697	10
697	12
698	1
698	2
698	10
698	11
698	12
699	1
699	5
699	6
699	7
699	8
699	11
699	12
700	2
700	11
701	1
701	6
701	8
701	11
702	10
702	12
703	1
703	2
703	3
703	4
703	9
703	10
703	12
704	11
704	12
706	6
706	7
706	8
708	5
710	8
710	10
711	1
711	11
712	2
712	3
712	4
712	5
712	6
712	7
712	8
712	11
713	2
713	3
714	4
714	6
714	7
714	8
716	1
716	2
716	9
716	11
717	2
717	3
717	4
718	3
718	4
718	5
719	2
719	7
720	1
720	5
720	8
720	9
720	12
721	5
724	1
724	2
724	3
724	12
725	1
725	2
725	3
725	10
725	11
726	2
727	4
729	2
729	3
729	4
730	2
730	8
732	1
732	2
732	3
732	4
732	5
732	6
733	1
733	5
733	9
734	2
734	4
734	5
734	6
734	7
734	8
734	9
734	10
734	11
736	8
739	4
739	5
739	6
739	7
739	8
739	9
739	10
739	11
740	1
740	11
740	12
741	1
741	2
741	4
741	8
742	1
742	8
743	1
743	2
743	3
743	4
743	5
743	7
743	8
743	9
743	10
743	11
744	2
745	1
746	1
746	2
746	8
748	2
748	7
748	8
748	10
749	2
749	3
749	8
752	9
753	2
753	4
753	8
754	1
754	2
754	3
754	4
754	5
754	6
754	7
754	8
754	9
754	10
754	11
754	12
755	1
755	8
755	11
756	4
756	6
756	7
756	8
756	10
756	11
757	2
757	3
758	1
758	2
758	5
758	7
758	8
758	10
758	11
759	2
759	3
759	4
759	5
759	10
761	1
761	9
762	5
763	1
763	2
763	4
763	7
763	8
763	9
763	10
763	12
764	2
764	4
764	7
764	8
764	11
764	12
765	9
766	5
766	6
767	1
767	5
767	6
767	8
767	12
769	3
769	4
769	11
770	4
702	5
702	6
702	8
771	4
772	6
772	7
772	8
773	1
773	4
773	7
773	10
774	2
774	3
774	4
774	6
774	7
774	11
775	1
775	2
775	3
775	4
775	5
775	8
775	11
775	12
776	2
776	4
777	4
777	5
777	6
777	8
777	10
777	11
777	12
778	7
779	3
779	4
780	4
781	11
781	12
782	1
783	4
784	1
784	2
784	5
784	6
784	7
784	8
784	11
784	12
785	2
785	3
785	11
786	1
786	2
786	3
788	1
788	5
788	9
789	3
789	5
790	2
790	4
790	8
790	12
791	5
791	8
792	2
792	3
792	4
792	6
792	7
792	8
792	10
792	12
793	1
793	2
793	3
793	4
793	8
793	11
793	12
794	1
794	2
794	3
794	4
794	5
794	7
794	8
794	9
794	10
794	11
794	12
795	1
796	6
796	8
797	1
798	4
489	10
799	8
800	5
800	7
800	10
801	1
801	12
802	11
802	12
803	1
806	1
806	3
806	4
806	7
807	4
809	2
809	3
809	5
811	10
811	11
813	5
814	3
814	4
814	5
814	6
814	9
815	2
816	7
816	8
817	1
817	2
817	4
817	5
817	7
817	8
817	9
817	10
817	11
817	12
818	3
818	4
818	5
819	2
819	7
819	8
819	9
819	10
819	11
820	2
820	3
820	5
820	6
821	6
821	8
821	11
821	12
822	2
822	3
822	4
822	5
822	6
822	7
822	8
823	1
823	2
823	5
823	7
823	11
825	2
825	4
825	6
825	8
825	10
827	5
828	2
829	4
831	2
831	3
831	4
832	2
835	4
835	11
836	5
836	6
836	7
836	9
837	5
837	7
837	8
837	9
838	1
840	4
843	1
843	2
843	3
843	11
843	12
844	5
845	7
845	8
846	1
846	4
846	5
846	8
846	12
847	4
848	7
848	11
850	1
850	2
850	3
850	4
850	5
850	8
850	9
850	10
850	11
851	2
851	3
851	4
851	5
851	7
851	8
851	9
852	4
852	5
852	6
852	7
853	8
853	12
854	1
855	5
855	10
855	12
857	1
857	7
857	9
858	1
858	8
859	5
859	7
859	8
859	10
859	11
863	11
863	12
864	1
864	4
864	5
864	8
864	9
864	10
864	11
864	12
865	4
866	4
866	6
866	7
867	3
867	5
867	6
867	7
867	8
868	1
661	2
661	3
868	4
661	5
661	6
661	7
869	3
870	4
870	8
871	1
871	5
871	7
871	8
871	12
872	2
872	4
874	8
874	9
875	5
876	8
877	1
877	2
877	3
877	4
877	6
877	7
877	8
877	9
877	10
877	12
878	1
878	10
878	11
879	5
879	7
879	8
880	2
880	4
881	3
881	8
\.


--
-- Data for Name: plants_insects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_insects (plant_id, insect_id) FROM stdin;
2	477
5	91
6	477
6	91
6	54
6	258
8	224
8	121
8	151
9	214
9	423
9	422
9	121
9	151
9	134
9	20
12	285
12	422
12	185
12	180
12	188
15	179
15	250
19	327
21	403
27	35
27	567
27	559
28	530
28	34
28	559
28	35
28	41
29	477
29	149
29	408
30	477
30	77
30	559
31	278
32	572
36	131
38	149
39	125
40	530
40	458
40	440
40	216
40	422
40	285
40	223
40	224
40	125
40	149
40	129
40	134
40	20
40	248
40	417
42	249
43	216
43	423
43	588
43	467
43	429
43	224
43	135
43	134
43	115
43	20
43	542
43	279
44	530
44	572
44	121
44	471
46	13
46	54
46	559
53	121
53	134
53	115
58	270
61	417
63	121
64	365
64	440
64	102
64	39
77	530
78	232
79	98
79	419
80	114
80	98
80	434
80	89
83	121
83	572
83	408
83	326
87	530
88	530
88	58
91	530
99	477
102	176
102	149
103	138
104	440
104	477
104	138
113	121
113	34
114	551
119	432
119	422
119	121
119	120
119	87
119	279
119	397
120	121
120	572
120	279
121	87
131	328
133	572
136	34
141	530
142	530
142	568
142	255
142	264
143	241
144	570
145	570
145	72
146	570
147	440
147	174
147	530
147	422
147	423
147	578
147	572
147	275
147	263
147	471
147	473
147	543
147	85
147	559
148	422
148	572
149	422
149	423
149	581
151	380
151	422
151	362
151	49
151	417
151	27
154	530
154	284
154	100
154	587
154	413
154	90
154	130
154	466
154	417
154	2
154	20
154	34
154	266
154	322
154	568
155	141
155	322
156	440
156	530
156	141
156	146
159	572
161	162
161	572
166	159
167	422
167	121
169	112
169	408
172	572
175	284
175	289
175	26
175	189
175	204
176	121
176	283
178	214
178	215
178	224
178	189
178	187
180	561
180	121
180	134
180	115
181	216
181	590
181	561
181	34
181	95
184	530
184	417
188	40
188	252
188	559
195	215
195	422
195	187
195	121
195	52
195	327
195	419
198	470
198	472
198	419
200	223
200	420
201	160
201	470
203	12
203	168
204	440
204	274
204	12
204	89
204	419
205	530
205	327
207	440
207	477
207	427
207	233
207	125
207	219
207	408
208	216
208	588
208	565
208	152
208	51
208	87
211	477
211	378
222	530
224	210
224	26
225	210
225	187
225	199
225	26
225	121
226	189
231	216
231	294
231	588
231	571
231	569
231	562
231	573
231	12
231	247
231	343
231	168
231	399
232	422
232	588
232	429
232	562
236	279
237	390
237	253
242	572
242	34
242	250
244	588
244	422
244	574
244	39
244	344
244	34
245	572
246	574
247	572
249	575
250	574
255	530
255	328
255	238
260	477
262	423
264	222
264	224
264	149
264	155
265	224
267	279
268	288
268	142
268	121
268	66
268	67
271	530
276	465
278	530
280	231
280	131
282	199
282	26
288	582
288	141
289	121
289	134
289	20
289	329
290	214
290	422
290	215
290	560
295	386
295	430
295	9
295	526
295	47
295	87
295	434
295	559
295	542
295	34
295	80
295	256
296	386
296	527
296	34
297	166
299	422
299	224
299	99
299	111
299	134
299	121
299	34
299	20
299	58
299	54
300	477
300	530
300	149
300	121
301	149
304	425
304	28
304	34
309	423
309	287
309	224
309	121
309	134
309	132
311	121
311	572
312	328
318	440
318	141
318	134
318	149
318	408
319	172
319	380
319	477
319	295
319	467
319	115
319	134
319	331
319	168
319	276
320	377
323	530
323	115
323	134
328	564
330	530
330	423
330	244
330	121
330	134
330	120
330	92
330	538
330	59
330	473
331	530
331	166
331	279
332	121
340	235
341	572
346	121
346	134
347	121
347	572
348	530
348	477
348	440
348	423
348	587
348	100
348	144
348	121
348	329
349	423
349	121
349	572
351	477
351	157
351	364
351	434
351	279
353	530
354	530
354	410
355	223
355	34
355	163
355	78
355	95
358	578
359	183
366	459
366	207
366	202
366	203
366	220
373	394
378	337
381	530
381	337
381	265
382	121
386	530
386	423
386	121
386	12
390	74
391	530
391	477
393	530
394	423
394	121
394	134
394	149
395	426
395	121
395	572
396	2
398	250
405	376
405	71
407	477
407	12
411	530
412	381
412	519
412	539
413	413
413	241
413	408
414	173
414	530
414	423
414	422
414	382
414	119
427	572
428	87
429	34
429	410
431	172
431	113
432	113
433	408
440	187
444	530
446	423
446	231
446	230
446	224
446	409
446	8
448	184
449	184
449	199
449	198
449	540
450	34
451	530
451	440
451	121
452	530
452	125
457	381
457	519
458	477
461	365
462	413
462	37
463	534
463	543
464	534
465	588
465	570
465	34
468	328
468	530
468	521
468	520
468	408
468	34
469	170
469	100
470	291
470	292
470	422
470	147
470	34
471	479
471	530
471	477
471	328
471	412
471	238
471	159
471	168
471	408
471	12
472	176
472	295
472	115
472	20
474	422
474	231
474	223
474	224
474	149
474	408
474	20
476	530
477	146
477	121
477	149
477	568
477	329
477	543
479	65
480	423
480	98
480	274
484	530
485	34
485	279
487	213
487	223
487	224
487	20
487	409
488	328
489	125
490	286
490	388
490	211
490	121
490	120
490	344
490	20
490	19
490	408
490	239
490	275
490	558
490	417
490	34
491	441
491	121
492	121
492	559
505	34
509	365
510	440
510	423
510	417
510	408
511	477
511	530
511	286
511	423
511	224
511	121
511	120
511	20
511	417
511	275
512	121
512	275
513	530
513	440
513	389
513	121
513	415
513	567
513	265
516	134
517	215
517	194
518	530
518	285
518	194
518	205
518	26
518	34
524	463
524	199
524	204
524	26
526	149
527	141
527	134
527	12
529	464
529	530
529	224
529	149
529	121
532	231
532	115
532	20
535	159
537	224
537	153
539	121
539	394
539	75
543	87
545	530
545	87
545	408
545	419
545	274
546	88
547	530
547	88
547	53
547	12
547	434
547	419
549	530
551	423
551	428
551	589
551	588
551	426
551	29
551	121
551	279
551	34
552	171
552	24
552	417
552	240
553	23
553	121
553	417
554	371
554	326
554	36
555	267
558	477
558	413
562	423
562	121
562	134
562	8
564	206
570	174
572	176
572	124
573	176
573	174
573	423
573	223
573	121
574	338
575	338
575	279
575	252
579	213
581	134
583	250
592	121
596	184
596	199
597	181
597	182
601	169
601	530
601	422
601	83
601	84
601	12
601	87
601	250
601	279
601	89
605	20
605	409
605	248
605	262
609	477
610	119
611	530
611	145
611	136
611	20
611	55
611	56
611	59
611	559
611	34
612	284
612	34
612	329
612	159
612	20
616	174
616	587
616	11
617	176
617	530
617	423
617	121
617	572
617	43
617	410
617	568
617	239
617	82
617	87
619	216
619	118
620	118
620	115
620	134
620	20
621	415
621	572
622	414
622	83
625	572
625	471
625	263
626	34
627	530
627	213
627	25
627	121
627	134
627	409
627	344
627	322
627	537
628	121
628	134
630	530
630	286
630	295
630	115
630	134
631	467
631	578
632	530
632	477
632	423
632	578
632	572
633	260
635	423
635	578
635	572
635	279
636	588
636	578
637	467
637	570
638	423
638	588
638	578
638	572
638	34
640	423
640	588
640	578
640	572
640	322
640	34
640	559
642	467
642	570
642	56
642	34
643	468
643	570
644	216
644	570
644	572
644	34
644	259
644	260
644	417
644	559
644	396
644	16
645	570
646	570
646	76
648	423
648	578
648	572
648	159
648	417
648	34
649	423
649	572
650	588
650	578
651	578
653	530
653	174
653	408
656	383
656	218
656	316
656	239
656	27
663	530
663	20
664	530
664	379
664	284
664	295
664	461
664	460
664	211
664	563
664	134
664	115
664	141
673	339
673	87
674	34
677	530
678	212
690	100
690	10
690	231
692	530
695	579
695	34
696	150
697	530
697	213
697	150
697	56
697	69
697	17
697	34
698	530
698	150
698	27
699	477
699	424
699	150
699	12
700	150
702	150
703	150
703	48
703	404
703	1
703	89
712	236
712	125
714	530
714	422
714	423
714	121
714	149
714	87
716	530
716	238
716	154
716	50
716	34
716	344
717	530
717	408
724	121
725	121
725	572
725	34
727	477
729	332
732	530
732	440
732	234
732	125
732	219
734	470
734	274
734	419
739	121
739	239
739	568
741	223
743	530
743	216
743	156
743	140
743	34
743	544
743	545
743	46
743	559
743	256
743	433
747	175
747	223
747	224
749	175
750	121
751	245
751	100
751	587
753	175
754	195
754	224
754	115
754	134
754	248
754	20
754	540
754	568
754	33
755	423
755	121
756	34
758	175
758	440
758	592
759	140
760	121
760	64
763	291
763	576
763	577
763	34
764	231
764	42
764	87
764	160
764	19
764	408
764	57
764	159
764	417
766	530
766	149
769	324
769	377
770	216
770	295
770	291
770	467
770	423
770	428
770	413
770	22
770	115
770	134
770	20
770	34
770	329
770	540
771	149
772	139
773	121
773	127
773	34
774	236
775	477
775	143
775	86
775	34
777	284
777	146
777	34
783	165
783	408
784	166
784	44
784	419
785	246
785	413
785	10
785	231
785	134
785	115
785	122
785	141
785	149
785	20
785	34
785	329
785	537
785	19
786	440
786	413
786	137
786	408
786	20
787	149
788	530
788	177
788	567
788	68
788	79
789	530
790	530
790	100
790	587
790	18
790	177
790	475
790	433
790	95
790	344
790	55
791	567
792	284
792	422
792	231
792	234
792	229
792	131
793	231
793	8
794	195
794	224
794	128
794	540
795	231
795	223
795	224
795	133
798	228
798	250
799	34
800	391
801	476
801	14
801	17
806	231
807	477
809	530
809	87
811	533
811	361
811	567
811	265
814	530
814	115
814	134
814	87
814	541
817	149
817	8
817	417
817	75
817	159
817	12
819	572
820	174
821	174
821	328
821	423
821	572
822	174
822	423
822	588
822	392
822	572
822	161
822	149
823	231
825	422
829	440
836	530
836	458
836	440
836	237
836	149
836	2
836	239
836	408
836	568
836	417
837	530
837	458
837	440
837	149
837	404
837	408
848	530
850	530
850	171
850	423
850	411
850	5
850	341
850	126
850	121
850	116
850	45
850	253
850	568
850	251
850	408
850	34
850	87
851	530
851	121
851	126
851	116
851	117
851	4
851	159
851	252
851	45
852	421
852	121
852	134
852	20
852	159
858	223
858	224
861	3
864	477
864	215
864	122
864	125
866	175
867	295
867	134
867	12
867	417
867	272
868	530
868	121
870	477
871	213
871	73
872	530
872	225
873	279
874	395
876	197
877	440
877	293
877	30
877	208
877	200
877	199
877	60
877	273
877	401
877	567
877	242
878	530
878	13
878	115
878	134
878	38
878	87
878	243
878	94
878	17
880	13
\.


--
-- Data for Name: plants_k_sectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_k_sectors (plant_id, k_sector_id) FROM stdin;
\.


--
-- Data for Name: plants_latex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_latex (plant_id, fruit_latex_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	1
14	1
15	1
16	1
17	1
18	1
19	1
20	1
21	1
22	1
23	1
24	1
25	1
26	1
27	1
28	1
29	1
30	1
32	1
33	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
51	1
52	1
53	1
54	1
55	1
56	1
57	1
59	1
60	1
61	1
62	1
63	1
64	1
65	1
66	1
67	1
68	1
69	1
70	1
71	1
72	1
73	1
74	1
76	1
77	1
78	1
79	1
80	1
81	1
82	1
83	1
84	1
85	1
86	1
87	1
88	1
89	1
90	1
91	1
92	1
93	1
94	1
95	1
96	1
97	1
98	1
100	1
101	1
102	1
103	1
104	1
105	1
107	1
108	1
109	1
110	1
111	1
112	1
113	1
114	1
115	1
116	1
117	1
118	1
119	1
120	1
121	1
122	1
123	1
124	1
126	1
127	1
128	1
129	1
130	1
131	1
132	1
133	1
134	1
135	1
136	1
137	1
138	1
139	1
140	1
141	1
142	1
143	1
144	1
145	1
146	1
147	1
148	1
149	1
150	1
151	1
152	1
153	1
154	1
155	1
156	1
157	1
158	1
159	1
160	1
161	1
162	1
163	1
164	1
165	1
166	1
167	1
168	1
169	1
170	1
171	1
172	1
173	1
174	1
175	1
176	1
177	1
178	1
179	1
180	1
181	1
182	1
183	1
184	1
185	1
186	1
187	1
188	1
189	1
190	1
191	1
192	1
193	1
194	1
195	1
196	1
197	1
198	1
199	1
200	1
201	1
202	1
203	1
204	1
205	1
206	1
207	1
208	1
209	1
210	1
211	1
212	1
213	1
214	1
215	1
216	1
217	1
218	1
219	1
220	1
221	1
222	1
223	1
224	1
225	1
226	1
228	1
229	1
230	1
231	1
232	1
233	1
234	1
235	1
236	1
237	1
238	1
239	1
240	1
241	1
242	1
243	1
244	1
245	1
246	1
247	1
248	1
249	1
250	1
251	1
252	1
253	1
254	1
255	1
256	1
257	1
258	1
259	1
260	1
261	1
262	1
263	1
264	1
265	1
266	1
267	1
268	1
269	1
270	1
271	1
272	1
273	1
274	1
275	1
276	1
277	1
278	1
279	1
280	1
281	1
282	1
283	1
284	1
285	1
286	1
287	1
288	1
289	1
290	1
291	1
292	1
293	1
294	1
295	1
296	1
297	1
298	1
299	1
300	1
301	1
302	1
303	1
304	1
305	1
306	1
307	1
308	1
309	1
310	1
311	1
312	1
313	1
314	1
315	1
316	1
317	1
318	1
319	1
320	1
321	1
322	1
323	1
324	1
325	1
326	1
328	1
329	1
330	1
331	1
332	1
333	1
334	1
335	1
336	1
337	1
338	1
339	1
340	1
341	1
342	1
343	1
344	1
345	1
346	1
347	1
348	1
349	1
350	1
351	1
352	1
353	1
354	1
355	1
356	1
357	1
358	1
359	1
360	1
361	1
362	1
363	1
364	1
365	1
366	1
367	1
368	1
369	1
370	1
371	1
372	1
373	1
374	1
375	1
376	1
377	1
378	1
379	1
380	1
381	1
382	1
383	1
384	1
385	1
386	1
387	1
388	1
389	1
390	1
391	1
392	1
393	1
394	1
395	1
396	1
397	1
398	1
399	1
400	1
401	1
402	1
403	1
404	1
405	1
406	1
407	1
408	1
409	1
410	1
411	1
412	1
413	1
414	1
415	1
416	1
417	1
418	1
419	2
419	1
420	1
421	1
422	1
423	1
424	1
425	1
426	1
427	1
428	1
429	1
430	1
431	1
432	1
433	1
434	1
435	1
436	1
438	1
440	1
441	1
442	1
443	1
444	1
445	1
446	1
447	1
448	1
449	1
450	1
451	1
453	1
454	1
455	1
456	1
458	1
462	1
463	1
464	1
465	1
466	1
467	1
468	1
469	1
470	1
471	1
472	1
473	1
474	1
475	1
477	1
478	1
479	1
480	1
481	1
483	1
484	1
485	1
486	1
487	1
488	1
489	1
490	1
491	1
492	1
493	1
494	1
495	1
496	1
497	1
498	1
499	1
501	1
502	1
503	1
504	1
505	1
506	1
507	1
508	1
509	1
510	1
511	1
512	1
513	1
514	1
515	1
516	1
517	1
518	1
519	1
520	1
521	1
522	1
523	1
524	1
525	1
526	1
527	1
528	1
529	1
530	1
531	1
532	1
533	1
534	1
535	1
537	1
538	1
539	1
540	1
541	1
542	1
543	1
545	1
546	1
547	1
548	1
549	1
550	1
551	1
552	1
553	1
554	1
555	1
556	1
557	1
558	1
559	1
560	1
561	1
562	1
564	1
565	1
566	1
567	1
568	1
569	1
570	1
571	1
572	1
573	1
574	1
575	1
576	1
577	1
578	1
579	1
580	1
581	1
582	1
583	1
584	1
585	1
586	1
587	1
588	1
589	1
590	1
591	1
592	1
593	1
594	1
595	1
596	1
597	1
598	1
599	1
600	1
601	1
603	1
604	1
605	1
606	1
607	1
608	1
609	1
610	1
611	1
612	1
613	1
614	1
615	1
616	1
617	1
618	1
619	1
620	1
621	1
622	1
623	1
625	1
626	1
627	1
628	1
629	1
630	1
631	1
632	1
633	1
634	1
635	1
636	1
637	1
638	1
639	1
640	1
642	1
643	1
644	1
645	1
646	1
647	1
648	1
649	1
650	1
651	1
652	1
653	1
654	1
655	1
656	1
657	1
658	1
659	1
660	1
661	1
662	1
663	1
664	1
665	1
667	1
668	1
669	1
670	1
671	1
672	1
673	1
674	1
675	1
676	1
677	1
678	1
679	1
680	1
681	1
682	1
683	1
684	1
685	1
686	1
687	1
688	1
689	1
690	1
691	1
692	1
693	1
694	1
695	1
696	1
697	1
698	1
699	1
700	1
701	1
702	1
703	1
704	1
705	1
706	1
707	1
708	1
709	1
710	1
711	1
712	1
713	1
714	1
715	1
716	1
717	1
718	1
719	1
720	1
721	1
722	1
723	1
724	1
725	1
726	1
727	1
728	1
729	1
730	1
731	1
732	1
733	1
734	1
737	1
738	1
739	1
740	1
741	1
742	1
743	1
744	1
745	1
746	1
747	1
748	1
749	1
750	1
751	1
752	1
753	1
754	1
755	1
756	1
757	1
758	1
759	1
760	1
761	1
762	1
763	1
764	1
765	1
766	1
767	1
768	1
769	1
770	1
771	1
772	1
773	1
774	1
775	1
776	1
777	1
778	1
779	1
780	1
781	1
782	1
783	1
784	1
785	1
786	1
787	1
788	1
789	1
790	1
791	1
792	1
793	1
794	1
795	1
796	1
797	1
798	1
799	1
800	1
801	1
802	1
803	1
804	1
805	1
806	1
807	1
809	1
810	1
811	1
812	1
813	1
814	1
815	1
816	1
817	1
818	1
819	1
820	1
821	1
822	1
823	1
824	1
825	1
827	1
828	1
829	1
830	1
831	1
832	1
833	1
834	1
835	1
836	1
837	1
838	1
839	1
840	1
842	1
843	1
844	1
845	1
846	1
847	1
848	1
849	1
850	1
851	1
852	1
853	1
854	1
855	1
856	1
857	2
857	1
858	1
859	1
860	1
861	1
862	1
863	1
864	1
865	1
866	1
867	1
868	1
869	1
870	1
871	1
872	1
873	1
874	1
875	1
876	1
877	1
878	1
879	1
880	1
881	1
\.


--
-- Data for Name: plants_leaf_arrangements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_leaf_arrangements (plant_id, leaf_arrangement_id) FROM stdin;
1	3
2	3
3	3
4	2
5	2
6	2
7	2
8	2
9	2
10	3
11	3
12	3
13	3
14	3
15	3
16	3
17	3
18	3
19	3
20	1
21	2
22	2
23	2
24	2
25	3
26	3
27	3
28	3
29	3
30	3
31	10
32	3
33	3
34	3
35	2
36	2
37	2
38	3
39	3
40	3
41	2
42	2
43	3
44	3
45	3
46	3
47	3
48	10
49	10
50	10
51	3
52	3
53	3
54	3
55	4
55	6
56	3
57	4
57	6
58	10
59	4
59	6
60	3
61	2
62	3
63	2
64	3
65	3
66	3
67	3
68	3
69	3
70	3
71	3
72	3
73	3
74	3
75	10
76	3
77	3
78	3
79	3
80	3
81	3
82	2
83	3
84	3
85	3
86	3
87	3
88	3
89	3
90	3
91	3
92	3
93	3
94	2
95	3
96	3
97	3
98	2
99	3
100	2
101	2
102	2
103	3
104	3
105	3
106	10
107	2
108	2
109	2
110	2
111	3
112	3
113	3
114	3
115	3
116	10
117	3
118	3
119	2
120	2
121	3
122	2
123	3
124	3
125	10
126	3
127	3
128	2
129	2
130	10
131	2
132	2
133	3
134	3
135	3
136	3
137	10
138	2
139	2
140	3
141	3
142	3
143	2
144	2
145	2
146	2
147	2
148	2
149	2
150	2
151	2
152	10
153	3
154	3
155	3
156	3
157	3
158	3
159	3
160	3
161	3
162	3
163	3
164	3
165	3
166	3
167	3
168	2
169	2
170	2
170	4
171	2
171	4
172	2
173	3
174	3
175	3
176	3
177	3
178	3
179	3
180	2
181	2
182	2
183	2
184	3
185	3
186	1
187	1
188	3
189	4
189	6
190	4
190	6
191	4
191	6
192	6
192	4
193	3
194	3
195	3
196	3
197	3
198	3
199	3
199	9
200	3
201	3
202	3
203	1
204	1
205	3
206	3
207	3
208	2
209	2
210	3
211	3
212	2
213	2
214	2
215	3
216	3
217	3
218	3
219	3
220	3
221	3
222	3
223	3
224	3
225	3
226	3
227	10
228	3
229	3
230	3
231	4
231	6
232	4
232	6
233	10
234	10
235	4
235	6
236	4
236	6
237	4
237	6
238	2
239	2
240	2
241	3
242	3
243	3
244	3
245	3
246	3
247	3
248	3
249	3
250	3
251	3
252	3
253	3
254	3
255	3
256	3
257	3
258	3
259	3
260	3
261	3
262	3
263	3
264	2
265	2
266	3
267	3
268	3
269	3
270	3
271	3
272	3
273	3
274	3
275	3
276	3
277	3
278	3
279	3
280	3
281	3
282	3
283	3
284	3
285	3
286	3
287	3
288	3
289	3
290	3
291	3
292	4
292	6
293	4
293	6
294	4
294	6
295	4
295	6
296	3
297	4
297	6
298	4
298	6
299	3
300	3
301	3
302	3
303	3
304	2
305	3
306	3
307	3
308	3
309	3
310	2
311	2
312	3
313	3
314	10
315	4
316	2
317	3
318	3
319	3
320	3
321	2
322	2
323	3
324	3
325	3
326	3
327	10
328	3
329	3
330	3
331	3
332	3
333	2
334	10
335	10
336	10
337	2
338	4
338	6
339	2
340	3
341	2
342	3
343	3
344	3
345	3
346	3
347	3
348	3
349	3
350	2
351	2
352	2
353	2
354	2
355	2
356	2
357	2
358	2
359	3
360	3
361	2
362	2
363	2
364	2
365	2
366	2
367	2
368	2
369	3
370	3
371	3
372	3
373	3
374	3
375	3
376	3
377	3
378	3
379	3
380	3
381	3
382	3
383	3
384	3
385	3
386	2
387	3
388	3
389	2
390	2
391	3
392	3
393	3
394	3
395	3
396	2
397	2
398	2
399	2
400	3
401	3
402	3
403	3
404	3
405	3
406	3
407	3
408	3
409	3
410	2
411	3
412	2
413	3
414	2
415	3
416	2
417	2
418	2
419	3
420	3
421	3
422	3
423	3
424	3
425	3
426	3
427	2
428	4
429	4
430	2
431	2
432	2
433	2
434	3
435	3
436	3
437	10
438	2
439	10
440	3
441	3
442	3
443	3
444	2
445	2
446	2
447	2
448	3
449	3
450	2
451	2
452	10
453	2
454	2
455	2
456	2
457	10
458	3
459	3
460	3
461	3
462	2
462	4
463	4
464	2
465	2
466	1
467	2
468	3
469	3
470	3
471	3
472	2
473	3
474	3
475	2
476	10
477	3
478	3
479	3
480	3
481	3
482	10
483	3
484	3
485	3
486	3
487	1
488	3
489	3
490	3
491	3
492	3
493	3
494	2
495	2
496	2
497	2
498	2
499	3
500	10
501	3
501	5
502	3
503	3
503	5
504	3
505	3
506	3
507	3
508	2
509	3
510	3
511	3
512	3
513	3
514	3
515	3
516	3
517	3
518	3
519	3
520	3
521	3
522	3
523	3
524	3
525	3
526	3
527	3
528	3
529	3
530	3
531	3
532	3
533	2
534	2
535	2
536	10
537	3
538	3
539	3
540	3
541	3
542	3
543	3
544	10
545	3
546	3
547	3
548	3
549	2
550	2
551	2
552	2
553	2
554	2
555	2
556	2
557	3
558	3
559	3
560	3
561	3
562	3
563	10
564	3
565	3
566	10
567	3
568	3
569	3
570	2
571	2
572	2
573	2
574	3
574	4
574	6
575	3
575	4
575	6
576	7
577	3
578	3
579	3
580	3
581	3
582	3
583	2
584	2
585	2
586	2
587	2
588	2
589	3
590	3
591	3
592	3
593	2
594	2
595	2
596	3
597	2
598	2
599	11
600	2
601	3
603	3
604	3
605	3
606	3
607	3
608	3
609	3
610	2
611	2
612	2
613	2
614	3
615	3
616	2
617	2
618	3
619	3
620	3
621	2
622	2
623	2
624	10
625	2
626	2
627	3
628	3
629	3
630	2
631	2
632	2
633	2
634	2
635	2
636	2
637	2
638	2
639	2
640	2
641	10
642	2
643	2
644	2
645	2
646	2
647	2
648	2
649	2
650	2
651	2
652	2
653	2
654	2
655	3
656	2
657	3
658	3
659	3
660	3
661	4
662	4
662	6
663	4
663	6
664	3
665	3
667	3
668	3
669	2
670	3
671	3
672	3
673	3
674	3
675	3
676	3
677	3
678	3
679	3
680	3
681	3
682	3
683	3
684	3
685	3
686	3
687	2
688	2
689	2
690	2
691	3
692	3
693	3
694	3
695	2
696	3
697	3
698	3
699	3
700	3
701	3
702	3
703	3
704	2
705	2
706	2
706	4
707	2
708	2
709	2
710	2
711	2
712	2
713	2
714	2
715	2
716	2
717	2
718	2
719	2
720	2
721	10
722	3
723	8
724	3
725	3
726	3
727	3
728	10
729	3
730	2
731	2
732	3
733	3
734	1
735	10
736	10
737	3
738	3
739	3
740	3
741	3
742	3
743	3
744	3
745	3
746	3
747	3
748	3
749	3
750	3
751	3
752	3
753	3
754	3
755	3
756	3
757	3
758	3
759	3
760	3
761	3
762	3
763	3
764	3
765	3
766	3
767	3
768	3
769	3
770	3
771	3
772	2
773	2
774	2
775	2
776	2
777	2
778	2
779	2
780	2
781	3
782	3
783	3
784	2
785	3
786	3
787	3
788	2
789	2
790	2
791	2
792	2
793	2
794	2
795	2
796	10
797	3
798	3
799	2
800	2
801	2
802	2
803	2
804	2
805	2
806	4
806	6
807	3
808	10
809	3
810	2
811	3
812	3
813	2
814	3
815	3
816	3
817	3
818	3
819	2
820	2
821	2
822	2
823	3
824	3
825	3
826	10
827	3
828	3
829	3
830	3
831	3
832	3
833	3
834	2
835	3
836	3
837	3
838	3
839	3
840	3
841	10
842	2
843	2
844	2
845	2
846	2
847	3
848	3
849	3
850	3
851	3
852	3
853	2
854	2
855	2
856	2
857	2
858	2
859	2
860	2
861	2
862	2
863	2
864	3
865	2
866	3
867	3
868	3
869	3
870	3
871	2
872	3
873	3
874	3
875	3
876	3
877	3
878	3
879	3
880	3
881	3
882	3
\.


--
-- Data for Name: plants_leaf_margins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_leaf_margins (plant_id, leaf_margin_id) FROM stdin;
1	9
1	4
2	4
2	9
3	4
4	3
5	2
6	2
7	9
8	3
9	3
10	3
11	9
11	8
11	3
12	13
12	3
13	13
13	3
14	13
14	3
15	3
16	3
17	3
18	3
19	3
20	3
21	3
22	3
23	3
24	3
25	3
26	9
27	9
27	8
28	8
29	3
29	13
29	4
30	4
31	4
32	4
33	12
34	3
35	3
35	13
36	3
37	3
38	3
39	3
40	3
41	3
42	3
43	3
43	8
44	3
45	4
46	3
47	4
48	3
49	3
50	12
51	3
52	3
53	3
54	3
55	3
56	3
57	3
58	12
59	3
60	3
61	3
62	4
63	3
64	3
65	3
66	3
67	3
68	3
68	10
69	3
69	9
70	13
70	3
71	8
72	13
73	3
73	4
74	3
74	4
75	12
76	3
77	3
78	3
79	3
80	3
81	3
82	9
82	4
83	3
84	3
85	4
86	3
87	9
87	6
88	9
88	6
89	9
89	6
90	3
91	3
92	8
93	3
94	3
95	3
96	3
97	3
98	3
99	3
100	3
101	3
102	3
103	3
104	3
105	3
106	12
107	3
108	3
109	3
110	3
111	3
112	3
113	3
114	3
115	3
116	12
117	13
118	13
119	3
120	3
121	3
122	3
123	3
123	4
124	3
124	10
125	12
126	3
127	3
128	4
128	3
129	3
130	12
131	3
132	3
133	5
133	9
134	4
135	3
135	8
136	8
137	12
138	3
139	3
140	3
141	3
141	4
142	3
143	3
144	3
145	3
146	3
147	3
148	3
149	3
150	3
151	3
152	3
153	3
154	3
155	3
156	3
157	3
158	3
159	3
160	3
161	13
161	1
162	3
162	8
163	8
164	3
164	9
165	8
166	9
167	3
167	9
168	8
169	3
170	3
171	3
172	9
173	3
174	8
174	13
175	13
176	13
176	8
177	13
178	13
179	3
179	13
180	3
181	3
182	3
183	3
184	3
185	9
186	3
187	3
188	3
189	9
189	4
190	3
191	9
191	4
192	9
193	4
194	3
195	13
196	13
197	13
197	8
198	3
198	8
199	3
200	3
200	8
201	8
202	3
203	3
203	9
204	3
204	8
205	3
205	9
206	3
207	3
208	3
209	3
210	3
211	9
211	4
212	3
213	3
214	3
215	3
216	3
217	3
218	3
219	3
220	9
220	4
220	6
221	3
222	9
222	4
223	13
223	8
223	4
224	13
224	8
225	13
225	8
226	13
226	8
227	12
228	8
228	13
229	13
230	13
230	8
231	3
232	3
233	12
234	12
235	6
235	9
235	4
236	8
237	6
237	9
238	3
239	3
240	3
241	3
242	8
243	8
244	8
245	9
246	8
247	4
247	9
248	9
248	8
249	4
249	9
250	3
251	4
252	4
253	3
254	3
255	3
256	3
257	3
258	3
259	3
260	3
261	3
262	3
263	3
264	3
265	3
266	3
267	3
268	3
269	3
270	3
271	3
272	3
273	3
274	3
275	3
276	3
277	3
278	3
279	3
280	3
281	3
282	13
282	8
283	12
284	13
285	3
286	3
287	8
288	3
288	4
289	3
290	3
290	8
290	9
291	3
292	3
293	3
294	3
295	3
296	3
297	3
298	3
299	9
299	8
300	4
300	6
301	4
301	6
302	8
302	3
303	3
304	3
304	9
305	13
306	13
307	3
308	3
308	10
309	3
310	9
310	8
311	3
311	8
312	3
313	3
314	8
315	11
316	3
317	3
318	3
319	3
320	3
321	3
322	3
323	4
324	3
325	9
325	4
326	9
326	8
327	12
328	3
329	3
330	3
330	10
331	3
332	3
333	3
334	3
335	3
336	12
337	3
338	3
339	3
340	3
341	3
342	3
343	3
344	3
345	3
346	3
347	9
347	4
348	3
349	3
350	3
351	3
352	3
353	3
354	3
354	9
355	3
356	3
357	3
358	3
359	13
360	13
360	8
361	3
362	12
363	3
364	3
365	3
366	3
367	3
368	3
369	13
370	3
371	3
371	8
372	4
372	8
373	9
373	4
374	4
375	9
375	4
376	9
376	4
377	4
378	4
379	4
380	4
380	8
381	4
382	9
382	8
383	8
384	3
385	4
386	3
387	3
387	13
388	4
389	3
390	4
391	3
392	3
393	3
394	3
395	9
396	3
397	3
398	3
399	3
400	3
401	3
402	3
403	3
404	3
405	4
405	13
406	4
406	8
407	4
408	4
409	3
410	3
410	8
411	3
412	4
413	4
414	3
415	3
416	3
417	3
418	3
419	3
419	11
420	3
421	3
422	3
423	3
424	3
425	3
426	3
427	3
428	3
429	3
430	3
431	3
432	3
433	3
434	13
435	3
436	3
437	12
438	3
439	12
440	13
440	8
441	13
441	8
442	13
443	4
443	8
444	3
445	3
446	3
446	4
447	3
447	4
448	13
449	13
450	3
451	3
452	12
453	3
454	3
455	3
456	3
457	12
458	3
459	3
460	3
461	3
462	4
463	4
464	4
465	3
466	4
467	3
468	3
469	4
469	8
470	3
471	3
472	3
473	3
474	3
475	9
476	12
477	3
478	13
478	4
479	3
480	3
481	3
482	12
483	3
484	3
484	8
485	3
486	8
486	3
487	4
488	3
489	3
490	3
491	3
492	3
493	3
494	3
495	3
496	3
497	3
498	3
499	4
500	12
501	4
502	4
503	4
504	8
505	4
506	4
507	3
507	4
508	3
509	4
510	3
511	3
512	3
513	3
514	3
515	13
516	13
516	8
517	12
518	8
519	3
520	3
521	8
522	3
523	8
524	3
525	3
526	3
527	3
528	3
529	3
530	3
531	3
532	4
533	3
534	3
535	3
536	12
537	8
538	4
539	3
539	9
540	3
540	8
541	8
542	8
542	7
543	8
544	12
545	8
546	8
547	8
547	7
548	3
549	3
550	3
551	3
552	3
553	3
554	3
555	3
556	3
557	4
557	9
558	4
558	9
559	3
560	3
561	3
562	3
563	12
564	13
564	8
565	13
565	8
566	12
567	3
568	8
569	8
570	3
571	3
572	3
573	3
574	3
575	3
576	8
577	3
577	4
578	3
579	13
579	8
580	13
581	13
581	3
582	8
582	13
583	3
584	3
585	3
586	3
587	3
588	3
589	9
590	4
590	8
590	13
591	3
592	3
593	3
594	4
595	3
596	13
596	8
597	3
598	3
599	3
600	3
601	3
603	3
604	3
605	3
606	3
607	3
608	3
609	3
610	3
611	3
612	3
613	3
614	3
615	3
616	3
617	3
618	3
619	3
620	3
621	3
621	4
622	3
622	4
623	3
624	12
625	9
626	3
627	9
627	4
628	4
629	3
630	3
631	3
632	3
633	3
634	3
635	3
636	3
637	3
638	3
639	3
640	3
641	12
642	3
643	3
644	3
645	3
646	3
647	3
648	3
649	3
650	3
651	3
652	3
653	3
654	3
655	9
656	9
657	13
657	6
658	13
658	3
659	3
660	3
661	3
662	3
663	3
664	4
664	3
665	3
667	4
668	3
669	3
670	3
671	8
672	3
673	3
674	9
675	3
675	9
676	3
677	4
678	4
678	6
679	4
679	6
679	9
680	4
681	9
681	4
682	4
682	8
683	4
683	7
684	4
684	8
685	3
686	3
687	4
687	3
688	3
689	3
690	3
691	3
692	3
693	3
694	3
695	3
696	4
697	4
698	4
699	4
700	4
701	4
702	4
703	4
704	3
705	3
706	3
707	3
708	3
709	3
710	3
711	3
712	3
713	4
714	4
714	9
715	4
716	3
716	4
717	4
718	6
719	3
720	8
721	3
722	3
723	3
724	3
725	3
726	12
727	3
728	12
729	3
730	3
731	3
732	3
732	9
732	4
733	4
733	9
734	3
734	9
734	8
735	12
736	12
737	3
738	9
738	4
739	3
740	3
741	3
742	13
743	3
743	13
744	13
745	3
746	13
747	3
748	3
749	3
749	13
750	3
750	13
751	12
752	3
753	13
754	3
755	3
756	3
756	8
756	9
757	3
758	13
759	3
759	13
760	13
761	13
762	3
762	13
763	3
764	3
765	4
765	9
765	13
766	3
767	3
768	3
769	3
770	3
771	3
772	3
773	3
774	3
775	3
776	3
777	3
778	3
779	3
780	3
780	10
781	3
781	4
782	4
783	3
784	3
785	3
786	3
787	3
788	3
789	3
790	3
791	3
792	3
793	3
794	3
795	3
796	13
797	3
798	3
799	3
800	3
801	3
802	3
803	3
804	3
805	3
806	3
807	4
808	12
809	3
810	3
811	3
812	3
813	3
814	3
815	3
816	3
817	3
817	9
818	4
819	3
820	3
821	3
822	3
823	3
824	3
825	3
826	12
827	4
828	4
829	3
830	3
831	3
832	3
833	3
834	3
835	4
836	3
837	3
838	3
839	3
840	3
841	12
842	3
843	3
844	3
845	3
846	3
847	3
848	3
849	3
850	3
851	3
852	3
853	4
854	3
855	3
856	3
857	3
858	3
859	3
860	3
861	3
862	12
863	3
863	8
864	3
865	3
866	3
867	3
868	3
869	3
870	3
871	3
872	3
873	3
874	3
875	4
876	3
876	13
876	8
877	13
877	8
878	4
879	4
880	4
881	4
882	3
882	4
\.


--
-- Data for Name: plants_matk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_matk (matk_id, plant_id, nucleotide, country, genbank_accession, bold_id) FROM stdin;
\.


--
-- Data for Name: plants_photos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_photos (plant_id, photo_name, photo_id) FROM stdin;
1	01780.jpg	1
1	01781.jpg	2
1	01782.jpg	3
2	0001.jpg	4
2	0002.jpg	5
5	0003.jpg	6
5	0004.jpg	7
6	0005.jpg	8
6	0006.jpg	9
7	01783.jpg	10
7	01784.jpg	11
7	01785.jpg	12
8	0007.jpg	13
8	0008.jpg	14
9	0009.jpg	15
9	0010.jpg	16
10	0011.jpg	17
11	0012.jpg	18
11	0013.jpg	19
12	01357.jpg	20
12	01112.jpg	21
12	01113.jpg	22
14	01114.jpg	23
14	01115.jpg	24
15	0016.jpg	25
15	0017.jpg	26
16	01116.jpg	27
17	0018.jpg	28
17	0019.jpg	29
18	0020.jpg	30
18	0021.jpg	31
19	0022.jpg	32
19	0023.jpg	33
20	0024.jpg	34
20	0025.jpg	35
24	0026.jpg	36
24	0027.jpg	37
25	0028.jpg	38
25	0029.jpg	39
26	0032.jpg	40
27	0033.jpg	41
27	0034.jpg	42
28	0035.jpg	43
28	0036.jpg	44
29	01117.jpg	45
29	01118.jpg	46
30	0039.jpg	47
30	0040.jpg	48
31	0044.jpg	49
33	0045.jpg	50
33	0046.jpg	51
34	0047.jpg	52
34	0048.jpg	53
35	0050.jpg	54
36	01121.jpg	55
36	01122.jpg	56
37	0053.jpg	57
37	0054.jpg	58
38	0055.jpg	59
38	0056.jpg	60
38	0057.jpg	61
40	0058.jpg	62
40	0059.jpg	63
41	01123.jpg	64
41	01124.jpg	65
42	0060.jpg	66
42	0061.jpg	67
43	0062.jpg	68
43	0063.jpg	69
43	0064.jpg	70
44	0065.jpg	71
44	0066.jpg	72
46	0069.jpg	73
46	0070.jpg	74
47	01786.jpg	75
47	01787.jpg	76
47	01788.jpg	77
51	01789.jpg	78
51	01790.jpg	79
51	01791.jpg	80
53	0071.jpg	81
53	0072.jpg	82
55	0080.jpg	83
55	0081.jpg	84
57	0077.jpg	85
59	0078.jpg	86
59	0079.jpg	87
61	0082.jpg	88
61	0083.jpg	89
62	01559.jpg	90
63	0084.jpg	91
63	0085.jpg	92
64	0086.jpg	93
64	0087.jpg	94
65	0088.jpg	95
65	0089.jpg	96
66	01795.jpg	97
66	01796.jpg	98
66	01797.jpg	99
67	0090.jpg	100
67	0091.jpg	101
69	0092.jpg	102
69	0093.jpg	103
70	0094.jpg	104
70	0095.jpg	105
71	0096.jpg	106
71	0097.jpg	107
72	01798.jpg	108
72	01799.jpg	109
72	01800.jpg	110
73	0098.jpg	111
73	0099.jpg	112
74	01561.jpg	113
74	01562.jpg	114
76	0100.jpg	115
76	0101.jpg	116
77	0102.jpg	117
77	0103.jpg	118
78	0104.jpg	119
79	0105.jpg	120
79	0106.jpg	121
80	0107.jpg	122
80	0108.jpg	123
83	0109.jpg	124
83	0110.jpg	125
84	0111.jpg	126
84	0112.jpg	127
86	0113.jpg	128
86	0114.jpg	129
87	0115.jpg	130
87	0116.jpg	131
88	0117.jpg	132
88	0118.jpg	133
89	0119.jpg	134
90	0120.jpg	135
90	0121.jpg	136
91	0122.jpg	137
91	0123.jpg	138
92	0124.jpg	139
92	0125.jpg	140
92	01126.jpg	141
93	01612.jpg	142
93	01613.jpg	143
93	01614.jpg	144
94	01127.jpg	145
94	01128.jpg	146
95	0128.jpg	147
95	0129.jpg	148
96	0130.jpg	149
96	0131.jpg	150
97	01801.jpg	151
97	01802.jpg	152
98	0132.jpg	153
98	0133.jpg	154
99	0134.jpg	155
99	0135.jpg	156
100	01131.jpg	157
100	01132.jpg	158
101	0137.jpg	159
101	0138.jpg	160
102	01359.jpg	161
102	01361.jpg	162
102	01360.jpg	163
103	0139.jpg	164
104	0141.jpg	166
104	0142.jpg	167
105	01133.jpg	168
105	01134.jpg	169
107	0143.jpg	170
107	0144.jpg	171
108	0145.jpg	172
108	0146.jpg	173
110	0147.jpg	174
110	0148.jpg	175
111	0149.jpg	176
111	0150.jpg	177
112	0153.jpg	178
112	0154.jpg	179
113	0151.jpg	180
113	0152.jpg	181
114	0155.jpg	182
115	01484.jpg	183
115	01485.jpg	184
116	01803.jpg	185
116	01805.jpg	186
116	01806.jpg	187
117	0156.jpg	188
117	0157.jpg	189
118	01807.jpg	190
118	01808.jpg	191
118	01809.jpg	192
119	0158.jpg	193
119	0159.jpg	194
119	0160.jpg	195
120	0161.jpg	196
120	0162.jpg	197
121	0163.jpg	198
121	0164.jpg	199
122	01135.jpg	200
122	01136.jpg	201
124	0165.jpg	202
124	0166.jpg	203
126	01759.jpg	204
126	01760.jpg	205
129	0167.jpg	206
129	0168.jpg	207
131	0169.jpg	208
131	0170.jpg	209
133	0171.jpg	210
135	0172.jpg	211
135	0173.jpg	212
136	0174.jpg	213
137	0175.jpg	214
137	0176.jpg	215
138	0177.jpg	216
138	0178.jpg	217
139	0179.jpg	218
139	0180.jpg	219
140	01615.jpg	220
140	01617.jpg	221
141	01627.jpg	222
142	01139.jpg	223
142	01140.jpg	224
143	0187.jpg	225
143	0188.jpg	226
144	0189.jpg	227
144	0190.jpg	228
145	0191.jpg	229
145	0192.jpg	230
146	0193.jpg	231
146	0194.jpg	232
147	0195.jpg	233
147	0196.jpg	234
149	0197.jpg	235
149	0198.jpg	236
150	01810.jpg	237
150	01811.jpg	238
150	01813.jpg	239
151	0199.jpg	240
151	0200.jpg	241
153	01421.jpg	242
153	01422.jpg	243
154	0201.jpg	244
154	0202.jpg	245
155	0203.jpg	246
155	0204.jpg	247
156	0205.jpg	248
156	0206.jpg	249
157	01413.jpg	250
158	01486.jpg	251
158	01487.jpg	252
158	01488.jpg	253
159	0207.jpg	254
159	0208.jpg	255
161	0209.jpg	256
161	0210.jpg	257
162	0211.jpg	258
163	0212.jpg	259
163	0213.jpg	260
164	0214.jpg	261
164	0215.jpg	262
165	01141.jpg	263
165	01142.jpg	264
166	0216.jpg	265
166	0217.jpg	266
167	0218.jpg	267
167	0219.jpg	268
168	01489.jpg	269
168	01490.jpg	270
169	01145.jpg	271
169	01146.jpg	272
171	01423.jpg	273
171	01424.jpg	274
172	01426.jpg	275
172	01425.jpg	276
174	0226.jpg	277
174	0227.jpg	278
175	0228.jpg	279
175	0229.jpg	280
176	0230.jpg	281
176	0231.jpg	282
177	0232.jpg	283
177	0233.jpg	284
178	0234.jpg	285
178	0235.jpg	286
179	0237.jpg	287
180	0238.jpg	288
180	0239.jpg	289
181	0240.jpg	290
181	0241.jpg	291
182	01147.jpg	292
182	01148.jpg	293
183	0242.jpg	294
183	0243.jpg	295
184	01149.jpg	296
184	01150.jpg	297
185	0246.jpg	298
185	0247.jpg	299
187	0248.jpg	300
187	0249.jpg	301
191	0250.jpg	302
191	0251.jpg	303
192	01814.jpg	304
192	01815.jpg	305
192	01816.jpg	306
193	01930.jpg	307
194	01493.jpg	308
194	01492.jpg	309
195	0252.jpg	310
195	0253.jpg	311
196	01494.jpg	312
196	01495.jpg	313
196	01496.jpg	314
198	0254.jpg	315
198	0255.jpg	316
199	0256.jpg	317
200	0257.jpg	318
200	0258.jpg	319
201	0259.jpg	320
201	0260.jpg	321
202	0261.jpg	322
202	0262.jpg	323
203	0263.jpg	324
203	0264.jpg	325
204	0265.jpg	326
204	0266.jpg	327
205	0267.jpg	328
205	0268.jpg	329
207	0271.jpg	330
207	01414.jpg	331
208	0272.jpg	332
208	0273.jpg	333
209	0274.jpg	334
209	0275.jpg	335
210	01931.jpg	336
210	01932.jpg	337
212	01817.jpg	338
212	01818.jpg	339
213	01819.jpg	340
213	01820.jpg	341
214	0276.jpg	342
214	0277.jpg	343
215	01427.jpg	344
215	01428.jpg	345
216	01153.jpg	346
216	01154.jpg	347
217	01628.jpg	348
217	01629.jpg	349
217	01630.jpg	350
218	0278.jpg	351
218	0279.jpg	352
219	01155.jpg	353
219	01156.jpg	354
220	0280.jpg	355
220	0281.jpg	356
221	0282.jpg	357
221	0283.jpg	358
222	0284.jpg	359
223	0285.jpg	360
223	0286.jpg	361
224	0287.jpg	362
224	0288.jpg	363
225	0289.jpg	364
225	0290.jpg	365
226	0293.jpg	366
226	0294.jpg	367
229	01821.jpg	368
229	01822.jpg	369
229	01823.jpg	370
230	0291.jpg	371
230	0292.jpg	372
231	0297.jpg	373
231	0298.jpg	374
232	0299.jpg	375
232	0300.jpg	376
233	01429.jpg	377
233	01430.jpg	378
234	01631.jpg	379
234	01632.jpg	380
234	01633.jpg	381
235	0301.jpg	382
235	0302.jpg	383
236	0303.jpg	384
236	0304.jpg	385
237	0305.jpg	386
237	0306.jpg	387
238	01431.jpg	388
238	01432.jpg	389
239	0307.jpg	390
239	0308.jpg	391
240	01159.jpg	392
240	01160.jpg	393
241	0320.jpg	394
241	0321.jpg	395
243	0309.jpg	396
243	0310.jpg	397
244	0322.jpg	398
244	0323.jpg	399
245	0311.jpg	400
246	0312.jpg	401
246	0313.jpg	402
247	0314.jpg	403
247	0315.jpg	404
248	01497.jpg	405
248	01498.jpg	406
249	0316.jpg	407
249	0317.jpg	408
251	01824.jpg	409
251	01825.jpg	410
254	01165.jpg	411
254	01166.jpg	412
255	0324.jpg	413
255	0325.jpg	414
256	0326.jpg	415
256	0327.jpg	416
257	0328.jpg	417
257	0329.jpg	418
258	0330.jpg	419
258	0331.jpg	420
259	0332.jpg	421
259	0333.jpg	422
260	01169.jpg	423
260	01170.jpg	424
261	0334.jpg	425
261	0335.jpg	426
262	0336.jpg	427
263	01171.jpg	428
263	01172.jpg	429
264	0337.jpg	430
264	0338.jpg	431
265	0339.jpg	432
265	0340.jpg	433
266	01499.jpg	434
266	01500.jpg	435
267	0341.jpg	436
267	0342.jpg	437
268	01173.jpg	438
268	01174.jpg	439
268	0344.jpg	440
269	01362.jpg	441
269	01363.jpg	442
270	0345.jpg	443
271	0346.jpg	444
271	0347.jpg	445
272	0348.jpg	446
272	0349.jpg	447
273	0350.jpg	448
273	01474.jpg	449
274	0351.jpg	450
274	0352.jpg	451
275	01634.jpg	452
275	01635.jpg	453
276	01364.jpg	454
276	01365.jpg	455
277	01366.jpg	456
277	01367.jpg	457
277	01368.jpg	458
278	0353.jpg	459
279	01175.jpg	460
279	01176.jpg	461
280	0355.jpg	462
280	0356.jpg	463
281	01177.jpg	464
281	01178.jpg	465
282	0357.jpg	466
282	0358.jpg	467
284	0359.jpg	468
284	0360.jpg	469
285	01826.jpg	470
285	01827.jpg	471
285	01828.jpg	472
287	0361.jpg	473
287	0362.jpg	474
288	01179.jpg	475
288	01180.jpg	476
289	0365.jpg	477
289	0366.jpg	478
290	0367.jpg	479
290	0368.jpg	480
290	0369.jpg	481
290	0370.jpg	482
291	0371.jpg	483
291	0372.jpg	484
292	01502.jpg	485
292	01503.jpg	486
293	0373.jpg	487
293	0374.jpg	488
294	0375.jpg	489
294	0376.jpg	490
295	0377.jpg	491
295	0378.jpg	492
296	0379.jpg	493
296	0380.jpg	494
297	0383.jpg	495
297	0384.jpg	496
298	0381.jpg	497
298	0382.jpg	498
299	0387.jpg	499
299	0388.jpg	500
300	0389.jpg	501
300	0390.jpg	502
301	01182.jpg	503
302	01183.jpg	504
302	01184.jpg	505
303	0392.jpg	506
303	0393.jpg	507
304	01433.jpg	508
304	01434.jpg	509
305	01829.jpg	510
305	01830.jpg	511
305	01831.jpg	512
307	0394.jpg	513
307	0395.jpg	514
308	0396.jpg	515
308	0397.jpg	516
309	0398.jpg	517
309	0399.jpg	518
309	0400.jpg	519
310	0401.jpg	520
310	0402.jpg	521
311	0403.jpg	522
311	0404.jpg	523
312	0405.jpg	524
312	0406.jpg	525
315	01834.jpg	526
318	0407.jpg	527
318	0408.jpg	528
319	0409.jpg	529
319	0410.jpg	530
320	0411.jpg	531
320	0412.jpg	532
323	0415.jpg	533
323	0416.jpg	534
324	0417.jpg	535
324	0418.jpg	536
325	0419.jpg	537
325	0420.jpg	538
326	01373.jpg	539
326	01374.jpg	540
328	0421.jpg	541
328	0422.jpg	542
329	01639.jpg	543
329	01640.jpg	544
329	01641.jpg	545
330	0423.jpg	546
330	0424.jpg	547
331	0425.jpg	548
331	0426.jpg	549
332	01324.jpg	550
332	01325.jpg	551
333	0427.jpg	552
333	0428.jpg	553
334	0429.jpg	554
334	0430.jpg	555
335	0431.jpg	556
335	0432.jpg	557
336	01835.jpg	558
336	01836.jpg	559
336	01837.jpg	560
336	01838.jpg	561
337	0433.jpg	562
337	0434.jpg	563
338	0435.jpg	564
338	0436.jpg	565
339	01642.jpg	566
339	01643.jpg	567
339	01644.jpg	568
339	01646.jpg	569
340	01435.jpg	570
340	01436.jpg	571
341	0437.jpg	572
341	0438.jpg	573
343	01738.jpg	574
343	01739.jpg	575
343	01740.jpg	576
344	01742.jpg	577
344	01743.jpg	578
344	01744.jpg	579
344	01745.jpg	580
346	0439.jpg	581
346	0440.jpg	582
347	0441.jpg	583
347	0442.jpg	584
348	0443.jpg	585
348	0444.jpg	586
351	0447.jpg	587
351	0448.jpg	588
352	01839.jpg	589
352	01840.jpg	590
352	01841.jpg	591
353	0449.jpg	592
353	0450.jpg	593
354	0451.jpg	594
354	0452.jpg	595
355	0453.jpg	596
355	0454.jpg	597
357	0455.jpg	598
357	0456.jpg	599
358	0457.jpg	600
358	0458.jpg	601
359	01437.jpg	602
359	01438.jpg	603
361	0459.jpg	604
364	01845.jpg	605
364	01846.jpg	606
364	01847.jpg	607
365	01848.jpg	608
365	01849.jpg	609
365	01850.jpg	610
366	01851.jpg	611
366	01852.jpg	612
366	01853.jpg	613
367	01842.jpg	614
367	01843.jpg	615
367	01844.jpg	616
368	0462.jpg	617
368	0463.jpg	618
369	0464.jpg	619
369	0465.jpg	620
370	0466.jpg	621
370	0467.jpg	622
371	0468.jpg	623
371	0469.jpg	624
372	0470.jpg	625
373	0471.jpg	626
373	0472.jpg	627
374	0473.jpg	628
374	0474.jpg	629
375	0475.jpg	630
375	0476.jpg	631
376	01505.jpg	632
377	0477.jpg	633
377	0478.jpg	634
378	0481.jpg	635
378	0482.jpg	636
379	01858.jpg	637
379	01859.jpg	638
379	01860.jpg	639
381	0483.jpg	640
381	0484.jpg	641
382	0485.jpg	642
382	0486.jpg	643
383	0479.jpg	644
383	0480.jpg	645
384	0487.jpg	646
385	0488.jpg	647
386	0489.jpg	648
386	0490.jpg	649
387	0491.jpg	650
388	01861.jpg	651
388	01862.jpg	652
388	01863.jpg	653
390	01466.jpg	654
390	01467.jpg	655
390	01477.jpg	656
392	01190.jpg	657
392	01191.jpg	658
393	0492.jpg	659
393	0493.jpg	660
394	0494.jpg	661
394	0495.jpg	662
395	0497.jpg	663
396	0498.jpg	664
396	0499.jpg	665
397	0500.jpg	666
398	0501.jpg	667
398	0502.jpg	668
400	01864.jpg	669
400	01865.jpg	670
400	01866.jpg	671
402	0503.jpg	672
402	0504.jpg	673
403	0507.jpg	674
403	0508.jpg	675
404	01752.jpg	676
404	01753.jpg	677
404	01754.jpg	678
405	01508.jpg	679
405	01509.jpg	680
405	01510.jpg	681
406	01512.jpg	682
406	01511.jpg	683
407	0509.jpg	684
407	0510.jpg	685
408	01867.jpg	686
408	01868.jpg	687
408	01869.jpg	688
408	01870.jpg	689
409	01668.jpg	690
409	01669.jpg	691
409	01670.jpg	692
410	01871.jpg	693
410	01872.jpg	694
410	01873.jpg	695
411	01194.jpg	696
411	01195.jpg	697
412	0511.jpg	698
412	0512.jpg	699
413	0513.jpg	700
413	0514.jpg	701
414	0515.jpg	702
414	0516.jpg	703
415	0517.jpg	704
415	0518.jpg	705
418	01601.jpg	706
418	01602.jpg	707
418	01603.jpg	708
419	01671.jpg	709
419	01672.jpg	710
419	01673.jpg	711
420	01513.jpg	712
420	01514.jpg	713
421	0519.jpg	714
421	0520.jpg	715
422	01604.jpg	716
422	01605.jpg	717
422	01606.jpg	718
425	01555.jpg	719
425	01556.jpg	720
426	01375.jpg	721
426	01376.jpg	722
426	01478.jpg	723
427	0521.jpg	724
427	01196.jpg	725
427	01197.jpg	726
427	01440.jpg	727
428	0523.jpg	728
428	0524.jpg	729
430	01875.jpg	730
430	01876.jpg	731
430	01877.jpg	732
431	0525.jpg	733
431	0526.jpg	734
432	0527.jpg	735
432	0528.jpg	736
433	01200.jpg	737
433	01201.jpg	738
435	0535.jpg	739
435	0536.jpg	740
436	0533.jpg	741
436	0534.jpg	742
440	0537.jpg	743
440	0538.jpg	744
441	0539.jpg	745
441	0540.jpg	746
442	01878.jpg	747
442	01879.jpg	748
442	01880.jpg	749
442	01881.jpg	750
443	01558.jpg	751
443	01557.jpg	752
444	0541.jpg	753
444	0542.jpg	754
445	0543.jpg	755
445	0544.jpg	756
446	0545.jpg	757
446	0546.jpg	758
447	0547.jpg	759
447	0548.jpg	760
448	0549.jpg	761
448	0550.jpg	762
449	0551.jpg	763
449	0552.jpg	764
450	0553.jpg	765
450	0554.jpg	766
451	0555.jpg	767
451	0556.jpg	768
453	0557.jpg	769
453	0558.jpg	770
454	0559.jpg	771
454	0560.jpg	772
455	01202.jpg	773
455	01203.jpg	774
456	01204.jpg	775
456	01205.jpg	776
458	01607.jpg	777
458	01608.jpg	778
459	0563.jpg	779
459	0564.jpg	780
460	0565.jpg	781
460	0566.jpg	782
461	0567.jpg	783
461	0568.jpg	784
463	0569.jpg	785
463	0570.jpg	786
465	0571.jpg	787
465	0572.jpg	788
466	0573.jpg	789
466	01207.jpg	790
468	0575.jpg	791
468	0576.jpg	792
469	0577.jpg	793
469	0578.jpg	794
470	0579.jpg	795
470	0580.jpg	796
471	0581.jpg	797
471	0582.jpg	798
472	0583.jpg	799
472	0584.jpg	800
473	01208.jpg	801
473	01209.jpg	802
474	0585.jpg	803
474	0586.jpg	804
475	01882.jpg	805
475	01883.jpg	806
475	01884.jpg	807
477	0589.jpg	808
477	0590.jpg	809
478	01517.jpg	810
479	0591.jpg	811
479	0592.jpg	812
480	0593.jpg	813
480	0594.jpg	814
481	0595.jpg	815
481	0596.jpg	816
483	0597.jpg	817
483	0598.jpg	818
484	0599.jpg	819
484	0600.jpg	820
485	0601.jpg	821
485	0602.jpg	822
486	01936.jpg	823
486	01937.jpg	824
486	0603.jpg	825
487	0604.jpg	826
488	0605.jpg	827
488	01211.jpg	828
491	0607.jpg	829
491	0608.jpg	830
492	0609.jpg	831
492	0610.jpg	832
493	0611.jpg	833
493	0612.jpg	834
494	01885.jpg	835
494	01886.jpg	836
494	01887.jpg	837
496	0385.jpg	838
496	0386.jpg	839
497	01768.jpg	840
497	01769.jpg	841
503	0613.jpg	842
503	0614.jpg	843
504	01212.jpg	844
504	0618.jpg	845
505	01214.jpg	846
505	01215.jpg	847
506	01685.jpg	848
506	01686.jpg	849
506	01687.jpg	850
507	0619.jpg	851
507	0620.jpg	852
508	0621.jpg	853
508	0622.jpg	854
509	01379.jpg	855
509	01380.jpg	856
510	01216.jpg	857
511	0623.jpg	858
511	0624.jpg	859
512	0625.jpg	860
512	0626.jpg	861
513	0627.jpg	862
513	0628.jpg	863
514	01217.jpg	864
514	01218.jpg	865
515	01888.jpg	866
515	01889.jpg	867
515	01890.jpg	868
515	01891.jpg	869
516	0631.jpg	870
516	0632.jpg	871
517	0639.jpg	872
518	0633.jpg	873
518	0634.jpg	874
519	0635.jpg	875
519	0636.jpg	876
520	01518.jpg	877
520	01519.jpg	878
521	01415.jpg	879
522	01220.jpg	880
522	01219.jpg	881
523	0637.jpg	882
523	0638.jpg	883
524	0640.jpg	884
524	0641.jpg	885
526	0644.jpg	886
526	0645.jpg	887
527	0646.jpg	888
527	0647.jpg	889
528	0648.jpg	890
528	0649.jpg	891
529	0650.jpg	892
529	0651.jpg	893
530	0652.jpg	894
531	0653.jpg	895
531	0654.jpg	896
532	0655.jpg	897
532	0656.jpg	898
533	01221.jpg	899
534	01223.jpg	900
534	01224.jpg	901
535	0657.jpg	902
537	0658.jpg	903
537	0659.jpg	904
538	01523.jpg	905
538	01524.jpg	906
539	01225.jpg	907
539	01226.jpg	908
540	0662.jpg	909
540	0663.jpg	910
543	0664.jpg	911
543	0665.jpg	912
545	0666.jpg	913
545	0667.jpg	914
548	01231.jpg	915
548	01232.jpg	916
548	01479.jpg	917
549	0670.jpg	918
549	0671.jpg	919
549	01383.jpg	920
550	01525.jpg	921
550	01526.jpg	922
551	0673.jpg	923
551	0674.jpg	924
551	01475.jpg	925
552	01233.jpg	926
552	01234.jpg	927
553	0675.jpg	928
553	0676.jpg	929
554	01528.jpg	930
555	0678.jpg	931
556	01338.jpg	932
557	0679.jpg	933
557	0680.jpg	934
558	0681.jpg	935
558	0682.jpg	936
559	0683.jpg	937
559	0684.jpg	938
562	01235.jpg	939
562	01236.jpg	940
563	01416.jpg	941
564	01157.jpg	942
564	01158.jpg	943
565	01237.jpg	944
565	01238.jpg	945
567	01239.jpg	946
567	01240.jpg	947
568	01441.jpg	948
568	01442.jpg	949
568	01443.jpg	950
569	0687.jpg	951
569	0688.jpg	952
570	01241.jpg	953
570	01242.jpg	954
572	01243.jpg	955
572	01244.jpg	956
573	0691.jpg	957
573	0692.jpg	958
574	0693.jpg	959
574	0694.jpg	960
575	0695.jpg	961
575	0696.jpg	962
576	0697.jpg	963
576	0698.jpg	964
577	01691.jpg	965
577	01692.jpg	966
577	01693.jpg	967
578	01940.jpg	968
579	0701.jpg	969
579	0702.jpg	970
580	01245.jpg	971
580	01246.jpg	972
581	0703.jpg	973
581	0704.jpg	974
582	0705.jpg	975
582	0706.jpg	976
583	0707.jpg	977
583	0708.jpg	978
584	01694.jpg	979
584	01695.jpg	980
584	01696.jpg	981
585	0709.jpg	982
585	0710.jpg	983
586	0711.jpg	984
586	0712.jpg	985
587	0713.jpg	986
587	0714.jpg	987
588	01609.jpg	988
588	01610.jpg	989
589	01892.jpg	990
589	01893.jpg	991
589	01894.jpg	992
590	01530.jpg	993
590	01529.jpg	994
591	0716.jpg	995
591	0715.jpg	996
592	0717.jpg	997
592	0718.jpg	998
593	0719.jpg	999
593	0720.jpg	1000
594	01895.jpg	1001
594	01896.jpg	1002
594	01897.jpg	1003
596	0723.jpg	1004
596	0724.jpg	1005
597	0725.jpg	1006
597	0726.jpg	1007
597	0727.jpg	1008
597	0728.jpg	1009
598	01898.jpg	1010
598	01899.jpg	1011
598	01900.jpg	1012
598	01901.jpg	1013
600	01445.jpg	1014
600	01444.jpg	1015
601	0729.jpg	1016
601	0730.jpg	1017
602	01700.jpg	1018
602	01701.jpg	1019
602	01702.jpg	1020
603	0731.jpg	1021
603	0732.jpg	1022
604	0733.jpg	1023
604	0734.jpg	1024
605	0735.jpg	1025
605	0736.jpg	1026
606	01902.jpg	1027
606	01903.jpg	1028
606	01904.jpg	1029
606	01905.jpg	1030
607	01531.jpg	1031
607	01534.jpg	1032
607	01533.jpg	1033
609	0737.jpg	1034
609	0738.jpg	1035
610	01384.jpg	1036
610	01385.jpg	1037
610	01386.jpg	1038
611	0741.jpg	1039
611	0742.jpg	1040
612	0743.jpg	1041
612	0744.jpg	1042
615	0745.jpg	1043
615	0746.jpg	1044
616	0747.jpg	1045
616	0748.jpg	1046
617	0749.jpg	1047
617	0750.jpg	1048
618	01446.jpg	1049
619	01417.jpg	1050
621	0751.jpg	1051
621	0752.jpg	1052
622	0753.jpg	1053
622	0754.jpg	1054
625	01249.jpg	1055
625	01250.jpg	1056
626	0755.jpg	1057
626	0756.jpg	1058
627	0757.jpg	1059
627	0758.jpg	1060
628	0759.jpg	1061
628	0760.jpg	1062
629	0761.jpg	1063
629	0762.jpg	1064
630	0763.jpg	1065
630	0764.jpg	1066
631	01253.jpg	1067
631	01254.jpg	1068
632	0765.jpg	1069
632	0766.jpg	1070
633	0767.jpg	1071
633	0768.jpg	1072
634	0769.jpg	1073
634	0770.jpg	1074
636	0771.jpg	1075
636	0772.jpg	1076
637	01346.jpg	1077
637	01347.jpg	1078
637	01349.jpg	1079
638	0773.jpg	1080
638	0774.jpg	1081
639	0775.jpg	1082
639	0776.jpg	1083
640	0777.jpg	1084
640	0778.jpg	1085
642	0779.jpg	1086
642	0780.jpg	1087
644	0781.jpg	1088
644	0782.jpg	1089
645	0783.jpg	1090
645	0784.jpg	1091
646	01255.jpg	1092
646	01256.jpg	1093
647	01257.jpg	1094
647	01258.jpg	1095
649	0787.jpg	1096
649	0788.jpg	1097
650	01259.jpg	1098
650	0789.jpg	1099
650	0790.jpg	1100
651	01447.jpg	1101
651	01448.jpg	1102
652	0791.jpg	1103
652	0792.jpg	1104
653	0793.jpg	1105
653	0794.jpg	1106
654	0795.jpg	1107
654	0796.jpg	1108
655	0797.jpg	1109
656	0798.jpg	1110
656	0799.jpg	1111
657	0800.jpg	1112
657	0801.jpg	1113
659	0802.jpg	1114
659	01388.jpg	1115
660	01926.jpg	1116
660	01927.jpg	1117
660	01928.jpg	1118
660	01929.jpg	1119
661	01546.jpg	1120
661	01547.jpg	1121
662	0803.jpg	1122
662	0804.jpg	1123
663	0805.jpg	1124
663	0806.jpg	1125
664	0807.jpg	1126
664	0808.jpg	1127
664	0809.jpg	1128
665	0810.jpg	1129
665	0811.jpg	1130
666	0812.jpg	1131
666	0813.jpg	1132
667	0814.jpg	1133
667	0815.jpg	1134
668	0816.jpg	1135
668	0817.jpg	1136
668	0818.jpg	1137
670	0819.jpg	1138
670	0820.jpg	1139
671	0821.jpg	1140
672	01537.jpg	1141
673	0822.jpg	1142
673	0823.jpg	1143
673	01538.jpg	1144
675	0824.jpg	1145
675	0825.jpg	1146
678	0828.jpg	1147
679	0829.jpg	1148
679	0830.jpg	1149
680	01906.jpg	1150
680	01907.jpg	1151
680	01908.jpg	1152
682	01266.jpg	1153
682	01267.jpg	1154
683	01264.jpg	1155
683	01265.jpg	1156
684	01268.jpg	1157
684	01269.jpg	1158
685	0835.jpg	1159
685	0836.jpg	1160
686	0837.jpg	1161
686	0838.jpg	1162
687	01909.jpg	1163
687	01910.jpg	1164
687	01911.jpg	1165
688	0841.jpg	1166
688	0842.jpg	1167
689	01270.jpg	1168
689	01271.jpg	1169
690	0839.jpg	1170
690	0840.jpg	1171
691	0847.jpg	1172
691	0848.jpg	1173
692	01449.jpg	1174
692	01450.jpg	1175
693	0849.jpg	1176
693	0850.jpg	1177
694	0851.jpg	1178
694	0852.jpg	1179
695	0853.jpg	1180
695	0854.jpg	1181
696	0855.jpg	1182
696	0856.jpg	1183
697	0857.jpg	1184
697	0858.jpg	1185
698	0859.jpg	1186
698	0860.jpg	1187
699	0861.jpg	1188
699	0862.jpg	1189
700	0863.jpg	1190
700	0864.jpg	1191
701	0865.jpg	1192
701	0866.jpg	1193
702	0867.jpg	1194
702	0868.jpg	1195
703	0869.jpg	1196
703	0870.jpg	1197
704	0871.jpg	1198
704	0872.jpg	1199
705	0875.jpg	1200
705	0876.jpg	1201
706	01274.jpg	1202
706	01275.jpg	1203
707	0879.jpg	1204
707	0880.jpg	1205
708	01276.jpg	1206
708	01277.jpg	1207
709	0882.jpg	1208
709	0883.jpg	1209
710	0881.jpg	1210
711	0873.jpg	1211
711	0874.jpg	1212
712	0884.jpg	1213
712	0885.jpg	1214
713	0886.jpg	1215
713	0887.jpg	1216
714	01278.jpg	1217
714	01279.jpg	1218
714	0889.jpg	1219
715	0890.jpg	1220
715	0891.jpg	1221
716	0892.jpg	1222
716	0893.jpg	1223
717	0894.jpg	1224
717	0895.jpg	1225
718	0896.jpg	1226
718	0897.jpg	1227
719	0898.jpg	1228
719	0899.jpg	1229
720	0900.jpg	1230
720	0901.jpg	1231
722	0902.jpg	1232
722	0903.jpg	1233
723	0906.jpg	1234
723	0907.jpg	1235
724	0908.jpg	1236
724	0909.jpg	1237
725	0910.jpg	1238
725	0911.jpg	1239
726	01280.jpg	1240
726	01281.jpg	1241
727	01282.jpg	1242
727	01283.jpg	1243
728	01451.jpg	1244
728	01452.jpg	1245
729	0912.jpg	1246
729	0913.jpg	1247
730	01284.jpg	1248
730	01285.jpg	1249
731	0916.jpg	1250
731	0917.jpg	1251
732	0918.jpg	1252
732	0919.jpg	1253
733	01454.jpg	1254
733	01453.jpg	1255
734	0920.jpg	1256
734	0921.jpg	1257
737	0922.jpg	1258
737	0923.jpg	1259
738	0904.jpg	1260
738	0905.jpg	1261
739	0924.jpg	1262
739	0925.jpg	1263
740	0926.jpg	1264
740	0927.jpg	1265
741	0928.jpg	1266
741	0929.jpg	1267
742	01541.jpg	1268
742	01542.jpg	1269
743	0931.jpg	1270
743	01288.jpg	1271
743	01289.jpg	1272
744	01543.jpg	1273
744	01544.jpg	1274
745	01912.jpg	1275
745	01913.jpg	1276
746	0933.jpg	1277
746	0934.jpg	1278
748	0935.jpg	1279
748	0936.jpg	1280
749	0937.jpg	1281
749	0938.jpg	1282
750	0957.jpg	1283
750	0958.jpg	1284
751	0952.jpg	1285
752	01455.jpg	1286
752	01456.jpg	1287
753	0955.jpg	1288
753	0956.jpg	1289
754	0939.jpg	1290
755	0948.jpg	1291
755	0949.jpg	1292
756	0940.jpg	1293
756	0941.jpg	1294
757	0942.jpg	1295
757	0943.jpg	1296
758	0950.jpg	1297
758	0951.jpg	1298
759	0945.jpg	1299
760	0946.jpg	1300
760	0947.jpg	1301
761	01457.jpg	1302
761	01458.jpg	1303
763	0959.jpg	1304
763	0960.jpg	1305
764	01545.jpg	1306
764	0961.jpg	1307
764	0962.jpg	1308
765	01460.jpg	1309
765	01459.jpg	1310
766	0963.jpg	1311
766	0964.jpg	1312
767	01292.jpg	1313
767	01293.jpg	1314
769	0967.jpg	1315
769	0968.jpg	1316
770	0969.jpg	1317
770	01294.jpg	1318
770	01295.jpg	1319
771	01390.jpg	1320
771	01391.jpg	1321
772	01298.jpg	1322
772	01299.jpg	1323
773	0971.jpg	1324
773	0972.jpg	1325
774	0973.jpg	1326
774	0974.jpg	1327
775	0975.jpg	1328
775	0976.jpg	1329
776	01540.jpg	1330
776	01539.jpg	1331
777	01296.jpg	1332
777	01297.jpg	1333
778	0979.jpg	1334
778	0980.jpg	1335
779	0981.jpg	1336
779	0982.jpg	1337
781	0985.jpg	1338
781	0986.jpg	1339
783	01301.jpg	1340
783	01300.jpg	1341
784	0987.jpg	1342
784	0988.jpg	1343
785	0989.jpg	1344
785	0990.jpg	1345
785	0991.jpg	1346
786	0992.jpg	1347
786	0993.jpg	1348
787	0994.jpg	1349
787	0995.jpg	1350
788	0996.jpg	1351
788	0997.jpg	1352
790	01302.jpg	1353
790	01303.jpg	1354
790	0999.jpg	1355
791	01304.jpg	1356
791	01305.jpg	1357
792	01000.jpg	1358
792	01001.jpg	1359
793	01002.jpg	1360
793	01003.jpg	1361
794	01306.jpg	1362
794	01307.jpg	1363
795	01004.jpg	1364
795	01005.jpg	1365
796	01006.jpg	1366
796	01007.jpg	1367
797	01914.jpg	1368
797	01915.jpg	1369
797	01916.jpg	1370
797	01917.jpg	1371
798	01008.jpg	1372
798	01009.jpg	1373
800	01010.jpg	1374
801	01012.jpg	1375
801	01013.jpg	1376
802	01014.jpg	1377
802	01015.jpg	1378
803	01854.jpg	1379
803	01855.jpg	1380
803	01856.jpg	1381
803	01857.jpg	1382
804	01016.jpg	1383
804	01017.jpg	1384
805	01018.jpg	1385
805	01019.jpg	1386
806	01020.jpg	1387
806	01021.jpg	1388
807	01022.jpg	1389
807	01023.jpg	1390
809	01024.jpg	1391
809	01025.jpg	1392
810	01719.jpg	1393
810	01720.jpg	1394
811	01026.jpg	1395
812	01027.jpg	1396
812	01028.jpg	1397
814	01029.jpg	1398
815	01308.jpg	1399
815	01309.jpg	1400
817	01030.jpg	1401
817	01031.jpg	1402
818	01032.jpg	1403
818	01033.jpg	1404
819	01034.jpg	1405
819	01035.jpg	1406
820	01036.jpg	1407
820	01037.jpg	1408
821	01038.jpg	1409
821	01039.jpg	1410
822	01040.jpg	1411
822	01041.jpg	1412
823	01042.jpg	1413
823	01043.jpg	1414
824	01044.jpg	1415
824	01045.jpg	1416
825	01046.jpg	1417
825	01047.jpg	1418
827	01471.jpg	1419
827	01472.jpg	1420
827	01473.jpg	1421
828	01550.jpg	1422
828	01549.jpg	1423
829	01396.jpg	1424
829	01397.jpg	1425
830	01048.jpg	1426
830	01049.jpg	1427
831	01050.jpg	1428
831	01051.jpg	1429
832	01506.jpg	1430
832	01507.jpg	1431
833	01052.jpg	1432
833	01053.jpg	1433
834	01920.jpg	1434
834	01921.jpg	1435
835	01054.jpg	1436
835	01055.jpg	1437
836	01056.jpg	1438
837	01058.jpg	1439
837	01059.jpg	1440
838	01551.jpg	1441
838	01552.jpg	1442
839	01922.jpg	1443
839	01923.jpg	1444
839	01924.jpg	1445
839	01925.jpg	1446
840	01311.jpg	1447
840	01310.jpg	1448
843	01060.jpg	1449
843	01061.jpg	1450
845	01312.jpg	1451
845	01313.jpg	1452
846	01062.jpg	1453
846	01063.jpg	1454
847	01401.jpg	1455
847	01402.jpg	1456
848	01064.jpg	1457
848	01065.jpg	1458
849	01066.jpg	1459
849	01067.jpg	1460
850	01068.jpg	1461
850	01069.jpg	1462
851	01070.jpg	1463
851	01071.jpg	1464
852	01072.jpg	1465
852	01073.jpg	1466
853	01933.jpg	1467
853	01934.jpg	1468
854	01554.jpg	1469
854	01553.jpg	1470
855	01074.jpg	1471
855	01075.jpg	1472
856	01076.jpg	1473
856	01077.jpg	1474
857	01078.jpg	1475
857	01079.jpg	1476
858	01080.jpg	1477
858	01081.jpg	1478
859	01082.jpg	1479
859	01083.jpg	1480
863	01084.jpg	1481
863	01085.jpg	1482
864	01087.jpg	1483
864	01088.jpg	1484
865	01404.jpg	1485
865	01405.jpg	1486
866	01316.jpg	1487
866	01317.jpg	1488
867	01091.jpg	1489
867	01092.jpg	1490
868	01093.jpg	1491
868	01094.jpg	1492
869	01319.jpg	1493
869	01318.jpg	1494
870	01320.jpg	1495
870	01321.jpg	1496
870	01406.jpg	1497
871	01095.jpg	1498
871	01096.jpg	1499
871	01097.jpg	1500
872	01407.jpg	1501
872	01408.jpg	1502
872	01409.jpg	1503
873	01098.jpg	1504
873	01099.jpg	1505
874	01100.jpg	1506
874	01101.jpg	1507
876	01461.jpg	1508
876	01463.jpg	1509
876	01462.jpg	1510
877	01103.jpg	1511
877	01464.jpg	1512
877	01465.jpg	1513
878	01104.jpg	1514
878	01105.jpg	1515
879	01106.jpg	1516
879	01107.jpg	1517
880	01108.jpg	1518
880	01109.jpg	1519
881	01110.jpg	1520
881	01111.jpg	1521
\.


--
-- Data for Name: plants_rbcl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_rbcl (rbcl_id, plant_id, nucleotide, country, genebank_accesion) FROM stdin;
\.


--
-- Data for Name: plants_regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_regions (plants_id, region_id) FROM stdin;
1	14
2	2
2	5
3	5
4	11
5	15
6	15
7	2
8	2
9	2
10	5
12	5
13	5
14	2
15	5
16	2
17	15
18	5
19	5
20	5
22	2
23	5
24	2
25	15
26	2
27	15
28	15
29	5
30	5
30	3
31	2
32	5
33	5
34	5
35	5
36	5
37	5
38	5
39	5
40	5
41	2
42	15
43	5
43	15
44	5
45	11
46	5
47	2
48	2
49	2
51	2
52	5
53	15
54	5
55	5
56	2
57	2
59	3
60	15
61	5
62	5
63	5
64	6
65	3
66	14
67	5
68	2
69	5
70	5
71	2
72	15
73	15
74	15
76	5
77	5
78	5
79	3
80	5
80	3
80	6
82	2
83	5
84	3
85	5
86	5
87	5
88	2
88	15
89	15
90	3
91	11
92	2
93	2
94	5
95	5
96	5
97	15
98	2
99	5
100	5
101	5
102	5
103	15
104	5
105	5
107	2
108	5
110	5
111	5
112	2
113	5
114	2
114	15
115	5
116	14
117	15
118	15
119	2
119	15
120	5
121	5
122	5
123	2
123	15
126	2
127	5
128	2
129	2
130	5
131	5
132	5
133	5
134	15
135	15
135	2
136	15
137	2
138	2
139	2
140	2
141	2
142	3
142	5
143	15
144	11
145	2
146	11
147	5
148	5
149	5
150	5
151	15
152	15
153	5
154	15
155	2
156	2
157	5
158	15
159	2
159	5
161	5
162	5
163	15
164	15
165	3
165	5
166	5
167	2
168	2
168	15
169	15
170	5
171	2
172	5
173	2
174	15
175	5
176	5
176	3
177	2
178	2
179	3
180	2
180	15
181	2
181	15
182	11
183	5
184	5
185	5
186	5
187	5
188	5
189	5
190	3
191	5
192	14
193	2
194	5
195	5
198	2
198	15
199	5
200	15
201	2
201	5
201	6
202	5
203	3
204	5
204	3
204	6
205	5
206	1
207	5
208	15
209	5
210	5
211	2
212	2
213	14
214	5
215	2
216	2
217	2
218	2
219	2
220	15
221	15
222	5
222	15
222	3
223	5
224	5
225	5
225	2
226	5
229	14
230	5
231	11
231	15
231	2
232	5
233	2
234	2
235	15
236	2
237	5
238	15
239	5
240	2
241	5
242	5
242	15
243	15
244	2
245	5
246	5
247	5
248	3
249	2
250	2
251	2
254	11
255	3
255	5
256	15
257	5
258	5
259	5
260	2
261	5
262	5
263	11
264	5
265	5
267	5
268	5
268	2
268	15
269	5
270	5
271	5
272	5
273	5
274	5
275	1
276	5
277	5
278	5
279	11
280	5
281	11
282	2
283	2
284	5
285	15
286	15
287	5
288	15
289	2
289	15
290	5
290	15
291	5
292	2
293	5
294	2
295	15
296	2
296	11
297	5
298	2
299	2
299	15
300	5
301	5
302	5
303	5
304	2
305	15
306	2
307	5
308	2
308	15
309	2
310	2
311	5
312	5
313	2
314	5
315	5
316	2
317	15
318	2
319	15
320	15
322	2
323	2
323	11
323	15
325	2
326	5
328	5
329	1
330	15
330	2
331	5
332	15
333	5
334	15
335	5
336	2
337	11
338	3
339	1
340	3
341	5
342	5
343	2
344	2
345	15
346	2
347	5
347	15
348	5
349	5
350	15
351	2
352	2
353	5
354	5
355	2
356	15
357	5
358	5
358	15
359	2
360	2
361	15
362	5
363	2
364	2
365	2
366	2
366	15
367	2
368	5
369	5
370	5
371	5
372	5
373	5
374	5
375	3
376	5
377	2
377	15
378	5
379	5
381	3
382	2
383	5
384	5
385	3
386	5
387	5
388	15
389	2
390	2
390	15
391	5
392	5
393	5
394	2
395	5
396	15
397	2
397	15
398	5
399	5
400	5
401	2
402	5
403	5
404	2
405	2
406	2
407	5
408	5
409	2
410	2
411	5
412	5
412	15
413	5
414	5
415	5
417	15
418	15
419	2
420	5
421	5
422	2
423	2
424	2
425	2
426	5
427	5
428	15
429	15
430	15
431	2
431	5
432	5
433	5
434	5
435	3
436	5
440	5
441	5
442	5
443	3
444	2
445	5
446	15
447	2
448	15
449	2
450	5
451	5
452	5
453	2
453	15
454	5
455	5
456	5
458	2
459	5
460	3
461	5
462	5
463	15
464	5
465	2
466	5
467	3
468	5
469	15
470	2
471	5
471	3
471	15
472	15
473	11
474	5
475	5
476	15
477	5
477	2
478	2
479	15
480	5
481	6
483	5
484	3
484	6
485	5
485	3
486	15
487	15
488	5
489	5
490	15
491	5
492	5
493	2
494	2
495	5
496	5
497	15
498	7
499	15
501	2
502	2
503	5
504	2
504	5
505	2
506	2
507	3
508	5
509	5
510	5
511	15
512	2
513	5
514	5
515	5
516	2
517	15
518	2
518	15
518	11
519	2
520	5
521	5
522	2
523	3
524	5
525	5
526	5
527	2
528	15
529	5
530	15
531	6
532	15
533	5
534	5
535	15
537	2
538	2
539	2
540	2
541	15
542	5
543	2
545	5
546	2
547	5
548	5
549	5
550	15
551	2
551	15
552	15
553	5
554	2
555	3
556	15
557	15
558	5
558	15
559	5
561	5
562	2
562	5
563	5
564	2
564	11
565	3
567	6
568	5
569	5
570	5
571	2
572	15
572	5
573	5
574	5
575	5
576	5
577	2
578	2
579	2
580	2
581	2
582	5
583	2
584	2
585	5
586	5
587	5
588	2
589	2
590	15
591	2
592	5
593	11
594	11
595	2
596	2
596	15
597	5
597	15
597	3
598	15
599	15
600	15
601	5
603	15
604	2
605	15
606	15
607	2
608	15
609	15
610	5
611	2
611	15
612	2
613	6
614	5
615	15
616	5
617	5
618	11
619	5
620	15
621	5
622	5
622	3
623	2
625	5
626	3
626	6
627	15
627	2
628	2
629	5
630	2
630	15
631	11
632	5
633	15
634	5
635	3
636	5
637	2
638	5
639	2
640	5
642	2
643	2
644	15
645	11
646	11
647	5
648	5
649	5
650	5
651	5
652	5
653	5
654	2
655	5
656	2
657	5
658	5
659	5
660	2
660	15
661	2
662	11
662	2
663	5
664	2
664	5
664	15
665	11
667	15
668	15
669	5
670	2
670	5
670	15
671	2
671	15
672	2
673	2
674	2
676	5
677	15
678	5
679	15
680	15
681	5
682	5
683	5
684	5
685	15
686	5
687	2
687	13
688	3
689	2
690	2
690	15
691	5
692	5
693	5
694	2
695	2
695	15
696	2
697	2
698	15
699	15
700	2
700	15
701	15
702	2
703	2
704	15
705	15
706	5
707	5
708	11
709	2
710	5
711	2
712	5
713	15
714	5
715	5
716	5
717	5
718	5
719	5
720	2
722	5
723	5
724	5
725	5
726	15
727	2
728	6
729	2
730	5
731	2
732	5
733	15
734	2
734	5
734	15
737	15
738	15
739	5
740	2
741	2
741	15
742	2
743	2
743	15
744	3
745	7
746	3
746	15
747	2
748	5
748	3
749	2
749	5
749	15
750	5
751	5
752	2
753	2
754	2
754	15
755	5
756	2
756	5
756	15
757	3
757	6
758	2
759	2
760	2
761	15
763	2
763	15
764	5
765	15
766	5
767	15
768	15
769	5
770	2
770	15
771	5
772	5
773	2
774	5
775	5
776	5
777	2
778	5
779	5
780	2
781	5
782	2
783	5
784	5
785	5
785	15
786	15
787	5
788	15
789	5
790	2
790	15
791	5
792	5
793	5
794	2
794	11
795	3
796	5
797	5
798	5
799	5
800	2
801	15
802	5
803	15
804	5
805	3
806	5
806	6
807	5
809	5
810	5
811	3
812	5
813	2
814	5
814	15
815	3
816	5
817	5
818	2
819	5
820	5
821	5
822	5
823	2
823	3
823	5
824	5
825	5
825	15
827	2
828	2
829	5
830	15
831	5
832	15
833	5
834	5
835	15
836	5
837	5
839	2
840	5
841	5
842	15
843	5
845	5
846	15
847	5
848	5
849	5
850	2
850	15
851	2
852	2
852	5
853	13
853	2
854	2
855	2
856	5
857	5
857	15
858	5
859	2
860	5
861	5
862	5
863	2
864	2
864	15
865	5
866	5
867	15
868	5
869	5
870	5
871	2
872	5
873	5
874	15
875	2
876	2
877	2
877	5
877	15
878	2
878	15
879	5
879	3
880	5
881	5
882	5
\.


--
-- Data for Name: plants_shrub_climbings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_shrub_climbings (plant_id, shrub_id) FROM stdin;
1	5
1	8
2	5
2	8
3	8
3	3
4	8
4	5
5	5
5	8
6	5
6	8
7	8
7	5
8	8
8	3
9	8
9	3
10	3
11	6
12	6
13	6
14	6
15	8
15	3
16	5
17	5
18	3
19	8
19	7
20	1
21	1
22	1
23	7
24	7
25	3
26	8
26	3
27	8
27	3
28	8
28	3
29	8
29	3
30	8
30	3
30	6
31	8
32	8
32	7
33	7
34	8
34	3
35	5
36	7
37	7
38	3
38	7
39	3
40	8
40	3
41	3
42	3
43	3
44	8
44	3
45	3
46	8
46	3
47	8
47	3
48	5
49	5
51	7
52	7
53	7
54	3
55	8
56	6
57	6
59	6
60	5
61	3
62	3
63	8
64	3
65	8
65	3
66	8
66	3
67	3
68	8
68	3
69	3
70	6
71	6
72	5
73	8
73	3
74	8
74	3
76	8
77	3
78	3
79	8
79	3
80	8
80	3
81	8
81	3
82	8
83	8
83	3
84	8
85	8
85	3
86	8
86	3
87	8
87	3
87	7
88	8
88	3
89	8
89	3
90	8
90	3
91	8
91	3
92	8
92	3
93	8
93	3
94	3
95	8
96	6
96	7
97	8
98	3
99	3
100	8
100	3
101	8
101	3
102	8
102	3
103	7
104	7
105	7
107	8
107	3
108	8
108	3
109	8
109	3
110	3
111	8
111	3
112	8
113	8
114	8
115	8
116	8
116	5
117	6
118	5
119	8
120	8
120	3
121	8
121	3
122	8
123	3
124	8
124	3
126	3
127	8
127	3
128	3
129	3
130	6
131	8
131	3
132	8
132	3
133	6
134	3
135	3
136	3
137	8
137	3
138	6
139	6
140	8
140	3
141	8
141	3
142	7
143	8
144	8
145	8
146	8
147	8
148	8
149	8
150	8
150	3
151	3
152	5
153	3
154	3
155	3
156	3
157	3
158	6
159	6
160	6
161	6
162	6
163	6
164	6
165	6
166	6
167	8
167	3
167	7
168	7
169	8
169	3
169	7
170	8
170	3
171	8
171	7
172	8
173	8
174	6
175	6
176	6
177	6
178	6
179	7
180	8
180	3
181	8
181	3
182	3
183	8
184	3
185	8
186	7
186	8
187	6
188	5
189	8
189	3
190	3
191	8
192	8
192	3
193	3
194	7
195	6
196	6
197	6
198	3
199	7
200	3
201	8
201	3
202	3
203	8
203	3
204	8
204	3
205	8
206	7
207	3
208	8
208	3
209	8
209	3
210	5
211	8
212	5
213	5
214	8
214	3
215	5
215	8
215	3
216	5
216	8
217	8
218	5
218	8
219	8
219	3
220	3
221	3
222	3
223	6
224	6
224	4
225	6
225	4
226	6
228	4
229	4
230	6
230	4
231	6
232	6
233	6
234	1
235	3
236	3
237	3
238	6
238	8
239	6
240	6
241	6
242	6
243	6
244	6
245	6
246	6
247	6
248	5
249	6
250	6
251	6
251	2
252	6
253	6
254	8
254	3
255	8
255	3
256	8
256	3
257	7
258	8
258	3
259	7
259	8
260	7
260	8
260	3
261	8
261	7
262	8
262	3
262	7
263	8
263	3
264	7
265	8
266	6
267	6
268	3
269	8
270	3
271	8
271	3
272	8
272	3
273	3
274	8
274	3
275	3
276	3
277	3
278	3
279	8
279	3
280	3
281	8
281	3
282	6
283	6
284	6
285	8
286	8
286	3
287	8
288	8
288	3
289	8
289	3
290	8
290	3
291	3
292	3
293	8
294	3
295	8
295	3
296	8
296	3
297	8
297	3
298	8
298	3
299	3
300	3
301	3
302	8
302	3
303	3
304	8
304	3
305	5
306	5
307	8
307	3
308	8
308	3
309	3
310	3
311	8
311	3
312	8
312	3
313	8
313	7
314	3
315	8
315	3
316	1
317	1
318	3
319	3
320	3
321	1
322	1
323	3
324	3
325	8
325	3
326	8
328	8
329	8
329	3
330	8
330	3
331	8
331	3
332	8
332	3
333	8
333	3
334	5
335	5
336	3
337	5
337	8
338	8
339	8
339	3
340	8
340	3
341	8
341	3
342	3
343	3
344	3
345	3
346	3
347	8
347	3
348	6
349	8
350	3
351	8
351	3
352	6
353	3
354	3
355	3
356	8
356	3
357	8
357	3
358	4
359	6
360	5
361	5
362	3
363	5
363	8
364	8
365	8
366	8
367	8
368	5
369	6
369	8
370	8
370	3
371	8
372	8
373	8
373	3
374	8
374	3
375	8
376	8
376	3
377	8
377	7
378	8
379	8
380	8
381	8
382	8
382	3
383	8
384	8
384	3
385	8
385	3
386	8
386	3
387	3
388	3
389	3
390	8
390	3
391	3
392	8
392	3
393	8
393	3
394	3
395	8
395	3
396	3
397	8
397	3
398	8
398	3
399	8
399	3
400	8
400	6
401	6
402	1
403	3
404	3
405	5
405	8
406	8
406	5
407	8
408	5
408	8
409	5
410	8
410	7
411	3
412	8
413	8
413	7
414	8
414	3
415	3
416	8
416	3
417	8
417	3
418	8
418	3
419	8
419	3
420	3
421	6
422	8
422	6
423	7
424	6
425	6
426	8
426	3
427	8
427	3
428	6
429	6
430	8
430	6
431	8
431	6
432	8
432	6
433	6
434	6
434	7
435	8
435	5
436	8
438	5
440	6
441	6
442	6
443	6
444	6
445	8
446	3
447	3
448	6
449	6
450	8
450	3
451	8
451	3
452	6
453	6
454	8
454	6
455	6
456	6
458	3
459	8
459	3
460	8
460	3
461	3
462	8
463	5
463	8
464	5
464	8
465	8
465	3
466	8
466	3
467	8
467	3
468	3
469	8
470	8
470	3
471	3
472	8
472	3
473	8
473	3
474	3
475	8
476	3
477	8
477	3
478	6
479	3
480	8
480	3
481	8
481	3
483	8
484	8
484	3
485	8
485	3
486	3
487	3
488	3
489	3
490	3
491	3
492	8
492	3
493	3
494	6
495	6
496	6
497	6
498	6
499	8
499	3
501	8
501	3
502	8
503	8
503	3
504	8
504	3
505	5
505	8
506	3
507	3
508	8
509	3
510	3
511	3
512	3
513	3
514	8
514	3
515	6
516	6
517	6
518	6
519	6
520	6
521	6
522	6
523	6
524	6
525	8
525	6
526	8
527	6
528	7
529	8
529	3
530	3
531	3
532	3
533	8
534	8
534	3
535	8
535	6
537	3
538	8
538	3
539	8
539	3
540	3
541	5
542	8
543	8
543	3
545	8
545	3
546	8
546	3
547	8
547	3
548	8
548	3
549	3
550	3
551	8
551	3
552	3
553	8
553	3
554	8
554	3
555	6
556	6
557	8
557	3
558	8
558	3
559	1
560	1
561	8
561	3
562	7
562	8
563	8
564	6
565	6
566	1
567	8
567	3
568	8
569	8
569	3
570	8
571	8
571	3
572	8
572	3
573	8
574	8
574	3
575	8
575	3
576	3
577	8
577	3
578	6
579	6
580	6
581	6
582	8
582	7
583	8
583	3
584	8
584	3
585	8
586	8
587	8
587	3
588	8
588	3
589	5
589	8
590	8
590	5
591	8
591	3
592	7
592	8
593	6
594	8
594	5
595	8
595	5
596	6
597	8
597	5
598	6
599	3
600	1
601	8
601	3
603	8
604	5
604	8
605	6
606	5
607	8
607	3
608	8
608	3
609	3
610	3
611	3
612	3
613	8
614	8
615	3
616	8
616	3
617	8
617	3
618	3
619	3
620	3
621	8
621	3
622	8
622	3
622	6
623	3
625	8
626	8
627	3
628	3
629	8
629	3
630	8
630	3
631	8
632	8
633	8
634	8
635	8
636	8
637	8
637	3
638	8
639	8
640	8
640	3
642	8
642	3
643	8
643	3
644	8
645	8
645	3
646	8
646	3
647	8
648	8
649	8
650	8
651	8
652	8
652	3
653	8
654	5
655	8
655	3
656	5
656	8
657	6
658	6
659	3
660	3
661	8
661	3
662	8
662	3
663	8
663	3
664	3
665	8
665	3
667	8
667	3
668	7
669	3
670	6
671	8
671	6
672	8
672	3
673	8
673	3
674	8
674	3
675	8
675	3
676	6
677	5
678	8
678	3
679	8
679	3
680	8
680	3
681	8
681	3
682	8
682	3
683	8
684	8
684	3
685	8
685	3
686	8
687	8
688	8
688	3
689	8
689	3
690	8
690	3
691	8
692	8
692	7
692	6
693	8
694	7
695	6
696	8
697	8
698	8
699	8
700	5
701	5
702	8
703	8
704	8
704	7
705	8
706	8
707	8
707	3
708	8
708	3
709	8
709	3
710	8
711	8
711	3
712	7
713	7
714	8
715	8
716	8
716	7
717	8
717	7
718	8
719	3
719	8
720	5
721	5
722	3
723	5
724	8
725	8
726	3
727	7
727	3
728	3
729	8
729	3
730	8
731	3
732	3
733	8
733	3
734	8
734	3
735	6
737	8
738	3
739	8
739	3
740	6
741	8
742	8
743	8
744	8
744	3
745	8
745	5
746	8
747	8
747	7
748	8
749	8
750	8
750	6
751	8
752	8
753	5
753	8
754	8
754	3
755	8
756	5
757	8
758	8
759	8
760	6
761	8
762	8
763	8
763	7
764	3
765	5
765	8
766	8
766	3
766	7
767	7
768	6
769	8
769	3
770	3
771	3
772	8
772	7
773	8
773	3
774	8
774	3
775	8
775	3
776	3
777	3
778	8
778	7
779	8
779	3
780	8
780	3
781	8
781	3
782	3
783	8
783	6
784	6
784	8
785	3
786	3
787	8
787	3
788	3
789	3
790	3
791	3
792	8
792	3
793	3
794	3
795	8
795	3
796	5
797	5
797	8
798	3
799	8
799	3
800	8
800	3
801	8
801	3
802	8
802	3
803	8
804	3
805	8
806	3
807	8
809	8
809	3
810	8
810	3
811	8
811	3
812	8
812	3
813	5
814	7
815	7
816	7
817	6
817	7
818	8
818	3
819	8
819	3
820	8
821	8
821	3
822	8
822	3
823	3
824	7
825	3
827	8
828	8
829	8
829	3
830	8
830	3
831	8
831	3
832	8
832	3
833	8
833	3
834	6
835	6
836	8
836	3
836	7
837	8
837	7
838	7
838	3
839	8
839	3
840	8
840	3
842	8
842	3
843	8
843	3
844	8
844	3
845	8
846	8
846	3
847	8
848	8
848	3
849	8
849	3
850	3
851	8
851	3
852	8
852	3
853	5
854	1
855	1
856	8
856	3
857	3
858	8
858	3
859	3
860	8
860	3
861	8
861	3
862	8
862	6
863	8
863	6
864	3
865	8
866	5
866	8
867	8
867	3
868	8
868	3
869	3
870	3
871	3
872	3
873	8
873	3
874	3
875	6
876	6
877	6
878	3
878	8
878	6
879	8
879	3
880	8
880	3
881	8
881	3
882	8
882	3
\.


--
-- Data for Name: plants_spines_thorns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_spines_thorns (plant_id, thorn_id) FROM stdin;
1	3
2	3
3	3
4	3
5	1
6	1
7	3
8	3
9	3
10	3
11	3
12	3
13	3
14	3
15	3
16	3
17	3
18	3
19	3
20	3
21	3
22	3
23	3
24	3
25	3
26	3
27	3
28	3
29	3
30	3
31	1
32	3
33	3
34	3
35	3
36	3
37	3
38	3
39	3
40	3
41	3
42	1
43	3
44	3
45	3
46	3
47	3
48	3
49	3
50	2
51	3
52	3
53	3
54	3
55	1
56	3
57	1
58	2
59	1
59	3
60	3
61	3
62	3
63	1
64	1
65	1
66	1
67	1
68	3
69	3
70	3
71	3
72	1
73	3
74	3
75	2
76	3
77	3
78	3
79	3
80	3
81	3
82	3
83	3
84	3
85	3
86	3
87	3
88	3
89	3
90	3
91	3
92	3
93	3
94	3
95	3
96	1
97	1
98	3
99	3
100	3
101	3
102	3
103	3
104	3
105	3
106	2
107	3
108	3
109	3
110	3
111	1
112	1
113	1
114	1
115	1
116	3
117	3
118	1
119	1
120	1
121	3
122	3
123	3
124	3
125	2
126	3
127	3
128	3
129	3
130	3
131	1
132	1
132	3
133	3
134	3
135	3
136	3
137	1
138	3
139	3
140	3
141	1
142	3
143	3
144	3
145	3
146	3
147	3
148	3
149	3
150	3
151	3
152	3
153	3
154	3
155	3
156	3
157	3
158	3
159	3
160	3
161	3
162	3
163	3
164	3
165	3
166	3
167	3
168	3
169	3
170	3
171	1
172	3
173	3
174	3
175	3
176	3
177	3
178	3
179	3
180	3
181	3
182	3
183	3
184	3
185	3
186	3
187	3
188	3
189	1
190	1
191	3
192	3
193	3
194	3
195	3
196	3
197	3
198	3
199	3
200	3
201	3
202	3
203	3
204	3
205	3
206	3
207	3
208	3
209	3
210	3
211	3
212	1
212	3
213	1
214	3
215	3
216	3
217	3
218	3
219	3
220	3
221	3
222	3
223	3
224	1
225	3
226	3
227	2
228	3
229	3
230	3
231	3
232	3
233	3
234	3
235	3
236	3
237	3
238	3
239	3
240	3
241	3
242	3
243	3
244	3
245	3
246	3
247	3
248	3
249	3
250	3
251	3
252	3
253	3
254	3
255	3
256	3
257	3
258	3
259	3
260	3
261	3
262	3
263	3
264	3
265	1
265	3
266	3
267	3
268	3
269	3
270	3
271	3
272	3
273	3
274	3
275	3
276	3
277	3
278	3
279	3
280	3
281	3
282	3
283	3
284	3
285	3
286	3
287	3
288	1
289	1
290	1
291	1
292	3
293	3
294	3
295	3
296	3
297	3
298	3
299	3
300	3
301	3
302	3
303	3
304	3
305	1
306	1
307	3
308	3
309	3
310	3
311	3
312	3
313	3
314	1
315	1
316	3
317	3
318	3
319	3
320	3
321	3
322	3
323	3
324	1
325	1
326	3
327	2
328	3
329	3
330	3
331	3
332	3
333	3
334	3
335	3
336	1
337	3
338	3
339	3
340	3
341	3
342	3
343	3
344	3
345	3
346	3
347	1
348	3
349	3
350	3
351	3
352	3
353	3
354	3
355	3
356	3
357	3
358	3
359	3
360	3
361	3
362	3
363	3
364	3
365	3
366	3
367	3
368	3
369	3
370	3
371	3
372	3
373	3
374	3
375	3
376	3
377	3
378	3
379	3
380	3
381	3
382	3
383	3
384	3
385	3
386	3
387	3
388	3
389	3
390	3
391	3
392	3
393	3
394	3
395	1
396	3
397	3
398	3
399	3
400	3
401	3
402	3
403	3
404	3
405	3
406	3
407	3
408	3
409	3
410	3
411	3
412	3
413	3
414	3
415	3
416	3
417	3
418	3
419	3
420	3
421	3
422	3
423	3
424	3
425	3
426	3
427	3
428	3
429	3
430	3
431	3
432	3
433	3
434	3
435	3
436	3
437	2
438	3
439	2
440	3
441	3
442	3
443	3
444	3
445	3
446	3
447	3
448	3
449	3
450	3
451	3
452	2
453	3
454	3
455	3
456	3
457	2
458	3
459	3
460	3
461	3
462	1
463	3
464	3
465	3
466	3
467	1
468	3
469	3
470	3
471	3
472	3
473	3
474	3
475	3
476	2
477	3
478	3
479	1
479	3
480	3
481	3
482	2
483	3
484	3
485	3
486	3
487	3
488	3
489	3
490	3
491	3
492	3
493	1
493	3
494	3
495	3
496	3
497	3
498	3
499	1
500	2
501	1
502	1
503	1
504	3
505	3
506	3
507	3
508	3
509	3
510	3
511	3
512	3
513	3
514	3
515	3
516	3
517	3
518	3
519	3
520	3
521	3
522	3
523	3
524	3
525	3
526	3
527	3
528	3
529	3
530	3
531	3
532	3
533	3
534	3
535	3
536	2
537	3
538	3
539	3
540	3
541	3
542	3
543	3
544	2
545	3
546	3
547	3
548	3
549	3
550	3
551	3
552	3
553	3
554	3
555	3
556	3
557	1
558	1
559	3
560	3
561	3
562	3
563	2
564	3
565	3
566	3
567	3
568	3
569	3
570	3
571	3
572	3
573	3
574	3
575	3
576	1
577	3
578	3
579	3
580	3
581	3
582	3
583	3
584	3
585	3
586	3
587	3
588	3
589	3
590	3
591	3
592	3
593	3
594	3
595	3
596	3
597	3
598	3
599	3
600	3
601	1
601	3
603	3
604	3
605	3
606	3
607	3
608	3
609	3
610	3
611	3
612	3
613	3
614	3
615	3
616	3
617	3
618	3
619	3
620	3
621	3
622	3
623	3
624	2
625	3
626	3
627	3
628	3
629	3
630	3
631	3
632	3
633	3
634	3
635	3
636	3
637	3
638	3
639	3
640	3
641	2
642	3
643	3
644	3
645	3
646	3
647	3
648	3
649	3
650	3
651	3
652	3
653	3
654	3
655	3
656	1
657	3
658	3
659	3
660	3
661	3
662	3
663	3
664	3
665	3
667	3
667	1
668	3
669	3
670	3
671	3
672	3
673	3
674	3
675	3
676	3
677	3
678	3
679	3
680	3
681	3
682	3
683	3
683	1
684	3
685	3
686	3
687	3
688	3
689	3
690	3
691	3
692	3
693	3
694	3
695	3
696	1
697	1
698	1
699	1
700	1
701	1
702	1
703	1
704	3
705	1
706	1
707	3
708	3
709	3
710	1
711	3
712	3
713	3
714	3
715	3
716	3
717	3
718	3
719	3
720	3
721	3
722	3
723	3
724	3
725	3
726	3
727	3
728	2
729	3
730	3
731	3
732	3
733	3
734	1
735	2
736	2
737	3
738	3
739	3
740	1
741	1
742	1
743	1
744	1
745	1
746	1
747	1
748	3
749	3
749	1
750	2
751	2
752	3
753	1
754	3
755	1
756	3
757	1
758	1
759	3
760	3
761	1
762	1
763	3
764	3
765	3
766	3
767	3
768	3
769	3
770	3
771	3
772	3
773	3
774	3
775	3
776	3
777	3
778	3
779	1
780	3
781	3
782	3
783	3
784	3
785	3
786	3
787	3
788	3
789	3
790	3
791	3
792	3
793	3
794	3
795	3
796	3
797	3
798	3
799	3
800	3
801	3
802	3
803	3
804	3
805	3
806	3
807	3
808	2
809	3
810	3
811	3
812	3
813	3
814	3
815	3
816	3
817	1
818	3
819	3
820	3
821	3
822	3
823	3
824	3
825	3
826	2
827	3
828	3
829	3
830	3
831	3
832	3
833	3
834	3
835	3
836	3
837	3
838	3
839	3
840	3
841	2
842	3
843	3
844	3
845	3
846	3
847	3
848	3
849	3
850	3
851	3
852	3
853	3
854	3
855	3
856	3
857	3
858	3
859	3
860	3
861	3
862	3
863	3
864	3
865	3
866	3
867	1
868	1
869	3
870	3
871	3
872	3
873	1
874	1
875	3
876	3
877	3
878	1
879	1
880	1
881	1
882	1
\.


--
-- Data for Name: plants_ukwf_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_ukwf_areas (plant_id, ukwf_area_id) FROM stdin;
1	5
2	5
3	5
4	5
5	5
6	5
7	5
8	5
9	5
10	5
11	5
12	5
13	5
14	5
15	5
16	21
16	11
17	16
17	18
17	9
17	21
17	11
18	5
19	5
20	7
20	16
20	8
20	6
21	5
22	23
22	7
22	16
22	9
22	1
22	4
22	11
22	8
22	19
23	5
24	5
25	5
26	5
27	5
28	5
29	5
30	5
31	5
32	5
33	5
34	5
35	5
36	5
37	5
38	5
39	5
40	5
41	5
42	5
43	5
44	5
45	5
46	5
47	5
48	20
48	7
48	16
48	18
48	17
49	20
49	23
49	7
49	18
50	5
51	5
52	5
53	5
54	5
55	20
55	12
55	23
55	7
55	17
55	2
55	1
55	11
55	8
55	6
55	19
56	15
56	7
56	17
56	4
56	8
56	6
57	23
57	7
57	16
57	21
57	2
57	1
57	4
57	8
57	6
57	19
58	5
59	13
59	7
59	1
59	8
59	6
59	19
60	20
60	12
60	15
60	23
60	7
60	17
60	9
61	5
62	5
63	5
64	5
65	5
66	5
67	5
68	5
69	5
70	14
70	8
71	5
72	20
72	12
72	15
72	23
72	7
72	16
72	17
72	9
72	21
72	2
72	1
72	4
72	8
73	5
74	5
75	5
76	5
77	5
78	5
79	5
80	5
81	5
82	20
82	15
82	23
82	7
82	16
82	18
82	17
82	9
82	21
82	2
82	19
83	5
84	5
85	5
86	5
87	5
88	5
89	5
90	5
91	5
92	5
93	5
94	5
95	5
96	5
97	5
98	5
99	5
100	5
101	5
102	5
103	5
104	5
105	5
106	5
107	5
108	5
109	5
110	5
111	5
112	5
113	5
114	5
115	5
116	14
116	4
116	11
117	7
117	9
117	21
117	14
117	3
117	11
117	8
117	6
117	19
118	20
118	12
118	15
118	23
118	7
118	16
118	19
119	5
120	5
121	5
122	5
123	5
124	5
125	5
126	5
127	5
128	5
129	5
130	5
131	5
132	5
133	16
133	17
133	9
133	11
134	5
135	5
136	5
137	5
138	14
138	4
139	20
139	15
139	7
139	16
139	17
139	9
139	21
139	2
139	1
139	4
139	11
139	8
139	6
139	19
140	5
141	5
142	5
143	5
144	5
145	5
146	5
147	5
148	5
149	5
150	5
151	5
152	5
153	5
154	5
155	5
156	5
157	5
158	20
158	7
158	17
158	9
158	21
158	2
158	19
159	20
159	16
159	23
159	13
159	7
159	21
159	2
159	14
159	1
159	11
159	8
159	6
160	4
160	19
161	5
162	5
163	5
164	5
165	5
166	5
167	5
168	5
169	5
170	5
171	5
172	5
173	5
174	9
175	23
175	9
175	21
175	14
175	3
175	4
175	6
175	19
176	8
176	19
177	7
178	7
178	1
178	4
178	8
178	6
179	5
180	5
181	5
182	5
183	5
184	5
185	5
186	5
187	5
188	20
188	12
188	23
188	7
188	18
188	17
188	9
188	21
188	2
188	14
188	1
188	3
188	4
188	11
188	8
188	6
188	19
189	5
190	5
191	5
192	5
193	5
194	5
195	5
196	1
196	4
196	8
197	5
198	5
199	5
200	5
201	5
202	5
203	5
204	5
205	5
206	5
207	5
208	5
209	5
210	5
211	5
212	9
212	14
212	1
212	3
212	4
212	11
212	8
212	19
213	14
213	8
214	5
215	5
216	5
217	5
218	5
219	5
220	5
221	5
222	5
223	5
224	13
224	7
224	2
224	14
224	1
224	8
224	6
224	19
225	14
225	3
225	11
225	8
225	19
226	21
226	14
226	3
226	19
227	5
228	5
229	14
229	3
229	4
229	11
229	8
229	19
230	5
231	23
231	18
231	17
231	9
232	23
233	20
233	12
233	15
233	23
233	13
233	7
233	16
233	17
233	9
233	21
233	2
233	1
233	4
233	11
233	8
233	6
233	19
234	5
235	5
236	5
237	5
238	20
238	12
238	23
238	7
238	17
238	21
238	2
238	1
238	4
238	6
239	5
240	20
240	12
240	23
240	7
241	5
242	12
242	9
242	21
242	11
242	8
243	12
243	23
243	7
243	17
243	2
243	11
243	8
243	6
244	20
244	12
244	15
244	23
244	7
244	16
244	18
244	17
244	9
244	21
244	2
244	1
244	4
244	11
244	8
244	6
244	19
245	5
246	3
246	4
246	19
247	5
248	8
248	19
249	5
250	7
250	16
250	8
250	6
250	19
251	15
251	17
251	9
251	21
251	2
251	14
251	1
251	4
251	8
251	6
251	19
252	4
252	8
252	6
252	10
253	14
253	3
253	8
253	19
254	5
255	5
256	5
257	5
258	5
259	5
260	5
261	5
262	5
263	5
264	5
265	5
266	20
266	12
266	15
266	23
266	17
266	3
266	8
266	6
267	5
268	5
269	5
270	5
271	5
272	5
273	5
274	5
275	5
276	5
277	5
278	5
279	5
280	5
281	5
282	7
282	9
282	11
282	8
282	6
283	7
283	16
283	18
284	5
285	5
286	5
287	5
288	5
289	5
290	5
291	5
292	5
293	5
294	5
295	5
296	5
297	5
298	5
299	5
300	5
301	5
302	5
303	5
304	5
305	20
305	12
305	15
305	23
305	7
306	20
306	23
306	7
306	16
306	18
307	5
308	5
309	5
310	5
311	5
312	5
313	5
314	5
315	5
316	2
316	1
316	3
316	8
317	20
317	12
317	15
317	23
317	13
317	7
317	16
317	18
317	9
317	21
317	2
317	1
317	4
317	8
317	6
318	5
319	5
320	5
321	20
321	23
321	7
321	16
321	17
321	2
321	1
321	4
321	11
321	8
321	6
321	19
322	5
323	5
324	5
325	5
326	5
327	5
328	5
329	5
330	5
331	5
332	5
333	5
334	20
334	12
334	13
334	7
334	16
334	17
334	21
335	12
335	2
335	1
335	8
335	19
336	5
337	5
338	5
339	5
340	5
341	5
342	5
343	5
344	5
345	5
346	5
347	5
348	5
349	5
350	5
351	5
352	20
352	12
352	15
352	23
352	7
352	17
352	1
352	8
352	6
353	5
354	5
355	5
356	5
357	5
358	9
358	11
359	5
360	20
360	7
360	16
360	9
360	1
360	8
360	19
361	20
361	12
361	15
361	23
361	17
361	9
361	21
361	2
361	14
361	1
361	3
361	11
361	8
361	6
362	5
363	7
363	9
363	2
363	1
363	3
363	8
363	6
363	19
364	5
365	15
365	23
365	7
365	16
365	17
365	2
366	20
366	15
366	23
366	7
366	17
366	9
366	21
366	2
366	1
366	4
366	6
367	13
367	7
367	21
367	2
367	14
367	1
367	4
367	11
367	8
367	6
367	19
368	5
369	5
370	5
371	5
372	5
373	5
374	5
375	5
376	5
377	5
378	5
379	5
380	5
381	5
382	5
383	5
384	5
385	5
386	5
387	5
388	5
389	5
390	5
391	5
392	5
393	5
394	5
395	5
396	5
397	5
398	5
399	5
400	5
401	5
402	3
402	8
403	5
404	5
405	5
406	20
406	12
406	15
406	23
406	13
406	7
406	16
406	17
406	9
406	21
406	2
406	14
406	1
406	4
406	11
406	8
406	6
406	19
407	14
407	11
407	8
407	19
408	20
408	12
408	15
408	23
408	13
408	7
408	16
408	18
408	17
408	9
408	2
408	14
408	1
408	3
408	4
408	11
408	8
408	6
408	19
409	23
409	16
409	9
409	21
409	2
409	11
410	5
411	5
412	5
413	5
414	5
415	5
416	5
417	5
418	5
419	5
420	5
421	5
422	5
423	5
424	20
424	12
424	15
424	23
424	18
424	16
424	7
424	17
424	9
424	21
424	4
424	11
424	6
424	19
425	20
425	12
425	15
425	23
425	13
425	7
425	16
425	17
425	9
425	21
425	2
425	11
425	8
425	6
425	19
426	5
427	5
428	5
429	5
430	5
431	5
432	5
433	5
434	5
435	5
436	5
437	5
438	20
438	12
438	15
438	17
438	9
438	21
438	2
438	14
438	1
438	3
438	8
438	6
438	19
439	5
440	2
440	1
440	3
440	4
440	8
440	6
440	19
441	5
442	2
442	14
442	1
442	4
442	8
442	6
442	19
443	5
444	5
445	5
446	5
447	5
448	20
448	12
448	15
448	23
448	7
448	18
448	17
448	9
448	21
448	2
448	1
448	3
448	11
448	6
448	19
449	9
449	21
449	2
449	8
449	19
450	5
451	5
452	5
453	5
454	5
455	5
456	5
457	5
458	5
459	5
460	5
461	5
462	5
463	5
464	5
465	5
466	5
467	5
468	5
469	5
470	5
471	5
472	5
473	5
474	5
475	5
476	5
477	5
478	9
478	21
478	14
478	3
478	8
479	5
480	5
481	5
482	5
483	5
484	5
485	5
486	5
487	5
488	5
489	5
490	5
491	5
492	5
493	5
494	5
495	3
496	5
497	5
498	5
499	5
500	5
501	5
502	5
503	5
504	5
505	14
505	1
505	3
505	4
505	11
505	8
505	19
506	5
507	5
508	5
509	5
510	5
511	5
512	5
513	5
514	5
515	3
515	8
515	19
516	7
516	16
516	6
517	9
518	20
518	12
518	15
518	23
518	13
518	7
518	17
518	9
518	21
518	2
518	1
518	8
518	6
518	19
519	20
519	12
519	15
519	23
519	7
519	16
519	18
519	2
519	1
519	6
519	19
520	5
521	5
522	7
522	8
522	6
523	14
523	1
523	3
523	8
523	19
524	8
525	5
526	5
527	5
528	5
529	5
530	5
531	5
532	5
533	5
534	5
535	5
536	5
537	5
538	5
539	5
540	5
541	15
541	23
541	7
541	17
541	9
541	21
541	14
541	1
541	6
542	5
543	5
544	5
545	5
546	5
547	5
548	5
549	5
550	5
551	5
552	5
553	5
554	5
555	5
556	5
557	5
558	5
559	5
560	2
560	14
560	3
560	8
560	19
561	5
562	5
563	5
564	20
564	23
564	7
564	16
564	4
564	6
564	19
565	8
566	5
567	5
568	5
569	5
570	5
571	5
572	5
573	5
574	5
575	5
576	5
577	5
578	5
579	5
580	5
581	21
581	1
581	8
581	6
582	5
583	5
584	5
585	5
586	5
587	5
588	5
589	20
589	12
589	15
589	23
589	13
589	7
589	16
589	18
589	17
589	2
589	14
589	1
589	3
589	4
589	8
589	6
589	19
590	5
591	5
592	5
593	23
593	7
593	9
593	21
593	2
593	14
593	1
593	3
593	11
593	8
593	6
593	19
594	20
594	12
594	15
594	23
594	13
594	7
594	16
594	18
594	17
594	9
594	21
594	2
594	14
594	1
594	4
594	11
594	8
594	6
594	19
595	15
595	23
595	13
595	7
595	16
595	18
595	17
595	2
595	1
595	8
595	6
595	19
596	12
596	15
596	13
596	7
596	16
596	17
596	9
596	21
596	2
596	1
596	8
596	6
596	19
597	12
597	7
597	17
597	21
597	2
597	14
597	1
597	3
597	4
597	8
597	6
597	19
598	5
599	5
600	20
600	12
600	15
600	23
600	7
600	16
600	17
600	9
600	21
600	2
600	14
600	1
600	4
600	8
600	6
601	5
603	15
603	7
603	1
603	17
603	9
603	8
603	6
604	5
605	5
606	5
607	5
608	5
609	5
610	5
611	5
612	5
613	12
613	23
613	13
613	7
613	21
613	2
613	14
613	1
613	4
613	11
613	8
613	6
613	19
614	5
615	5
616	5
617	5
618	5
619	5
620	5
621	5
622	5
623	5
624	5
625	5
626	5
627	5
628	5
629	5
630	5
631	5
632	5
633	5
634	5
635	5
636	5
637	5
638	5
639	5
640	5
641	5
642	5
643	5
644	5
645	5
646	5
647	5
648	5
649	5
650	5
651	5
652	5
653	5
654	7
654	9
654	21
654	2
654	14
654	1
654	3
654	11
654	8
654	6
654	19
655	5
656	5
657	5
658	5
659	5
660	5
661	5
662	5
663	5
664	5
665	5
667	5
668	5
669	5
670	5
671	5
672	5
673	5
674	5
675	5
676	5
677	5
678	5
679	5
680	5
681	5
682	5
683	5
684	5
685	5
686	5
687	5
688	5
689	5
690	5
691	5
692	5
693	5
694	5
695	20
695	15
695	23
695	13
695	7
695	17
695	21
695	2
695	1
695	8
695	6
695	19
696	5
697	5
698	5
699	5
700	18
700	17
700	9
700	6
700	19
701	7
701	8
701	6
701	9
702	5
703	5
704	5
705	5
706	5
707	5
708	5
709	5
710	5
711	5
712	5
713	5
714	5
715	5
716	5
717	5
718	5
719	5
720	20
720	23
720	7
720	16
721	2
721	14
721	1
721	3
721	19
722	5
723	20
723	15
723	23
723	7
723	17
723	9
723	2
723	1
723	4
723	11
723	8
723	6
724	5
725	5
726	5
727	5
728	5
729	5
730	5
731	5
732	5
733	5
734	5
735	5
736	5
737	5
738	5
739	5
740	5
741	5
742	20
742	12
742	15
742	23
742	7
742	16
742	17
742	9
742	21
742	2
742	8
742	19
743	5
744	5
745	14
745	19
746	21
746	2
746	6
746	19
747	5
748	5
749	5
750	5
751	5
752	5
753	5
754	5
755	5
756	20
756	15
756	23
756	7
756	16
756	17
756	9
756	21
756	2
756	14
756	1
756	4
756	11
756	8
756	6
756	19
757	5
758	5
759	5
760	5
761	20
761	12
761	15
761	23
761	7
761	16
762	5
763	5
764	5
765	5
766	5
767	5
768	5
769	5
770	5
771	5
772	5
773	5
774	5
775	5
776	5
777	5
778	5
779	5
780	5
781	5
782	5
783	5
784	5
785	5
786	5
787	5
788	5
789	5
790	5
791	5
792	5
793	5
794	5
795	5
796	5
797	9
797	21
797	2
797	14
797	3
797	4
797	11
797	8
797	19
798	5
799	5
800	5
801	5
802	5
803	20
803	15
803	23
803	13
803	7
803	17
803	2
803	4
803	8
803	6
803	19
804	5
805	5
806	5
807	5
808	5
809	5
810	5
811	5
812	5
813	7
813	21
813	8
813	6
813	19
814	5
815	5
816	5
817	5
818	5
819	5
820	5
821	5
822	5
823	5
824	5
825	5
826	5
827	5
828	5
829	5
830	5
831	5
832	5
833	5
834	7
834	21
834	2
834	19
835	5
836	5
837	5
838	5
839	5
840	5
841	5
842	5
843	5
844	5
845	5
846	5
847	5
848	5
849	5
850	5
851	5
852	5
853	20
853	12
853	15
853	13
853	7
853	16
853	23
853	17
853	2
853	14
853	4
853	3
853	11
853	8
853	6
853	19
854	15
854	23
854	7
854	16
854	2
854	4
854	6
855	20
855	12
855	15
855	23
855	13
855	7
855	16
855	17
855	2
855	22
855	4
855	8
855	6
856	5
857	5
858	5
859	5
860	5
861	5
862	5
863	5
864	5
865	5
866	5
867	5
868	5
869	5
870	5
871	5
872	5
873	5
874	5
875	18
876	20
876	12
876	23
876	15
876	13
876	7
876	17
876	21
876	2
876	4
877	20
877	12
877	15
877	23
877	13
877	7
877	16
877	18
877	17
877	9
877	21
877	2
877	1
877	11
877	8
877	6
877	19
878	5
879	5
880	5
881	5
882	5
\.


--
-- Data for Name: plants_woody_herbaceous; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plants_woody_herbaceous (plant_id, back_id) FROM stdin;
1	3
2	3
3	3
4	1
4	3
5	3
6	3
7	3
7	1
8	3
9	3
10	3
11	3
12	3
13	3
14	3
15	3
16	1
17	1
18	3
19	3
20	3
21	3
22	3
23	3
24	3
25	3
26	3
27	3
28	3
29	3
30	3
31	1
32	3
33	3
34	3
35	1
36	3
37	3
38	3
39	3
40	3
41	3
42	3
43	3
44	3
45	3
46	3
47	3
48	1
49	1
50	2
51	3
52	3
53	3
54	3
55	3
56	1
57	1
58	2
59	1
60	1
61	3
62	3
63	3
64	3
65	3
66	3
67	3
68	3
69	3
70	1
71	3
72	1
73	3
74	3
75	2
76	3
77	3
78	3
79	3
80	3
81	3
82	1
82	3
83	3
84	3
85	3
86	3
87	3
88	3
89	3
90	3
91	3
92	3
93	3
94	3
95	3
96	3
97	3
98	3
99	3
100	3
101	3
102	3
103	3
104	3
105	3
106	2
107	3
108	3
109	3
110	3
111	3
112	3
113	3
114	3
115	3
116	1
117	1
118	1
119	3
120	3
121	3
122	3
123	3
124	3
125	2
126	3
127	3
128	3
129	3
130	3
131	3
132	3
133	1
134	3
135	3
136	3
137	3
138	1
139	1
140	3
141	3
142	3
143	3
144	3
145	3
146	3
147	3
148	3
149	3
150	3
151	3
152	1
153	3
154	3
155	3
156	3
157	3
158	3
158	1
159	1
160	1
161	3
162	3
163	3
164	1
165	1
166	3
167	3
168	3
169	3
170	3
171	3
172	3
173	3
174	1
175	1
176	1
177	1
178	1
179	3
180	3
181	3
182	3
183	3
184	3
185	3
186	3
187	3
188	1
189	3
190	3
191	3
192	3
193	3
194	3
195	1
196	1
197	1
198	3
199	3
200	3
201	3
202	3
203	3
204	3
205	3
206	3
207	3
208	3
209	3
210	1
211	3
212	1
213	1
214	3
215	3
216	3
217	3
218	3
219	3
220	3
221	3
222	3
223	1
224	1
225	1
226	1
227	2
228	1
229	1
230	1
231	1
232	1
233	1
234	1
235	3
236	3
237	3
238	1
239	1
240	1
241	1
242	1
243	1
244	1
245	1
246	1
247	1
248	1
249	1
250	1
251	1
252	1
253	1
254	3
255	3
256	3
257	3
258	3
259	3
260	3
261	3
262	3
263	3
264	3
265	3
266	1
267	1
268	3
269	3
270	3
271	3
272	3
273	3
274	3
275	3
276	3
277	3
278	3
279	2
280	3
281	3
282	1
283	1
284	1
285	3
286	3
287	3
288	3
289	3
290	3
291	3
292	3
293	3
294	3
295	3
296	3
297	3
298	3
299	3
300	3
301	3
302	3
303	3
304	3
305	1
306	1
307	3
308	3
309	3
310	3
311	3
312	3
313	3
314	3
315	3
316	3
317	3
318	3
319	3
320	3
321	3
322	3
323	3
324	3
325	3
326	3
327	2
328	3
329	3
330	3
331	3
332	3
333	3
334	1
335	1
336	3
337	3
338	3
339	3
340	3
341	3
342	3
343	3
344	3
345	3
346	3
347	3
348	1
349	3
350	3
351	3
352	1
353	3
354	3
355	3
356	3
357	3
358	3
359	1
359	3
360	1
361	1
362	3
363	3
363	1
364	3
364	1
365	1
366	1
367	1
368	1
369	3
370	3
371	3
372	3
373	3
374	3
375	3
376	3
377	3
378	3
379	3
380	3
381	3
382	3
383	3
384	3
385	3
386	3
387	3
388	3
389	3
390	3
391	3
392	3
393	3
394	3
395	3
396	3
397	3
398	3
399	3
400	3
401	3
402	3
403	3
404	3
405	3
406	1
406	3
407	3
408	1
409	1
410	3
411	3
412	3
413	3
414	3
415	3
416	3
417	3
418	3
419	3
420	3
421	3
422	3
422	1
423	3
424	1
425	1
426	3
427	3
428	3
429	3
430	3
431	3
432	3
433	3
434	3
434	1
435	3
436	3
437	2
438	1
439	2
440	1
441	1
442	1
443	3
444	3
445	3
446	3
447	3
448	1
449	1
450	3
451	3
452	2
453	3
454	3
455	3
456	3
457	2
458	3
459	3
460	3
461	3
462	3
463	3
464	3
465	3
466	3
467	3
468	3
469	3
470	3
471	3
472	3
473	3
474	3
475	3
476	2
477	3
478	1
479	3
480	3
481	2
482	2
483	3
484	3
485	3
486	3
487	3
488	3
489	3
490	3
491	3
492	3
493	3
494	1
495	3
496	3
497	3
498	1
499	3
500	2
501	3
502	3
503	3
504	3
505	1
506	3
507	3
508	3
509	3
510	3
511	3
512	3
513	3
514	3
515	1
516	1
517	1
518	1
519	1
520	1
521	1
522	1
523	1
524	1
525	3
526	3
527	3
528	3
529	3
530	3
531	3
532	3
533	3
534	3
535	3
536	2
537	3
538	3
539	3
540	3
541	1
542	3
543	3
544	2
545	3
546	3
547	3
548	3
549	3
550	3
551	3
552	3
553	3
554	3
555	1
556	3
557	3
558	3
559	3
560	3
561	3
562	3
563	2
564	1
565	1
566	1
567	3
568	3
569	3
570	3
571	3
572	3
573	3
574	3
575	3
576	3
577	3
578	1
579	1
580	1
581	1
582	3
583	3
584	3
585	3
586	3
587	3
588	3
589	1
590	3
591	3
592	3
593	1
594	3
594	1
595	1
595	3
596	1
597	1
598	3
599	3
600	3
601	3
603	1
604	3
605	1
605	3
606	3
607	3
608	3
609	3
610	3
611	3
612	3
613	3
614	3
615	3
616	3
617	3
618	3
619	3
620	3
621	3
622	3
623	3
624	2
625	3
626	3
627	3
628	3
629	3
630	3
631	3
632	3
633	3
634	3
635	3
636	3
637	3
638	3
639	3
640	3
641	2
642	3
643	3
644	3
645	3
646	3
647	3
648	3
649	3
650	3
651	3
652	3
653	3
654	1
655	3
656	3
657	3
658	3
659	3
660	3
661	3
662	3
663	3
664	3
665	3
667	3
668	3
669	3
670	3
671	3
672	3
673	3
674	3
675	3
676	1
677	3
678	3
679	3
680	3
681	3
682	3
683	3
684	3
685	3
686	3
687	3
688	3
689	3
690	3
691	3
692	3
693	3
694	3
695	1
696	3
697	3
698	3
699	3
700	3
701	3
702	3
703	3
704	3
705	3
706	3
707	3
708	3
709	3
710	3
711	3
712	3
713	3
714	3
715	3
716	3
717	3
718	3
719	3
720	1
721	1
722	3
723	1
724	3
725	3
726	3
727	3
728	2
729	3
730	3
731	3
732	3
733	3
734	3
735	2
736	2
737	3
738	3
739	3
740	3
741	3
742	1
742	3
743	3
744	3
745	3
746	3
747	3
748	3
749	3
750	3
751	2
752	1
752	3
753	3
754	3
755	3
756	1
757	3
758	3
759	3
760	1
761	3
762	3
763	1
764	3
765	3
766	3
767	3
768	1
769	3
770	3
771	3
772	3
773	3
774	3
775	3
776	3
777	3
778	3
779	3
780	3
781	3
782	3
783	3
784	3
785	3
786	3
787	3
788	3
789	3
790	3
791	3
792	3
793	3
794	3
795	3
796	1
797	3
797	1
798	3
799	3
800	3
801	3
802	3
803	3
803	1
804	3
805	3
806	3
807	3
808	2
809	3
810	3
811	3
812	3
813	1
814	3
815	3
816	3
817	3
818	3
819	3
820	3
821	3
822	3
823	3
824	3
825	3
826	2
827	3
827	1
828	3
829	3
830	3
831	3
832	3
833	3
834	1
835	3
836	3
837	3
838	3
839	3
840	3
841	2
842	3
843	3
844	3
845	3
846	3
847	3
848	3
849	3
850	3
851	3
852	3
853	1
854	1
854	3
855	3
856	3
857	3
858	3
859	3
860	3
861	3
862	3
863	3
864	3
865	3
866	3
867	3
868	3
869	3
870	3
871	3
872	3
873	3
874	3
875	1
876	1
877	1
878	3
879	3
880	3
881	3
882	3
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (id, region, latitude, longitude) FROM stdin;
1	Central Mid-altitude	0.04626	37.65587
2	Central Highlands	0.01667	37.07283
3	Eastern	-1.51667	37.26667
4	Western Mid-altitude	0.46005	34.11169
5	Western Highlands	 0.5635	34.56055
6	Rift Valley	-0.28333	36.06667
7	Northern Lowlands	-0.45275	39.64601
8	Coastal Lowlands	4.0435	39.6682
9	Eastern Highlands	1.01572	35.00622
10	Eastern Mid-altitude	-1.51667	37.26667
11	Coastal Highlands	-3.39605	38.55609
12	Western Lowlands	0.28422	34.75229
13	Northern Highlands	3.5216	39.05472
14	Northern Mid-altitude	0.4612	39.6401
15	Coastal	-4.05466	39.66359
16	Central Mid-altitude	0.04626	37.65587
17	Central Highlands	0.01667	37.07283
18	Eastern	-1.51667	37.26667
19	Western Mid-altitude	0.46005	34.11169
20	Western Highlands	 0.5635	34.56055
21	Rift Valley	-0.28333	36.06667
22	Northern Lowlands	-0.45275	39.64601
23	Coastal Lowlands	4.0435	39.6682
24	Eastern Highlands	1.01572	35.00622
25	Eastern Mid-altitude	-1.51667	37.26667
26	Coastal Highlands	-3.39605	38.55609
27	Western Lowlands	0.28422	34.75229
28	Northern Highlands	3.5216	39.05472
29	Northern Mid-altitude	0.4612	39.6401
30	Coastal	-4.05466	39.66359
\.


--
-- Data for Name: shrub_climbings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shrub_climbings (id, tree_type) FROM stdin;
1	parasite
2	trailer
3	tree
4	creeper
5	herb
6	climber
7	liana
8	shrub
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: spines_thorns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spines_thorns (thorn_id, thorns_spines) FROM stdin;
1	present
3	absent
2	unknown
\.


--
-- Data for Name: ukwf_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ukwf_areas (ukwf_area_id, ukwf_area) FROM stdin;
1	rv
2	nar
3	mag
4	nan
5	unknown
6	nbi
7	ha
8	mac
9	mum
10	kkaj
11	emb
12	hc
13	hl
14	bar
15	ht
16	hk
17	kit
18	hn
19	kaj
20	he
21	kis
22	riv
23	hm
\.


--
-- Data for Name: woody_herbaceous; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.woody_herbaceous (id, type_of_stem) FROM stdin;
1	herbaceous
2	unkwown
3	woody
\.


--
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 1, true);


--
-- Name: fruit_colors_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fruit_colors_color_id_seq', 18, true);


--
-- Name: fruit_shapes_fruit_shape_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fruit_shapes_fruit_shape_id_seq', 47, true);


--
-- Name: fruit_sizes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fruit_sizes_id_seq', 5, true);


--
-- Name: fruit_types_fruit_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fruit_types_fruit_type_id_seq', 20, true);


--
-- Name: fruiting_months_fruiting_month_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fruiting_months_fruiting_month_id_seq', 13, true);


--
-- Name: insect_families_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insect_families_id_seq', 62, true);


--
-- Name: insect_genera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insect_genera_id_seq', 197, true);


--
-- Name: insect_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insect_orders_id_seq', 5, true);


--
-- Name: insect_sub_families_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insect_sub_families_id_seq', 46, true);


--
-- Name: insects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insects_id_seq', 597, true);


--
-- Name: k_sectors_k_sector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.k_sectors_k_sector_id_seq', 9, true);


--
-- Name: latex_fruit_latex_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.latex_fruit_latex_id_seq', 2, true);


--
-- Name: leaf_arrangements_leaf_arrangement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leaf_arrangements_leaf_arrangement_id_seq', 11, true);


--
-- Name: leaf_margins_leaf_margin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.leaf_margins_leaf_margin_id_seq', 20, true);


--
-- Name: plant_families_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_families_id_seq', 129, true);


--
-- Name: plant_genera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plant_genera_id_seq', 458, true);


--
-- Name: plants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plants_id_seq', 882, true);


--
-- Name: plants_photos_photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plants_photos_photo_id_seq', 1525, true);


--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_id_seq', 30, true);


--
-- Name: shrub_climbings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shrub_climbings_id_seq', 8, true);


--
-- Name: spines_thorns_thorn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.spines_thorns_thorn_id_seq', 3, true);


--
-- Name: ukwf_areas_ukwf_area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ukwf_areas_ukwf_area_id_seq', 23, true);


--
-- Name: woody_herbaceous_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.woody_herbaceous_id_seq', 4, true);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- Name: fruit_colors fruit_colors_color_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_colors
    ADD CONSTRAINT fruit_colors_color_key UNIQUE (color);


--
-- Name: fruit_colors fruit_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_colors
    ADD CONSTRAINT fruit_colors_pkey PRIMARY KEY (color_id);


--
-- Name: fruit_shapes fruit_shapes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_shapes
    ADD CONSTRAINT fruit_shapes_pkey PRIMARY KEY (fruit_shape_id);


--
-- Name: fruit_shapes fruit_shapes_shape_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_shapes
    ADD CONSTRAINT fruit_shapes_shape_key UNIQUE (shape);


--
-- Name: fruit_sizes fruit_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_sizes
    ADD CONSTRAINT fruit_sizes_pkey PRIMARY KEY (id);


--
-- Name: fruit_sizes fruit_sizes_size_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_sizes
    ADD CONSTRAINT fruit_sizes_size_key UNIQUE (size);


--
-- Name: fruit_types_glossary fruit_types_glossary_photo_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_types_glossary
    ADD CONSTRAINT fruit_types_glossary_photo_id_key UNIQUE (photo_id);


--
-- Name: fruit_types_glossary fruit_types_glossary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_types_glossary
    ADD CONSTRAINT fruit_types_glossary_pkey PRIMARY KEY (fruit_id, photo_id);


--
-- Name: fruit_types fruit_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_types
    ADD CONSTRAINT fruit_types_pkey PRIMARY KEY (fruit_type_id);


--
-- Name: fruit_types fruit_types_type_of_fruit_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_types
    ADD CONSTRAINT fruit_types_type_of_fruit_key UNIQUE (type_of_fruit);


--
-- Name: fruiting_months fruiting_months_month_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruiting_months
    ADD CONSTRAINT fruiting_months_month_key UNIQUE (month);


--
-- Name: fruiting_months fruiting_months_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruiting_months
    ADD CONSTRAINT fruiting_months_pkey PRIMARY KEY (fruiting_month_id);


--
-- Name: glossary_photos glossary_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.glossary_photos
    ADD CONSTRAINT glossary_photos_pkey PRIMARY KEY (photo_id, glossary_id);


--
-- Name: glossary glossary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.glossary
    ADD CONSTRAINT glossary_pkey PRIMARY KEY (glossary_id);


--
-- Name: insect_families insect_families_family_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_families
    ADD CONSTRAINT insect_families_family_name_key UNIQUE (family_name);


--
-- Name: insect_families insect_families_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_families
    ADD CONSTRAINT insect_families_pkey PRIMARY KEY (id);


--
-- Name: insect_genera insect_genera_genus_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_genera
    ADD CONSTRAINT insect_genera_genus_name_key UNIQUE (genus_name);


--
-- Name: insect_genera insect_genera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_genera
    ADD CONSTRAINT insect_genera_pkey PRIMARY KEY (id);


--
-- Name: insect_orders insect_orders_order_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_orders
    ADD CONSTRAINT insect_orders_order_name_key UNIQUE (order_name);


--
-- Name: insect_orders insect_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_orders
    ADD CONSTRAINT insect_orders_pkey PRIMARY KEY (id);


--
-- Name: insect_photos insect_photos_photo_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_photos
    ADD CONSTRAINT insect_photos_photo_id_key UNIQUE (photo_id);


--
-- Name: insect_photos insect_photos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_photos
    ADD CONSTRAINT insect_photos_pkey PRIMARY KEY (insect_id, photo_id);


--
-- Name: insect_sub_families insect_sub_families_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_sub_families
    ADD CONSTRAINT insect_sub_families_pkey PRIMARY KEY (id);


--
-- Name: insect_sub_families insect_sub_families_sub_family_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_sub_families
    ADD CONSTRAINT insect_sub_families_sub_family_name_key UNIQUE (sub_family_name);


--
-- Name: insects_coi insects_coi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects_coi
    ADD CONSTRAINT insects_coi_pkey PRIMARY KEY (coi_id, insect_id);


--
-- Name: insects insects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects
    ADD CONSTRAINT insects_pkey PRIMARY KEY (id);


--
-- Name: insects_regions insects_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects_regions
    ADD CONSTRAINT insects_regions_pkey PRIMARY KEY (insect_id, region_id);


--
-- Name: insects insects_unique_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects
    ADD CONSTRAINT insects_unique_code_key UNIQUE (unique_code);


--
-- Name: k_sectors k_sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.k_sectors
    ADD CONSTRAINT k_sectors_pkey PRIMARY KEY (k_sector_id);


--
-- Name: latex latex_latex_description_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.latex
    ADD CONSTRAINT latex_latex_description_key UNIQUE (latex_description);


--
-- Name: latex latex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.latex
    ADD CONSTRAINT latex_pkey PRIMARY KEY (fruit_latex_id);


--
-- Name: leaf_arrangements leaf_arrangements_arrangement_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaf_arrangements
    ADD CONSTRAINT leaf_arrangements_arrangement_key UNIQUE (arrangement);


--
-- Name: leaf_arrangements leaf_arrangements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaf_arrangements
    ADD CONSTRAINT leaf_arrangements_pkey PRIMARY KEY (leaf_arrangement_id);


--
-- Name: leaf_margins leaf_margins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaf_margins
    ADD CONSTRAINT leaf_margins_pkey PRIMARY KEY (leaf_margin_id);


--
-- Name: leaf_margins leaf_margins_type_of_leaf_margin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leaf_margins
    ADD CONSTRAINT leaf_margins_type_of_leaf_margin_key UNIQUE (type_of_leaf_margin);


--
-- Name: plants_photos pk_plants_photos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_photos
    ADD CONSTRAINT pk_plants_photos PRIMARY KEY (plant_id, photo_id);


--
-- Name: plant_coordinates plant_coordinates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_coordinates
    ADD CONSTRAINT plant_coordinates_pkey PRIMARY KEY (plant_id, latitude, longitude);


--
-- Name: plant_families plant_families_family_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_families
    ADD CONSTRAINT plant_families_family_name_key UNIQUE (family_name);


--
-- Name: plant_families_newick plant_families_newick_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_families_newick
    ADD CONSTRAINT plant_families_newick_pkey PRIMARY KEY (id);


--
-- Name: plant_families plant_families_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_families
    ADD CONSTRAINT plant_families_pkey PRIMARY KEY (id);


--
-- Name: plant_genera plant_genera_genus_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_genera
    ADD CONSTRAINT plant_genera_genus_name_key UNIQUE (genus_name);


--
-- Name: plant_genera plant_genera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_genera
    ADD CONSTRAINT plant_genera_pkey PRIMARY KEY (id);


--
-- Name: plants_fruit_colors plants_fruit_colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_colors
    ADD CONSTRAINT plants_fruit_colors_pkey PRIMARY KEY (plant_id, color_id);


--
-- Name: plants_fruit_shapes plants_fruit_shapes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_shapes
    ADD CONSTRAINT plants_fruit_shapes_pkey PRIMARY KEY (plant_id, fruit_shape_id);


--
-- Name: plants_fruit_sizes plants_fruit_sizes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_sizes
    ADD CONSTRAINT plants_fruit_sizes_pkey PRIMARY KEY (plant_id, fruit_size_id);


--
-- Name: plants_fruit_types plants_fruit_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_types
    ADD CONSTRAINT plants_fruit_types_pkey PRIMARY KEY (plant_id, fruit_type_id);


--
-- Name: plants_fruiting_months plants_fruiting_months_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruiting_months
    ADD CONSTRAINT plants_fruiting_months_pkey PRIMARY KEY (plant_id, fruiting_month_id);


--
-- Name: plants_insects plants_insects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_insects
    ADD CONSTRAINT plants_insects_pkey PRIMARY KEY (plant_id, insect_id);


--
-- Name: plants_k_sectors plants_k_sectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_k_sectors
    ADD CONSTRAINT plants_k_sectors_pkey PRIMARY KEY (plant_id, k_sector_id);


--
-- Name: plants_latex plants_latex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_latex
    ADD CONSTRAINT plants_latex_pkey PRIMARY KEY (plant_id, fruit_latex_id);


--
-- Name: plants_leaf_arrangements plants_leaf_arrangements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_leaf_arrangements
    ADD CONSTRAINT plants_leaf_arrangements_pkey PRIMARY KEY (plant_id, leaf_arrangement_id);


--
-- Name: plants_leaf_margins plants_leaf_margins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_leaf_margins
    ADD CONSTRAINT plants_leaf_margins_pkey PRIMARY KEY (plant_id, leaf_margin_id);


--
-- Name: plants_matk plants_matk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_matk
    ADD CONSTRAINT plants_matk_pkey PRIMARY KEY (matk_id, plant_id);


--
-- Name: plants_photos plants_photos_photo_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_photos
    ADD CONSTRAINT plants_photos_photo_name_key UNIQUE (photo_name);


--
-- Name: plants plants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_pkey PRIMARY KEY (id);


--
-- Name: plants_rbcl plants_rbcl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_rbcl
    ADD CONSTRAINT plants_rbcl_pkey PRIMARY KEY (rbcl_id);


--
-- Name: plants_regions plants_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_regions
    ADD CONSTRAINT plants_regions_pkey PRIMARY KEY (plants_id, region_id);


--
-- Name: plants_shrub_climbings plants_shrub_climbings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_shrub_climbings
    ADD CONSTRAINT plants_shrub_climbings_pkey PRIMARY KEY (plant_id, shrub_id);


--
-- Name: plants_spines_thorns plants_spines_thorns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_spines_thorns
    ADD CONSTRAINT plants_spines_thorns_pkey PRIMARY KEY (plant_id, thorn_id);


--
-- Name: plants_ukwf_areas plants_ukwf_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_ukwf_areas
    ADD CONSTRAINT plants_ukwf_areas_pkey PRIMARY KEY (plant_id, ukwf_area_id);


--
-- Name: plants_woody_herbaceous plants_woody_herbaceous_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_woody_herbaceous
    ADD CONSTRAINT plants_woody_herbaceous_pkey PRIMARY KEY (plant_id, back_id);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: shrub_climbings shrub_climbings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shrub_climbings
    ADD CONSTRAINT shrub_climbings_pkey PRIMARY KEY (id);


--
-- Name: shrub_climbings shrub_climbings_tree_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shrub_climbings
    ADD CONSTRAINT shrub_climbings_tree_type_key UNIQUE (tree_type);


--
-- Name: spines_thorns spines_thorns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spines_thorns
    ADD CONSTRAINT spines_thorns_pkey PRIMARY KEY (thorn_id);


--
-- Name: spines_thorns spines_thorns_thorns_spines_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.spines_thorns
    ADD CONSTRAINT spines_thorns_thorns_spines_key UNIQUE (thorns_spines);


--
-- Name: ukwf_areas ukwf_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ukwf_areas
    ADD CONSTRAINT ukwf_areas_pkey PRIMARY KEY (ukwf_area_id);


--
-- Name: plants_photos unique_plant_photo_combination; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_photos
    ADD CONSTRAINT unique_plant_photo_combination UNIQUE (plant_id, photo_id);


--
-- Name: woody_herbaceous woody_herbaceous_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.woody_herbaceous
    ADD CONSTRAINT woody_herbaceous_pkey PRIMARY KEY (id);


--
-- Name: woody_herbaceous woody_herbaceous_type_of_stem_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.woody_herbaceous
    ADD CONSTRAINT woody_herbaceous_type_of_stem_key UNIQUE (type_of_stem);


--
-- Name: fruit_types_glossary fruit_types_glossary_fruit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruit_types_glossary
    ADD CONSTRAINT fruit_types_glossary_fruit_id_fkey FOREIGN KEY (fruit_id) REFERENCES public.fruit_types(fruit_type_id);


--
-- Name: glossary_photos glossary_photos_glossary_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.glossary_photos
    ADD CONSTRAINT glossary_photos_glossary_id_fkey FOREIGN KEY (glossary_id) REFERENCES public.glossary(glossary_id);


--
-- Name: insect_photos insect_photos_insect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insect_photos
    ADD CONSTRAINT insect_photos_insect_id_fkey FOREIGN KEY (insect_id) REFERENCES public.insects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insects_coi insects_coi_insect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects_coi
    ADD CONSTRAINT insects_coi_insect_id_fkey FOREIGN KEY (insect_id) REFERENCES public.insects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insects insects_family_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects
    ADD CONSTRAINT insects_family_id_fkey FOREIGN KEY (family_id) REFERENCES public.insect_families(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insects insects_genus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects
    ADD CONSTRAINT insects_genus_id_fkey FOREIGN KEY (genus_id) REFERENCES public.insect_genera(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insects insects_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects
    ADD CONSTRAINT insects_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.insect_orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insects_regions insects_regions_insect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects_regions
    ADD CONSTRAINT insects_regions_insect_id_fkey FOREIGN KEY (insect_id) REFERENCES public.insects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insects_regions insects_regions_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects_regions
    ADD CONSTRAINT insects_regions_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: insects insects_sub_family_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insects
    ADD CONSTRAINT insects_sub_family_id_fkey FOREIGN KEY (sub_family_id) REFERENCES public.insect_sub_families(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plant_coordinates plant_coordinates_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_coordinates
    ADD CONSTRAINT plant_coordinates_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plant_genera plant_genera_family_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plant_genera
    ADD CONSTRAINT plant_genera_family_id_fkey FOREIGN KEY (family_id) REFERENCES public.plant_families(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruit_colors plants_fruit_colors_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_colors
    ADD CONSTRAINT plants_fruit_colors_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.fruit_colors(color_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruit_colors plants_fruit_colors_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_colors
    ADD CONSTRAINT plants_fruit_colors_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruit_shapes plants_fruit_shapes_fruit_shape_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_shapes
    ADD CONSTRAINT plants_fruit_shapes_fruit_shape_id_fkey FOREIGN KEY (fruit_shape_id) REFERENCES public.fruit_shapes(fruit_shape_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruit_shapes plants_fruit_shapes_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_shapes
    ADD CONSTRAINT plants_fruit_shapes_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruit_sizes plants_fruit_sizes_fruit_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_sizes
    ADD CONSTRAINT plants_fruit_sizes_fruit_size_id_fkey FOREIGN KEY (fruit_size_id) REFERENCES public.fruit_sizes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruit_sizes plants_fruit_sizes_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_sizes
    ADD CONSTRAINT plants_fruit_sizes_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruit_types plants_fruit_types_fruit_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_types
    ADD CONSTRAINT plants_fruit_types_fruit_type_id_fkey FOREIGN KEY (fruit_type_id) REFERENCES public.fruit_types(fruit_type_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruit_types plants_fruit_types_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruit_types
    ADD CONSTRAINT plants_fruit_types_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruiting_months plants_fruiting_months_fruiting_month_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruiting_months
    ADD CONSTRAINT plants_fruiting_months_fruiting_month_id_fkey FOREIGN KEY (fruiting_month_id) REFERENCES public.fruiting_months(fruiting_month_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_fruiting_months plants_fruiting_months_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_fruiting_months
    ADD CONSTRAINT plants_fruiting_months_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants plants_genus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants
    ADD CONSTRAINT plants_genus_id_fkey FOREIGN KEY (genus_id) REFERENCES public.plant_genera(id);


--
-- Name: plants_insects plants_insects_insect_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_insects
    ADD CONSTRAINT plants_insects_insect_id_fkey FOREIGN KEY (insect_id) REFERENCES public.insects(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_insects plants_insects_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_insects
    ADD CONSTRAINT plants_insects_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_k_sectors plants_k_sectors_k_sector_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_k_sectors
    ADD CONSTRAINT plants_k_sectors_k_sector_id_fkey FOREIGN KEY (k_sector_id) REFERENCES public.k_sectors(k_sector_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_k_sectors plants_k_sectors_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_k_sectors
    ADD CONSTRAINT plants_k_sectors_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_latex plants_latex_fruit_latex_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_latex
    ADD CONSTRAINT plants_latex_fruit_latex_id_fkey FOREIGN KEY (fruit_latex_id) REFERENCES public.latex(fruit_latex_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_latex plants_latex_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_latex
    ADD CONSTRAINT plants_latex_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_leaf_arrangements plants_leaf_arrangements_leaf_arrangement_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_leaf_arrangements
    ADD CONSTRAINT plants_leaf_arrangements_leaf_arrangement_id_fkey FOREIGN KEY (leaf_arrangement_id) REFERENCES public.leaf_arrangements(leaf_arrangement_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_leaf_arrangements plants_leaf_arrangements_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_leaf_arrangements
    ADD CONSTRAINT plants_leaf_arrangements_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_leaf_margins plants_leaf_margins_leaf_margin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_leaf_margins
    ADD CONSTRAINT plants_leaf_margins_leaf_margin_id_fkey FOREIGN KEY (leaf_margin_id) REFERENCES public.leaf_margins(leaf_margin_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_leaf_margins plants_leaf_margins_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_leaf_margins
    ADD CONSTRAINT plants_leaf_margins_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_matk plants_matk_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_matk
    ADD CONSTRAINT plants_matk_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_photos plants_photos_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_photos
    ADD CONSTRAINT plants_photos_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_rbcl plants_rbcl_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_rbcl
    ADD CONSTRAINT plants_rbcl_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id);


--
-- Name: plants_regions plants_regions_plants_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_regions
    ADD CONSTRAINT plants_regions_plants_id_fkey FOREIGN KEY (plants_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_regions plants_regions_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_regions
    ADD CONSTRAINT plants_regions_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_shrub_climbings plants_shrub_climbings_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_shrub_climbings
    ADD CONSTRAINT plants_shrub_climbings_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_shrub_climbings plants_shrub_climbings_shrub_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_shrub_climbings
    ADD CONSTRAINT plants_shrub_climbings_shrub_id_fkey FOREIGN KEY (shrub_id) REFERENCES public.shrub_climbings(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_spines_thorns plants_spines_thorns_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_spines_thorns
    ADD CONSTRAINT plants_spines_thorns_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_spines_thorns plants_spines_thorns_thorn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_spines_thorns
    ADD CONSTRAINT plants_spines_thorns_thorn_id_fkey FOREIGN KEY (thorn_id) REFERENCES public.spines_thorns(thorn_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_ukwf_areas plants_ukwf_areas_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_ukwf_areas
    ADD CONSTRAINT plants_ukwf_areas_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_ukwf_areas plants_ukwf_areas_ukwf_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_ukwf_areas
    ADD CONSTRAINT plants_ukwf_areas_ukwf_area_id_fkey FOREIGN KEY (ukwf_area_id) REFERENCES public.ukwf_areas(ukwf_area_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_woody_herbaceous plants_woody_herbaceous_back_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_woody_herbaceous
    ADD CONSTRAINT plants_woody_herbaceous_back_id_fkey FOREIGN KEY (back_id) REFERENCES public.woody_herbaceous(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: plants_woody_herbaceous plants_woody_herbaceous_plant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plants_woody_herbaceous
    ADD CONSTRAINT plants_woody_herbaceous_plant_id_fkey FOREIGN KEY (plant_id) REFERENCES public.plants(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: TABLE fruit_colors; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.fruit_colors TO copeland;


--
-- Name: TABLE fruit_shapes; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.fruit_shapes TO copeland;


--
-- Name: TABLE fruit_sizes; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.fruit_sizes TO copeland;


--
-- Name: TABLE fruit_types; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.fruit_types TO copeland;


--
-- Name: TABLE fruit_types_glossary; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.fruit_types_glossary TO copeland;


--
-- Name: TABLE fruiting_months; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.fruiting_months TO copeland;


--
-- Name: TABLE geography_columns; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.geography_columns TO copeland;


--
-- Name: TABLE geometry_columns; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.geometry_columns TO copeland;


--
-- Name: TABLE glossary; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.glossary TO copeland;


--
-- Name: TABLE glossary_photos; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.glossary_photos TO copeland;


--
-- Name: TABLE insect_families; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.insect_families TO copeland;


--
-- Name: TABLE insect_genera; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.insect_genera TO copeland;


--
-- Name: TABLE insect_orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.insect_orders TO copeland;


--
-- Name: TABLE insect_photos; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.insect_photos TO copeland;


--
-- Name: TABLE insect_sub_families; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.insect_sub_families TO copeland;


--
-- Name: TABLE insects; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.insects TO copeland;


--
-- Name: TABLE insects_regions; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.insects_regions TO copeland;


--
-- Name: TABLE k_sectors; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.k_sectors TO copeland;


--
-- Name: TABLE latex; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.latex TO copeland;


--
-- Name: TABLE leaf_arrangements; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.leaf_arrangements TO copeland;


--
-- Name: TABLE leaf_margins; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.leaf_margins TO copeland;


--
-- Name: TABLE plant_coordinates; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plant_coordinates TO copeland;


--
-- Name: TABLE plant_families; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plant_families TO copeland;


--
-- Name: TABLE plant_families_newick; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plant_families_newick TO copeland;


--
-- Name: TABLE plant_genera; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plant_genera TO copeland;


--
-- Name: TABLE plants; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants TO copeland;


--
-- Name: TABLE plants_fruit_colors; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_fruit_colors TO copeland;


--
-- Name: TABLE plants_fruit_shapes; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_fruit_shapes TO copeland;


--
-- Name: TABLE plants_fruit_sizes; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_fruit_sizes TO copeland;


--
-- Name: TABLE plants_fruit_types; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_fruit_types TO copeland;


--
-- Name: TABLE plants_fruiting_months; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_fruiting_months TO copeland;


--
-- Name: TABLE plants_insects; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_insects TO copeland;


--
-- Name: TABLE plants_k_sectors; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_k_sectors TO copeland;


--
-- Name: TABLE plants_latex; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_latex TO copeland;


--
-- Name: TABLE plants_leaf_arrangements; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_leaf_arrangements TO copeland;


--
-- Name: TABLE plants_leaf_margins; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_leaf_margins TO copeland;


--
-- Name: TABLE plants_photos; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_photos TO copeland;


--
-- Name: TABLE plants_rbcl; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_rbcl TO copeland;


--
-- Name: TABLE plants_regions; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_regions TO copeland;


--
-- Name: TABLE plants_shrub_climbings; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_shrub_climbings TO copeland;


--
-- Name: TABLE plants_spines_thorns; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_spines_thorns TO copeland;


--
-- Name: TABLE plants_ukwf_areas; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_ukwf_areas TO copeland;


--
-- Name: TABLE plants_woody_herbaceous; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.plants_woody_herbaceous TO copeland;


--
-- Name: TABLE regions; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.regions TO copeland;


--
-- Name: TABLE shrub_climbings; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.shrub_climbings TO copeland;


--
-- Name: TABLE spatial_ref_sys; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.spatial_ref_sys TO copeland;


--
-- Name: TABLE spines_thorns; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.spines_thorns TO copeland;


--
-- Name: TABLE ukwf_areas; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.ukwf_areas TO copeland;


--
-- Name: TABLE woody_herbaceous; Type: ACL; Schema: public; Owner: postgres
--

GRANT INSERT,DELETE,UPDATE ON TABLE public.woody_herbaceous TO copeland;


--
-- PostgreSQL database dump complete
--
