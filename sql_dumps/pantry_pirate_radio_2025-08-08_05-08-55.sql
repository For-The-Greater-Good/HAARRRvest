--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg110+1)
-- Dumped by pg_dump version 15.13 (Debian 15.13-1.pgdg110+1)

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

ALTER TABLE IF EXISTS ONLY public.url DROP CONSTRAINT IF EXISTS url_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.url DROP CONSTRAINT IF EXISTS url_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.taxonomy_term DROP CONSTRAINT IF EXISTS taxonomy_term_taxonomy_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service_source DROP CONSTRAINT IF EXISTS service_source_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service_source DROP CONSTRAINT IF EXISTS service_source_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service DROP CONSTRAINT IF EXISTS service_program_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service DROP CONSTRAINT IF EXISTS service_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service_capacity DROP CONSTRAINT IF EXISTS service_capacity_unit_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service_capacity DROP CONSTRAINT IF EXISTS service_capacity_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service_at_location DROP CONSTRAINT IF EXISTS service_at_location_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service_at_location DROP CONSTRAINT IF EXISTS service_at_location_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service_area DROP CONSTRAINT IF EXISTS service_area_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.service_area DROP CONSTRAINT IF EXISTS service_area_service_at_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.schedule DROP CONSTRAINT IF EXISTS schedule_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.schedule DROP CONSTRAINT IF EXISTS schedule_service_at_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.schedule DROP CONSTRAINT IF EXISTS schedule_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.required_document DROP CONSTRAINT IF EXISTS required_document_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.program DROP CONSTRAINT IF EXISTS program_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.phone DROP CONSTRAINT IF EXISTS phone_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.phone DROP CONSTRAINT IF EXISTS phone_service_at_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.phone DROP CONSTRAINT IF EXISTS phone_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.phone DROP CONSTRAINT IF EXISTS phone_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.phone DROP CONSTRAINT IF EXISTS phone_contact_id_fkey;
ALTER TABLE IF EXISTS ONLY public.organization_source DROP CONSTRAINT IF EXISTS organization_source_parent_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.organization_source DROP CONSTRAINT IF EXISTS organization_source_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.organization_identifier DROP CONSTRAINT IF EXISTS organization_identifier_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.location_source DROP CONSTRAINT IF EXISTS location_source_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.location DROP CONSTRAINT IF EXISTS location_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.language DROP CONSTRAINT IF EXISTS language_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.language DROP CONSTRAINT IF EXISTS language_phone_id_fkey;
ALTER TABLE IF EXISTS ONLY public.language DROP CONSTRAINT IF EXISTS language_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.funding DROP CONSTRAINT IF EXISTS funding_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.funding DROP CONSTRAINT IF EXISTS funding_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.cost_option DROP CONSTRAINT IF EXISTS cost_option_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.contact DROP CONSTRAINT IF EXISTS contact_service_id_fkey;
ALTER TABLE IF EXISTS ONLY public.contact DROP CONSTRAINT IF EXISTS contact_service_at_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.contact DROP CONSTRAINT IF EXISTS contact_organization_id_fkey;
ALTER TABLE IF EXISTS ONLY public.contact DROP CONSTRAINT IF EXISTS contact_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.attribute DROP CONSTRAINT IF EXISTS attribute_taxonomy_term_id_fkey;
ALTER TABLE IF EXISTS ONLY public.address DROP CONSTRAINT IF EXISTS address_location_id_fkey;
ALTER TABLE IF EXISTS ONLY public.accessibility DROP CONSTRAINT IF EXISTS accessibility_location_id_fkey;
DROP TRIGGER IF EXISTS update_canonical_location_trigger ON public.location_source;
DROP TRIGGER IF EXISTS organization_normalize_name_trigger ON public.organization;
DROP INDEX IF EXISTS public.service_source_service_scraper_idx;
DROP INDEX IF EXISTS public.service_source_service_id_idx;
DROP INDEX IF EXISTS public.service_source_scraper_id_idx;
DROP INDEX IF EXISTS public.service_organization_id_idx;
DROP INDEX IF EXISTS public.service_name_organization_idx;
DROP INDEX IF EXISTS public.record_version_source_id_idx;
DROP INDEX IF EXISTS public.reconciler_violations_resolved_idx;
DROP INDEX IF EXISTS public.reconciler_violations_created_at_idx;
DROP INDEX IF EXISTS public.organization_source_scraper_id_idx;
DROP INDEX IF EXISTS public.organization_source_organization_id_idx;
DROP INDEX IF EXISTS public.organization_source_org_scraper_idx;
DROP INDEX IF EXISTS public.organization_normalized_name_idx;
DROP INDEX IF EXISTS public.location_source_scraper_id_idx;
DROP INDEX IF EXISTS public.location_source_location_scraper_idx;
DROP INDEX IF EXISTS public.location_source_location_id_idx;
DROP INDEX IF EXISTS public.location_coordinates_idx;
DROP INDEX IF EXISTS public.idx_record_version_type;
DROP INDEX IF EXISTS public.idx_record_version_record;
DROP INDEX IF EXISTS public.idx_record_version_created;
DROP INDEX IF EXISTS public.idx_location_coords;
ALTER TABLE IF EXISTS ONLY public.url DROP CONSTRAINT IF EXISTS url_pkey;
ALTER TABLE IF EXISTS ONLY public.unit DROP CONSTRAINT IF EXISTS unit_pkey;
ALTER TABLE IF EXISTS ONLY public.taxonomy_term DROP CONSTRAINT IF EXISTS taxonomy_term_pkey;
ALTER TABLE IF EXISTS ONLY public.taxonomy_term DROP CONSTRAINT IF EXISTS taxonomy_term_code_key;
ALTER TABLE IF EXISTS ONLY public.taxonomy DROP CONSTRAINT IF EXISTS taxonomy_pkey;
ALTER TABLE IF EXISTS ONLY public.service_source DROP CONSTRAINT IF EXISTS service_source_service_id_scraper_id_key;
ALTER TABLE IF EXISTS ONLY public.service_source DROP CONSTRAINT IF EXISTS service_source_pkey;
ALTER TABLE IF EXISTS ONLY public.service DROP CONSTRAINT IF EXISTS service_pkey;
ALTER TABLE IF EXISTS ONLY public.service DROP CONSTRAINT IF EXISTS service_name_organization_unique;
ALTER TABLE IF EXISTS ONLY public.service_capacity DROP CONSTRAINT IF EXISTS service_capacity_pkey;
ALTER TABLE IF EXISTS ONLY public.service_at_location DROP CONSTRAINT IF EXISTS service_at_location_pkey;
ALTER TABLE IF EXISTS ONLY public.service_area DROP CONSTRAINT IF EXISTS service_area_pkey;
ALTER TABLE IF EXISTS ONLY public.schedule DROP CONSTRAINT IF EXISTS schedule_pkey;
ALTER TABLE IF EXISTS ONLY public.required_document DROP CONSTRAINT IF EXISTS required_document_pkey;
ALTER TABLE IF EXISTS ONLY public.record_version DROP CONSTRAINT IF EXISTS record_version_record_id_version_num_key;
ALTER TABLE IF EXISTS ONLY public.record_version DROP CONSTRAINT IF EXISTS record_version_pkey;
ALTER TABLE IF EXISTS ONLY public.reconciler_constraint_violations DROP CONSTRAINT IF EXISTS reconciler_constraint_violations_pkey;
ALTER TABLE IF EXISTS ONLY public.reconciler_config DROP CONSTRAINT IF EXISTS reconciler_config_pkey;
ALTER TABLE IF EXISTS ONLY public.program DROP CONSTRAINT IF EXISTS program_pkey;
ALTER TABLE IF EXISTS ONLY public.program DROP CONSTRAINT IF EXISTS program_organization_id_key;
ALTER TABLE IF EXISTS ONLY public.phone DROP CONSTRAINT IF EXISTS phone_pkey;
ALTER TABLE IF EXISTS ONLY public.organization_source DROP CONSTRAINT IF EXISTS organization_source_pkey;
ALTER TABLE IF EXISTS ONLY public.organization_source DROP CONSTRAINT IF EXISTS organization_source_organization_id_scraper_id_key;
ALTER TABLE IF EXISTS ONLY public.organization DROP CONSTRAINT IF EXISTS organization_pkey;
ALTER TABLE IF EXISTS ONLY public.organization DROP CONSTRAINT IF EXISTS organization_normalized_name_unique;
ALTER TABLE IF EXISTS ONLY public.organization_identifier DROP CONSTRAINT IF EXISTS organization_identifier_pkey;
ALTER TABLE IF EXISTS ONLY public.metadata DROP CONSTRAINT IF EXISTS metadata_pkey;
ALTER TABLE IF EXISTS ONLY public.meta_table_description DROP CONSTRAINT IF EXISTS meta_table_description_pkey;
ALTER TABLE IF EXISTS ONLY public.location_source DROP CONSTRAINT IF EXISTS location_source_pkey;
ALTER TABLE IF EXISTS ONLY public.location_source DROP CONSTRAINT IF EXISTS location_source_location_id_scraper_id_key;
ALTER TABLE IF EXISTS ONLY public.location DROP CONSTRAINT IF EXISTS location_pkey;
ALTER TABLE IF EXISTS ONLY public.language DROP CONSTRAINT IF EXISTS language_pkey;
ALTER TABLE IF EXISTS ONLY public.funding DROP CONSTRAINT IF EXISTS funding_pkey;
ALTER TABLE IF EXISTS ONLY public.cost_option DROP CONSTRAINT IF EXISTS cost_option_pkey;
ALTER TABLE IF EXISTS ONLY public.contact DROP CONSTRAINT IF EXISTS contact_pkey;
ALTER TABLE IF EXISTS ONLY public.attribute DROP CONSTRAINT IF EXISTS attribute_pkey;
ALTER TABLE IF EXISTS ONLY public.address DROP CONSTRAINT IF EXISTS address_pkey;
ALTER TABLE IF EXISTS ONLY public.accessibility DROP CONSTRAINT IF EXISTS accessibility_pkey;
ALTER TABLE IF EXISTS public.reconciler_constraint_violations ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.url;
DROP TABLE IF EXISTS public.unit;
DROP TABLE IF EXISTS public.taxonomy_term;
DROP TABLE IF EXISTS public.taxonomy;
DROP TABLE IF EXISTS public.service_source;
DROP TABLE IF EXISTS public.service_capacity;
DROP TABLE IF EXISTS public.service_at_location;
DROP TABLE IF EXISTS public.service_area;
DROP TABLE IF EXISTS public.service;
DROP TABLE IF EXISTS public.schedule;
DROP TABLE IF EXISTS public.required_document;
DROP TABLE IF EXISTS public.record_version;
DROP SEQUENCE IF EXISTS public.reconciler_constraint_violations_id_seq;
DROP TABLE IF EXISTS public.reconciler_constraint_violations;
DROP TABLE IF EXISTS public.reconciler_config;
DROP TABLE IF EXISTS public.program;
DROP TABLE IF EXISTS public.phone;
DROP TABLE IF EXISTS public.organization_source;
DROP TABLE IF EXISTS public.organization_identifier;
DROP TABLE IF EXISTS public.organization;
DROP TABLE IF EXISTS public.metadata;
DROP TABLE IF EXISTS public.meta_table_description;
DROP VIEW IF EXISTS public.location_merged_view;
DROP TABLE IF EXISTS public.location_source;
DROP TABLE IF EXISTS public.location;
DROP TABLE IF EXISTS public.language;
DROP TABLE IF EXISTS public.funding;
DROP TABLE IF EXISTS public.cost_option;
DROP TABLE IF EXISTS public.contact;
DROP TABLE IF EXISTS public.attribute;
DROP TABLE IF EXISTS public.address;
DROP TABLE IF EXISTS public.accessibility;
DROP FUNCTION IF EXISTS public.update_organization_normalized_name();
DROP FUNCTION IF EXISTS public.update_canonical_location();
DROP FUNCTION IF EXISTS public.release_organization_lock(lock_id bigint);
DROP FUNCTION IF EXISTS public.release_location_lock(lock_id bigint);
DROP FUNCTION IF EXISTS public.normalize_organization_name(name text);
DROP FUNCTION IF EXISTS public.location_coordinates_match(lat1 numeric, lon1 numeric, lat2 numeric, lon2 numeric, tolerance numeric);
DROP FUNCTION IF EXISTS public.get_version_history(p_record_id uuid, p_record_type text);
DROP FUNCTION IF EXISTS public.get_latest_version(p_record_id uuid, p_record_type text);
DROP FUNCTION IF EXISTS public.cleanup_old_constraint_violations(retention_days integer);
DROP FUNCTION IF EXISTS public.acquire_organization_lock(org_name text);
DROP FUNCTION IF EXISTS public.acquire_location_lock(lat numeric, lon numeric);
DROP TYPE IF EXISTS public.service_status_enum;
DROP TYPE IF EXISTS public.schedule_wkst_enum;
DROP TYPE IF EXISTS public.schedule_freq_enum;
DROP TYPE IF EXISTS public.location_location_type_enum;
DROP TYPE IF EXISTS public.address_address_type_enum;
DROP EXTENSION IF EXISTS "uuid-ossp";
DROP EXTENSION IF EXISTS postgis;
--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: address_address_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.address_address_type_enum AS ENUM (
    'physical',
    'postal',
    'virtual'
);


--
-- Name: location_location_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.location_location_type_enum AS ENUM (
    'physical',
    'postal',
    'virtual'
);


--
-- Name: schedule_freq_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.schedule_freq_enum AS ENUM (
    'WEEKLY',
    'MONTHLY'
);


--
-- Name: schedule_wkst_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.schedule_wkst_enum AS ENUM (
    'MO',
    'TU',
    'WE',
    'TH',
    'FR',
    'SA',
    'SU'
);


--
-- Name: service_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.service_status_enum AS ENUM (
    'active',
    'inactive',
    'defunct',
    'temporarily closed'
);


--
-- Name: acquire_location_lock(numeric, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.acquire_location_lock(lat numeric, lon numeric) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    lock_id BIGINT;
    coord_hash TEXT;
BEGIN
    -- Create deterministic lock ID from coordinates (rounded to tolerance)
    coord_hash := ROUND(lat, 4)::TEXT || ',' || ROUND(lon, 4)::TEXT;
    lock_id := abs(hashtext(coord_hash));
    PERFORM pg_advisory_lock(lock_id);
    RETURN lock_id;
END;
$$;


--
-- Name: acquire_organization_lock(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.acquire_organization_lock(org_name text) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    lock_id BIGINT;
BEGIN
    -- Create deterministic lock ID from normalized organization name
    lock_id := abs(hashtext(normalize_organization_name(org_name)));
    PERFORM pg_advisory_lock(lock_id);
    RETURN lock_id;
END;
$$;


--
-- Name: cleanup_old_constraint_violations(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.cleanup_old_constraint_violations(retention_days integer DEFAULT 30) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    deleted_count INTEGER;
BEGIN
    DELETE FROM reconciler_constraint_violations
    WHERE created_at < NOW() - INTERVAL '1 day' * retention_days
    AND resolved = TRUE;

    GET DIAGNOSTICS deleted_count = ROW_COUNT;
    RETURN deleted_count;
END;
$$;


--
-- Name: FUNCTION cleanup_old_constraint_violations(retention_days integer); Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON FUNCTION public.cleanup_old_constraint_violations(retention_days integer) IS 'Cleans up resolved constraint violations older than specified days. Call periodically from application.';


--
-- Name: get_latest_version(uuid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_latest_version(p_record_id uuid, p_record_type text) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN (
        SELECT data
        FROM record_version
        WHERE record_id = p_record_id
            AND record_type = p_record_type
        ORDER BY version_num DESC
        LIMIT 1
    );
END;
$$;


--
-- Name: get_version_history(uuid, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.get_version_history(p_record_id uuid, p_record_type text) RETURNS TABLE(version_num integer, data jsonb, created_at timestamp with time zone, created_by text)
    LANGUAGE plpgsql
    AS $$ BEGIN RETURN QUERY
SELECT rv.version_num,
    rv.data,
    rv.created_at,
    rv.created_by
FROM record_version rv
WHERE rv.record_id = p_record_id
    AND rv.record_type = p_record_type
ORDER BY rv.version_num DESC;
END;
$$;


--
-- Name: location_coordinates_match(numeric, numeric, numeric, numeric, numeric); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.location_coordinates_match(lat1 numeric, lon1 numeric, lat2 numeric, lon2 numeric, tolerance numeric DEFAULT 0.0001) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
    RETURN ABS(lat1 - lat2) < tolerance AND ABS(lon1 - lon2) < tolerance;
END;
$$;


--
-- Name: normalize_organization_name(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.normalize_organization_name(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
BEGIN
    -- Normalize organization names for consistent matching
    -- Remove extra whitespace, convert to lowercase, handle common variations
    RETURN LOWER(TRIM(REGEXP_REPLACE(name, '\s+', ' ', 'g')));
END;
$$;


--
-- Name: release_location_lock(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.release_location_lock(lock_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM pg_advisory_unlock(lock_id);
END;
$$;


--
-- Name: release_organization_lock(bigint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.release_organization_lock(lock_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM pg_advisory_unlock(lock_id);
END;
$$;


--
-- Name: update_canonical_location(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_canonical_location() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN -- This is a placeholder for the merging logic
    -- In a real implementation, this would apply the merging strategy
    -- to update the canonical record based on all source records
    -- The MergeStrategy class will handle the actual merging of data
    -- We don't update any timestamp here since the location table doesn't have an updated_at column
    RETURN NEW;
END;
$$;


--
-- Name: update_organization_normalized_name(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_organization_normalized_name() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.normalized_name := normalize_organization_name(NEW.name);
    RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accessibility; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accessibility (
    id character varying(250) NOT NULL,
    location_id character varying(250),
    description text,
    details text,
    url text
);


--
-- Name: COLUMN accessibility.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.accessibility.id IS 'The identifier for this accessibility information. Each entry must have a unique identifier.';


--
-- Name: COLUMN accessibility.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.accessibility.location_id IS 'The identifier for the location of the accessibility provision.';


--
-- Name: COLUMN accessibility.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.accessibility.description IS 'A free text description of the assistance or infrastructure that facilitates access to clients with disabilities.';


--
-- Name: COLUMN accessibility.details; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.accessibility.details IS 'Any further details relating to the relevant accessibility arrangements at this location.';


--
-- Name: COLUMN accessibility.url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.accessibility.url IS 'The URL of a page giving more information about the accessibility of the location.';


--
-- Name: address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.address (
    id character varying(250) NOT NULL,
    location_id character varying(250),
    attention text,
    address_1 text NOT NULL,
    address_2 text,
    city text NOT NULL,
    region text,
    state_province text NOT NULL,
    postal_code text NOT NULL,
    country text NOT NULL,
    address_type public.address_address_type_enum NOT NULL
);


--
-- Name: COLUMN address.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.id IS 'The identifier of the postal address. Each postal address must have a unique identifier.';


--
-- Name: COLUMN address.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.location_id IS 'The identifier of the location for this postal address.';


--
-- Name: COLUMN address.attention; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.attention IS 'The name of the person or entity whose attention should be sought at the location. These are often included as a "care of" component of an address.';


--
-- Name: COLUMN address.address_1; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.address_1 IS 'The first line(s) of the address, including office, building number and street.';


--
-- Name: COLUMN address.address_2; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.address_2 IS 'A second (additional) line of address information.';


--
-- Name: COLUMN address.city; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.city IS 'The city in which the address is located.';


--
-- Name: COLUMN address.region; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.region IS 'The region in which the address is located (optional).';


--
-- Name: COLUMN address.state_province; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.state_province IS 'The state or province in which the address is located.';


--
-- Name: COLUMN address.postal_code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.postal_code IS 'The postal code for the address.';


--
-- Name: COLUMN address.country; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.country IS 'The country in which the address is located. This should be given as an ISO 3361-1 country code (two letter abbreviation).';


--
-- Name: COLUMN address.address_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.address.address_type IS 'The type of address which may be `physical`, `postal`, or `virtual`.';


--
-- Name: attribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attribute (
    id character varying(250) NOT NULL,
    link_id text NOT NULL,
    taxonomy_term_id character varying(250) NOT NULL,
    link_type text,
    link_entity text NOT NULL,
    value text,
    label text
);


--
-- Name: COLUMN attribute.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.attribute.id IS 'The identifier of the attribute entry. Each attribute entry should have a unique identifier.';


--
-- Name: COLUMN attribute.link_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.attribute.link_id IS 'The identifier of the entity to which this taxonomy term applies.';


--
-- Name: COLUMN attribute.taxonomy_term_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.attribute.taxonomy_term_id IS 'The identifier of this taxonomy term from the taxonomy table.';


--
-- Name: COLUMN attribute.link_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.attribute.link_type IS 'A code taken from an enumerated open codelist to indicate what the taxonomy term describes, e.g. the service eligibility or intended audience.';


--
-- Name: COLUMN attribute.link_entity; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.attribute.link_entity IS 'The table of the Link Identifier.';


--
-- Name: COLUMN attribute.value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.attribute.value IS 'The value (if any) of an attribute.';


--
-- Name: COLUMN attribute.label; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.attribute.label IS 'A free text label of the attribute.';


--
-- Name: contact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contact (
    id character varying(250) NOT NULL,
    organization_id character varying(250),
    service_id character varying(250),
    service_at_location_id character varying(250),
    location_id character varying(250),
    name text,
    title text,
    department text,
    email text
);


--
-- Name: COLUMN contact.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.id IS 'The identifier for the contact. Each contact must have a unique identifier.';


--
-- Name: COLUMN contact.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.organization_id IS 'The identifier of the organization for which this is a contact.';


--
-- Name: COLUMN contact.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.service_id IS 'The identifier of the service for which this is a contact.';


--
-- Name: COLUMN contact.service_at_location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.service_at_location_id IS 'The identifier of the ‘service at location’ entry, when this contact is specific to a service in a particular location.';


--
-- Name: COLUMN contact.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.location_id IS 'The identifier for the location of the contact.';


--
-- Name: COLUMN contact.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.name IS 'The name of the contact.';


--
-- Name: COLUMN contact.title; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.title IS 'The job title of the contact.';


--
-- Name: COLUMN contact.department; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.department IS 'The department that the contact is a part of.';


--
-- Name: COLUMN contact.email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.contact.email IS 'The email address of the contact.';


--
-- Name: cost_option; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cost_option (
    id character varying(250) NOT NULL,
    service_id character varying(250) NOT NULL,
    valid_from date,
    valid_to date,
    option text,
    currency text,
    amount numeric,
    amount_description text
);


--
-- Name: COLUMN cost_option.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.cost_option.id IS 'The identifier for the cost option. Each entry must have a unique identifier';


--
-- Name: COLUMN cost_option.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.cost_option.service_id IS 'The identifier of the services for which the entry describes the cost.';


--
-- Name: COLUMN cost_option.valid_from; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.cost_option.valid_from IS 'The date when this price is valid from.';


--
-- Name: COLUMN cost_option.valid_to; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.cost_option.valid_to IS 'The date when this price is valid to.';


--
-- Name: COLUMN cost_option.option; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.cost_option.option IS 'Conditions associated with the cost option.';


--
-- Name: COLUMN cost_option.currency; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.cost_option.currency IS 'The 3 letter currency code of this cost option (expected to be gbp by Open Referral UK).';


--
-- Name: COLUMN cost_option.amount; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.cost_option.amount IS 'The cost of the option, expressed as an amount.';


--
-- Name: COLUMN cost_option.amount_description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.cost_option.amount_description IS 'Specific details qualifying the cost amount.';


--
-- Name: funding; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.funding (
    id character varying(250) NOT NULL,
    organization_id character varying(250),
    service_id character varying(250),
    source text
);


--
-- Name: COLUMN funding.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.funding.id IS 'The identifier for the funding. Each entry must have a unique identifier.';


--
-- Name: COLUMN funding.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.funding.organization_id IS 'The identifier of the organization in receipt of this funding.';


--
-- Name: COLUMN funding.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.funding.service_id IS 'The identifier of the service in receipt of this funding.';


--
-- Name: COLUMN funding.source; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.funding.source IS 'A free text description of the source of funds for this organization or service.';


--
-- Name: language; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.language (
    id character varying(250) NOT NULL,
    service_id character varying(250),
    location_id character varying(250),
    phone_id character varying(250),
    name text,
    code text,
    note text
);


--
-- Name: COLUMN language.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.id IS 'The identifier for the language. Each entry must have a unique identifier.';


--
-- Name: COLUMN language.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.service_id IS 'The identifier of the service for which the entry describes the languages in which services are delivered.';


--
-- Name: COLUMN language.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.location_id IS 'The identifier of the location for which the entry describes the languages in which services are delivered.';


--
-- Name: COLUMN language.phone_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.phone_id IS 'The identifier of the phone for which the entry describes the languages in which services delivered.';


--
-- Name: COLUMN language.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.name IS 'The name of the language in which the service is delivered.';


--
-- Name: COLUMN language.code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.code IS 'The ISO 639-1 or ISO 639-3 code for the language.';


--
-- Name: COLUMN language.note; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.language.note IS 'A free text description of any additional context or services provided for this language.';


--
-- Name: location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location (
    id character varying(250) NOT NULL,
    location_type public.location_location_type_enum NOT NULL,
    url text,
    organization_id character varying(250),
    name text,
    alternate_name text,
    description text,
    transportation text,
    latitude numeric,
    longitude numeric,
    external_identifier text,
    external_identifier_type text,
    is_canonical boolean DEFAULT false,
    CONSTRAINT location_canonical_coordinates_check CHECK (((is_canonical = false) OR ((latitude IS NOT NULL) AND (longitude IS NOT NULL))))
);


--
-- Name: COLUMN location.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.id IS 'The identifier of the location. Each location must have a unique identifier.';


--
-- Name: COLUMN location.location_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.location_type IS 'The type of location, which may be either `physical`, `postal`, or `virtual`.';


--
-- Name: COLUMN location.url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.url IS 'If location_type is virtual, then this field represents the URL of a virtual location.';


--
-- Name: COLUMN location.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.organization_id IS 'The organization identifier for a location. This is the organization that is responsible for maintaining information about this location. The identifier of the organization should be given here. Details of the services the organization delivers at this location should be provided in the services_at_location table.';


--
-- Name: COLUMN location.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.name IS 'The name of the location.';


--
-- Name: COLUMN location.alternate_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.alternate_name IS 'An (optional) alternative name of the location.';


--
-- Name: COLUMN location.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.description IS 'A free text description of the location.';


--
-- Name: COLUMN location.transportation; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.transportation IS 'A free text description of the access to public or private transportation to and from the location.';


--
-- Name: COLUMN location.latitude; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.latitude IS 'The latitude of the location expressed in decimal degrees in WGS84 datum.';


--
-- Name: COLUMN location.longitude; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.longitude IS 'The longitude of the location expressed in decimal degrees in WGS84 datum.';


--
-- Name: COLUMN location.external_identifier; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.external_identifier IS 'A third party identifier for the location, which can be drawn from other services e.g. UK UPRN.';


--
-- Name: COLUMN location.external_identifier_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.location.external_identifier_type IS 'The scheme used for the location''s external_identifier e.g. UK UPRN.';


--
-- Name: location_source; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.location_source (
    id character varying(250) NOT NULL,
    location_id character varying(250) NOT NULL,
    scraper_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    location_type character varying(50) DEFAULT 'physical'::character varying,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: location_merged_view; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.location_merged_view AS
 SELECT l.id,
    l.name,
    l.description,
    l.latitude,
    l.longitude,
    l.location_type,
    json_object_agg(ls.scraper_id, json_build_object('id', ls.id, 'name', ls.name, 'description', ls.description, 'latitude', ls.latitude, 'longitude', ls.longitude)) AS source_data,
    json_object_agg('name',
        CASE
            WHEN (l.name = (ls.name)::text) THEN ls.scraper_id
            ELSE NULL::character varying
        END) FILTER (WHERE (l.name = (ls.name)::text)) AS field_sources
   FROM (public.location l
     JOIN public.location_source ls ON (((l.id)::text = (ls.location_id)::text)))
  WHERE (l.is_canonical = true)
  GROUP BY l.id, l.name, l.description, l.latitude, l.longitude, l.location_type;


--
-- Name: meta_table_description; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.meta_table_description (
    id character varying(250) NOT NULL,
    name text,
    language text,
    character_set text
);


--
-- Name: COLUMN meta_table_description.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.meta_table_description.id IS 'The identifier for the metadata description. Each entry must have a unique identifier.';


--
-- Name: COLUMN meta_table_description.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.meta_table_description.name IS 'The name for the metadata description.';


--
-- Name: COLUMN meta_table_description.language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.meta_table_description.language IS 'The ISO 639-1 or ISO 639-3 code for the language of the metadata description.';


--
-- Name: COLUMN meta_table_description.character_set; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.meta_table_description.character_set IS 'The character set of the metadata description.';


--
-- Name: metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.metadata (
    id character varying(250) NOT NULL,
    resource_id text NOT NULL,
    resource_type text NOT NULL,
    last_action_date date NOT NULL,
    last_action_type text NOT NULL,
    field_name text NOT NULL,
    previous_value text NOT NULL,
    replacement_value text NOT NULL,
    updated_by text NOT NULL
);


--
-- Name: COLUMN metadata.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.id IS 'The identifier for this metadata. Each entry must have a unique identifier.';


--
-- Name: COLUMN metadata.resource_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.resource_id IS 'The identifier of the resource (service, program, location, address, or contact) that this metadata describes.';


--
-- Name: COLUMN metadata.resource_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.resource_type IS 'The type of entity being referenced.';


--
-- Name: COLUMN metadata.last_action_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.last_action_date IS 'The date when data was changed.';


--
-- Name: COLUMN metadata.last_action_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.last_action_type IS 'The kind of change made to the data.';


--
-- Name: COLUMN metadata.field_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.field_name IS 'The name of field that has been modified.';


--
-- Name: COLUMN metadata.previous_value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.previous_value IS 'The previous value of the field that has been modified.';


--
-- Name: COLUMN metadata.replacement_value; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.replacement_value IS 'The new value of the field that has been modified.';


--
-- Name: COLUMN metadata.updated_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.metadata.updated_by IS 'The name of the person who modified the field.';


--
-- Name: organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization (
    id character varying(250) NOT NULL,
    name text NOT NULL,
    alternate_name text,
    description text NOT NULL,
    email text,
    website text,
    tax_status text,
    tax_id text,
    year_incorporated numeric,
    legal_status text,
    logo text,
    uri text,
    parent_organization_id text,
    normalized_name text NOT NULL
);


--
-- Name: COLUMN organization.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.id IS 'The identifier for the organization. Each organization must have a unique identifier.';


--
-- Name: COLUMN organization.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.name IS 'The official or public name of the organization.';


--
-- Name: COLUMN organization.alternate_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.alternate_name IS 'An (optional) alternative or commonly used name for the organization.';


--
-- Name: COLUMN organization.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.description IS 'A free text description containing a brief summary about the organization. It can contain markup such as HTML or Markdown.';


--
-- Name: COLUMN organization.email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.email IS 'The contact e-mail address for the organization.';


--
-- Name: COLUMN organization.website; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.website IS 'The URL (website address) of the organization.';


--
-- Name: COLUMN organization.tax_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.tax_status IS 'DEPRECATED: Government assigned tax designation for tax-exempt organizations.';


--
-- Name: COLUMN organization.tax_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.tax_id IS 'DEPRECATED: A government issued identifier used for the purpose of tax administration.';


--
-- Name: COLUMN organization.year_incorporated; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.year_incorporated IS 'The year in which the organization was legally formed.';


--
-- Name: COLUMN organization.legal_status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.legal_status IS 'The legal conditions that an organization is operating under.';


--
-- Name: COLUMN organization.logo; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.logo IS 'A URL to an image associated with the organization which can be presented alongside its name.';


--
-- Name: COLUMN organization.uri; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.uri IS 'A persistent identifier to uniquely identify the organization such as those provided by Open Corporates or some other relevant URI provider. This is not for listing the website of the organization: that can be done through the website field of the Organization.';


--
-- Name: COLUMN organization.parent_organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization.parent_organization_id IS 'The identifier of the organization''s parent organization.';


--
-- Name: organization_identifier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_identifier (
    id character varying(250) NOT NULL,
    organization_id character varying(250) NOT NULL,
    identifier_scheme text,
    identifier_type text NOT NULL,
    identifier text NOT NULL
);


--
-- Name: COLUMN organization_identifier.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization_identifier.id IS 'The identifier for this organization identifier entry. Each entry must have a unique identifier.';


--
-- Name: COLUMN organization_identifier.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization_identifier.organization_id IS 'The identifier of the organization. This should match the uuid of an organization object.';


--
-- Name: COLUMN organization_identifier.identifier_scheme; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization_identifier.identifier_scheme IS 'The scheme of the third party identifier, according to http://org-id.guide/.';


--
-- Name: COLUMN organization_identifier.identifier_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization_identifier.identifier_type IS 'A human-readable equivalent of the identifier_scheme. This may be used in cases where org-id.guide does not list an appropriate identifier scheme.';


--
-- Name: COLUMN organization_identifier.identifier; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.organization_identifier.identifier IS 'The third-party identifier value.';


--
-- Name: organization_source; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organization_source (
    id character varying(250) NOT NULL,
    organization_id character varying(250) NOT NULL,
    scraper_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    website character varying(255),
    email character varying(255),
    year_incorporated integer,
    legal_status character varying(50),
    tax_status character varying(50),
    tax_id character varying(50),
    uri character varying(255),
    parent_organization_id character varying(250),
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: phone; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.phone (
    id character varying(250) NOT NULL,
    location_id character varying(250),
    service_id character varying(250),
    organization_id character varying(250),
    contact_id character varying(250),
    service_at_location_id character varying(250),
    number text NOT NULL,
    extension numeric,
    type text,
    description text
);


--
-- Name: COLUMN phone.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.id IS 'The identifier for the phone number. Each entry must have a unique identifier.';


--
-- Name: COLUMN phone.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.location_id IS 'The identifier of the location where this phone number is located.';


--
-- Name: COLUMN phone.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.service_id IS 'The identifier of the service for which this is the phone number.';


--
-- Name: COLUMN phone.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.organization_id IS 'The identifier of the organization for which this is the phone number.';


--
-- Name: COLUMN phone.contact_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.contact_id IS 'The identifier of the contact for which this is the phone number.';


--
-- Name: COLUMN phone.service_at_location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.service_at_location_id IS 'The identifier of the ‘service at location’ table entry, when this phone number is specific to a service in a particular location.';


--
-- Name: COLUMN phone.number; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.number IS 'The phone number.';


--
-- Name: COLUMN phone.extension; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.extension IS 'The extension of the phone number.';


--
-- Name: COLUMN phone.type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.type IS 'Indicates the type of phone service, drawing from the RFC6350 list of types (text (for SMS), voice, fax, cell, video, pager, textphone).';


--
-- Name: COLUMN phone.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.phone.description IS 'A free text description providing extra information about the phone service';


--
-- Name: program; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.program (
    id character varying(250) NOT NULL,
    organization_id character varying(250) NOT NULL,
    name text NOT NULL,
    alternate_name text,
    description text NOT NULL
);


--
-- Name: COLUMN program.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.program.id IS 'The identifier for the program. Each program must have a unique identifier.';


--
-- Name: COLUMN program.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.program.organization_id IS 'The identifier for the organization which the program belongs to. Each program must belong to a single organization, and the identifier for that organization should be given here.';


--
-- Name: COLUMN program.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.program.name IS 'The name of the program.';


--
-- Name: COLUMN program.alternate_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.program.alternate_name IS 'The (optional) alternative name for the program.';


--
-- Name: COLUMN program.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.program.description IS 'A free text description of the program';


--
-- Name: reconciler_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reconciler_config (
    key character varying(100) NOT NULL,
    value text NOT NULL,
    description text,
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: reconciler_constraint_violations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reconciler_constraint_violations (
    id integer NOT NULL,
    constraint_name character varying(100) NOT NULL,
    table_name character varying(100) NOT NULL,
    operation character varying(20) NOT NULL,
    conflicting_data jsonb,
    resolved boolean DEFAULT false,
    created_at timestamp with time zone DEFAULT now(),
    resolved_at timestamp with time zone
);


--
-- Name: reconciler_constraint_violations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reconciler_constraint_violations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reconciler_constraint_violations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reconciler_constraint_violations_id_seq OWNED BY public.reconciler_constraint_violations.id;


--
-- Name: record_version; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.record_version (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    record_id uuid NOT NULL,
    record_type text NOT NULL,
    version_num integer NOT NULL,
    data jsonb NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    created_by text,
    source_id character varying(250)
);


--
-- Name: TABLE record_version; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.record_version IS 'Tracks version history for HSDS records';


--
-- Name: COLUMN record_version.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.record_version.id IS 'Unique identifier for version record';


--
-- Name: COLUMN record_version.record_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.record_version.record_id IS 'ID of the HSDS record being versioned';


--
-- Name: COLUMN record_version.record_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.record_version.record_type IS 'Type of HSDS record (organization, service, location)';


--
-- Name: COLUMN record_version.version_num; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.record_version.version_num IS 'Sequential version number for this record';


--
-- Name: COLUMN record_version.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.record_version.data IS 'Complete record data at this version';


--
-- Name: COLUMN record_version.created_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.record_version.created_at IS 'When this version was created';


--
-- Name: COLUMN record_version.created_by; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.record_version.created_by IS 'What created this version';


--
-- Name: required_document; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.required_document (
    id character varying(250) NOT NULL,
    service_id character varying(250),
    document text,
    uri text
);


--
-- Name: COLUMN required_document.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.required_document.id IS 'The identifier for the document. Each document must have a unique identifier.';


--
-- Name: COLUMN required_document.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.required_document.service_id IS 'The identifier of the service for which this entry describes the required document.';


--
-- Name: COLUMN required_document.document; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.required_document.document IS 'A free text description of the document required to apply for or receive the service.';


--
-- Name: COLUMN required_document.uri; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.required_document.uri IS 'A web link to the document.';


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schedule (
    id character varying(250) NOT NULL,
    service_id character varying(250),
    location_id character varying(250),
    service_at_location_id character varying(250),
    valid_from date,
    valid_to date,
    dtstart date,
    timezone numeric,
    until date,
    count numeric,
    wkst public.schedule_wkst_enum,
    freq public.schedule_freq_enum,
    "interval" numeric,
    byday text,
    byweekno text,
    bymonthday text,
    byyearday text,
    description text,
    opens_at time without time zone,
    closes_at time without time zone,
    schedule_link text,
    attending_type text,
    notes text
);


--
-- Name: COLUMN schedule.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.id IS 'The identifier for the schedule. Each entry must have a unique identifier.';


--
-- Name: COLUMN schedule.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.service_id IS 'The identifier of the service for which this is the regular schedule';


--
-- Name: COLUMN schedule.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.location_id IS 'The identifier of the location for which this is the regular schedule';


--
-- Name: COLUMN schedule.service_at_location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.service_at_location_id IS 'The identifier of the ‘service at location’ table entry, when this schedule is specific to a service in a particular location.';


--
-- Name: COLUMN schedule.valid_from; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.valid_from IS 'The date from which the schedule information is valid. It must be in the ISO 8601 format of YYYY-MM-DD,';


--
-- Name: COLUMN schedule.valid_to; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.valid_to IS 'The last date on which the schedule information is valid. It must be in the ISO 8601 format of YYYY-MM-DD.';


--
-- Name: COLUMN schedule.dtstart; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.dtstart IS 'iCal - The date of the first event is the schedule. Necessary when using the ‘interval’ feature, optional otherwise.';


--
-- Name: COLUMN schedule.timezone; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.timezone IS 'The timezone that all dates are expressed as, expressed as a UTC offset. Dates are assumed to be UTC otherwise.';


--
-- Name: COLUMN schedule.until; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.until IS 'iCal - The date of the last occurrence of the recurring event.';


--
-- Name: COLUMN schedule.count; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.count IS 'iCal - The number of times that the event occurs. Use this instead of ‘until’, if appropriate.';


--
-- Name: COLUMN schedule.wkst; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.wkst IS 'iCal - The two-letter code for the day on which the week starts: `MO`, `TU`, `WE`, `TH`, `FR`, `FR`, `SA`, `SU`';


--
-- Name: COLUMN schedule.freq; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.freq IS 'iCal - How often the frequency repeats. Values can be `WEEKLY` or `MONTHLY`';


--
-- Name: COLUMN schedule."interval"; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule."interval" IS 'iCal - How often the frequency repeats. For example, and Interval of 2 for a WEEKLY Frequency would represent fortnightly.';


--
-- Name: COLUMN schedule.byday; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.byday IS 'iCal - Comma separated days of the week. Where freq is MONTHLY each part can be preceded by a positive or negative integer to represent which occurrence in a month; e.g. 2MO is the second Monday in a month. -1FR is the last Friday';


--
-- Name: COLUMN schedule.byweekno; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.byweekno IS 'iCal - Comma separated numeric weeks of the year, where freq is WEEKLY. Can be negative to represent weeks before the end of the year; e.g. -5 is the 5th to last week in a year.';


--
-- Name: COLUMN schedule.bymonthday; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.bymonthday IS 'iCal - Comma separated numeric days of the month, where frequency is MONTHLY. Can be negative to represent days before the end of the month; e.g. -5 is the 5th to last day in a month.';


--
-- Name: COLUMN schedule.byyearday; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.byyearday IS 'iCal - Comma separated numeric days of the month, where frequency is YEARLY. Can be negative to represent days before the end of the year; e.g. -1 is the last day in a year.';


--
-- Name: COLUMN schedule.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.description IS 'A free text description of the availability of the service.';


--
-- Name: COLUMN schedule.opens_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.opens_at IS 'The time when a service or location opens. This should use HH:MM format and should include timezone information, either adding the suffix ‘Z’ when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.)';


--
-- Name: COLUMN schedule.closes_at; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.closes_at IS 'The time when a service or location closes. This should use HH:MM format and should include timezone information, either adding the suffix ‘Z’ when the date is in UTC, or including an offset from UTC (e.g. 09:00-05:00 for 9am EST.).';


--
-- Name: COLUMN schedule.schedule_link; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.schedule_link IS 'URL of a link for the schedule which may show each individual session and may provide a booking facility.';


--
-- Name: COLUMN schedule.attending_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.attending_type IS 'A free text description of how to attend this service.';


--
-- Name: COLUMN schedule.notes; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.schedule.notes IS 'Free text notes on the schedule.';


--
-- Name: service; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service (
    id character varying(250) NOT NULL,
    organization_id character varying(250) NOT NULL,
    program_id character varying(250),
    name text NOT NULL,
    alternate_name text,
    description text,
    url text,
    email text,
    status public.service_status_enum NOT NULL,
    interpretation_services text,
    application_process text,
    fees_description text,
    wait_time text,
    fees text,
    accreditations text,
    eligibility_description text,
    minimum_age numeric,
    maximum_age numeric,
    assured_date date,
    assurer_email text,
    licenses text,
    alert text,
    last_modified timestamp without time zone
);


--
-- Name: COLUMN service.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.id IS 'The identifier for the service. Each service must have a unique identifier.';


--
-- Name: COLUMN service.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.organization_id IS 'The identifier of the organization that provides this service.';


--
-- Name: COLUMN service.program_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.program_id IS 'The identifier of the program this service is delivered under.';


--
-- Name: COLUMN service.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.name IS 'The official or public name of the service.';


--
-- Name: COLUMN service.alternate_name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.alternate_name IS 'An (optional) alternative name for this service.';


--
-- Name: COLUMN service.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.description IS 'A free text description of the service.';


--
-- Name: COLUMN service.url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.url IS 'URL of the service';


--
-- Name: COLUMN service.email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.email IS 'An email address which can be used to contact the service provider.';


--
-- Name: COLUMN service.status; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.status IS 'The current status of the service which can be active, inactive, defunct, or temporarily closed.';


--
-- Name: COLUMN service.interpretation_services; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.interpretation_services IS 'A free text description of any interpretation services available for accessing this service.';


--
-- Name: COLUMN service.application_process; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.application_process IS 'A free text description of the steps needed to access this service.';


--
-- Name: COLUMN service.fees_description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.fees_description IS 'A free text description of any charges for service users to access this service.';


--
-- Name: COLUMN service.wait_time; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.wait_time IS 'DEPRECATED: The time a client may expect to wait before receiving a service.';


--
-- Name: COLUMN service.fees; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.fees IS 'DEPRECATED: Details of any charges for service users to access this service.';


--
-- Name: COLUMN service.accreditations; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.accreditations IS 'A free text description of any accreditations. Accreditation is the formal evaluation of an organization or program against best practice standards set by an accrediting organization.';


--
-- Name: COLUMN service.eligibility_description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.eligibility_description IS 'A free text description of the type of person for whom this service is intended.';


--
-- Name: COLUMN service.minimum_age; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.minimum_age IS 'The minimum age of a person required to meet this eligibility requirement.';


--
-- Name: COLUMN service.maximum_age; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.maximum_age IS 'The maximum age of a person required to meet this eligibility requirement.';


--
-- Name: COLUMN service.assured_date; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.assured_date IS 'The date that the information about the service was last checked.';


--
-- Name: COLUMN service.assurer_email; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.assurer_email IS 'The contact e-mail address for the person or organization which last assured the service.';


--
-- Name: COLUMN service.licenses; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.licenses IS 'DEPRECATED: An organization may have a license issued by a government entity to operate legally. A list of any such licenses can be provided here.';


--
-- Name: COLUMN service.alert; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.alert IS 'A description of any short term alerts concerning the service.';


--
-- Name: COLUMN service.last_modified; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service.last_modified IS 'The datetime when the service, or any related information about the service, has changed. Should have millisecond accuracy.';


--
-- Name: service_area; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_area (
    id character varying(250) NOT NULL,
    service_id character varying(250),
    service_at_location_id character varying(250),
    name text,
    description text,
    extent text,
    extent_type text,
    uri text
);


--
-- Name: COLUMN service_area.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.id IS 'The identifier for the service area. Each service area must have a unique identifier.';


--
-- Name: COLUMN service_area.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.service_id IS 'The identifier of the service for which this entry describes the service area';


--
-- Name: COLUMN service_area.service_at_location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.service_at_location_id IS 'The identifier of the service at location object linked to this object.';


--
-- Name: COLUMN service_area.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.name IS 'A free text geographic area where a service is available.';


--
-- Name: COLUMN service_area.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.description IS 'A more detailed free text description of this service area. Used to provide any additional information that cannot be communicated using the structured area and geometry fields.';


--
-- Name: COLUMN service_area.extent; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.extent IS 'A definition of the polygon defining the area.';


--
-- Name: COLUMN service_area.extent_type; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.extent_type IS 'The format of the extent field  populated from an enum of  "geojson", "topojson",  "kml",and (for legacy systems or early state during transformation) "text".';


--
-- Name: COLUMN service_area.uri; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_area.uri IS 'A URI which acts as a persistent identifier to identify an area.';


--
-- Name: service_at_location; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_at_location (
    id character varying(250) NOT NULL,
    service_id character varying(250) NOT NULL,
    location_id character varying(250) NOT NULL,
    description text
);


--
-- Name: COLUMN service_at_location.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_at_location.id IS 'The identifier of the service at location entry. Each entry must have a unique identifier.';


--
-- Name: COLUMN service_at_location.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_at_location.service_id IS 'The identifier of the service at a given location.';


--
-- Name: COLUMN service_at_location.location_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_at_location.location_id IS 'The identifier of the location where this service operates.';


--
-- Name: COLUMN service_at_location.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_at_location.description IS 'A free text description of the service at this specific location.';


--
-- Name: service_capacity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_capacity (
    id character varying(250) NOT NULL,
    service_id character varying(250) NOT NULL,
    unit_id character varying(250) NOT NULL,
    available numeric NOT NULL,
    maximum numeric,
    description text,
    updated timestamp without time zone NOT NULL
);


--
-- Name: COLUMN service_capacity.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_capacity.id IS 'The identifier for the service_capacity object. Each service_capacity must have a unique identifier.';


--
-- Name: COLUMN service_capacity.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_capacity.service_id IS 'The identifier for the Service object associated with this service capacity object. Only required in the tabular representation.';


--
-- Name: COLUMN service_capacity.unit_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_capacity.unit_id IS 'The identifier for the unit object.';


--
-- Name: COLUMN service_capacity.available; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_capacity.available IS 'The number of units available as of the last update.';


--
-- Name: COLUMN service_capacity.maximum; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_capacity.maximum IS 'The maximum number of units that can be available for this service, if applicable';


--
-- Name: COLUMN service_capacity.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_capacity.description IS 'A Human-Friendly description of this service capacity e.g. “Beds available for people experiencing homelessness”';


--
-- Name: COLUMN service_capacity.updated; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.service_capacity.updated IS 'The datetime when this service_capacit y object was last updated or changed. Should have millisecond accuracy. ';


--
-- Name: service_source; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_source (
    id character varying(250) NOT NULL,
    service_id character varying(250) NOT NULL,
    scraper_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    organization_id character varying(250),
    status character varying(50) DEFAULT 'active'::character varying,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


--
-- Name: taxonomy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taxonomy (
    id character varying(250) NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    uri text,
    version text
);


--
-- Name: COLUMN taxonomy.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy.id IS 'The identifier of the taxonomy. Each entry must have a unique identifier';


--
-- Name: COLUMN taxonomy.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy.name IS 'The name of the taxonomy from which terms are sourced.';


--
-- Name: COLUMN taxonomy.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy.description IS 'A free text description of the taxonomy.';


--
-- Name: COLUMN taxonomy.uri; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy.uri IS 'The URI of the taxonomy.';


--
-- Name: COLUMN taxonomy.version; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy.version IS 'The version of the taxonomy.';


--
-- Name: taxonomy_term; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.taxonomy_term (
    id character varying(250) NOT NULL,
    code text,
    name text NOT NULL,
    description text NOT NULL,
    parent_id text,
    taxonomy text,
    language text,
    taxonomy_id character varying(250),
    term_uri text
);


--
-- Name: COLUMN taxonomy_term.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.id IS 'The identifier for this taxonomy term. Each taxonomy term must have a unique identifier, within the scope of the dataset.';


--
-- Name: COLUMN taxonomy_term.code; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.code IS 'The term identfier as used in the taxonomy. This and the taxonomy_id combined define the term.';


--
-- Name: COLUMN taxonomy_term.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.name IS 'The taxonomy term itself.';


--
-- Name: COLUMN taxonomy_term.description; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.description IS 'A free text description of the term.';


--
-- Name: COLUMN taxonomy_term.parent_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.parent_id IS 'If this is a child term in a hierarchical taxonomy, give the identifier of the parent category. For top-level categories, this is not required.';


--
-- Name: COLUMN taxonomy_term.taxonomy; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.taxonomy IS 'If this is an established taxonomy, a free text description of which taxonomy is in use. If possible, provide a URI.';


--
-- Name: COLUMN taxonomy_term.language; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.language IS 'An ISO 639-1, ISO 639-2, or ISO 639-3 [language code](http://www.loc.gov/standards/iso639-2/php/code_list.php) to represent the language of the term. The three-letter codes from ISO 639-2 and ISO 639-3 provide greater accuracy when describing variants of languages, which may be relevant to particular communities.';


--
-- Name: COLUMN taxonomy_term.taxonomy_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.taxonomy_id IS 'The identifier of the taxonomy containing the term.';


--
-- Name: COLUMN taxonomy_term.term_uri; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.taxonomy_term.term_uri IS 'URI of the term.';


--
-- Name: unit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.unit (
    id character varying(250) NOT NULL,
    name text NOT NULL,
    scheme text,
    identifier text,
    uri text
);


--
-- Name: COLUMN unit.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.unit.id IS 'The identifier for the unit object. Each unit must have a unique identifier.';


--
-- Name: COLUMN unit.name; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.unit.name IS 'The human-readable name for this unit e.g. “Bed” or “Hours”';


--
-- Name: COLUMN unit.scheme; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.unit.scheme IS 'The scheme which formalizes the unit, if applicable e.g. “SI” for Standard International Units such as Kilogram, Litre, etc.';


--
-- Name: COLUMN unit.identifier; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.unit.identifier IS 'The identifier of the unit taken from the scheme if applicable e.g. `kgm` for Kilogram.';


--
-- Name: COLUMN unit.uri; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.unit.uri IS 'The URI to the definition of the unit, if applicable';


--
-- Name: url; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.url (
    id character varying(250) NOT NULL,
    label text,
    url text NOT NULL,
    organization_id character varying(250),
    service_id character varying(250)
);


--
-- Name: COLUMN url.id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.url.id IS 'The identifier for the URL object. Each URL must have a unique identifier.';


--
-- Name: COLUMN url.label; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.url.label IS 'The human-readable label for this url e.g. “Twitter” or “Website”.';


--
-- Name: COLUMN url.url; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.url.url IS 'The URL for this URL object. This must be formatted as a valid URI.';


--
-- Name: COLUMN url.organization_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.url.organization_id IS 'The identifier for the organization associated with this URL object';


--
-- Name: COLUMN url.service_id; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN public.url.service_id IS 'The identifier for the service associated with this URL object';


--
-- Name: reconciler_constraint_violations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reconciler_constraint_violations ALTER COLUMN id SET DEFAULT nextval('public.reconciler_constraint_violations_id_seq'::regclass);


--
-- Data for Name: accessibility; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.accessibility (id, location_id, description, details, url) FROM stdin;
\.


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.address (id, location_id, attention, address_1, address_2, city, region, state_province, postal_code, country, address_type) FROM stdin;
\.


--
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.attribute (id, link_id, taxonomy_term_id, link_type, link_entity, value, label) FROM stdin;
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contact (id, organization_id, service_id, service_at_location_id, location_id, name, title, department, email) FROM stdin;
\.


--
-- Data for Name: cost_option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cost_option (id, service_id, valid_from, valid_to, option, currency, amount, amount_description) FROM stdin;
\.


--
-- Data for Name: funding; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.funding (id, organization_id, service_id, source) FROM stdin;
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.language (id, service_id, location_id, phone_id, name, code, note) FROM stdin;
00998fe1-52d4-4684-98d0-bebc1ad9074a	\N	\N	9ce5604c-ffb5-4003-b590-36e04af814ae	English		\N
d3ca5ee7-1726-4429-898d-3381f438debb	\N	\N	9e1867d7-b07f-4509-8183-e1fa7327f716	English		\N
493da5c8-7cef-4e1f-8cde-1c139e0840f6	\N	\N	40ee2395-7077-43ea-a0c2-2ece0c3e823f	English		\N
6251e9a8-e82e-4641-86c0-1a57aa984c1f	\N	\N	0547a4b0-0b98-4455-9e42-b0c9d6afb26e	English		\N
627dc7d6-7e0f-4e9e-be71-a2705627345f	\N	\N	bfccdc75-ed81-44b2-8fd3-7f898f919500	English		\N
d90bf27a-3c9c-4477-949d-efb71212bef8	\N	\N	478f823e-a1c4-46f0-a718-022ed687710a	English		\N
0609713d-2770-47dc-9fa8-207129a20319	\N	\N	50baf5c9-3f5a-49c3-974d-d131583c41e7	English		\N
6a1d1440-36da-467b-818a-7cb7f72a9a90	\N	\N	bc01d89f-799e-431e-b1af-125d83cf7872	English		\N
aadecc7d-6ab8-43ff-9dcb-7431443dee39	\N	\N	8d79c8c9-c252-40d2-8dad-cc64cca747d6	English		\N
6eb95ab7-11bf-4a90-a280-555317b2f357	\N	\N	307576b2-71df-47e1-b3e2-bdf54c69a45d	English		\N
a95f8fbf-6f44-4f1d-a57e-6123ea57719e	\N	\N	4cbe2f9a-05b3-420e-8a45-9676b27c15de	English		\N
ffbf9af1-9e3f-406b-8ea8-1c669f5a5524	\N	\N	1fcf3631-b0ee-40f3-b7cf-51f66bb7804d	English		\N
933ca5b0-e129-4814-8307-cd0753e45bc3	\N	\N	f6e1ffb7-cd53-433f-9c5d-48d44cefa241	English		\N
24f56a7e-f39d-42ec-b0e4-e6cd84bf45a7	\N	\N	0155542e-c295-4538-96d7-d158ef3e911a	English		\N
4c50c003-396b-41e3-8a02-73ad11270e78	\N	\N	7c1a37c3-f9dd-483d-97dd-dec5c064d13c	English		\N
d48f4610-7c09-4971-a2b9-283598a85ac2	\N	\N	bdc07b7c-64ff-4f30-b857-5250e006db8f	English		\N
0ceb8ef0-ddcd-41f7-9abe-5e33316aabeb	\N	\N	bf6bd9b2-352e-47f0-a7ae-d0f536f79eab	English		\N
6bfb6ec0-7af2-49ac-99ec-3dbc42c88470	\N	\N	46abd91f-f1d7-478a-9721-cd4e91eb16a1	English		\N
11e9d2ab-3432-44c0-8526-f66b7548da89	\N	\N	90e2d448-4cf1-4baf-bd1d-36f8e66d5adc	English		\N
46dea2a7-0469-404f-9fa0-aecb2fc9fb6e	\N	\N	ac1078bc-070b-41c6-a4c0-9cc193c548ce	English		\N
8412498f-70ae-4859-9c08-724f64aa356a	\N	\N	b182fb63-8614-48cd-8ca1-94808fd1ac63	English		\N
401432b5-9d70-49c7-9ab4-7578c4b11cb1	\N	\N	a163f68c-d79b-404b-92d6-41ddf10893d1	English		\N
29da2275-5083-4ea5-b6d0-523245e7f4b5	\N	\N	487441ad-cf22-4854-a253-dee9a3ead5ed	English		\N
178931de-f106-4a25-b6da-4ef769a4abce	\N	\N	70d37233-148d-47f8-afe4-27d99ab7babb	English		\N
fe31728d-79a2-4369-82a2-f65165249bd4	\N	\N	e33c687f-31b2-4698-a297-068cf85b577d	English		\N
5c0cfb4d-ebd5-470b-afba-5810efe86ddc	\N	\N	73954d9e-cac9-4dba-91a3-c31a3905f58c	English		\N
11ab16ea-cc05-46e2-8422-3c20ed6df41f	\N	\N	b1d87fdc-25ee-4bdf-bca7-8df466773e2c	English		\N
c7cc085d-1d58-4d53-b8fa-5a34fd0091ba	\N	\N	0cc6c879-fb05-4a8e-b201-cfc277a6cd8c	English		\N
2812cfd5-6105-408d-ad4e-d87b770142ff	\N	\N	fef5ee0f-4b28-44d8-b47e-2b1b93a82e9b	English		\N
2d407fde-5044-4d11-a9b4-741c4f8b8378	\N	\N	5e03e64d-bdc2-4f19-93a9-d20ab2a59ac0	English		\N
ed2c4e74-a3c0-4818-bf2c-de0608db50e7	\N	\N	d6941d66-9e1e-4e8e-bbc0-33b97727e137	English		\N
3441a01e-0f03-4b08-9b6a-cc2d6a9680ac	\N	\N	f9f900ab-4f20-463c-97ac-4931736f0a44	English		\N
c3881fd0-fb7f-4544-bb6d-d753d39c5321	\N	\N	84cc6ee7-93b9-4e99-abcf-306972b19c60	English		\N
002dc2e7-e6a3-4dd7-b447-638cdeb1a831	\N	\N	b92dd3f8-d432-4043-959b-8c1ea9457b13	English		\N
dadfea44-de97-4716-acf1-ef909fa85c2b	\N	\N	71fb205b-f044-4c38-a808-1ffc9325eb9a	English		\N
5af06f23-f7bd-4323-9775-8d81b580b30d	\N	\N	88d04214-2dab-4d01-998b-53c93cadb7d9	English		\N
8793f06a-b372-4b26-aa7d-4ddfcedaf4f1	\N	\N	dbca1166-be1d-4507-ab6f-0d86a76b8c4c	English		\N
95f3abb4-4048-4bdf-aef2-6a1d794ab0f3	\N	\N	b22c082c-09e7-44a4-b5d1-9a7cc36f0b80	English		\N
eac31304-d341-4891-9451-6d81e16b9fcc	\N	\N	a9e034b2-ef86-4ba4-babe-33cee88266ac	English		\N
fc8a6b43-0efc-47f5-b717-09073df6fe8b	\N	\N	4bc99e7d-b90d-4892-abe2-d5337fc8f752	English		\N
83695ef8-3df5-4f74-8be3-04736fc85b48	\N	\N	59981a4c-1fe7-4019-9053-a2ec1b8a8caf	English		\N
f76abb12-975f-44aa-a668-0e15c372cc43	\N	\N	d7124330-a603-4efa-9d68-07cf605ba5b4	English		\N
d9e20059-9708-4e07-b999-5bb4cdf262ed	\N	\N	d2fd4bba-5091-4153-81d4-9bec8c3b2d66	English		\N
8e6af2eb-fdea-443c-a5e8-1059515da753	\N	\N	275ed9cc-bbc6-4a94-92e6-ca9f1d2c19ac	English		\N
6c8ae594-dab1-4c16-a1d0-ea3c09d32adf	\N	\N	7e01a8fd-448c-4d42-ac6d-649b5fb0597c	English		\N
caf486ca-3236-494e-8933-e71f450e1b25	\N	\N	68b5ec71-8c8e-446b-85c5-a5b5be31c2ce	English		\N
17c97bdc-4f7e-4d4e-86d5-5b7356cf601e	\N	\N	5c8551ea-67d6-42a0-98d7-07ef625ffb8f	English		\N
f15b84c6-9f5c-4456-92ee-bff82a9e8823	\N	\N	e4ee44a7-5882-483d-8a98-16583aabb2c4	English		\N
e3a6e029-978a-4c63-bebc-1225d4fe1b5c	\N	\N	36eaa6ad-38d6-4440-a0a5-d511cb1de6bc	English		\N
998008ea-28d9-41e0-8dcf-c9f704b1cd8f	\N	\N	1ce4b336-e055-455b-bcf0-0c2c37d79002	English		\N
93cb1d1f-6961-4ef4-b5c3-52f885022f56	\N	\N	2d5bc192-ec54-461b-beb5-6daf784833de	English		\N
293d79b7-cc21-452b-bb54-2d9cd9e388c8	\N	\N	df641f5f-2638-4fd3-944a-a13980250351	English		\N
4f3e95ee-9de0-4dfd-8ce1-22fb8d3cf03f	\N	\N	95ba2788-2744-4f42-9b61-ebaa2d7fc9ab	English		\N
eda4f795-918c-4102-bb07-04195baadb40	\N	\N	02f93c68-828f-4932-8aed-09270af2438d	English		\N
48952756-6573-4edc-9bd5-eb8e7c75c6b0	\N	\N	8a82c338-23bb-4aac-9f36-fca4feb63dc0	English		\N
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.location (id, location_type, url, organization_id, name, alternate_name, description, transportation, latitude, longitude, external_identifier, external_identifier_type, is_canonical) FROM stdin;
\.


--
-- Data for Name: location_source; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.location_source (id, location_id, scraper_id, name, description, latitude, longitude, location_type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: meta_table_description; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.meta_table_description (id, name, language, character_set) FROM stdin;
\.


--
-- Data for Name: metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.metadata (id, resource_id, resource_type, last_action_date, last_action_type, field_name, previous_value, replacement_value, updated_by) FROM stdin;
\.


--
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organization (id, name, alternate_name, description, email, website, tax_status, tax_id, year_incorporated, legal_status, logo, uri, parent_organization_id, normalized_name) FROM stdin;
51ac2f64-fff9-4f48-b711-1a697f8ca95d	Anthony Wayne Community Food Ministry, Inc.	\N	A community food ministry providing food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	anthony wayne community food ministry, inc.
b2d53d3a-9b74-43f5-b634-b9e9dcec76d7	Brown Bag Food Project	\N	A food pantry service provider.	\N	\N	\N	\N	\N	\N	\N	\N	\N	brown bag food project
46e0563b-7653-4471-a862-e2e1a366ab71	Christ Church Triumphant	\N	A food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	christ church triumphant
6ab6a80c-75c4-43f9-ae91-36c498c5821a	Blackburn Ministries	\N	A ministry providing food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	blackburn ministries
97edfa8e-11e0-40d4-a929-898067d28342	Aldersgate United Methodist Church	\N	Aldersgate United Methodist Church offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	aldersgate united methodist church
4953c7e5-5219-4974-bf3e-898fcbf90001	Bowling Green Christian Food Pantry	\N	A food pantry located in Bowling Green, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	\N	bowling green christian food pantry
8aeedc32-0ae6-49db-8cbb-6d03debfa0be	Delta Assembly Of God	\N	A food pantry located in Delta, Ohio, affiliated with the Toledo Northwestern Ohio Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	\N	delta assembly of god
bc11aabf-c0ad-4d05-a133-d8d0b42d6be2	Elliston Zion UMC - The L.I.G.H.T Pantry	\N	The L.I.G.H.T Pantry at Elliston Zion UMC provides food assistance.	\N	https://www.ellistonzion.com/	\N	\N	\N	\N	\N	\N	\N	elliston zion umc - the l.i.g.h.t pantry
8e7216fa-4cea-4a28-832f-99e6a63ef221	Catholic Food Pantry	\N	Catholic Food Pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	catholic food pantry
480ae46f-da0f-440f-80ff-add05a25c060	Beach House Family Shelter	\N	Beach House Family Shelter provides shelter services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	beach house family shelter
2cd075d5-177d-4b0e-827b-27d746ec1d4b	City Team	\N	City Team provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	city team
16838842-d076-4e5e-b1fb-3fe49ca0e748	Archbold Fish Pantry	\N	A food pantry located in Archbold, Ohio, affiliated with the Toledo Northwestern Ohio Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	\N	archbold fish pantry
321f76c9-f853-486c-a372-c37a015978cc	Bethel Assembly Of God Church	\N	A church offering food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	bethel assembly of god church
3e423664-a419-45a8-9a05-8b0f9b19495c	Samaritan House	\N	Samaritan House provides food pantry services, including Ready-To-Eat Meals and Walk up options.	\N	\N	\N	\N	\N	\N	\N	\N	\N	samaritan house
e3dd9367-e294-4ad3-9264-8cc8f717550c	Clyde Food Pantry	\N	A food pantry located in Clyde, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	\N	clyde food pantry
a1325dc8-3ae8-4903-b5fa-e1968bceab87	Christ's Cupboard Ministries	\N	A food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	christ's cupboard ministries
ffbe2301-174b-4276-919a-32b3e0e4108e	A.M.E.N (A Meal Encourages Nourishment)	\N	Provides food assistance on the last Sunday of the month from 1:30 PM to 5:30 PM on a first-come, first-served basis for anyone in need.	\N	\N	\N	\N	\N	\N	\N	\N	\N	a.m.e.n (a meal encourages nourishment)
291c5723-d461-422a-a817-8c0ee2506f03	Ecumenical Hunger Program	\N	Ecumenical Hunger Program provides food assistance to those in need.	\N	\N	\N	\N	\N	\N	\N	\N	\N	ecumenical hunger program
bd877b1a-b177-46d2-ba7b-c7b912216a0e	Chicopee Moose Lodge Brown Bag	\N	A food pantry program offering pickups every 3rd Tuesday.	\N	\N	\N	\N	\N	\N	\N	\N	\N	chicopee moose lodge brown bag
324e6d0f-f577-40ff-a350-bf25cde132a8	Second Harvest of Silicon Valley	\N	A food bank serving Silicon Valley.	\N	\N	\N	\N	\N	\N	\N	\N	\N	second harvest of silicon valley
c2f7cdbb-df9e-47f1-b2ea-1fc6c75ddc1c	AIDS Community Resource Consortium	\N	AIDS Community Resource Consortium provides food assistance to low-income, HIV positive individuals in San Mateo County.	\N	\N	\N	\N	\N	\N	\N	\N	\N	aids community resource consortium
82a41089-0c3c-4256-8301-50a2afeff04c	Berwyn United Methodist Church Food Pantry	\N	Food pantry services offered by Berwyn United Methodist Church.	\N	\N	\N	\N	\N	\N	\N	\N	\N	berwyn united methodist church food pantry
066f4a13-2353-4bec-ade2-64b6cf42a503	Community Heart Of Toledo - St. Paul's Lutheran	\N	Community Heart of Toledo, located at St. Paul's Lutheran, provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	community heart of toledo - st. paul's lutheran
faab6503-70f5-4a11-87e7-90c5838308b6	Echo Meadows Church Of Christ	\N	Echo Meadows Church Of Christ is a religious organization that also provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	echo meadows church of christ
5e63caa4-b501-42f8-be89-66edba85836e	Emmanuel Baptist Church	\N	Emmanuel Baptist Church offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	emmanuel baptist church
e0c1617d-0eb5-48e5-8c48-0ede1614acde	Emmaus Lutheran Church	\N	Emmaus Lutheran Church provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	emmaus lutheran church
223abd39-e21d-4963-85d5-bdfe4db71032	F.O.P. 40 Charities Food Pantry	\N	F.O.P. 40 Charities Food Pantry provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	f.o.p. 40 charities food pantry
fde32e1f-604c-4554-9726-56a19f8c8e27	Mission Center New Jerusalem One Way Outreach Pantry	\N	Mission Center New Jerusalem One Way Outreach Pantry offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	mission center new jerusalem one way outreach pantry
c223f130-cbef-4254-9e4f-6419ad504bc0	Cindy's Cafe At St. Lucas Lutheran Church	\N	Cindy's Cafe, located at St. Lucas Lutheran Church in Toledo, Ohio, offers soup kitchen services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	cindy's cafe at st. lucas lutheran church
95480946-02c5-4058-9e73-4243302beeb5	Frazer	\N	Food pantry services provided by Frazer.	\N	\N	\N	\N	\N	\N	\N	\N	\N	frazer
83938a98-6227-43f4-8b94-7a5dad665ca2	Chester County Food Bank	\N	Chester County Food Bank is an organization that provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	chester county food bank
f0205eac-07be-445e-9aca-50738d3bcca9	Lorraine's Soup Kitchen and Pantry Docs Place Mobile Pantry	\N	Lorraine's Soup Kitchen and Pantry operates a mobile pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	lorraine's soup kitchen and pantry docs place mobile pantry
5d62e67d-c5ff-4eca-9134-142c5cbf0720	Our Father's House Dream Center Day	\N	Pantry is open every 4th Saturday of the month from 9:45 – 10:30 a.m.	\N	\N	\N	\N	\N	\N	\N	\N	\N	our father's house dream center day
f6e0dadd-d53c-4b24-a5eb-37e635069f40	Lorraine's Soup Kitchen and Pantry	\N	Lorraine's Soup Kitchen and Pantry operates a mobile food bank, distributing food on the 3rd Tuesday of each month.	\N	\N	\N	\N	\N	\N	\N	\N	\N	lorraine's soup kitchen and pantry
1d5a59a2-4786-44f8-9478-6479e5fc65d5	Fairgreen Presbyterian Church (Feed Your Neighbor)	\N	Fairgreen Presbyterian Church offers a food pantry program called 'Feed Your Neighbor'.	\N	\N	\N	\N	\N	\N	\N	\N	\N	fairgreen presbyterian church (feed your neighbor)
e2aa0ab4-03c2-41df-af5f-ccbdafd8cf20	Glenmoore Salvation Army Food Pantry	\N	A food pantry operated by the Salvation Army in Glenmoore, PA.	\N	\N	\N	\N	\N	\N	\N	\N	\N	glenmoore salvation army food pantry
a85d4032-c780-43bc-bbed-d2d87a7df0b0	Community Action of Napa Valley Food Bank	\N	Community Action of Napa Valley Food Bank provides food assistance to those in need.	\N	\N	\N	\N	\N	\N	\N	\N	\N	community action of napa valley food bank
980e390b-a1b1-497c-ad31-11c8ae6a88bd	Faith Lutheran Church (Feed Your Neighbor)	\N	Faith Lutheran Church provides a food pantry service called Feed Your Neighbor.	\N	\N	\N	\N	\N	\N	\N	\N	\N	faith lutheran church (feed your neighbor)
2fcd1e7e-c7f7-490a-ac70-07ed3f2f2fce	Seventh Day Adventist Church	\N	A Seventh Day Adventist Church offering a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	\N	seventh day adventist church
663111ef-d042-41b9-a14b-d6f8941a3c8b	Family House	\N	A food pantry providing shelter services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	family house
a5375519-627b-4c24-ac09-6e7a0ec773db	Fayette's Helping Hands	\N	A food pantry located in Fayette, OH.	\N	\N	\N	\N	\N	\N	\N	\N	\N	fayette's helping hands
17e848ff-c94d-44fc-beab-9bdf2b7cc33d	Falcon Food Pantry	\N	A food pantry exclusively for students enrolled at Bowling Green State University.	\N	\N	\N	\N	\N	\N	\N	\N	\N	falcon food pantry
86190ee7-85f2-4f37-a03d-2119fe9d6f61	Family Worship Center	\N	Family Worship Center offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	family worship center
96d2fad2-dfc5-4773-9e85-32de036895dd	First United Methodist Church	\N	A church offering a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	\N	first united methodist church
34097231-febd-456c-b6a2-5a66219c9998	Free At Last Ministries - Dominion Christian Center	\N	Food pantry services provided by Free At Last Ministries at Dominion Christian Center.	\N	\N	\N	\N	\N	\N	\N	\N	\N	free at last ministries - dominion christian center
51084fb3-342b-40d6-b8aa-ba7b7ec4428c	Foundation Stone Christian Center	\N	A Christian center providing food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	foundation stone christian center
5cea461a-4acf-47a3-9013-c4b382d95bc6	Fremont Baptist Temple	\N	Fremont Baptist Temple is a food pantry providing services in Fremont, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	\N	fremont baptist temple
0bee058e-26c0-41d5-9fa3-5c1abfd08bc0	Friendship Baptist Church	\N	Friendship Baptist Church provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	friendship baptist church
ab54bd2c-64fb-4434-98f5-5e31bff6f7cd	Providence Ministries Margaret’s Pantry	\N	Providence Ministries Margaret’s Pantry is a food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	providence ministries margaret’s pantry
223b1cf5-0b87-4f46-98b9-7bf14c7998a3	Christian Pentecostal Church Holyoke Food Pantry	\N	Pantry limits guests to 12 visits a year.	\N	\N	\N	\N	\N	\N	\N	\N	\N	christian pentecostal church holyoke food pantry
74583de3-d335-4ba6-9a7d-d3678eb1b77e	United Way of Pioneer Valley Holyoke Community Cupboard	\N	A food pantry service provided by United Way of Pioneer Valley, with guests limited to one visit per month.	\N	\N	\N	\N	\N	\N	\N	\N	\N	united way of pioneer valley holyoke community cupboard
0f94c779-c3f1-4541-ac32-8a094162d820	United Way of Pioneer Valley Chicopee Service Center	\N	Pantry will be closing permanently after June 30, 2025.	\N	\N	\N	\N	\N	\N	\N	\N	\N	united way of pioneer valley chicopee service center
0b023769-90ac-44ae-b4bf-cce6c20b802d	Pentecostal Church Ebenezer Assemblies of God	\N	Food pantry operated by Pentecostal Church Ebenezer Assemblies of God.	\N	\N	\N	\N	\N	\N	\N	\N	\N	pentecostal church ebenezer assemblies of god
ee9a1805-5561-4023-8f41-de99c21a8c1a	Menlo College	\N	Menlo College is an educational institution that also provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	menlo college
07d37961-f627-4eeb-b09c-27782fd3e26b	Lorraine's Soup Kitchen and Pantry Center Street Mobile Pantry	\N	Lorraine's Soup Kitchen and Pantry operates a mobile pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	\N	lorraine's soup kitchen and pantry center street mobile pantry
97e4097e-3b03-4834-a94c-6892331cae1d	God's Instruments Outreach & Food Pantry	\N	A food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	god's instruments outreach & food pantry
f3fc8cfb-92a7-4bb7-a687-5995c09481f4	Fulton County Alano Club	\N	A club offering support services, including a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	fulton county alano club
4cae5bb2-732a-4bc3-92f6-3a4cb5e2d5d2	The Salvation Army Holyoke Corps Feeding Program	\N	A Salvation Army program in Holyoke, MA, distributing bagged food at the door.	\N	\N	\N	\N	\N	\N	\N	\N	\N	the salvation army holyoke corps feeding program
76f0f423-6ae0-4ddd-8773-ae1910facda6	Grand Lodge Food Pantry	\N	A food pantry located in Toledo, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	\N	grand lodge food pantry
db45357c-bc03-4eb3-9a73-2a2724eefaf4	Grace Community Center	\N	Grace Community Center offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	grace community center
103901e1-88f1-4590-8c11-f73271f2a702	Greater Grace Christian Church	\N	A Christian church offering food pantry services in Toledo, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	\N	greater grace christian church
241c19a0-5185-4fd2-87e2-e21aed0fd1ee	Hands Helping Hands Food Pantry	\N	A food pantry organization.	\N	\N	\N	\N	\N	\N	\N	\N	\N	hands helping hands food pantry
33354350-2bc6-4991-8a26-aca284bfa87c	South County Community Services	\N	South County Community Services provides food assistance and other support services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	south county community services
7beb26ac-7b67-47fe-bdf4-81dbc7019b3f	First Congregational Church of Chicopee Regina's Pantry	\N	A food pantry operated by the First Congregational Church of Chicopee, offering food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	first congregational church of chicopee regina's pantry
ddc57316-5169-4aa8-b941-b092c4cce322	Hebron Ministries	\N	A food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	hebron ministries
0bb28925-7270-4893-a875-7ece5d341603	Momentum for Mental Health	\N	Momentum for Mental Health provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	momentum for mental health
b474f45e-67cf-41bb-821d-10b51d58177d	SVDP Homeless Help Center	\N	SVDP Homeless Help Center provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	svdp homeless help center
534a4b51-bdfa-482e-94df-89cab2fe5d62	Community Church-Seed Faith Missions	\N	Community Church-Seed Faith Missions provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	community church-seed faith missions
19660005-9ebd-4344-9f8b-3096d7341b49	Holiness Temple Church Of God In Christ	\N	Holiness Temple Church Of God In Christ is a religious organization that provides a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	\N	holiness temple church of god in christ
0d06952e-e0b4-4bce-8284-1f4ac9bf7d31	La Iglesia De Dios Food Pantry	\N	La Iglesia De Dios operates a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	la iglesia de dios food pantry
931565e8-aba4-4f81-8c53-bc2396f01281	Help Feed Toledo Area At Gateway Baptist Church	\N	A food pantry located at Gateway Baptist Church in Toledo, OH.	\N	\N	\N	\N	\N	\N	\N	\N	\N	help feed toledo area at gateway baptist church
4f1ec323-a4ce-4a13-8af8-26d6db11d97e	SF-Marin Food Bank	\N	SF-Marin Food Bank is a food bank serving the San Francisco and Marin counties.	\N	\N	\N	\N	\N	\N	\N	\N	\N	sf-marin food bank
1ebdf409-d7f3-4d1a-b715-ab8736f7385b	A Place for Hashem Ministries	\N	A food pantry providing services in Clinton, MD.	\N	\N	\N	\N	\N	\N	\N	\N	\N	a place for hashem ministries
b860105b-6752-4592-bdfe-0031fe418aa4	Our Second Home - DCP	\N	A food pantry providing free groceries.	\N	\N	\N	\N	\N	\N	\N	\N	\N	our second home - dcp
8ab9b760-d544-4c88-b54e-7e96e96400ca	Roots Pantry	\N	Roots Pantry is a food pantry offering free groceries.	\N	\N	\N	\N	\N	\N	\N	\N	\N	roots pantry
4bea8ee1-c20b-4743-8a7d-0f857a38c6cf	St. Justin's Community Ministry	\N	A community ministry offering free groceries.	\N	\N	\N	\N	\N	\N	\N	\N	\N	st. justin's community ministry
0b78e55b-8a41-4d20-b99d-7b2f304773d9	Cathedral of Faith - Reaching Out	\N	Cathedral of Faith is a food pantry providing free groceries, drive-thru, and walk-up services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	cathedral of faith - reaching out
84c0380e-14aa-4e86-9d15-815d17e455ff	Sacred Heart Community Service	\N	A community service organization providing food assistance and other support.	\N	\N	\N	\N	\N	\N	\N	\N	\N	sacred heart community service
de9d54da-c983-433f-bd6e-c8135771cf9f	There With Care	\N	There With Care supports families with critically ill children.	\N	\N	\N	\N	\N	\N	\N	\N	\N	there with care
54779909-54f1-4f76-9825-b0bb3e8df0c3	North of Yountville Pantry - St. Helena Community Pantry	\N	A food pantry operated by Community Action of Napa Valley Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	\N	north of yountville pantry - st. helena community pantry
12ad9ea8-422e-4abe-a375-3ba0df336c23	ACTS	\N	ACTS (Aid for Community to Survive) is a food pantry.	scouteau@actspwc.org	\N	\N	\N	\N	\N	\N	\N	\N	acts
82d3fdb5-526d-4fa2-96f2-e438dd63cc6a	Holyoke Brown Bag	\N	Food pantry services in Holyoke, MA.	\N	\N	\N	\N	\N	\N	\N	\N	\N	holyoke brown bag
41e6a5fe-cfd5-482b-8074-1a89c6b1e5fe	Holy Trinity St. Vincent's De Paul	\N	A food pantry serving the community.	\N	\N	\N	\N	\N	\N	\N	\N	\N	holy trinity st. vincent's de paul
edcc7b45-56ec-4156-8938-6564c9f0bc43	Chicopee McKinley Brown Bag	\N	A food pantry service located in Chicopee, MA.	\N	\N	\N	\N	\N	\N	\N	\N	\N	chicopee mckinley brown bag
ba3e15e3-e773-48ff-892b-460ecf9fcaa8	Antioch Baptist Church	\N	Antioch Baptist Church offers free groceries through drive-thru and walk-up options.	\N	\N	\N	\N	\N	\N	\N	\N	\N	antioch baptist church
209a91ae-ea7d-46d6-8e13-15a0ee5e51ff	Live Oak Adult Day Services - Los Gatos	\N	Live Oak Adult Day Services offers food assistance to seniors.	\N	\N	\N	\N	\N	\N	\N	\N	\N	live oak adult day services - los gatos
f79d64f6-fbc8-485b-82bb-adb566644d63	Alamance County Community Services	\N	Alamance County Community Services offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	alamance county community services
7db82681-1aa6-41e5-96cb-b110a546257a	Salvation Army Gilroy	\N	A Salvation Army location offering food assistance and other support services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	salvation army gilroy
88c3aaee-16ff-4ae9-807f-503b93158fda	Downtown Streets Team	\N	Provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	downtown streets team
981cfa6f-684e-47b0-a9a6-fd1ceb725192	Jerusalem Township Food Pantry	\N	A food pantry serving the community.	\N	\N	\N	\N	\N	\N	\N	\N	\N	jerusalem township food pantry
b29c6e1a-2261-49f4-9e63-556461113957	Local Vocal Ministries-New Jerusalem Church	\N	Local Vocal Ministries operating through New Jerusalem Church.	\N	\N	\N	\N	\N	\N	\N	\N	\N	local vocal ministries-new jerusalem church
72ca5f23-f431-4766-8456-2889c75f0025	Blessed Sacrament Parish Take and Eat	\N	Blessed Sacrament Parish Take and Eat provides meals delivered on the 2nd Sunday of each month for homebound seniors, requiring registration.	\N	\N	\N	\N	\N	\N	\N	\N	\N	blessed sacrament parish take and eat
941e6706-496f-4a65-843a-a55db8f5d904	Neighbors Helping Neighbors	\N	Neighbors Helping Neighbors also hosts a mobile pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	neighbors helping neighbors
a6a067ba-228b-4285-bdd3-50a67710830b	Lutheran Social Services - Feed Your Neighbor	\N	A food pantry service provided by Lutheran Social Services, likely affiliated with the Toledo Northwestern Ohio Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	\N	lutheran social services - feed your neighbor
5102e8be-64bb-474f-a5fd-107512c3056b	Manna Food Pantry @ Memorial U.C.C.	\N	A food pantry operated by Memorial United Church of Christ.	\N	\N	\N	\N	\N	\N	\N	\N	\N	manna food pantry @ memorial u.c.c.
9da8a691-db62-4e7b-89a8-52cbadaa5490	Lafayette RNC	\N	Lafayette RNC is a food pantry located in San Francisco, CA.	\N	\N	\N	\N	\N	\N	\N	\N	\N	lafayette rnc
5931b34f-fd9d-4ed5-880b-190b8118a48c	Pa’lante Transformative Justice Gabinete	\N	Pa’lante Transformative Justice Gabinete provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	pa’lante transformative justice gabinete
8e9debc1-6c04-4660-8f56-6c7a5cd0b4cb	Islamic Food Bank	\N	A food bank providing services to the community.	\N	\N	\N	\N	\N	\N	\N	\N	\N	islamic food bank
d0ab44e8-5ed0-482f-b0bd-8a37c1acc8c4	West Springfield Brown Bag	\N	A food pantry service located in West Springfield, MA.	\N	\N	\N	\N	\N	\N	\N	\N	\N	west springfield brown bag
51bcaca4-1775-4cdb-af1b-da300249db32	Lifeline Connect Baptist Church	\N	Lifeline Connect Baptist Church offers a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	\N	lifeline connect baptist church
02f3af46-4d59-4e34-a610-e3e3f1a2b6f0	One Call Away Ludlow Veterans Services	\N	Veterans services organization offering a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	one call away ludlow veterans services
69420494-8c08-481a-832c-7b1919d46185	Gethsemane Church of Jesus Christ Food Pantry	\N	Food pantry distributing pre-packed bags.	\N	\N	\N	\N	\N	\N	\N	\N	\N	gethsemane church of jesus christ food pantry
5b6111bc-65ea-49f7-b2ba-9580a57a944c	St. Andrew MB Church	\N	St. Andrew MB Church offers a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	\N	st. andrew mb church
014f29cf-f8d4-4c52-a1af-6d8de391effb	Allied Churches of Alamance County	\N	A community organization providing services in Alamance County.	\N	\N	\N	\N	\N	\N	\N	\N	\N	allied churches of alamance county
5854ff62-b249-4993-a8b8-cc8448d1d1b7	Haight Ashbury Food Prog. NGN	\N	Haight Ashbury Food Program NGN provides food pantry services.	\N	https://foodlocator.sfmfoodbank.org/en/site/HAFP	\N	\N	\N	\N	\N	\N	\N	haight ashbury food prog. ngn
627027e0-7c93-42bc-b1db-2012946e4315	Covenant Presbyterian Church	\N	Covenant Presbyterian Church is a food pantry located in San Francisco, CA.	\N	\N	\N	\N	\N	\N	\N	\N	\N	covenant presbyterian church
791ede16-ec3c-410b-a72e-92c54eb09ad7	Metamora U.M.C	\N	A United Methodist Church providing food pantry services in Metamora, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	\N	metamora u.m.c
d6c17baf-e620-4e0a-a5fe-c6f78362aece	Springfield Jordan Senior Center	\N	A senior center in Springfield, MA offering various services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	springfield jordan senior center
34f6be97-b55f-426f-8d01-cd9cace08fd7	Alexandria Food Pantry	\N	A food pantry providing services in Alexandria, VA.	Maria.Rodriguez@ccda.net	\N	\N	\N	\N	\N	\N	\N	\N	alexandria food pantry
cc198679-8195-4f48-b9a7-0b1612da113f	Monroe Street Neighborhood Center	\N	Monroe Street Neighborhood Center is a community center providing food pantry services.	\N	https://monroesnc.com/	\N	\N	\N	\N	\N	\N	\N	monroe street neighborhood center
95ff2e43-5295-43aa-a661-d225bec2e494	ADAMS CENTER	\N	ADAMS CENTER is a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	adams center
ee3e42d6-1c14-4446-b7b6-cef7f1187875	Alafia Baptist Church	\N	Alafia Baptist Church, a food pantry serving the Mount Rainier area.	\N	\N	\N	\N	\N	\N	\N	\N	\N	alafia baptist church
1b5c1e5e-5181-4def-a9d9-8687552da058	Moms Mobile Mission	\N	A food pantry organization.	\N	\N	\N	\N	\N	\N	\N	\N	\N	moms mobile mission
e279fe36-05b0-4fed-a5ca-9d49dc27b2b1	ALIVE	\N	ALIVE is a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	alive
c5d20dd6-7ca5-4e74-8e75-9285cbbe0043	Adventist Community Services of Greater Washington	\N	Adventist Community Services of Greater Washington provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	adventist community services of greater washington
4707190c-6a69-4521-a8c2-b3823eb021d6	International Christian Center Food Pantry	\N	Food pantry services offered by International Christian Center.	\N	\N	\N	\N	\N	\N	\N	\N	\N	international christian center food pantry
c4e22307-9044-46db-957f-fc491611f0ba	Albany Community Action Partnership	\N	Albany Community Action Partnership (ACAP) operates a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	albany community action partnership
0bc1e4ed-1e38-4642-80fc-9761ed6d2fd4	St. Patrick	\N	St. Patrick's is a faith-based organization that operates a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	st. patrick
b5c13cfa-4402-4393-87d9-eb7a5a154709	Goodwill of Silicon Valley	\N	Goodwill of Silicon Valley provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	goodwill of silicon valley
7be01475-51a5-438d-8f75-c0ee2a439f82	Alexander Memorial Baptist Church	\N	Alexander Memorial Baptist Church offers food pantry services, including TEFAP.	zshields10@icloud.com	\N	\N	\N	\N	\N	\N	\N	\N	alexander memorial baptist church
5ab59ea0-827a-4675-a5ac-9034b3ea6279	Alliance for Positive Health	\N	Alliance for Positive Health is an organization that offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	alliance for positive health
b9273044-cfd6-47f0-8271-dc4503730fe7	LifeMoves - Opportunity Services Center	\N	Provides ready-to-eat meals and other services to unhoused individuals.	\N	\N	\N	\N	\N	\N	\N	\N	\N	lifemoves - opportunity services center
d78d5fdf-9077-424c-9574-bc7ff8f5850f	Richmond Neighborhood Center	\N	Richmond Neighborhood Center is a community organization providing services in San Francisco.	\N	\N	\N	\N	\N	\N	\N	\N	\N	richmond neighborhood center
2ada2813-32f3-404c-a553-2e16e5119238	Altamont Community Food Pantry	\N	A food pantry serving the Capital District, offering assistance twice a month.	\N	\N	\N	\N	\N	\N	\N	\N	\N	altamont community food pantry
52f395ad-63ae-4893-954e-d25cb68afdd8	Indian Orchard Brown Bag	\N	Indian Orchard Brown Bag is a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	\N	indian orchard brown bag
e4e91853-017a-4bdd-a76f-c23434f2f3dd	Bay Area Maranatha Christian Center	\N	Bay Area Maranatha Christian Center provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	bay area maranatha christian center
5454407d-476b-4d6f-b507-67e1ed950280	SparkPoint at Cañada College	\N	SparkPoint Center offering financial coaching and education, with information on community college enrollment and resources.	\N	\N	\N	\N	\N	\N	\N	\N	\N	sparkpoint at cañada college
c80f36c5-4362-43fc-956e-3e7ee3b4af42	Community Survival Center Food Pantry	\N	Community Survival Center Food Pantry provides food assistance with guests limited to 6 visits per year.	\N	\N	\N	\N	\N	\N	\N	\N	\N	community survival center food pantry
a4308ae7-de1c-4fc6-98d9-1fca724e047c	Pacifica Resource Center	\N	Pacifica Resource Center provides community services including a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	pacifica resource center
fded1474-612c-479a-966c-2d9051296f7a	MEI Food Pantry	\N	MEI Food Pantry is a food distribution site operated by SF-Marin Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	\N	mei food pantry
da7af643-e475-44df-b362-0d9c146f0342	Arm In Arm	\N	Provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	arm in arm
8706e58a-9278-4855-9ff4-07ab35d7dad6	Beaudoin Village/Yoerg Circle Mobile Food Bank	\N	Mobile food bank service operating on the first Monday of each month.	\N	\N	\N	\N	\N	\N	\N	\N	\N	beaudoin village/yoerg circle mobile food bank
e74d2389-2df1-4914-9958-80ea8c9d491d	Salvation Army Lanai	\N	Salvation Army Lanai provides a soup kitchen service.	\N	\N	\N	\N	\N	\N	\N	\N	\N	salvation army lanai
635f978b-aacd-49aa-8f3e-103e81e01134	All Nation Church of God Food Pantry	\N	Pantry is open on the 2nd and 4th Saturday of each month from 9:00 a.m. – 1:00 p.m.	\N	\N	\N	\N	\N	\N	\N	\N	\N	all nation church of god food pantry
3db8fb18-014b-4cba-93b4-fd03ab907c69	Allen Chapel AME Church	\N	A church offering food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	allen chapel ame church
029acae3-a7aa-4e99-b988-32414afecc1d	Allen Chapel AME Church Outreach Ministry	\N	Allen Chapel AME Church Outreach Ministry provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	allen chapel ame church outreach ministry
817250f0-dd79-4bcc-ac24-532b60f78ce0	Ambassador Baptist Church	\N	Ambassador Baptist Church is a food pantry that provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	\N	ambassador baptist church
64fa9639-50d2-48ac-bff7-9a1d72714f31	Apostolic Church Glorious Vision	\N	A food pantry operated by Apostolic Church Glorious Vision, supported by Capital Area Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	\N	apostolic church glorious vision
c4a6f065-5920-457a-9aad-7c54d7df9989	Antioch Baptist Church of Clinton	\N	Antioch Baptist Church of Clinton provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	antioch baptist church of clinton
ce3ae043-46d7-4dea-867a-cef5e3e615e5	Ark of Grace Mission, Inc	\N	Ark of Grace Mission, Inc. is a food pantry providing services to the community.	\N	\N	\N	\N	\N	\N	\N	\N	\N	ark of grace mission, inc
d89af38c-e08a-4359-9f7a-0ee50719caea	Arlington Bridge Builders	\N	Arlington Bridge Builders provides food pantry services.	tjgm_2013@yahoo.com	\N	\N	\N	\N	\N	\N	\N	\N	arlington bridge builders
a4eed536-98f3-40f3-ab92-64a3a1bd0d13	Arlington Mill Community Center	\N	Community center providing food pantry services.	aprivera@capitalareafoodbank.org	\N	\N	\N	\N	\N	\N	\N	\N	arlington mill community center
7cfc5bbb-5efc-486b-81be-92df7c50864b	Epiphany Lutheran Church	\N	Food pantry in Atlantic County, NJ.	\N	\N	\N	\N	\N	\N	\N	\N	\N	epiphany lutheran church
d0867005-df45-4414-965f-db71589eb3c1	Bellevue Reformed Church	\N	Bellevue Reformed Church operates a Little Free Food Pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	bellevue reformed church
3040b6d3-e888-42fc-ae33-44ca3f5fe488	Assumption Outreach	\N	Assumption Outreach provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	assumption outreach
2c4bd260-861c-4ebb-a158-96ced71cdb6b	Bethesda House of Schenectady	\N	Bethesda House of Schenectady provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	bethesda house of schenectady
871bb9bb-a6b1-4abc-9276-d6c2841666e6	Friends of Jean Webster Soup Kitchen	\N	Food pantry in Atlantic County, NJ offering Soup Kitchen services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	friends of jean webster soup kitchen
51f083a2-ec50-4c9b-9690-3bffb97d18ee	Bethel Stand for Life Outreach Ministries	\N	Bethel Stand for Life Outreach Ministries is an organization that provides services.	\N	\N	\N	\N	\N	\N	\N	\N	\N	bethel stand for life outreach ministries
ea1c6dbd-25b3-4faf-906f-91ab0c7a7340	Berlin Food Closet	\N	A food pantry serving the Capital District.	\N	\N	\N	\N	\N	\N	\N	\N	\N	berlin food closet
b6873215-f79c-4d04-aa14-1a79e5d0cf1a	Trinity Alliance of the Capital Region	\N	Trinity Alliance of the Capital Region is an organization that operates food pantries.	\N	\N	\N	\N	\N	\N	\N	\N	\N	trinity alliance of the capital region
ea68d5c3-210e-4fc1-b2f5-3dc8e3aeb48d	Beltsville Adventist Community Center	\N	A community center offering food pantry services, affiliated with Capital Area Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	\N	beltsville adventist community center
124b3f98-68fd-4e7a-8453-5e3b1eb504c1	Grace Tabernacle	\N	Food pantry in Atlantic County, NJ.	\N	\N	\N	\N	\N	\N	\N	\N	\N	grace tabernacle
36081f29-cf6d-41df-a568-dab1a36921ad	Bethesda Help	\N	Bethesda Help is a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	\N	bethesda help
b4b38405-fcfc-4ecb-b4d4-6479cb74b94c	Boat People SOS	\N	Boat People SOS is an organization that provides services to the community.	\N	\N	\N	\N	\N	\N	\N	\N	\N	boat people sos
\.


--
-- Data for Name: organization_identifier; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organization_identifier (id, organization_id, identifier_scheme, identifier_type, identifier) FROM stdin;
\.


--
-- Data for Name: organization_source; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.organization_source (id, organization_id, scraper_id, name, description, website, email, year_incorporated, legal_status, tax_status, tax_id, uri, parent_organization_id, created_at, updated_at) FROM stdin;
c603c5a9-235a-46f1-a19c-165ba6e5b69a	51ac2f64-fff9-4f48-b711-1a697f8ca95d	toledo_northwestern_ohio_food_bank_oh	Anthony Wayne Community Food Ministry, Inc.	A community food ministry providing food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:17.139581+00	2025-08-08 05:05:17.139581+00
d5c21183-20f3-449f-adbd-18bec7b9f13e	b2d53d3a-9b74-43f5-b634-b9e9dcec76d7	toledo_northwestern_ohio_food_bank_oh	Brown Bag Food Project	A food pantry service provider.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:18.19299+00	2025-08-08 05:05:18.19299+00
7fe4cf81-081b-4cd1-8adf-3f95ca23f5d0	46e0563b-7653-4471-a862-e2e1a366ab71	toledo_northwestern_ohio_food_bank_oh	Christ Church Triumphant	A food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:19.196243+00	2025-08-08 05:05:19.196243+00
24144c3a-4e57-4b83-9d56-ee1520f2226b	6ab6a80c-75c4-43f9-ae91-36c498c5821a	toledo_northwestern_ohio_food_bank_oh	Blackburn Ministries	A ministry providing food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:22.083924+00	2025-08-08 05:05:22.083924+00
4fafd105-3912-41c0-8ab9-677067fb5916	97edfa8e-11e0-40d4-a929-898067d28342	toledo_northwestern_ohio_food_bank_oh	Aldersgate United Methodist Church	Aldersgate United Methodist Church offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:24.615102+00	2025-08-08 05:05:24.615102+00
53db24ce-2348-4475-9ae9-380efd41cf1c	4953c7e5-5219-4974-bf3e-898fcbf90001	toledo_northwestern_ohio_food_bank_oh	Bowling Green Christian Food Pantry	A food pantry located in Bowling Green, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:28.268681+00	2025-08-08 05:05:28.268681+00
1a342929-be01-4d9d-b062-8141de149f71	f6e0dadd-d53c-4b24-a5eb-37e635069f40	food_bank_of_western_massachusetts_ma	Lorraine's Soup Kitchen and Pantry	Lorraine's Soup Kitchen and Pantry operates a mobile food bank, distributing food on the 3rd Tuesday of each month.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:56.002772+00	2025-08-08 05:07:12.883558+00
cdf356e7-cbd5-4078-9440-4d21bf7c524d	8e7216fa-4cea-4a28-832f-99e6a63ef221	toledo_northwestern_ohio_food_bank_oh	Catholic Food Pantry	Catholic Food Pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:30.310322+00	2025-08-08 05:05:30.310322+00
ad63459b-4d59-4e1d-8495-fc05b0f5aa7b	480ae46f-da0f-440f-80ff-add05a25c060	toledo_northwestern_ohio_food_bank_oh	Beach House Family Shelter	Beach House Family Shelter provides shelter services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:31.212366+00	2025-08-08 05:05:31.212366+00
0366e614-c728-4453-996d-f0a2ceea4035	2cd075d5-177d-4b0e-827b-27d746ec1d4b	second_harvest_of_silicon_valley_ca	City Team	City Team provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:32.166301+00	2025-08-08 05:05:32.166301+00
00ecb28d-4e08-4afb-869f-fd65cbe747ad	16838842-d076-4e5e-b1fb-3fe49ca0e748	toledo_northwestern_ohio_food_bank_oh	Archbold Fish Pantry	A food pantry located in Archbold, Ohio, affiliated with the Toledo Northwestern Ohio Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:33.142333+00	2025-08-08 05:05:33.142333+00
eb2f7a6c-0204-4fc1-b919-1bac906a2e09	321f76c9-f853-486c-a372-c37a015978cc	toledo_northwestern_ohio_food_bank_oh	Bethel Assembly Of God Church	A church offering food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:34.13698+00	2025-08-08 05:05:34.13698+00
eaf616eb-07f2-4269-b104-e88ac646396b	3e423664-a419-45a8-9a05-8b0f9b19495c	second_harvest_of_silicon_valley_ca	Samaritan House	Samaritan House provides food pantry services, including Ready-To-Eat Meals and Walk up options.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:35.047534+00	2025-08-08 05:05:35.047534+00
e0a0f90f-c5d9-41a8-bf42-df2f1e904592	e3dd9367-e294-4ad3-9264-8cc8f717550c	toledo_northwestern_ohio_food_bank_oh	Clyde Food Pantry	A food pantry located in Clyde, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:35.998244+00	2025-08-08 05:05:35.998244+00
83fc6855-aa80-40f8-8f76-720e97a3a5f6	a1325dc8-3ae8-4903-b5fa-e1968bceab87	toledo_northwestern_ohio_food_bank_oh	Christ's Cupboard Ministries	A food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:37.836131+00	2025-08-08 05:05:37.836131+00
3bf6c15f-89d2-405c-a7d9-e73283a4a85c	f0205eac-07be-445e-9aca-50738d3bcca9	food_bank_of_western_massachusetts_ma	Lorraine's Soup Kitchen and Pantry Docs Place Mobile Pantry	Lorraine's Soup Kitchen and Pantry operates a mobile pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:51.642149+00	2025-08-08 05:05:51.642149+00
a0e38421-e259-43f4-9634-27f5e8cb578a	291c5723-d461-422a-a817-8c0ee2506f03	second_harvest_of_silicon_valley_ca	Ecumenical Hunger Program	Ecumenical Hunger Program provides food assistance to those in need.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:40.860011+00	2025-08-08 05:05:40.860011+00
324a3bc3-e766-436f-a613-4ca0aa712f8b	a85d4032-c780-43bc-bbed-d2d87a7df0b0	community_action_of_napa_valley_food_bank_ca	Community Action of Napa Valley Food Bank	Community Action of Napa Valley Food Bank provides food assistance to those in need.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:25.526436+00	2025-08-08 05:08:13.862832+00
d35883f3-a624-4840-a56f-54801cdd023a	c2f7cdbb-df9e-47f1-b2ea-1fc6c75ddc1c	second_harvest_of_silicon_valley_ca	AIDS Community Resource Consortium	AIDS Community Resource Consortium provides food assistance to low-income, HIV positive individuals in San Mateo County.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:42.696185+00	2025-08-08 05:05:42.696185+00
aeb60844-ae27-47ac-9e67-fd64032af24e	82a41089-0c3c-4256-8301-50a2afeff04c	chester_county_food_bank_pa	Berwyn United Methodist Church Food Pantry	Food pantry services offered by Berwyn United Methodist Church.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:43.723087+00	2025-08-08 05:05:43.723087+00
3ce1ebaa-0d7d-4084-bac3-7ac94fd95138	066f4a13-2353-4bec-ade2-64b6cf42a503	toledo_northwestern_ohio_food_bank_oh	Community Heart Of Toledo - St. Paul's Lutheran	Community Heart of Toledo, located at St. Paul's Lutheran, provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:44.679476+00	2025-08-08 05:05:44.679476+00
35600921-3c79-45e7-94ad-3031e8258aad	faab6503-70f5-4a11-87e7-90c5838308b6	toledo_northwestern_ohio_food_bank_oh	Echo Meadows Church Of Christ	Echo Meadows Church Of Christ is a religious organization that also provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:45.68661+00	2025-08-08 05:05:45.68661+00
7348eb52-79b8-444b-a15e-e3d00163fe70	8aeedc32-0ae6-49db-8cbb-6d03debfa0be	toledo_northwestern_ohio_food_bank_oh	Delta Assembly Of God	A food pantry located in Delta, Ohio, affiliated with the Toledo Northwestern Ohio Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:52.627895+00	2025-08-08 05:05:52.627895+00
91ce716d-8cc9-483f-863a-7a496525f8f8	c223f130-cbef-4254-9e4f-6419ad504bc0	toledo_northwestern_ohio_food_bank_oh	Cindy's Cafe At St. Lucas Lutheran Church	Cindy's Cafe, located at St. Lucas Lutheran Church in Toledo, Ohio, offers soup kitchen services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:49.606446+00	2025-08-08 05:05:49.606446+00
2e3a7db8-f84f-4048-b95c-f954a1f54332	bc11aabf-c0ad-4d05-a133-d8d0b42d6be2	toledo_northwestern_ohio_food_bank_oh	Elliston Zion UMC - The L.I.G.H.T Pantry	The L.I.G.H.T Pantry at Elliston Zion UMC provides food assistance.	https://www.ellistonzion.com/	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:53.720768+00	2025-08-08 05:05:53.720768+00
3b2a46e3-2cee-49e4-b83d-fc04fd542973	ffbe2301-174b-4276-919a-32b3e0e4108e	mercer_food_finder	A.M.E.N (A Meal Encourages Nourishment)	Provides food assistance on the last Sunday of the month from 1:30 PM to 5:30 PM on a first-come, first-served basis for anyone in need.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:57.068754+00	2025-08-08 05:05:57.068754+00
cc466654-06c3-40d7-a1d1-0f9dbc478321	bd877b1a-b177-46d2-ba7b-c7b912216a0e	food_bank_of_western_massachusetts_ma	Chicopee Moose Lodge Brown Bag	A food pantry program offering pickups every 3rd Tuesday.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:58.37153+00	2025-08-08 05:05:58.37153+00
c508df51-4677-447a-a428-5c9b5532f94a	324e6d0f-f577-40ff-a350-bf25cde132a8	second_harvest_of_silicon_valley_ca	Second Harvest of Silicon Valley	A food bank serving Silicon Valley.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:23.71802+00	2025-08-08 05:08:02.478082+00
2fd685fa-38c5-4903-9527-a70177e175c0	83938a98-6227-43f4-8b94-7a5dad665ca2	chester_county_food_bank_pa	Chester County Food Bank	Chester County Food Bank is an organization that provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:05:38.782193+00	2025-08-08 05:08:34.390434+00
29412b53-2709-4dd2-a9ff-50dccd5193c7	5e63caa4-b501-42f8-be89-66edba85836e	toledo_northwestern_ohio_food_bank_oh	Emmanuel Baptist Church	Emmanuel Baptist Church offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:01.641942+00	2025-08-08 05:06:01.641942+00
0733cb1d-97bc-47a7-a513-d77c5edcc4cd	e0c1617d-0eb5-48e5-8c48-0ede1614acde	toledo_northwestern_ohio_food_bank_oh	Emmaus Lutheran Church	Emmaus Lutheran Church provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:02.491197+00	2025-08-08 05:06:02.491197+00
72fb21ec-a2bf-4ec2-aa30-cadd2e7ca3ad	223abd39-e21d-4963-85d5-bdfe4db71032	toledo_northwestern_ohio_food_bank_oh	F.O.P. 40 Charities Food Pantry	F.O.P. 40 Charities Food Pantry provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:04.32177+00	2025-08-08 05:06:04.32177+00
b1b4ca56-9b14-4a0a-ba37-11b40d8d0906	5d62e67d-c5ff-4eca-9134-142c5cbf0720	food_bank_of_western_massachusetts_ma	Our Father's House Dream Center Day	Pantry is open every 4th Saturday of the month from 9:45 – 10:30 a.m.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:06.944112+00	2025-08-08 05:06:06.944112+00
f04525c9-e115-499c-b377-73638472c5d5	fde32e1f-604c-4554-9726-56a19f8c8e27	food_bank_of_western_massachusetts_ma	Mission Center New Jerusalem One Way Outreach Pantry	Mission Center New Jerusalem One Way Outreach Pantry offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:08.664634+00	2025-08-08 05:06:08.664634+00
21163e24-cf50-4554-a3c7-10edb05ad4b6	1d5a59a2-4786-44f8-9478-6479e5fc65d5	toledo_northwestern_ohio_food_bank_oh	Fairgreen Presbyterian Church (Feed Your Neighbor)	Fairgreen Presbyterian Church offers a food pantry program called 'Feed Your Neighbor'.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:12.183924+00	2025-08-08 05:06:12.183924+00
3f7d2336-7a08-4614-ac53-9d55d8d2f749	95480946-02c5-4058-9e73-4243302beeb5	chester_county_food_bank_pa	Frazer	Food pantry services provided by Frazer.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:13.085104+00	2025-08-08 05:06:13.085104+00
539a52b5-b84f-4186-83b9-e0983810199a	e2aa0ab4-03c2-41df-af5f-ccbdafd8cf20	chester_county_food_bank_pa	Glenmoore Salvation Army Food Pantry	A food pantry operated by the Salvation Army in Glenmoore, PA.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:13.909439+00	2025-08-08 05:06:13.909439+00
f176de6b-a72a-42ec-8106-8c837fffc52b	980e390b-a1b1-497c-ad31-11c8ae6a88bd	toledo_northwestern_ohio_food_bank_oh	Faith Lutheran Church (Feed Your Neighbor)	Faith Lutheran Church provides a food pantry service called Feed Your Neighbor.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:16.759576+00	2025-08-08 05:06:16.759576+00
6159b198-ae8a-4f4e-8ea0-357d1c602718	2fcd1e7e-c7f7-490a-ac70-07ed3f2f2fce	the_food_basket_inc_hi	Seventh Day Adventist Church	A Seventh Day Adventist Church offering a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:18.610779+00	2025-08-08 05:06:18.610779+00
385d28f7-a920-4cef-97c8-3a61ba474170	663111ef-d042-41b9-a14b-d6f8941a3c8b	toledo_northwestern_ohio_food_bank_oh	Family House	A food pantry providing shelter services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:19.53498+00	2025-08-08 05:06:19.53498+00
a6166be4-20df-435c-b9da-0f543e0a0fe4	a5375519-627b-4c24-ac09-6e7a0ec773db	toledo_northwestern_ohio_food_bank_oh	Fayette's Helping Hands	A food pantry located in Fayette, OH.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:21.215848+00	2025-08-08 05:06:21.215848+00
c1997e60-01b4-4c3b-af3e-5f32b00188bc	17e848ff-c94d-44fc-beab-9bdf2b7cc33d	toledo_northwestern_ohio_food_bank_oh	Falcon Food Pantry	A food pantry exclusively for students enrolled at Bowling Green State University.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:22.089602+00	2025-08-08 05:06:22.089602+00
19b8dea9-4f37-4c21-8641-40f63037b6fb	86190ee7-85f2-4f37-a03d-2119fe9d6f61	toledo_northwestern_ohio_food_bank_oh	Family Worship Center	Family Worship Center offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:23.014996+00	2025-08-08 05:06:23.014996+00
67f56f86-5fbe-4d5c-95ab-ec55f22d619a	96d2fad2-dfc5-4773-9e85-32de036895dd	toledo_northwestern_ohio_food_bank_oh	First United Methodist Church	A church offering a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:23.916228+00	2025-08-08 05:06:23.916228+00
01e1a82e-8970-4b19-a053-6201ff658fe1	34097231-febd-456c-b6a2-5a66219c9998	toledo_northwestern_ohio_food_bank_oh	Free At Last Ministries - Dominion Christian Center	Food pantry services provided by Free At Last Ministries at Dominion Christian Center.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:27.724567+00	2025-08-08 05:06:27.724567+00
b30953b3-9a39-4ebd-9f6c-b94a2d42fb44	51084fb3-342b-40d6-b8aa-ba7b7ec4428c	toledo_northwestern_ohio_food_bank_oh	Foundation Stone Christian Center	A Christian center providing food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:29.69237+00	2025-08-08 05:06:29.69237+00
5bbf7ca4-6f16-4d58-bda6-ea7a86ae22f9	5cea461a-4acf-47a3-9013-c4b382d95bc6	toledo_northwestern_ohio_food_bank_oh	Fremont Baptist Temple	Fremont Baptist Temple is a food pantry providing services in Fremont, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:30.732987+00	2025-08-08 05:06:30.732987+00
1461574b-6447-430f-a149-0d7dcaccf526	0bee058e-26c0-41d5-9fa3-5c1abfd08bc0	toledo_northwestern_ohio_food_bank_oh	Friendship Baptist Church	Friendship Baptist Church provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:31.765413+00	2025-08-08 05:06:31.765413+00
0ced4b9a-c482-4dd7-8c39-dc52e971a83a	ab54bd2c-64fb-4434-98f5-5e31bff6f7cd	food_bank_of_western_massachusetts_ma	Providence Ministries Margaret’s Pantry	Providence Ministries Margaret’s Pantry is a food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:32.657456+00	2025-08-08 05:06:32.657456+00
99f7fba8-1de3-49fd-b95f-c4e48b2759ea	223b1cf5-0b87-4f46-98b9-7bf14c7998a3	food_bank_of_western_massachusetts_ma	Christian Pentecostal Church Holyoke Food Pantry	Pantry limits guests to 12 visits a year.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:35.353918+00	2025-08-08 05:06:35.353918+00
542216e5-9195-494d-92f9-6c8fb88361e7	74583de3-d335-4ba6-9a7d-d3678eb1b77e	food_bank_of_western_massachusetts_ma	United Way of Pioneer Valley Holyoke Community Cupboard	A food pantry service provided by United Way of Pioneer Valley, with guests limited to one visit per month.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:36.275432+00	2025-08-08 05:06:36.275432+00
b15efee7-93d8-46d5-995e-1b186985d0a2	0f94c779-c3f1-4541-ac32-8a094162d820	food_bank_of_western_massachusetts_ma	United Way of Pioneer Valley Chicopee Service Center	Pantry will be closing permanently after June 30, 2025.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:37.969053+00	2025-08-08 05:06:37.969053+00
75e53374-fc50-4df6-b5a3-99d3d6780539	0b023769-90ac-44ae-b4bf-cce6c20b802d	food_bank_of_western_massachusetts_ma	Pentecostal Church Ebenezer Assemblies of God	Food pantry operated by Pentecostal Church Ebenezer Assemblies of God.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:38.784928+00	2025-08-08 05:06:38.784928+00
c093da2e-fcc4-4da8-9a6e-39c277582bf0	ee9a1805-5561-4023-8f41-de99c21a8c1a	second_harvest_of_silicon_valley_ca	Menlo College	Menlo College is an educational institution that also provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:39.673378+00	2025-08-08 05:06:39.673378+00
9e97dec5-5930-4845-b62f-22bd2add419f	07d37961-f627-4eeb-b09c-27782fd3e26b	food_bank_of_western_massachusetts_ma	Lorraine's Soup Kitchen and Pantry Center Street Mobile Pantry	Lorraine's Soup Kitchen and Pantry operates a mobile pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:40.695082+00	2025-08-08 05:06:40.695082+00
2e7bdba0-b2c0-48f3-b546-2536e1b5d6d8	97e4097e-3b03-4834-a94c-6892331cae1d	toledo_northwestern_ohio_food_bank_oh	God's Instruments Outreach & Food Pantry	A food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:41.558408+00	2025-08-08 05:06:41.558408+00
aaf0c7e0-eb56-4f3d-81ca-a9dc4952447a	f3fc8cfb-92a7-4bb7-a687-5995c09481f4	toledo_northwestern_ohio_food_bank_oh	Fulton County Alano Club	A club offering support services, including a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:43.209036+00	2025-08-08 05:06:43.209036+00
b4ba2d5f-3c7d-42c5-90be-bac90bed596e	4cae5bb2-732a-4bc3-92f6-3a4cb5e2d5d2	food_bank_of_western_massachusetts_ma	The Salvation Army Holyoke Corps Feeding Program	A Salvation Army program in Holyoke, MA, distributing bagged food at the door.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:44.112379+00	2025-08-08 05:06:44.112379+00
56b4a4cc-af8a-4cee-bcb5-f738fe92e490	76f0f423-6ae0-4ddd-8773-ae1910facda6	toledo_northwestern_ohio_food_bank_oh	Grand Lodge Food Pantry	A food pantry located in Toledo, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:44.985524+00	2025-08-08 05:06:44.985524+00
61f90a04-01cf-4fb5-b106-6b9ebda37fe3	db45357c-bc03-4eb3-9a73-2a2724eefaf4	toledo_northwestern_ohio_food_bank_oh	Grace Community Center	Grace Community Center offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:46.716174+00	2025-08-08 05:06:46.716174+00
4af9d678-c6a0-48de-b60c-8f6cb89cbe68	103901e1-88f1-4590-8c11-f73271f2a702	toledo_northwestern_ohio_food_bank_oh	Greater Grace Christian Church	A Christian church offering food pantry services in Toledo, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:47.6201+00	2025-08-08 05:06:47.6201+00
f8079707-a697-4b7f-8493-57bacc1d49b1	241c19a0-5185-4fd2-87e2-e21aed0fd1ee	toledo_northwestern_ohio_food_bank_oh	Hands Helping Hands Food Pantry	A food pantry organization.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:48.526196+00	2025-08-08 05:06:48.526196+00
5484226e-de8c-4df8-ba84-ca51730eaa88	33354350-2bc6-4991-8a26-aca284bfa87c	second_harvest_of_silicon_valley_ca	South County Community Services	South County Community Services provides food assistance and other support services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:49.390643+00	2025-08-08 05:06:49.390643+00
171f03a6-46f1-45ef-a9f3-fe24c7615615	7beb26ac-7b67-47fe-bdf4-81dbc7019b3f	food_bank_of_western_massachusetts_ma	First Congregational Church of Chicopee Regina's Pantry	A food pantry operated by the First Congregational Church of Chicopee, offering food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:51.026569+00	2025-08-08 05:06:51.026569+00
8644dd5a-af1a-4c9b-9bab-729220647774	ddc57316-5169-4aa8-b941-b092c4cce322	toledo_northwestern_ohio_food_bank_oh	Hebron Ministries	A food pantry providing food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:51.849589+00	2025-08-08 05:06:51.849589+00
fc603c16-0a32-4f14-a74c-32f15c6a0a9b	0bb28925-7270-4893-a875-7ece5d341603	second_harvest_of_silicon_valley_ca	Momentum for Mental Health	Momentum for Mental Health provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:52.862807+00	2025-08-08 05:06:52.862807+00
e1b91477-24cd-4a7f-944c-9613b7a05a1d	b474f45e-67cf-41bb-821d-10b51d58177d	second_harvest_of_silicon_valley_ca	SVDP Homeless Help Center	SVDP Homeless Help Center provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:53.672697+00	2025-08-08 05:06:53.672697+00
59c7b4a5-c044-4a29-9298-4a2ea5a64399	534a4b51-bdfa-482e-94df-89cab2fe5d62	toledo_northwestern_ohio_food_bank_oh	Community Church-Seed Faith Missions	Community Church-Seed Faith Missions provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:54.454429+00	2025-08-08 05:06:54.454429+00
0971371d-e0f4-441f-afb9-f5946f300601	19660005-9ebd-4344-9f8b-3096d7341b49	toledo_northwestern_ohio_food_bank_oh	Holiness Temple Church Of God In Christ	Holiness Temple Church Of God In Christ is a religious organization that provides a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:55.262832+00	2025-08-08 05:06:55.262832+00
c2448428-3762-41d9-b0b9-d5524bd7c58c	0d06952e-e0b4-4bce-8284-1f4ac9bf7d31	food_bank_of_western_massachusetts_ma	La Iglesia De Dios Food Pantry	La Iglesia De Dios operates a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:57.816778+00	2025-08-08 05:06:57.816778+00
84e55425-2c94-42f8-b7d5-a0a006ae6710	931565e8-aba4-4f81-8c53-bc2396f01281	toledo_northwestern_ohio_food_bank_oh	Help Feed Toledo Area At Gateway Baptist Church	A food pantry located at Gateway Baptist Church in Toledo, OH.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:58.661015+00	2025-08-08 05:06:58.661015+00
298603ba-a508-4bc7-9190-76f7ec394ca2	4f1ec323-a4ce-4a13-8af8-26d6db11d97e	sfmarin_food_bank_ca	SF-Marin Food Bank	SF-Marin Food Bank is a food bank serving the San Francisco and Marin counties.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:59.479631+00	2025-08-08 05:06:59.479631+00
35cbfcc2-831f-4f9a-9f7a-8f9217f4447b	1ebdf409-d7f3-4d1a-b715-ab8736f7385b	capital_area_food_bank_dc	A Place for Hashem Ministries	A food pantry providing services in Clinton, MD.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:00.35959+00	2025-08-08 05:07:00.35959+00
5105b7e8-efcc-4635-9360-057bb10427d1	b860105b-6752-4592-bdfe-0031fe418aa4	second_harvest_of_silicon_valley_ca	Our Second Home - DCP	A food pantry providing free groceries.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:01.348395+00	2025-08-08 05:07:01.348395+00
897b4b36-1b2b-4df2-bd8c-f32a6435a910	8ab9b760-d544-4c88-b54e-7e96e96400ca	second_harvest_of_silicon_valley_ca	Roots Pantry	Roots Pantry is a food pantry offering free groceries.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:02.320241+00	2025-08-08 05:07:02.320241+00
4612d211-0508-4b5a-a857-6075152eacbc	4bea8ee1-c20b-4743-8a7d-0f857a38c6cf	second_harvest_of_silicon_valley_ca	St. Justin's Community Ministry	A community ministry offering free groceries.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:03.265259+00	2025-08-08 05:07:03.265259+00
5fcbdfb0-154b-428d-9c4e-01c261109f72	0b78e55b-8a41-4d20-b99d-7b2f304773d9	second_harvest_of_silicon_valley_ca	Cathedral of Faith - Reaching Out	Cathedral of Faith is a food pantry providing free groceries, drive-thru, and walk-up services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:04.142617+00	2025-08-08 05:07:04.142617+00
a83d8441-3293-43bf-af1c-5569d9f3bb81	84c0380e-14aa-4e86-9d15-815d17e455ff	second_harvest_of_silicon_valley_ca	Sacred Heart Community Service	A community service organization providing food assistance and other support.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:07.620483+00	2025-08-08 05:07:07.620483+00
cbd31fae-49b2-4801-be2f-11084aae63fe	de9d54da-c983-433f-bd6e-c8135771cf9f	second_harvest_of_silicon_valley_ca	There With Care	There With Care supports families with critically ill children.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:08.443705+00	2025-08-08 05:07:08.443705+00
bb2d780a-8cb0-4911-b057-0c5516ce7be1	54779909-54f1-4f76-9825-b0bb3e8df0c3	community_action_of_napa_valley_food_bank_ca	North of Yountville Pantry - St. Helena Community Pantry	A food pantry operated by Community Action of Napa Valley Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:10.287118+00	2025-08-08 05:07:10.287118+00
30b6fbf0-1fa2-4838-b210-551d94be6bc8	12ad9ea8-422e-4abe-a375-3ba0df336c23	capital_area_food_bank_dc	ACTS	ACTS (Aid for Community to Survive) is a food pantry.	\N	scouteau@actspwc.org	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:11.170669+00	2025-08-08 05:07:11.170669+00
6a1c7118-004b-4981-ae1b-fdd12efe032a	82d3fdb5-526d-4fa2-96f2-e438dd63cc6a	food_bank_of_western_massachusetts_ma	Holyoke Brown Bag	Food pantry services in Holyoke, MA.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:13.82834+00	2025-08-08 05:07:13.82834+00
cf8b03b5-7ee0-4d82-b1b1-3f2ba40cb82a	41e6a5fe-cfd5-482b-8074-1a89c6b1e5fe	toledo_northwestern_ohio_food_bank_oh	Holy Trinity St. Vincent's De Paul	A food pantry serving the community.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:14.79933+00	2025-08-08 05:07:14.79933+00
df19b61b-3961-4498-ac56-afc6291bf82f	edcc7b45-56ec-4156-8938-6564c9f0bc43	food_bank_of_western_massachusetts_ma	Chicopee McKinley Brown Bag	A food pantry service located in Chicopee, MA.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:16.54861+00	2025-08-08 05:07:16.54861+00
6f6a1f51-0ae6-4c4d-ae90-0691dc2c6072	ba3e15e3-e773-48ff-892b-460ecf9fcaa8	second_harvest_of_silicon_valley_ca	Antioch Baptist Church	Antioch Baptist Church offers free groceries through drive-thru and walk-up options.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:19.199609+00	2025-08-08 05:07:19.199609+00
815ea385-fb67-408c-a708-ae6021440fee	209a91ae-ea7d-46d6-8e13-15a0ee5e51ff	second_harvest_of_silicon_valley_ca	Live Oak Adult Day Services - Los Gatos	Live Oak Adult Day Services offers food assistance to seniors.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:20.090734+00	2025-08-08 05:07:20.090734+00
54a15d2f-306b-464b-8563-4729dbc62f6a	f79d64f6-fbc8-485b-82bb-adb566644d63	second_harvest_food_bank_of_northwest_north_carolina_nc	Alamance County Community Services	Alamance County Community Services offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:20.972103+00	2025-08-08 05:07:20.972103+00
6bd86306-5298-4842-ac8b-06a835a2641e	7db82681-1aa6-41e5-96cb-b110a546257a	second_harvest_of_silicon_valley_ca	Salvation Army Gilroy	A Salvation Army location offering food assistance and other support services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:21.792885+00	2025-08-08 05:07:21.792885+00
4803f495-afdb-44c3-9b37-480c0bda2aba	88c3aaee-16ff-4ae9-807f-503b93158fda	second_harvest_of_silicon_valley_ca	Downtown Streets Team	Provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:24.435025+00	2025-08-08 05:07:24.435025+00
2e18e8e9-aa32-456b-8b2c-13627a798550	981cfa6f-684e-47b0-a9a6-fd1ceb725192	toledo_northwestern_ohio_food_bank_oh	Jerusalem Township Food Pantry	A food pantry serving the community.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:26.117312+00	2025-08-08 05:07:26.117312+00
cdeca369-f074-4bb9-a150-953b24e4d615	b29c6e1a-2261-49f4-9e63-556461113957	toledo_northwestern_ohio_food_bank_oh	Local Vocal Ministries-New Jerusalem Church	Local Vocal Ministries operating through New Jerusalem Church.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:26.957823+00	2025-08-08 05:07:26.957823+00
1f615feb-6126-41f1-b705-d831505124cd	72ca5f23-f431-4766-8456-2889c75f0025	food_bank_of_western_massachusetts_ma	Blessed Sacrament Parish Take and Eat	Blessed Sacrament Parish Take and Eat provides meals delivered on the 2nd Sunday of each month for homebound seniors, requiring registration.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:27.852157+00	2025-08-08 05:07:27.852157+00
a0c3623e-491a-420a-bc9a-06b113459f05	941e6706-496f-4a65-843a-a55db8f5d904	food_bank_of_western_massachusetts_ma	Neighbors Helping Neighbors	Neighbors Helping Neighbors also hosts a mobile pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:28.6339+00	2025-08-08 05:07:28.6339+00
ec60310d-c4be-488c-ba13-aadd3cab9bd9	a6a067ba-228b-4285-bdd3-50a67710830b	toledo_northwestern_ohio_food_bank_oh	Lutheran Social Services - Feed Your Neighbor	A food pantry service provided by Lutheran Social Services, likely affiliated with the Toledo Northwestern Ohio Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:31.256315+00	2025-08-08 05:07:31.256315+00
fa6ab299-b11c-4335-924b-68a83b5aea46	5102e8be-64bb-474f-a5fd-107512c3056b	toledo_northwestern_ohio_food_bank_oh	Manna Food Pantry @ Memorial U.C.C.	A food pantry operated by Memorial United Church of Christ.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:32.162183+00	2025-08-08 05:07:32.162183+00
5a76fb38-ca35-4dc3-aae0-70110a93d7d6	9da8a691-db62-4e7b-89a8-52cbadaa5490	sfmarin_food_bank_ca	Lafayette RNC	Lafayette RNC is a food pantry located in San Francisco, CA.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:33.117937+00	2025-08-08 05:07:33.117937+00
3a837146-acbf-4e7e-8f78-042c42c35e45	5931b34f-fd9d-4ed5-880b-190b8118a48c	food_bank_of_western_massachusetts_ma	Pa’lante Transformative Justice Gabinete	Pa’lante Transformative Justice Gabinete provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:34.048195+00	2025-08-08 05:07:34.048195+00
956b83d5-db50-4c6f-9f8a-7ee8784e7310	8e9debc1-6c04-4660-8f56-6c7a5cd0b4cb	toledo_northwestern_ohio_food_bank_oh	Islamic Food Bank	A food bank providing services to the community.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:34.91176+00	2025-08-08 05:07:34.91176+00
036babb3-599c-4d47-b6d0-7ea6b865d7c5	d0ab44e8-5ed0-482f-b0bd-8a37c1acc8c4	food_bank_of_western_massachusetts_ma	West Springfield Brown Bag	A food pantry service located in West Springfield, MA.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:35.730829+00	2025-08-08 05:07:35.730829+00
a3ab0e73-c5a8-4301-a320-81a55d4f25cd	51bcaca4-1775-4cdb-af1b-da300249db32	toledo_northwestern_ohio_food_bank_oh	Lifeline Connect Baptist Church	Lifeline Connect Baptist Church offers a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:36.56775+00	2025-08-08 05:07:36.56775+00
43ef84a3-342d-4dcc-8e7c-06db543fb181	02f3af46-4d59-4e34-a610-e3e3f1a2b6f0	food_bank_of_western_massachusetts_ma	One Call Away Ludlow Veterans Services	Veterans services organization offering a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:38.332463+00	2025-08-08 05:07:38.332463+00
f8225927-dd44-4995-951f-834cb9c8db87	69420494-8c08-481a-832c-7b1919d46185	food_bank_of_western_massachusetts_ma	Gethsemane Church of Jesus Christ Food Pantry	Food pantry distributing pre-packed bags.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:39.136844+00	2025-08-08 05:07:39.136844+00
1dad05f5-1fe8-4da4-9207-f9993208dc0d	5b6111bc-65ea-49f7-b2ba-9580a57a944c	sfmarin_food_bank_ca	St. Andrew MB Church	St. Andrew MB Church offers a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:39.982347+00	2025-08-08 05:07:39.982347+00
7bf95395-f35f-4e06-964b-b1da693baf0f	014f29cf-f8d4-4c52-a1af-6d8de391effb	second_harvest_food_bank_of_northwest_north_carolina_nc	Allied Churches of Alamance County	A community organization providing services in Alamance County.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:40.876119+00	2025-08-08 05:07:40.876119+00
2c96c121-0583-4fad-9ac1-c32ab1171bb5	5854ff62-b249-4993-a8b8-cc8448d1d1b7	sfmarin_food_bank_ca	Haight Ashbury Food Prog. NGN	Haight Ashbury Food Program NGN provides food pantry services.	https://foodlocator.sfmfoodbank.org/en/site/HAFP	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:41.709381+00	2025-08-08 05:07:41.709381+00
31d0357b-fd3b-419e-80d4-7d746c3c05d6	627027e0-7c93-42bc-b1db-2012946e4315	sfmarin_food_bank_ca	Covenant Presbyterian Church	Covenant Presbyterian Church is a food pantry located in San Francisco, CA.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:43.467778+00	2025-08-08 05:07:43.467778+00
4ab809e5-e00f-44b5-bf81-21603c905b8b	791ede16-ec3c-410b-a72e-92c54eb09ad7	toledo_northwestern_ohio_food_bank_oh	Metamora U.M.C	A United Methodist Church providing food pantry services in Metamora, Ohio.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:44.338401+00	2025-08-08 05:07:44.338401+00
91e48df5-6684-47ba-8f5c-43f0e28ff91c	d6c17baf-e620-4e0a-a5fe-c6f78362aece	food_bank_of_western_massachusetts_ma	Springfield Jordan Senior Center	A senior center in Springfield, MA offering various services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:45.179733+00	2025-08-08 05:07:45.179733+00
a2aee57f-4e2d-4982-8f75-6ff2dd819c82	34f6be97-b55f-426f-8d01-cd9cace08fd7	capital_area_food_bank_dc	Alexandria Food Pantry	A food pantry providing services in Alexandria, VA.	\N	Maria.Rodriguez@ccda.net	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:46.017384+00	2025-08-08 05:07:46.017384+00
14ab03f4-9119-4e64-980f-052f0a484ce3	cc198679-8195-4f48-b9a7-0b1612da113f	toledo_northwestern_ohio_food_bank_oh	Monroe Street Neighborhood Center	Monroe Street Neighborhood Center is a community center providing food pantry services.	https://monroesnc.com/	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:46.848566+00	2025-08-08 05:07:46.848566+00
9816163e-3c3b-4d2c-8156-9b6fdfb75bdf	95ff2e43-5295-43aa-a661-d225bec2e494	capital_area_food_bank_dc	ADAMS CENTER	ADAMS CENTER is a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:47.657878+00	2025-08-08 05:07:47.657878+00
c30f1720-5583-4375-88ad-85dd7d5f0fe5	ee3e42d6-1c14-4446-b7b6-cef7f1187875	capital_area_food_bank_dc	Alafia Baptist Church	Alafia Baptist Church, a food pantry serving the Mount Rainier area.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:48.504045+00	2025-08-08 05:07:48.504045+00
340bc24c-4552-4198-b5d4-bd8f32b5db0e	1b5c1e5e-5181-4def-a9d9-8687552da058	toledo_northwestern_ohio_food_bank_oh	Moms Mobile Mission	A food pantry organization.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:49.354748+00	2025-08-08 05:07:49.354748+00
c496b77e-5e8b-4cff-8a9e-cae5e1fd8ce3	e279fe36-05b0-4fed-a5ca-9d49dc27b2b1	capital_area_food_bank_dc	ALIVE	ALIVE is a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:50.235734+00	2025-08-08 05:07:50.235734+00
bdd72607-b74e-45da-aa6c-0010c0da49f7	c5d20dd6-7ca5-4e74-8e75-9285cbbe0043	capital_area_food_bank_dc	Adventist Community Services of Greater Washington	Adventist Community Services of Greater Washington provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:51.128603+00	2025-08-08 05:07:51.128603+00
5556bd40-11b0-45c0-8b60-39815e3b03bd	4707190c-6a69-4521-a8c2-b3823eb021d6	food_bank_of_western_massachusetts_ma	International Christian Center Food Pantry	Food pantry services offered by International Christian Center.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:52.788133+00	2025-08-08 05:07:52.788133+00
c627e3b2-129a-48ab-817a-df845f82c630	c4e22307-9044-46db-957f-fc491611f0ba	the_food_pantries_org	Albany Community Action Partnership	Albany Community Action Partnership (ACAP) operates a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:53.691125+00	2025-08-08 05:07:53.691125+00
87df84e4-3311-40a7-bcb0-a6b733fe185d	0bc1e4ed-1e38-4642-80fc-9761ed6d2fd4	the_food_pantries_org	St. Patrick	St. Patrick's is a faith-based organization that operates a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:54.521374+00	2025-08-08 05:07:54.521374+00
fbe74301-e20f-4b22-a002-241a8eee6196	b5c13cfa-4402-4393-87d9-eb7a5a154709	second_harvest_of_silicon_valley_ca	Goodwill of Silicon Valley	Goodwill of Silicon Valley provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:55.367644+00	2025-08-08 05:07:55.367644+00
38308a49-de35-4dac-aa20-d1c965fe31ae	7be01475-51a5-438d-8f75-c0ee2a439f82	capital_area_food_bank_dc	Alexander Memorial Baptist Church	Alexander Memorial Baptist Church offers food pantry services, including TEFAP.	\N	zshields10@icloud.com	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:56.217218+00	2025-08-08 05:07:56.217218+00
66ed1806-bcb4-42a9-8c5b-2fd7457befea	5ab59ea0-827a-4675-a5ac-9034b3ea6279	the_food_pantries_org	Alliance for Positive Health	Alliance for Positive Health is an organization that offers food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:57.077077+00	2025-08-08 05:07:57.077077+00
05c2ec9b-3d5d-4169-90b0-8ee720c1f940	b9273044-cfd6-47f0-8271-dc4503730fe7	second_harvest_of_silicon_valley_ca	LifeMoves - Opportunity Services Center	Provides ready-to-eat meals and other services to unhoused individuals.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:57.979421+00	2025-08-08 05:07:57.979421+00
1f8f11b2-c447-480b-aa85-e38016a12877	d78d5fdf-9077-424c-9574-bc7ff8f5850f	sfmarin_food_bank_ca	Richmond Neighborhood Center	Richmond Neighborhood Center is a community organization providing services in San Francisco.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:58.837174+00	2025-08-08 05:07:58.837174+00
4429dcfb-eb99-488d-8f0e-6b23deaec022	2ada2813-32f3-404c-a553-2e16e5119238	the_food_pantries_org	Altamont Community Food Pantry	A food pantry serving the Capital District, offering assistance twice a month.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:07:59.660968+00	2025-08-08 05:07:59.660968+00
bfb941d6-8953-4504-bf6c-28887f65e115	52f395ad-63ae-4893-954e-d25cb68afdd8	food_bank_of_western_massachusetts_ma	Indian Orchard Brown Bag	Indian Orchard Brown Bag is a food pantry service.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:00.556308+00	2025-08-08 05:08:00.556308+00
4e21bce9-49f0-4a5c-9d45-6a518664bf6f	e4e91853-017a-4bdd-a76f-c23434f2f3dd	second_harvest_of_silicon_valley_ca	Bay Area Maranatha Christian Center	Bay Area Maranatha Christian Center provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:01.570998+00	2025-08-08 05:08:01.570998+00
69c634fd-8dc7-4311-b50c-78f7a19c1ea3	5454407d-476b-4d6f-b507-67e1ed950280	second_harvest_of_silicon_valley_ca	SparkPoint at Cañada College	SparkPoint Center offering financial coaching and education, with information on community college enrollment and resources.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:04.303733+00	2025-08-08 05:08:04.303733+00
5558dc11-a27f-47a3-a7fe-e98275687e9a	c80f36c5-4362-43fc-956e-3e7ee3b4af42	food_bank_of_western_massachusetts_ma	Community Survival Center Food Pantry	Community Survival Center Food Pantry provides food assistance with guests limited to 6 visits per year.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:05.202785+00	2025-08-08 05:08:05.202785+00
ad31335a-d614-4f18-9a68-6f123a03b9a6	a4308ae7-de1c-4fc6-98d9-1fca724e047c	second_harvest_of_silicon_valley_ca	Pacifica Resource Center	Pacifica Resource Center provides community services including a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:06.055872+00	2025-08-08 05:08:06.055872+00
355a42fc-2c63-441a-b6e7-662662ba446d	fded1474-612c-479a-966c-2d9051296f7a	sfmarin_food_bank_ca	MEI Food Pantry	MEI Food Pantry is a food distribution site operated by SF-Marin Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:06.907353+00	2025-08-08 05:08:06.907353+00
e3c2b551-219e-4fa8-b1bd-7485ee2c7410	da7af643-e475-44df-b362-0d9c146f0342	mercer_food_finder	Arm In Arm	Provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:06:45.798198+00	2025-08-08 05:08:07.679372+00
291f81bc-0436-470c-9840-05a8583f7670	8706e58a-9278-4855-9ff4-07ab35d7dad6	food_bank_of_western_massachusetts_ma	Beaudoin Village/Yoerg Circle Mobile Food Bank	Mobile food bank service operating on the first Monday of each month.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:11.260016+00	2025-08-08 05:08:11.260016+00
cd84bea1-b052-4d19-8cd9-46f966cd7b97	e74d2389-2df1-4914-9958-80ea8c9d491d	the_food_basket_inc_hi	Salvation Army Lanai	Salvation Army Lanai provides a soup kitchen service.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:18.201336+00	2025-08-08 05:08:18.201336+00
7ff5e317-be9f-4b2a-882b-6bcb11e88e72	635f978b-aacd-49aa-8f3e-103e81e01134	food_bank_of_western_massachusetts_ma	All Nation Church of God Food Pantry	Pantry is open on the 2nd and 4th Saturday of each month from 9:00 a.m. – 1:00 p.m.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:23.444435+00	2025-08-08 05:08:23.444435+00
f00b2d53-c36b-46d2-90e3-49d05733f13c	3db8fb18-014b-4cba-93b4-fd03ab907c69	capital_area_food_bank_dc	Allen Chapel AME Church	A church offering food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:24.323772+00	2025-08-08 05:08:24.323772+00
c14d3011-a23a-4725-8e6c-d7cffd3dcacc	029acae3-a7aa-4e99-b988-32414afecc1d	capital_area_food_bank_dc	Allen Chapel AME Church Outreach Ministry	Allen Chapel AME Church Outreach Ministry provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:25.170186+00	2025-08-08 05:08:25.170186+00
acb9f1d0-f631-4aed-aecf-96d576e8a63a	817250f0-dd79-4bcc-ac24-532b60f78ce0	capital_area_food_bank_dc	Ambassador Baptist Church	Ambassador Baptist Church is a food pantry that provides food assistance.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:26.938314+00	2025-08-08 05:08:26.938314+00
b7876054-4b6e-4a88-86ce-05d06d3292e0	64fa9639-50d2-48ac-bff7-9a1d72714f31	capital_area_food_bank_dc	Apostolic Church Glorious Vision	A food pantry operated by Apostolic Church Glorious Vision, supported by Capital Area Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:27.779658+00	2025-08-08 05:08:27.779658+00
aaf2bc0b-dd1d-4da5-bb4e-ef56b4968622	c4a6f065-5920-457a-9aad-7c54d7df9989	capital_area_food_bank_dc	Antioch Baptist Church of Clinton	Antioch Baptist Church of Clinton provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:28.641225+00	2025-08-08 05:08:28.641225+00
491ebba9-819f-4e6d-aed7-1cbc1a7e0cfe	ce3ae043-46d7-4dea-867a-cef5e3e615e5	capital_area_food_bank_dc	Ark of Grace Mission, Inc	Ark of Grace Mission, Inc. is a food pantry providing services to the community.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:30.348788+00	2025-08-08 05:08:30.348788+00
229f8047-aa0f-4b76-8c33-945145a20cac	d89af38c-e08a-4359-9f7a-0ee50719caea	capital_area_food_bank_dc	Arlington Bridge Builders	Arlington Bridge Builders provides food pantry services.	\N	tjgm_2013@yahoo.com	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:31.255249+00	2025-08-08 05:08:31.255249+00
81ee2d2c-737c-4a75-93bb-acb704e073ea	a4eed536-98f3-40f3-ab92-64a3a1bd0d13	capital_area_food_bank_dc	Arlington Mill Community Center	Community center providing food pantry services.	\N	aprivera@capitalareafoodbank.org	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:32.275495+00	2025-08-08 05:08:32.275495+00
b1042d1b-fa21-4506-8862-1120758fa384	7cfc5bbb-5efc-486b-81be-92df7c50864b	rutgers_against_hunger	Epiphany Lutheran Church	Food pantry in Atlantic County, NJ.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:33.305582+00	2025-08-08 05:08:33.305582+00
04b4f5b5-9268-492d-85ed-b2aa85a6afc9	d0867005-df45-4414-965f-db71589eb3c1	the_food_pantries_org	Bellevue Reformed Church	Bellevue Reformed Church operates a Little Free Food Pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:35.434165+00	2025-08-08 05:08:35.434165+00
7051b324-6594-4785-b63e-ed1e4f2012b4	3040b6d3-e888-42fc-ae33-44ca3f5fe488	capital_area_food_bank_dc	Assumption Outreach	Assumption Outreach provides food assistance services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:36.476947+00	2025-08-08 05:08:36.476947+00
7ebc150f-bd5b-4af2-a9fc-efad8dcb7f32	2c4bd260-861c-4ebb-a158-96ced71cdb6b	the_food_pantries_org	Bethesda House of Schenectady	Bethesda House of Schenectady provides food pantry services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:39.474703+00	2025-08-08 05:08:39.474703+00
4f4cbc80-2cd0-4179-bcd9-ae277b891ace	871bb9bb-a6b1-4abc-9276-d6c2841666e6	rutgers_against_hunger	Friends of Jean Webster Soup Kitchen	Food pantry in Atlantic County, NJ offering Soup Kitchen services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:41.207618+00	2025-08-08 05:08:41.207618+00
9233c234-783d-4dcd-8922-fbed7b84e2bd	51f083a2-ec50-4c9b-9690-3bffb97d18ee	capital_area_food_bank_dc	Bethel Stand for Life Outreach Ministries	Bethel Stand for Life Outreach Ministries is an organization that provides services.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:42.105336+00	2025-08-08 05:08:42.105336+00
c38f550b-bb04-482e-bc4c-bf41dc7a49e6	ea1c6dbd-25b3-4faf-906f-91ab0c7a7340	the_food_pantries_org	Berlin Food Closet	A food pantry serving the Capital District.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:44.653635+00	2025-08-08 05:08:44.653635+00
0bfcc2fa-9f2f-4ac7-a59c-c970da231dbc	b6873215-f79c-4d04-aa14-1a79e5d0cf1a	the_food_pantries_org	Trinity Alliance of the Capital Region	Trinity Alliance of the Capital Region is an organization that operates food pantries.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:46.389301+00	2025-08-08 05:08:46.389301+00
b0a612b4-fd4f-4a34-a3f2-6b99367f7a44	ea68d5c3-210e-4fc1-b2f5-3dc8e3aeb48d	capital_area_food_bank_dc	Beltsville Adventist Community Center	A community center offering food pantry services, affiliated with Capital Area Food Bank.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:48.137306+00	2025-08-08 05:08:48.137306+00
b09fc55b-d4f9-48b2-826b-2d54812bda4f	124b3f98-68fd-4e7a-8453-5e3b1eb504c1	rutgers_against_hunger	Grace Tabernacle	Food pantry in Atlantic County, NJ.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:50.914422+00	2025-08-08 05:08:50.914422+00
ccab1764-3bd7-4f02-b580-1ec6ef7a7817	36081f29-cf6d-41df-a568-dab1a36921ad	capital_area_food_bank_dc	Bethesda Help	Bethesda Help is a food pantry.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:51.844086+00	2025-08-08 05:08:51.844086+00
a58d31dd-1114-40dc-8daf-5f23dd9c52b2	b4b38405-fcfc-4ecb-b4d4-6479cb74b94c	capital_area_food_bank_dc	Boat People SOS	Boat People SOS is an organization that provides services to the community.	\N	\N	\N	\N	\N	\N	\N	\N	2025-08-08 05:08:52.773457+00	2025-08-08 05:08:52.773457+00
\.


--
-- Data for Name: phone; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.phone (id, location_id, service_id, organization_id, contact_id, service_at_location_id, number, extension, type, description) FROM stdin;
9ce5604c-ffb5-4003-b590-36e04af814ae	\N	\N	46e0563b-7653-4471-a862-e2e1a366ab71	\N	\N	419-690-9786	\N	voice	\N
9e1867d7-b07f-4509-8183-e1fa7327f716	\N	\N	6ab6a80c-75c4-43f9-ae91-36c498c5821a	\N	\N	4195991896	\N	voice	\N
40ee2395-7077-43ea-a0c2-2ece0c3e823f	\N	\N	480ae46f-da0f-440f-80ff-add05a25c060	\N	\N	4192419277	\N	voice	\N
0547a4b0-0b98-4455-9e42-b0c9d6afb26e	\N	\N	16838842-d076-4e5e-b1fb-3fe49ca0e748	\N	\N	419-445-0366	\N	voice	\N
bfccdc75-ed81-44b2-8fd3-7f898f919500	\N	\N	a1325dc8-3ae8-4903-b5fa-e1968bceab87	\N	\N	419-487-1324	\N	voice	\N
478f823e-a1c4-46f0-a718-022ed687710a	\N	\N	066f4a13-2353-4bec-ade2-64b6cf42a503	\N	\N	4192434214	\N	voice	\N
50baf5c9-3f5a-49c3-974d-d131583c41e7	\N	\N	8aeedc32-0ae6-49db-8cbb-6d03debfa0be	\N	\N	4198224975	\N	voice	\N
bc01d89f-799e-431e-b1af-125d83cf7872	\N	\N	bc11aabf-c0ad-4d05-a133-d8d0b42d6be2	\N	\N	4198623166	\N	voice	\N
8d79c8c9-c252-40d2-8dad-cc64cca747d6	\N	\N	5e63caa4-b501-42f8-be89-66edba85836e	\N	\N	4194733280	\N	voice	\N
307576b2-71df-47e1-b3e2-bdf54c69a45d	\N	\N	e0c1617d-0eb5-48e5-8c48-0ede1614acde	\N	\N	(419)445-8361	\N	voice	\N
4cbe2f9a-05b3-420e-8a45-9676b27c15de	\N	\N	f6e0dadd-d53c-4b24-a5eb-37e635069f40	\N	\N	413-592-9528	\N	voice	\N
1fcf3631-b0ee-40f3-b7cf-51f66bb7804d	\N	\N	5d62e67d-c5ff-4eca-9134-142c5cbf0720	\N	\N	413-437-8071	\N	voice	\N
f6e1ffb7-cd53-433f-9c5d-48d44cefa241	\N	\N	fde32e1f-604c-4554-9726-56a19f8c8e27	\N	\N	413-534-8103	\N	voice	\N
0155542e-c295-4538-96d7-d158ef3e911a	\N	\N	f6e0dadd-d53c-4b24-a5eb-37e635069f40	\N	\N	(413) 592-9528	\N	voice	\N
7c1a37c3-f9dd-483d-97dd-dec5c064d13c	\N	\N	f6e0dadd-d53c-4b24-a5eb-37e635069f40	\N	\N	(413) 592-9528	\N	voice	\N
bdc07b7c-64ff-4f30-b857-5250e006db8f	\N	\N	663111ef-d042-41b9-a14b-d6f8941a3c8b	\N	\N	419-242-5505	\N	voice	\N
bf6bd9b2-352e-47f0-a7ae-d0f536f79eab	\N	\N	a5375519-627b-4c24-ac09-6e7a0ec773db	\N	\N	419-357-7457	\N	voice	\N
46abd91f-f1d7-478a-9721-cd4e91eb16a1	\N	\N	86190ee7-85f2-4f37-a03d-2119fe9d6f61	\N	\N	(419)334-8353	\N	voice	\N
90e2d448-4cf1-4baf-bd1d-36f8e66d5adc	\N	\N	f6e0dadd-d53c-4b24-a5eb-37e635069f40	\N	\N	413-592-9528	\N	voice	\N
ac1078bc-070b-41c6-a4c0-9cc193c548ce	\N	\N	ab54bd2c-64fb-4434-98f5-5e31bff6f7cd	\N	\N	(413) 538-8026	\N	voice	\N
b182fb63-8614-48cd-8ca1-94808fd1ac63	\N	\N	97e4097e-3b03-4834-a94c-6892331cae1d	\N	\N	419-214-2648	\N	voice	\N
a163f68c-d79b-404b-92d6-41ddf10893d1	\N	\N	db45357c-bc03-4eb3-9a73-2a2724eefaf4	\N	\N	4192482467	\N	voice	\N
487441ad-cf22-4854-a253-dee9a3ead5ed	\N	\N	103901e1-88f1-4590-8c11-f73271f2a702	\N	\N	419-984-8448	\N	voice	\N
70d37233-148d-47f8-afe4-27d99ab7babb	\N	\N	241c19a0-5185-4fd2-87e2-e21aed0fd1ee	\N	\N	419-485-5575	\N	voice	\N
e33c687f-31b2-4698-a297-068cf85b577d	\N	\N	0d06952e-e0b4-4bce-8284-1f4ac9bf7d31	\N	\N	(413) 314-9067	\N	voice	\N
73954d9e-cac9-4dba-91a3-c31a3905f58c	\N	\N	0b78e55b-8a41-4d20-b99d-7b2f304773d9	\N	\N	UNKNOWN	\N	voice	\N
b1d87fdc-25ee-4bdf-bca7-8df466773e2c	\N	\N	41e6a5fe-cfd5-482b-8074-1a89c6b1e5fe	\N	\N	(419)644-4014	\N	voice	\N
0cc6c879-fb05-4a8e-b201-cfc277a6cd8c	\N	\N	981cfa6f-684e-47b0-a9a6-fd1ceb725192	\N	\N	4198361210	\N	voice	\N
fef5ee0f-4b28-44d8-b47e-2b1b93a82e9b	\N	\N	72ca5f23-f431-4766-8456-2889c75f0025	\N	\N	413-532-0713	\N	voice	\N
5e03e64d-bdc2-4f19-93a9-d20ab2a59ac0	\N	\N	941e6706-496f-4a65-843a-a55db8f5d904	\N	\N	(413) 437-7593	\N	voice	\N
d6941d66-9e1e-4e8e-bbc0-33b97727e137	\N	\N	5931b34f-fd9d-4ed5-880b-190b8118a48c	\N	\N	413-200-0624	\N	voice	\N
f9f900ab-4f20-463c-97ac-4931736f0a44	\N	\N	8e9debc1-6c04-4660-8f56-6c7a5cd0b4cb	\N	\N	419-349-0457	\N	voice	\N
84cc6ee7-93b9-4e99-abcf-306972b19c60	\N	\N	51bcaca4-1775-4cdb-af1b-da300249db32	\N	\N	2604932994	\N	voice	\N
b92dd3f8-d432-4043-959b-8c1ea9457b13	\N	\N	02f3af46-4d59-4e34-a610-e3e3f1a2b6f0	\N	\N	413-707-5050	\N	voice	\N
71fb205b-f044-4c38-a808-1ffc9325eb9a	\N	\N	014f29cf-f8d4-4c52-a1af-6d8de391effb	\N	\N	336-229-0881	\N	voice	\N
88d04214-2dab-4d01-998b-53c93cadb7d9	\N	\N	5854ff62-b249-4993-a8b8-cc8448d1d1b7	\N	\N	415-374-3843	\N	voice	\N
dbca1166-be1d-4507-ab6f-0d86a76b8c4c	\N	\N	ee3e42d6-1c14-4446-b7b6-cef7f1187875	\N	\N	301-985-3090	\N	voice	\N
b22c082c-09e7-44a4-b5d1-9a7cc36f0b80	\N	\N	c5d20dd6-7ca5-4e74-8e75-9285cbbe0043	\N	\N	2407235650	\N	voice	\N
a9e034b2-ef86-4ba4-babe-33cee88266ac	\N	\N	4707190c-6a69-4521-a8c2-b3823eb021d6	\N	\N	(413) 246-0797	\N	voice	\N
4bc99e7d-b90d-4892-abe2-d5337fc8f752	\N	\N	0bc1e4ed-1e38-4642-80fc-9761ed6d2fd4	\N	\N	+1-518-756-3145	\N	voice	\N
59981a4c-1fe7-4019-9053-a2ec1b8a8caf	\N	\N	5ab59ea0-827a-4675-a5ac-9034b3ea6279	\N	\N	518-434-4686	\N	voice	\N
d7124330-a603-4efa-9d68-07cf605ba5b4	\N	\N	d78d5fdf-9077-424c-9574-bc7ff8f5850f	\N	\N	4157508554	\N	voice	\N
d2fd4bba-5091-4153-81d4-9bec8c3b2d66	\N	\N	52f395ad-63ae-4893-954e-d25cb68afdd8	\N	\N	4136368755	\N	voice	\N
275ed9cc-bbc6-4a94-92e6-ca9f1d2c19ac	\N	\N	c80f36c5-4362-43fc-956e-3e7ee3b4af42	\N	\N	(413) 543-3930	\N	voice	\N
7e01a8fd-448c-4d42-ac6d-649b5fb0597c	\N	\N	83938a98-6227-43f4-8b94-7a5dad665ca2	\N	\N	484-720-8644	\N	voice	\N
68b5ec71-8c8e-446b-85c5-a5b5be31c2ce	\N	\N	3db8fb18-014b-4cba-93b4-fd03ab907c69	\N	\N	202-494-9824	\N	voice	\N
5c8551ea-67d6-42a0-98d7-07ef625ffb8f	\N	\N	817250f0-dd79-4bcc-ac24-532b60f78ce0	\N	\N	2026781993	\N	voice	\N
e4ee44a7-5882-483d-8a98-16583aabb2c4	\N	\N	64fa9639-50d2-48ac-bff7-9a1d72714f31	\N	\N	2404630150	\N	voice	\N
36eaa6ad-38d6-4440-a0a5-d511cb1de6bc	\N	\N	d89af38c-e08a-4359-9f7a-0ee50719caea	\N	\N	571-282-5156	\N	voice	\N
1ce4b336-e055-455b-bcf0-0c2c37d79002	\N	\N	a4eed536-98f3-40f3-ab92-64a3a1bd0d13	\N	\N	2029842912	\N	voice	\N
2d5bc192-ec54-461b-beb5-6daf784833de	\N	\N	3040b6d3-e888-42fc-ae33-44ca3f5fe488	\N	\N	202-561-5941	\N	voice	\N
df641f5f-2638-4fd3-944a-a13980250351	\N	\N	871bb9bb-a6b1-4abc-9276-d6c2841666e6	\N	\N	6094572999	\N	voice	\N
95ba2788-2744-4f42-9b61-ebaa2d7fc9ab	\N	\N	ea1c6dbd-25b3-4faf-906f-91ab0c7a7340	\N	\N	518-658-2942	\N	voice	\N
02f93c68-828f-4932-8aed-09270af2438d	\N	\N	b6873215-f79c-4d04-aa14-1a79e5d0cf1a	\N	\N	518-463-1516	\N	voice	\N
8a82c338-23bb-4aac-9f36-fca4feb63dc0	\N	\N	124b3f98-68fd-4e7a-8453-5e3b1eb504c1	\N	\N	6096414701	\N	voice	\N
\.


--
-- Data for Name: program; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.program (id, organization_id, name, alternate_name, description) FROM stdin;
\.


--
-- Data for Name: reconciler_config; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reconciler_config (key, value, description, updated_at) FROM stdin;
max_retry_attempts	3	Maximum number of retry attempts for constraint violations	2025-08-08 05:02:03.366895+00
retry_base_delay_ms	100	Base delay in milliseconds between retries	2025-08-08 05:02:03.366895+00
retry_backoff_multiplier	2.0	Exponential backoff multiplier for retries	2025-08-08 05:02:03.366895+00
location_tolerance	0.0001	Default coordinate tolerance for location matching (≈11m)	2025-08-08 05:02:03.366895+00
\.


--
-- Data for Name: reconciler_constraint_violations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reconciler_constraint_violations (id, constraint_name, table_name, operation, conflicting_data, resolved, created_at, resolved_at) FROM stdin;
\.


--
-- Data for Name: record_version; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.record_version (id, record_id, record_type, version_num, data, created_at, created_by, source_id) FROM stdin;
27a99b70-7124-4c9d-91fe-abea08b1a6f9	c603c5a9-235a-46f1-a19c-165ba6e5b69a	organization_source	1	{"uri": null, "name": "Anthony Wayne Community Food Ministry, Inc.", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A community food ministry providing food pantry services.", "content_hash": "3025b3098fdc296fea8e12b275f1eb18b4ab041a842b5f6decc0af7b7711cbe9", "legal_status": null, "organization_id": "51ac2f64-fff9-4f48-b711-1a697f8ca95d", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:17.160878+00	reconciler	c603c5a9-235a-46f1-a19c-165ba6e5b69a
0d1ee85b-ad00-4b12-bc93-dbbc154ec097	51ac2f64-fff9-4f48-b711-1a697f8ca95d	organization	1	{"uri": null, "name": "Anthony Wayne Community Food Ministry, Inc.", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A community food ministry providing food pantry services.", "content_hash": "3025b3098fdc296fea8e12b275f1eb18b4ab041a842b5f6decc0af7b7711cbe9", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:17.163919+00	reconciler	\N
b350bb7f-e932-46f4-9f83-f9fba59f00e3	d5c21183-20f3-449f-adbd-18bec7b9f13e	organization_source	1	{"uri": null, "name": "Brown Bag Food Project", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry service provider.", "content_hash": "25e4c1113b353501c675519f3a6215d8222a39e0c0aa24c7a6618ad905ce2320", "legal_status": null, "organization_id": "b2d53d3a-9b74-43f5-b634-b9e9dcec76d7", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:18.197234+00	reconciler	d5c21183-20f3-449f-adbd-18bec7b9f13e
4c4a9663-77a1-40e4-a245-f9e778a65744	b2d53d3a-9b74-43f5-b634-b9e9dcec76d7	organization	1	{"uri": null, "name": "Brown Bag Food Project", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry service provider.", "content_hash": "25e4c1113b353501c675519f3a6215d8222a39e0c0aa24c7a6618ad905ce2320", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:18.205291+00	reconciler	\N
e5a97edb-16c4-40b0-9db9-426d51a30e92	7fe4cf81-081b-4cd1-8adf-3f95ca23f5d0	organization_source	1	{"uri": null, "name": "Christ Church Triumphant", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing food assistance.", "content_hash": "6e89476e22badc7b3cd40177be369a39608bc4d69eb707a1287145a37a918a01", "legal_status": null, "organization_id": "46e0563b-7653-4471-a862-e2e1a366ab71", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:19.200174+00	reconciler	7fe4cf81-081b-4cd1-8adf-3f95ca23f5d0
2d4a6ead-7bf4-4a43-9b8b-e15157a0407c	46e0563b-7653-4471-a862-e2e1a366ab71	organization	1	{"uri": null, "name": "Christ Church Triumphant", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing food assistance.", "content_hash": "6e89476e22badc7b3cd40177be369a39608bc4d69eb707a1287145a37a918a01", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:19.20427+00	reconciler	\N
922a5d9d-0505-4c5c-bf58-b8c6b99b1521	9ce5604c-ffb5-4003-b590-36e04af814ae	phone	1	{"type": "voice", "number": "419-690-9786", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "6e89476e22badc7b3cd40177be369a39608bc4d69eb707a1287145a37a918a01", "organization_id": "46e0563b-7653-4471-a862-e2e1a366ab71", "service_at_location_id": null}	2025-08-08 05:05:19.205607+00	reconciler	\N
fa9a164e-31a6-4706-95d3-f579784afd48	00998fe1-52d4-4684-98d0-bebc1ad9074a	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "9ce5604c-ffb5-4003-b590-36e04af814ae", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "6e89476e22badc7b3cd40177be369a39608bc4d69eb707a1287145a37a918a01"}	2025-08-08 05:05:19.205607+00	reconciler	\N
4a8659bb-77ba-4aa9-8d98-f4a22c8e58ef	24144c3a-4e57-4b83-9d56-ee1520f2226b	organization_source	1	{"uri": null, "name": "Blackburn Ministries", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A ministry providing food pantry services.", "content_hash": "c71c73c279a2b6027974f27933f7c62496cc877a9b6a1fcd7bab0f4348b9869c", "legal_status": null, "organization_id": "6ab6a80c-75c4-43f9-ae91-36c498c5821a", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:22.087471+00	reconciler	24144c3a-4e57-4b83-9d56-ee1520f2226b
46d3e55f-4229-4f76-b04b-c75f924fb61f	6ab6a80c-75c4-43f9-ae91-36c498c5821a	organization	1	{"uri": null, "name": "Blackburn Ministries", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A ministry providing food pantry services.", "content_hash": "c71c73c279a2b6027974f27933f7c62496cc877a9b6a1fcd7bab0f4348b9869c", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:22.089617+00	reconciler	\N
476087cd-9aa8-4b49-94f7-a1c4b73f7236	9e1867d7-b07f-4509-8183-e1fa7327f716	phone	1	{"type": "voice", "number": "4195991896", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "c71c73c279a2b6027974f27933f7c62496cc877a9b6a1fcd7bab0f4348b9869c", "organization_id": "6ab6a80c-75c4-43f9-ae91-36c498c5821a", "service_at_location_id": null}	2025-08-08 05:05:22.091017+00	reconciler	\N
2bdf5a54-1167-49b3-a1ef-9dc470604ed4	d3ca5ee7-1726-4429-898d-3381f438debb	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "9e1867d7-b07f-4509-8183-e1fa7327f716", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "c71c73c279a2b6027974f27933f7c62496cc877a9b6a1fcd7bab0f4348b9869c"}	2025-08-08 05:05:22.091017+00	reconciler	\N
3617d58c-9317-43c2-8092-d4acdf4a4829	c508df51-4677-447a-a428-5c9b5532f94a	organization_source	1	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Second Harvest of Silicon Valley is a food bank serving Santa Clara and San Mateo counties in California.", "content_hash": "21e75dd0e5ca4e2411d4f6cd36def4e416a015b072a01be616f7bc807cb40b56", "legal_status": null, "organization_id": "324e6d0f-f577-40ff-a350-bf25cde132a8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:23.729647+00	reconciler	c508df51-4677-447a-a428-5c9b5532f94a
418b391a-993a-46d9-bcaf-73b4b66e6898	324e6d0f-f577-40ff-a350-bf25cde132a8	organization	1	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Second Harvest of Silicon Valley is a food bank serving Santa Clara and San Mateo counties in California.", "content_hash": "21e75dd0e5ca4e2411d4f6cd36def4e416a015b072a01be616f7bc807cb40b56", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:23.731342+00	reconciler	\N
02a9b7d0-df26-457d-8ed2-391341c63f6e	4fafd105-3912-41c0-8ab9-677067fb5916	organization_source	1	{"uri": null, "name": "Aldersgate United Methodist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Aldersgate United Methodist Church offers food pantry services.", "content_hash": "27c6f4e462df974b06fbaa0f3ded53ceedc2e0bd9fc507412d57f68ecca28673", "legal_status": null, "organization_id": "97edfa8e-11e0-40d4-a929-898067d28342", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:24.618806+00	reconciler	4fafd105-3912-41c0-8ab9-677067fb5916
c9b29f70-b519-4950-8b85-1efdc6fdc577	97edfa8e-11e0-40d4-a929-898067d28342	organization	1	{"uri": null, "name": "Aldersgate United Methodist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Aldersgate United Methodist Church offers food pantry services.", "content_hash": "27c6f4e462df974b06fbaa0f3ded53ceedc2e0bd9fc507412d57f68ecca28673", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:24.621146+00	reconciler	\N
db66aca4-6949-4f70-9710-36122bdba512	324a3bc3-e766-436f-a613-4ca0aa712f8b	organization_source	1	{"uri": null, "name": "Community Action of Napa Valley Food Bank", "email": null, "source": "community_action_of_napa_valley_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "community_action_of_napa_valley_food_bank_ca", "tax_status": null, "description": "Community Action of Napa Valley operates a food pantry, providing food assistance to those in need.", "content_hash": "e3156dc4455151f45a4799bdecbe30d636ed95c114a30edab69bd58c2aba36c1", "legal_status": null, "organization_id": "a85d4032-c780-43bc-bbed-d2d87a7df0b0", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:25.531209+00	reconciler	324a3bc3-e766-436f-a613-4ca0aa712f8b
35e51778-cd4f-4af4-a818-04394b93c61f	a85d4032-c780-43bc-bbed-d2d87a7df0b0	organization	1	{"uri": null, "name": "Community Action of Napa Valley Food Bank", "email": null, "source": "community_action_of_napa_valley_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "community_action_of_napa_valley_food_bank_ca", "tax_status": null, "description": "Community Action of Napa Valley operates a food pantry, providing food assistance to those in need.", "content_hash": "e3156dc4455151f45a4799bdecbe30d636ed95c114a30edab69bd58c2aba36c1", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:25.532854+00	reconciler	\N
bec1eba2-2d76-448f-b44d-9d6407b41bb4	53db24ce-2348-4475-9ae9-380efd41cf1c	organization_source	1	{"uri": null, "name": "Bowling Green Christian Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Bowling Green, Ohio.", "content_hash": "0d159a17203f2ce5bcd0d6a78d0e046f659594901820ac94d7201f58a7987e5f", "legal_status": null, "organization_id": "4953c7e5-5219-4974-bf3e-898fcbf90001", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:28.272405+00	reconciler	53db24ce-2348-4475-9ae9-380efd41cf1c
daf91917-8abf-4356-8b87-80b1bb0ffab1	4953c7e5-5219-4974-bf3e-898fcbf90001	organization	1	{"uri": null, "name": "Bowling Green Christian Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Bowling Green, Ohio.", "content_hash": "0d159a17203f2ce5bcd0d6a78d0e046f659594901820ac94d7201f58a7987e5f", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:28.274206+00	reconciler	\N
b1d01ec2-54a0-4f97-a3bd-ca7177429ecc	c508df51-4677-447a-a428-5c9b5532f94a	organization_source	2	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A food bank serving Silicon Valley.", "content_hash": "31c74e304951785453efea761dbebeab0b53477d0ceb70b371fc963ed03cb16f", "legal_status": null, "organization_id": "324e6d0f-f577-40ff-a350-bf25cde132a8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:29.339044+00	reconciler	c508df51-4677-447a-a428-5c9b5532f94a
d8db6116-566e-465e-9f68-da843a5cd910	cdf356e7-cbd5-4078-9440-4d21bf7c524d	organization_source	1	{"uri": null, "name": "Catholic Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Catholic Food Pantry providing food assistance.", "content_hash": "29b72d5670845b7a6adaa524caa7bd373ed3c0cbf827a89326988c34c70a55da", "legal_status": null, "organization_id": "8e7216fa-4cea-4a28-832f-99e6a63ef221", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:30.314982+00	reconciler	cdf356e7-cbd5-4078-9440-4d21bf7c524d
6222d7ec-f51d-4a69-ac67-d2c2c3548a3a	8e7216fa-4cea-4a28-832f-99e6a63ef221	organization	1	{"uri": null, "name": "Catholic Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Catholic Food Pantry providing food assistance.", "content_hash": "29b72d5670845b7a6adaa524caa7bd373ed3c0cbf827a89326988c34c70a55da", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:30.317067+00	reconciler	\N
d965bd53-1449-405e-b2ec-675cc862f68f	ad63459b-4d59-4e1d-8495-fc05b0f5aa7b	organization_source	1	{"uri": null, "name": "Beach House Family Shelter", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Beach House Family Shelter provides shelter services.", "content_hash": "70c4c17575306b3b2ae6bf712038befc766e7c3fdddeb38ee3189ec27f9530c9", "legal_status": null, "organization_id": "480ae46f-da0f-440f-80ff-add05a25c060", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:31.216777+00	reconciler	ad63459b-4d59-4e1d-8495-fc05b0f5aa7b
88a17d5b-d32f-4917-b4bb-4955701f506a	480ae46f-da0f-440f-80ff-add05a25c060	organization	1	{"uri": null, "name": "Beach House Family Shelter", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Beach House Family Shelter provides shelter services.", "content_hash": "70c4c17575306b3b2ae6bf712038befc766e7c3fdddeb38ee3189ec27f9530c9", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:31.218583+00	reconciler	\N
928ca18c-114b-46b0-a351-20debb1a64d9	40ee2395-7077-43ea-a0c2-2ece0c3e823f	phone	1	{"type": "voice", "number": "4192419277", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "70c4c17575306b3b2ae6bf712038befc766e7c3fdddeb38ee3189ec27f9530c9", "organization_id": "480ae46f-da0f-440f-80ff-add05a25c060", "service_at_location_id": null}	2025-08-08 05:05:31.220085+00	reconciler	\N
6b023225-4e5e-44db-a71c-0a77f09b937a	493da5c8-7cef-4e1f-8cde-1c139e0840f6	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "40ee2395-7077-43ea-a0c2-2ece0c3e823f", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "70c4c17575306b3b2ae6bf712038befc766e7c3fdddeb38ee3189ec27f9530c9"}	2025-08-08 05:05:31.220085+00	reconciler	\N
50fc3200-bccb-4327-bdcd-4a89bf0b7251	0366e614-c728-4453-996d-f0a2ceea4035	organization_source	1	{"uri": null, "name": "City Team", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "City Team provides food assistance services.", "content_hash": "a188774d8022679ec0976fb1a70e037aac2ba048435b16618b96f89b4d843709", "legal_status": null, "organization_id": "2cd075d5-177d-4b0e-827b-27d746ec1d4b", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:32.170756+00	reconciler	0366e614-c728-4453-996d-f0a2ceea4035
dde35d73-b5ce-4f1e-9d43-fdbe13ad9836	2cd075d5-177d-4b0e-827b-27d746ec1d4b	organization	1	{"uri": null, "name": "City Team", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "City Team provides food assistance services.", "content_hash": "a188774d8022679ec0976fb1a70e037aac2ba048435b16618b96f89b4d843709", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:32.172561+00	reconciler	\N
b230c5bd-44f6-4b64-8c55-515864e4e0b1	00ecb28d-4e08-4afb-869f-fd65cbe747ad	organization_source	1	{"uri": null, "name": "Archbold Fish Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Archbold, Ohio, affiliated with the Toledo Northwestern Ohio Food Bank.", "content_hash": "908c6d1adfe6ce49cff561ecd973bfed3025a0aaaca86d0e4cf064fe30157101", "legal_status": null, "organization_id": "16838842-d076-4e5e-b1fb-3fe49ca0e748", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:33.159166+00	reconciler	00ecb28d-4e08-4afb-869f-fd65cbe747ad
0095db0a-2c2d-4eb9-8c93-6b5796aacadb	16838842-d076-4e5e-b1fb-3fe49ca0e748	organization	1	{"uri": null, "name": "Archbold Fish Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Archbold, Ohio, affiliated with the Toledo Northwestern Ohio Food Bank.", "content_hash": "908c6d1adfe6ce49cff561ecd973bfed3025a0aaaca86d0e4cf064fe30157101", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:33.161254+00	reconciler	\N
f567aed6-c83f-4d01-9776-5bf5a2118ae0	0547a4b0-0b98-4455-9e42-b0c9d6afb26e	phone	1	{"type": "voice", "number": "419-445-0366", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "908c6d1adfe6ce49cff561ecd973bfed3025a0aaaca86d0e4cf064fe30157101", "organization_id": "16838842-d076-4e5e-b1fb-3fe49ca0e748", "service_at_location_id": null}	2025-08-08 05:05:33.162704+00	reconciler	\N
4c4696df-ada7-4eb1-9743-b1eca6fff5e4	6251e9a8-e82e-4641-86c0-1a57aa984c1f	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "0547a4b0-0b98-4455-9e42-b0c9d6afb26e", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "908c6d1adfe6ce49cff561ecd973bfed3025a0aaaca86d0e4cf064fe30157101"}	2025-08-08 05:05:33.162704+00	reconciler	\N
099dd024-ec0e-45f7-8e47-1ff58060ebe0	7e477754-7bb6-4d7c-aa08-61db41f28d75	service_source	1	{"name": "Food Pantry", "source": "toledo_northwestern_ohio_food_bank_oh", "status": "active", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": "f97e5aa6-49ed-45ee-a1ff-ebf8f88655d4", "description": "Provides food assistance to individuals and families in need. Operating hours are the 2nd Tuesday of the month from 11:00 am to 1:00 pm, and the 3rd Tuesday of the month from 5:00 pm to 7:00 pm.", "content_hash": "908c6d1adfe6ce49cff561ecd973bfed3025a0aaaca86d0e4cf064fe30157101", "organization_id": "16838842-d076-4e5e-b1fb-3fe49ca0e748"}	2025-08-08 05:05:33.169557+00	reconciler	7e477754-7bb6-4d7c-aa08-61db41f28d75
f45aaa75-8770-4abb-8ce0-a6ecfeeb42da	f97e5aa6-49ed-45ee-a1ff-ebf8f88655d4	service	1	{"name": "Food Pantry", "source": "toledo_northwestern_ohio_food_bank_oh", "status": "active", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "description": "Provides food assistance to individuals and families in need. Operating hours are the 2nd Tuesday of the month from 11:00 am to 1:00 pm, and the 3rd Tuesday of the month from 5:00 pm to 7:00 pm.", "content_hash": "908c6d1adfe6ce49cff561ecd973bfed3025a0aaaca86d0e4cf064fe30157101", "organization_id": "16838842-d076-4e5e-b1fb-3fe49ca0e748"}	2025-08-08 05:05:33.17094+00	reconciler	\N
1405a6eb-4107-4492-9c6d-1ae1fce02548	eb2f7a6c-0204-4fc1-b919-1bac906a2e09	organization_source	1	{"uri": null, "name": "Bethel Assembly Of God Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A church offering food pantry services.", "content_hash": "438683f1af355305be5ee1164bd29e5f4d90748ff7c6da009b2a07d4a6fe6d7d", "legal_status": null, "organization_id": "321f76c9-f853-486c-a372-c37a015978cc", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:34.141698+00	reconciler	eb2f7a6c-0204-4fc1-b919-1bac906a2e09
14b896fd-f380-47f2-8945-19911927ad52	321f76c9-f853-486c-a372-c37a015978cc	organization	1	{"uri": null, "name": "Bethel Assembly Of God Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A church offering food pantry services.", "content_hash": "438683f1af355305be5ee1164bd29e5f4d90748ff7c6da009b2a07d4a6fe6d7d", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:34.143862+00	reconciler	\N
db9f8c18-c639-4ea2-8989-8bde25671aa4	eaf616eb-07f2-4269-b104-e88ac646396b	organization_source	1	{"uri": null, "name": "Samaritan House", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Samaritan House provides food pantry services, including Ready-To-Eat Meals and Walk up options.", "content_hash": "054d274ff15c25b60b8bfb04e5e9e08e83aa0e2e919312fecca837fb699846a4", "legal_status": null, "organization_id": "3e423664-a419-45a8-9a05-8b0f9b19495c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:35.059687+00	reconciler	eaf616eb-07f2-4269-b104-e88ac646396b
aa1706ce-98ed-41c5-8960-e7935d154fad	3e423664-a419-45a8-9a05-8b0f9b19495c	organization	1	{"uri": null, "name": "Samaritan House", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Samaritan House provides food pantry services, including Ready-To-Eat Meals and Walk up options.", "content_hash": "054d274ff15c25b60b8bfb04e5e9e08e83aa0e2e919312fecca837fb699846a4", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:35.061947+00	reconciler	\N
13d8de68-ac86-4795-86d8-dade8b503209	e0a0f90f-c5d9-41a8-bf42-df2f1e904592	organization_source	1	{"uri": null, "name": "Clyde Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Clyde, Ohio.", "content_hash": "d2579e3d2dcce9e30efe69c773ec5a6e172c6f593b4e31717e7f7aae0e8ae1f6", "legal_status": null, "organization_id": "e3dd9367-e294-4ad3-9264-8cc8f717550c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:36.008116+00	reconciler	e0a0f90f-c5d9-41a8-bf42-df2f1e904592
93e3d66d-266d-47ed-adcb-a148f9484d44	e3dd9367-e294-4ad3-9264-8cc8f717550c	organization	1	{"uri": null, "name": "Clyde Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Clyde, Ohio.", "content_hash": "d2579e3d2dcce9e30efe69c773ec5a6e172c6f593b4e31717e7f7aae0e8ae1f6", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:36.011645+00	reconciler	\N
a7983cc2-313f-402d-b942-baa1a6e69667	83fc6855-aa80-40f8-8f76-720e97a3a5f6	organization_source	1	{"uri": null, "name": "Christ's Cupboard Ministries", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing food assistance.", "content_hash": "a4bb71ab1a911faa0ef51c8db9894eaf40420a65b7d5cbf244961a425348c1bb", "legal_status": null, "organization_id": "a1325dc8-3ae8-4903-b5fa-e1968bceab87", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:37.839565+00	reconciler	83fc6855-aa80-40f8-8f76-720e97a3a5f6
e48dcbf5-02b9-4b95-a784-5b36b872e40e	a1325dc8-3ae8-4903-b5fa-e1968bceab87	organization	1	{"uri": null, "name": "Christ's Cupboard Ministries", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing food assistance.", "content_hash": "a4bb71ab1a911faa0ef51c8db9894eaf40420a65b7d5cbf244961a425348c1bb", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:37.841145+00	reconciler	\N
f9aa9f42-6030-428e-95fc-397fa358addb	bfccdc75-ed81-44b2-8fd3-7f898f919500	phone	1	{"type": "voice", "number": "419-487-1324", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "a4bb71ab1a911faa0ef51c8db9894eaf40420a65b7d5cbf244961a425348c1bb", "organization_id": "a1325dc8-3ae8-4903-b5fa-e1968bceab87", "service_at_location_id": null}	2025-08-08 05:05:37.842644+00	reconciler	\N
73be9564-46ba-42dd-bb49-8bd1ef2c42e4	627dc7d6-7e0f-4e9e-be71-a2705627345f	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "bfccdc75-ed81-44b2-8fd3-7f898f919500", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "a4bb71ab1a911faa0ef51c8db9894eaf40420a65b7d5cbf244961a425348c1bb"}	2025-08-08 05:05:37.842644+00	reconciler	\N
ac83636c-e15a-49f3-af6c-dac134e76d25	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	1	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving the Chester County region.", "content_hash": "a2f4b70a1492e8d3e1bdddb46780cb5b63dcc592b75914f613dd09239160d621", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:38.78657+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
ca27d3b7-af54-407f-8ca2-ed9e6eef5b6a	83938a98-6227-43f4-8b94-7a5dad665ca2	organization	1	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving the Chester County region.", "content_hash": "a2f4b70a1492e8d3e1bdddb46780cb5b63dcc592b75914f613dd09239160d621", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:38.788378+00	reconciler	\N
d7298ac7-7bed-4349-8945-b492cc9122a5	c508df51-4677-447a-a428-5c9b5532f94a	organization_source	3	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Second Harvest of Silicon Valley is a food bank serving the Silicon Valley area.", "content_hash": "8728a8ea52ef79d9a8a5cec73e76b30d4432b1a4c627bda84d305e9a99d13372", "legal_status": null, "organization_id": "324e6d0f-f577-40ff-a350-bf25cde132a8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:39.840047+00	reconciler	c508df51-4677-447a-a428-5c9b5532f94a
5225a7f9-386f-403c-9f6f-0eb2d8eb200b	a0e38421-e259-43f4-9634-27f5e8cb578a	organization_source	1	{"uri": null, "name": "Ecumenical Hunger Program", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Ecumenical Hunger Program provides food assistance to those in need.", "content_hash": "de6c40fcd7af5586fb2908c91f41e5212f37c498f92531ccea537e5fb27bccbe", "legal_status": null, "organization_id": "291c5723-d461-422a-a817-8c0ee2506f03", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:40.86397+00	reconciler	a0e38421-e259-43f4-9634-27f5e8cb578a
63a16e31-bb75-4646-8b38-61e73c4ba950	291c5723-d461-422a-a817-8c0ee2506f03	organization	1	{"uri": null, "name": "Ecumenical Hunger Program", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Ecumenical Hunger Program provides food assistance to those in need.", "content_hash": "de6c40fcd7af5586fb2908c91f41e5212f37c498f92531ccea537e5fb27bccbe", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:40.865864+00	reconciler	\N
d6bbd8d9-823b-48fd-b203-245f79f7d7b1	474cb9a5-a066-43ee-a3f5-459cd59e41c8	service_source	1	{"name": "Food Pantry", "source": "second_harvest_of_silicon_valley_ca", "status": "active", "scraper_id": "second_harvest_of_silicon_valley_ca", "service_id": "9d287856-43e7-4fb4-9916-b7951e7a1a9a", "description": "Provides free groceries through drive-thru and walk-up options.", "content_hash": "de6c40fcd7af5586fb2908c91f41e5212f37c498f92531ccea537e5fb27bccbe", "organization_id": "291c5723-d461-422a-a817-8c0ee2506f03"}	2025-08-08 05:05:40.86924+00	reconciler	474cb9a5-a066-43ee-a3f5-459cd59e41c8
3f4a2f30-6962-405f-a07b-05dce3d8d5b4	9d287856-43e7-4fb4-9916-b7951e7a1a9a	service	1	{"name": "Food Pantry", "source": "second_harvest_of_silicon_valley_ca", "status": "active", "scraper_id": "second_harvest_of_silicon_valley_ca", "description": "Provides free groceries through drive-thru and walk-up options.", "content_hash": "de6c40fcd7af5586fb2908c91f41e5212f37c498f92531ccea537e5fb27bccbe", "organization_id": "291c5723-d461-422a-a817-8c0ee2506f03"}	2025-08-08 05:05:40.870383+00	reconciler	\N
af3e5188-4efc-4a7f-865c-d3b92f01e4df	c508df51-4677-447a-a428-5c9b5532f94a	organization_source	4	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Second Harvest of Silicon Valley is a food bank serving the Silicon Valley area.", "content_hash": "11a2a432cca396c1aa868d1a9990bb062458c0ed53405ef49cce4c058c72dba6", "legal_status": null, "organization_id": "324e6d0f-f577-40ff-a350-bf25cde132a8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:41.797583+00	reconciler	c508df51-4677-447a-a428-5c9b5532f94a
4aed5d56-1d02-4664-acab-48f2c360beec	6eb95ab7-11bf-4a90-a280-555317b2f357	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "307576b2-71df-47e1-b3e2-bdf54c69a45d", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "6f1173c2320bbc2bfc6cfee7a6e8aaef702c5f0e31a5a9c1eb0107fd29036532"}	2025-08-08 05:06:02.499453+00	reconciler	\N
7b6f4f4c-1b99-419d-aae1-551ed98f7bb8	d35883f3-a624-4840-a56f-54801cdd023a	organization_source	1	{"uri": null, "name": "AIDS Community Resource Consortium", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "AIDS Community Resource Consortium provides food assistance to low-income, HIV positive individuals in San Mateo County.", "content_hash": "a68f6ceb71f018f27bad5fec07e89a764fc48effc95f65b32fa3d40038458e65", "legal_status": null, "organization_id": "c2f7cdbb-df9e-47f1-b2ea-1fc6c75ddc1c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:42.700198+00	reconciler	d35883f3-a624-4840-a56f-54801cdd023a
f544875a-01b0-4407-b1cc-a9bd7a635993	c2f7cdbb-df9e-47f1-b2ea-1fc6c75ddc1c	organization	1	{"uri": null, "name": "AIDS Community Resource Consortium", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "AIDS Community Resource Consortium provides food assistance to low-income, HIV positive individuals in San Mateo County.", "content_hash": "a68f6ceb71f018f27bad5fec07e89a764fc48effc95f65b32fa3d40038458e65", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:42.701962+00	reconciler	\N
9f402972-6906-4390-9882-2e72bbcdbdfc	aeb60844-ae27-47ac-9e67-fd64032af24e	organization_source	1	{"uri": null, "name": "Berwyn United Methodist Church Food Pantry", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Food pantry services offered by Berwyn United Methodist Church.", "content_hash": "46685a2174e4379c77984a9cff97a5b90c29edfc214f4f4b5448801597aee4ba", "legal_status": null, "organization_id": "82a41089-0c3c-4256-8301-50a2afeff04c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:43.727008+00	reconciler	aeb60844-ae27-47ac-9e67-fd64032af24e
5ab6dbe2-a8a9-4172-aa37-97c61efd1ed1	82a41089-0c3c-4256-8301-50a2afeff04c	organization	1	{"uri": null, "name": "Berwyn United Methodist Church Food Pantry", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Food pantry services offered by Berwyn United Methodist Church.", "content_hash": "46685a2174e4379c77984a9cff97a5b90c29edfc214f4f4b5448801597aee4ba", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:43.728876+00	reconciler	\N
1815254e-3e74-4d0d-8332-b5e475188a94	3ce1ebaa-0d7d-4084-bac3-7ac94fd95138	organization_source	1	{"uri": null, "name": "Community Heart Of Toledo - St. Paul's Lutheran", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Community Heart of Toledo, located at St. Paul's Lutheran, provides food assistance services.", "content_hash": "91032dc3fb9c80adba2683780e5e82d7c4d82da18dd7409de55b44799fc1f905", "legal_status": null, "organization_id": "066f4a13-2353-4bec-ade2-64b6cf42a503", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:44.683656+00	reconciler	3ce1ebaa-0d7d-4084-bac3-7ac94fd95138
f8df9986-4836-487f-84d3-23999a536d8a	066f4a13-2353-4bec-ade2-64b6cf42a503	organization	1	{"uri": null, "name": "Community Heart Of Toledo - St. Paul's Lutheran", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Community Heart of Toledo, located at St. Paul's Lutheran, provides food assistance services.", "content_hash": "91032dc3fb9c80adba2683780e5e82d7c4d82da18dd7409de55b44799fc1f905", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:44.685535+00	reconciler	\N
9689edef-2032-41e4-893f-d4fb7c458b87	478f823e-a1c4-46f0-a718-022ed687710a	phone	1	{"type": "voice", "number": "4192434214", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "91032dc3fb9c80adba2683780e5e82d7c4d82da18dd7409de55b44799fc1f905", "organization_id": "066f4a13-2353-4bec-ade2-64b6cf42a503", "service_at_location_id": null}	2025-08-08 05:05:44.687083+00	reconciler	\N
934b345a-6d69-469b-88aa-4d4a18274982	d90bf27a-3c9c-4477-949d-efb71212bef8	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "478f823e-a1c4-46f0-a718-022ed687710a", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "91032dc3fb9c80adba2683780e5e82d7c4d82da18dd7409de55b44799fc1f905"}	2025-08-08 05:05:44.687083+00	reconciler	\N
cb60941d-fcbc-4626-8321-ddd0037d360d	35600921-3c79-45e7-94ad-3031e8258aad	organization_source	1	{"uri": null, "name": "Echo Meadows Church Of Christ", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Echo Meadows Church Of Christ is a religious organization that also provides food pantry services.", "content_hash": "27eecdf307a0ec1b2dafc78504c4de5707897d76051cc335036e97541ca4c83a", "legal_status": null, "organization_id": "faab6503-70f5-4a11-87e7-90c5838308b6", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:45.691036+00	reconciler	35600921-3c79-45e7-94ad-3031e8258aad
c2cf6008-35c3-4c34-9f42-f534bf647758	faab6503-70f5-4a11-87e7-90c5838308b6	organization	1	{"uri": null, "name": "Echo Meadows Church Of Christ", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Echo Meadows Church Of Christ is a religious organization that also provides food pantry services.", "content_hash": "27eecdf307a0ec1b2dafc78504c4de5707897d76051cc335036e97541ca4c83a", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:45.692808+00	reconciler	\N
2442ecbf-65a7-443d-9e20-c7a06e3804f9	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	2	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank distributes food to those in need.", "content_hash": "4e6fec201f3ef2034302a9a3996f9ecc6f1a96c6734fd02aa2a31ee9f3b3ac7a", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:46.559538+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
b5de4d89-ed93-4190-a9f6-41dccb4e4cd8	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	3	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank provides food assistance to seniors.", "content_hash": "1a65632042a55bd2cd627d24e03a650270e21adf8ec8ed68c8e03406f5e8db17", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:47.571147+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
7d848331-8fb8-4789-b537-6169063fab2e	72fb21ec-a2bf-4ec2-aa30-cadd2e7ca3ad	organization_source	1	{"uri": null, "name": "F.O.P. 40 Charities Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "F.O.P. 40 Charities Food Pantry provides food assistance.", "content_hash": "fdf7b5429258435ab6cebe7dd04da0c334a45b6ff6f5c6d341635c7a6e0bce4e", "legal_status": null, "organization_id": "223abd39-e21d-4963-85d5-bdfe4db71032", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:04.326147+00	reconciler	72fb21ec-a2bf-4ec2-aa30-cadd2e7ca3ad
03ba91fa-1268-4180-b537-83f787eb76a0	91ce716d-8cc9-483f-863a-7a496525f8f8	organization_source	1	{"uri": null, "name": "Cindy's Cafe At St. Lucas Lutheran Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Cindy's Cafe, located at St. Lucas Lutheran Church in Toledo, Ohio, offers soup kitchen services.", "content_hash": "a12d17f6ebf9f98b2c130c7526e8bf57669acf72defb7bb484f560b4429757f0", "legal_status": null, "organization_id": "c223f130-cbef-4254-9e4f-6419ad504bc0", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:49.612191+00	reconciler	91ce716d-8cc9-483f-863a-7a496525f8f8
15400657-5e6f-4cb0-8fb4-af5b0cf4c521	c223f130-cbef-4254-9e4f-6419ad504bc0	organization	1	{"uri": null, "name": "Cindy's Cafe At St. Lucas Lutheran Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Cindy's Cafe, located at St. Lucas Lutheran Church in Toledo, Ohio, offers soup kitchen services.", "content_hash": "a12d17f6ebf9f98b2c130c7526e8bf57669acf72defb7bb484f560b4429757f0", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:49.617025+00	reconciler	\N
ad4a0e36-6f91-400f-b130-088720129cd2	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	4	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving the Chester County area, with a program in Coatesville.", "content_hash": "5703824ab895598caf1b3253b2734f9d39463e05b0868dfe59436c2fb6eb4fcc", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:50.683975+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
aaea493c-3ae8-424e-9865-377eba7ef935	3bf6c15f-89d2-405c-a7d9-e73283a4a85c	organization_source	1	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry Docs Place Mobile Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry operates a mobile pantry.", "content_hash": "548b271ffef70c29de8342f904b0837409a7b05b7a9ecbbb49b401282b7c1724", "legal_status": null, "organization_id": "f0205eac-07be-445e-9aca-50738d3bcca9", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:51.647073+00	reconciler	3bf6c15f-89d2-405c-a7d9-e73283a4a85c
5b659e1f-9d68-4024-ad9b-c2a10390467a	f0205eac-07be-445e-9aca-50738d3bcca9	organization	1	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry Docs Place Mobile Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry operates a mobile pantry.", "content_hash": "548b271ffef70c29de8342f904b0837409a7b05b7a9ecbbb49b401282b7c1724", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:51.64948+00	reconciler	\N
cb953c41-5269-461d-9741-08850fc474f8	7348eb52-79b8-444b-a15e-e3d00163fe70	organization_source	1	{"uri": null, "name": "Delta Assembly Of God", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Delta, Ohio, affiliated with the Toledo Northwestern Ohio Food Bank.", "content_hash": "85e1b6fa6d1b5ff4c38d4707ff9abd98a3a4546829f1107a2db4dae8f4b7cdc3", "legal_status": null, "organization_id": "8aeedc32-0ae6-49db-8cbb-6d03debfa0be", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:52.631728+00	reconciler	7348eb52-79b8-444b-a15e-e3d00163fe70
405d77f0-2a09-4c75-bc13-dccfb9d505b8	8aeedc32-0ae6-49db-8cbb-6d03debfa0be	organization	1	{"uri": null, "name": "Delta Assembly Of God", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Delta, Ohio, affiliated with the Toledo Northwestern Ohio Food Bank.", "content_hash": "85e1b6fa6d1b5ff4c38d4707ff9abd98a3a4546829f1107a2db4dae8f4b7cdc3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:52.633876+00	reconciler	\N
e357e440-83dc-413f-a22d-de8c75c9ec85	50baf5c9-3f5a-49c3-974d-d131583c41e7	phone	1	{"type": "voice", "number": "4198224975", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "85e1b6fa6d1b5ff4c38d4707ff9abd98a3a4546829f1107a2db4dae8f4b7cdc3", "organization_id": "8aeedc32-0ae6-49db-8cbb-6d03debfa0be", "service_at_location_id": null}	2025-08-08 05:05:52.635589+00	reconciler	\N
dfdabcee-3b26-43ec-850b-abdd27d46abf	0609713d-2770-47dc-9fa8-207129a20319	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "50baf5c9-3f5a-49c3-974d-d131583c41e7", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "85e1b6fa6d1b5ff4c38d4707ff9abd98a3a4546829f1107a2db4dae8f4b7cdc3"}	2025-08-08 05:05:52.635589+00	reconciler	\N
5656ad4e-bea0-4597-9d64-851ef2e66ab9	2e3a7db8-f84f-4048-b95c-f954a1f54332	organization_source	1	{"uri": null, "name": "Elliston Zion UMC - The L.I.G.H.T Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": "https://www.ellistonzion.com/", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "The L.I.G.H.T Pantry at Elliston Zion UMC provides food assistance.", "content_hash": "c3b3b8567195ac4e2b7d72b812c2592b18e8db6a4a6bd194813ab31de3512011", "legal_status": null, "organization_id": "bc11aabf-c0ad-4d05-a133-d8d0b42d6be2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:53.724944+00	reconciler	2e3a7db8-f84f-4048-b95c-f954a1f54332
024bd36d-14e0-47dc-9e71-04f061c48282	bc11aabf-c0ad-4d05-a133-d8d0b42d6be2	organization	1	{"uri": null, "name": "Elliston Zion UMC - The L.I.G.H.T Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": "https://www.ellistonzion.com/", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "The L.I.G.H.T Pantry at Elliston Zion UMC provides food assistance.", "content_hash": "c3b3b8567195ac4e2b7d72b812c2592b18e8db6a4a6bd194813ab31de3512011", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:53.727139+00	reconciler	\N
6f2aa9cd-c267-4e8e-b6c2-8e5536d7e2d3	bc01d89f-799e-431e-b1af-125d83cf7872	phone	1	{"type": "voice", "number": "4198623166", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "c3b3b8567195ac4e2b7d72b812c2592b18e8db6a4a6bd194813ab31de3512011", "organization_id": "bc11aabf-c0ad-4d05-a133-d8d0b42d6be2", "service_at_location_id": null}	2025-08-08 05:05:53.728781+00	reconciler	\N
2916ebe6-fc59-4219-b52c-c96a82323079	6a1d1440-36da-467b-818a-7cb7f72a9a90	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "bc01d89f-799e-431e-b1af-125d83cf7872", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "c3b3b8567195ac4e2b7d72b812c2592b18e8db6a4a6bd194813ab31de3512011"}	2025-08-08 05:05:53.728781+00	reconciler	\N
f9ec1efa-8059-4977-9637-a6c0bee54d15	1a342929-be01-4d9d-b062-8141de149f71	organization_source	1	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry operates a mobile food bank service.", "content_hash": "0e7dc826992df52f4042dc395ceb7373cfde7bb4569d8e1fd5e5bcd6a8c11b62", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:56.007904+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
f32e065d-0a7f-4358-b886-1f22152cc037	f6e0dadd-d53c-4b24-a5eb-37e635069f40	organization	1	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry operates a mobile food bank service.", "content_hash": "0e7dc826992df52f4042dc395ceb7373cfde7bb4569d8e1fd5e5bcd6a8c11b62", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:56.010629+00	reconciler	\N
8816587f-0740-482f-a153-50260d2cdffe	3b2a46e3-2cee-49e4-b83d-fc04fd542973	organization_source	1	{"uri": null, "name": "A.M.E.N (A Meal Encourages Nourishment)", "email": null, "source": "mercer_food_finder", "tax_id": null, "website": null, "scraper_id": "mercer_food_finder", "tax_status": null, "description": "Provides food assistance on the last Sunday of the month from 1:30 PM to 5:30 PM on a first-come, first-served basis for anyone in need.", "content_hash": "5a79febee4beb10407033bbeb762a3cf64b47fd31aede0847df382d4887dbb39", "legal_status": null, "organization_id": "ffbe2301-174b-4276-919a-32b3e0e4108e", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:57.083222+00	reconciler	3b2a46e3-2cee-49e4-b83d-fc04fd542973
c377f887-c842-47b3-994c-1ebedce64f3e	ffbe2301-174b-4276-919a-32b3e0e4108e	organization	1	{"uri": null, "name": "A.M.E.N (A Meal Encourages Nourishment)", "email": null, "source": "mercer_food_finder", "tax_id": null, "website": null, "scraper_id": "mercer_food_finder", "tax_status": null, "description": "Provides food assistance on the last Sunday of the month from 1:30 PM to 5:30 PM on a first-come, first-served basis for anyone in need.", "content_hash": "5a79febee4beb10407033bbeb762a3cf64b47fd31aede0847df382d4887dbb39", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:57.086566+00	reconciler	\N
f3fbcf55-f8c4-4fb5-91d6-dcb8df04c0d6	cc466654-06c3-40d7-a1d1-0f9dbc478321	organization_source	1	{"uri": null, "name": "Chicopee Moose Lodge Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry program offering pickups every 3rd Tuesday.", "content_hash": "3c4ba0324b53a186fca5656723fc8dde32cd17323518ce82ac7fee291e91a988", "legal_status": null, "organization_id": "bd877b1a-b177-46d2-ba7b-c7b912216a0e", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:58.376968+00	reconciler	cc466654-06c3-40d7-a1d1-0f9dbc478321
8cba183c-9da1-42a2-9f93-49fd8bdbb193	bd877b1a-b177-46d2-ba7b-c7b912216a0e	organization	1	{"uri": null, "name": "Chicopee Moose Lodge Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry program offering pickups every 3rd Tuesday.", "content_hash": "3c4ba0324b53a186fca5656723fc8dde32cd17323518ce82ac7fee291e91a988", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:05:58.379084+00	reconciler	\N
45c7af45-96ba-488c-a821-ace791f63601	29412b53-2709-4dd2-a9ff-50dccd5193c7	organization_source	1	{"uri": null, "name": "Emmanuel Baptist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Emmanuel Baptist Church offers food pantry services.", "content_hash": "0c11664d4d40f0e2c72b3c186ccc89ddaa1cc753d41bc02892d589c92f34e2a3", "legal_status": null, "organization_id": "5e63caa4-b501-42f8-be89-66edba85836e", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:01.646136+00	reconciler	29412b53-2709-4dd2-a9ff-50dccd5193c7
be23b0f1-8ff6-4b34-9cb2-7833f4340285	5e63caa4-b501-42f8-be89-66edba85836e	organization	1	{"uri": null, "name": "Emmanuel Baptist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Emmanuel Baptist Church offers food pantry services.", "content_hash": "0c11664d4d40f0e2c72b3c186ccc89ddaa1cc753d41bc02892d589c92f34e2a3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:01.648117+00	reconciler	\N
3a70369f-5491-45b1-8720-62504dd2aacd	8d79c8c9-c252-40d2-8dad-cc64cca747d6	phone	1	{"type": "voice", "number": "4194733280", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "0c11664d4d40f0e2c72b3c186ccc89ddaa1cc753d41bc02892d589c92f34e2a3", "organization_id": "5e63caa4-b501-42f8-be89-66edba85836e", "service_at_location_id": null}	2025-08-08 05:06:01.649596+00	reconciler	\N
6a085616-e03a-43b4-8aac-0495da17cc6c	aadecc7d-6ab8-43ff-9dcb-7431443dee39	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "8d79c8c9-c252-40d2-8dad-cc64cca747d6", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "0c11664d4d40f0e2c72b3c186ccc89ddaa1cc753d41bc02892d589c92f34e2a3"}	2025-08-08 05:06:01.649596+00	reconciler	\N
55ba637f-c595-4d87-bf63-93addc4aa9bc	0733cb1d-97bc-47a7-a513-d77c5edcc4cd	organization_source	1	{"uri": null, "name": "Emmaus Lutheran Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Emmaus Lutheran Church provides food pantry services.", "content_hash": "6f1173c2320bbc2bfc6cfee7a6e8aaef702c5f0e31a5a9c1eb0107fd29036532", "legal_status": null, "organization_id": "e0c1617d-0eb5-48e5-8c48-0ede1614acde", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:02.495901+00	reconciler	0733cb1d-97bc-47a7-a513-d77c5edcc4cd
582cae17-6c40-4c2b-b489-22ca03237677	e0c1617d-0eb5-48e5-8c48-0ede1614acde	organization	1	{"uri": null, "name": "Emmaus Lutheran Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Emmaus Lutheran Church provides food pantry services.", "content_hash": "6f1173c2320bbc2bfc6cfee7a6e8aaef702c5f0e31a5a9c1eb0107fd29036532", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:02.498122+00	reconciler	\N
10a565d5-ea26-4548-8b72-38c13367035a	307576b2-71df-47e1-b3e2-bdf54c69a45d	phone	1	{"type": "voice", "number": "(419)445-8361", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "6f1173c2320bbc2bfc6cfee7a6e8aaef702c5f0e31a5a9c1eb0107fd29036532", "organization_id": "e0c1617d-0eb5-48e5-8c48-0ede1614acde", "service_at_location_id": null}	2025-08-08 05:06:02.499453+00	reconciler	\N
014f6e0c-0494-4b89-809a-86d44dc01891	223abd39-e21d-4963-85d5-bdfe4db71032	organization	1	{"uri": null, "name": "F.O.P. 40 Charities Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "F.O.P. 40 Charities Food Pantry provides food assistance.", "content_hash": "fdf7b5429258435ab6cebe7dd04da0c334a45b6ff6f5c6d341635c7a6e0bce4e", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:04.329695+00	reconciler	\N
313bf5f8-c87b-4b49-ad9e-a3af91d62646	1a342929-be01-4d9d-b062-8141de149f71	organization_source	2	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry provides food assistance to veterans.", "content_hash": "d81703ce9bc44fe18627f92fc58fb6825bfa4853089e0d3b867ac9f76439b9d1", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:05.214793+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
c258935c-a82e-4b0c-9c03-019bbffb18c1	4cbe2f9a-05b3-420e-8a45-9676b27c15de	phone	1	{"type": "voice", "number": "413-592-9528", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "d81703ce9bc44fe18627f92fc58fb6825bfa4853089e0d3b867ac9f76439b9d1", "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "service_at_location_id": null}	2025-08-08 05:06:05.218938+00	reconciler	\N
d8ec3a71-ee22-416f-9683-7cec24ed1287	a95f8fbf-6f44-4f1d-a57e-6123ea57719e	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "4cbe2f9a-05b3-420e-8a45-9676b27c15de", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "d81703ce9bc44fe18627f92fc58fb6825bfa4853089e0d3b867ac9f76439b9d1"}	2025-08-08 05:06:05.218938+00	reconciler	\N
187b2cb5-306e-46b0-aaa1-b7aa669fab9f	b1b4ca56-9b14-4a0a-ba37-11b40d8d0906	organization_source	1	{"uri": null, "name": "Our Father's House Dream Center Day", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pantry is open every 4th Saturday of the month from 9:45 – 10:30 a.m.", "content_hash": "7e304b26bede7604e65c7fa4f6791385af58938c27b801967bf8a74a7be95e46", "legal_status": null, "organization_id": "5d62e67d-c5ff-4eca-9134-142c5cbf0720", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:06.947711+00	reconciler	b1b4ca56-9b14-4a0a-ba37-11b40d8d0906
b6491b8d-39f4-4f8a-aedd-cae6c254ea09	5d62e67d-c5ff-4eca-9134-142c5cbf0720	organization	1	{"uri": null, "name": "Our Father's House Dream Center Day", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pantry is open every 4th Saturday of the month from 9:45 – 10:30 a.m.", "content_hash": "7e304b26bede7604e65c7fa4f6791385af58938c27b801967bf8a74a7be95e46", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:06.949474+00	reconciler	\N
68ea9f92-9330-424f-8cdd-8b126e64c411	1fcf3631-b0ee-40f3-b7cf-51f66bb7804d	phone	1	{"type": "voice", "number": "413-437-8071", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "7e304b26bede7604e65c7fa4f6791385af58938c27b801967bf8a74a7be95e46", "organization_id": "5d62e67d-c5ff-4eca-9134-142c5cbf0720", "service_at_location_id": null}	2025-08-08 05:06:06.951034+00	reconciler	\N
17d50669-23f9-4cb9-9eeb-70eb5fc89559	ffbf9af1-9e3f-406b-8ea8-1c669f5a5524	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "1fcf3631-b0ee-40f3-b7cf-51f66bb7804d", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "7e304b26bede7604e65c7fa4f6791385af58938c27b801967bf8a74a7be95e46"}	2025-08-08 05:06:06.951034+00	reconciler	\N
04a4a9da-7152-4098-92b5-d896d3f970e6	1a342929-be01-4d9d-b062-8141de149f71	organization_source	3	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry offers a mobile food bank service.", "content_hash": "83048299cb7fe4daaa5318e9e33c0ee34fa688d2e6d7385fcc0a6b2d407c9671", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:07.800585+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
d1c761a1-ca79-4803-8f48-281fa5ca4252	b4b566de-3317-4bf0-9ebe-7224aec7140d	service_source	1	{"name": "Food Pantry", "source": "food_bank_of_western_massachusetts_ma", "status": "active", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": "ddf2c07b-8398-4f31-b2fa-14245d6fdc15", "description": "Food pantry services.", "content_hash": "83048299cb7fe4daaa5318e9e33c0ee34fa688d2e6d7385fcc0a6b2d407c9671", "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40"}	2025-08-08 05:06:07.808738+00	reconciler	b4b566de-3317-4bf0-9ebe-7224aec7140d
ddb0f394-8247-458f-af79-65788a472fff	ddf2c07b-8398-4f31-b2fa-14245d6fdc15	service	1	{"name": "Food Pantry", "source": "food_bank_of_western_massachusetts_ma", "status": "active", "scraper_id": "food_bank_of_western_massachusetts_ma", "description": "Food pantry services.", "content_hash": "83048299cb7fe4daaa5318e9e33c0ee34fa688d2e6d7385fcc0a6b2d407c9671", "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40"}	2025-08-08 05:06:07.810032+00	reconciler	\N
66c32612-bd0c-4f62-abcc-9bfa88621b65	d1d17dcf-9970-438d-bae0-f5afa7e649b4	service_source	1	{"name": "Mobile Food Bank", "source": "food_bank_of_western_massachusetts_ma", "status": "active", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": "ab853f59-340b-4657-a753-ab50b01e3ab5", "description": "Distribution is on the 4th Monday of each month from 4:00 – 5:30 p.m. Lorraine’s full Mobile Pantry schedule can be found here >", "content_hash": "83048299cb7fe4daaa5318e9e33c0ee34fa688d2e6d7385fcc0a6b2d407c9671", "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40"}	2025-08-08 05:06:07.817398+00	reconciler	d1d17dcf-9970-438d-bae0-f5afa7e649b4
fa4ee396-ae6f-4ab1-b053-6dd13180087f	ab853f59-340b-4657-a753-ab50b01e3ab5	service	1	{"name": "Mobile Food Bank", "source": "food_bank_of_western_massachusetts_ma", "status": "active", "scraper_id": "food_bank_of_western_massachusetts_ma", "description": "Distribution is on the 4th Monday of each month from 4:00 – 5:30 p.m. Lorraine’s full Mobile Pantry schedule can be found here >", "content_hash": "83048299cb7fe4daaa5318e9e33c0ee34fa688d2e6d7385fcc0a6b2d407c9671", "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40"}	2025-08-08 05:06:07.818437+00	reconciler	\N
3eb603cf-28b6-4d47-b42c-6bdcf082d197	f04525c9-e115-499c-b377-73638472c5d5	organization_source	1	{"uri": null, "name": "Mission Center New Jerusalem One Way Outreach Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Mission Center New Jerusalem One Way Outreach Pantry offers food pantry services.", "content_hash": "e7373aff4c5f4cce9e6386a354473e0006201fb29bef0c6368dd421579d7fb70", "legal_status": null, "organization_id": "fde32e1f-604c-4554-9726-56a19f8c8e27", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:08.66952+00	reconciler	f04525c9-e115-499c-b377-73638472c5d5
55b574b6-c8dc-4cf0-9c9b-b5ccd97cbfc2	fde32e1f-604c-4554-9726-56a19f8c8e27	organization	1	{"uri": null, "name": "Mission Center New Jerusalem One Way Outreach Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Mission Center New Jerusalem One Way Outreach Pantry offers food pantry services.", "content_hash": "e7373aff4c5f4cce9e6386a354473e0006201fb29bef0c6368dd421579d7fb70", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:08.671622+00	reconciler	\N
af76ffa5-3a2e-472f-b281-011a9a305e56	f6e1ffb7-cd53-433f-9c5d-48d44cefa241	phone	1	{"type": "voice", "number": "413-534-8103", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "e7373aff4c5f4cce9e6386a354473e0006201fb29bef0c6368dd421579d7fb70", "organization_id": "fde32e1f-604c-4554-9726-56a19f8c8e27", "service_at_location_id": null}	2025-08-08 05:06:08.683019+00	reconciler	\N
cf829a4a-fb99-4bed-b9fe-ee6ada431d77	933ca5b0-e129-4814-8307-cd0753e45bc3	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "f6e1ffb7-cd53-433f-9c5d-48d44cefa241", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "e7373aff4c5f4cce9e6386a354473e0006201fb29bef0c6368dd421579d7fb70"}	2025-08-08 05:06:08.683019+00	reconciler	\N
ea48ba11-56d3-440b-a799-f7c4312741f8	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	5	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving the Chester County area.", "content_hash": "d5449d8c3fea463ed070ff76de37d751839a1dba62cdeb82d1bdf8d6a6cd5e84", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:10.359459+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
bd20fbc6-a1e9-4f56-a0ff-6e7d8ce27e54	1a342929-be01-4d9d-b062-8141de149f71	organization_source	4	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry provides food assistance.", "content_hash": "221b2fb21532764877134310deb55a616c0abc5a062064bfa42f525ee5a57ad0", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:11.311182+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
257f40c3-b2fa-4d4b-9d22-812164a4555e	0155542e-c295-4538-96d7-d158ef3e911a	phone	1	{"type": "voice", "number": "(413) 592-9528", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "221b2fb21532764877134310deb55a616c0abc5a062064bfa42f525ee5a57ad0", "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "service_at_location_id": null}	2025-08-08 05:06:11.317104+00	reconciler	\N
dc02b55d-dcab-4ef7-b2dc-7abd81f71c6f	24f56a7e-f39d-42ec-b0e4-e6cd84bf45a7	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "0155542e-c295-4538-96d7-d158ef3e911a", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "221b2fb21532764877134310deb55a616c0abc5a062064bfa42f525ee5a57ad0"}	2025-08-08 05:06:11.317104+00	reconciler	\N
0ca98b94-b735-4cc3-b9c0-9a133fb916da	21163e24-cf50-4554-a3c7-10edb05ad4b6	organization_source	1	{"uri": null, "name": "Fairgreen Presbyterian Church (Feed Your Neighbor)", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Fairgreen Presbyterian Church offers a food pantry program called 'Feed Your Neighbor'.", "content_hash": "51ac8ac6a32537f6fd337271c82292ab300eef1d5f0d0ea90d8a82bfb8ad2638", "legal_status": null, "organization_id": "1d5a59a2-4786-44f8-9478-6479e5fc65d5", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:12.187518+00	reconciler	21163e24-cf50-4554-a3c7-10edb05ad4b6
7c313874-3761-4ee5-a49a-d70757cd9662	1d5a59a2-4786-44f8-9478-6479e5fc65d5	organization	1	{"uri": null, "name": "Fairgreen Presbyterian Church (Feed Your Neighbor)", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Fairgreen Presbyterian Church offers a food pantry program called 'Feed Your Neighbor'.", "content_hash": "51ac8ac6a32537f6fd337271c82292ab300eef1d5f0d0ea90d8a82bfb8ad2638", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:12.189364+00	reconciler	\N
59feb39b-8966-4711-9f29-bd0ddde4535c	3f7d2336-7a08-4614-ac53-9d55d8d2f749	organization_source	1	{"uri": null, "name": "Frazer", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Food pantry services provided by Frazer.", "content_hash": "48ac5515fef9ebaf6c73c22ac0f65a84a869257dd61fbc9348d569038260e891", "legal_status": null, "organization_id": "95480946-02c5-4058-9e73-4243302beeb5", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:13.089067+00	reconciler	3f7d2336-7a08-4614-ac53-9d55d8d2f749
22b7f3f2-47b0-4741-bb0f-b80d4d7d34b2	95480946-02c5-4058-9e73-4243302beeb5	organization	1	{"uri": null, "name": "Frazer", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Food pantry services provided by Frazer.", "content_hash": "48ac5515fef9ebaf6c73c22ac0f65a84a869257dd61fbc9348d569038260e891", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:13.091343+00	reconciler	\N
1276f9a6-c051-4c38-a05a-84b9efa4f725	539a52b5-b84f-4186-83b9-e0983810199a	organization_source	1	{"uri": null, "name": "Glenmoore Salvation Army Food Pantry", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "A food pantry operated by the Salvation Army in Glenmoore, PA.", "content_hash": "1b346debf410793e3bd88a1338b81dd121677ec12beabdde755ab74e718d1df8", "legal_status": null, "organization_id": "e2aa0ab4-03c2-41df-af5f-ccbdafd8cf20", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:13.922917+00	reconciler	539a52b5-b84f-4186-83b9-e0983810199a
a1782ba4-0290-4c09-a18e-40946ce77654	e2aa0ab4-03c2-41df-af5f-ccbdafd8cf20	organization	1	{"uri": null, "name": "Glenmoore Salvation Army Food Pantry", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "A food pantry operated by the Salvation Army in Glenmoore, PA.", "content_hash": "1b346debf410793e3bd88a1338b81dd121677ec12beabdde755ab74e718d1df8", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:13.924914+00	reconciler	\N
a88f8f59-9dd7-4cef-a14e-900ea95abf20	bf6bd9b2-352e-47f0-a7ae-d0f536f79eab	phone	1	{"type": "voice", "number": "419-357-7457", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "05088dcd18a8db1ea1cf8134ae23c7fec2719354bc8bd87212812fdc2588cc8f", "organization_id": "a5375519-627b-4c24-ac09-6e7a0ec773db", "service_at_location_id": null}	2025-08-08 05:06:21.222882+00	reconciler	\N
f8b704ef-7fd1-438c-8896-081eb47f6d97	1a342929-be01-4d9d-b062-8141de149f71	organization_source	5	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry operates a mobile pantry service.", "content_hash": "9a8ce52146fbcb45da18e1c61b1721c5fbee7e2af84ac8a8ebb0e72ffc733a35", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:15.833232+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
9982dc80-62ff-473c-a41b-c04a3720d156	f176de6b-a72a-42ec-8106-8c837fffc52b	organization_source	1	{"uri": null, "name": "Faith Lutheran Church (Feed Your Neighbor)", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Faith Lutheran Church provides a food pantry service called Feed Your Neighbor.", "content_hash": "fb9182aa825d01df210854d4e0f6a74a47eb4078271629e7f11157108a4f9b08", "legal_status": null, "organization_id": "980e390b-a1b1-497c-ad31-11c8ae6a88bd", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:16.763961+00	reconciler	f176de6b-a72a-42ec-8106-8c837fffc52b
d92f6c4e-af16-4e5a-8353-4612597b92ee	980e390b-a1b1-497c-ad31-11c8ae6a88bd	organization	1	{"uri": null, "name": "Faith Lutheran Church (Feed Your Neighbor)", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Faith Lutheran Church provides a food pantry service called Feed Your Neighbor.", "content_hash": "fb9182aa825d01df210854d4e0f6a74a47eb4078271629e7f11157108a4f9b08", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:16.782928+00	reconciler	\N
fdf448e7-e44a-4490-bac6-177e621390aa	1a342929-be01-4d9d-b062-8141de149f71	organization_source	6	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry provides food pantry services and operates a mobile food bank.", "content_hash": "b1df27b525e96dd9494b9c88bf190af3d7df2fc56b1f53715a03afe4b777a642", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:17.684194+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
f078c35b-5735-457f-86c9-5d4bec7c1223	7c1a37c3-f9dd-483d-97dd-dec5c064d13c	phone	1	{"type": "voice", "number": "(413) 592-9528", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "b1df27b525e96dd9494b9c88bf190af3d7df2fc56b1f53715a03afe4b777a642", "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "service_at_location_id": null}	2025-08-08 05:06:17.688394+00	reconciler	\N
982b9514-71e4-42b3-86d8-e974f6961d33	4c50c003-396b-41e3-8a02-73ad11270e78	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "7c1a37c3-f9dd-483d-97dd-dec5c064d13c", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "b1df27b525e96dd9494b9c88bf190af3d7df2fc56b1f53715a03afe4b777a642"}	2025-08-08 05:06:17.688394+00	reconciler	\N
4e575f4f-7dd7-4aef-8f6c-9eec00add540	6159b198-ae8a-4f4e-8ea0-357d1c602718	organization_source	1	{"uri": null, "name": "Seventh Day Adventist Church", "email": null, "source": "the_food_basket_inc_hi", "tax_id": null, "website": null, "scraper_id": "the_food_basket_inc_hi", "tax_status": null, "description": "A Seventh Day Adventist Church offering a food pantry service.", "content_hash": "87de4b0d20fb2631c9ee8d5b4ca1fc3e16a41978af169d54ae902dd0fe3bdef3", "legal_status": null, "organization_id": "2fcd1e7e-c7f7-490a-ac70-07ed3f2f2fce", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:18.617746+00	reconciler	6159b198-ae8a-4f4e-8ea0-357d1c602718
ec2b7afe-68ff-4491-b897-c5bcc566794a	2fcd1e7e-c7f7-490a-ac70-07ed3f2f2fce	organization	1	{"uri": null, "name": "Seventh Day Adventist Church", "email": null, "source": "the_food_basket_inc_hi", "tax_id": null, "website": null, "scraper_id": "the_food_basket_inc_hi", "tax_status": null, "description": "A Seventh Day Adventist Church offering a food pantry service.", "content_hash": "87de4b0d20fb2631c9ee8d5b4ca1fc3e16a41978af169d54ae902dd0fe3bdef3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:18.622875+00	reconciler	\N
53f31b56-709a-4673-beb7-c52e923dd15a	385d28f7-a920-4cef-97c8-3a61ba474170	organization_source	1	{"uri": null, "name": "Family House", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing shelter services.", "content_hash": "1667d5c1537f10ab1b1812ce84ce9b80f5bae2ffd9e4bf6fdbb717935b775008", "legal_status": null, "organization_id": "663111ef-d042-41b9-a14b-d6f8941a3c8b", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:19.53906+00	reconciler	385d28f7-a920-4cef-97c8-3a61ba474170
a9441971-0ca5-4157-93c3-e6e6d6b718ef	663111ef-d042-41b9-a14b-d6f8941a3c8b	organization	1	{"uri": null, "name": "Family House", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing shelter services.", "content_hash": "1667d5c1537f10ab1b1812ce84ce9b80f5bae2ffd9e4bf6fdbb717935b775008", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:19.541122+00	reconciler	\N
b8c05ac6-8378-417e-bb29-9bf128418aa1	bdc07b7c-64ff-4f30-b857-5250e006db8f	phone	1	{"type": "voice", "number": "419-242-5505", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "1667d5c1537f10ab1b1812ce84ce9b80f5bae2ffd9e4bf6fdbb717935b775008", "organization_id": "663111ef-d042-41b9-a14b-d6f8941a3c8b", "service_at_location_id": null}	2025-08-08 05:06:19.542726+00	reconciler	\N
f0a8a1b9-8a32-4821-b672-036b8179bbca	d48f4610-7c09-4971-a2b9-283598a85ac2	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "bdc07b7c-64ff-4f30-b857-5250e006db8f", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "1667d5c1537f10ab1b1812ce84ce9b80f5bae2ffd9e4bf6fdbb717935b775008"}	2025-08-08 05:06:19.542726+00	reconciler	\N
f902246b-b515-4348-a144-ffbbc922b94a	a6166be4-20df-435c-b9da-0f543e0a0fe4	organization_source	1	{"uri": null, "name": "Fayette's Helping Hands", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Fayette, OH.", "content_hash": "05088dcd18a8db1ea1cf8134ae23c7fec2719354bc8bd87212812fdc2588cc8f", "legal_status": null, "organization_id": "a5375519-627b-4c24-ac09-6e7a0ec773db", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:21.219437+00	reconciler	a6166be4-20df-435c-b9da-0f543e0a0fe4
cb6a995a-3cc2-4e12-a5a5-a737c7cfefbf	a5375519-627b-4c24-ac09-6e7a0ec773db	organization	1	{"uri": null, "name": "Fayette's Helping Hands", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Fayette, OH.", "content_hash": "05088dcd18a8db1ea1cf8134ae23c7fec2719354bc8bd87212812fdc2588cc8f", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:21.221467+00	reconciler	\N
69f259b3-0ff8-4a48-8f7a-8c95844c3f41	0ceb8ef0-ddcd-41f7-9abe-5e33316aabeb	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "bf6bd9b2-352e-47f0-a7ae-d0f536f79eab", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "05088dcd18a8db1ea1cf8134ae23c7fec2719354bc8bd87212812fdc2588cc8f"}	2025-08-08 05:06:21.222882+00	reconciler	\N
9bacc927-7989-4110-9bb7-773f5970f694	c1997e60-01b4-4c3b-af3e-5f32b00188bc	organization_source	1	{"uri": null, "name": "Falcon Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry exclusively for students enrolled at Bowling Green State University.", "content_hash": "a12658457c8061f8522235a2a9d5a5bfed144d8b21f687dd51a5a820ae263b89", "legal_status": null, "organization_id": "17e848ff-c94d-44fc-beab-9bdf2b7cc33d", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:22.093534+00	reconciler	c1997e60-01b4-4c3b-af3e-5f32b00188bc
b8276941-54a9-46e7-992a-36191ff6d2ab	17e848ff-c94d-44fc-beab-9bdf2b7cc33d	organization	1	{"uri": null, "name": "Falcon Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry exclusively for students enrolled at Bowling Green State University.", "content_hash": "a12658457c8061f8522235a2a9d5a5bfed144d8b21f687dd51a5a820ae263b89", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:22.095623+00	reconciler	\N
6832006d-93e1-4d0d-ab4f-a070724d26f2	19b8dea9-4f37-4c21-8641-40f63037b6fb	organization_source	1	{"uri": null, "name": "Family Worship Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Family Worship Center offers food pantry services.", "content_hash": "e7aee4ce5c2e5b01eb2ee4442f731dbd22f1d49faab10eb30d549a7be1a1fbfe", "legal_status": null, "organization_id": "86190ee7-85f2-4f37-a03d-2119fe9d6f61", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:23.019827+00	reconciler	19b8dea9-4f37-4c21-8641-40f63037b6fb
7cd7e956-fcf0-46ef-957d-e45d137e5742	86190ee7-85f2-4f37-a03d-2119fe9d6f61	organization	1	{"uri": null, "name": "Family Worship Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Family Worship Center offers food pantry services.", "content_hash": "e7aee4ce5c2e5b01eb2ee4442f731dbd22f1d49faab10eb30d549a7be1a1fbfe", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:23.025323+00	reconciler	\N
1a2d617c-2259-4ea8-8262-917fe50a266b	46abd91f-f1d7-478a-9721-cd4e91eb16a1	phone	1	{"type": "voice", "number": "(419)334-8353", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "e7aee4ce5c2e5b01eb2ee4442f731dbd22f1d49faab10eb30d549a7be1a1fbfe", "organization_id": "86190ee7-85f2-4f37-a03d-2119fe9d6f61", "service_at_location_id": null}	2025-08-08 05:06:23.026881+00	reconciler	\N
f1c3b712-fd06-44b2-a38a-b472064f6c51	6bfb6ec0-7af2-49ac-99ec-3dbc42c88470	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "46abd91f-f1d7-478a-9721-cd4e91eb16a1", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "e7aee4ce5c2e5b01eb2ee4442f731dbd22f1d49faab10eb30d549a7be1a1fbfe"}	2025-08-08 05:06:23.026881+00	reconciler	\N
ab0f5e88-8af7-4611-80eb-d62ea95bf177	67f56f86-5fbe-4d5c-95ab-ec55f22d619a	organization_source	1	{"uri": null, "name": "First United Methodist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A church offering a food pantry service.", "content_hash": "87b0af3125e93c8176411534b02195edd715e47774d7bf6d2ca4b9e3800f7fa2", "legal_status": null, "organization_id": "96d2fad2-dfc5-4773-9e85-32de036895dd", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:23.924767+00	reconciler	67f56f86-5fbe-4d5c-95ab-ec55f22d619a
70c3fb98-e617-4bda-baa6-3cc5f425fe45	96d2fad2-dfc5-4773-9e85-32de036895dd	organization	1	{"uri": null, "name": "First United Methodist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A church offering a food pantry service.", "content_hash": "87b0af3125e93c8176411534b02195edd715e47774d7bf6d2ca4b9e3800f7fa2", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:23.927215+00	reconciler	\N
01a643ea-0179-4d61-9cfb-049c3eba9582	1a342929-be01-4d9d-b062-8141de149f71	organization_source	7	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry provides food assistance services.", "content_hash": "a76ff5aacdde0f28548c6a9957d6c915acc752cade08f2c01ec3db8228dc5f1f", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:25.756714+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
7e0dac6d-93b5-4c22-a8fd-e0b5ee09c234	90e2d448-4cf1-4baf-bd1d-36f8e66d5adc	phone	1	{"type": "voice", "number": "413-592-9528", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "a76ff5aacdde0f28548c6a9957d6c915acc752cade08f2c01ec3db8228dc5f1f", "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "service_at_location_id": null}	2025-08-08 05:06:25.768172+00	reconciler	\N
e7d24d3a-b8d0-41a1-8aac-353fe45488be	11e9d2ab-3432-44c0-8526-f66b7548da89	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "90e2d448-4cf1-4baf-bd1d-36f8e66d5adc", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "a76ff5aacdde0f28548c6a9957d6c915acc752cade08f2c01ec3db8228dc5f1f"}	2025-08-08 05:06:25.768172+00	reconciler	\N
15231107-5b66-4b0c-b952-8a3399c7f7fe	01e1a82e-8970-4b19-a053-6201ff658fe1	organization_source	1	{"uri": null, "name": "Free At Last Ministries - Dominion Christian Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Food pantry services provided by Free At Last Ministries at Dominion Christian Center.", "content_hash": "1301852d24d64f26ac9fc164a39a235693b6d31693c71c827660d56c305876d1", "legal_status": null, "organization_id": "34097231-febd-456c-b6a2-5a66219c9998", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:27.729509+00	reconciler	01e1a82e-8970-4b19-a053-6201ff658fe1
3c4b221b-7c65-4917-b333-16becbf2055b	34097231-febd-456c-b6a2-5a66219c9998	organization	1	{"uri": null, "name": "Free At Last Ministries - Dominion Christian Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Food pantry services provided by Free At Last Ministries at Dominion Christian Center.", "content_hash": "1301852d24d64f26ac9fc164a39a235693b6d31693c71c827660d56c305876d1", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:27.731686+00	reconciler	\N
5aac5038-6bf3-4682-b2b0-78ffd60d00d1	b30953b3-9a39-4ebd-9f6c-b94a2d42fb44	organization_source	1	{"uri": null, "name": "Foundation Stone Christian Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A Christian center providing food pantry services.", "content_hash": "9f5b972509ded8aa441adec444b9b14d5bbbd471a7146246edae5db49fdc63b6", "legal_status": null, "organization_id": "51084fb3-342b-40d6-b8aa-ba7b7ec4428c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:29.706847+00	reconciler	b30953b3-9a39-4ebd-9f6c-b94a2d42fb44
3609d07f-ef93-4989-b242-c45a5c563212	51084fb3-342b-40d6-b8aa-ba7b7ec4428c	organization	1	{"uri": null, "name": "Foundation Stone Christian Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A Christian center providing food pantry services.", "content_hash": "9f5b972509ded8aa441adec444b9b14d5bbbd471a7146246edae5db49fdc63b6", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:29.709712+00	reconciler	\N
ef9ce828-9d0d-41bf-884e-c96f07347d6a	5bbf7ca4-6f16-4d58-bda6-ea7a86ae22f9	organization_source	1	{"uri": null, "name": "Fremont Baptist Temple", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Fremont Baptist Temple is a food pantry providing services in Fremont, Ohio.", "content_hash": "d54dec8f9ca89dcc42a24b9066eee92d665a12e9db7a282b04d3e7e3f88965ad", "legal_status": null, "organization_id": "5cea461a-4acf-47a3-9013-c4b382d95bc6", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:30.738139+00	reconciler	5bbf7ca4-6f16-4d58-bda6-ea7a86ae22f9
e6fb6141-7528-4392-9ebb-a821e4e1df8a	5cea461a-4acf-47a3-9013-c4b382d95bc6	organization	1	{"uri": null, "name": "Fremont Baptist Temple", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Fremont Baptist Temple is a food pantry providing services in Fremont, Ohio.", "content_hash": "d54dec8f9ca89dcc42a24b9066eee92d665a12e9db7a282b04d3e7e3f88965ad", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:30.740711+00	reconciler	\N
b40169a4-cfda-4278-98a5-1c1aa240ed87	1461574b-6447-430f-a149-0d7dcaccf526	organization_source	1	{"uri": null, "name": "Friendship Baptist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Friendship Baptist Church provides food pantry services.", "content_hash": "45fa0d3177b939e55947c12c022f1686cefb86f7faccdc31bcf26a13913b266a", "legal_status": null, "organization_id": "0bee058e-26c0-41d5-9fa3-5c1abfd08bc0", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:31.769797+00	reconciler	1461574b-6447-430f-a149-0d7dcaccf526
60bb9cfc-ab5d-4c33-a9e3-5c386adf5339	0bee058e-26c0-41d5-9fa3-5c1abfd08bc0	organization	1	{"uri": null, "name": "Friendship Baptist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Friendship Baptist Church provides food pantry services.", "content_hash": "45fa0d3177b939e55947c12c022f1686cefb86f7faccdc31bcf26a13913b266a", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:31.77169+00	reconciler	\N
f8e672d0-d0db-4d87-9fa2-4aed17583437	0ced4b9a-c482-4dd7-8c39-dc52e971a83a	organization_source	1	{"uri": null, "name": "Providence Ministries Margaret’s Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Providence Ministries Margaret’s Pantry is a food pantry providing food assistance.", "content_hash": "b78cc7102db99850b46056f6294bd462002b0bff7b6d3cc69ba932bd5605ca8f", "legal_status": null, "organization_id": "ab54bd2c-64fb-4434-98f5-5e31bff6f7cd", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:32.661753+00	reconciler	0ced4b9a-c482-4dd7-8c39-dc52e971a83a
a4c9d921-8cd3-4b10-aa04-85755a2a6e80	ab54bd2c-64fb-4434-98f5-5e31bff6f7cd	organization	1	{"uri": null, "name": "Providence Ministries Margaret’s Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Providence Ministries Margaret’s Pantry is a food pantry providing food assistance.", "content_hash": "b78cc7102db99850b46056f6294bd462002b0bff7b6d3cc69ba932bd5605ca8f", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:32.663799+00	reconciler	\N
f38faf83-e006-4bad-ae9b-d3f28a30e03d	ac1078bc-070b-41c6-a4c0-9cc193c548ce	phone	1	{"type": "voice", "number": "(413) 538-8026", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "b78cc7102db99850b46056f6294bd462002b0bff7b6d3cc69ba932bd5605ca8f", "organization_id": "ab54bd2c-64fb-4434-98f5-5e31bff6f7cd", "service_at_location_id": null}	2025-08-08 05:06:32.665078+00	reconciler	\N
487a67c2-4a71-4dd8-9ed6-f7a9a3a318b8	46dea2a7-0469-404f-9fa0-aecb2fc9fb6e	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "ac1078bc-070b-41c6-a4c0-9cc193c548ce", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "b78cc7102db99850b46056f6294bd462002b0bff7b6d3cc69ba932bd5605ca8f"}	2025-08-08 05:06:32.665078+00	reconciler	\N
92cc0958-8e86-42c5-ba9e-0b4df8acfd47	1a342929-be01-4d9d-b062-8141de149f71	organization_source	8	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry provides food assistance through its mobile pantry.", "content_hash": "ea59941ef3bc97581034a5564514b8435f7dc2d3abcba8ccb695f9d6eb91c264", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:33.622014+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
3c7ffd3a-7bf0-4390-bf37-60c817a79b88	99f7fba8-1de3-49fd-b95f-c4e48b2759ea	organization_source	1	{"uri": null, "name": "Christian Pentecostal Church Holyoke Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pantry limits guests to 12 visits a year.", "content_hash": "d2255a3708d275f639911b346673e6bb0aa0ace2ce36a17dc8a749b5a3b9cfa8", "legal_status": null, "organization_id": "223b1cf5-0b87-4f46-98b9-7bf14c7998a3", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:35.357943+00	reconciler	99f7fba8-1de3-49fd-b95f-c4e48b2759ea
3d9695f2-313b-4a77-9ba4-9595a910d0bd	223b1cf5-0b87-4f46-98b9-7bf14c7998a3	organization	1	{"uri": null, "name": "Christian Pentecostal Church Holyoke Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pantry limits guests to 12 visits a year.", "content_hash": "d2255a3708d275f639911b346673e6bb0aa0ace2ce36a17dc8a749b5a3b9cfa8", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:35.359936+00	reconciler	\N
065a17c6-fe0a-463e-877b-969d3d22d011	542216e5-9195-494d-92f9-6c8fb88361e7	organization_source	1	{"uri": null, "name": "United Way of Pioneer Valley Holyoke Community Cupboard", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry service provided by United Way of Pioneer Valley, with guests limited to one visit per month.", "content_hash": "933eed25547ca0adc89fe23ec047ec9b6a3da595b18718e1e516a9ff8477c454", "legal_status": null, "organization_id": "74583de3-d335-4ba6-9a7d-d3678eb1b77e", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:36.280174+00	reconciler	542216e5-9195-494d-92f9-6c8fb88361e7
cb386e74-16fe-4e6c-b49e-4306d7df45e2	74583de3-d335-4ba6-9a7d-d3678eb1b77e	organization	1	{"uri": null, "name": "United Way of Pioneer Valley Holyoke Community Cupboard", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry service provided by United Way of Pioneer Valley, with guests limited to one visit per month.", "content_hash": "933eed25547ca0adc89fe23ec047ec9b6a3da595b18718e1e516a9ff8477c454", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:36.284056+00	reconciler	\N
6818fed2-ef2f-4bfc-b2f7-aa39aa5bd052	b15efee7-93d8-46d5-995e-1b186985d0a2	organization_source	1	{"uri": null, "name": "United Way of Pioneer Valley Chicopee Service Center", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pantry will be closing permanently after June 30, 2025.", "content_hash": "fcded927699c2eb9eee72bc92cdadfe72270b0bf8c1705a7edba727a61f256b1", "legal_status": null, "organization_id": "0f94c779-c3f1-4541-ac32-8a094162d820", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:37.973213+00	reconciler	b15efee7-93d8-46d5-995e-1b186985d0a2
45764446-30f9-4306-809a-5f4824b22e9b	0f94c779-c3f1-4541-ac32-8a094162d820	organization	1	{"uri": null, "name": "United Way of Pioneer Valley Chicopee Service Center", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pantry will be closing permanently after June 30, 2025.", "content_hash": "fcded927699c2eb9eee72bc92cdadfe72270b0bf8c1705a7edba727a61f256b1", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:37.975041+00	reconciler	\N
5697013e-1d46-4c7a-9b7a-c05e5a4db38f	75e53374-fc50-4df6-b5a3-99d3d6780539	organization_source	1	{"uri": null, "name": "Pentecostal Church Ebenezer Assemblies of God", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Food pantry operated by Pentecostal Church Ebenezer Assemblies of God.", "content_hash": "22ecbd551a20ba29a3861d8870f5cd5c647813c16ed303cbf4239ada453b5d28", "legal_status": null, "organization_id": "0b023769-90ac-44ae-b4bf-cce6c20b802d", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:38.799094+00	reconciler	75e53374-fc50-4df6-b5a3-99d3d6780539
b61858ee-cedf-42e9-95d1-414afe5a2310	0b023769-90ac-44ae-b4bf-cce6c20b802d	organization	1	{"uri": null, "name": "Pentecostal Church Ebenezer Assemblies of God", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Food pantry operated by Pentecostal Church Ebenezer Assemblies of God.", "content_hash": "22ecbd551a20ba29a3861d8870f5cd5c647813c16ed303cbf4239ada453b5d28", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:38.801207+00	reconciler	\N
07c254f9-2fbf-4525-8b57-a003e04dbf9a	c093da2e-fcc4-4da8-9a6e-39c277582bf0	organization_source	1	{"uri": null, "name": "Menlo College", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Menlo College is an educational institution that also provides food pantry services.", "content_hash": "e6eb91e109a3d365af06232e1abbdfc4215ac6a3a2eaf0711335aa94f7e2cb94", "legal_status": null, "organization_id": "ee9a1805-5561-4023-8f41-de99c21a8c1a", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:39.679082+00	reconciler	c093da2e-fcc4-4da8-9a6e-39c277582bf0
91959f3b-c463-4117-83b3-f589b6cf5e3d	ee9a1805-5561-4023-8f41-de99c21a8c1a	organization	1	{"uri": null, "name": "Menlo College", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Menlo College is an educational institution that also provides food pantry services.", "content_hash": "e6eb91e109a3d365af06232e1abbdfc4215ac6a3a2eaf0711335aa94f7e2cb94", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:39.681239+00	reconciler	\N
5f718167-2439-4ae4-b455-94257ed1901a	9e97dec5-5930-4845-b62f-22bd2add419f	organization_source	1	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry Center Street Mobile Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry operates a mobile pantry service.", "content_hash": "b5bffcbba96da7f6588eb39f6a84f410cbdba2309e71a1f2ee24745cee2b407d", "legal_status": null, "organization_id": "07d37961-f627-4eeb-b09c-27782fd3e26b", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:40.700059+00	reconciler	9e97dec5-5930-4845-b62f-22bd2add419f
bc24f24c-f49a-4977-801c-072a25d64606	07d37961-f627-4eeb-b09c-27782fd3e26b	organization	1	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry Center Street Mobile Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry operates a mobile pantry service.", "content_hash": "b5bffcbba96da7f6588eb39f6a84f410cbdba2309e71a1f2ee24745cee2b407d", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:40.704642+00	reconciler	\N
d4ee70ae-321b-4537-ac97-43f4fb4c6ca3	2e7bdba0-b2c0-48f3-b546-2536e1b5d6d8	organization_source	1	{"uri": null, "name": "God's Instruments Outreach & Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing food assistance.", "content_hash": "a1ec5d1fb09ad9110233878864f302ae603fd9b5d6e3df2217bae45f38c088b9", "legal_status": null, "organization_id": "97e4097e-3b03-4834-a94c-6892331cae1d", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:41.562504+00	reconciler	2e7bdba0-b2c0-48f3-b546-2536e1b5d6d8
fa787519-d588-49a0-8c40-124127b3838b	97e4097e-3b03-4834-a94c-6892331cae1d	organization	1	{"uri": null, "name": "God's Instruments Outreach & Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing food assistance.", "content_hash": "a1ec5d1fb09ad9110233878864f302ae603fd9b5d6e3df2217bae45f38c088b9", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:41.564415+00	reconciler	\N
cf0519be-be7a-4e58-92ef-aa3e0714f3d1	b182fb63-8614-48cd-8ca1-94808fd1ac63	phone	1	{"type": "voice", "number": "419-214-2648", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "a1ec5d1fb09ad9110233878864f302ae603fd9b5d6e3df2217bae45f38c088b9", "organization_id": "97e4097e-3b03-4834-a94c-6892331cae1d", "service_at_location_id": null}	2025-08-08 05:06:41.566013+00	reconciler	\N
71425be6-ff18-4abd-b3d2-310b903486bd	8412498f-70ae-4859-9c08-724f64aa356a	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "b182fb63-8614-48cd-8ca1-94808fd1ac63", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "a1ec5d1fb09ad9110233878864f302ae603fd9b5d6e3df2217bae45f38c088b9"}	2025-08-08 05:06:41.566013+00	reconciler	\N
eb4d15a8-8377-49b1-a0cf-c68d1262f280	aaf0c7e0-eb56-4f3d-81ca-a9dc4952447a	organization_source	1	{"uri": null, "name": "Fulton County Alano Club", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A club offering support services, including a food pantry.", "content_hash": "ea15a812925e08e12239a5b7a2628477ebcdb52a1b56abb986128020cfffeb2c", "legal_status": null, "organization_id": "f3fc8cfb-92a7-4bb7-a687-5995c09481f4", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:43.213555+00	reconciler	aaf0c7e0-eb56-4f3d-81ca-a9dc4952447a
240c9a85-61cc-4863-9bb7-7d32c5886394	f3fc8cfb-92a7-4bb7-a687-5995c09481f4	organization	1	{"uri": null, "name": "Fulton County Alano Club", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A club offering support services, including a food pantry.", "content_hash": "ea15a812925e08e12239a5b7a2628477ebcdb52a1b56abb986128020cfffeb2c", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:43.215661+00	reconciler	\N
f7e98737-e1ea-4d4b-a74e-476b7ef8ae7c	b4ba2d5f-3c7d-42c5-90be-bac90bed596e	organization_source	1	{"uri": null, "name": "The Salvation Army Holyoke Corps Feeding Program", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A Salvation Army program in Holyoke, MA, distributing bagged food at the door.", "content_hash": "dde8ee21b2d739d72e1265386e6d976b6cfec57056ee63561129ece47be9bef2", "legal_status": null, "organization_id": "4cae5bb2-732a-4bc3-92f6-3a4cb5e2d5d2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:44.127049+00	reconciler	b4ba2d5f-3c7d-42c5-90be-bac90bed596e
684966cc-f768-4ec4-b176-a56c241bea8e	4cae5bb2-732a-4bc3-92f6-3a4cb5e2d5d2	organization	1	{"uri": null, "name": "The Salvation Army Holyoke Corps Feeding Program", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A Salvation Army program in Holyoke, MA, distributing bagged food at the door.", "content_hash": "dde8ee21b2d739d72e1265386e6d976b6cfec57056ee63561129ece47be9bef2", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:44.129121+00	reconciler	\N
ef13c128-d623-4f1a-bbca-f230dca2783b	56b4a4cc-af8a-4cee-bcb5-f738fe92e490	organization_source	1	{"uri": null, "name": "Grand Lodge Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Toledo, Ohio.", "content_hash": "a38501e19bd8fc172e68df4ff5360c1de5704afc64e62af4e6feae4ac6afdc2b", "legal_status": null, "organization_id": "76f0f423-6ae0-4ddd-8773-ae1910facda6", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:44.989283+00	reconciler	56b4a4cc-af8a-4cee-bcb5-f738fe92e490
ed5998d5-b1c4-4497-9362-9cc8910cb3d3	76f0f423-6ae0-4ddd-8773-ae1910facda6	organization	1	{"uri": null, "name": "Grand Lodge Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located in Toledo, Ohio.", "content_hash": "a38501e19bd8fc172e68df4ff5360c1de5704afc64e62af4e6feae4ac6afdc2b", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:44.990998+00	reconciler	\N
a0afcb40-5ea2-4d21-90a4-5cab08c0d596	e3c2b551-219e-4fa8-b1bd-7485ee2c7410	organization_source	1	{"uri": null, "name": "Arm In Arm", "email": null, "source": "mercer_food_finder", "tax_id": null, "website": null, "scraper_id": "mercer_food_finder", "tax_status": null, "description": "Arm In Arm provides food pantry services.", "content_hash": "73242bb2e08f8def44cc45dd816ccb313a733aec14ace5c8d449002287fae090", "legal_status": null, "organization_id": "da7af643-e475-44df-b362-0d9c146f0342", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:45.801912+00	reconciler	e3c2b551-219e-4fa8-b1bd-7485ee2c7410
8f8e71bc-6455-4dd4-8829-d813933133c4	da7af643-e475-44df-b362-0d9c146f0342	organization	1	{"uri": null, "name": "Arm In Arm", "email": null, "source": "mercer_food_finder", "tax_id": null, "website": null, "scraper_id": "mercer_food_finder", "tax_status": null, "description": "Arm In Arm provides food pantry services.", "content_hash": "73242bb2e08f8def44cc45dd816ccb313a733aec14ace5c8d449002287fae090", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:45.803673+00	reconciler	\N
d27b9483-88f3-4dd6-bbc7-cb2257b0cb45	61f90a04-01cf-4fb5-b106-6b9ebda37fe3	organization_source	1	{"uri": null, "name": "Grace Community Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Grace Community Center offers food pantry services.", "content_hash": "7162eed7fbaaf6964ebc3bf7127dc6b2a9b5a784b922c53b2f3e8b39dd5a2262", "legal_status": null, "organization_id": "db45357c-bc03-4eb3-9a73-2a2724eefaf4", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:46.737191+00	reconciler	61f90a04-01cf-4fb5-b106-6b9ebda37fe3
b2f951e1-f2bc-464d-8be9-05de94aad107	db45357c-bc03-4eb3-9a73-2a2724eefaf4	organization	1	{"uri": null, "name": "Grace Community Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Grace Community Center offers food pantry services.", "content_hash": "7162eed7fbaaf6964ebc3bf7127dc6b2a9b5a784b922c53b2f3e8b39dd5a2262", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:46.742161+00	reconciler	\N
63c22bbf-0cca-4c35-bac1-fab984c51abe	a163f68c-d79b-404b-92d6-41ddf10893d1	phone	1	{"type": "voice", "number": "4192482467", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "7162eed7fbaaf6964ebc3bf7127dc6b2a9b5a784b922c53b2f3e8b39dd5a2262", "organization_id": "db45357c-bc03-4eb3-9a73-2a2724eefaf4", "service_at_location_id": null}	2025-08-08 05:06:46.747571+00	reconciler	\N
75341b3e-eaaf-4303-923d-3954bdbc2706	401432b5-9d70-49c7-9ab4-7578c4b11cb1	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "a163f68c-d79b-404b-92d6-41ddf10893d1", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "7162eed7fbaaf6964ebc3bf7127dc6b2a9b5a784b922c53b2f3e8b39dd5a2262"}	2025-08-08 05:06:46.747571+00	reconciler	\N
b8715cbd-2592-432f-947b-9fe03ba6da3b	4af9d678-c6a0-48de-b60c-8f6cb89cbe68	organization_source	1	{"uri": null, "name": "Greater Grace Christian Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A Christian church offering food pantry services in Toledo, Ohio.", "content_hash": "43d36dbc063f4e73cee2ac1159988e62cc071f795a697200e5ca283eb7628b7c", "legal_status": null, "organization_id": "103901e1-88f1-4590-8c11-f73271f2a702", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:47.62459+00	reconciler	4af9d678-c6a0-48de-b60c-8f6cb89cbe68
91c09c29-60ff-4218-a125-3623c78a3b75	103901e1-88f1-4590-8c11-f73271f2a702	organization	1	{"uri": null, "name": "Greater Grace Christian Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A Christian church offering food pantry services in Toledo, Ohio.", "content_hash": "43d36dbc063f4e73cee2ac1159988e62cc071f795a697200e5ca283eb7628b7c", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:47.626554+00	reconciler	\N
ebe4475c-4240-41e0-a277-671decefa0e7	487441ad-cf22-4854-a253-dee9a3ead5ed	phone	1	{"type": "voice", "number": "419-984-8448", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "43d36dbc063f4e73cee2ac1159988e62cc071f795a697200e5ca283eb7628b7c", "organization_id": "103901e1-88f1-4590-8c11-f73271f2a702", "service_at_location_id": null}	2025-08-08 05:06:47.627831+00	reconciler	\N
356aee6e-3a8e-4f03-92cf-8bcac0e82740	29da2275-5083-4ea5-b6d0-523245e7f4b5	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "487441ad-cf22-4854-a253-dee9a3ead5ed", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "43d36dbc063f4e73cee2ac1159988e62cc071f795a697200e5ca283eb7628b7c"}	2025-08-08 05:06:47.627831+00	reconciler	\N
2b529805-e313-48ca-ad71-dec7a1765e3d	f8079707-a697-4b7f-8493-57bacc1d49b1	organization_source	1	{"uri": null, "name": "Hands Helping Hands Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry organization.", "content_hash": "0690ab862f2e652fe22d155e6fd4230b754abecac5caee879b1b1f9b8cc956f3", "legal_status": null, "organization_id": "241c19a0-5185-4fd2-87e2-e21aed0fd1ee", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:48.53041+00	reconciler	f8079707-a697-4b7f-8493-57bacc1d49b1
2792627c-712f-4d3e-a0a0-d592ef34d0e1	241c19a0-5185-4fd2-87e2-e21aed0fd1ee	organization	1	{"uri": null, "name": "Hands Helping Hands Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry organization.", "content_hash": "0690ab862f2e652fe22d155e6fd4230b754abecac5caee879b1b1f9b8cc956f3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:48.53253+00	reconciler	\N
0e7bcf85-75da-4ef4-9829-16e3dba72624	70d37233-148d-47f8-afe4-27d99ab7babb	phone	1	{"type": "voice", "number": "419-485-5575", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "0690ab862f2e652fe22d155e6fd4230b754abecac5caee879b1b1f9b8cc956f3", "organization_id": "241c19a0-5185-4fd2-87e2-e21aed0fd1ee", "service_at_location_id": null}	2025-08-08 05:06:48.533929+00	reconciler	\N
5e1d2747-d621-4092-8b65-47d2219cc86a	178931de-f106-4a25-b6da-4ef769a4abce	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "70d37233-148d-47f8-afe4-27d99ab7babb", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "0690ab862f2e652fe22d155e6fd4230b754abecac5caee879b1b1f9b8cc956f3"}	2025-08-08 05:06:48.533929+00	reconciler	\N
494884c7-3483-4c5e-a671-72df44a87b57	5484226e-de8c-4df8-ba84-ca51730eaa88	organization_source	1	{"uri": null, "name": "South County Community Services", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "South County Community Services provides food assistance and other support services.", "content_hash": "8df26a8e0c97b9635f46a4ef19f94ddbff5f60a16afe1e501ae4c58ddf26ad97", "legal_status": null, "organization_id": "33354350-2bc6-4991-8a26-aca284bfa87c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:49.394472+00	reconciler	5484226e-de8c-4df8-ba84-ca51730eaa88
d92bd1f3-ad5b-4557-bbce-3e3b2f43eedf	33354350-2bc6-4991-8a26-aca284bfa87c	organization	1	{"uri": null, "name": "South County Community Services", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "South County Community Services provides food assistance and other support services.", "content_hash": "8df26a8e0c97b9635f46a4ef19f94ddbff5f60a16afe1e501ae4c58ddf26ad97", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:49.396259+00	reconciler	\N
c445c8e4-b890-4bb2-a4fb-4e34e50ba368	171f03a6-46f1-45ef-a9f3-fe24c7615615	organization_source	1	{"uri": null, "name": "First Congregational Church of Chicopee Regina's Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry operated by the First Congregational Church of Chicopee, offering food assistance.", "content_hash": "df5c3a8d46c426efeca0c92bbf3bb5a4790cfcd6477fdebc9b16e3397dbe58f2", "legal_status": null, "organization_id": "7beb26ac-7b67-47fe-bdf4-81dbc7019b3f", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:51.030371+00	reconciler	171f03a6-46f1-45ef-a9f3-fe24c7615615
72a7b5ce-a1ec-4273-aec7-04086835c242	7beb26ac-7b67-47fe-bdf4-81dbc7019b3f	organization	1	{"uri": null, "name": "First Congregational Church of Chicopee Regina's Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry operated by the First Congregational Church of Chicopee, offering food assistance.", "content_hash": "df5c3a8d46c426efeca0c92bbf3bb5a4790cfcd6477fdebc9b16e3397dbe58f2", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:51.032089+00	reconciler	\N
098c2a2b-d32b-47de-a244-bb2e09c7f437	8644dd5a-af1a-4c9b-9bab-729220647774	organization_source	1	{"uri": null, "name": "Hebron Ministries", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing food assistance.", "content_hash": "0b03782b798cf30f76333fab7aa0a9a1c8f9e47caee55607b9312d8d86862cb7", "legal_status": null, "organization_id": "ddc57316-5169-4aa8-b941-b092c4cce322", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:51.876175+00	reconciler	8644dd5a-af1a-4c9b-9bab-729220647774
ad17fb4b-0bff-46eb-b8fe-bd7256c71542	fe31728d-79a2-4369-82a2-f65165249bd4	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "e33c687f-31b2-4698-a297-068cf85b577d", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "17fb41fcb6c1492df988cebd22854472554f07511e9adacc5c960ec7ed36c46d"}	2025-08-08 05:06:57.823489+00	reconciler	\N
b1f7a59c-00b2-4f9a-8bb1-c8cad39e4995	ddc57316-5169-4aa8-b941-b092c4cce322	organization	1	{"uri": null, "name": "Hebron Ministries", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry providing food assistance.", "content_hash": "0b03782b798cf30f76333fab7aa0a9a1c8f9e47caee55607b9312d8d86862cb7", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:51.896977+00	reconciler	\N
aecfc04f-d0e6-4207-92b0-94862adbe730	fc603c16-0a32-4f14-a74c-32f15c6a0a9b	organization_source	1	{"uri": null, "name": "Momentum for Mental Health", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Momentum for Mental Health provides food assistance services.", "content_hash": "50fe333b0ea15a9ca668d7f7bebf151e3daec656f5f5b45fa24af4671c4df6d4", "legal_status": null, "organization_id": "0bb28925-7270-4893-a875-7ece5d341603", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:52.867073+00	reconciler	fc603c16-0a32-4f14-a74c-32f15c6a0a9b
16b47d1f-bfca-427e-8353-9c41eb6b82d1	0bb28925-7270-4893-a875-7ece5d341603	organization	1	{"uri": null, "name": "Momentum for Mental Health", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Momentum for Mental Health provides food assistance services.", "content_hash": "50fe333b0ea15a9ca668d7f7bebf151e3daec656f5f5b45fa24af4671c4df6d4", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:52.868751+00	reconciler	\N
c469858a-89e7-44c4-bf3b-c448d606196f	e1b91477-24cd-4a7f-944c-9613b7a05a1d	organization_source	1	{"uri": null, "name": "SVDP Homeless Help Center", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "SVDP Homeless Help Center provides food assistance services.", "content_hash": "8bba1a5f6118f2e20ce897c91e53d4a371a34649ba4f63bd60baddd6350d2ed3", "legal_status": null, "organization_id": "b474f45e-67cf-41bb-821d-10b51d58177d", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:53.676496+00	reconciler	e1b91477-24cd-4a7f-944c-9613b7a05a1d
c5dd3f9f-2382-4cbe-9a2a-c53c1ad3867e	b474f45e-67cf-41bb-821d-10b51d58177d	organization	1	{"uri": null, "name": "SVDP Homeless Help Center", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "SVDP Homeless Help Center provides food assistance services.", "content_hash": "8bba1a5f6118f2e20ce897c91e53d4a371a34649ba4f63bd60baddd6350d2ed3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:53.678809+00	reconciler	\N
6d042707-afa0-4c72-be74-38028165a806	59c7b4a5-c044-4a29-9298-4a2ea5a64399	organization_source	1	{"uri": null, "name": "Community Church-Seed Faith Missions", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Community Church-Seed Faith Missions provides food pantry services.", "content_hash": "eeab542ba7a6ff95c6fdf58047c49ddedb9a781304a7eec56c0b5ab302bcb52a", "legal_status": null, "organization_id": "534a4b51-bdfa-482e-94df-89cab2fe5d62", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:54.459402+00	reconciler	59c7b4a5-c044-4a29-9298-4a2ea5a64399
25e79a85-60e8-4b20-9bb3-3a5a06e9de67	534a4b51-bdfa-482e-94df-89cab2fe5d62	organization	1	{"uri": null, "name": "Community Church-Seed Faith Missions", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Community Church-Seed Faith Missions provides food pantry services.", "content_hash": "eeab542ba7a6ff95c6fdf58047c49ddedb9a781304a7eec56c0b5ab302bcb52a", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:54.461803+00	reconciler	\N
f7f55dbf-24cf-4bcb-8103-cc3b2529c8d9	0971371d-e0f4-441f-afb9-f5946f300601	organization_source	1	{"uri": null, "name": "Holiness Temple Church Of God In Christ", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Holiness Temple Church Of God In Christ is a religious organization that provides a food pantry service.", "content_hash": "03a21fb42545a10231efaee3b7e296e112fab491c050001b9e8f23e623923325", "legal_status": null, "organization_id": "19660005-9ebd-4344-9f8b-3096d7341b49", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:55.266882+00	reconciler	0971371d-e0f4-441f-afb9-f5946f300601
ac64b91b-b56d-4914-b50f-850046b256d5	19660005-9ebd-4344-9f8b-3096d7341b49	organization	1	{"uri": null, "name": "Holiness Temple Church Of God In Christ", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Holiness Temple Church Of God In Christ is a religious organization that provides a food pantry service.", "content_hash": "03a21fb42545a10231efaee3b7e296e112fab491c050001b9e8f23e623923325", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:55.269104+00	reconciler	\N
c4cb013d-c094-4ead-8214-9396689fc13b	c508df51-4677-447a-a428-5c9b5532f94a	organization_source	5	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Second Harvest of Silicon Valley is a food bank serving the Silicon Valley area.", "content_hash": "368366977a750fe4482c6041b05a46de334b0f72285177ad9e14572168b7fff6", "legal_status": null, "organization_id": "324e6d0f-f577-40ff-a350-bf25cde132a8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:57.010807+00	reconciler	c508df51-4677-447a-a428-5c9b5532f94a
e2b8610e-baa2-4336-8485-5dc66761d671	c2448428-3762-41d9-b0b9-d5524bd7c58c	organization_source	1	{"uri": null, "name": "La Iglesia De Dios Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "La Iglesia De Dios operates a food pantry.", "content_hash": "17fb41fcb6c1492df988cebd22854472554f07511e9adacc5c960ec7ed36c46d", "legal_status": null, "organization_id": "0d06952e-e0b4-4bce-8284-1f4ac9bf7d31", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:57.820597+00	reconciler	c2448428-3762-41d9-b0b9-d5524bd7c58c
6cc9d773-5722-40a2-a711-8831dfe13bf9	0d06952e-e0b4-4bce-8284-1f4ac9bf7d31	organization	1	{"uri": null, "name": "La Iglesia De Dios Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "La Iglesia De Dios operates a food pantry.", "content_hash": "17fb41fcb6c1492df988cebd22854472554f07511e9adacc5c960ec7ed36c46d", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:57.822239+00	reconciler	\N
419ad893-d426-4b9a-aa48-873cf3a39e34	e33c687f-31b2-4698-a297-068cf85b577d	phone	1	{"type": "voice", "number": "(413) 314-9067", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "17fb41fcb6c1492df988cebd22854472554f07511e9adacc5c960ec7ed36c46d", "organization_id": "0d06952e-e0b4-4bce-8284-1f4ac9bf7d31", "service_at_location_id": null}	2025-08-08 05:06:57.823489+00	reconciler	\N
444c60b9-d2e2-4ffe-a922-c0d544b1fe7f	84e55425-2c94-42f8-b7d5-a0a006ae6710	organization_source	1	{"uri": null, "name": "Help Feed Toledo Area At Gateway Baptist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located at Gateway Baptist Church in Toledo, OH.", "content_hash": "e258d21d65e1f6ee00c8646d2726024f62b46aad288e8c95fa332079045348af", "legal_status": null, "organization_id": "931565e8-aba4-4f81-8c53-bc2396f01281", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:58.664794+00	reconciler	84e55425-2c94-42f8-b7d5-a0a006ae6710
4c7ae4cf-b5e8-412e-bea7-280e8911de69	931565e8-aba4-4f81-8c53-bc2396f01281	organization	1	{"uri": null, "name": "Help Feed Toledo Area At Gateway Baptist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry located at Gateway Baptist Church in Toledo, OH.", "content_hash": "e258d21d65e1f6ee00c8646d2726024f62b46aad288e8c95fa332079045348af", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:58.666779+00	reconciler	\N
713d082f-b5c5-440f-8c2b-66e6baa7bb79	298603ba-a508-4bc7-9190-76f7ec394ca2	organization_source	1	{"uri": null, "name": "SF-Marin Food Bank", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "SF-Marin Food Bank is a food bank serving the San Francisco and Marin counties.", "content_hash": "7697a6027e0d1a7f6be74ae5c58d2b931a43e3f18fdcf7c8ffbcb5d47d848f42", "legal_status": null, "organization_id": "4f1ec323-a4ce-4a13-8af8-26d6db11d97e", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:59.484312+00	reconciler	298603ba-a508-4bc7-9190-76f7ec394ca2
7832c58a-76f1-447f-893d-db24c1dadbc4	4f1ec323-a4ce-4a13-8af8-26d6db11d97e	organization	1	{"uri": null, "name": "SF-Marin Food Bank", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "SF-Marin Food Bank is a food bank serving the San Francisco and Marin counties.", "content_hash": "7697a6027e0d1a7f6be74ae5c58d2b931a43e3f18fdcf7c8ffbcb5d47d848f42", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:06:59.486129+00	reconciler	\N
bedfb14a-b065-4810-bb3f-13170b9746d9	35cbfcc2-831f-4f9a-9f7a-8f9217f4447b	organization_source	1	{"uri": null, "name": "A Place for Hashem Ministries", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A food pantry providing services in Clinton, MD.", "content_hash": "36bb7599f5653a28443ab78390958b4a14bdd91300e15e5f13a718cdcbc624ad", "legal_status": null, "organization_id": "1ebdf409-d7f3-4d1a-b715-ab8736f7385b", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:00.363724+00	reconciler	35cbfcc2-831f-4f9a-9f7a-8f9217f4447b
f089fde4-bc21-4eb5-9c54-a79d08e48f36	1ebdf409-d7f3-4d1a-b715-ab8736f7385b	organization	1	{"uri": null, "name": "A Place for Hashem Ministries", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A food pantry providing services in Clinton, MD.", "content_hash": "36bb7599f5653a28443ab78390958b4a14bdd91300e15e5f13a718cdcbc624ad", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:00.365463+00	reconciler	\N
1ebd79fb-4017-4d79-9682-12fb694a2224	5105b7e8-efcc-4635-9360-057bb10427d1	organization_source	1	{"uri": null, "name": "Our Second Home - DCP", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A food pantry providing free groceries.", "content_hash": "4a7037bc5c315366703bc7adf512c3dfaf49751354ba78fa46b53fc7a2fb911b", "legal_status": null, "organization_id": "b860105b-6752-4592-bdfe-0031fe418aa4", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:01.360137+00	reconciler	5105b7e8-efcc-4635-9360-057bb10427d1
51ffd707-5c24-43bc-a9d7-620a9390ac21	b860105b-6752-4592-bdfe-0031fe418aa4	organization	1	{"uri": null, "name": "Our Second Home - DCP", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A food pantry providing free groceries.", "content_hash": "4a7037bc5c315366703bc7adf512c3dfaf49751354ba78fa46b53fc7a2fb911b", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:01.362545+00	reconciler	\N
f605050b-6e54-4db6-9785-ff18ea309150	897b4b36-1b2b-4df2-bd8c-f32a6435a910	organization_source	1	{"uri": null, "name": "Roots Pantry", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Roots Pantry is a food pantry offering free groceries.", "content_hash": "2888b490e3fe280afaffc06bca8582d7998e1f48c722672ce75052e8ece38e05", "legal_status": null, "organization_id": "8ab9b760-d544-4c88-b54e-7e96e96400ca", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:02.324726+00	reconciler	897b4b36-1b2b-4df2-bd8c-f32a6435a910
41815b79-a1db-4628-b953-ffe09571942c	8ab9b760-d544-4c88-b54e-7e96e96400ca	organization	1	{"uri": null, "name": "Roots Pantry", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Roots Pantry is a food pantry offering free groceries.", "content_hash": "2888b490e3fe280afaffc06bca8582d7998e1f48c722672ce75052e8ece38e05", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:02.326817+00	reconciler	\N
e8b2ebf5-d891-4506-87c4-e8428c1cdf5e	4612d211-0508-4b5a-a857-6075152eacbc	organization_source	1	{"uri": null, "name": "St. Justin's Community Ministry", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A community ministry offering free groceries.", "content_hash": "730254e6b34c2913706be6c0229e0976e7c1fc6388cc4d4afba117c8166bf07a", "legal_status": null, "organization_id": "4bea8ee1-c20b-4743-8a7d-0f857a38c6cf", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:03.270349+00	reconciler	4612d211-0508-4b5a-a857-6075152eacbc
7f9aab8c-0dcd-43a0-a41c-fd1a6b8ab743	4bea8ee1-c20b-4743-8a7d-0f857a38c6cf	organization	1	{"uri": null, "name": "St. Justin's Community Ministry", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A community ministry offering free groceries.", "content_hash": "730254e6b34c2913706be6c0229e0976e7c1fc6388cc4d4afba117c8166bf07a", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:03.272572+00	reconciler	\N
f23d5ea2-cf13-4eff-9228-79083d0edb4a	5fcbdfb0-154b-428d-9c4e-01c261109f72	organization_source	1	{"uri": null, "name": "Cathedral of Faith - Reaching Out", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Cathedral of Faith is a food pantry providing free groceries, drive-thru, and walk-up services.", "content_hash": "347ae3fcac05f5496a9bfffd3fdb94520d672978dd940cfea3817bea2ad5e235", "legal_status": null, "organization_id": "0b78e55b-8a41-4d20-b99d-7b2f304773d9", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:04.14661+00	reconciler	5fcbdfb0-154b-428d-9c4e-01c261109f72
c869c89d-e4d0-4059-80e0-a1b42e35ee32	0b78e55b-8a41-4d20-b99d-7b2f304773d9	organization	1	{"uri": null, "name": "Cathedral of Faith - Reaching Out", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Cathedral of Faith is a food pantry providing free groceries, drive-thru, and walk-up services.", "content_hash": "347ae3fcac05f5496a9bfffd3fdb94520d672978dd940cfea3817bea2ad5e235", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:04.148652+00	reconciler	\N
43ebc49d-25cb-4fd4-a206-687e57d24971	73954d9e-cac9-4dba-91a3-c31a3905f58c	phone	1	{"type": "voice", "number": "UNKNOWN", "source": "second_harvest_of_silicon_valley_ca", "extension": null, "contact_id": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "service_id": null, "description": null, "location_id": null, "content_hash": "347ae3fcac05f5496a9bfffd3fdb94520d672978dd940cfea3817bea2ad5e235", "organization_id": "0b78e55b-8a41-4d20-b99d-7b2f304773d9", "service_at_location_id": null}	2025-08-08 05:07:04.150427+00	reconciler	\N
4dc983eb-b8da-4871-af7a-c6e62c32b14b	5c0cfb4d-ebd5-470b-afba-5810efe86ddc	language	1	{"code": "", "name": "English", "note": null, "source": "second_harvest_of_silicon_valley_ca", "phone_id": "73954d9e-cac9-4dba-91a3-c31a3905f58c", "scraper_id": "second_harvest_of_silicon_valley_ca", "service_id": null, "location_id": null, "content_hash": "347ae3fcac05f5496a9bfffd3fdb94520d672978dd940cfea3817bea2ad5e235"}	2025-08-08 05:07:04.150427+00	reconciler	\N
5fd5791f-9b1e-462f-818d-a1c76648fe52	c508df51-4677-447a-a428-5c9b5532f94a	organization_source	6	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Second Harvest of Silicon Valley is a food bank serving the Silicon Valley area.", "content_hash": "d1cb74b3f72cdb0ea275e25fb89372a6ef3eeb931e077f0ec6e3e6073b94b30b", "legal_status": null, "organization_id": "324e6d0f-f577-40ff-a350-bf25cde132a8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:04.984928+00	reconciler	c508df51-4677-447a-a428-5c9b5532f94a
787a276c-e0e5-44cb-9405-e9d309659340	a83d8441-3293-43bf-af1c-5569d9f3bb81	organization_source	1	{"uri": null, "name": "Sacred Heart Community Service", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A community service organization providing food assistance and other support.", "content_hash": "373681a1975f4cc4276e28be93d8d25570ce2747ca5c51868b7ae4f4b8e28bd3", "legal_status": null, "organization_id": "84c0380e-14aa-4e86-9d15-815d17e455ff", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:07.624144+00	reconciler	a83d8441-3293-43bf-af1c-5569d9f3bb81
014bd035-452a-4d32-8019-0e9d3a08778d	84c0380e-14aa-4e86-9d15-815d17e455ff	organization	1	{"uri": null, "name": "Sacred Heart Community Service", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A community service organization providing food assistance and other support.", "content_hash": "373681a1975f4cc4276e28be93d8d25570ce2747ca5c51868b7ae4f4b8e28bd3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:07.626029+00	reconciler	\N
f9f1183b-5e10-4d36-ac24-4ca21f0459d4	cbd31fae-49b2-4801-be2f-11084aae63fe	organization_source	1	{"uri": null, "name": "There With Care", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "There With Care supports families with critically ill children.", "content_hash": "bf2d2302174b9de7455bf159e4da4d9d623cb799d5006ba4d1da65b840d481ef", "legal_status": null, "organization_id": "de9d54da-c983-433f-bd6e-c8135771cf9f", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:08.448318+00	reconciler	cbd31fae-49b2-4801-be2f-11084aae63fe
326693a6-b3fe-4128-9a5a-9584439a7d89	de9d54da-c983-433f-bd6e-c8135771cf9f	organization	1	{"uri": null, "name": "There With Care", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "There With Care supports families with critically ill children.", "content_hash": "bf2d2302174b9de7455bf159e4da4d9d623cb799d5006ba4d1da65b840d481ef", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:08.450541+00	reconciler	\N
e0454d4e-af6f-4718-964a-1f7fdcba8e8a	1a342929-be01-4d9d-b062-8141de149f71	organization_source	9	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry provides mobile food pantry services.", "content_hash": "6bf7ee4bde02a7cba2da1aa3b7d7049da061d8525608810fa681fb6b3eed236a", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:09.324225+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
f79fb045-b138-4206-9ff0-f889b9cd9ad6	bb2d780a-8cb0-4911-b057-0c5516ce7be1	organization_source	1	{"uri": null, "name": "North of Yountville Pantry - St. Helena Community Pantry", "email": null, "source": "community_action_of_napa_valley_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "community_action_of_napa_valley_food_bank_ca", "tax_status": null, "description": "A food pantry operated by Community Action of Napa Valley Food Bank.", "content_hash": "09272190d69c0a86b6f6a5b894ba9fe8c355d8a220309935c54c8843f1d7e30d", "legal_status": null, "organization_id": "54779909-54f1-4f76-9825-b0bb3e8df0c3", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:10.291433+00	reconciler	bb2d780a-8cb0-4911-b057-0c5516ce7be1
462c3725-8a3b-4667-9dc6-476316302fb1	54779909-54f1-4f76-9825-b0bb3e8df0c3	organization	1	{"uri": null, "name": "North of Yountville Pantry - St. Helena Community Pantry", "email": null, "source": "community_action_of_napa_valley_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "community_action_of_napa_valley_food_bank_ca", "tax_status": null, "description": "A food pantry operated by Community Action of Napa Valley Food Bank.", "content_hash": "09272190d69c0a86b6f6a5b894ba9fe8c355d8a220309935c54c8843f1d7e30d", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:10.293319+00	reconciler	\N
ba668b92-736b-44bf-9208-c39fb0f535c3	30b6fbf0-1fa2-4838-b210-551d94be6bc8	organization_source	1	{"uri": null, "name": "ACTS", "email": "scouteau@actspwc.org", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "ACTS (Aid for Community to Survive) is a food pantry.", "content_hash": "2461d53c35a91df1877faefee81080a4537a16a8ac34a7821da676763e3f485b", "legal_status": null, "organization_id": "12ad9ea8-422e-4abe-a375-3ba0df336c23", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:11.17495+00	reconciler	30b6fbf0-1fa2-4838-b210-551d94be6bc8
3c956cef-0bbe-41bc-96f5-02a9e278323b	12ad9ea8-422e-4abe-a375-3ba0df336c23	organization	1	{"uri": null, "name": "ACTS", "email": "scouteau@actspwc.org", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "ACTS (Aid for Community to Survive) is a food pantry.", "content_hash": "2461d53c35a91df1877faefee81080a4537a16a8ac34a7821da676763e3f485b", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:11.176753+00	reconciler	\N
b784e92e-a03f-4055-bd97-12fdb8dc298d	1a342929-be01-4d9d-b062-8141de149f71	organization_source	10	{"uri": null, "name": "Lorraine's Soup Kitchen and Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Lorraine's Soup Kitchen and Pantry operates a mobile food bank, distributing food on the 3rd Tuesday of each month.", "content_hash": "9a41253ea5c4633555334e7e5b446ba8d15f9e0aefece19575bcdb6cfffe344a", "legal_status": null, "organization_id": "f6e0dadd-d53c-4b24-a5eb-37e635069f40", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:12.88784+00	reconciler	1a342929-be01-4d9d-b062-8141de149f71
503d0004-3a94-447a-9cc8-5acce55743c5	6a1c7118-004b-4981-ae1b-fdd12efe032a	organization_source	1	{"uri": null, "name": "Holyoke Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Food pantry services in Holyoke, MA.", "content_hash": "127cc40fb3f7a51a4511c0ecc36aba538bb5ba0e6dcb3625c83e308ffb1bee60", "legal_status": null, "organization_id": "82d3fdb5-526d-4fa2-96f2-e438dd63cc6a", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:13.832308+00	reconciler	6a1c7118-004b-4981-ae1b-fdd12efe032a
71138d7c-e945-4834-b124-8cbccc1e6660	82d3fdb5-526d-4fa2-96f2-e438dd63cc6a	organization	1	{"uri": null, "name": "Holyoke Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Food pantry services in Holyoke, MA.", "content_hash": "127cc40fb3f7a51a4511c0ecc36aba538bb5ba0e6dcb3625c83e308ffb1bee60", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:13.839219+00	reconciler	\N
0b0b262a-a96f-4884-b57c-0ef58316b2e7	cf8b03b5-7ee0-4d82-b1b1-3f2ba40cb82a	organization_source	1	{"uri": null, "name": "Holy Trinity St. Vincent's De Paul", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry serving the community.", "content_hash": "4eeffcd4220fee2d198f25c2ad9d437f0cade8aa738420dc2b07c30d5e601b59", "legal_status": null, "organization_id": "41e6a5fe-cfd5-482b-8074-1a89c6b1e5fe", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:14.803894+00	reconciler	cf8b03b5-7ee0-4d82-b1b1-3f2ba40cb82a
2fe82bc2-762d-42c1-9a10-daa693028193	41e6a5fe-cfd5-482b-8074-1a89c6b1e5fe	organization	1	{"uri": null, "name": "Holy Trinity St. Vincent's De Paul", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry serving the community.", "content_hash": "4eeffcd4220fee2d198f25c2ad9d437f0cade8aa738420dc2b07c30d5e601b59", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:14.80625+00	reconciler	\N
5b3e9dd6-f11b-4af7-a351-a0ecd50735e1	b1d87fdc-25ee-4bdf-bca7-8df466773e2c	phone	1	{"type": "voice", "number": "(419)644-4014", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "4eeffcd4220fee2d198f25c2ad9d437f0cade8aa738420dc2b07c30d5e601b59", "organization_id": "41e6a5fe-cfd5-482b-8074-1a89c6b1e5fe", "service_at_location_id": null}	2025-08-08 05:07:14.807627+00	reconciler	\N
f809f234-109c-466f-be0a-e4d965f232d7	11ab16ea-cc05-46e2-8422-3c20ed6df41f	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "b1d87fdc-25ee-4bdf-bca7-8df466773e2c", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "4eeffcd4220fee2d198f25c2ad9d437f0cade8aa738420dc2b07c30d5e601b59"}	2025-08-08 05:07:14.807627+00	reconciler	\N
63a7c315-303c-4cbf-8e96-a28e12496e36	df19b61b-3961-4498-ac56-afc6291bf82f	organization_source	1	{"uri": null, "name": "Chicopee McKinley Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry service located in Chicopee, MA.", "content_hash": "99b03787e8ad264db193d8f8a40d74e209da0b1532362fd73615a1033a7d92e6", "legal_status": null, "organization_id": "edcc7b45-56ec-4156-8938-6564c9f0bc43", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:16.553746+00	reconciler	df19b61b-3961-4498-ac56-afc6291bf82f
5a2296a5-92ce-423f-aa6e-dabf1a996e22	edcc7b45-56ec-4156-8938-6564c9f0bc43	organization	1	{"uri": null, "name": "Chicopee McKinley Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry service located in Chicopee, MA.", "content_hash": "99b03787e8ad264db193d8f8a40d74e209da0b1532362fd73615a1033a7d92e6", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:16.555652+00	reconciler	\N
aaf5bfe0-11b6-491c-bf64-9ffb6352b4dd	c508df51-4677-447a-a428-5c9b5532f94a	organization_source	7	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Second Harvest of Silicon Valley is a food bank serving Santa Clara and San Mateo Counties in California.", "content_hash": "1a04e014d2b468a3014b218122ea40a023f92937d5383348f0d5eef1e2bc8b49", "legal_status": null, "organization_id": "324e6d0f-f577-40ff-a350-bf25cde132a8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:17.415681+00	reconciler	c508df51-4677-447a-a428-5c9b5532f94a
9896e25e-a8d8-4f81-abad-49f2eaf9b1cb	6f6a1f51-0ae6-4c4d-ae90-0691dc2c6072	organization_source	1	{"uri": null, "name": "Antioch Baptist Church", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Antioch Baptist Church offers free groceries through drive-thru and walk-up options.", "content_hash": "5614746b8f3657292e673d7817ce08602e8975f3de914a3b425d06db01986db0", "legal_status": null, "organization_id": "ba3e15e3-e773-48ff-892b-460ecf9fcaa8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:19.204523+00	reconciler	6f6a1f51-0ae6-4c4d-ae90-0691dc2c6072
d96422f7-1480-4e20-ae4f-1ec1862ce68e	ba3e15e3-e773-48ff-892b-460ecf9fcaa8	organization	1	{"uri": null, "name": "Antioch Baptist Church", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Antioch Baptist Church offers free groceries through drive-thru and walk-up options.", "content_hash": "5614746b8f3657292e673d7817ce08602e8975f3de914a3b425d06db01986db0", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:19.20752+00	reconciler	\N
cbf39be2-01f9-49e5-b226-5c34d03951b2	815ea385-fb67-408c-a708-ae6021440fee	organization_source	1	{"uri": null, "name": "Live Oak Adult Day Services - Los Gatos", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Live Oak Adult Day Services offers food assistance to seniors.", "content_hash": "815a55d71bd05753297a74aa97c8716a65bea3ff8a9e3f7e74fcae386486d1c2", "legal_status": null, "organization_id": "209a91ae-ea7d-46d6-8e13-15a0ee5e51ff", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:20.095592+00	reconciler	815ea385-fb67-408c-a708-ae6021440fee
2f069fd8-46c2-4ed6-a836-e3c447d7b090	209a91ae-ea7d-46d6-8e13-15a0ee5e51ff	organization	1	{"uri": null, "name": "Live Oak Adult Day Services - Los Gatos", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Live Oak Adult Day Services offers food assistance to seniors.", "content_hash": "815a55d71bd05753297a74aa97c8716a65bea3ff8a9e3f7e74fcae386486d1c2", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:20.098878+00	reconciler	\N
848b9461-07bc-492c-a0f4-aab5242937d4	54a15d2f-306b-464b-8563-4729dbc62f6a	organization_source	1	{"uri": null, "name": "Alamance County Community Services", "email": null, "source": "second_harvest_food_bank_of_northwest_north_carolina_nc", "tax_id": null, "website": null, "scraper_id": "second_harvest_food_bank_of_northwest_north_carolina_nc", "tax_status": null, "description": "Alamance County Community Services offers food pantry services.", "content_hash": "cf38f40a027828f44ee8779a50b1e79ea90bce06989958a6a825616bd7c82b92", "legal_status": null, "organization_id": "f79d64f6-fbc8-485b-82bb-adb566644d63", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:20.976658+00	reconciler	54a15d2f-306b-464b-8563-4729dbc62f6a
9f2c4598-19aa-4aac-92c9-ed1a2b5b8acd	f79d64f6-fbc8-485b-82bb-adb566644d63	organization	1	{"uri": null, "name": "Alamance County Community Services", "email": null, "source": "second_harvest_food_bank_of_northwest_north_carolina_nc", "tax_id": null, "website": null, "scraper_id": "second_harvest_food_bank_of_northwest_north_carolina_nc", "tax_status": null, "description": "Alamance County Community Services offers food pantry services.", "content_hash": "cf38f40a027828f44ee8779a50b1e79ea90bce06989958a6a825616bd7c82b92", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:20.978397+00	reconciler	\N
396b01bf-d66a-4679-bac7-4e8c5044da0c	6bd86306-5298-4842-ac8b-06a835a2641e	organization_source	1	{"uri": null, "name": "Salvation Army Gilroy", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A Salvation Army location offering food assistance and other support services.", "content_hash": "146968c8af956dce16f98b01fce9dd33d35835171edf41f9cd882393a48cd11b", "legal_status": null, "organization_id": "7db82681-1aa6-41e5-96cb-b110a546257a", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:21.796508+00	reconciler	6bd86306-5298-4842-ac8b-06a835a2641e
4cf134dd-b039-4ec1-9a02-1e348fd4b3c9	7db82681-1aa6-41e5-96cb-b110a546257a	organization	1	{"uri": null, "name": "Salvation Army Gilroy", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A Salvation Army location offering food assistance and other support services.", "content_hash": "146968c8af956dce16f98b01fce9dd33d35835171edf41f9cd882393a48cd11b", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:21.79827+00	reconciler	\N
3e61c8ca-57c1-4729-a140-3e8cd10998da	4803f495-afdb-44c3-9b37-480c0bda2aba	organization_source	1	{"uri": null, "name": "Downtown Streets Team", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Provides food assistance services.", "content_hash": "a19f76c3f4ca07cfdd75059c64e9264172c00f7286095e2803214270170969ea", "legal_status": null, "organization_id": "88c3aaee-16ff-4ae9-807f-503b93158fda", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:24.438854+00	reconciler	4803f495-afdb-44c3-9b37-480c0bda2aba
63d3681c-ad6a-44ae-b480-05650691fc68	88c3aaee-16ff-4ae9-807f-503b93158fda	organization	1	{"uri": null, "name": "Downtown Streets Team", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Provides food assistance services.", "content_hash": "a19f76c3f4ca07cfdd75059c64e9264172c00f7286095e2803214270170969ea", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:24.44065+00	reconciler	\N
c27c9461-3456-48be-8465-e21e1b0dd1ef	c508df51-4677-447a-a428-5c9b5532f94a	organization_source	8	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A food bank serving Silicon Valley, providing food assistance to those in need.", "content_hash": "2f8c509c92872ca53a5b206e0db15089b86676fa6d64919b509b7e7adc867f62", "legal_status": null, "organization_id": "324e6d0f-f577-40ff-a350-bf25cde132a8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:25.245727+00	reconciler	c508df51-4677-447a-a428-5c9b5532f94a
b6e75025-8bea-4134-af64-1b784b5e899a	2e18e8e9-aa32-456b-8b2c-13627a798550	organization_source	1	{"uri": null, "name": "Jerusalem Township Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry serving the community.", "content_hash": "734c64a68311eeaa67c6248a7b6070ef030dbd091f6a468d4da137929d5e51d4", "legal_status": null, "organization_id": "981cfa6f-684e-47b0-a9a6-fd1ceb725192", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:26.122008+00	reconciler	2e18e8e9-aa32-456b-8b2c-13627a798550
f87b98f8-2ea4-44f0-82dc-61a05c546fd7	981cfa6f-684e-47b0-a9a6-fd1ceb725192	organization	1	{"uri": null, "name": "Jerusalem Township Food Pantry", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry serving the community.", "content_hash": "734c64a68311eeaa67c6248a7b6070ef030dbd091f6a468d4da137929d5e51d4", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:26.124101+00	reconciler	\N
f274d767-afd4-4d93-b89a-bdd8e62558e6	0cc6c879-fb05-4a8e-b201-cfc277a6cd8c	phone	1	{"type": "voice", "number": "4198361210", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "734c64a68311eeaa67c6248a7b6070ef030dbd091f6a468d4da137929d5e51d4", "organization_id": "981cfa6f-684e-47b0-a9a6-fd1ceb725192", "service_at_location_id": null}	2025-08-08 05:07:26.125506+00	reconciler	\N
b495d368-2f08-4198-a721-6731f8527281	c7cc085d-1d58-4d53-b8fa-5a34fd0091ba	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "0cc6c879-fb05-4a8e-b201-cfc277a6cd8c", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "734c64a68311eeaa67c6248a7b6070ef030dbd091f6a468d4da137929d5e51d4"}	2025-08-08 05:07:26.125506+00	reconciler	\N
f93505e9-c617-40aa-a191-d8413b41019b	cdeca369-f074-4bb9-a150-953b24e4d615	organization_source	1	{"uri": null, "name": "Local Vocal Ministries-New Jerusalem Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Local Vocal Ministries operating through New Jerusalem Church.", "content_hash": "e46e2cc73b8b6bdaccb481aa1481c7dd30dc6844a5e96fd1eef45f7b63a48216", "legal_status": null, "organization_id": "b29c6e1a-2261-49f4-9e63-556461113957", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:26.961558+00	reconciler	cdeca369-f074-4bb9-a150-953b24e4d615
48cca4e9-29fa-41b4-8f82-c813d63b790f	b29c6e1a-2261-49f4-9e63-556461113957	organization	1	{"uri": null, "name": "Local Vocal Ministries-New Jerusalem Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Local Vocal Ministries operating through New Jerusalem Church.", "content_hash": "e46e2cc73b8b6bdaccb481aa1481c7dd30dc6844a5e96fd1eef45f7b63a48216", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:26.963544+00	reconciler	\N
eb87ed45-5f14-4d77-abc7-0dc839ed7630	1f615feb-6126-41f1-b705-d831505124cd	organization_source	1	{"uri": null, "name": "Blessed Sacrament Parish Take and Eat", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Blessed Sacrament Parish Take and Eat provides meals delivered on the 2nd Sunday of each month for homebound seniors, requiring registration.", "content_hash": "150db1d61cba3ef0ef340ff27c188a57e5f43d1a211b932bd035c986d54e13ec", "legal_status": null, "organization_id": "72ca5f23-f431-4766-8456-2889c75f0025", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:27.856363+00	reconciler	1f615feb-6126-41f1-b705-d831505124cd
059cd26f-c47f-4422-9bf7-fd88bc0bc256	72ca5f23-f431-4766-8456-2889c75f0025	organization	1	{"uri": null, "name": "Blessed Sacrament Parish Take and Eat", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Blessed Sacrament Parish Take and Eat provides meals delivered on the 2nd Sunday of each month for homebound seniors, requiring registration.", "content_hash": "150db1d61cba3ef0ef340ff27c188a57e5f43d1a211b932bd035c986d54e13ec", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:27.858285+00	reconciler	\N
c3a7db09-b997-4939-95f8-4b74168e8939	fef5ee0f-4b28-44d8-b47e-2b1b93a82e9b	phone	1	{"type": "voice", "number": "413-532-0713", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "150db1d61cba3ef0ef340ff27c188a57e5f43d1a211b932bd035c986d54e13ec", "organization_id": "72ca5f23-f431-4766-8456-2889c75f0025", "service_at_location_id": null}	2025-08-08 05:07:27.859751+00	reconciler	\N
97feb8bf-7215-4d65-b4df-75f366d0d285	2812cfd5-6105-408d-ad4e-d87b770142ff	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "fef5ee0f-4b28-44d8-b47e-2b1b93a82e9b", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "150db1d61cba3ef0ef340ff27c188a57e5f43d1a211b932bd035c986d54e13ec"}	2025-08-08 05:07:27.859751+00	reconciler	\N
2d164b84-8174-4cb7-83e9-9197d1091389	a0c3623e-491a-420a-bc9a-06b113459f05	organization_source	1	{"uri": null, "name": "Neighbors Helping Neighbors", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Neighbors Helping Neighbors also hosts a mobile pantry.", "content_hash": "02a81c2e8529eeedc3f542a1c9cca3970b5d11d26ee7f7d7e850ba6f10baf15a", "legal_status": null, "organization_id": "941e6706-496f-4a65-843a-a55db8f5d904", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:28.638127+00	reconciler	a0c3623e-491a-420a-bc9a-06b113459f05
9ab4af27-63ce-4831-b894-13b5e18af6df	941e6706-496f-4a65-843a-a55db8f5d904	organization	1	{"uri": null, "name": "Neighbors Helping Neighbors", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Neighbors Helping Neighbors also hosts a mobile pantry.", "content_hash": "02a81c2e8529eeedc3f542a1c9cca3970b5d11d26ee7f7d7e850ba6f10baf15a", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:28.649601+00	reconciler	\N
65d473d8-64f6-42ae-b08b-0b02a88ff709	5e03e64d-bdc2-4f19-93a9-d20ab2a59ac0	phone	1	{"type": "voice", "number": "(413) 437-7593", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "02a81c2e8529eeedc3f542a1c9cca3970b5d11d26ee7f7d7e850ba6f10baf15a", "organization_id": "941e6706-496f-4a65-843a-a55db8f5d904", "service_at_location_id": null}	2025-08-08 05:07:28.650952+00	reconciler	\N
4fbc6505-d492-43ec-8bdc-65dca15b1507	2d407fde-5044-4d11-a9b4-741c4f8b8378	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "5e03e64d-bdc2-4f19-93a9-d20ab2a59ac0", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "02a81c2e8529eeedc3f542a1c9cca3970b5d11d26ee7f7d7e850ba6f10baf15a"}	2025-08-08 05:07:28.650952+00	reconciler	\N
80945459-3b1a-4c28-896a-c9e35dbf02ab	ec60310d-c4be-488c-ba13-aadd3cab9bd9	organization_source	1	{"uri": null, "name": "Lutheran Social Services - Feed Your Neighbor", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry service provided by Lutheran Social Services, likely affiliated with the Toledo Northwestern Ohio Food Bank.", "content_hash": "b6d565098b74a0280f1f251355a6c894399df0909dcff224c3001dcc00dd6981", "legal_status": null, "organization_id": "a6a067ba-228b-4285-bdd3-50a67710830b", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:31.260055+00	reconciler	ec60310d-c4be-488c-ba13-aadd3cab9bd9
5fd03c1e-311d-42fa-b707-f50d062eeac1	a6a067ba-228b-4285-bdd3-50a67710830b	organization	1	{"uri": null, "name": "Lutheran Social Services - Feed Your Neighbor", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry service provided by Lutheran Social Services, likely affiliated with the Toledo Northwestern Ohio Food Bank.", "content_hash": "b6d565098b74a0280f1f251355a6c894399df0909dcff224c3001dcc00dd6981", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:31.262126+00	reconciler	\N
38f15b74-a844-4837-9ce2-f7d24e3de01e	fa6ab299-b11c-4335-924b-68a83b5aea46	organization_source	1	{"uri": null, "name": "Manna Food Pantry @ Memorial U.C.C.", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry operated by Memorial United Church of Christ.", "content_hash": "09db3729c975fc96c0f1b6a3283455a18e0417f8a5833fbdd5a1ff9dc84c0b90", "legal_status": null, "organization_id": "5102e8be-64bb-474f-a5fd-107512c3056b", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:32.16628+00	reconciler	fa6ab299-b11c-4335-924b-68a83b5aea46
c782a1fc-40d6-4744-8077-e1309d2c0838	5102e8be-64bb-474f-a5fd-107512c3056b	organization	1	{"uri": null, "name": "Manna Food Pantry @ Memorial U.C.C.", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry operated by Memorial United Church of Christ.", "content_hash": "09db3729c975fc96c0f1b6a3283455a18e0417f8a5833fbdd5a1ff9dc84c0b90", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:32.167982+00	reconciler	\N
2d098cb2-3536-4a1b-9532-8b93958e6a08	5a76fb38-ca35-4dc3-aae0-70110a93d7d6	organization_source	1	{"uri": null, "name": "Lafayette RNC", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "Lafayette RNC is a food pantry located in San Francisco, CA.", "content_hash": "2f583f51700769fbef03469c2ebeb762e54c43c98ab37d3843e992836307f18d", "legal_status": null, "organization_id": "9da8a691-db62-4e7b-89a8-52cbadaa5490", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:33.123013+00	reconciler	5a76fb38-ca35-4dc3-aae0-70110a93d7d6
def292de-3551-4544-b102-0e403218f8be	9da8a691-db62-4e7b-89a8-52cbadaa5490	organization	1	{"uri": null, "name": "Lafayette RNC", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "Lafayette RNC is a food pantry located in San Francisco, CA.", "content_hash": "2f583f51700769fbef03469c2ebeb762e54c43c98ab37d3843e992836307f18d", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:33.129569+00	reconciler	\N
d4e7a992-3e2f-4adb-bc8e-a94047f7a3fb	3a837146-acbf-4e7e-8f78-042c42c35e45	organization_source	1	{"uri": null, "name": "Pa’lante Transformative Justice Gabinete", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pa’lante Transformative Justice Gabinete provides food pantry services.", "content_hash": "927c36073023f8bf13c9aa062391ed84c5f89cfb9db99116b9e2ff05e31f1998", "legal_status": null, "organization_id": "5931b34f-fd9d-4ed5-880b-190b8118a48c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:34.052283+00	reconciler	3a837146-acbf-4e7e-8f78-042c42c35e45
e5a3732d-c876-45f1-b846-21586fcd7ceb	5931b34f-fd9d-4ed5-880b-190b8118a48c	organization	1	{"uri": null, "name": "Pa’lante Transformative Justice Gabinete", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pa’lante Transformative Justice Gabinete provides food pantry services.", "content_hash": "927c36073023f8bf13c9aa062391ed84c5f89cfb9db99116b9e2ff05e31f1998", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:34.05404+00	reconciler	\N
a23f4e43-46cd-4ef3-89f1-f3119e2a1507	d6941d66-9e1e-4e8e-bbc0-33b97727e137	phone	1	{"type": "voice", "number": "413-200-0624", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "927c36073023f8bf13c9aa062391ed84c5f89cfb9db99116b9e2ff05e31f1998", "organization_id": "5931b34f-fd9d-4ed5-880b-190b8118a48c", "service_at_location_id": null}	2025-08-08 05:07:34.055294+00	reconciler	\N
8b902219-ed6b-4fce-b8e7-2bf552b86510	ed2c4e74-a3c0-4818-bf2c-de0608db50e7	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "d6941d66-9e1e-4e8e-bbc0-33b97727e137", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "927c36073023f8bf13c9aa062391ed84c5f89cfb9db99116b9e2ff05e31f1998"}	2025-08-08 05:07:34.055294+00	reconciler	\N
d9145747-c794-4a80-aece-8bf38174234d	956b83d5-db50-4c6f-9f8a-7ee8784e7310	organization_source	1	{"uri": null, "name": "Islamic Food Bank", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food bank providing services to the community.", "content_hash": "b15be151d0ea96b052c3bad019fe25a586adb58ad432f05db8e6902b9389c6f5", "legal_status": null, "organization_id": "8e9debc1-6c04-4660-8f56-6c7a5cd0b4cb", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:34.915899+00	reconciler	956b83d5-db50-4c6f-9f8a-7ee8784e7310
f8fc19e5-c463-4ef4-b78b-2a343a912bce	8e9debc1-6c04-4660-8f56-6c7a5cd0b4cb	organization	1	{"uri": null, "name": "Islamic Food Bank", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food bank providing services to the community.", "content_hash": "b15be151d0ea96b052c3bad019fe25a586adb58ad432f05db8e6902b9389c6f5", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:34.917877+00	reconciler	\N
c723a282-4b7c-43e6-8909-8346285a7aa0	f9f900ab-4f20-463c-97ac-4931736f0a44	phone	1	{"type": "voice", "number": "419-349-0457", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "b15be151d0ea96b052c3bad019fe25a586adb58ad432f05db8e6902b9389c6f5", "organization_id": "8e9debc1-6c04-4660-8f56-6c7a5cd0b4cb", "service_at_location_id": null}	2025-08-08 05:07:34.919253+00	reconciler	\N
ee9efa08-5c4a-49a3-a434-6d3ceda35a04	3441a01e-0f03-4b08-9b6a-cc2d6a9680ac	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "f9f900ab-4f20-463c-97ac-4931736f0a44", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "b15be151d0ea96b052c3bad019fe25a586adb58ad432f05db8e6902b9389c6f5"}	2025-08-08 05:07:34.919253+00	reconciler	\N
3b9bebb9-1e62-44c7-9b11-09f6814794ab	036babb3-599c-4d47-b6d0-7ea6b865d7c5	organization_source	1	{"uri": null, "name": "West Springfield Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry service located in West Springfield, MA.", "content_hash": "cf106f60d6a19f1139f1b23b122630675a843ced524e5567d98fcb447babbed4", "legal_status": null, "organization_id": "d0ab44e8-5ed0-482f-b0bd-8a37c1acc8c4", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:35.734931+00	reconciler	036babb3-599c-4d47-b6d0-7ea6b865d7c5
9d5ed2bb-55ba-4b97-b3f2-9c7d3f85d3be	d0ab44e8-5ed0-482f-b0bd-8a37c1acc8c4	organization	1	{"uri": null, "name": "West Springfield Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A food pantry service located in West Springfield, MA.", "content_hash": "cf106f60d6a19f1139f1b23b122630675a843ced524e5567d98fcb447babbed4", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:35.736777+00	reconciler	\N
b44e00f6-3fa6-40fe-b8e6-7164278d3389	a3ab0e73-c5a8-4301-a320-81a55d4f25cd	organization_source	1	{"uri": null, "name": "Lifeline Connect Baptist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Lifeline Connect Baptist Church offers a food pantry service.", "content_hash": "5336b0a8f482f17a548abaffe656a0b86c3f52fa446daaff340804c2731de0fc", "legal_status": null, "organization_id": "51bcaca4-1775-4cdb-af1b-da300249db32", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:36.571839+00	reconciler	a3ab0e73-c5a8-4301-a320-81a55d4f25cd
22999724-8c07-4a81-8b73-d21bba5fd5c6	51bcaca4-1775-4cdb-af1b-da300249db32	organization	1	{"uri": null, "name": "Lifeline Connect Baptist Church", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Lifeline Connect Baptist Church offers a food pantry service.", "content_hash": "5336b0a8f482f17a548abaffe656a0b86c3f52fa446daaff340804c2731de0fc", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:36.573462+00	reconciler	\N
b074e34f-36f1-42a2-b956-e18417117eb5	84cc6ee7-93b9-4e99-abcf-306972b19c60	phone	1	{"type": "voice", "number": "2604932994", "source": "toledo_northwestern_ohio_food_bank_oh", "extension": null, "contact_id": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "description": null, "location_id": null, "content_hash": "5336b0a8f482f17a548abaffe656a0b86c3f52fa446daaff340804c2731de0fc", "organization_id": "51bcaca4-1775-4cdb-af1b-da300249db32", "service_at_location_id": null}	2025-08-08 05:07:36.574701+00	reconciler	\N
ed23756c-221b-44d6-8cf7-8ed0a1b662d8	c3881fd0-fb7f-4544-bb6d-d753d39c5321	language	1	{"code": "", "name": "English", "note": null, "source": "toledo_northwestern_ohio_food_bank_oh", "phone_id": "84cc6ee7-93b9-4e99-abcf-306972b19c60", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "service_id": null, "location_id": null, "content_hash": "5336b0a8f482f17a548abaffe656a0b86c3f52fa446daaff340804c2731de0fc"}	2025-08-08 05:07:36.574701+00	reconciler	\N
64032c9f-847b-455f-aadf-e5e56fb00083	43ef84a3-342d-4dcc-8e7c-06db543fb181	organization_source	1	{"uri": null, "name": "One Call Away Ludlow Veterans Services", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Veterans services organization offering a food pantry.", "content_hash": "7aa67a52a13cefd53b0807ca5289cd98387876409a4ed6c08954cbace33cc119", "legal_status": null, "organization_id": "02f3af46-4d59-4e34-a610-e3e3f1a2b6f0", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:38.336926+00	reconciler	43ef84a3-342d-4dcc-8e7c-06db543fb181
ee61904a-2a7b-486a-a68f-8be94bb3f494	02f3af46-4d59-4e34-a610-e3e3f1a2b6f0	organization	1	{"uri": null, "name": "One Call Away Ludlow Veterans Services", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Veterans services organization offering a food pantry.", "content_hash": "7aa67a52a13cefd53b0807ca5289cd98387876409a4ed6c08954cbace33cc119", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:38.338942+00	reconciler	\N
b152c822-ffb0-499e-b6e8-866d4eaf13a9	b92dd3f8-d432-4043-959b-8c1ea9457b13	phone	1	{"type": "voice", "number": "413-707-5050", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "7aa67a52a13cefd53b0807ca5289cd98387876409a4ed6c08954cbace33cc119", "organization_id": "02f3af46-4d59-4e34-a610-e3e3f1a2b6f0", "service_at_location_id": null}	2025-08-08 05:07:38.340513+00	reconciler	\N
5ae054e7-ca43-4830-ba83-cafaaff9d6d1	002dc2e7-e6a3-4dd7-b447-638cdeb1a831	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "b92dd3f8-d432-4043-959b-8c1ea9457b13", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "7aa67a52a13cefd53b0807ca5289cd98387876409a4ed6c08954cbace33cc119"}	2025-08-08 05:07:38.340513+00	reconciler	\N
4bc5d845-6585-4008-9ed3-c40a6bc75ac6	f8225927-dd44-4995-951f-834cb9c8db87	organization_source	1	{"uri": null, "name": "Gethsemane Church of Jesus Christ Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Food pantry distributing pre-packed bags.", "content_hash": "41fc2ef4e28ff02ce0650c744567453b7fab8bd4c318c5e880ad305729678717", "legal_status": null, "organization_id": "69420494-8c08-481a-832c-7b1919d46185", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:39.141481+00	reconciler	f8225927-dd44-4995-951f-834cb9c8db87
e40644ce-5c14-4bb5-a617-908602951850	69420494-8c08-481a-832c-7b1919d46185	organization	1	{"uri": null, "name": "Gethsemane Church of Jesus Christ Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Food pantry distributing pre-packed bags.", "content_hash": "41fc2ef4e28ff02ce0650c744567453b7fab8bd4c318c5e880ad305729678717", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:39.143239+00	reconciler	\N
bbbfe986-751e-498a-b5b0-73f14ebd47df	1dad05f5-1fe8-4da4-9207-f9993208dc0d	organization_source	1	{"uri": null, "name": "St. Andrew MB Church", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "St. Andrew MB Church offers a food pantry service.", "content_hash": "ea8eb4f6ee66eb81bbad675ebdc4daee477b99081cd875aa908c3907e6862599", "legal_status": null, "organization_id": "5b6111bc-65ea-49f7-b2ba-9580a57a944c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:39.985962+00	reconciler	1dad05f5-1fe8-4da4-9207-f9993208dc0d
85babeb9-b499-4d5a-a482-748f45ab558c	5b6111bc-65ea-49f7-b2ba-9580a57a944c	organization	1	{"uri": null, "name": "St. Andrew MB Church", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "St. Andrew MB Church offers a food pantry service.", "content_hash": "ea8eb4f6ee66eb81bbad675ebdc4daee477b99081cd875aa908c3907e6862599", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:39.987591+00	reconciler	\N
51091d13-6778-4758-9a46-06d69c26686c	7bf95395-f35f-4e06-964b-b1da693baf0f	organization_source	1	{"uri": null, "name": "Allied Churches of Alamance County", "email": null, "source": "second_harvest_food_bank_of_northwest_north_carolina_nc", "tax_id": null, "website": null, "scraper_id": "second_harvest_food_bank_of_northwest_north_carolina_nc", "tax_status": null, "description": "A community organization providing services in Alamance County.", "content_hash": "117973b7201e956fb5f852ae46d7458b848638de14e3e4c92081efffae3bdfda", "legal_status": null, "organization_id": "014f29cf-f8d4-4c52-a1af-6d8de391effb", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:40.880072+00	reconciler	7bf95395-f35f-4e06-964b-b1da693baf0f
f294f7fa-d2ff-4fec-9533-1f429c3b0283	014f29cf-f8d4-4c52-a1af-6d8de391effb	organization	1	{"uri": null, "name": "Allied Churches of Alamance County", "email": null, "source": "second_harvest_food_bank_of_northwest_north_carolina_nc", "tax_id": null, "website": null, "scraper_id": "second_harvest_food_bank_of_northwest_north_carolina_nc", "tax_status": null, "description": "A community organization providing services in Alamance County.", "content_hash": "117973b7201e956fb5f852ae46d7458b848638de14e3e4c92081efffae3bdfda", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:40.881738+00	reconciler	\N
327aa0fd-d113-4439-b788-ca3a662062ed	71fb205b-f044-4c38-a808-1ffc9325eb9a	phone	1	{"type": "voice", "number": "336-229-0881", "source": "second_harvest_food_bank_of_northwest_north_carolina_nc", "extension": null, "contact_id": null, "scraper_id": "second_harvest_food_bank_of_northwest_north_carolina_nc", "service_id": null, "description": null, "location_id": null, "content_hash": "117973b7201e956fb5f852ae46d7458b848638de14e3e4c92081efffae3bdfda", "organization_id": "014f29cf-f8d4-4c52-a1af-6d8de391effb", "service_at_location_id": null}	2025-08-08 05:07:40.883001+00	reconciler	\N
ff735ec0-a075-4561-9300-352e21f56649	dadfea44-de97-4716-acf1-ef909fa85c2b	language	1	{"code": "", "name": "English", "note": null, "source": "second_harvest_food_bank_of_northwest_north_carolina_nc", "phone_id": "71fb205b-f044-4c38-a808-1ffc9325eb9a", "scraper_id": "second_harvest_food_bank_of_northwest_north_carolina_nc", "service_id": null, "location_id": null, "content_hash": "117973b7201e956fb5f852ae46d7458b848638de14e3e4c92081efffae3bdfda"}	2025-08-08 05:07:40.883001+00	reconciler	\N
ce5a7d99-5489-4d92-939e-27567d55ca95	2c96c121-0583-4fad-9ac1-c32ab1171bb5	organization_source	1	{"uri": null, "name": "Haight Ashbury Food Prog. NGN", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": "https://foodlocator.sfmfoodbank.org/en/site/HAFP", "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "Haight Ashbury Food Program NGN provides food pantry services.", "content_hash": "ac9004311b59911317db009b4f6c7e2f5039231bda4a1ba6c9acde0f3d5f8c29", "legal_status": null, "organization_id": "5854ff62-b249-4993-a8b8-cc8448d1d1b7", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:41.713065+00	reconciler	2c96c121-0583-4fad-9ac1-c32ab1171bb5
60536c43-6566-4302-b771-e804f2d6428f	5854ff62-b249-4993-a8b8-cc8448d1d1b7	organization	1	{"uri": null, "name": "Haight Ashbury Food Prog. NGN", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": "https://foodlocator.sfmfoodbank.org/en/site/HAFP", "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "Haight Ashbury Food Program NGN provides food pantry services.", "content_hash": "ac9004311b59911317db009b4f6c7e2f5039231bda4a1ba6c9acde0f3d5f8c29", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:41.715022+00	reconciler	\N
5e552d5b-660b-49a7-8414-bf228d37778b	88d04214-2dab-4d01-998b-53c93cadb7d9	phone	1	{"type": "voice", "number": "415-374-3843", "source": "sfmarin_food_bank_ca", "extension": null, "contact_id": null, "scraper_id": "sfmarin_food_bank_ca", "service_id": null, "description": null, "location_id": null, "content_hash": "ac9004311b59911317db009b4f6c7e2f5039231bda4a1ba6c9acde0f3d5f8c29", "organization_id": "5854ff62-b249-4993-a8b8-cc8448d1d1b7", "service_at_location_id": null}	2025-08-08 05:07:41.716381+00	reconciler	\N
96f1509d-245d-41c8-96c0-f8ba5c517b5b	5af06f23-f7bd-4323-9775-8d81b580b30d	language	1	{"code": "", "name": "English", "note": null, "source": "sfmarin_food_bank_ca", "phone_id": "88d04214-2dab-4d01-998b-53c93cadb7d9", "scraper_id": "sfmarin_food_bank_ca", "service_id": null, "location_id": null, "content_hash": "ac9004311b59911317db009b4f6c7e2f5039231bda4a1ba6c9acde0f3d5f8c29"}	2025-08-08 05:07:41.716381+00	reconciler	\N
885054af-1552-4b5a-9499-b88594e680ef	31d0357b-fd3b-419e-80d4-7d746c3c05d6	organization_source	1	{"uri": null, "name": "Covenant Presbyterian Church", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "Covenant Presbyterian Church is a food pantry located in San Francisco, CA.", "content_hash": "4dd8a411726c863cab3cea6a88ef411e69cbd8a867576dcaca2f83176bbcde09", "legal_status": null, "organization_id": "627027e0-7c93-42bc-b1db-2012946e4315", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:43.47184+00	reconciler	31d0357b-fd3b-419e-80d4-7d746c3c05d6
4a76f975-0971-4d9f-b3da-cf4c96704c23	627027e0-7c93-42bc-b1db-2012946e4315	organization	1	{"uri": null, "name": "Covenant Presbyterian Church", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "Covenant Presbyterian Church is a food pantry located in San Francisco, CA.", "content_hash": "4dd8a411726c863cab3cea6a88ef411e69cbd8a867576dcaca2f83176bbcde09", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:43.473533+00	reconciler	\N
9713c4b0-5458-4b56-80c0-1559bc49cc25	4ab809e5-e00f-44b5-bf81-21603c905b8b	organization_source	1	{"uri": null, "name": "Metamora U.M.C", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A United Methodist Church providing food pantry services in Metamora, Ohio.", "content_hash": "5589614626a062ee38a45e103cdf632b1bc01598f600314e701751d7b8997d58", "legal_status": null, "organization_id": "791ede16-ec3c-410b-a72e-92c54eb09ad7", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:44.342923+00	reconciler	4ab809e5-e00f-44b5-bf81-21603c905b8b
cbb695ce-be3f-4be4-9a2d-7fb292672b68	791ede16-ec3c-410b-a72e-92c54eb09ad7	organization	1	{"uri": null, "name": "Metamora U.M.C", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A United Methodist Church providing food pantry services in Metamora, Ohio.", "content_hash": "5589614626a062ee38a45e103cdf632b1bc01598f600314e701751d7b8997d58", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:44.344844+00	reconciler	\N
1d884972-9630-4000-8980-c77fc934eceb	91e48df5-6684-47ba-8f5c-43f0e28ff91c	organization_source	1	{"uri": null, "name": "Springfield Jordan Senior Center", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A senior center in Springfield, MA offering various services.", "content_hash": "ab7984c01eba0782a2022097a2ac4479abc02635257b93e8e1271ca7d74d8c42", "legal_status": null, "organization_id": "d6c17baf-e620-4e0a-a5fe-c6f78362aece", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:45.184402+00	reconciler	91e48df5-6684-47ba-8f5c-43f0e28ff91c
60bd3b45-f34c-490b-8c63-ae934bc336e6	d6c17baf-e620-4e0a-a5fe-c6f78362aece	organization	1	{"uri": null, "name": "Springfield Jordan Senior Center", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "A senior center in Springfield, MA offering various services.", "content_hash": "ab7984c01eba0782a2022097a2ac4479abc02635257b93e8e1271ca7d74d8c42", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:45.186032+00	reconciler	\N
a483e7c0-104d-412e-9012-e0d66065f23b	a2aee57f-4e2d-4982-8f75-6ff2dd819c82	organization_source	1	{"uri": null, "name": "Alexandria Food Pantry", "email": "Maria.Rodriguez@ccda.net", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A food pantry providing services in Alexandria, VA.", "content_hash": "662231d85f35f4b8524470163a0a7047fde3d26166d8a95000968e8c57724a58", "legal_status": null, "organization_id": "34f6be97-b55f-426f-8d01-cd9cace08fd7", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:46.021115+00	reconciler	a2aee57f-4e2d-4982-8f75-6ff2dd819c82
96037605-aa9d-4ea2-bd85-d33eff2366a9	34f6be97-b55f-426f-8d01-cd9cace08fd7	organization	1	{"uri": null, "name": "Alexandria Food Pantry", "email": "Maria.Rodriguez@ccda.net", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A food pantry providing services in Alexandria, VA.", "content_hash": "662231d85f35f4b8524470163a0a7047fde3d26166d8a95000968e8c57724a58", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:46.022784+00	reconciler	\N
f835891a-f55b-4c63-a1ca-2e153a63881d	14ab03f4-9119-4e64-980f-052f0a484ce3	organization_source	1	{"uri": null, "name": "Monroe Street Neighborhood Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": "https://monroesnc.com/", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Monroe Street Neighborhood Center is a community center providing food pantry services.", "content_hash": "ad6f394ad244c05c98df2b13abd35ca17bc170cd6c4fd19fa14b7c74a0f5c20b", "legal_status": null, "organization_id": "cc198679-8195-4f48-b9a7-0b1612da113f", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:46.852302+00	reconciler	14ab03f4-9119-4e64-980f-052f0a484ce3
a0d821d3-ac86-4f57-89e7-ffdc0c71021f	95f3abb4-4048-4bdf-aef2-6a1d794ab0f3	language	1	{"code": "", "name": "English", "note": null, "source": "capital_area_food_bank_dc", "phone_id": "b22c082c-09e7-44a4-b5d1-9a7cc36f0b80", "scraper_id": "capital_area_food_bank_dc", "service_id": null, "location_id": null, "content_hash": "e1699bcd42ea8c660f7ff6571d27ecbdf637462a77fd540c01a3e8bfa2ab8e8c"}	2025-08-08 05:07:51.135438+00	reconciler	\N
0e18c600-1333-46cd-8ef9-33d40f813dae	cc198679-8195-4f48-b9a7-0b1612da113f	organization	1	{"uri": null, "name": "Monroe Street Neighborhood Center", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": "https://monroesnc.com/", "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "Monroe Street Neighborhood Center is a community center providing food pantry services.", "content_hash": "ad6f394ad244c05c98df2b13abd35ca17bc170cd6c4fd19fa14b7c74a0f5c20b", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:46.854064+00	reconciler	\N
932a12b5-8bba-4a4f-aede-57ee52397a1e	9816163e-3c3b-4d2c-8156-9b6fdfb75bdf	organization_source	1	{"uri": null, "name": "ADAMS CENTER", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "ADAMS CENTER is a food pantry.", "content_hash": "75c62c8577124430260a4322833f73ef8d23a0fc75ceac51f79ab623f2193b9e", "legal_status": null, "organization_id": "95ff2e43-5295-43aa-a661-d225bec2e494", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:47.661925+00	reconciler	9816163e-3c3b-4d2c-8156-9b6fdfb75bdf
ec0e7079-16cb-4be9-a8a1-08cf1f6869a4	95ff2e43-5295-43aa-a661-d225bec2e494	organization	1	{"uri": null, "name": "ADAMS CENTER", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "ADAMS CENTER is a food pantry.", "content_hash": "75c62c8577124430260a4322833f73ef8d23a0fc75ceac51f79ab623f2193b9e", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:47.663742+00	reconciler	\N
ebfaa8e2-98ba-4ea1-b1ec-a0196dbdc9e2	c30f1720-5583-4375-88ad-85dd7d5f0fe5	organization_source	1	{"uri": null, "name": "Alafia Baptist Church", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Alafia Baptist Church, a food pantry serving the Mount Rainier area.", "content_hash": "3c0cdcc3b00b7d228b4943d5879c0b57c558eaa4c0b29265baa17c88c7d72635", "legal_status": null, "organization_id": "ee3e42d6-1c14-4446-b7b6-cef7f1187875", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:48.507968+00	reconciler	c30f1720-5583-4375-88ad-85dd7d5f0fe5
86e6e339-6dc0-4d0a-903e-b558088e20b4	ee3e42d6-1c14-4446-b7b6-cef7f1187875	organization	1	{"uri": null, "name": "Alafia Baptist Church", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Alafia Baptist Church, a food pantry serving the Mount Rainier area.", "content_hash": "3c0cdcc3b00b7d228b4943d5879c0b57c558eaa4c0b29265baa17c88c7d72635", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:48.510213+00	reconciler	\N
fa171de7-c5f5-4a25-86df-24f3de22f3bc	dbca1166-be1d-4507-ab6f-0d86a76b8c4c	phone	1	{"type": "voice", "number": "301-985-3090", "source": "capital_area_food_bank_dc", "extension": null, "contact_id": null, "scraper_id": "capital_area_food_bank_dc", "service_id": null, "description": null, "location_id": null, "content_hash": "3c0cdcc3b00b7d228b4943d5879c0b57c558eaa4c0b29265baa17c88c7d72635", "organization_id": "ee3e42d6-1c14-4446-b7b6-cef7f1187875", "service_at_location_id": null}	2025-08-08 05:07:48.511522+00	reconciler	\N
7fa4ed67-8ec6-4038-9fe2-7435abc3f7b4	8793f06a-b372-4b26-aa7d-4ddfcedaf4f1	language	1	{"code": "", "name": "English", "note": null, "source": "capital_area_food_bank_dc", "phone_id": "dbca1166-be1d-4507-ab6f-0d86a76b8c4c", "scraper_id": "capital_area_food_bank_dc", "service_id": null, "location_id": null, "content_hash": "3c0cdcc3b00b7d228b4943d5879c0b57c558eaa4c0b29265baa17c88c7d72635"}	2025-08-08 05:07:48.511522+00	reconciler	\N
57bffcc1-0942-43b8-8fa3-8210dabdb142	340bc24c-4552-4198-b5d4-bd8f32b5db0e	organization_source	1	{"uri": null, "name": "Moms Mobile Mission", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry organization.", "content_hash": "52f65cf3f593566ec7074f481c4a9253b35a6e39d3941c34e103b912744b96e3", "legal_status": null, "organization_id": "1b5c1e5e-5181-4def-a9d9-8687552da058", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:49.358719+00	reconciler	340bc24c-4552-4198-b5d4-bd8f32b5db0e
589cfb15-8e1c-433f-9846-24b235a28de5	1b5c1e5e-5181-4def-a9d9-8687552da058	organization	1	{"uri": null, "name": "Moms Mobile Mission", "email": null, "source": "toledo_northwestern_ohio_food_bank_oh", "tax_id": null, "website": null, "scraper_id": "toledo_northwestern_ohio_food_bank_oh", "tax_status": null, "description": "A food pantry organization.", "content_hash": "52f65cf3f593566ec7074f481c4a9253b35a6e39d3941c34e103b912744b96e3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:49.360539+00	reconciler	\N
9bb3248d-5f20-4b9a-86bb-152ee5bd2809	c496b77e-5e8b-4cff-8a9e-cae5e1fd8ce3	organization_source	1	{"uri": null, "name": "ALIVE", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "ALIVE is a food pantry.", "content_hash": "a57f1fe4b17c1927a5cc56fc3d91bcbdc8b4ae4b07d9ad2cc004d036574aaa12", "legal_status": null, "organization_id": "e279fe36-05b0-4fed-a5ca-9d49dc27b2b1", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:50.241892+00	reconciler	c496b77e-5e8b-4cff-8a9e-cae5e1fd8ce3
315d1050-80cc-4706-8b06-c0fc68606777	e279fe36-05b0-4fed-a5ca-9d49dc27b2b1	organization	1	{"uri": null, "name": "ALIVE", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "ALIVE is a food pantry.", "content_hash": "a57f1fe4b17c1927a5cc56fc3d91bcbdc8b4ae4b07d9ad2cc004d036574aaa12", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:50.243751+00	reconciler	\N
2d961efd-d4a7-48f9-a226-e216328dec01	bdd72607-b74e-45da-aa6c-0010c0da49f7	organization_source	1	{"uri": null, "name": "Adventist Community Services of Greater Washington", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Adventist Community Services of Greater Washington provides food assistance.", "content_hash": "e1699bcd42ea8c660f7ff6571d27ecbdf637462a77fd540c01a3e8bfa2ab8e8c", "legal_status": null, "organization_id": "c5d20dd6-7ca5-4e74-8e75-9285cbbe0043", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:51.132272+00	reconciler	bdd72607-b74e-45da-aa6c-0010c0da49f7
667ace2a-789a-43a7-9867-2756ba5a120e	c5d20dd6-7ca5-4e74-8e75-9285cbbe0043	organization	1	{"uri": null, "name": "Adventist Community Services of Greater Washington", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Adventist Community Services of Greater Washington provides food assistance.", "content_hash": "e1699bcd42ea8c660f7ff6571d27ecbdf637462a77fd540c01a3e8bfa2ab8e8c", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:51.134038+00	reconciler	\N
5fc0daa8-57b2-4bcf-a643-6ee0c4b461ba	b22c082c-09e7-44a4-b5d1-9a7cc36f0b80	phone	1	{"type": "voice", "number": "2407235650", "source": "capital_area_food_bank_dc", "extension": null, "contact_id": null, "scraper_id": "capital_area_food_bank_dc", "service_id": null, "description": null, "location_id": null, "content_hash": "e1699bcd42ea8c660f7ff6571d27ecbdf637462a77fd540c01a3e8bfa2ab8e8c", "organization_id": "c5d20dd6-7ca5-4e74-8e75-9285cbbe0043", "service_at_location_id": null}	2025-08-08 05:07:51.135438+00	reconciler	\N
50fd7992-c4e1-4ce1-b2d4-a11b8cf54c51	5556bd40-11b0-45c0-8b60-39815e3b03bd	organization_source	1	{"uri": null, "name": "International Christian Center Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Food pantry services offered by International Christian Center.", "content_hash": "a71de9edaf1a0f07c26b62f6c5bcb4345a8052f9963765f28017e028767156c1", "legal_status": null, "organization_id": "4707190c-6a69-4521-a8c2-b3823eb021d6", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:52.793099+00	reconciler	5556bd40-11b0-45c0-8b60-39815e3b03bd
4517a46e-2f6e-442c-8df1-64d35002b952	4707190c-6a69-4521-a8c2-b3823eb021d6	organization	1	{"uri": null, "name": "International Christian Center Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Food pantry services offered by International Christian Center.", "content_hash": "a71de9edaf1a0f07c26b62f6c5bcb4345a8052f9963765f28017e028767156c1", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:52.795039+00	reconciler	\N
a1207f7c-7411-4403-9d69-a5072a9b6157	a9e034b2-ef86-4ba4-babe-33cee88266ac	phone	1	{"type": "voice", "number": "(413) 246-0797", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "a71de9edaf1a0f07c26b62f6c5bcb4345a8052f9963765f28017e028767156c1", "organization_id": "4707190c-6a69-4521-a8c2-b3823eb021d6", "service_at_location_id": null}	2025-08-08 05:07:52.797076+00	reconciler	\N
f38d88ad-ee52-4cca-86f4-26f9e15f871a	eac31304-d341-4891-9451-6d81e16b9fcc	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "a9e034b2-ef86-4ba4-babe-33cee88266ac", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "a71de9edaf1a0f07c26b62f6c5bcb4345a8052f9963765f28017e028767156c1"}	2025-08-08 05:07:52.797076+00	reconciler	\N
ee5d83f7-e223-42a2-82e4-de4ffc9bc336	c627e3b2-129a-48ab-817a-df845f82c630	organization_source	1	{"uri": null, "name": "Albany Community Action Partnership", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Albany Community Action Partnership (ACAP) operates a food pantry.", "content_hash": "88f8a936ddfa4a783cc4a38ca244bf0b3b09f6268016ec7ec92101295f321618", "legal_status": null, "organization_id": "c4e22307-9044-46db-957f-fc491611f0ba", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:53.695633+00	reconciler	c627e3b2-129a-48ab-817a-df845f82c630
d380749d-61a4-4307-b2b3-6b1588d5d74c	c4e22307-9044-46db-957f-fc491611f0ba	organization	1	{"uri": null, "name": "Albany Community Action Partnership", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Albany Community Action Partnership (ACAP) operates a food pantry.", "content_hash": "88f8a936ddfa4a783cc4a38ca244bf0b3b09f6268016ec7ec92101295f321618", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:53.69727+00	reconciler	\N
b895c77b-97c0-41bd-9dbe-f2a051613002	87df84e4-3311-40a7-bcb0-a6b733fe185d	organization_source	1	{"uri": null, "name": "St. Patrick", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "St. Patrick's is a faith-based organization that operates a food pantry.", "content_hash": "2afc2804f6151ec4a7bb01813231c8548e2f191b972f03b8829213e35089708c", "legal_status": null, "organization_id": "0bc1e4ed-1e38-4642-80fc-9761ed6d2fd4", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:54.525109+00	reconciler	87df84e4-3311-40a7-bcb0-a6b733fe185d
3addd528-cce6-4a0d-90b0-83298cf55516	0bc1e4ed-1e38-4642-80fc-9761ed6d2fd4	organization	1	{"uri": null, "name": "St. Patrick", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "St. Patrick's is a faith-based organization that operates a food pantry.", "content_hash": "2afc2804f6151ec4a7bb01813231c8548e2f191b972f03b8829213e35089708c", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:54.52696+00	reconciler	\N
d21ec7ba-08aa-433b-9182-0f93a904d86b	4bc99e7d-b90d-4892-abe2-d5337fc8f752	phone	1	{"type": "voice", "number": "+1-518-756-3145", "source": "the_food_pantries_org", "extension": null, "contact_id": null, "scraper_id": "the_food_pantries_org", "service_id": null, "description": null, "location_id": null, "content_hash": "2afc2804f6151ec4a7bb01813231c8548e2f191b972f03b8829213e35089708c", "organization_id": "0bc1e4ed-1e38-4642-80fc-9761ed6d2fd4", "service_at_location_id": null}	2025-08-08 05:07:54.528211+00	reconciler	\N
849c517f-c383-4bf6-a765-b3734d79c2fc	fc8a6b43-0efc-47f5-b717-09073df6fe8b	language	1	{"code": "", "name": "English", "note": null, "source": "the_food_pantries_org", "phone_id": "4bc99e7d-b90d-4892-abe2-d5337fc8f752", "scraper_id": "the_food_pantries_org", "service_id": null, "location_id": null, "content_hash": "2afc2804f6151ec4a7bb01813231c8548e2f191b972f03b8829213e35089708c"}	2025-08-08 05:07:54.528211+00	reconciler	\N
194bd418-2974-4dc9-8b99-2de26c58b4a4	fbe74301-e20f-4b22-a002-241a8eee6196	organization_source	1	{"uri": null, "name": "Goodwill of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Goodwill of Silicon Valley provides food assistance services.", "content_hash": "b7b12c0422fdbb917319c94c9b08bd901e52550e967c22e059a72ed139d82133", "legal_status": null, "organization_id": "b5c13cfa-4402-4393-87d9-eb7a5a154709", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:55.384001+00	reconciler	fbe74301-e20f-4b22-a002-241a8eee6196
ead5ca11-0095-4028-af8d-ac2e53fcc5d1	b5c13cfa-4402-4393-87d9-eb7a5a154709	organization	1	{"uri": null, "name": "Goodwill of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Goodwill of Silicon Valley provides food assistance services.", "content_hash": "b7b12c0422fdbb917319c94c9b08bd901e52550e967c22e059a72ed139d82133", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:55.386465+00	reconciler	\N
6f57a62c-4d5c-4f09-9d9d-b36894e73fe6	38308a49-de35-4dac-aa20-d1c965fe31ae	organization_source	1	{"uri": null, "name": "Alexander Memorial Baptist Church", "email": "zshields10@icloud.com", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Alexander Memorial Baptist Church offers food pantry services, including TEFAP.", "content_hash": "7ee42862a11ee9701916816ef5b9e8ad14db0f4e61d193fd846a3dc761886e20", "legal_status": null, "organization_id": "7be01475-51a5-438d-8f75-c0ee2a439f82", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:56.222094+00	reconciler	38308a49-de35-4dac-aa20-d1c965fe31ae
f307aa91-0708-46bf-a60d-7fe8c52bb1a7	7be01475-51a5-438d-8f75-c0ee2a439f82	organization	1	{"uri": null, "name": "Alexander Memorial Baptist Church", "email": "zshields10@icloud.com", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Alexander Memorial Baptist Church offers food pantry services, including TEFAP.", "content_hash": "7ee42862a11ee9701916816ef5b9e8ad14db0f4e61d193fd846a3dc761886e20", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:56.223909+00	reconciler	\N
ece064da-dcb9-4ca5-8570-f5420456fc15	66ed1806-bcb4-42a9-8c5b-2fd7457befea	organization_source	1	{"uri": null, "name": "Alliance for Positive Health", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Alliance for Positive Health is an organization that offers food pantry services.", "content_hash": "4495c36ceb0b1c619fa8cd1961f2bbd48f4274a8f29c558d04ccb5591c02854b", "legal_status": null, "organization_id": "5ab59ea0-827a-4675-a5ac-9034b3ea6279", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:57.08079+00	reconciler	66ed1806-bcb4-42a9-8c5b-2fd7457befea
a9a2d2ed-3fe1-4493-bedb-92c0b2762e14	5ab59ea0-827a-4675-a5ac-9034b3ea6279	organization	1	{"uri": null, "name": "Alliance for Positive Health", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Alliance for Positive Health is an organization that offers food pantry services.", "content_hash": "4495c36ceb0b1c619fa8cd1961f2bbd48f4274a8f29c558d04ccb5591c02854b", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:57.082766+00	reconciler	\N
99c82fd3-f218-4e7c-aaa6-c5042ea320e9	59981a4c-1fe7-4019-9053-a2ec1b8a8caf	phone	1	{"type": "voice", "number": "518-434-4686", "source": "the_food_pantries_org", "extension": null, "contact_id": null, "scraper_id": "the_food_pantries_org", "service_id": null, "description": null, "location_id": null, "content_hash": "4495c36ceb0b1c619fa8cd1961f2bbd48f4274a8f29c558d04ccb5591c02854b", "organization_id": "5ab59ea0-827a-4675-a5ac-9034b3ea6279", "service_at_location_id": null}	2025-08-08 05:07:57.084187+00	reconciler	\N
f5c42a77-d61c-4fd6-9278-fbef20e432d9	83695ef8-3df5-4f74-8be3-04736fc85b48	language	1	{"code": "", "name": "English", "note": null, "source": "the_food_pantries_org", "phone_id": "59981a4c-1fe7-4019-9053-a2ec1b8a8caf", "scraper_id": "the_food_pantries_org", "service_id": null, "location_id": null, "content_hash": "4495c36ceb0b1c619fa8cd1961f2bbd48f4274a8f29c558d04ccb5591c02854b"}	2025-08-08 05:07:57.084187+00	reconciler	\N
bf81b07d-aa97-404c-a989-a0e5cb50d913	05c2ec9b-3d5d-4169-90b0-8ee720c1f940	organization_source	1	{"uri": null, "name": "LifeMoves - Opportunity Services Center", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Provides ready-to-eat meals and other services to unhoused individuals.", "content_hash": "13db63a1b8fc313458f29d90178d4890d7505399e99ce54438471ac6b408f3c3", "legal_status": null, "organization_id": "b9273044-cfd6-47f0-8271-dc4503730fe7", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:57.983606+00	reconciler	05c2ec9b-3d5d-4169-90b0-8ee720c1f940
7061e198-7af6-4628-9566-4cb41321c3ba	b9273044-cfd6-47f0-8271-dc4503730fe7	organization	1	{"uri": null, "name": "LifeMoves - Opportunity Services Center", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Provides ready-to-eat meals and other services to unhoused individuals.", "content_hash": "13db63a1b8fc313458f29d90178d4890d7505399e99ce54438471ac6b408f3c3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:57.985588+00	reconciler	\N
a26a32ac-e886-465e-a97c-ae54c168e9e6	1f8f11b2-c447-480b-aa85-e38016a12877	organization_source	1	{"uri": null, "name": "Richmond Neighborhood Center", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "Richmond Neighborhood Center is a community organization providing services in San Francisco.", "content_hash": "52b9402909a09f6cb7296b459d6f7ad5a8f6469dafbeac3de7b3e66babbdd5da", "legal_status": null, "organization_id": "d78d5fdf-9077-424c-9574-bc7ff8f5850f", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:58.841067+00	reconciler	1f8f11b2-c447-480b-aa85-e38016a12877
89b82510-9bb5-414a-b06f-c09a18a2b9a3	d78d5fdf-9077-424c-9574-bc7ff8f5850f	organization	1	{"uri": null, "name": "Richmond Neighborhood Center", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "Richmond Neighborhood Center is a community organization providing services in San Francisco.", "content_hash": "52b9402909a09f6cb7296b459d6f7ad5a8f6469dafbeac3de7b3e66babbdd5da", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:58.84295+00	reconciler	\N
12f7a0cc-ef10-458b-8e85-31bcbebf729c	d7124330-a603-4efa-9d68-07cf605ba5b4	phone	1	{"type": "voice", "number": "4157508554", "source": "sfmarin_food_bank_ca", "extension": null, "contact_id": null, "scraper_id": "sfmarin_food_bank_ca", "service_id": null, "description": null, "location_id": null, "content_hash": "52b9402909a09f6cb7296b459d6f7ad5a8f6469dafbeac3de7b3e66babbdd5da", "organization_id": "d78d5fdf-9077-424c-9574-bc7ff8f5850f", "service_at_location_id": null}	2025-08-08 05:07:58.844317+00	reconciler	\N
9b2b40fe-9d24-48f1-a972-365092b3ec00	f76abb12-975f-44aa-a668-0e15c372cc43	language	1	{"code": "", "name": "English", "note": null, "source": "sfmarin_food_bank_ca", "phone_id": "d7124330-a603-4efa-9d68-07cf605ba5b4", "scraper_id": "sfmarin_food_bank_ca", "service_id": null, "location_id": null, "content_hash": "52b9402909a09f6cb7296b459d6f7ad5a8f6469dafbeac3de7b3e66babbdd5da"}	2025-08-08 05:07:58.844317+00	reconciler	\N
f2453ef5-f103-458f-a1a6-36cf343fa500	4429dcfb-eb99-488d-8f0e-6b23deaec022	organization_source	1	{"uri": null, "name": "Altamont Community Food Pantry", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "A food pantry serving the Capital District, offering assistance twice a month.", "content_hash": "7718b5dd24497bcdbf967a19e83ca99c6259e7e55134129c8c2f300a810f6354", "legal_status": null, "organization_id": "2ada2813-32f3-404c-a553-2e16e5119238", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:59.66483+00	reconciler	4429dcfb-eb99-488d-8f0e-6b23deaec022
a3247c55-bc09-4880-984d-0ed94fa48c89	2ada2813-32f3-404c-a553-2e16e5119238	organization	1	{"uri": null, "name": "Altamont Community Food Pantry", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "A food pantry serving the Capital District, offering assistance twice a month.", "content_hash": "7718b5dd24497bcdbf967a19e83ca99c6259e7e55134129c8c2f300a810f6354", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:07:59.666406+00	reconciler	\N
1905e45f-dd32-496c-8fb3-4e5c67938454	bfb941d6-8953-4504-bf6c-28887f65e115	organization_source	1	{"uri": null, "name": "Indian Orchard Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Indian Orchard Brown Bag is a food pantry service.", "content_hash": "76a4d95c42840ebce10112b8502bbf2ff1cfe5fc1702b4a168dee084df05f49a", "legal_status": null, "organization_id": "52f395ad-63ae-4893-954e-d25cb68afdd8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:00.560222+00	reconciler	bfb941d6-8953-4504-bf6c-28887f65e115
e57940ea-4be3-42e4-b466-1e8eb1409c59	52f395ad-63ae-4893-954e-d25cb68afdd8	organization	1	{"uri": null, "name": "Indian Orchard Brown Bag", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Indian Orchard Brown Bag is a food pantry service.", "content_hash": "76a4d95c42840ebce10112b8502bbf2ff1cfe5fc1702b4a168dee084df05f49a", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:00.561947+00	reconciler	\N
bcf3cd65-e11b-4c46-b51f-84e6e4ed0e43	d2fd4bba-5091-4153-81d4-9bec8c3b2d66	phone	1	{"type": "voice", "number": "4136368755", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "76a4d95c42840ebce10112b8502bbf2ff1cfe5fc1702b4a168dee084df05f49a", "organization_id": "52f395ad-63ae-4893-954e-d25cb68afdd8", "service_at_location_id": null}	2025-08-08 05:08:00.563349+00	reconciler	\N
75b8c8a8-dc1c-4ed6-9df4-87bf2915c786	d9e20059-9708-4e07-b999-5bb4cdf262ed	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "d2fd4bba-5091-4153-81d4-9bec8c3b2d66", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "76a4d95c42840ebce10112b8502bbf2ff1cfe5fc1702b4a168dee084df05f49a"}	2025-08-08 05:08:00.563349+00	reconciler	\N
0a20f5b7-11d3-40c2-b4af-ae85e2dafbbf	4e21bce9-49f0-4a5c-9d45-6a518664bf6f	organization_source	1	{"uri": null, "name": "Bay Area Maranatha Christian Center", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Bay Area Maranatha Christian Center provides food pantry services.", "content_hash": "3179570674df27170959b9847a3d878cb9fe6775424a870dc9042efbccf02f05", "legal_status": null, "organization_id": "e4e91853-017a-4bdd-a76f-c23434f2f3dd", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:01.57585+00	reconciler	4e21bce9-49f0-4a5c-9d45-6a518664bf6f
48a558de-038c-4104-a351-6d1e11c78ec5	e4e91853-017a-4bdd-a76f-c23434f2f3dd	organization	1	{"uri": null, "name": "Bay Area Maranatha Christian Center", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Bay Area Maranatha Christian Center provides food pantry services.", "content_hash": "3179570674df27170959b9847a3d878cb9fe6775424a870dc9042efbccf02f05", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:01.57808+00	reconciler	\N
13ad8ef3-0f70-42f6-a99b-bc382659d775	c508df51-4677-447a-a428-5c9b5532f94a	organization_source	9	{"uri": null, "name": "Second Harvest of Silicon Valley", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "A food bank serving Silicon Valley.", "content_hash": "259b8c86b59b024a96f4816e1026ed8bf7064be65791a3d2ec72f64d1ae5a321", "legal_status": null, "organization_id": "324e6d0f-f577-40ff-a350-bf25cde132a8", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:02.481623+00	reconciler	c508df51-4677-447a-a428-5c9b5532f94a
f4d89625-8134-4474-9a3e-41622538bac8	69c634fd-8dc7-4311-b50c-78f7a19c1ea3	organization_source	1	{"uri": null, "name": "SparkPoint at Cañada College", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "SparkPoint Center offering financial coaching and education, with information on community college enrollment and resources.", "content_hash": "8637f4f98ae5eb7c97e57373d0673858f74f60a70a191ef4559f004c3e391ec3", "legal_status": null, "organization_id": "5454407d-476b-4d6f-b507-67e1ed950280", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:04.308089+00	reconciler	69c634fd-8dc7-4311-b50c-78f7a19c1ea3
b8abbf3d-586b-4f37-8ad4-51fb92f4e7a4	5454407d-476b-4d6f-b507-67e1ed950280	organization	1	{"uri": null, "name": "SparkPoint at Cañada College", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "SparkPoint Center offering financial coaching and education, with information on community college enrollment and resources.", "content_hash": "8637f4f98ae5eb7c97e57373d0673858f74f60a70a191ef4559f004c3e391ec3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:04.309943+00	reconciler	\N
945b6c5b-e3bc-45da-86e0-e6d8ad2ebeea	5558dc11-a27f-47a3-a7fe-e98275687e9a	organization_source	1	{"uri": null, "name": "Community Survival Center Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Community Survival Center Food Pantry provides food assistance with guests limited to 6 visits per year.", "content_hash": "687c3f10d92edf39b3dd47b3d7fcfe8335bc827a8399763e3f42f55c957e3782", "legal_status": null, "organization_id": "c80f36c5-4362-43fc-956e-3e7ee3b4af42", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:05.206507+00	reconciler	5558dc11-a27f-47a3-a7fe-e98275687e9a
0be76afd-08a0-4d94-81c7-87ecc7b00ad5	c80f36c5-4362-43fc-956e-3e7ee3b4af42	organization	1	{"uri": null, "name": "Community Survival Center Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Community Survival Center Food Pantry provides food assistance with guests limited to 6 visits per year.", "content_hash": "687c3f10d92edf39b3dd47b3d7fcfe8335bc827a8399763e3f42f55c957e3782", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:05.208355+00	reconciler	\N
679a2a14-a3d1-41e4-8abf-577649754acf	275ed9cc-bbc6-4a94-92e6-ca9f1d2c19ac	phone	1	{"type": "voice", "number": "(413) 543-3930", "source": "food_bank_of_western_massachusetts_ma", "extension": null, "contact_id": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "description": null, "location_id": null, "content_hash": "687c3f10d92edf39b3dd47b3d7fcfe8335bc827a8399763e3f42f55c957e3782", "organization_id": "c80f36c5-4362-43fc-956e-3e7ee3b4af42", "service_at_location_id": null}	2025-08-08 05:08:05.209644+00	reconciler	\N
750000bd-7f37-4aa4-9479-684feacb5ff2	8e6af2eb-fdea-443c-a5e8-1059515da753	language	1	{"code": "", "name": "English", "note": null, "source": "food_bank_of_western_massachusetts_ma", "phone_id": "275ed9cc-bbc6-4a94-92e6-ca9f1d2c19ac", "scraper_id": "food_bank_of_western_massachusetts_ma", "service_id": null, "location_id": null, "content_hash": "687c3f10d92edf39b3dd47b3d7fcfe8335bc827a8399763e3f42f55c957e3782"}	2025-08-08 05:08:05.209644+00	reconciler	\N
440b6191-8838-4065-baf0-08b6f91a7fd3	ad31335a-d614-4f18-9a68-6f123a03b9a6	organization_source	1	{"uri": null, "name": "Pacifica Resource Center", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Pacifica Resource Center provides community services including a food pantry.", "content_hash": "7704fd206915f622b7bd4583c29d11f28edcf9fcf42e3fce060cbc42b35466e2", "legal_status": null, "organization_id": "a4308ae7-de1c-4fc6-98d9-1fca724e047c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:06.060793+00	reconciler	ad31335a-d614-4f18-9a68-6f123a03b9a6
235d541f-b3e0-4b81-b79c-87c8b5e9ebf3	a4308ae7-de1c-4fc6-98d9-1fca724e047c	organization	1	{"uri": null, "name": "Pacifica Resource Center", "email": null, "source": "second_harvest_of_silicon_valley_ca", "tax_id": null, "website": null, "scraper_id": "second_harvest_of_silicon_valley_ca", "tax_status": null, "description": "Pacifica Resource Center provides community services including a food pantry.", "content_hash": "7704fd206915f622b7bd4583c29d11f28edcf9fcf42e3fce060cbc42b35466e2", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:06.062467+00	reconciler	\N
a8980464-36df-41c3-8259-ed16d579c040	355a42fc-2c63-441a-b6e7-662662ba446d	organization_source	1	{"uri": null, "name": "MEI Food Pantry", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "MEI Food Pantry is a food distribution site operated by SF-Marin Food Bank.", "content_hash": "7f082fbf7f7b7726d791e173a820cb04cbd7057b2c6b6bdacc5e7784a70b0a36", "legal_status": null, "organization_id": "fded1474-612c-479a-966c-2d9051296f7a", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:06.911575+00	reconciler	355a42fc-2c63-441a-b6e7-662662ba446d
860e3f17-b22e-4779-a1b7-95b7f7f226b8	fded1474-612c-479a-966c-2d9051296f7a	organization	1	{"uri": null, "name": "MEI Food Pantry", "email": null, "source": "sfmarin_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "sfmarin_food_bank_ca", "tax_status": null, "description": "MEI Food Pantry is a food distribution site operated by SF-Marin Food Bank.", "content_hash": "7f082fbf7f7b7726d791e173a820cb04cbd7057b2c6b6bdacc5e7784a70b0a36", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:06.914107+00	reconciler	\N
5acce66c-3901-4b8a-ad47-e3ee88bbbc1f	e3c2b551-219e-4fa8-b1bd-7485ee2c7410	organization_source	2	{"uri": null, "name": "Arm In Arm", "email": null, "source": "mercer_food_finder", "tax_id": null, "website": null, "scraper_id": "mercer_food_finder", "tax_status": null, "description": "Provides food pantry services.", "content_hash": "c31246f4d7862836542d20c1cb22b43661d0b2bb184afa45515e1356dc9fe208", "legal_status": null, "organization_id": "da7af643-e475-44df-b362-0d9c146f0342", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:07.683283+00	reconciler	e3c2b551-219e-4fa8-b1bd-7485ee2c7410
9fc283d2-4931-4eca-be4a-d317ff095e5c	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	6	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving Chester County, Pennsylvania.", "content_hash": "1b1817d6477ff2811dc3f7e9f6fe3d2c622cbaa627e91df86b9e4ffbcf42b29b", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:08.506398+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
76322570-aa43-4822-a773-990002d2f167	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	7	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "A food bank serving Chester County, Pennsylvania.", "content_hash": "da706d711fb2327c76224ed2b80b449db5573fcb34cf6c134b931f18a83fe2fe", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:09.426414+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
182c936d-a639-4b17-838f-ffef73bcb7a5	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	8	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving Chester County, Pennsylvania.", "content_hash": "95e2aed4519b298da24e8909129360f9567d2afce4965a0e0053204725fba3b9", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:10.347438+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
7de02347-e098-42b7-91c6-39d7c1e2a518	291f81bc-0436-470c-9840-05a8583f7670	organization_source	1	{"uri": null, "name": "Beaudoin Village/Yoerg Circle Mobile Food Bank", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Mobile food bank service operating on the first Monday of each month.", "content_hash": "796f536dfb31a7b7f8976cea84530e4fa8f37f849873c4a190ba6364581a0cfc", "legal_status": null, "organization_id": "8706e58a-9278-4855-9ff4-07ab35d7dad6", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:11.265167+00	reconciler	291f81bc-0436-470c-9840-05a8583f7670
58e41ecb-3cf7-4232-aa59-f0bba3fcd52c	8706e58a-9278-4855-9ff4-07ab35d7dad6	organization	1	{"uri": null, "name": "Beaudoin Village/Yoerg Circle Mobile Food Bank", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Mobile food bank service operating on the first Monday of each month.", "content_hash": "796f536dfb31a7b7f8976cea84530e4fa8f37f849873c4a190ba6364581a0cfc", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:11.267034+00	reconciler	\N
25abe516-aa87-4172-aafe-fafb8604479f	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	9	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "A food bank serving Chester County, Pennsylvania.", "content_hash": "93505b2df6a2c888bffefc9779d5897220ac532869090959209ee7e0d60fcd83", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:12.980698+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
57b1705a-e8d6-4510-a674-a6ee4017eab5	324a3bc3-e766-436f-a613-4ca0aa712f8b	organization_source	2	{"uri": null, "name": "Community Action of Napa Valley Food Bank", "email": null, "source": "community_action_of_napa_valley_food_bank_ca", "tax_id": null, "website": null, "scraper_id": "community_action_of_napa_valley_food_bank_ca", "tax_status": null, "description": "Community Action of Napa Valley Food Bank provides food assistance to those in need.", "content_hash": "0080e4ee94dedf6f8621e0675a0186618e314364c7d4a11eb5e2071b86c751a0", "legal_status": null, "organization_id": "a85d4032-c780-43bc-bbed-d2d87a7df0b0", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:13.867205+00	reconciler	324a3bc3-e766-436f-a613-4ca0aa712f8b
13314e8c-70e3-41a9-a6c7-e75344ff9ee7	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	10	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving Chester County, Pennsylvania.", "content_hash": "c40371ecaf4b0c4c66ea37c1058fd48a6df0d8b4181a08f1e3cfb9831cea7963", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:14.824524+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
9c628d75-7455-48d8-a72d-7d5964e644f0	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	11	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving Chester County, Pennsylvania.", "content_hash": "191b0a88190e278571fbdd536c055d4ba06c4a54f7f5d25737a37314489c9613", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:17.345829+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
74d921c1-a70c-492f-9083-7ce8b90d3e20	cd84bea1-b052-4d19-8cd9-46f966cd7b97	organization_source	1	{"uri": null, "name": "Salvation Army Lanai", "email": null, "source": "the_food_basket_inc_hi", "tax_id": null, "website": null, "scraper_id": "the_food_basket_inc_hi", "tax_status": null, "description": "Salvation Army Lanai provides a soup kitchen service.", "content_hash": "5d4297b5001ab31df0fee48c067d885afac007fdc59e9397b4061da4b2628769", "legal_status": null, "organization_id": "e74d2389-2df1-4914-9958-80ea8c9d491d", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:18.205351+00	reconciler	cd84bea1-b052-4d19-8cd9-46f966cd7b97
1c8f7055-e6d4-4d12-a420-58382fe7af97	e74d2389-2df1-4914-9958-80ea8c9d491d	organization	1	{"uri": null, "name": "Salvation Army Lanai", "email": null, "source": "the_food_basket_inc_hi", "tax_id": null, "website": null, "scraper_id": "the_food_basket_inc_hi", "tax_status": null, "description": "Salvation Army Lanai provides a soup kitchen service.", "content_hash": "5d4297b5001ab31df0fee48c067d885afac007fdc59e9397b4061da4b2628769", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:18.20718+00	reconciler	\N
8d762fcc-fe4c-4bf2-af62-d335c8991340	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	12	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving the Chester County area.", "content_hash": "75b539f3c6330a3be2af77953b9c1ed43361963c2650865023474a889433916d", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:19.038167+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
8af30abc-e760-40c5-a428-f75771d51d44	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	13	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is a food bank serving Chester County, PA.", "content_hash": "8a1839adfd510edd99406874858026f7d57aaf7723aeffcd65785466973aee4a", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:22.510986+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
edee21c1-8fa5-4fa0-ac94-0d1dc1fe7947	7e01a8fd-448c-4d42-ac6d-649b5fb0597c	phone	1	{"type": "voice", "number": "484-720-8644", "source": "chester_county_food_bank_pa", "extension": null, "contact_id": null, "scraper_id": "chester_county_food_bank_pa", "service_id": null, "description": null, "location_id": null, "content_hash": "8a1839adfd510edd99406874858026f7d57aaf7723aeffcd65785466973aee4a", "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "service_at_location_id": null}	2025-08-08 05:08:22.518925+00	reconciler	\N
0af65dd6-5678-492c-847a-64b51a6ff95a	6c8ae594-dab1-4c16-a1d0-ea3c09d32adf	language	1	{"code": "", "name": "English", "note": null, "source": "chester_county_food_bank_pa", "phone_id": "7e01a8fd-448c-4d42-ac6d-649b5fb0597c", "scraper_id": "chester_county_food_bank_pa", "service_id": null, "location_id": null, "content_hash": "8a1839adfd510edd99406874858026f7d57aaf7723aeffcd65785466973aee4a"}	2025-08-08 05:08:22.518925+00	reconciler	\N
9c0cb199-b11f-4f74-974d-57439bba9924	7ff5e317-be9f-4b2a-882b-6bcb11e88e72	organization_source	1	{"uri": null, "name": "All Nation Church of God Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pantry is open on the 2nd and 4th Saturday of each month from 9:00 a.m. – 1:00 p.m.", "content_hash": "ae963a65d061f26d412b1736b52ce6d7450085b9d5a18f28182bebe171c0c3f7", "legal_status": null, "organization_id": "635f978b-aacd-49aa-8f3e-103e81e01134", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:23.448551+00	reconciler	7ff5e317-be9f-4b2a-882b-6bcb11e88e72
bc4369db-3cb1-4c03-a25b-4fd4ce71855c	635f978b-aacd-49aa-8f3e-103e81e01134	organization	1	{"uri": null, "name": "All Nation Church of God Food Pantry", "email": null, "source": "food_bank_of_western_massachusetts_ma", "tax_id": null, "website": null, "scraper_id": "food_bank_of_western_massachusetts_ma", "tax_status": null, "description": "Pantry is open on the 2nd and 4th Saturday of each month from 9:00 a.m. – 1:00 p.m.", "content_hash": "ae963a65d061f26d412b1736b52ce6d7450085b9d5a18f28182bebe171c0c3f7", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:23.450833+00	reconciler	\N
c55d761a-1e0d-4c0a-9653-71c16978f7a0	f00b2d53-c36b-46d2-90e3-49d05733f13c	organization_source	1	{"uri": null, "name": "Allen Chapel AME Church", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A church offering food pantry services.", "content_hash": "25a2fc471cc985404e2b9d15c309032de8b150454933af6253ba9ad0b4f164ee", "legal_status": null, "organization_id": "3db8fb18-014b-4cba-93b4-fd03ab907c69", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:24.33772+00	reconciler	f00b2d53-c36b-46d2-90e3-49d05733f13c
1635fd79-a203-4433-8063-62b8284309d6	3db8fb18-014b-4cba-93b4-fd03ab907c69	organization	1	{"uri": null, "name": "Allen Chapel AME Church", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A church offering food pantry services.", "content_hash": "25a2fc471cc985404e2b9d15c309032de8b150454933af6253ba9ad0b4f164ee", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:24.341742+00	reconciler	\N
d21a84dc-9039-48a7-9ce6-a9f66e5d9ca3	68b5ec71-8c8e-446b-85c5-a5b5be31c2ce	phone	1	{"type": "voice", "number": "202-494-9824", "source": "capital_area_food_bank_dc", "extension": null, "contact_id": null, "scraper_id": "capital_area_food_bank_dc", "service_id": null, "description": null, "location_id": null, "content_hash": "25a2fc471cc985404e2b9d15c309032de8b150454933af6253ba9ad0b4f164ee", "organization_id": "3db8fb18-014b-4cba-93b4-fd03ab907c69", "service_at_location_id": null}	2025-08-08 05:08:24.34317+00	reconciler	\N
0355d4c0-d7a9-4f7b-94d0-34bff0131e0b	caf486ca-3236-494e-8933-e71f450e1b25	language	1	{"code": "", "name": "English", "note": null, "source": "capital_area_food_bank_dc", "phone_id": "68b5ec71-8c8e-446b-85c5-a5b5be31c2ce", "scraper_id": "capital_area_food_bank_dc", "service_id": null, "location_id": null, "content_hash": "25a2fc471cc985404e2b9d15c309032de8b150454933af6253ba9ad0b4f164ee"}	2025-08-08 05:08:24.34317+00	reconciler	\N
15655134-c3bb-4188-ab67-08c7c0f31fe3	c14d3011-a23a-4725-8e6c-d7cffd3dcacc	organization_source	1	{"uri": null, "name": "Allen Chapel AME Church Outreach Ministry", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Allen Chapel AME Church Outreach Ministry provides food assistance.", "content_hash": "26d9bf386d94d5029430677f8866da5017801c53e43f6c718e3d0b6ed7a0ac65", "legal_status": null, "organization_id": "029acae3-a7aa-4e99-b988-32414afecc1d", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:25.178262+00	reconciler	c14d3011-a23a-4725-8e6c-d7cffd3dcacc
8d2ce197-0452-4e85-9370-06b605f37374	029acae3-a7aa-4e99-b988-32414afecc1d	organization	1	{"uri": null, "name": "Allen Chapel AME Church Outreach Ministry", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Allen Chapel AME Church Outreach Ministry provides food assistance.", "content_hash": "26d9bf386d94d5029430677f8866da5017801c53e43f6c718e3d0b6ed7a0ac65", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:25.180642+00	reconciler	\N
5350f739-a8ee-4b77-af08-9e09c539cb29	acb9f1d0-f631-4aed-aecf-96d576e8a63a	organization_source	1	{"uri": null, "name": "Ambassador Baptist Church", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Ambassador Baptist Church is a food pantry that provides food assistance.", "content_hash": "1171aea86ef6ee8f4c20112ec598795beac488bea63cdb63c8c89f1038d4154d", "legal_status": null, "organization_id": "817250f0-dd79-4bcc-ac24-532b60f78ce0", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:26.942023+00	reconciler	acb9f1d0-f631-4aed-aecf-96d576e8a63a
8b0cb27c-c594-4810-9749-0e22e0bccafb	817250f0-dd79-4bcc-ac24-532b60f78ce0	organization	1	{"uri": null, "name": "Ambassador Baptist Church", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Ambassador Baptist Church is a food pantry that provides food assistance.", "content_hash": "1171aea86ef6ee8f4c20112ec598795beac488bea63cdb63c8c89f1038d4154d", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:26.944181+00	reconciler	\N
0a7a975e-c229-443c-b2a1-5ac4b9ecd9bd	5c8551ea-67d6-42a0-98d7-07ef625ffb8f	phone	1	{"type": "voice", "number": "2026781993", "source": "capital_area_food_bank_dc", "extension": null, "contact_id": null, "scraper_id": "capital_area_food_bank_dc", "service_id": null, "description": null, "location_id": null, "content_hash": "1171aea86ef6ee8f4c20112ec598795beac488bea63cdb63c8c89f1038d4154d", "organization_id": "817250f0-dd79-4bcc-ac24-532b60f78ce0", "service_at_location_id": null}	2025-08-08 05:08:26.945585+00	reconciler	\N
0f3e9afb-83ff-44cf-8731-9ac3eef2e1c2	17c97bdc-4f7e-4d4e-86d5-5b7356cf601e	language	1	{"code": "", "name": "English", "note": null, "source": "capital_area_food_bank_dc", "phone_id": "5c8551ea-67d6-42a0-98d7-07ef625ffb8f", "scraper_id": "capital_area_food_bank_dc", "service_id": null, "location_id": null, "content_hash": "1171aea86ef6ee8f4c20112ec598795beac488bea63cdb63c8c89f1038d4154d"}	2025-08-08 05:08:26.945585+00	reconciler	\N
20b1e23c-efe1-49ef-8109-43d1323639bc	b7876054-4b6e-4a88-86ce-05d06d3292e0	organization_source	1	{"uri": null, "name": "Apostolic Church Glorious Vision", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A food pantry operated by Apostolic Church Glorious Vision, supported by Capital Area Food Bank.", "content_hash": "5a0471f14b612be4a02fcb1d6b93e5d97e5ca8855057ae853abec3786f427e0b", "legal_status": null, "organization_id": "64fa9639-50d2-48ac-bff7-9a1d72714f31", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:27.784035+00	reconciler	b7876054-4b6e-4a88-86ce-05d06d3292e0
f52c87d3-ceca-4729-ba49-28cfb7d4de8f	64fa9639-50d2-48ac-bff7-9a1d72714f31	organization	1	{"uri": null, "name": "Apostolic Church Glorious Vision", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A food pantry operated by Apostolic Church Glorious Vision, supported by Capital Area Food Bank.", "content_hash": "5a0471f14b612be4a02fcb1d6b93e5d97e5ca8855057ae853abec3786f427e0b", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:27.785736+00	reconciler	\N
b1380289-5617-4a3c-817d-09a02ca6306d	e4ee44a7-5882-483d-8a98-16583aabb2c4	phone	1	{"type": "voice", "number": "2404630150", "source": "capital_area_food_bank_dc", "extension": null, "contact_id": null, "scraper_id": "capital_area_food_bank_dc", "service_id": null, "description": null, "location_id": null, "content_hash": "5a0471f14b612be4a02fcb1d6b93e5d97e5ca8855057ae853abec3786f427e0b", "organization_id": "64fa9639-50d2-48ac-bff7-9a1d72714f31", "service_at_location_id": null}	2025-08-08 05:08:27.78699+00	reconciler	\N
5cde6e10-3060-4b8b-b68e-4d4f8602dff1	f15b84c6-9f5c-4456-92ee-bff82a9e8823	language	1	{"code": "", "name": "English", "note": null, "source": "capital_area_food_bank_dc", "phone_id": "e4ee44a7-5882-483d-8a98-16583aabb2c4", "scraper_id": "capital_area_food_bank_dc", "service_id": null, "location_id": null, "content_hash": "5a0471f14b612be4a02fcb1d6b93e5d97e5ca8855057ae853abec3786f427e0b"}	2025-08-08 05:08:27.78699+00	reconciler	\N
c64c2aba-e55b-4af4-825b-66c2e20d15da	aaf2bc0b-dd1d-4da5-bb4e-ef56b4968622	organization_source	1	{"uri": null, "name": "Antioch Baptist Church of Clinton", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Antioch Baptist Church of Clinton provides food pantry services.", "content_hash": "40b5380b098f5d01473177524fd9386c5c767b2a4d3b538cd0f5f9a9e2d1c7f3", "legal_status": null, "organization_id": "c4a6f065-5920-457a-9aad-7c54d7df9989", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:28.646588+00	reconciler	aaf2bc0b-dd1d-4da5-bb4e-ef56b4968622
2d78e11f-d63a-4af5-9bb7-3f3d1b74a65f	c4a6f065-5920-457a-9aad-7c54d7df9989	organization	1	{"uri": null, "name": "Antioch Baptist Church of Clinton", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Antioch Baptist Church of Clinton provides food pantry services.", "content_hash": "40b5380b098f5d01473177524fd9386c5c767b2a4d3b538cd0f5f9a9e2d1c7f3", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:28.648813+00	reconciler	\N
0684cb8c-953b-456d-b1b1-c4b5525b48fc	491ebba9-819f-4e6d-aed7-1cbc1a7e0cfe	organization_source	1	{"uri": null, "name": "Ark of Grace Mission, Inc", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Ark of Grace Mission, Inc. is a food pantry providing services to the community.", "content_hash": "1453ca2f303b880c6b6c83a55938d51391084ab91a269e109d9b5bd873fea6aa", "legal_status": null, "organization_id": "ce3ae043-46d7-4dea-867a-cef5e3e615e5", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:30.35345+00	reconciler	491ebba9-819f-4e6d-aed7-1cbc1a7e0cfe
446d8e31-ddcd-47f9-b31e-2566b7ac58ca	ce3ae043-46d7-4dea-867a-cef5e3e615e5	organization	1	{"uri": null, "name": "Ark of Grace Mission, Inc", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Ark of Grace Mission, Inc. is a food pantry providing services to the community.", "content_hash": "1453ca2f303b880c6b6c83a55938d51391084ab91a269e109d9b5bd873fea6aa", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:30.355689+00	reconciler	\N
598255c7-38c2-4ef3-a830-e8f8592c26ad	229f8047-aa0f-4b76-8c33-945145a20cac	organization_source	1	{"uri": null, "name": "Arlington Bridge Builders", "email": "tjgm_2013@yahoo.com", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Arlington Bridge Builders provides food pantry services.", "content_hash": "dbafcd493079739d84bc914d2d3e430fac22eae2f1b846dd2f31f89cba753ee1", "legal_status": null, "organization_id": "d89af38c-e08a-4359-9f7a-0ee50719caea", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:31.260221+00	reconciler	229f8047-aa0f-4b76-8c33-945145a20cac
e5cd64e2-e9fa-4a30-ad8c-3b00f0b64ad0	d89af38c-e08a-4359-9f7a-0ee50719caea	organization	1	{"uri": null, "name": "Arlington Bridge Builders", "email": "tjgm_2013@yahoo.com", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Arlington Bridge Builders provides food pantry services.", "content_hash": "dbafcd493079739d84bc914d2d3e430fac22eae2f1b846dd2f31f89cba753ee1", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:31.262683+00	reconciler	\N
f06fbe9d-11ac-45ee-8256-0fccd6adf223	36eaa6ad-38d6-4440-a0a5-d511cb1de6bc	phone	1	{"type": "voice", "number": "571-282-5156", "source": "capital_area_food_bank_dc", "extension": null, "contact_id": null, "scraper_id": "capital_area_food_bank_dc", "service_id": null, "description": null, "location_id": null, "content_hash": "dbafcd493079739d84bc914d2d3e430fac22eae2f1b846dd2f31f89cba753ee1", "organization_id": "d89af38c-e08a-4359-9f7a-0ee50719caea", "service_at_location_id": null}	2025-08-08 05:08:31.26412+00	reconciler	\N
42c972e8-aa22-4feb-98b4-860ca643302c	e3a6e029-978a-4c63-bebc-1225d4fe1b5c	language	1	{"code": "", "name": "English", "note": null, "source": "capital_area_food_bank_dc", "phone_id": "36eaa6ad-38d6-4440-a0a5-d511cb1de6bc", "scraper_id": "capital_area_food_bank_dc", "service_id": null, "location_id": null, "content_hash": "dbafcd493079739d84bc914d2d3e430fac22eae2f1b846dd2f31f89cba753ee1"}	2025-08-08 05:08:31.26412+00	reconciler	\N
e907725d-2197-41d2-8bc4-ff1e94323e6d	81ee2d2c-737c-4a75-93bb-acb704e073ea	organization_source	1	{"uri": null, "name": "Arlington Mill Community Center", "email": "aprivera@capitalareafoodbank.org", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Community center providing food pantry services.", "content_hash": "bf2870f58cbccae53bc9df4672842213a0810ec2ff7849631c9ec379b589b3ad", "legal_status": null, "organization_id": "a4eed536-98f3-40f3-ab92-64a3a1bd0d13", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:32.27976+00	reconciler	81ee2d2c-737c-4a75-93bb-acb704e073ea
939505a2-13ab-46ac-aafe-8a2aba96226e	a4eed536-98f3-40f3-ab92-64a3a1bd0d13	organization	1	{"uri": null, "name": "Arlington Mill Community Center", "email": "aprivera@capitalareafoodbank.org", "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Community center providing food pantry services.", "content_hash": "bf2870f58cbccae53bc9df4672842213a0810ec2ff7849631c9ec379b589b3ad", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:32.281758+00	reconciler	\N
c6893b6e-7991-4cf4-8979-dadd8392bde6	1ce4b336-e055-455b-bcf0-0c2c37d79002	phone	1	{"type": "voice", "number": "2029842912", "source": "capital_area_food_bank_dc", "extension": null, "contact_id": null, "scraper_id": "capital_area_food_bank_dc", "service_id": null, "description": null, "location_id": null, "content_hash": "bf2870f58cbccae53bc9df4672842213a0810ec2ff7849631c9ec379b589b3ad", "organization_id": "a4eed536-98f3-40f3-ab92-64a3a1bd0d13", "service_at_location_id": null}	2025-08-08 05:08:32.283551+00	reconciler	\N
d0746ef5-9073-4be1-8259-841f5e5fb1fb	998008ea-28d9-41e0-8dcf-c9f704b1cd8f	language	1	{"code": "", "name": "English", "note": null, "source": "capital_area_food_bank_dc", "phone_id": "1ce4b336-e055-455b-bcf0-0c2c37d79002", "scraper_id": "capital_area_food_bank_dc", "service_id": null, "location_id": null, "content_hash": "bf2870f58cbccae53bc9df4672842213a0810ec2ff7849631c9ec379b589b3ad"}	2025-08-08 05:08:32.283551+00	reconciler	\N
f411583e-bbd4-4beb-bf73-523d69b185c2	b1042d1b-fa21-4506-8862-1120758fa384	organization_source	1	{"uri": null, "name": "Epiphany Lutheran Church", "email": null, "source": "rutgers_against_hunger", "tax_id": null, "website": null, "scraper_id": "rutgers_against_hunger", "tax_status": null, "description": "Food pantry in Atlantic County, NJ.", "content_hash": "628fdc7375d0d6b77265ff705388efdc68c4071c9b4ae7fd9049d989ae23a53e", "legal_status": null, "organization_id": "7cfc5bbb-5efc-486b-81be-92df7c50864b", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:33.310982+00	reconciler	b1042d1b-fa21-4506-8862-1120758fa384
83c60a15-abe1-4ac2-89c3-c73408e0dc1a	7cfc5bbb-5efc-486b-81be-92df7c50864b	organization	1	{"uri": null, "name": "Epiphany Lutheran Church", "email": null, "source": "rutgers_against_hunger", "tax_id": null, "website": null, "scraper_id": "rutgers_against_hunger", "tax_status": null, "description": "Food pantry in Atlantic County, NJ.", "content_hash": "628fdc7375d0d6b77265ff705388efdc68c4071c9b4ae7fd9049d989ae23a53e", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:33.314371+00	reconciler	\N
e4371b4f-b938-4382-bd24-f2739b4f3381	2fd685fa-38c5-4903-9527-a70177e175c0	organization_source	14	{"uri": null, "name": "Chester County Food Bank", "email": null, "source": "chester_county_food_bank_pa", "tax_id": null, "website": null, "scraper_id": "chester_county_food_bank_pa", "tax_status": null, "description": "Chester County Food Bank is an organization that provides food assistance.", "content_hash": "01121b2edc11e08706cc6a1138f57e2d86354dd69ea6fb0dbdfd64cd0fc63b97", "legal_status": null, "organization_id": "83938a98-6227-43f4-8b94-7a5dad665ca2", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:34.400769+00	reconciler	2fd685fa-38c5-4903-9527-a70177e175c0
7d3e2e32-a7be-4116-9632-fe13e537df29	04b4f5b5-9268-492d-85ed-b2aa85a6afc9	organization_source	1	{"uri": null, "name": "Bellevue Reformed Church", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Bellevue Reformed Church operates a Little Free Food Pantry.", "content_hash": "9974b91abb0cf2d9ed7f4fb4a9f8ffc27f939558e03a3a82a0e7ecabe0036c72", "legal_status": null, "organization_id": "d0867005-df45-4414-965f-db71589eb3c1", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:35.439778+00	reconciler	04b4f5b5-9268-492d-85ed-b2aa85a6afc9
6cee2ea1-4aac-469e-9988-2c5a80495a59	d0867005-df45-4414-965f-db71589eb3c1	organization	1	{"uri": null, "name": "Bellevue Reformed Church", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Bellevue Reformed Church operates a Little Free Food Pantry.", "content_hash": "9974b91abb0cf2d9ed7f4fb4a9f8ffc27f939558e03a3a82a0e7ecabe0036c72", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:35.441712+00	reconciler	\N
d3b9b274-1b5b-453d-834a-0bb6ba3dcf4d	7051b324-6594-4785-b63e-ed1e4f2012b4	organization_source	1	{"uri": null, "name": "Assumption Outreach", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Assumption Outreach provides food assistance services.", "content_hash": "882bd263c14d047a5d96521b1703ac57085ffe20cd41bce19a9b2fa333e2be7c", "legal_status": null, "organization_id": "3040b6d3-e888-42fc-ae33-44ca3f5fe488", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:36.483215+00	reconciler	7051b324-6594-4785-b63e-ed1e4f2012b4
c2300083-e685-45ee-af24-80fc9cec21e5	3040b6d3-e888-42fc-ae33-44ca3f5fe488	organization	1	{"uri": null, "name": "Assumption Outreach", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Assumption Outreach provides food assistance services.", "content_hash": "882bd263c14d047a5d96521b1703ac57085ffe20cd41bce19a9b2fa333e2be7c", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:36.486149+00	reconciler	\N
0db232be-90ad-4554-a9b6-a79ddd4556e9	2d5bc192-ec54-461b-beb5-6daf784833de	phone	1	{"type": "voice", "number": "202-561-5941", "source": "capital_area_food_bank_dc", "extension": null, "contact_id": null, "scraper_id": "capital_area_food_bank_dc", "service_id": null, "description": null, "location_id": null, "content_hash": "882bd263c14d047a5d96521b1703ac57085ffe20cd41bce19a9b2fa333e2be7c", "organization_id": "3040b6d3-e888-42fc-ae33-44ca3f5fe488", "service_at_location_id": null}	2025-08-08 05:08:36.489037+00	reconciler	\N
63357d4d-df4d-4bbc-b07e-12f246789520	93cb1d1f-6961-4ef4-b5c3-52f885022f56	language	1	{"code": "", "name": "English", "note": null, "source": "capital_area_food_bank_dc", "phone_id": "2d5bc192-ec54-461b-beb5-6daf784833de", "scraper_id": "capital_area_food_bank_dc", "service_id": null, "location_id": null, "content_hash": "882bd263c14d047a5d96521b1703ac57085ffe20cd41bce19a9b2fa333e2be7c"}	2025-08-08 05:08:36.489037+00	reconciler	\N
198e11a7-9bf0-41c6-81e1-b6eccd5a61bb	7ebc150f-bd5b-4af2-a9fc-efad8dcb7f32	organization_source	1	{"uri": null, "name": "Bethesda House of Schenectady", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Bethesda House of Schenectady provides food pantry services.", "content_hash": "5f652d1894effc81ad4098cb307011c6316b168e3f9d760660cccf8b8989b203", "legal_status": null, "organization_id": "2c4bd260-861c-4ebb-a158-96ced71cdb6b", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:39.479444+00	reconciler	7ebc150f-bd5b-4af2-a9fc-efad8dcb7f32
a7cfa528-8bf5-4d2e-bf68-d1d78a82dcb1	2c4bd260-861c-4ebb-a158-96ced71cdb6b	organization	1	{"uri": null, "name": "Bethesda House of Schenectady", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Bethesda House of Schenectady provides food pantry services.", "content_hash": "5f652d1894effc81ad4098cb307011c6316b168e3f9d760660cccf8b8989b203", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:39.48143+00	reconciler	\N
2bdcd31a-b187-4622-9259-12ebd62c175b	4f4cbc80-2cd0-4179-bcd9-ae277b891ace	organization_source	1	{"uri": null, "name": "Friends of Jean Webster Soup Kitchen", "email": null, "source": "rutgers_against_hunger", "tax_id": null, "website": null, "scraper_id": "rutgers_against_hunger", "tax_status": null, "description": "Food pantry in Atlantic County, NJ offering Soup Kitchen services.", "content_hash": "1a94ab00f93c58163fd519917dc42e5e2bab0edf5f61e241a7c6d49e5886bac0", "legal_status": null, "organization_id": "871bb9bb-a6b1-4abc-9276-d6c2841666e6", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:41.21135+00	reconciler	4f4cbc80-2cd0-4179-bcd9-ae277b891ace
5e250910-79a2-4b8b-a6e6-99af38ee4794	871bb9bb-a6b1-4abc-9276-d6c2841666e6	organization	1	{"uri": null, "name": "Friends of Jean Webster Soup Kitchen", "email": null, "source": "rutgers_against_hunger", "tax_id": null, "website": null, "scraper_id": "rutgers_against_hunger", "tax_status": null, "description": "Food pantry in Atlantic County, NJ offering Soup Kitchen services.", "content_hash": "1a94ab00f93c58163fd519917dc42e5e2bab0edf5f61e241a7c6d49e5886bac0", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:41.217142+00	reconciler	\N
18a5299e-3884-4aa1-b0f7-6fd50376ba9e	df641f5f-2638-4fd3-944a-a13980250351	phone	1	{"type": "voice", "number": "6094572999", "source": "rutgers_against_hunger", "extension": null, "contact_id": null, "scraper_id": "rutgers_against_hunger", "service_id": null, "description": null, "location_id": null, "content_hash": "1a94ab00f93c58163fd519917dc42e5e2bab0edf5f61e241a7c6d49e5886bac0", "organization_id": "871bb9bb-a6b1-4abc-9276-d6c2841666e6", "service_at_location_id": null}	2025-08-08 05:08:41.218556+00	reconciler	\N
6e6e773d-41fb-4ab4-a1c7-077b25a446a5	293d79b7-cc21-452b-bb54-2d9cd9e388c8	language	1	{"code": "", "name": "English", "note": null, "source": "rutgers_against_hunger", "phone_id": "df641f5f-2638-4fd3-944a-a13980250351", "scraper_id": "rutgers_against_hunger", "service_id": null, "location_id": null, "content_hash": "1a94ab00f93c58163fd519917dc42e5e2bab0edf5f61e241a7c6d49e5886bac0"}	2025-08-08 05:08:41.218556+00	reconciler	\N
68dec5ce-a716-44e5-b667-7c7361280e47	9233c234-783d-4dcd-8922-fbed7b84e2bd	organization_source	1	{"uri": null, "name": "Bethel Stand for Life Outreach Ministries", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Bethel Stand for Life Outreach Ministries is an organization that provides services.", "content_hash": "a175ebdd3522163886a14690172c00506d5d67eb1b7d832885d19fc00b0bc6f8", "legal_status": null, "organization_id": "51f083a2-ec50-4c9b-9690-3bffb97d18ee", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:42.110289+00	reconciler	9233c234-783d-4dcd-8922-fbed7b84e2bd
8669b32c-94f3-4593-b115-85f2f37dd008	51f083a2-ec50-4c9b-9690-3bffb97d18ee	organization	1	{"uri": null, "name": "Bethel Stand for Life Outreach Ministries", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Bethel Stand for Life Outreach Ministries is an organization that provides services.", "content_hash": "a175ebdd3522163886a14690172c00506d5d67eb1b7d832885d19fc00b0bc6f8", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:42.112726+00	reconciler	\N
ba77fec5-7afa-4016-8b8a-d868545e79a0	c38f550b-bb04-482e-bc4c-bf41dc7a49e6	organization_source	1	{"uri": null, "name": "Berlin Food Closet", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "A food pantry serving the Capital District.", "content_hash": "552d7f04f8593858d33f578bee69832bec0b2bb6c333bd506f1a6a345e4a24c9", "legal_status": null, "organization_id": "ea1c6dbd-25b3-4faf-906f-91ab0c7a7340", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:44.658515+00	reconciler	c38f550b-bb04-482e-bc4c-bf41dc7a49e6
31458ae2-b853-4bd9-b484-b6007e77ee64	ea1c6dbd-25b3-4faf-906f-91ab0c7a7340	organization	1	{"uri": null, "name": "Berlin Food Closet", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "A food pantry serving the Capital District.", "content_hash": "552d7f04f8593858d33f578bee69832bec0b2bb6c333bd506f1a6a345e4a24c9", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:44.660608+00	reconciler	\N
4174307f-f9dc-4903-a141-2f0dad77c656	95ba2788-2744-4f42-9b61-ebaa2d7fc9ab	phone	1	{"type": "voice", "number": "518-658-2942", "source": "the_food_pantries_org", "extension": null, "contact_id": null, "scraper_id": "the_food_pantries_org", "service_id": null, "description": null, "location_id": null, "content_hash": "552d7f04f8593858d33f578bee69832bec0b2bb6c333bd506f1a6a345e4a24c9", "organization_id": "ea1c6dbd-25b3-4faf-906f-91ab0c7a7340", "service_at_location_id": null}	2025-08-08 05:08:44.662155+00	reconciler	\N
488a90ff-c7b0-46e6-a293-b93025b9c2c4	4f3e95ee-9de0-4dfd-8ce1-22fb8d3cf03f	language	1	{"code": "", "name": "English", "note": null, "source": "the_food_pantries_org", "phone_id": "95ba2788-2744-4f42-9b61-ebaa2d7fc9ab", "scraper_id": "the_food_pantries_org", "service_id": null, "location_id": null, "content_hash": "552d7f04f8593858d33f578bee69832bec0b2bb6c333bd506f1a6a345e4a24c9"}	2025-08-08 05:08:44.662155+00	reconciler	\N
e1c3b31f-c7f7-4389-aede-636139422517	0bfcc2fa-9f2f-4ac7-a59c-c970da231dbc	organization_source	1	{"uri": null, "name": "Trinity Alliance of the Capital Region", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Trinity Alliance of the Capital Region is an organization that operates food pantries.", "content_hash": "02e52d8a1c6be6d68f4149e177993b2ee2c9d7930f5a3e511d07c2d0598a2fa5", "legal_status": null, "organization_id": "b6873215-f79c-4d04-aa14-1a79e5d0cf1a", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:46.396935+00	reconciler	0bfcc2fa-9f2f-4ac7-a59c-c970da231dbc
3fd2e55a-1795-4d97-b87e-b1be8ec802ae	b6873215-f79c-4d04-aa14-1a79e5d0cf1a	organization	1	{"uri": null, "name": "Trinity Alliance of the Capital Region", "email": null, "source": "the_food_pantries_org", "tax_id": null, "website": null, "scraper_id": "the_food_pantries_org", "tax_status": null, "description": "Trinity Alliance of the Capital Region is an organization that operates food pantries.", "content_hash": "02e52d8a1c6be6d68f4149e177993b2ee2c9d7930f5a3e511d07c2d0598a2fa5", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:46.398735+00	reconciler	\N
e70ade27-6aa2-4e9f-82d5-76e37c6b2760	02f93c68-828f-4932-8aed-09270af2438d	phone	1	{"type": "voice", "number": "518-463-1516", "source": "the_food_pantries_org", "extension": null, "contact_id": null, "scraper_id": "the_food_pantries_org", "service_id": null, "description": null, "location_id": null, "content_hash": "02e52d8a1c6be6d68f4149e177993b2ee2c9d7930f5a3e511d07c2d0598a2fa5", "organization_id": "b6873215-f79c-4d04-aa14-1a79e5d0cf1a", "service_at_location_id": null}	2025-08-08 05:08:46.400041+00	reconciler	\N
5fc1d525-c9d7-4e15-bba7-87192ece96da	eda4f795-918c-4102-bb07-04195baadb40	language	1	{"code": "", "name": "English", "note": null, "source": "the_food_pantries_org", "phone_id": "02f93c68-828f-4932-8aed-09270af2438d", "scraper_id": "the_food_pantries_org", "service_id": null, "location_id": null, "content_hash": "02e52d8a1c6be6d68f4149e177993b2ee2c9d7930f5a3e511d07c2d0598a2fa5"}	2025-08-08 05:08:46.400041+00	reconciler	\N
9af338d4-1318-412e-8c45-7dc6940d6bca	b0a612b4-fd4f-4a34-a3f2-6b99367f7a44	organization_source	1	{"uri": null, "name": "Beltsville Adventist Community Center", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A community center offering food pantry services, affiliated with Capital Area Food Bank.", "content_hash": "aa0f7d11a4ffafc3a475c6c2c103d676a960599bf76d51a71fa0188d84e8cb9f", "legal_status": null, "organization_id": "ea68d5c3-210e-4fc1-b2f5-3dc8e3aeb48d", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:48.142111+00	reconciler	b0a612b4-fd4f-4a34-a3f2-6b99367f7a44
1ff2a0af-c597-43a2-99b9-8d3619bcdb2c	ea68d5c3-210e-4fc1-b2f5-3dc8e3aeb48d	organization	1	{"uri": null, "name": "Beltsville Adventist Community Center", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "A community center offering food pantry services, affiliated with Capital Area Food Bank.", "content_hash": "aa0f7d11a4ffafc3a475c6c2c103d676a960599bf76d51a71fa0188d84e8cb9f", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:48.144016+00	reconciler	\N
3d8ef5b2-b875-42b8-a85b-5af3d18dc742	b09fc55b-d4f9-48b2-826b-2d54812bda4f	organization_source	1	{"uri": null, "name": "Grace Tabernacle", "email": null, "source": "rutgers_against_hunger", "tax_id": null, "website": null, "scraper_id": "rutgers_against_hunger", "tax_status": null, "description": "Food pantry in Atlantic County, NJ.", "content_hash": "95ca28fd18cbd203c6de64fcfe0af0dfe14ede5ea45e7bf366c68224f3f61421", "legal_status": null, "organization_id": "124b3f98-68fd-4e7a-8453-5e3b1eb504c1", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:50.921451+00	reconciler	b09fc55b-d4f9-48b2-826b-2d54812bda4f
507d7170-6527-42f1-9bd7-bbdf8516e023	124b3f98-68fd-4e7a-8453-5e3b1eb504c1	organization	1	{"uri": null, "name": "Grace Tabernacle", "email": null, "source": "rutgers_against_hunger", "tax_id": null, "website": null, "scraper_id": "rutgers_against_hunger", "tax_status": null, "description": "Food pantry in Atlantic County, NJ.", "content_hash": "95ca28fd18cbd203c6de64fcfe0af0dfe14ede5ea45e7bf366c68224f3f61421", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:50.923731+00	reconciler	\N
79a9e0b8-e3e8-4fcf-8fb9-51e79a3bdda9	8a82c338-23bb-4aac-9f36-fca4feb63dc0	phone	1	{"type": "voice", "number": "6096414701", "source": "rutgers_against_hunger", "extension": null, "contact_id": null, "scraper_id": "rutgers_against_hunger", "service_id": null, "description": null, "location_id": null, "content_hash": "95ca28fd18cbd203c6de64fcfe0af0dfe14ede5ea45e7bf366c68224f3f61421", "organization_id": "124b3f98-68fd-4e7a-8453-5e3b1eb504c1", "service_at_location_id": null}	2025-08-08 05:08:50.925298+00	reconciler	\N
a8925008-8ae7-4b94-a619-4e25de10e751	48952756-6573-4edc-9bd5-eb8e7c75c6b0	language	1	{"code": "", "name": "English", "note": null, "source": "rutgers_against_hunger", "phone_id": "8a82c338-23bb-4aac-9f36-fca4feb63dc0", "scraper_id": "rutgers_against_hunger", "service_id": null, "location_id": null, "content_hash": "95ca28fd18cbd203c6de64fcfe0af0dfe14ede5ea45e7bf366c68224f3f61421"}	2025-08-08 05:08:50.925298+00	reconciler	\N
c3b0bf2c-47e1-4e7c-b98a-182dfe2a2914	ccab1764-3bd7-4f02-b580-1ec6ef7a7817	organization_source	1	{"uri": null, "name": "Bethesda Help", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Bethesda Help is a food pantry.", "content_hash": "05537d9bb859a4b1f0134ac96e4dddfd33e82f7ea663731a65469cfd9a7d3d3e", "legal_status": null, "organization_id": "36081f29-cf6d-41df-a568-dab1a36921ad", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:51.847699+00	reconciler	ccab1764-3bd7-4f02-b580-1ec6ef7a7817
586d00b5-cca3-4d5b-903d-842e925e635b	36081f29-cf6d-41df-a568-dab1a36921ad	organization	1	{"uri": null, "name": "Bethesda Help", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Bethesda Help is a food pantry.", "content_hash": "05537d9bb859a4b1f0134ac96e4dddfd33e82f7ea663731a65469cfd9a7d3d3e", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:51.849836+00	reconciler	\N
8017f5dc-8b08-44c2-85f8-d58de8dd002e	a58d31dd-1114-40dc-8daf-5f23dd9c52b2	organization_source	1	{"uri": null, "name": "Boat People SOS", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Boat People SOS is an organization that provides services to the community.", "content_hash": "ca7befab2cec05559852bfa504989d219d364d5412a1c1013fc520b42051df2e", "legal_status": null, "organization_id": "b4b38405-fcfc-4ecb-b4d4-6479cb74b94c", "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:52.778375+00	reconciler	a58d31dd-1114-40dc-8daf-5f23dd9c52b2
3860e38c-c75e-4e10-b763-06af55cf8dcf	b4b38405-fcfc-4ecb-b4d4-6479cb74b94c	organization	1	{"uri": null, "name": "Boat People SOS", "email": null, "source": "capital_area_food_bank_dc", "tax_id": null, "website": null, "scraper_id": "capital_area_food_bank_dc", "tax_status": null, "description": "Boat People SOS is an organization that provides services to the community.", "content_hash": "ca7befab2cec05559852bfa504989d219d364d5412a1c1013fc520b42051df2e", "legal_status": null, "year_incorporated": null, "parent_organization_id": null}	2025-08-08 05:08:52.780585+00	reconciler	\N
\.


--
-- Data for Name: required_document; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.required_document (id, service_id, document, uri) FROM stdin;
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schedule (id, service_id, location_id, service_at_location_id, valid_from, valid_to, dtstart, timezone, until, count, wkst, freq, "interval", byday, byweekno, bymonthday, byyearday, description, opens_at, closes_at, schedule_link, attending_type, notes) FROM stdin;
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service (id, organization_id, program_id, name, alternate_name, description, url, email, status, interpretation_services, application_process, fees_description, wait_time, fees, accreditations, eligibility_description, minimum_age, maximum_age, assured_date, assurer_email, licenses, alert, last_modified) FROM stdin;
f97e5aa6-49ed-45ee-a1ff-ebf8f88655d4	16838842-d076-4e5e-b1fb-3fe49ca0e748	\N	Food Pantry	\N	Provides food assistance to individuals and families in need. Operating hours are the 2nd Tuesday of the month from 11:00 am to 1:00 pm, and the 3rd Tuesday of the month from 5:00 pm to 7:00 pm.	\N	\N	active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9d287856-43e7-4fb4-9916-b7951e7a1a9a	291c5723-d461-422a-a817-8c0ee2506f03	\N	Food Pantry	\N	Provides free groceries through drive-thru and walk-up options.	\N	\N	active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ddf2c07b-8398-4f31-b2fa-14245d6fdc15	f6e0dadd-d53c-4b24-a5eb-37e635069f40	\N	Food Pantry	\N	Food pantry services.	\N	\N	active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
ab853f59-340b-4657-a753-ab50b01e3ab5	f6e0dadd-d53c-4b24-a5eb-37e635069f40	\N	Mobile Food Bank	\N	Distribution is on the 4th Monday of each month from 4:00 – 5:30 p.m. Lorraine’s full Mobile Pantry schedule can be found here >	\N	\N	active	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: service_area; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_area (id, service_id, service_at_location_id, name, description, extent, extent_type, uri) FROM stdin;
\.


--
-- Data for Name: service_at_location; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_at_location (id, service_id, location_id, description) FROM stdin;
\.


--
-- Data for Name: service_capacity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_capacity (id, service_id, unit_id, available, maximum, description, updated) FROM stdin;
\.


--
-- Data for Name: service_source; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.service_source (id, service_id, scraper_id, name, description, organization_id, status, created_at, updated_at) FROM stdin;
7e477754-7bb6-4d7c-aa08-61db41f28d75	f97e5aa6-49ed-45ee-a1ff-ebf8f88655d4	toledo_northwestern_ohio_food_bank_oh	Food Pantry	Provides food assistance to individuals and families in need. Operating hours are the 2nd Tuesday of the month from 11:00 am to 1:00 pm, and the 3rd Tuesday of the month from 5:00 pm to 7:00 pm.	16838842-d076-4e5e-b1fb-3fe49ca0e748	active	2025-08-08 05:05:33.165937+00	2025-08-08 05:05:33.165937+00
474cb9a5-a066-43ee-a3f5-459cd59e41c8	9d287856-43e7-4fb4-9916-b7951e7a1a9a	second_harvest_of_silicon_valley_ca	Food Pantry	Provides free groceries through drive-thru and walk-up options.	291c5723-d461-422a-a817-8c0ee2506f03	active	2025-08-08 05:05:40.86709+00	2025-08-08 05:05:40.86709+00
b4b566de-3317-4bf0-9ebe-7224aec7140d	ddf2c07b-8398-4f31-b2fa-14245d6fdc15	food_bank_of_western_massachusetts_ma	Food Pantry	Food pantry services.	f6e0dadd-d53c-4b24-a5eb-37e635069f40	active	2025-08-08 05:06:07.805748+00	2025-08-08 05:06:07.805748+00
d1d17dcf-9970-438d-bae0-f5afa7e649b4	ab853f59-340b-4657-a753-ab50b01e3ab5	food_bank_of_western_massachusetts_ma	Mobile Food Bank	Distribution is on the 4th Monday of each month from 4:00 – 5:30 p.m. Lorraine’s full Mobile Pantry schedule can be found here >	f6e0dadd-d53c-4b24-a5eb-37e635069f40	active	2025-08-08 05:06:07.81587+00	2025-08-08 05:06:07.81587+00
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: taxonomy; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taxonomy (id, name, description, uri, version) FROM stdin;
\.


--
-- Data for Name: taxonomy_term; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.taxonomy_term (id, code, name, description, parent_id, taxonomy, language, taxonomy_id, term_uri) FROM stdin;
\.


--
-- Data for Name: unit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.unit (id, name, scheme, identifier, uri) FROM stdin;
\.


--
-- Data for Name: url; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.url (id, label, url, organization_id, service_id) FROM stdin;
\.


--
-- Name: reconciler_constraint_violations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reconciler_constraint_violations_id_seq', 1, false);


--
-- Name: accessibility accessibility_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accessibility
    ADD CONSTRAINT accessibility_pkey PRIMARY KEY (id);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: attribute attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: cost_option cost_option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_option
    ADD CONSTRAINT cost_option_pkey PRIMARY KEY (id);


--
-- Name: funding funding_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_pkey PRIMARY KEY (id);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: location_source location_source_location_id_scraper_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location_source
    ADD CONSTRAINT location_source_location_id_scraper_id_key UNIQUE (location_id, scraper_id);


--
-- Name: location_source location_source_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location_source
    ADD CONSTRAINT location_source_pkey PRIMARY KEY (id);


--
-- Name: meta_table_description meta_table_description_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.meta_table_description
    ADD CONSTRAINT meta_table_description_pkey PRIMARY KEY (id);


--
-- Name: metadata metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.metadata
    ADD CONSTRAINT metadata_pkey PRIMARY KEY (id);


--
-- Name: organization_identifier organization_identifier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_identifier
    ADD CONSTRAINT organization_identifier_pkey PRIMARY KEY (id);


--
-- Name: organization organization_normalized_name_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_normalized_name_unique UNIQUE (normalized_name);


--
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (id);


--
-- Name: organization_source organization_source_organization_id_scraper_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_source
    ADD CONSTRAINT organization_source_organization_id_scraper_id_key UNIQUE (organization_id, scraper_id);


--
-- Name: organization_source organization_source_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_source
    ADD CONSTRAINT organization_source_pkey PRIMARY KEY (id);


--
-- Name: phone phone_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_pkey PRIMARY KEY (id);


--
-- Name: program program_organization_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_organization_id_key UNIQUE (organization_id);


--
-- Name: program program_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_pkey PRIMARY KEY (id);


--
-- Name: reconciler_config reconciler_config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reconciler_config
    ADD CONSTRAINT reconciler_config_pkey PRIMARY KEY (key);


--
-- Name: reconciler_constraint_violations reconciler_constraint_violations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reconciler_constraint_violations
    ADD CONSTRAINT reconciler_constraint_violations_pkey PRIMARY KEY (id);


--
-- Name: record_version record_version_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.record_version
    ADD CONSTRAINT record_version_pkey PRIMARY KEY (id);


--
-- Name: record_version record_version_record_id_version_num_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.record_version
    ADD CONSTRAINT record_version_record_id_version_num_key UNIQUE (record_id, version_num);


--
-- Name: required_document required_document_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.required_document
    ADD CONSTRAINT required_document_pkey PRIMARY KEY (id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: service_area service_area_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_area
    ADD CONSTRAINT service_area_pkey PRIMARY KEY (id);


--
-- Name: service_at_location service_at_location_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_at_location
    ADD CONSTRAINT service_at_location_pkey PRIMARY KEY (id);


--
-- Name: service_capacity service_capacity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_capacity
    ADD CONSTRAINT service_capacity_pkey PRIMARY KEY (id);


--
-- Name: service service_name_organization_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_name_organization_unique UNIQUE (name, organization_id);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (id);


--
-- Name: service_source service_source_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_source
    ADD CONSTRAINT service_source_pkey PRIMARY KEY (id);


--
-- Name: service_source service_source_service_id_scraper_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_source
    ADD CONSTRAINT service_source_service_id_scraper_id_key UNIQUE (service_id, scraper_id);


--
-- Name: taxonomy taxonomy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomy
    ADD CONSTRAINT taxonomy_pkey PRIMARY KEY (id);


--
-- Name: taxonomy_term taxonomy_term_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomy_term
    ADD CONSTRAINT taxonomy_term_code_key UNIQUE (code);


--
-- Name: taxonomy_term taxonomy_term_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomy_term
    ADD CONSTRAINT taxonomy_term_pkey PRIMARY KEY (id);


--
-- Name: unit unit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.unit
    ADD CONSTRAINT unit_pkey PRIMARY KEY (id);


--
-- Name: url url_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_pkey PRIMARY KEY (id);


--
-- Name: idx_location_coords; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_location_coords ON public.location USING gist (public.st_setsrid(public.st_makepoint((longitude)::double precision, (latitude)::double precision), 4326));


--
-- Name: idx_record_version_created; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_record_version_created ON public.record_version USING btree (created_at);


--
-- Name: idx_record_version_record; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_record_version_record ON public.record_version USING btree (record_id);


--
-- Name: idx_record_version_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_record_version_type ON public.record_version USING btree (record_type);


--
-- Name: location_coordinates_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX location_coordinates_idx ON public.location USING gist (point((longitude)::double precision, (latitude)::double precision));


--
-- Name: location_source_location_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX location_source_location_id_idx ON public.location_source USING btree (location_id);


--
-- Name: location_source_location_scraper_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX location_source_location_scraper_idx ON public.location_source USING btree (location_id, scraper_id);


--
-- Name: location_source_scraper_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX location_source_scraper_id_idx ON public.location_source USING btree (scraper_id);


--
-- Name: organization_normalized_name_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX organization_normalized_name_idx ON public.organization USING btree (normalized_name);


--
-- Name: organization_source_org_scraper_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX organization_source_org_scraper_idx ON public.organization_source USING btree (organization_id, scraper_id);


--
-- Name: organization_source_organization_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX organization_source_organization_id_idx ON public.organization_source USING btree (organization_id);


--
-- Name: organization_source_scraper_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX organization_source_scraper_id_idx ON public.organization_source USING btree (scraper_id);


--
-- Name: reconciler_violations_created_at_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reconciler_violations_created_at_idx ON public.reconciler_constraint_violations USING btree (created_at);


--
-- Name: reconciler_violations_resolved_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX reconciler_violations_resolved_idx ON public.reconciler_constraint_violations USING btree (resolved, created_at);


--
-- Name: record_version_source_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX record_version_source_id_idx ON public.record_version USING btree (source_id);


--
-- Name: service_name_organization_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX service_name_organization_idx ON public.service USING btree (name, organization_id);


--
-- Name: service_organization_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX service_organization_id_idx ON public.service USING btree (organization_id) WHERE (organization_id IS NOT NULL);


--
-- Name: service_source_scraper_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX service_source_scraper_id_idx ON public.service_source USING btree (scraper_id);


--
-- Name: service_source_service_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX service_source_service_id_idx ON public.service_source USING btree (service_id);


--
-- Name: service_source_service_scraper_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX service_source_service_scraper_idx ON public.service_source USING btree (service_id, scraper_id);


--
-- Name: organization organization_normalize_name_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER organization_normalize_name_trigger BEFORE INSERT OR UPDATE OF name ON public.organization FOR EACH ROW EXECUTE FUNCTION public.update_organization_normalized_name();


--
-- Name: location_source update_canonical_location_trigger; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER update_canonical_location_trigger AFTER INSERT OR UPDATE ON public.location_source FOR EACH ROW EXECUTE FUNCTION public.update_canonical_location();


--
-- Name: accessibility accessibility_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accessibility
    ADD CONSTRAINT accessibility_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: address address_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: attribute attribute_taxonomy_term_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_taxonomy_term_id_fkey FOREIGN KEY (taxonomy_term_id) REFERENCES public.taxonomy_term(id);


--
-- Name: contact contact_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: contact contact_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: contact contact_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: contact contact_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: cost_option cost_option_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cost_option
    ADD CONSTRAINT cost_option_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: funding funding_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: funding funding_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.funding
    ADD CONSTRAINT funding_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: language language_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: language language_phone_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_phone_id_fkey FOREIGN KEY (phone_id) REFERENCES public.phone(id);


--
-- Name: language language_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: location location_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: location_source location_source_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.location_source
    ADD CONSTRAINT location_source_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: organization_identifier organization_identifier_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_identifier
    ADD CONSTRAINT organization_identifier_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: organization_source organization_source_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_source
    ADD CONSTRAINT organization_source_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: organization_source organization_source_parent_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organization_source
    ADD CONSTRAINT organization_source_parent_organization_id_fkey FOREIGN KEY (parent_organization_id) REFERENCES public.organization(id);


--
-- Name: phone phone_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.contact(id);


--
-- Name: phone phone_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: phone phone_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: phone phone_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: phone phone_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.phone
    ADD CONSTRAINT phone_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: program program_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.program
    ADD CONSTRAINT program_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: required_document required_document_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.required_document
    ADD CONSTRAINT required_document_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: schedule schedule_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: schedule schedule_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: schedule schedule_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_area service_area_service_at_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_area
    ADD CONSTRAINT service_area_service_at_location_id_fkey FOREIGN KEY (service_at_location_id) REFERENCES public.service_at_location(id);


--
-- Name: service_area service_area_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_area
    ADD CONSTRAINT service_area_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_at_location service_at_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_at_location
    ADD CONSTRAINT service_at_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(id);


--
-- Name: service_at_location service_at_location_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_at_location
    ADD CONSTRAINT service_at_location_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_capacity service_capacity_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_capacity
    ADD CONSTRAINT service_capacity_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: service_capacity service_capacity_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_capacity
    ADD CONSTRAINT service_capacity_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.unit(id);


--
-- Name: service service_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: service service_program_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_program_id_fkey FOREIGN KEY (program_id) REFERENCES public.program(id);


--
-- Name: service_source service_source_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_source
    ADD CONSTRAINT service_source_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: service_source service_source_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_source
    ADD CONSTRAINT service_source_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- Name: taxonomy_term taxonomy_term_taxonomy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.taxonomy_term
    ADD CONSTRAINT taxonomy_term_taxonomy_id_fkey FOREIGN KEY (taxonomy_id) REFERENCES public.taxonomy(id);


--
-- Name: url url_organization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES public.organization(id);


--
-- Name: url url_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.url
    ADD CONSTRAINT url_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(id);


--
-- PostgreSQL database dump complete
--

