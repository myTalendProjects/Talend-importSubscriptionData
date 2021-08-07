--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5

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
-- Name: brand_p_offer_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.brand_p_offer_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    insert into brand_p_offer values (NEW.brand_id, unnest(NEW.p_offer_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.brand_p_offer_insert() OWNER TO postgres;

--
-- Name: brand_p_offer_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.brand_p_offer_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    delete from brand_p_offer where brand_id=NEW.brand_id;
    insert into brand_p_offer values (NEW.brand_id, unnest(NEW.p_offer_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.brand_p_offer_update() OWNER TO postgres;

--
-- Name: device_list_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.device_list_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    insert into device_list values (NEW.device_bl_id, unnest(NEW.device_model_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.device_list_insert() OWNER TO postgres;

--
-- Name: device_list_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.device_list_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    delete from device_list where device_bl_id=NEW.device_bl_id;
    insert into device_list values (NEW.device_bl_id, unnest(NEW.device_model_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.device_list_update() OWNER TO postgres;

--
-- Name: errorcode_list_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.errorcode_list_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    insert into errorcode_list values (NEW.p_errorcode_id, unnest(NEW.errorcode_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.errorcode_list_insert() OWNER TO postgres;

--
-- Name: errorcode_list_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.errorcode_list_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    delete from errorcode_list where p_errorcode_id=NEW.p_errorcode_id;
    insert into errorcode_list values (NEW.p_errorcode_id, unnest(NEW.errorcode_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.errorcode_list_update() OWNER TO postgres;

--
-- Name: product_svc_fk_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.product_svc_fk_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    insert into product_svc_fk values (NEW.product_id, unnest(NEW.service_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.product_svc_fk_insert() OWNER TO postgres;

--
-- Name: product_svc_fk_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.product_svc_fk_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    delete from product_svc_fk where product_id=NEW.product_id;
    insert into product_svc_fk values (NEW.product_id, unnest(NEW.service_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.product_svc_fk_update() OWNER TO postgres;

--
-- Name: provisioning_default_provisioning_fk_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.provisioning_default_provisioning_fk_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    insert into provisioning_default_provisioning_fk values (NEW.default_provisioning_id, unnest(NEW.endpoint_name_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.provisioning_default_provisioning_fk_insert() OWNER TO postgres;

--
-- Name: provisioning_default_provisioning_fk_update(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.provisioning_default_provisioning_fk_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  begin
    delete from provisioning_default_provisioning_fk where default_provisioning_id=NEW.default_provisioning_id;
    insert into provisioning_default_provisioning_fk values (NEW.default_provisioning_id, unnest(NEW.endpoint_name_list));
    return NEW;
  end;
$$;


ALTER FUNCTION public.provisioning_default_provisioning_fk_update() OWNER TO postgres;

--
-- Name: brand_p_offer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand_p_offer (
    brand_id integer NOT NULL,
    p_offer_id integer NOT NULL
);


ALTER TABLE public.brand_p_offer OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(50),
    category_parent_code character varying(50),
    category_code character varying(50),
    operator_id integer,
    order_position integer,
    status smallint DEFAULT 1
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- Name: channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channel (
    id integer NOT NULL,
    channel_name character varying(50),
    channel_code integer
);


ALTER TABLE public.channel OWNER TO postgres;

--
-- Name: channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.channel_id_seq OWNER TO postgres;

--
-- Name: channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.channel_id_seq OWNED BY public.channel.id;


--
-- Name: charging_error_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.charging_error_code (
    error_code_id integer NOT NULL,
    operator_id integer,
    error_code character varying(4),
    error_type smallint,
    tmp_bl_duration integer,
    description character varying(255),
    duration_type smallint
);


ALTER TABLE public.charging_error_code OWNER TO postgres;

--
-- Name: charging_error_code_error_code_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.charging_error_code_error_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.charging_error_code_error_code_id_seq OWNER TO postgres;

--
-- Name: charging_error_code_error_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.charging_error_code_error_code_id_seq OWNED BY public.charging_error_code.error_code_id;


--
-- Name: default_provisioning; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.default_provisioning (
    default_provisioning_id integer NOT NULL,
    operator_id integer,
    partner_id integer,
    subscription_action integer,
    endpoint_type smallint,
    endpoint_name_list integer[] NOT NULL,
    provision_type integer
);


ALTER TABLE public.default_provisioning OWNER TO postgres;

--
-- Name: default_provisioning_default_provisioning_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.default_provisioning_default_provisioning_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.default_provisioning_default_provisioning_id_seq OWNER TO postgres;

--
-- Name: default_provisioning_default_provisioning_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.default_provisioning_default_provisioning_id_seq OWNED BY public.default_provisioning.default_provisioning_id;


--
-- Name: device_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_list (
    device_bl_id integer,
    device_model_id integer NOT NULL
);


ALTER TABLE public.device_list OWNER TO postgres;

--
-- Name: device_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_model (
    device_model_id integer NOT NULL,
    operator_id integer,
    device_model_name character varying(150),
    device_model_code character varying(50),
    description character varying(200)
);


ALTER TABLE public.device_model OWNER TO postgres;

--
-- Name: device_model_device_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_model_device_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_model_device_model_id_seq OWNER TO postgres;

--
-- Name: device_model_device_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_model_device_model_id_seq OWNED BY public.device_model.device_model_id;


--
-- Name: general_configuration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.general_configuration (
    param_name character varying(50) NOT NULL,
    param_value character varying(50),
    param_description character varying(150)
);


ALTER TABLE public.general_configuration OWNER TO postgres;

--
-- Name: network; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.network (
    id integer NOT NULL,
    network_name character varying(50),
    network_code integer
);


ALTER TABLE public.network OWNER TO postgres;

--
-- Name: network_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.network_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.network_id_seq OWNER TO postgres;

--
-- Name: network_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.network_id_seq OWNED BY public.network.id;


--
-- Name: price_plan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_plan (
    price_id integer NOT NULL,
    price_name character varying(50),
    price_plan_type integer,
    price_schema_type integer,
    price_serv_cont_type integer,
    price_charge_type integer,
    price_sub_proration smallint,
    price_renew_proration smallint,
    price_sub_amount numeric(12,4),
    price_renew_tariff integer,
    price_sub_tariff integer,
    price_renew_amount numeric(12,4),
    price_rental_type integer,
    price_day_of_month integer,
    price_calendar_type character varying(20),
    price_micro_charge json,
    price_valid_period numeric,
    price_installments integer,
    price_grace_period integer,
    price_suspend_period integer,
    price_renewal_rem_scheme character varying(25),
    operator_id integer,
    partner_id integer,
    price_created_by character varying(50),
    price_created_dttm timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0),
    price_updated_by character varying(50) DEFAULT NULL::character varying,
    price_updated_dttm timestamp without time zone
);


ALTER TABLE public.price_plan OWNER TO postgres;

--
-- Name: price_plan_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.price_plan_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_plan_price_id_seq OWNER TO postgres;

--
-- Name: price_plan_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.price_plan_price_id_seq OWNED BY public.price_plan.price_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(50),
    operator_id integer,
    partner_id integer,
    service_type integer,
    service_list integer[],
    product_gen_desc character varying(255),
    order_position integer,
    status smallint DEFAULT 1
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    category_id integer NOT NULL,
    product_id integer NOT NULL,
    product_order_position integer,
    product_status smallint DEFAULT 1
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO postgres;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: product_svc_fk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_svc_fk (
    product_id integer NOT NULL,
    service_id integer NOT NULL
);


ALTER TABLE public.product_svc_fk OWNER TO postgres;

--
-- Name: provisioning; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provisioning (
    provisioning_id integer NOT NULL,
    operator_id integer,
    partner_id integer,
    group_id integer,
    provisioning_type smallint,
    endpoint_name character varying(50),
    endpoint_group character varying(50),
    endpoint_url character varying(200),
    endpoint_type smallint,
    username character varying(50),
    password character varying(200)
);


ALTER TABLE public.provisioning OWNER TO postgres;

--
-- Name: provisioning_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provisioning_class (
    class_name character varying(30) NOT NULL,
    group_id integer[]
);


ALTER TABLE public.provisioning_class OWNER TO postgres;

--
-- Name: provisioning_default_provisioning_fk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provisioning_default_provisioning_fk (
    default_provisioning_id integer NOT NULL,
    provisioning_id integer NOT NULL
);


ALTER TABLE public.provisioning_default_provisioning_fk OWNER TO postgres;

--
-- Name: provisioning_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provisioning_group (
    group_id integer NOT NULL,
    group_name character varying(50),
    group_code character varying(30),
    endpoint_type smallint,
    data text
);


ALTER TABLE public.provisioning_group OWNER TO postgres;

--
-- Name: provisioning_provisioning_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provisioning_provisioning_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provisioning_provisioning_id_seq OWNER TO postgres;

--
-- Name: provisioning_provisioning_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provisioning_provisioning_id_seq OWNED BY public.provisioning.provisioning_id;


--
-- Name: service; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service (
    service_id integer NOT NULL,
    service_name character varying(200),
    service_code character varying(50),
    service_short_code character varying(5),
    operator_id integer,
    partner_id integer,
    chk_gbl_sub_bl smallint,
    chk_gbl_cha_bl smallint,
    chk_tmp_cha_bl smallint,
    service_type integer,
    service_mode integer,
    content_mode integer,
    service_sub_cont_serv smallint,
    service_chk_sub_state smallint,
    service_chrg_type integer,
    service_manage_sub smallint,
    service_max_amount numeric(16,8),
    service_min_amount numeric(16,8),
    service_subs_consent smallint,
    service_sub_cycle_provision smallint,
    service_sub_admin_provision smallint,
    service_serv_admin_provision smallint,
    service_description character varying(30),
    service_gen_description character varying(255),
    service_resub_barred_period integer,
    service_status smallint,
    service_category integer,
    service_channel jsonb[],
    service_price_plan integer,
    last_park_date timestamp without time zone,
    last_unpark_date timestamp without time zone,
    renewal_priority integer,
    service_renewal_consent smallint,
    service_alias character varying(8)
);


ALTER TABLE public.service OWNER TO postgres;

--
-- Name: service_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_message (
    service_id integer,
    message_type integer,
    message_lang integer,
    message_content text,
    message_channel integer,
    message_status smallint
);


ALTER TABLE public.service_message OWNER TO postgres;

--
-- Name: service_provision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_provision (
    id integer NOT NULL,
    service_id integer,
    provision_type integer,
    provision_cycle integer,
    provision_data_id integer,
    provision_url_data character varying(150)
);


ALTER TABLE public.service_provision OWNER TO postgres;

--
-- Name: service_provision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_provision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_provision_id_seq OWNER TO postgres;

--
-- Name: service_provision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_provision_id_seq OWNED BY public.service_provision.id;


--
-- Name: service_service_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_service_id_seq OWNER TO postgres;

--
-- Name: service_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_service_id_seq OWNED BY public.service.service_id;


--
-- Name: service_tariff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_tariff (
    service_id integer NOT NULL,
    tariff_id integer NOT NULL
);


ALTER TABLE public.service_tariff OWNER TO postgres;

--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    status integer,
    status_name character varying(20)
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: subscriber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber (
    subscriber_id integer NOT NULL,
    msisdn character varying(20),
    operator_id integer,
    cus_type smallint,
    pref_lang character varying(3),
    sub_status_id integer,
    status_detail_id integer,
    p_offer_id integer,
    brand_id integer,
    loyalty_id integer,
    category_id integer,
    device_model_id integer,
    subscribed_dttm timestamp without time zone,
    activated_dttm timestamp without time zone,
    expiry_dttm timestamp without time zone
);


ALTER TABLE public.subscriber OWNER TO postgres;

--
-- Name: subscriber_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber_brand (
    brand_id integer NOT NULL,
    brand_name character varying(50),
    operator_id integer,
    ngbss_brand character varying(50),
    p_offer_list integer[],
    description character varying(150)
);


ALTER TABLE public.subscriber_brand OWNER TO postgres;

--
-- Name: subscriber_brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_brand_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_brand_brand_id_seq OWNER TO postgres;

--
-- Name: subscriber_brand_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_brand_brand_id_seq OWNED BY public.subscriber_brand.brand_id;


--
-- Name: subscriber_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber_category (
    category_id integer NOT NULL,
    category_name character varying(50),
    operator_id integer,
    ngbss_category character varying(50),
    description character varying(50)
);


ALTER TABLE public.subscriber_category OWNER TO postgres;

--
-- Name: subscriber_category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_category_category_id_seq OWNER TO postgres;

--
-- Name: subscriber_category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_category_category_id_seq OWNED BY public.subscriber_category.category_id;


--
-- Name: subscriber_loyalty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber_loyalty (
    loyalty_id integer NOT NULL,
    loyalty_name character varying(50),
    operator_id integer,
    ngbss_loyalty character varying(50),
    description character varying(150)
);


ALTER TABLE public.subscriber_loyalty OWNER TO postgres;

--
-- Name: subscriber_loyalty_loyalty_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_loyalty_loyalty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_loyalty_loyalty_id_seq OWNER TO postgres;

--
-- Name: subscriber_loyalty_loyalty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_loyalty_loyalty_id_seq OWNED BY public.subscriber_loyalty.loyalty_id;


--
-- Name: subscriber_primary_offer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber_primary_offer (
    p_offer_id integer NOT NULL,
    p_offer_name character varying(50),
    operator_id integer,
    ngbss_p_offer character varying(50),
    description character varying(150),
    cus_type smallint
);


ALTER TABLE public.subscriber_primary_offer OWNER TO postgres;

--
-- Name: subscriber_primary_offer_p_offer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_primary_offer_p_offer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_primary_offer_p_offer_id_seq OWNER TO postgres;

--
-- Name: subscriber_primary_offer_p_offer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_primary_offer_p_offer_id_seq OWNED BY public.subscriber_primary_offer.p_offer_id;


--
-- Name: subscriber_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber_status (
    status_id integer NOT NULL,
    status_name character varying(50),
    operator_id integer,
    ngbss_status character varying(50),
    description character varying(150)
);


ALTER TABLE public.subscriber_status OWNER TO postgres;

--
-- Name: subscriber_status_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber_status_detail (
    status_details_id integer NOT NULL,
    status_details_name character varying(50),
    operator_id integer,
    ngbss_status_details character varying(50),
    description character varying(150)
);


ALTER TABLE public.subscriber_status_detail OWNER TO postgres;

--
-- Name: subscriber_status_details_status_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_status_details_status_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_status_details_status_details_id_seq OWNER TO postgres;

--
-- Name: subscriber_status_details_status_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_status_details_status_details_id_seq OWNED BY public.subscriber_status_detail.status_details_id;


--
-- Name: subscriber_status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_status_status_id_seq OWNER TO postgres;

--
-- Name: subscriber_status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_status_status_id_seq OWNED BY public.subscriber_status.status_id;


--
-- Name: subscriber_subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_subscriber_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_subscriber_id_seq OWNER TO postgres;

--
-- Name: subscriber_subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_subscriber_id_seq OWNED BY public.subscriber.subscriber_id;


--
-- Name: subscriber_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber_type (
    id integer NOT NULL,
    sub_type_name character varying(50),
    sub_type_code integer,
    tax_precentage numeric(12,4),
    tax_msg character varying(50)
);


ALTER TABLE public.subscriber_type OWNER TO postgres;

--
-- Name: subscriber_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_type_id_seq OWNER TO postgres;

--
-- Name: subscriber_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_type_id_seq OWNED BY public.subscriber_type.id;


--
-- Name: subscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription (
    id integer NOT NULL,
    sub_id integer,
    msisdn character varying(20),
    service_id integer,
    subscribed_dttm timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0),
    expire_dttm timestamp without time zone,
    status smallint,
    admin_status smallint DEFAULT 1,
    group_id bigint DEFAULT 0,
    is_primary smallint DEFAULT 1,
    renew_check smallint DEFAULT 0,
    suspended_date timestamp without time zone,
    retry_cycle smallint DEFAULT 0,
    pref_lang character varying(4),
    partner_id integer,
    category_id integer,
    unsubscribed_date timestamp without time zone,
    data jsonb,
    reminder_date timestamp without time zone
);


ALTER TABLE public.subscription OWNER TO postgres;

--
-- Name: subscription_count; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.subscription_count AS
 SELECT service.service_id,
    service.service_name,
    service.service_code,
    service.service_short_code,
    service.operator_id,
    service.partner_id,
    service.chk_gbl_sub_bl,
    service.chk_gbl_cha_bl,
    service.chk_tmp_cha_bl,
    service.service_type,
    service.service_mode,
    service.content_mode,
    service.service_sub_cont_serv,
    service.service_chk_sub_state,
    service.service_chrg_type,
    service.service_manage_sub,
    service.service_max_amount,
    service.service_min_amount,
    service.service_subs_consent,
    service.service_sub_cycle_provision,
    service.service_sub_admin_provision,
    service.service_serv_admin_provision,
    service.service_description,
    service.service_gen_description,
    service.service_resub_barred_period,
    service.service_status,
    service.service_category,
    service.service_channel,
    service.service_price_plan,
    service.last_park_date,
    service.last_unpark_date,
    service.renewal_priority,
    service.service_renewal_consent
   FROM public.service;


ALTER TABLE public.subscription_count OWNER TO postgres;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscription_id_seq OWNER TO postgres;

--
-- Name: subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscription_id_seq OWNED BY public.subscription.id;


--
-- Name: tariff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tariff (
    tariff_id integer NOT NULL,
    tariff_vasp_id character varying(50),
    tariff_ngbss_id character varying(50),
    tariff_price_value numeric(16,8),
    tariff_description character varying(150),
    operator_id integer NOT NULL,
    tariff_created_by character varying(50),
    tariff_created_dttm timestamp without time zone DEFAULT CURRENT_TIMESTAMP(0),
    tariff_updated_by character varying(50) DEFAULT NULL::character varying,
    tariff_updated_dttm timestamp without time zone
);


ALTER TABLE public.tariff OWNER TO postgres;

--
-- Name: tariff_tariff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tariff_tariff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tariff_tariff_id_seq OWNER TO postgres;

--
-- Name: tariff_tariff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tariff_tariff_id_seq OWNED BY public.tariff.tariff_id;


--
-- Name: user_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_options (
    id integer NOT NULL,
    key_name character varying(25) NOT NULL,
    accept_or_reject smallint NOT NULL
);


ALTER TABLE public.user_options OWNER TO postgres;

--
-- Name: user_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_options_id_seq OWNER TO postgres;

--
-- Name: user_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_options_id_seq OWNED BY public.user_options.id;


--
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- Name: channel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel ALTER COLUMN id SET DEFAULT nextval('public.channel_id_seq'::regclass);


--
-- Name: charging_error_code error_code_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_error_code ALTER COLUMN error_code_id SET DEFAULT nextval('public.charging_error_code_error_code_id_seq'::regclass);


--
-- Name: default_provisioning default_provisioning_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_provisioning ALTER COLUMN default_provisioning_id SET DEFAULT nextval('public.default_provisioning_default_provisioning_id_seq'::regclass);


--
-- Name: device_model device_model_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_model ALTER COLUMN device_model_id SET DEFAULT nextval('public.device_model_device_model_id_seq'::regclass);


--
-- Name: network id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.network ALTER COLUMN id SET DEFAULT nextval('public.network_id_seq'::regclass);


--
-- Name: price_plan price_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_plan ALTER COLUMN price_id SET DEFAULT nextval('public.price_plan_price_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: provisioning provisioning_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning ALTER COLUMN provisioning_id SET DEFAULT nextval('public.provisioning_provisioning_id_seq'::regclass);


--
-- Name: service service_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service ALTER COLUMN service_id SET DEFAULT nextval('public.service_service_id_seq'::regclass);


--
-- Name: service_provision id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_provision ALTER COLUMN id SET DEFAULT nextval('public.service_provision_id_seq'::regclass);


--
-- Name: subscriber subscriber_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber ALTER COLUMN subscriber_id SET DEFAULT nextval('public.subscriber_subscriber_id_seq'::regclass);


--
-- Name: subscriber_brand brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_brand ALTER COLUMN brand_id SET DEFAULT nextval('public.subscriber_brand_brand_id_seq'::regclass);


--
-- Name: subscriber_category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_category ALTER COLUMN category_id SET DEFAULT nextval('public.subscriber_category_category_id_seq'::regclass);


--
-- Name: subscriber_loyalty loyalty_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_loyalty ALTER COLUMN loyalty_id SET DEFAULT nextval('public.subscriber_loyalty_loyalty_id_seq'::regclass);


--
-- Name: subscriber_primary_offer p_offer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_primary_offer ALTER COLUMN p_offer_id SET DEFAULT nextval('public.subscriber_primary_offer_p_offer_id_seq'::regclass);


--
-- Name: subscriber_status status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status ALTER COLUMN status_id SET DEFAULT nextval('public.subscriber_status_status_id_seq'::regclass);


--
-- Name: subscriber_status_detail status_details_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status_detail ALTER COLUMN status_details_id SET DEFAULT nextval('public.subscriber_status_details_status_details_id_seq'::regclass);


--
-- Name: subscriber_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_type ALTER COLUMN id SET DEFAULT nextval('public.subscriber_type_id_seq'::regclass);


--
-- Name: subscription id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription ALTER COLUMN id SET DEFAULT nextval('public.subscription_id_seq'::regclass);


--
-- Name: tariff tariff_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff ALTER COLUMN tariff_id SET DEFAULT nextval('public.tariff_tariff_id_seq'::regclass);


--
-- Name: user_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_options ALTER COLUMN id SET DEFAULT nextval('public.user_options_id_seq'::regclass);


--
-- Data for Name: brand_p_offer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand_p_offer (brand_id, p_offer_id) FROM stdin;
1	1
7	1
7	2
7	4
9	1
11	1
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, category_name, category_parent_code, category_code, operator_id, order_position, status) FROM stdin;
82	dxfx dg dfg	0102	010201	2	1	1
78	dsadafds asfds	04	0401	2	1	1
81	zesrsrs	0101	010101	2	1	1
163	SAKU444	null	0B	2	11	1
164	SAKU4444	0B	0B01	2	1	1
165	SUBSAKU444	0B01	0B0101	2	1	1
166	HelloMate	0B	0B02	2	2	1
167	test	null	0C	2	12	1
168	ggggggggggggg	null	0D	2	13	1
169	Noncontent	null	0E	2	14	1
79	asaas	01	0101	2	1	1
80	ddfsfsdf	01	0102	2	2	1
86	akwka	null	01	1	4	0
87	akwkgha	null	02	1	3	0
88	akddgha	null	03	1	1	0
89	akffwka	null	04	1	2	0
94	Testing	0301	030101	2	1	1
123	1	06	0601	2	1	1
77	dsadaasd	03	0301	2	1	1
124	2	06	0602	2	2	1
126	4	06	0604	2	4	1
127	5	06	0605	2	5	1
129	11	0605	060501	2	1	1
130	12	0605	060502	2	2	1
131	13	0605	060503	2	3	1
133	6	06	0606	2	6	1
134	7	06	0607	2	7	1
138	9	06	0609	2	9	1
75	jh hk	02	0201	2	2	1
90	srtfyg	02	0202	2	1	1
99	dfghjkgg	02	0206	2	4	1
140	15	0604	060401	2	1	1
141	16	0604	060402	2	2	1
142	17	0604	060403	2	3	1
144	19	0604	060405	2	5	1
145	20	0604	060406	2	6	1
146	21	0609	060901	2	1	1
147	aaaaaa	05	0501	2	1	1
149	cccc	05	0503	2	3	1
150	dd	05	0504	2	4	1
151	dddd	05	0505	2	5	1
153	eeeee	05	0506	2	6	1
154	fff	05	0507	2	7	1
155	gg	05	0508	2	8	1
157	fffugk	05	0502	2	9	1
162	18	0604	060404	2	7	1
67	test1235456	null	01	2	1	0
69	test12354567	null	02	2	2	1
70	test123545678768	null	03	2	3	1
72	dssads sdfdsf	null	04	2	4	1
73	sds dfdsf	null	05	2	5	1
74	sdb sd fdvd vs	null	06	2	6	1
76	kjhl hljkhkl	null	07	2	7	1
159	testcode2	null	0A	2	8	1
160	werjhfberjh	null	09	2	9	1
161	jhbkvc	null	08	2	10	1
\.


--
-- Data for Name: channel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channel (id, channel_name, channel_code) FROM stdin;
1	sms	104
2	ussd	103
3	ivr	106
4	external	105
\.


--
-- Data for Name: charging_error_code; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.charging_error_code (error_code_id, operator_id, error_code, error_type, tmp_bl_duration, description, duration_type) FROM stdin;
2	2	6000	165	20	tset	602
3	2	4547	165	1	Add Temporary blacklist	603
5	2	1242	166	0	Test	0
\.


--
-- Data for Name: default_provisioning; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.default_provisioning (default_provisioning_id, operator_id, partner_id, subscription_action, endpoint_type, endpoint_name_list, provision_type) FROM stdin;
9	1	\N	154	169	{105,108}	180
8	1	2	150	169	{111,112}	180
5	1	\N	150	169	{105,108,107,109}	180
11	2	\N	161	172	{107,105,104}	180
12	2	2	161	172	{113}	181
13	2	\N	155	172	{107,105}	180
14	2	2	156	171	{110}	181
17	2	\N	158	172	{113}	180
18	2	\N	146	172	{108}	180
\.


--
-- Data for Name: device_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_list (device_bl_id, device_model_id) FROM stdin;
1	2
1	3
1	4
2	2
3	1
4	1
5	1
6	1
7	1
10	42
11	3
12	2
14	2
14	3
14	4
14	5
14	6
14	39
14	40
14	1
14	42
14	43
15	1
15	45
16	1
17	1
17	47
17	45
18	49
21	49
22	49
22	47
24	49
24	48
27	47
\.


--
-- Data for Name: device_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_model (device_model_id, operator_id, device_model_name, device_model_code, description) FROM stdin;
45	2	2	4444	Test
47	2	Mydevice	100	null
1	2	test4	DC001	test subscription
48	2	test3	DC002	test
49	2	test	test	test
50	2	Xiaomi M1906G7I/Xiaomi Redmi Note 8 PRO	Xiaomi M1906G7I/Xiaomi Redmi Note 8 PRO	Xiaomi M1906G7I/Xiaomi Redmi Note 8 PRO
\.


--
-- Data for Name: general_configuration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.general_configuration (param_name, param_value, param_description) FROM stdin;
dnd_blackout_from	2020-12-11 15:38:34	test
dnd_blackout_to	2020-12-11 15:38:34	test
msg_timeout_time	180	test
retry_count	3	\N
session_info_expiry_time	10	test
default_consent_channel	sms	Default consent channel
refund_expire_time	3600	refund expire time
default_consent_request_en	Send consent request	default consent request
default_consent_request_ne	सहमति अनुरोध पठाउनुहोस्	default consent request
trial_exp_days	5	trial expiry days
\.


--
-- Data for Name: network; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.network (id, network_name, network_code) FROM stdin;
1	gsm	1
2	2g	2
3	3g	3
4	4g	4
5	5g	5
\.


--
-- Data for Name: price_plan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_plan (price_id, price_name, price_plan_type, price_schema_type, price_serv_cont_type, price_charge_type, price_sub_proration, price_renew_proration, price_sub_amount, price_renew_tariff, price_sub_tariff, price_renew_amount, price_rental_type, price_day_of_month, price_calendar_type, price_micro_charge, price_valid_period, price_installments, price_grace_period, price_suspend_period, price_renewal_rem_scheme, operator_id, partner_id, price_created_by, price_created_dttm, price_updated_by, price_updated_dttm) FROM stdin;
274	AmboooMataBariyoo	101	115	112	121	\N	\N	500.0000	\N	\N	\N	\N	\N	\N	\N	3	\N	0	0	\N	2	2	admin	2021-06-25 12:40:54	\N	\N
114	STestPrice2	101	115	112	120	\N	\N	\N	\N	12	\N	\N	\N	\N	\N	1	\N	0	0	\N	2	2	admin	2021-02-24 15:56:20	\N	\N
145	OneTimeTariff4	101	115	112	120	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	14	\N	0	0	\N	2	2	admin	2021-03-02 10:33:26	\N	\N
127	STestPrice4	101	113	112	121	0	0	10.0000	\N	\N	20.0000	132	24	en	{"price_micro_charge":[{"days":5,"amount":10}]}	0	\N	0	0	1	2	2	admin	2021-02-25 14:01:13	\N	\N
253	tydrytfgy	100	116	1	121	0	0	\N	\N	\N	11.0000	134	1	en	{"price_micro_charge":[]}	\N	\N	0	0	2	2	3	admin	2021-03-24 12:56:19	\N	\N
113	STestPrice1	101	113	112	121	0	1	10.0000	\N	\N	10.0000	130	5	en	{"price_micro_charge":[]}	0	\N	5	3	3	2	2	admin	2021-02-24 15:50:07	\N	\N
266	Nomaga Sewaa	101	113	112	121	0	0	400.0000	\N	\N	500.0000	136	\N	\N	\N	5	\N	0	0	3	2	2	admin	2021-04-28 12:50:18	\N	\N
269	TestInsta	101	114	112	121	\N	\N	123.0000	\N	\N	\N	\N	\N	\N	\N	3	3	3	2	2	2	2	admin	2021-06-11 12:24:58	\N	\N
193	kau3652	100	116	112	121	0	1	\N	\N	\N	456.0000	134	1	en	{"price_micro_charge":[{"days":12,"amount":12}]}	\N	\N	0	0	1	2	3	admin	2021-03-04 15:04:07	\N	\N
199	aabbaa	100	116	112	121	0	0	\N	\N	\N	123.0000	132	\N	\N	{"price_micro_charge":[{"days":12,"amount":12}]}	\N	\N	0	0	2	2	2	admin	2021-03-04 16:05:51	\N	\N
203	install_plan2	101	114	112	121	\N	\N	4.0000	\N	\N	\N	\N	\N	\N	\N	20	5	0	0	2	2	2	admin	2021-03-04 17:19:15	\N	\N
275	testvalperiod	101	113	112	120	0	0	\N	17	17	\N	136	\N	\N	\N	100	\N	30	30	1	2	2	admin	2021-07-07 10:40:04	\N	\N
254	testbuddi	101	115	112	121	\N	\N	45.0000	\N	\N	\N	\N	\N	\N	\N	5	\N	0	0	\N	2	2	sanjeevie	2021-03-24 18:51:06	\N	\N
258	testgihanKau	101	113	112	120	0	0	\N	\N	\N	\N	133	\N	\N	\N	0	\N	0	0	3	2	3	sherantha	2021-03-03 17:13:07	\N	\N
256	VimukthiTarrif1	101	114	112	120	\N	\N	\N	\N	19	\N	\N	\N	\N	\N	12	12	12	12	1	2	3	sherantha	2021-03-15 15:03:07	\N	\N
257	VimukthiTarrif	101	115	112	120	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	12	\N	0	0	\N	2	3	sherantha	2021-03-15 15:01:53	\N	\N
267	con_plan	100	116	1	121	0	0	10.0000	\N	\N	5.0000	131	\N	\N	\N	\N	\N	0	0	1	2	2	admin	2021-04-29 16:58:18	\N	\N
268	testCustom	101	113	112	121	0	0	12.0000	\N	\N	12.0000	136	\N	\N	{"price_micro_charge":[{"days":7,"amount":5}]}	12	\N	5	3	1	2	2	admin	2021-05-05 15:35:08	\N	\N
270	partnerprice	101	113	112	120	0	0	\N	19	20	\N	133	\N	\N	\N	0	\N	2	1	1	2	2	sanjeevie	2021-06-12 15:48:15	\N	\N
271	partprice	101	113	112	120	0	0	\N	17	17	\N	134	1	en	{"price_micro_charge":[]}	0	\N	90	180	3	2	2	sanjeevie	2021-06-12 18:28:52	\N	\N
194	kau34589	100	116	112	121	0	1	\N	\N	\N	123.0000	133	\N	\N	{"price_micro_charge":[{"days":12,"amount":12}]}	\N	\N	0	0	2	2	2	admin	2021-03-04 15:26:16	\N	\N
196	hiranayaaa	100	116	112	121	0	0	\N	\N	\N	123.0000	134	1	en	{"price_micro_charge":[]}	0	\N	0	0	1	2	2	admin	2021-03-04 15:57:53	\N	\N
197	asith	100	116	112	121	0	0	\N	\N	\N	123.0000	135	\N	en	{"price_micro_charge":[]}	0	\N	0	0	2	2	2	admin	2021-03-04 16:03:29	\N	\N
204	install_plan3	101	114	112	121	\N	\N	2.0000	\N	\N	\N	\N	\N	\N	\N	10	2	0	0	1	2	2	admin	2021-03-04 17:20:46	\N	\N
272	TestInstallValidity	101	114	112	121	\N	\N	200.0000	\N	\N	\N	\N	\N	\N	\N	11111111111111111111	2	0	0	2	2	2	admin	2021-06-16 13:46:55	\N	\N
276	ABC	101	114	112	120	\N	\N	\N	\N	18	\N	\N	\N	\N	\N	11	10	10	20	3	2	45	admin	2021-07-07 10:45:28	\N	\N
146	StanderdTariff	101	113	112	120	0	0	\N	17	17	\N	136	\N	\N	\N	100	\N	1	1	3	2	2	admin	2021-03-02 10:37:40	\N	\N
242	tf_plan1	101	113	112	120	0	0	\N	26	25	\N	133	\N	\N	\N	\N	\N	0	0	5	2	2	admin	2021-03-17 10:26:30	\N	\N
202	install_plan	101	114	112	121	\N	\N	10.0000	\N	\N	\N	\N	\N	\N	\N	3	4	4	2	2	2	2	admin	2021-03-04 16:07:31	\N	\N
255	test_pln	101	113	112	121	0	0	10.0000	\N	\N	5.0000	135	\N	en	{"price_micro_charge":[]}	\N	\N	0	0	2	2	2	admin	2021-03-25 10:59:45	\N	\N
195	jadjhk	100	116	112	121	0	0	\N	\N	\N	234.0000	134	1	en	{"price_micro_charge":[]}	0	\N	0	0	1	2	2	admin	2021-03-04 15:43:15	\N	\N
198	asiii	100	116	112	121	0	0	\N	\N	\N	113.0000	133	\N	\N	{"price_micro_charge":[]}	0	\N	0	0	1	2	3	admin	2021-03-04 16:04:44	\N	\N
201	aabbaadf	100	116	112	121	0	0	\N	\N	\N	123.0000	132	\N	\N	{"price_micro_charge":[]}	0	\N	0	0	2	2	2	admin	2021-03-04 16:06:03	\N	\N
259	ond_plan1	101	114	112	121	\N	\N	5.0000	\N	\N	\N	\N	\N	\N	\N	5	4	0	0	1	2	2	admin	2021-03-31 10:58:31	\N	\N
260	exp_plan2	101	115	112	121	\N	\N	20.0000	\N	\N	\N	\N	\N	\N	\N	20	\N	0	0	\N	2	2	admin	2021-03-31 12:11:50	\N	\N
273	TestingContentPP	100	118	2	121	\N	\N	200.0000	\N	\N	\N	\N	\N	\N	\N	3	\N	0	0	\N	2	2	admin	2021-06-22 14:50:50	\N	\N
132	Content123	100	116	112	121	1	1	5.0000	\N	\N	6.0000	131	\N	\N	{"price_micro_charge":[{"days":4,"amount":3},{"days":5,"amount":5}]}	\N	\N	5	3	5	2	2	admin	2021-02-26 16:54:28	\N	\N
116	PricePlan01	101	113	112	121	0	0	10.0000	\N	\N	20.0000	134	26	en	\N	0	\N	0	0	3	2	2	admin	2021-02-24 16:09:36	\N	\N
133	Vip5	101	115	112	121	\N	\N	12.0000	\N	\N	\N	\N	\N	\N	\N	12	\N	0	0	\N	2	2	admin	2021-03-01 10:40:50	\N	\N
134	TariffCheck	101	113	112	120	0	0	\N	17	17	\N	130	\N	\N	\N	\N	\N	2	4	3	2	2	admin	2021-03-01 13:25:05	\N	\N
224	VImukthiTarrif2	101	113	112	120	0	0	\N	18	18	\N	134	1	en	{"price_micro_charge":[]}	0	\N	12	12	1	2	3	sherantha	2021-03-15 15:07:01	\N	\N
228	VimukthiAmount2	101	113	112	121	0	0	12.0000	\N	\N	12.0000	133	\N	\N	\N	\N	\N	12	12	1	2	3	admin	2021-03-16 16:04:07	\N	\N
135	hjmhjm	100	118	112	121	\N	\N	23.0000	\N	\N	\N	\N	\N	\N	\N	14	\N	0	0	\N	2	3	Partner1	2021-03-01 13:37:37	\N	\N
136	CustomTariff	101	113	112	120	0	0	\N	17	17	\N	136	\N	\N	\N	100	\N	1	1	3	2	2	admin	2021-03-01 14:58:38	\N	\N
138	MonthlyTariff	101	113	112	120	0	0	\N	17	17	\N	133	1	en	\N	0	\N	5	5	3	2	2	admin	2021-03-01 15:36:48	\N	\N
137	TariffWeekly	101	113	112	120	0	0	\N	17	17	\N	131	\N	\N	{"price_micro_charge":[{"days":6,"tariff":17},{"days":2,"tariff":17}]}	0	\N	23	15	1	2	2	admin	2021-03-01 15:01:32	\N	\N
139	testMicroCharge	101	113	112	121	0	0	10.0000	\N	\N	20.0000	131	\N	\N	{"price_micro_charge":[{"days":5,"amount":10},{"days":3,"amount":6}]}	\N	\N	4	3	1	2	2	admin	2021-03-01 18:09:09	\N	\N
140	pricePlan0301	100	118	112	121	\N	\N	100.0000	\N	\N	\N	\N	\N	\N	\N	30	\N	0	0	\N	2	2	admin	2021-03-01 19:32:48	\N	\N
141	tariff_plan	101	113	112	120	0	0	\N	17	17	\N	133	\N	\N	\N	\N	\N	0	0	2	2	2	admin	2021-03-01 21:43:16	\N	\N
142	microChargeTariff	101	113	112	120	0	0	\N	17	17	\N	133	\N	\N	{"price_micro_charge":[{"days":5,"tariff":17},{"days":3,"tariff":17},{"days":2,"tariff":17}]}	\N	\N	3	5	2	2	2	admin	2021-03-01 22:17:51	\N	\N
143	NonContentTariIns	101	114	112	120	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	9	7	5	4	2	2	2	admin	2021-03-02 10:19:19	\N	\N
149	NonConBiWklyTariffM	101	113	112	120	0	0	\N	24	23	\N	132	\N	\N	{"price_micro_charge":[{"days":11,"tariff":21},{"days":8,"tariff":20},{"days":5,"tariff":19}]}	\N	\N	5	5	2	2	2	admin	2021-03-02 11:05:36	\N	\N
115	STestPrice3	101	113	112	121	1	1	10.0000	\N	\N	10.0000	136	25	en	{"price_micro_charge":[]}	3	\N	7	0	2	2	2	admin	2021-02-24 15:59:02	\N	\N
252	VimukthiTariff6	101	113	112	120	0	0	\N	19	19	\N	130	\N	\N	\N	\N	\N	12	12	4	2	3	admin	2021-03-23 11:22:59	\N	\N
262	one_time_plan	101	115	112	121	\N	\N	10.0000	\N	\N	\N	\N	\N	\N	\N	5	\N	0	0	\N	2	2	admin	2021-04-07 22:37:22	\N	\N
151	OnetimePrice13	101	115	112	121	\N	\N	30.0000	\N	\N	\N	\N	\N	\N	\N	10	\N	0	0	\N	2	2	admin	2021-03-02 11:06:27	\N	\N
152	NonCon30DTariffM	101	113	112	120	0	0	\N	24	23	\N	133	\N	\N	{"price_micro_charge":[{"days":25,"tariff":22},{"days":20,"tariff":21}]}	0	\N	7	8	2	2	2	admin	2021-03-02 11:11:32	\N	\N
156	NonConMSDateTariffM	101	113	112	120	0	1	\N	24	23	\N	135	\N	en	{"price_micro_charge":[{"days":10,"tariff":19},{"days":15,"tariff":20},{"days":20,"tariff":21},{"days":25,"tariff":22}]}	0	\N	5	5	3	2	2	admin	2021-03-02 14:00:53	\N	\N
155	NonConCusTariffM	101	113	112	120	0	0	\N	24	23	\N	136	\N	\N	{"price_micro_charge":[{"days":90,"tariff":17},{"days":80,"tariff":22},{"days":70,"tariff":21},{"days":60,"tariff":20},{"days":50,"tariff":19}]}	100	\N	1	1	3	2	2	admin	2021-03-02 12:33:11	\N	\N
161	ConTrifOneTime4	100	118	112	120	\N	\N	\N	\N	21	\N	\N	\N	\N	\N	90	\N	0	0	\N	2	2	admin	2021-03-02 15:21:58	\N	\N
167	ConDailyTariff	100	116	112	120	0	0	\N	20	23	\N	130	\N	\N	\N	0	\N	12	12	3,5	2	2	admin	2021-03-02 16:29:57	\N	\N
168	Con30DTariffM	100	116	112	120	0	0	\N	24	23	\N	133	\N	\N	{"price_micro_charge":[{"days":25,"tariff":21},{"days":20,"tariff":21},{"days":10,"tariff":20},{"days":5,"tariff":19}]}	0	\N	5	5	4	2	2	admin	2021-03-02 16:33:47	\N	\N
171	NonConSubDTariffM2	100	116	112	120	0	0	\N	21	20	\N	135	\N	en	\N	0	\N	11	3	3	2	2	admin	2021-03-02 16:56:07	\N	\N
172	ContCust1	100	116	112	120	0	0	\N	21	21	\N	136	\N	\N	{"price_micro_charge":[{"days":90,"tariff":23},{"days":80,"tariff":22},{"days":70,"tariff":21},{"days":60,"tariff":20},{"days":50,"tariff":19},{"days":40,"tariff":17},{"days":30,"tariff":17},{"days":20,"tariff":19},{"days":15,"tariff":20},{"days":10,"tariff":20}]}	100	\N	1	1	4	2	2	admin	2021-03-02 16:59:13	\N	\N
173	bbbbbb	101	115	112	121	\N	\N	23.0000	\N	\N	\N	\N	\N	\N	\N	14	\N	0	0	\N	2	3	Partner1	2021-03-02 17:47:27	\N	\N
174	testgihan	101	113	112	120	0	0	\N	17	17	\N	130	\N	\N	\N	\N	\N	0	0	1	2	2	admin	2021-03-03 14:40:22	\N	\N
175	testENTCgi	101	113	112	120	0	0	\N	17	17	\N	133	\N	\N	\N	\N	\N	0	0	1	2	3	admin	2021-03-03 14:54:32	\N	\N
176	AmountContent	100	116	112	121	0	0	3.0000	\N	\N	2.0000	133	\N	\N	\N	\N	\N	2	1	3	2	7	admin	2021-03-03 15:30:55	\N	\N
177	Asdasdd	100	116	112	120	0	0	\N	\N	\N	\N	136	\N	\N	{"price_micro_charge":[{"days":60,"tariff":22},{"days":40,"tariff":21},{"days":30,"tariff":20},{"days":10,"tariff":19}]}	100	\N	1	1	2	2	3	sherantha	2021-03-03 17:41:37	\N	\N
178	Vim1123	101	113	112	121	0	1	12.0000	\N	\N	12.0000	134	1	en	{"price_micro_charge":[{"days":23,"amount":12}]}	0	\N	12	12	1	2	2	admin	2021-03-04 10:10:29	\N	\N
180	testnew04	101	113	112	120	0	0	\N	17	17	\N	133	\N	\N	{"price_micro_charge":[]}	0	\N	0	0	1	2	2	admin	2021-03-04 10:35:00	\N	\N
185	test_plan	101	113	112	121	1	0	5.0000	\N	\N	2.0000	136	\N	\N	\N	20	\N	0	0	2	2	2	admin	2021-03-04 13:41:20	\N	\N
182	gihan123	101	113	112	120	0	0	\N	17	17	\N	134	1	en	{"price_micro_charge":[]}	0	\N	0	0	1	2	2	admin	2021-03-04 12:37:45	\N	\N
189	kautest	100	116	112	121	0	1	\N	\N	\N	111.0000	134	1	en	{"price_micro_charge":[{"days":12,"amount":12}]}	\N	\N	0	0	1	2	3	admin	2021-03-04 14:48:50	\N	\N
205	test_xxx	101	114	112	121	\N	\N	10.0000	\N	\N	\N	\N	\N	\N	\N	1	2	0	0	0	2	2	admin	2021-03-05 10:41:24	\N	\N
263	plan	101	113	112	120	0	0	\N	27	27	\N	130	\N	\N	\N	0	\N	5	3	1	2	2	admin	2021-04-09 15:16:04	\N	\N
264	plan2	101	114	112	120	\N	\N	\N	\N	25	\N	\N	\N	\N	\N	5	4	0	0	2	2	2	admin	2021-04-09 15:44:13	\N	\N
124	hasitha_plan	101	115	112	121	\N	\N	2.0000	\N	\N	\N	\N	\N	\N	\N	10	\N	0	0	\N	2	2	admin	2021-02-25 10:40:24	\N	\N
125	OnetimePrice1	101	115	112	121	\N	\N	10.0000	\N	\N	\N	\N	\N	\N	\N	5	\N	0	0	\N	2	2	admin	2021-02-25 10:49:48	\N	\N
128	OnetimePrice2	101	115	112	121	\N	\N	6.5000	\N	\N	\N	\N	\N	\N	\N	10	\N	0	0	\N	2	2	admin	2021-02-25 16:46:56	\N	\N
130	OneTimeTariff	101	115	112	120	\N	\N	\N	\N	17	\N	\N	\N	\N	\N	27	\N	0	0	\N	2	2	admin	2021-02-26 11:06:26	\N	\N
148	NonConWeeklyTariff	101	113	112	120	0	0	\N	17	18	\N	131	\N	\N	{"price_micro_charge":[{"days":6,"tariff":17},{"days":4,"tariff":18}]}	\N	\N	23	15	3	2	2	admin	2021-03-02 10:56:57	\N	\N
129	Priceplan1	101	113	112	121	0	1	12.5000	\N	\N	20.0000	134	26	en	{"price_micro_charge":[]}	0	\N	0	0	5	2	2	admin	2021-02-26 09:00:00	\N	\N
131	OTpricePlan	101	115	112	121	\N	\N	6.0000	\N	\N	\N	\N	\N	\N	\N	5	\N	0	0	\N	2	2	admin	2021-02-26 13:55:30	\N	\N
265	asdasd	101	113	112	120	0	0	\N	18	17	\N	136	\N	\N	\N	3	\N	1	1	0	2	7	admin	2021-04-28 12:45:31	\N	\N
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_name, operator_id, partner_id, service_type, service_list, product_gen_desc, order_position, status) FROM stdin;
31	testdup	2	2	112	{126,204,181}	null	2	1
39	smokeproduct	2	2	112	{177,257,173,204,147,200,119,317,316,318,314,360}	Des	4	1
34	hiranyaas	2	2	112	{127,204}	asdads	3	1
30	hiranyass	2	2	112	{126,204,181,119}	null	1	1
40	sdfsf	2	3	112	{264}	sfsdfsf	5	1
41	myprodee	2	3	112	{264}	desc	6	1
51	myprodee1	2	3	112	{264}	desc	7	1
56	myprodee1i	1	3	112	{264}	desc	1	1
62	tryNbuy	2	2	112	{204,205}	des	8	1
\.


--
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_category (category_id, product_id, product_order_position, product_status) FROM stdin;
81	30	1	0
82	30	1	1
75	30	1	0
147	30	1	0
169	62	1	1
\.


--
-- Data for Name: product_svc_fk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_svc_fk (product_id, service_id) FROM stdin;
31	126
31	204
31	181
39	177
39	257
39	173
39	204
39	147
39	200
39	119
39	317
39	316
39	318
39	314
39	360
34	127
34	204
30	126
30	204
30	181
30	119
40	264
41	264
51	264
56	264
62	204
62	205
\.


--
-- Data for Name: provisioning; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provisioning (provisioning_id, operator_id, partner_id, group_id, provisioning_type, endpoint_name, endpoint_group, endpoint_url, endpoint_type, username, password) FROM stdin;
107	2	0	1	180	Provisioning3	\N	http://10.0.0.58/subscription.php	172	Test	Test
105	2	0	4	180	Provisioning2	\N	http://10.0.1.58/subscription.php	172	Saku	Saku
110	2	2	2	181	failed-rest	\N	http://10.0.0.147:8002/scm_admin/manage_provisioning	171	adc	abc
111	1	1	2	181	opiipoi	\N	https://ererreer.ere	171	sd	null
109	2	0	2	180	gihanprov	\N	http://10.0.1.58/subscription.php	171	\N	\N
112	2	0	3	180	Soap	\N	http://10.0.0.58/subscription.php	170	root	root
108	2	0	4	180	Invalidprovi4	\N	http://10.0.1.108/subscription.php	172	User1	User1
113	2	2	1	181	SheraTesting1	\N	http://www.google.com	172	test	test
114	2	2	1	181	tryandbuytest	\N	http://100.0.0.100/failed	172		
104	2	0	1	148	Provisioning1	\N	http://10.0.0.63/call.php	172	Test	Test
\.


--
-- Data for Name: provisioning_class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provisioning_class (class_name, group_id) FROM stdin;
global_blacklist	{1,3,4}
service	{1,2,3,4}
\.


--
-- Data for Name: provisioning_default_provisioning_fk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provisioning_default_provisioning_fk (default_provisioning_id, provisioning_id) FROM stdin;
9	105
9	108
8	111
8	112
5	105
5	108
5	107
5	109
11	107
11	105
11	104
12	113
13	107
13	105
14	110
17	113
18	108
\.


--
-- Data for Name: provisioning_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provisioning_group (group_id, group_name, group_code, endpoint_type, data) FROM stdin;
1	rbt_http	rbt_http_client	172	service_code=$&partner_id=$&action=$&msisdn=$&request_id=$&status=$&expiry_date=$
4	cms_http	cms_http_client	172	service_code=$&partner_id=$&action=$&msisdn=$&request_id=$&status=$&expiry_date=$
2	rbt_rest	rbt_rest_client	171	{"service_code" : "$", "action" : "$", "msisdn" : "$", "request_id" : "$", "status" : "$", "expiry_date" : "$", "partner_id" : "$"}
3	rbt_soap	rbt_soap_client	170	1
\.


--
-- Data for Name: service; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service (service_id, service_name, service_code, service_short_code, operator_id, partner_id, chk_gbl_sub_bl, chk_gbl_cha_bl, chk_tmp_cha_bl, service_type, service_mode, content_mode, service_sub_cont_serv, service_chk_sub_state, service_chrg_type, service_manage_sub, service_max_amount, service_min_amount, service_subs_consent, service_sub_cycle_provision, service_sub_admin_provision, service_serv_admin_provision, service_description, service_gen_description, service_resub_barred_period, service_status, service_category, service_channel, service_price_plan, last_park_date, last_unpark_date, renewal_priority, service_renewal_consent, service_alias) FROM stdin;
127	Onetime1	00003	00003	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	1	0	0	Test Subscription	General description	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"4\\": \\"4\\"}"}	125	\N	\N	\N	0	\N
190	buddikaTariff	4765	7456	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	0	0	0	hhhhhhhhhhhhhhhhhhhhhhhhhhhh	null	2	0	1	{"{\\"4\\": \\"4\\"}"}	148	\N	\N	4	0	\N
154	External	66778	66778	2	2	0	0	0	112	123	\N	0	0	121	0	25.00000000	5.00000000	0	0	0	0	External Product Activation	General Rules	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	\N
153	NonConSubMg_K	001	001	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	1	1	0	desc NonConSubMg_K	\N	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	129	\N	\N	1	0	\N
152	Onetime12	55541	55541	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	Onetime Service	General service description	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	131	\N	\N	\N	0	\N
193	ONdMN	1212	1212	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	0	0	0	0	QWEQWEWQEQWE	null	12	1	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	131	2021-03-02 16:03:58.534725	\N	\N	0	\N
155	subsc	1111	1111	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	subs subs subsss	\N	12	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"4\\": \\"4\\"}"}	127	2021-03-02 15:51:47.152937	2021-03-02 18:02:42.417946	12	0	\N
187	NonConSubMg_K2	002	002	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	desc 1234567890	null	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	116	\N	\N	1	0	\N
188	SSaku	99001	99001	2	2	0	0	0	112	123	\N	0	0	121	0	30.00000000	5.00000000	0	0	0	0	Test ondemand unmanage	General unmanage ondemand	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	\N
185	Onetime13	00013	00013	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	1	0	0	Ondemand service	General description	3	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"4\\": \\"4\\"}"}	151	\N	\N	\N	0	\N
195	testnisqa	testnisqa	8908	2	2	0	0	0	111	\N	123	0	0	0	1	\N	\N	1	0	0	0	testnisqa hhhs	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	\N
174	TariffCheck	TariffCk	12413	2	2	0	0	0	112	122	\N	0	0	120	0	\N	\N	0	0	0	0	TariffCheck	null	2	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	\N
175	dont_delete_ond_mng	ond_mng1	4232	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	do not delete	null	4	0	1	{"{\\"1\\": \\"1\\"}"}	113	\N	\N	2	0	\N
177	service3	3333	3333	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	service3service3service3	null	12	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"4\\": \\"4\\"}"}	125	\N	\N	\N	0	\N
178	23234324234	2332423	23432	2	5	0	0	0	111	\N	122	0	0	121	0	100.00000000	10.00000000	0	0	0	0	f bdgdfgdfhgfxgdf hfgfgchc	null	10	0	1	{"{\\"3\\": \\"3\\"}"}	\N	\N	\N	\N	0	\N
180	service0301	0301	0301	2	2	0	0	0	111	\N	123	0	0	0	1	\N	\N	0	0	0	0	content_dis_plan	test content subscriptin discoun plan	1	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	\N
254	ond_exp	ond_exp	3434	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	ondemand expiry	null	2	0	1	{"{\\"1\\": \\"1\\"}"}	124	\N	\N	\N	0	\N
255	exp_svc2	exp_svc2	2346	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	expiry test	null	2	0	1	{"{\\"1\\": \\"1\\"}"}	260	\N	\N	\N	0	\N
197	sevgihan	sevgihan	4353	2	2	0	0	0	111	\N	122	0	0	0	1	\N	\N	0	1	0	0	sdflsfhlsefbairifjffr	hc	3	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	2	0	\N
201	con_test_svc	con_svc	4532	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	consent service for request id	null	5	0	1	{"{\\"1\\": \\"1\\"}"}	185	\N	\N	4	0	\N
176	test_sub1	test_sub1	65654	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	1	0	0	consent issue	\N	5	0	1	{"{\\"1\\": \\"1\\"}"}	113	\N	\N	4	0	\N
202	review1	review1	34534	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	installment review	null	4	0	1	{"{\\"1\\": \\"1\\"}"}	202	\N	\N	2	1	\N
203	review2	rev_ond	34543	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	ondemand manage	null	0	0	1	{"{\\"1\\": \\"1\\"}"}	124	\N	\N	\N	0	\N
172	onDmnd	2222	2222	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	1	0	0	2222 on demand managed	\N	12	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	125	2021-03-02 16:02:25.260589	2021-03-02 16:02:52.039706	\N	0	\N
274	testalias1	testalias1	20489	2	2	0	0	0	111	\N	122	0	0	121	0	12.00000000	1.00000000	0	0	0	0	kldfjbdfjklngdfl	null	3	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	gk
173	sub_hasitha	svc_sub	64553	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	subscription check	\N	2	0	1	{"{\\"1\\": \\"1\\"}"}	129	\N	\N	4	1	\N
275	rdfgjhjk	fghj	9876	2	2	0	0	0	111	\N	122	0	0	121	0	12.00000000	1.00000000	0	0	0	0	tyfyjkuylgh	null	3	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	sdff
126	Onetime	00002	00002	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	0	1	0	0	TestOndemand	Generaldescription	5	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"4\\": \\"4\\"}"}	125	\N	\N	\N	0	dgfhg
194	testss	test	2233	2	3	1	0	0	111	\N	122	0	0	120	0	\N	\N	0	0	0	0	testwewertr	dfsad	12	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
147	SConsent3	00005	00005	2	2	0	1	0	112	122	\N	0	0	121	1	\N	\N	1	1	0	0	Test Service....	General Description	5	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	129	\N	\N	6	0	scon3
184	hasitha_ond_mng	od_mg	5345	2	2	1	1	1	112	123	\N	0	0	121	1	\N	\N	1	1	0	0	ondemand manage service	\N	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	124	\N	\N	\N	0	54353
200	sub_svc1	sub_svc1	6542	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	subscription service	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	185	\N	\N	2	0	rg
257	gihan2	gihan2	3452	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	sdfbhkjsdhgksd	\N	2	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	127	2021-04-01 17:04:33.241036	2021-04-01 17:34:04.980274	2	0	fghjk
181	test_svc	test_svc	3453	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	1	0	0	test svc ereere	\N	3	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	113	\N	\N	2	0	5432
204	test_svc1	test_svc1	4321	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	1	0	0	test service	\N	14	0	1	{"{\\"1\\": \\"1\\"}"}	202	\N	\N	2	1	534543
258	kab_test	kab_test	4534	2	2	0	0	0	112	123	\N	0	0	120	1	\N	\N	1	0	0	0	ondedemand tariff for kabil	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	130	\N	\N	\N	0	\N
265	welrfbw	uksydfbkw	4353	2	2	0	0	0	111	\N	122	0	0	121	0	12.00000000	1.00000000	0	0	0	0	drghtryerthyyh	null	3	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	\N
266	testpark	testpark	45688	2	2	0	0	0	111	\N	122	0	0	121	0	12.00000000	1.00000000	0	0	0	0	jfbgkdjhbgdjhkrgvdk	\N	1	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-04-01 14:34:09.891099	\N	\N	0	\N
267	testpark2	testpark2	34567	2	2	0	0	0	111	\N	122	0	0	121	0	13.00000000	1.00000000	0	0	0	0	fsgeryhryhrh	\N	1	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	\N
268	testpark3	testpark3	78432	2	2	0	0	0	111	\N	122	0	0	121	0	12.00000000	1.00000000	0	0	0	0	uygfruhkweuflwieurw	\N	1	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-04-01 14:34:09.891099	2021-04-01 14:35:09.891099	\N	0	\N
288	test_svc22	test_svc22	4534	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	test service 22	\N	2	0	1	{"{\\"1\\": \\"1\\"}"}	116	\N	\N	3	1	gggggg
259	ond_kb	ond_kb	2321	2	2	0	0	0	112	123	\N	0	0	120	1	\N	\N	0	1	0	0	ondemand uat	\N	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"4\\": \\"1\\"}"}	130	\N	\N	\N	0	\N
283	testalias23	daykfg	34278	2	2	0	0	0	111	\N	123	0	0	121	0	12.00000000	1.00000000	0	0	0	0	ejfkergfkuryhferuk	null	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	\N
284	uat_svc	uat_svc	23434	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	0	1	0	0	ondemand one time	\N	4	0	1	{"{\\"1\\": \\"1\\"}"}	262	\N	\N	\N	0	beep
285	uat_svc1	uat_svc1	65353	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	0	1	0	0	uat one time price plan	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	262	\N	\N	\N	0	boom
287	test_svc11	test_svc11	5654	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	test service 1	null	2	0	1	{"{\\"1\\": \\"1\\"}"}	255	\N	\N	4	1	eeeeee
189	NilushikaUnsub	19935	19935	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	1	1	0	heloohello	hellohello	2	1	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	115	2021-04-09 10:59:10.753148	\N	1	0	\N
269	saku_svc	saku_svc	2343	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	saku service test	\N	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"1\\"}"}	203	\N	\N	2	0	\N
270	umg_svc	umg_svc	4335	2	2	0	0	0	112	122	\N	0	0	121	0	6.00000000	2.00000000	0	0	0	0	unmanage service	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	Hahahaha
207	ond_mng	ond_mng	4353	2	2	0	1	1	112	123	\N	0	0	121	1	\N	\N	0	0	0	0	ondemand manage services	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	124	\N	\N	\N	0	\N
209	umng_svc	umng_svc	4342	2	2	0	0	0	112	122	\N	0	0	121	0	5.00000000	2.00000000	1	1	0	0	unmanage service	\N	2	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	\N	\N	\N	\N	0	\N
219	sertest9	sertest9	2376	2	2	0	0	0	111	\N	122	0	0	120	0	\N	\N	0	0	0	0	description	null	3	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	\N
289	SMSExternal	SMSExternal	1224	2	2	0	0	0	112	122	\N	0	0	121	0	200.00000000	100.00000000	0	0	0	0	asdadadasdasdada	asdadasd	2	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"4\\"}","{\\"3\\": \\"4\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	LegAPI
237	tf_svc3	tf_svc3	65434	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	1	1	1	tariff service 3	\N	2	1	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"4\\": \\"1\\"}"}	138	2021-03-31 13:46:41.813993	2021-03-31 12:28:19.949834	3	1	\N
210	sub_mng	sub_mng	4345	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	subscription mange service	\N	2	2	1	{"{\\"1\\": \\"1\\"}"}	129	\N	\N	3	0	\N
212	ond_101	ond_101	23454	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	1	0	0	ondemand service	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	125	\N	\N	\N	0	\N
292	plan2_svc	plan2_svc	2343	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	0	0	0	test service plan2	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	264	\N	\N	3	0	ertret
213	UnsubTestNew	1994	1994	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	1	1	0	unsubtesterr	unsubtest	2	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	129	\N	\N	1	0	\N
211	on_mng11	on_mng11	32432	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	0	0	0	0	sub threshold	\N	2	0	1	{"{\\"1\\": \\"1\\"}"}	124	\N	\N	\N	0	\N
214	testnisha	12341	12387	2	2	0	0	0	111	\N	122	0	0	120	0	\N	\N	0	0	0	0	description	des	3	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	\N
217	dup_prv	dup_prv	23432	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	0	1	0	0	duplicate provision check	\N	3	0	1	{"{\\"1\\": \\"1\\"}"}	131	\N	\N	\N	0	\N
119	SConsent1	00001	00001	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	1	0	0	Test service	General description	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	113	\N	\N	1	0	testhk
264	entc_svc	entc_svc	12466	2	3	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	werugherugheruhg	\N	1	0	1	{"{\\"4\\": \\"4\\"}"}	228	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	1	0	\N
205	test_svc2	test_svc2	34543	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	1	0	0	test service 2	\N	2	0	1	{"{\\"1\\": \\"1\\"}"}	203	\N	\N	3	2	432432
206	test_svc3	test_svc3	3453	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	test service	\N	2	0	1	{"{\\"1\\": \\"1\\"}"}	204	\N	\N	4	0	asdad
293	NewMessageValidations	newmsgvalid	1522	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	NewMessageValidations	NewMessageValidations	2	0	1	{"{\\"2\\": \\"2\\"}","{\\"4\\": \\"4\\"}"}	204	\N	\N	2	0	BugNaa
232	tf_svc1	tf_svc1	34525	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	0	0	0	tariff service1	null	0	0	1	{"{\\"1\\": \\"1\\"}"}	242	\N	\N	2	0	\N
236	tf_svc2	tf_svc2	34233	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	0	0	0	tariff service 2	null	0	0	1	{"{\\"1\\": \\"1\\"}"}	141	\N	\N	5	0	\N
249	plc_test1	plc_test1	23422	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	place holder test	null	2	0	1	{"{\\"1\\": \\"1\\"}"}	204	\N	\N	2	0	\N
208	testsession	test_ses	3456	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	1	0	0	description	des	5	0	1	{"{\\"4\\": \\"4\\"}"}	129	\N	\N	2	0	\N
250	harsha	harsha	2343	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	harsha sdsdf	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	124	\N	\N	\N	0	\N
251	plc_content	plc_content	6353	2	2	0	0	0	111	\N	122	0	0	0	1	\N	\N	1	0	0	0	place holders in content	null	1	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-03-30 12:54:57.027599	2021-03-30 15:17:59.626999	2	0	\N
238	sfvbhkn	sdfg	7527	2	6	0	0	0	111	\N	122	0	0	120	0	\N	\N	0	0	0	0	jfghlerhglerueg	null	3	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-03-30 15:18:05.770427	2021-03-30 15:18:10.802356	\N	0	\N
242	new_svc	new_svc	3242	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	1	0	0	0	new service	\N	2	0	1	{"{\\"1\\": \\"1\\"}"}	255	2021-03-30 16:27:20.107667	2021-03-30 16:27:27.270351	2	1	\N
273	unmg_svc	unmg_svc	2343	2	2	0	0	0	112	122	\N	0	0	121	0	10.00000000	5.00000000	0	1	0	0	unamange service grace	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	whatever
294	Deci8Service	Deci8Service	1241	2	2	0	0	0	112	122	\N	0	0	121	0	12345678.12345678	12345678.12345678	0	0	0	0	Deci8ServiceDeci8Service	Deci8Service	2	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	ambo8
291	plan_svc	plan_svc	3433	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	1	1	0	0	test serice plan	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	263	\N	\N	2	0	rererre
256	gihan1	gihan1	24334	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	sehfkrhgkrug	\N	3	0	1	{"{\\"1\\": \\"1\\"}"}	127	\N	\N	2	2	gihan1
297	tariffNew	tar01	9001	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	0	0	0	to test tariff grace cron	\N	2	0	1	{"{\\"1\\": \\"1\\"}"}	263	\N	\N	1	1	tar01
296	con_svc2	con_svc2	5432	2	2	0	0	0	111	\N	122	0	0	0	1	\N	\N	1	1	0	0	content service 2	\N	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	3	1	\N
299	gfail2	gfail2	2348	2	2	0	0	0	112	122	\N	0	0	121	0	12.00000000	1.00000000	0	1	0	0	werjhgldhgdlrghtrl	null	2	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	da
295	con_svc1	con_svc1	4324	2	2	0	0	0	111	\N	122	0	0	0	1	\N	\N	1	1	0	0	content service 1	\N	2	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	2	1	\N
302	testprovpartner	part123	344	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	1	0	0	to test service approve	to test partner prov	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	127	\N	\N	8	0	testPr1
223	testTTTT	quiw	5678	2	3	0	0	0	112	122	\N	0	0	120	0	\N	\N	0	0	0	0	afbbwuirgywelrfybwlreyf	testTTTTtestTTTT	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
224	subcheck-tes	sufbkd	0987	2	3	0	0	0	111	\N	122	0	0	121	0	12.00000000	10.00000000	0	0	0	0	wejhfbsrharegedtr	testnis	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
301	SheranthaProvNew	SheranthaProvNew	1424	2	2	0	0	0	112	122	\N	0	0	121	0	100.00000000	10.00000000	0	1	0	0	SheranthaProvNew	SheranthaProvNew	2	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	SheraPr
218	NonConOnDMg1	0001	2342	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	1	0	0	non content on demand manage	null	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	125	\N	\N	\N	0	\N
271	Holy Boy	holyboy	4102	2	3	0	0	0	112	122	\N	0	0	121	0	14.00000000	2.00000000	0	0	0	0	Holy boy service	Holy Boy service	23	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	2021-05-10 12:45:23.284841	\N	0	Booooo
272	HiMagazine	HiMag	1020	2	3	0	0	0	111	\N	123	0	0	121	0	232.00000000	141.00000000	0	0	0	0	Hi magazine for men	null	0	0	1	{"{\\"3\\": \\"3\\"}"}	\N	\N	2021-05-10 12:45:23.284841	\N	0	ava
216	TestTariff	asda	2233	2	3	0	0	0	111	\N	122	0	0	120	0	\N	\N	0	0	0	0	awdadwadawda	TestTariff	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
215	testSheraa	testSheraa	1231	2	3	0	0	0	111	\N	122	0	0	120	0	\N	\N	0	0	0	0	asdsadadasdasdad	null	2	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
225	gktest	cyvbunjm	67889	2	3	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	0	0	0	sdcvhdiufgysikdf	\N	1	0	1	{"{\\"4\\": \\"4\\"}"}	175	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	2	0	\N
298	gfail	gfail	34789	2	2	0	1	0	112	122	\N	0	0	121	0	12.00000000	1.00000000	0	1	1	1	dfhbskdhfbkjher	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	sfd
300	testProv	testProv	1190	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	1	1	0	0	to test provisioning update	\N	6	0	1	{"{\\"1\\": \\"1\\"}"}	146	\N	\N	3	0	testProv
199	OnDemandUnmanaged	asdad12413	1512	2	3	0	0	0	112	123	\N	0	0	121	0	232.00000000	14.00000000	0	0	0	0	On Demand Unmanaged	null	0	0	1	{"{\\"2\\": \\"2\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
196	asda123	ad124	1231	2	3	0	0	0	112	122	\N	0	0	121	0	55.00000000	2.00000000	0	0	0	0	asdasdasdada	null	12	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
198	OnDemandService	1421ASfA	1523	2	3	0	0	0	112	123	\N	0	0	121	1	\N	\N	0	0	0	0	On Demand Service	null	12	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	173	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
233	ContentOnDemaandMng	afaw1414	1223	2	3	0	0	0	111	\N	123	0	0	0	1	\N	\N	0	0	0	0	ContentOnDemaandMng	ContentOnDemaandMng	2	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
243	TestFreeTrial	TestFreeTrial	1241	2	3	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	TestFreeTrial	\N	2	0	1	{"{\\"2\\": \\"2\\"}"}	228	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	2	0	\N
252	testdup	testdup	32434	2	3	0	0	0	111	\N	122	0	0	120	0	\N	\N	0	0	0	1	sdfd gfgff	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
253	k_svc	k_svc	2342	2	3	0	0	0	112	122	\N	0	0	121	0	6.00000000	2.00000000	0	0	0	1	park test service	\N	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	2021-04-02 11:51:29.158551	2021-05-10 12:45:23.284841	\N	0	\N
303	grule	grule	7857	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	0	0	0	0	jhvhkhvkvkkykhky	null	3	0	1	{"{\\"1\\": \\"1\\"}"}	124	\N	\N	\N	0	ggg
304	grule2	grule2	87785	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	0	0	0	0	gvjhgvjhvjgvhg	null	3	0	1	{"{\\"1\\": \\"1\\"}"}	262	\N	\N	\N	0	ggggg
305	OptInOutSwap	OptInOutSwap	1412	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	OptInOutSwap	OptInOutSwap	2	0	1	{"{\\"1\\": \\"1\\"}"}	266	\N	\N	2	0	OptSwap
130	SConsent2	00004	00004	2	2	0	0	1	112	122	\N	0	0	121	1	\N	\N	1	1	0	0	Service with custom PP	General description	3	0	1	{"{\\"1\\": \\"1\\"}","{\\"4\\": \\"4\\"}"}	202	\N	\N	1	0	test4
306	OndemandH	H001	0089	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	1	0	0	to test on demand non content	\N	10	0	1	{"{\\"1\\": \\"1\\"}"}	124	\N	\N	\N	0	testH
307	gfail3	gfail3	23874	2	2	0	0	0	112	123	\N	0	0	121	0	12.00000000	1.00000000	0	0	0	1	sdjfgdkfjgdfjgdfj	null	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	\N
308	HelloWorld	HelloWorld	1412	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	0	0	0	HelloWorld	HelloWorld	2	0	1	{"{\\"1\\": \\"1\\"}"}	134	\N	\N	2	0	HelloWo
317	unsubs2	unsubs2	23784	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	1	1	1	hvbkdjhfbvsjhdfgg	null	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	146	\N	\N	1	0	gh
310	unsub	unsub	37433	2	2	0	0	0	112	122	\N	0	0	121	0	12.00000000	1.00000000	0	0	0	1	sjkdhfgjhkjhbk	\N	3	0	1	{"{\\"2\\": \\"2\\"}"}	\N	\N	\N	\N	0	ghhh
316	unsubs	unsubs	37684	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	1	1	sdhbfksjhbdfkd	\N	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	127	\N	\N	1	0	gfh
318	unsubs3	unsubs3	37435	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	1	0	0	sdjhbfhbfgfg	null	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	146	\N	\N	1	0	ghgh
313	unsub4	unsub4	37834	2	2	0	0	0	112	122	\N	0	0	121	0	12.00000000	2.00000000	1	0	1	0	fjsddjkvhdvgg	\N	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	ssr
314	unsub5	unsub5	34573	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	erjtgrjkhdgrkjsfsrjhf	null	2	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	113	\N	\N	1	0	sfvd
315	Hello World	helloWorld	1312	2	2	0	0	0	112	122	\N	0	0	121	0	3.00000000	1.00000000	0	1	0	0	Hello World	Hello World	1	0	1	{"{\\"2\\": \\"2\\"}"}	\N	\N	\N	\N	0	WW1
311	unsub2	unsub2	34853	2	2	0	0	0	112	122	\N	0	0	121	0	12.00000000	1.00000000	0	0	1	0	efhsukdfhukrfefrt	\N	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	wtertet
312	unsub3	unsub3	34755	2	2	0	0	0	111	\N	122	0	0	121	0	12.00000000	1.00000000	0	1	1	1	djhfskdfjsbskd	\N	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	\N	\N	\N	\N	0	\N
324	fprov	fprov	23462	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	1	0	0	shbfksdjhfbkdfjb	null	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	146	\N	\N	1	0	dsf
325	fprov2	fprov2	23477	2	2	0	0	0	112	122	\N	0	0	120	1	\N	\N	0	1	0	0	sfdjgbdkfjbvjvkvv	\N	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	146	\N	\N	1	0	dfv
326	contsev	contsev	75645	2	2	0	0	0	111	\N	122	0	0	0	1	\N	\N	0	1	0	0	kghkldfhgkdjfg	\N	2	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	1	0	\N
327	contserv1	contserv1	94835	2	2	0	0	0	111	\N	123	0	0	0	1	\N	\N	0	1	0	0	sdfjvnmbkh	null	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	\N
328	thresh_svc	thresh_svc	3242	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	threshold service	null	1	0	1	{"{\\"1\\": \\"1\\"}"}	262	\N	\N	\N	0	34234
330	thresh_svc1	thresh_svc1	2342	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	sdf fdfg fgdfgdfgd	null	1	0	1	{"{\\"1\\": \\"1\\"}"}	262	\N	\N	\N	0	54565
331	protest	protest	3345	2	2	0	0	0	111	\N	122	0	0	121	0	12.00000000	1.00000000	0	1	0	0	dfghfghfyghf	null	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	\N	\N	\N	\N	0	\N
332	unsub6	unsub6	23478	2	2	0	0	0	111	\N	122	0	0	121	0	12.00000000	1.00000000	0	1	0	0	sjhdfbsdhfbsdhbsk	sefhbsekjhrf	1	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	\N
309	con_svc3	con_svc3	11425	2	2	0	0	0	111	\N	122	0	0	121	0	20.00000000	11.00000000	1	0	0	0	consvc3 asdadaddad	consvc3 consvc3 consvc3	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	\N
333	gprov	gprov	23674	2	2	0	0	0	112	122	\N	0	0	121	0	200.00000000	100.00000000	0	1	0	0	ahdfwejhrwegw	\N	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	asd
334	ServiceName	ServiceCode	14123	2	2	0	0	0	112	122	\N	0	0	121	0	200.00000000	100.00000000	0	0	0	0	ServiceDesc	GenDesc	2	0	1	{"{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	Aliz
336	un_mng1	un_mng1	42342	2	2	0	0	0	112	122	\N	0	0	121	0	5.00000000	1.00000000	0	0	0	0	un manage service	null	1	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	4423
340	sdfssdf	DingDong	1555	2	2	0	0	0	111	\N	123	0	0	121	0	200.00000000	100.00000000	0	0	0	0	DingDongDescription	DingDongGen	0	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	\N
342	HelloWorld123	HelloDing	9112	2	3	0	0	0	112	123	\N	0	0	120	0	\N	\N	0	0	0	0	Hello World Description	Hello World Description	0	0	1	{"{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	\N
347	testdup2	testdup2	34589	2	2	0	0	0	112	122	\N	0	0	121	0	12.00000000	1.00000000	0	0	0	0	hbjhgghfcrhjhbjhfr	null	1	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	aaa
349	testdup2gh	testdup2h	3556	2	2	0	0	0	112	122	\N	0	0	121	0	12.00000000	1.00000000	0	0	0	0	sdhkjfskjhf	null	4	0	1	{"{\\"1\\": \\"1\\"}"}	\N	\N	\N	\N	0	aa
359	chrgetest3	chrgetest3	23475	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	fsdjbfvsjdbvhvjgh	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	127	\N	\N	1	0	ggjgvyvg
360	testprod	testprod	7876	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	gvjhgvjhvjh	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	255	\N	\N	1	0	ukygy
353	samplefortest	forlog	17199	2	3	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	admin update desc	this is test for smatt jja	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	228	\N	\N	1	0	lbc
354	unsubact	unsubact	37643	2	2	0	0	0	112	122	\N	0	0	121	1	\N	\N	0	0	0	0	fsdjsjksjfnsjefr	\N	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	127	\N	\N	1	0	adfg
355	ond_svc11	ond_svc11	4223	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	1	0	0	on demand manage	\N	2	0	1	{"{\\"1\\": \\"1\\"}"}	124	\N	\N	\N	0	4353
356	chrgetest	chrgetest	76343	2	6	0	0	0	112	122	\N	0	0	121	0	12.00000000	1.00000000	0	0	0	0	jhjfhcghcghfcghcghv	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"3\\": \\"3\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	sefwrfv
357	chrgetest1	chrgetest1	23456	2	2	0	0	0	112	122	\N	0	0	121	0	12.00000000	1.00000000	0	0	0	0	rhrthrththh	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}","{\\"4\\": \\"4\\"}"}	\N	\N	\N	\N	0	fertghy
358	chrgetest2	chrgetest2	3478	2	2	0	0	0	112	122	\N	0	0	120	0	\N	\N	0	0	0	0	sdfhskfhkhfkhvkrfhrv	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	\N	\N	\N	\N	0	jghcf
361	consentest	consentest	3434	2	2	0	0	0	112	122	\N	0	0	120	0	\N	\N	1	0	0	0	jhbjhjhkbjk	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	\N	\N	\N	\N	0	ertgertg
362	contconsent	contconsent	7655	2	2	0	0	0	111	\N	122	0	0	120	0	\N	\N	1	0	0	0	rfhgkrjhbgtjkhbg	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	\N	\N	\N	\N	0	\N
363	consentlang	consentlang	3456	2	2	0	0	0	112	123	\N	0	0	120	1	\N	\N	0	0	0	0	sdkfghksdjhgd	null	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	145	\N	\N	\N	0	ghcvg
364	consentlang1	consentlang1	74355	2	2	0	0	0	112	123	\N	0	0	120	1	\N	\N	0	1	0	0	djhbgkbjkdjbbgbb	\N	0	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	130	\N	\N	\N	0	ugvjy
365	ondmng1	ondmng1	13443	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	ondemand manage 1	null	2	0	1	{"{\\"1\\": \\"1\\"}"}	262	\N	\N	\N	0	3453
366	ondmng2	ondmng2	2543	2	2	0	0	0	112	123	\N	0	0	121	1	\N	\N	1	0	0	0	ondemand manage 2	null	3	0	1	{"{\\"1\\": \\"1\\"}","{\\"2\\": \\"2\\"}"}	124	\N	\N	\N	0	5342
\.


--
-- Data for Name: service_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_message (service_id, message_type, message_lang, message_content, message_channel, message_status) FROM stdin;
125	114	1	consent request	4	1
125	114	2	सहमति अनुरोध	4	1
125	110	1	consent request invalid	4	1
125	110	2	सहमति अनुरोध invalid	4	1
125	100	1	subscription success	1	1
125	100	2	सदस्यता सफलता	1	1
125	101	1	subscription fail	1	1
125	101	2	सदस्यता असफल	1	1
125	124	1	Already Subscribed	1	1
125	124	2	पहिले नै सदस्यता लिइएको	1	1
131	100	1	bwebwetb	2	1
131	100	2	webwetb	2	1
131	101	1		2	0
131	101	2		2	0
131	124	1		2	0
131	124	2		2	0
131	119	1		2	0
131	119	2		2	0
131	102	1		2	0
131	102	2		2	0
131	120	1		2	0
131	120	2		2	0
131	121	1		2	0
131	121	2		2	0
121	123	1	12	1	1
121	123	2	12	1	1
121	100	1		1	0
121	100	2		1	0
121	101	1		1	0
121	101	2		1	0
121	119	1		1	0
121	119	2		1	0
121	102	1		1	0
121	102	2		1	0
121	120	1		1	0
121	120	2		1	0
121	121	1		1	0
121	121	2		1	0
121	104	1		1	0
121	104	2		1	0
121	105	1		1	0
121	105	2		1	0
121	106	1		1	0
121	106	2		1	0
121	107	1		1	0
121	107	2		1	0
121	108	1		1	0
121	108	2		1	0
121	109	1		1	0
121	109	2		1	0
120	114	1	Consent Request success	1	1
120	114	2	Consent Request success NE	1	1
120	110	1	Consent Invalid	1	1
120	110	2	Consent Invalid NE	1	1
120	100	1		1	0
120	100	2		1	0
120	101	1	Unsuccessful subscription - eng	1	1
120	101	2	Unsuccessful subscription - ne	1	1
120	124	1	INsufficient balance - already	1	1
120	124	2	INsufficient balance - already - ne	1	1
120	119	1	INsufficient balance -eng	1	1
120	119	2	INsufficient balance - eng	1	1
120	102	1		1	0
120	102	2		1	0
131	104	1		2	0
131	104	2		2	0
131	105	1		2	0
131	105	2		2	0
131	106	1		2	0
131	106	2		2	0
131	107	1		2	0
131	107	2		2	0
131	108	1		2	0
131	108	2		2	0
131	109	1		2	0
131	109	2		2	0
145	117	1	tyhrtyh	4	1
145	117	2	rtyh	4	1
145	118	1	tryhrty	4	1
145	118	2	tryhrty	4	1
145	100	1		1	0
145	100	2		1	0
138	100	1	tyhe6yb	1	1
138	100	2	5e6y56	1	1
138	101	1		1	0
138	101	2		1	0
138	124	1		1	0
138	124	2		1	0
145	101	1		1	0
145	101	2		1	0
145	124	1		1	0
145	124	2		1	0
145	119	1		1	0
145	119	2		1	0
145	102	1		1	0
145	102	2		1	0
145	120	1		1	0
145	120	2		1	0
145	121	1		1	0
145	121	2		1	0
145	104	1		1	0
145	104	2		1	0
145	105	1		1	0
145	105	2		1	0
145	106	1		1	0
145	106	2		1	0
145	107	1		1	0
145	107	2		1	0
120	120	1		1	0
120	120	2		1	0
120	121	1		1	0
120	121	2		1	0
120	104	1		1	0
120	104	2		1	0
120	105	1		1	0
120	105	2		1	0
120	106	1		1	0
120	106	2		1	0
120	107	1		1	0
120	107	2		1	0
120	108	1		1	0
120	108	2		1	0
120	109	1		1	0
120	109	2		1	0
145	108	1		1	0
145	108	2		1	0
145	109	1		1	0
145	109	2		1	0
180	100	1		1	0
180	100	2		1	0
180	101	1		1	0
180	101	2		1	0
180	124	1		1	0
180	124	2		1	0
128	117	1	fvergb	4	1
128	117	2	erber	4	1
128	118	1	erberg	4	1
128	118	2	erbrbrb	4	1
128	100	1	ergberg	1	1
128	100	2	ergberg	1	1
128	101	1		1	0
128	101	2		1	0
128	124	1		1	0
128	124	2		1	0
128	119	1		1	0
128	119	2		1	0
128	102	1		1	0
128	102	2		1	0
128	120	1		1	0
128	120	2		1	0
128	121	1		1	0
128	121	2		1	0
128	104	1		1	0
128	104	2		1	0
128	105	1		1	0
128	105	2		1	0
128	106	1		1	0
128	106	2		1	0
128	107	1		1	0
128	107	2		1	0
128	108	1		1	0
128	108	2		1	0
128	109	1		1	0
128	109	2		1	0
132	114	1	rthert	4	1
132	114	2	rther	4	1
132	110	1	trhert	4	1
132	110	2	erthtr	4	1
132	117	1	thtrh	4	1
132	117	2	rtherth	4	1
127	114	1	Consent Request Message - EN	4	1
127	114	2	Consent Request Message - NP	4	1
127	110	1	Consent Invalid Message - EN	4	1
127	110	2	Consent Invalid Message - EN	4	1
127	100	1		2	0
127	100	2		2	0
127	101	1		2	0
127	101	2		2	0
127	124	1		2	0
127	124	2		2	0
190	100	1		1	0
190	100	2		1	0
190	101	1		1	0
190	101	2		1	0
190	124	1		1	0
190	124	2		1	0
190	119	1		1	0
190	119	2		1	0
190	102	1		1	0
190	102	2		1	0
190	120	1		1	0
190	120	2		1	0
190	121	1		1	0
190	121	2		1	0
190	104	1		1	0
190	104	2		1	0
190	105	1		1	0
190	105	2		1	0
190	106	1		1	0
190	106	2		1	0
132	118	1	rthert	4	1
132	118	2	erther	4	1
132	100	1		1	0
132	100	2		1	0
132	101	1		1	0
132	101	2		1	0
132	124	1		1	0
132	124	2		1	0
132	119	1		1	0
132	119	2		1	0
132	102	1		1	0
132	102	2		1	0
132	120	1		1	0
132	120	2		1	0
132	121	1		1	0
132	121	2		1	0
132	104	1		1	0
132	104	2		1	0
132	105	1		1	0
132	105	2		1	0
132	106	1		1	0
132	106	2		1	0
132	107	1		1	0
132	107	2		1	0
132	108	1		1	0
132	108	2		1	0
132	109	1		1	0
208	100	1		1	0
190	107	1		1	0
190	107	2		1	0
190	108	1		1	0
190	108	2		1	0
190	109	1		1	0
190	109	2		1	0
191	100	1		1	0
191	100	2		1	0
191	101	1		1	0
191	101	2		1	0
191	124	1		1	0
191	124	2		1	0
191	119	1		1	0
191	119	2		1	0
191	102	1		1	0
191	102	2		1	0
191	120	1		1	0
191	120	2		1	0
191	121	1		1	0
191	121	2		1	0
191	104	1		1	0
191	104	2		1	0
191	105	1		1	0
191	105	2		1	0
191	106	1		1	0
191	106	2		1	0
191	107	1		1	0
191	107	2		1	0
191	108	1		1	0
191	108	2		1	0
191	109	1		1	0
191	109	2		1	0
195	114	1	ssdsd	4	1
195	114	2	XASS	4	1
182	123	1	123123	1	1
182	123	2	123123	1	1
182	100	1		1	0
182	100	2		1	0
182	101	1		1	0
182	101	2		1	0
182	124	1		1	0
182	124	2		1	0
182	119	1		1	0
182	119	2		1	0
182	102	1		1	0
182	102	2		1	0
182	120	1		1	0
182	120	2		1	0
182	121	1		1	0
182	121	2		1	0
182	104	1		1	0
182	104	2		1	0
182	105	1		1	0
182	105	2		1	0
182	106	1		1	0
182	106	2		1	0
182	107	1		1	0
132	109	2		1	0
237	117	1	eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee	4	1
237	117	2	nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn	4	1
237	118	1	ppppppppppppppppppppppppppppppppppppp	4	1
237	118	2	qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq	4	1
237	100	1		1	0
237	100	2		1	0
237	125	1		1	0
175	114	1	test test	1	1
175	114	2	test test	1	1
175	110	1	test test	1	1
175	110	2	test test	1	1
175	100	1		1	0
175	100	2		1	0
175	101	1		1	0
175	101	2		1	0
175	124	1		1	0
175	124	2		1	0
175	119	1		1	0
175	119	2		1	0
175	102	1		1	0
175	102	2		1	0
175	120	1		1	0
175	120	2		1	0
175	121	1		1	0
175	121	2		1	0
175	104	1		1	0
175	104	2		1	0
175	105	1		1	0
175	105	2		1	0
175	106	1		1	0
175	106	2		1	0
175	107	1		1	0
175	107	2		1	0
175	108	1		1	0
182	107	2		1	0
182	108	1		1	0
182	108	2		1	0
182	109	1		1	0
182	109	2		1	0
185	114	1	Do you want to subscribe ?	4	1
185	114	2	के तपाई सदस्यता लिन चाहानुहुन्छ?	4	1
185	110	1	Invalid input	4	1
185	110	2	अवैध इनपुट	4	1
185	100	1	Successful subscription	2	1
175	108	2		1	0
175	109	1		1	0
175	109	2		1	0
152	114	1	Consent1	4	1
152	114	2	Consent1 ne	4	1
152	110	1	Invalid - end	4	1
152	110	2	Consent1-ne	4	1
152	100	1		2	0
152	100	2		2	0
152	101	1		2	0
152	101	2		2	0
152	124	1		2	0
152	124	2		2	0
185	100	2	सफल सदस्यता	2	1
185	101	1	Unsuccessful subscription	2	1
185	101	2	असफल सदस्यता	2	1
185	124	1	Already subscription	2	1
185	124	2	पहिले नै सदस्यता	2	1
207	100	1		1	0
207	100	2		1	0
207	101	1		1	0
207	101	2		1	0
183	123	1	wqweqwe	2	1
183	123	2	qwwew	2	1
183	100	1		1	0
183	100	2		1	0
183	101	1		1	0
183	101	2		1	0
183	124	1		1	0
183	124	2		1	0
183	119	1		1	0
183	119	2		1	0
183	102	1		1	0
183	102	2		1	0
183	120	1		1	0
183	120	2		1	0
183	121	1		1	0
183	121	2		1	0
183	104	1		1	0
183	104	2		1	0
183	105	1		1	0
183	105	2		1	0
183	106	1		1	0
183	106	2		1	0
183	107	1		1	0
183	107	2		1	0
207	124	1		1	0
183	108	1		1	0
183	108	2		1	0
183	109	1		1	0
183	109	2		1	0
177	114	1	we ha	4	1
177	114	2	we ha	4	1
177	110	1	we ha	4	1
177	110	2	we ha	4	1
177	100	1		2	0
177	100	2		2	0
177	101	1		2	0
129	100	1	rthrt	1	1
129	100	2	wetrhwet	1	1
129	101	1		1	0
129	101	2		1	0
129	124	1		1	0
129	124	2		1	0
129	119	1		1	0
129	119	2		1	0
129	102	1		1	0
129	102	2		1	0
129	120	1		1	0
129	120	2		1	0
129	121	1		1	0
129	121	2		1	0
129	104	1		1	0
129	104	2		1	0
129	105	1		1	0
129	105	2		1	0
129	106	1		1	0
129	106	2		1	0
129	107	1		1	0
129	107	2		1	0
129	108	1		1	0
129	108	2		1	0
129	109	1		1	0
129	109	2		1	0
133	114	1	drthdrth	4	1
133	114	2	drthdrth	4	1
133	110	1	rthdrt	4	1
133	110	2	dtrhdrth	4	1
133	123	1	rthdrth	1	1
133	123	2	drthtrh	1	1
133	100	1	fevwefv	1	1
133	100	2	wefvwe	1	1
133	101	1		1	0
133	101	2		1	0
133	124	1		1	0
133	124	2		1	0
133	119	1		1	0
133	119	2		1	0
133	102	1		1	0
133	102	2		1	0
133	120	1		1	0
133	120	2		1	0
133	121	1		1	0
133	121	2		1	0
133	104	1		1	0
133	104	2		1	0
133	105	1		1	0
133	105	2		1	0
133	106	1		1	0
133	106	2		1	0
133	107	1		1	0
133	107	2		1	0
133	108	1		1	0
133	108	2		1	0
133	109	1		1	0
133	109	2		1	0
177	101	2		2	0
177	124	1		2	0
177	124	2		2	0
137	114	1	erthberth	4	1
137	114	2	trherth	4	1
137	110	1	erthet	4	1
137	110	2	erthetr	4	1
139	100	1		1	0
139	100	2		1	0
139	101	1		1	0
139	101	2		1	0
139	124	1		1	0
139	124	2		1	0
141	114	1	yrtyh	4	1
141	114	2	rtyhrty	4	1
141	110	1	rtyh	4	1
141	110	2	tyhrt	4	1
141	100	1	hjtyjrty	2	0
141	100	2	rtyjrty	2	0
141	101	1		2	0
141	101	2		2	0
141	124	1		2	0
141	124	2		2	0
187	114	1	x1	4	1
187	114	2	x2	4	1
187	110	1	x3	4	1
187	110	2	x4	4	1
187	100	1		1	0
187	100	2		1	0
187	101	1		1	0
187	101	2		1	0
187	124	1		1	0
187	124	2		1	0
187	119	1		1	0
187	119	2		1	0
187	102	1		1	0
187	102	2		1	0
187	120	1		1	0
187	120	2		1	0
187	121	1		1	0
187	121	2		1	0
187	104	1		1	0
187	104	2		1	0
187	105	1		1	0
187	105	2		1	0
187	106	1		1	0
187	106	2		1	0
187	107	1		1	0
187	107	2		1	0
187	108	1		1	0
187	108	2		1	0
187	109	1		1	0
187	109	2		1	0
155	114	1	msg succss	4	1
155	114	2	msg succss NE	4	1
155	110	1	msg unsuccss	4	1
155	110	2	msg unsuccss NE	4	1
155	100	1		1	0
155	100	2		1	0
155	101	1		1	0
155	101	2		1	0
155	124	1		1	0
155	124	2		1	0
155	119	1		1	0
155	119	2		1	0
155	102	1		1	0
155	102	2		1	0
155	120	1		1	0
155	120	2		1	0
155	121	1		1	0
155	121	2		1	0
155	104	1		1	0
155	104	2		1	0
155	105	1		1	0
155	105	2		1	0
155	106	1		1	0
155	106	2		1	0
155	107	1		1	0
155	107	2		1	0
155	108	1		1	0
155	108	2		1	0
155	109	1		1	0
155	109	2		1	0
237	125	2		1	0
237	101	1		1	0
237	101	2		1	0
237	124	1		1	0
237	124	2		1	0
237	119	1		1	0
237	119	2		1	0
237	102	1		1	0
237	102	2		1	0
237	120	1		1	0
237	120	2		1	0
237	121	1		1	0
237	121	2		1	0
237	104	1		1	0
237	104	2		1	0
237	105	1		1	0
237	105	2		1	0
237	106	1		1	0
237	106	2		1	0
237	107	1		1	0
237	107	2		1	0
237	108	1		1	0
237	108	2		1	0
237	109	1		1	0
237	109	2		1	0
254	114	1	give consent - english	1	1
254	114	2	give consent - nepal	1	1
254	110	1	invalid consent - english	1	1
254	110	2	invalid consent - nepal	1	1
254	100	1	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - english	1	1
254	100	2	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - nepal	1	1
254	101	1		1	0
254	101	2		1	0
254	124	1		1	0
153	114	1	Do you need to subscribe?	4	1
153	114	2	Do you need to subscribe?ne	4	1
153	110	1	Invalid input	4	1
153	110	2	Invalid input - ne	4	1
153	100	1		1	0
153	100	2		1	0
153	101	1		1	0
153	101	2		1	0
153	124	1		1	0
153	124	2		1	0
153	119	1		1	0
153	119	2		1	0
153	102	1		1	0
153	102	2		1	0
153	120	1		1	0
153	120	2		1	0
153	121	1		1	0
153	121	2		1	0
153	104	1		1	0
153	104	2		1	0
153	105	1		1	0
153	105	2		1	0
153	106	1		1	0
153	106	2		1	0
153	107	1		1	0
153	107	2		1	0
153	108	1		1	0
153	108	2		1	0
153	109	1		1	0
153	109	2		1	0
207	124	2		1	0
209	114	1	hello consent request -english	1	1
209	114	2	hello consent request -nepali	1	1
209	110	1	invalid consent - english	1	1
209	110	2	invalid consent - nepali	1	1
254	124	2		1	0
254	119	1		1	0
254	119	2		1	0
255	114	1	eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee	1	1
255	114	2	nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn	1	1
255	110	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
255	110	2	yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy	1	1
255	100	1	Daily Renewal <AMOUNT> service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - english	1	1
255	100	2	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied  <AMOUNT> nepali	1	1
255	101	1		1	0
255	101	2		1	0
255	124	1		1	0
255	124	2		1	0
255	119	1		1	0
208	100	2		1	0
192	100	1		2	0
192	100	2		2	0
192	101	1		2	0
192	101	2		2	0
192	124	1		2	0
192	124	2		2	0
192	119	1		2	0
192	119	2		2	0
192	102	1		2	0
192	102	2		2	0
192	120	1		2	0
192	120	2		2	0
192	121	1		2	0
192	121	2		2	0
192	104	1		2	0
192	104	2		2	0
192	105	1		2	0
192	105	2		2	0
192	106	1		2	0
192	106	2		2	0
192	107	1		2	0
192	107	2		2	0
192	108	1		2	0
192	108	2		2	0
192	109	1		2	0
192	109	2		2	0
195	110	1	HAH	4	1
195	110	2	HAHHA	4	1
195	100	1		1	0
195	100	2		1	0
195	101	1		1	0
195	101	2		1	0
195	124	1		1	0
195	124	2		1	0
213	100	1		1	0
213	100	2		1	0
213	101	1	succefullly unsubscribed	1	1
213	101	2	succefullly unsubscribedNP	1	1
213	124	1		1	0
213	124	2		1	0
213	119	1		1	0
213	119	2		1	0
213	102	1		1	0
213	102	2		1	0
213	120	1		1	0
213	120	2		1	0
213	121	1		1	0
213	121	2		1	0
213	104	1		1	0
213	104	2		1	0
213	105	1		1	0
213	105	2		1	0
213	106	1		1	0
255	119	2		1	0
208	101	1		1	0
208	101	2		1	0
208	124	1		1	0
208	124	2		1	0
208	119	1		1	0
208	119	2		1	0
208	102	1	sucessful	1	1
208	102	2	successful	1	1
208	120	1		1	0
208	120	2		1	0
208	121	1		1	0
208	121	2		1	0
208	104	1		1	0
208	104	2		1	0
208	105	1		1	0
208	105	2		1	0
208	106	1		1	0
208	106	2		1	0
208	107	1		1	0
208	107	2		1	0
208	108	1		1	0
208	108	2		1	0
208	109	1		1	0
208	109	2		1	0
193	100	1		2	0
193	100	2		2	0
193	101	1		2	0
193	101	2		2	0
193	124	1		2	0
193	124	2		2	0
189	104	2		1	0
189	105	1		1	0
189	105	2		1	0
189	106	1	suspension success	1	1
189	106	2	suspension successNP	1	1
189	107	1	successfulyy unsubscribed	1	1
189	107	2	successfulyy unsubscribed	1	1
189	108	1		1	0
189	108	2		1	0
189	109	1		1	0
189	109	2		1	0
295	114	1	consent request	4	1
295	114	2	consent request	4	1
295	110	1	consent request	4	1
295	110	2	consent request	4	1
295	117	1	consent request - english	4	1
295	117	2	consent request - nepali	4	1
295	118	1	consent response - english	4	1
295	118	2	consent response - nepali	4	1
173	114	1	give consent	1	1
173	114	2	give consent	1	1
173	110	1	give consent	1	1
173	110	2	give consent	1	1
173	117	1	need consent	4	1
173	117	2	need consent	4	1
173	118	1	need consent	4	1
173	118	2	need consent	4	1
295	100	1	successful subscription - english	1	1
241	100	1		1	0
241	100	2		1	0
241	101	1		1	0
241	101	2		1	0
241	124	1		1	0
241	124	2		1	0
241	119	1		1	0
241	119	2		1	0
241	102	1		1	0
241	102	2		1	0
241	120	1		1	0
241	120	2		1	0
241	121	1		1	0
241	121	2		1	0
241	104	1		1	0
241	104	2		1	0
241	105	1		1	0
241	105	2		1	0
241	106	1		1	0
241	106	2		1	0
241	107	1		1	0
241	107	2		1	0
241	108	1		1	0
241	108	2		1	0
241	109	1		1	0
241	109	2		1	0
295	100	2	successful subscription - nepali	1	1
295	101	1	unsuccessful subscription - english	1	1
295	101	2	unsuccessful subscription - nepali	1	1
295	124	1		1	0
295	124	2		1	0
295	119	1		1	0
295	119	2		1	0
295	102	1		1	0
295	102	2		1	0
295	120	1		1	0
295	120	2		1	0
295	121	1		1	0
295	121	2		1	0
295	104	1		1	0
197	100	1		1	0
197	100	2		1	0
197	101	1		1	0
197	101	2		1	0
197	124	1		1	0
197	124	2		1	0
197	119	1		1	0
197	119	2		1	0
197	102	1		1	0
197	102	2		1	0
197	120	1		1	0
197	120	2		1	0
197	121	1		1	0
197	121	2		1	0
197	104	1		1	0
197	104	2		1	0
197	105	1		1	0
197	105	2		1	0
197	106	1		1	0
197	106	2		1	0
197	107	1		1	0
197	107	2		1	0
197	108	1		1	0
197	108	2		1	0
197	109	1		1	0
197	109	2		1	0
295	104	2		1	0
295	105	1		1	0
295	105	2		1	0
295	106	1		1	0
295	106	2		1	0
295	107	1	unsubscription -----------------xxxxxxxxxxxxxx-------------------ENG	1	1
295	107	2	unsubscription -----------------xxxxxxxxxxxxxx-------------------NEP	1	1
119	114	1	test	4	1
119	114	2	test	4	1
119	110	1	test	4	1
119	110	2	test	4	1
119	100	1	Hi, <SMS_ALIAS> service is successfully subscribed for Rs. <AMOUNT>+<TAX>(taxes) . Dial 00001 to enjoy the service.	2	1
119	100	2	Hi, <SMS_ALIAS> service is successfully subscribed for Rs. <AMOUNT>+<TAX>(taxes) . Dial 00001 to enjoy the service.	2	1
119	125	1		2	0
119	125	2		2	0
119	101	1	Unsuccessful subscription	2	1
119	101	2	असफल सदस्यता	2	1
119	124	1		2	0
119	124	2		2	0
119	119	1	Insufficient balance	2	1
119	119	2	अपर्याप्त ब्यालेन्स	2	1
300	114	1	consent	4	1
213	106	2		1	0
213	107	1	successfulyy unsubscribed	1	1
213	107	2	successfulyy unsubscribed	1	1
213	108	1		1	0
213	108	2		1	0
213	109	1		1	0
213	109	2		1	0
300	114	2	consent	4	1
324	100	1		1	0
324	100	2		1	0
324	125	1		1	0
324	125	2		1	0
324	101	1		1	0
324	101	2		1	0
324	124	1		1	0
324	124	2		1	0
324	119	1		1	0
324	119	2		1	0
324	102	1		1	0
198	100	1		1	0
198	100	2		1	0
198	101	1		1	0
198	101	2		1	0
198	124	1		1	0
198	124	2		1	0
324	102	2		1	0
324	120	1		1	0
324	120	2		1	0
324	121	1		1	0
324	121	2		1	0
324	104	1		1	0
324	104	2		1	0
324	105	1		1	0
324	105	2		1	0
324	106	1		1	0
324	106	2		1	0
242	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxx - english	1	1
242	114	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxx - nepali	1	1
242	110	1	uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu - english	1	1
242	110	2	uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu - nepali	1	1
242	117	1	test positive consent -english	4	1
242	117	2	test positive consent -nepali	4	1
242	118	1	test invalid consent -english	4	1
242	118	2	test invalid consent -nepali	4	1
242	100	1		1	0
242	100	2		1	0
242	101	1		1	0
242	101	2		1	0
242	124	1		1	0
324	107	1	Unsubscription msg	1	0
324	107	2		1	0
324	108	1		1	0
324	108	2		1	0
324	109	1		1	0
324	109	2		1	0
228	100	1		1	0
228	100	2		1	0
228	101	1		1	0
228	101	2		1	0
228	124	1		1	0
228	124	2		1	0
228	119	1		1	0
228	119	2		1	0
228	102	1		1	0
228	102	2		1	0
228	120	1		1	0
228	120	2		1	0
228	121	1		1	0
228	121	2		1	0
228	104	1		1	0
228	104	2		1	0
228	105	1		1	0
228	105	2		1	0
228	106	1		1	0
228	106	2		1	0
228	107	1		1	0
228	107	2		1	0
228	108	1		1	0
228	108	2		1	0
176	100	1		1	0
176	100	2		1	0
176	101	1		1	0
176	101	2		1	0
176	124	1		1	0
176	124	2		1	0
176	119	1		1	0
176	119	2		1	0
176	102	1		1	0
176	102	2		1	0
176	120	1		1	0
176	120	2		1	0
176	121	1		1	0
176	121	2		1	0
176	104	1		1	0
176	104	2		1	0
176	105	1		1	0
176	105	2		1	0
176	106	1		1	0
176	106	2		1	0
176	107	1		1	0
176	107	2		1	0
176	108	1		1	0
176	108	2		1	0
176	109	1		1	0
176	109	2		1	0
201	114	1	test test	1	1
201	114	2	test test	1	1
201	110	1	test test	1	1
201	110	2	test test	1	1
201	100	1		1	0
201	100	2		1	0
201	101	1		1	0
201	101	2		1	0
201	124	1		1	0
201	124	2		1	0
201	119	1		1	0
201	119	2		1	0
201	102	1		1	0
201	102	2		1	0
201	120	1		1	0
201	120	2		1	0
201	121	1		1	0
201	121	2		1	0
201	104	1		1	0
201	104	2		1	0
201	105	1		1	0
201	105	2		1	0
201	106	1		1	0
201	106	2		1	0
201	107	1		1	0
201	107	2		1	0
201	108	1		1	0
201	108	2		1	0
201	109	1		1	0
201	109	2		1	0
202	114	1	request consent	1	1
202	114	2	request consent	1	1
202	110	1	request consent	1	1
202	110	2	request consent	1	1
202	117	1	positive consent	4	1
202	117	2	positive consent	4	1
202	118	1	positive consent	4	1
202	118	2	positive consent	4	1
202	100	1		1	0
202	100	2		1	0
202	101	1		1	0
202	101	2		1	0
202	124	1		1	0
202	124	2		1	0
202	119	1		1	0
202	119	2		1	0
202	102	1		1	0
202	102	2		1	0
202	120	1		1	0
202	120	2		1	0
202	121	1		1	0
202	121	2		1	0
202	104	1		1	0
202	104	2		1	0
202	105	1		1	0
202	105	2		1	0
202	106	1		1	0
202	106	2		1	0
202	107	1		1	0
202	107	2		1	0
202	108	1		1	0
202	108	2		1	0
202	109	1		1	0
202	109	2		1	0
203	114	1	terset etsts	1	1
203	114	2	terset etsts	1	1
203	110	1	terset etsts	1	1
203	110	2	terset etsts	1	1
203	100	1		1	0
203	100	2		1	0
203	101	1		1	0
203	101	2		1	0
203	124	1		1	0
203	124	2		1	0
228	109	1		1	0
228	109	2		1	0
119	102	1	Hi, <SMS_ALIAS> service is successfully renewed for Rs. <AMOUNT>+<TAX>(taxes) . Dial 00001 to enjoy the service.	2	1
119	102	2	Hi, <SMS_ALIAS> service is successfully renewed for Rs. <AMOUNT>+<TAX>(taxes) . Dial 00001 to enjoy the service.	2	1
119	120	1	Insufficient balance - renewal	2	1
119	120	2	अपर्याप्त ब्यालेन्स - renewal	2	1
119	121	1	Renewal Unsuccess Due to Other Reasons	2	1
119	121	2	अन्य कारणहरूको कारण नविकरण असफल	2	1
119	104	1	Grace period	2	1
119	104	2	अनुग्रह अवधि	2	1
119	105	1		2	0
119	105	2		2	0
119	106	1		2	0
119	106	2		2	0
119	107	1	Unsuccessful subscription	2	1
119	107	2	असफल सदस्यता	2	1
119	108	1	Opt in message	2	0
119	108	2	Opt in message - ne	2	0
119	109	1	Opt out message	2	1
119	109	2	Opt out message - ne	2	1
126	100	1	Successful subscription	1	1
288	114	1	wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww	1	1
288	114	2	wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww	1	1
288	110	1	wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww	1	1
288	110	2	wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww	1	1
288	117	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
288	117	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
210	100	1	ENGLISH xxxxxxxxxxxxxxxxxxxx	1	1
210	100	2	NEPALI yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy	1	1
210	101	1	ENGLISH fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff	1	1
210	101	2	NEPALI fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff	1	1
210	124	1	xxxxxxxxxxxxxxxxxx - ENGLISH- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
210	124	2	nnnnnnnnnnnnnnnn- NEPALI - nnnnnnnnnnnnnnnnnnnnnnnnnnn	1	1
210	119	1	LOWwwwwwwwwwwwwwwwwwwwwwwwwwwww-ENGLISH	1	1
210	119	2	LOWwwwwwwwwwwwwwwwwwwwwwwwwwwww---NEPALI	1	1
210	102	1		1	0
210	102	2		1	0
210	120	1		1	0
210	120	2		1	0
210	121	1		1	0
210	121	2		1	0
210	104	1		1	0
210	104	2		1	0
210	105	1		1	0
210	105	2		1	0
210	106	1		1	0
210	106	2		1	0
210	107	1		1	0
210	107	2		1	0
210	108	1		1	0
210	108	2		1	0
210	109	1		1	0
210	109	2		1	0
288	118	1	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	4	1
288	118	2	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	4	1
288	100	1	ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg	1	1
288	100	2	ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg	1	1
288	125	1		1	0
256	123	1	Hi, <SMS_ALIAS> service is will be renewed for Rs. <AMOUNT>+<TAX>(taxes) on <EXPIRY>.	1	1
256	123	2	Hi, <SMS_ALIAS> service is will be renewed for Rs. <AMOUNT>+<TAX>(taxes) on <EXPIRY>.	1	1
256	100	1	aaaa	1	1
256	100	2	aaaa	1	1
256	125	1		1	0
256	125	2		1	0
256	101	1		1	0
325	100	1		1	0
325	100	2		1	0
172	114	1	succes	4	1
172	114	2	succes  NE	4	1
172	110	1	unsuccess	4	1
172	110	2	unsuccess NE	4	1
172	100	1		1	0
172	100	2		1	0
172	101	1		1	0
172	101	2		1	0
172	124	1		1	0
172	124	2		1	0
217	100	1	xxxxxxxxxxxxxxxxxxxxxxxxx----SUCCESS-ENGLISH----xxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
217	100	2	xxxxxxxxxxxxxxxxxxxxxxxxx----SUCCESS-NEPALI----xxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
217	101	1	xxxxxxxxxxxxxxxxxxxxxxxxx----FAIL-ENGLISH----xxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
217	101	2	xxxxxxxxxxxxxxxxxxxxxxxxx----FAIL-NEPALI----xxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
217	124	1	xxxxxxxxxxxxxxxxxxxxxxxxx----ALREADY-ENGLISH----xxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
217	124	2	xxxxxxxxxxxxxxxxxxxxxxxxx----ALREADY-NEPALI----xxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
230	100	1		1	0
230	100	2		1	0
230	101	1		1	0
230	101	2		1	0
230	124	1		1	0
230	124	2		1	0
230	119	1		1	0
230	119	2		1	0
230	102	1		1	0
230	102	2		1	0
230	120	1		1	0
230	120	2		1	0
230	121	1		1	0
230	121	2		1	0
230	104	1		1	0
230	104	2		1	0
230	105	1		1	0
230	105	2		1	0
230	106	1		1	0
230	106	2		1	0
230	107	1		1	0
230	107	2		1	0
230	108	1		1	0
230	108	2		1	0
230	109	1		1	0
230	109	2		1	0
232	100	1		1	0
232	100	2		1	0
232	101	1		1	0
232	101	2		1	0
232	124	1		1	0
232	124	2		1	0
232	119	1		1	0
232	119	2		1	0
232	102	1		1	0
232	102	2		1	0
232	120	1		1	0
232	120	2		1	0
232	121	1		1	0
232	121	2		1	0
232	104	1		1	0
232	104	2		1	0
232	105	1		1	0
232	105	2		1	0
232	106	1		1	0
232	106	2		1	0
232	107	1		1	0
232	107	2		1	0
232	108	1		1	0
232	108	2		1	0
232	109	1		1	0
232	109	2		1	0
233	100	1		1	0
233	100	2		1	0
233	101	1		1	0
233	101	2		1	0
211	100	1		1	0
211	100	2		1	0
211	101	1		1	0
211	101	2		1	0
211	124	1		1	0
211	124	2		1	0
218	114	1	Consent Request Message English 1001	1	1
218	114	2	Consent Request Message Nepali 1001	1	1
218	110	1	Consent Invalid Message English 1001	1	1
218	110	2	Consent Invalid Message Nepali 1001	1	1
218	100	1	Successful Subscription English 1001	1	1
218	100	2	Successful Subscription Nepali 1001	1	1
218	101	1	Unsuccessful Subscription English 1001	1	1
218	101	2	Unsuccessful Subscription Nepali 1001	1	1
218	124	1		1	0
218	124	2		1	0
325	125	1		1	0
325	125	2		1	0
325	101	1		1	0
325	101	2		1	0
325	124	1		1	0
233	124	1		1	0
233	124	2		1	0
212	114	1	zzzzzzzzzz----ENGLISH-consent request	1	1
212	114	2	zzzzzzzzzz----NEPALI-consent request	1	1
212	110	1	zzzzzzzzzz----ENGLISH-consent response	1	1
212	110	2	zzzzzzzzzz----NEPALI-consent response	1	1
212	100	1	xxxxxxxxxxxxxxxxxxxxxx---ENGLISH--success	1	0
212	100	2	xxxxxxxxxxxxxxxxxxxxxx---NEPALI--success	1	0
212	101	1	xxxxxxxxxxxxxxxxxxxxxx---ENGLISH--unsuccess	1	0
212	101	2	xxxxxxxxxxxxxxxxxxxxxx---NEPALI--unsuccess	1	0
212	124	1	xxxxxxxxxxxxxxxxxxxxxx---ENGLISH--already	1	0
212	124	2	xxxxxxxxxxxxxxxxxxxxxx---NEPALI--already	1	0
242	124	2		1	0
242	119	1		1	0
242	119	2		1	0
242	102	1		1	0
242	102	2		1	0
242	120	1		1	0
242	120	2		1	0
242	121	1		1	0
242	121	2		1	0
242	104	1		1	0
242	104	2		1	0
242	105	1		1	0
242	105	2		1	0
242	106	1		1	0
242	106	2		1	0
242	107	1		1	0
242	107	2		1	0
242	108	1		1	0
242	108	2		1	0
242	109	1		1	0
242	109	2		1	0
231	100	1		1	0
231	100	2		1	0
231	101	1		1	0
231	101	2		1	0
231	124	1		1	0
231	124	2		1	0
231	119	1		1	0
231	119	2		1	0
325	124	2		1	0
325	119	1		1	0
325	119	2		1	0
325	102	1		1	0
325	102	2		1	0
325	120	1		1	0
325	120	2		1	0
244	100	1		1	0
244	100	2		1	0
244	125	1		1	0
244	125	2		1	0
244	101	1		1	0
244	101	2		1	0
244	124	1		1	0
244	124	2		1	0
244	119	1		1	0
244	119	2		1	0
244	102	1		1	0
244	102	2		1	0
244	120	1		1	0
244	120	2		1	0
244	121	1		1	0
244	121	2		1	0
244	104	1		1	0
244	104	2		1	0
244	105	1		1	0
225	100	1		1	0
225	100	2		1	0
225	101	1		1	0
225	101	2		1	0
225	124	1		1	0
225	124	2		1	0
225	119	1		1	0
225	119	2		1	0
225	102	1		1	0
225	102	2		1	0
225	120	1		1	0
225	120	2		1	0
225	121	1		1	0
225	121	2		1	0
225	104	1		1	0
225	104	2		1	0
225	105	1		1	0
225	105	2		1	0
225	106	1		1	0
225	106	2		1	0
225	107	1		1	0
225	107	2		1	0
225	108	1		1	0
225	108	2		1	0
225	109	1		1	0
225	109	2		1	0
231	102	1		1	0
231	102	2		1	0
231	120	1		1	0
231	120	2		1	0
231	121	1		1	0
231	121	2		1	0
231	104	1		1	0
231	104	2		1	0
231	105	1		1	0
231	105	2		1	0
231	106	1		1	0
231	106	2		1	0
231	107	1		1	0
231	107	2		1	0
231	108	1		1	0
231	108	2		1	0
231	109	1		1	0
231	109	2		1	0
244	105	2		1	0
244	106	1		1	0
244	106	2		1	0
244	107	1		1	0
244	107	2		1	0
244	108	1		1	0
244	108	2		1	0
244	109	1		1	0
244	109	2		1	0
251	102	2		1	0
256	101	2		1	0
256	124	1		1	0
256	124	2		1	0
256	119	1		1	0
256	119	2		1	0
256	102	1	Hi, <SMS_ALIAS> service is successfully renewed for Rs. <AMOUNT>+<TAX>(taxes) . Dial gihan1 to enjoy the service.	1	1
256	102	2	Hi, <SMS_ALIAS> service is successfully renewed for Rs. <AMOUNT>+<TAX>(taxes) . Dial gihan1 to enjoy the service.	1	1
256	120	1		1	0
256	120	2		1	0
256	121	1		1	0
256	121	2		1	0
256	104	1		1	0
256	104	2		1	0
256	105	1		1	0
256	105	2		1	0
256	106	1		1	0
256	106	2		1	0
256	107	1		1	0
256	107	2		1	0
256	108	1		1	0
256	108	2		1	0
256	109	1		1	0
256	109	2		1	0
126	100	2	सफल सदस्यता	1	1
126	101	1	Unsuccessful subscription	1	1
126	101	2	असफल सदस्यता	1	1
126	124	1	Already subscription	1	1
126	124	2	पहिले नै सदस्यता	1	1
126	119	1		1	0
325	121	1		1	0
325	121	2		1	0
325	104	1		1	0
236	100	1		1	0
236	100	2		1	0
236	101	1		1	0
236	101	2		1	0
236	124	1		1	0
236	124	2		1	0
236	119	1		1	0
236	119	2		1	0
236	102	1		1	0
236	102	2		1	0
236	120	1		1	0
236	120	2		1	0
236	121	1		1	0
236	121	2		1	0
236	104	1		1	0
236	104	2		1	0
236	105	1		1	0
236	105	2		1	0
236	106	1		1	0
236	106	2		1	0
236	107	1		1	0
236	107	2		1	0
236	108	1		1	0
236	108	2		1	0
236	109	1		1	0
236	109	2		1	0
126	119	2		1	0
269	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
269	114	2	yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy	1	1
269	110	1	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	1	1
269	110	2	bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb	1	1
269	100	1		1	0
269	100	2		1	0
269	125	1		1	0
269	125	2		1	0
269	101	1		1	0
269	101	2		1	0
269	124	1		1	0
269	124	2		1	0
269	119	1		1	0
269	119	2		1	0
269	102	1		1	0
269	102	2		1	0
269	120	1		1	0
269	120	2		1	0
269	121	1		1	0
269	121	2		1	0
269	104	1		1	0
269	104	2		1	0
269	105	1		1	0
269	105	2		1	0
269	106	1		1	0
269	106	2		1	0
269	107	1		1	0
269	107	2		1	0
269	108	1		1	0
269	108	2		1	0
269	109	1		1	0
269	109	2		1	0
288	125	2		1	0
288	101	1		1	0
303	100	1		1	0
303	100	2		1	0
303	101	1		1	0
303	101	2		1	0
303	124	1		1	0
234	100	1		1	0
234	100	2		1	0
234	101	1		1	0
234	101	2		1	0
234	124	1		1	0
234	124	2		1	0
249	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-english	1	1
249	114	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-nepali	1	1
249	110	1	yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy--english	1	1
249	110	2	yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy--nepali	1	1
249	100	1	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - english	1	1
249	100	2	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - nepali	1	1
251	120	1		1	0
251	120	2		1	0
251	121	1		1	0
251	121	2		1	0
251	104	1		1	0
251	104	2		1	0
251	105	1		1	0
251	105	2		1	0
251	106	1		1	0
251	106	2		1	0
251	107	1		1	0
251	107	2		1	0
288	101	2		1	0
288	124	1		1	0
288	124	2		1	0
288	119	1		1	0
288	119	2		1	0
288	102	1		1	0
288	102	2		1	0
288	120	1		1	0
288	120	2		1	0
288	121	1		1	0
288	121	2		1	0
288	104	1		1	0
288	104	2		1	0
288	105	1		1	0
288	105	2		1	0
288	106	1		1	0
288	106	2		1	0
288	107	1		1	0
288	107	2		1	0
189	114	1	g	1	1
189	114	2	g	1	1
189	110	1	g	1	1
189	110	2	g	1	1
189	100	1		1	0
189	100	2		1	0
189	101	1	succefully removed	1	0
189	101	2	succefully removed	1	0
189	124	1		1	0
189	124	2		1	0
189	119	1		1	0
189	119	2		1	0
189	102	1		1	0
189	102	2		1	0
189	120	1		1	0
189	120	2		1	0
189	121	1		1	0
189	121	2		1	0
189	104	1		1	0
250	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
250	114	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
250	110	1	yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy	1	1
250	110	2	yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy	1	1
250	100	1		2	0
250	100	2		2	0
250	101	1		2	0
250	101	2		2	0
250	124	1		2	0
250	124	2		2	0
249	125	1	Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.Dial - english	1	1
249	125	2	Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.Dial-nepali	1	1
249	101	1		1	0
249	101	2		1	0
249	124	1		1	0
249	124	2		1	0
249	119	1		1	0
249	119	2		1	0
249	102	1		1	0
249	102	2		1	0
249	120	1		1	0
249	120	2		1	0
249	121	1		1	0
249	121	2		1	0
249	104	1		1	0
249	104	2		1	0
249	105	1		1	0
249	105	2		1	0
249	106	1		1	0
249	106	2		1	0
249	107	1		1	0
249	107	2		1	0
249	108	1		1	0
249	108	2		1	0
249	109	1		1	0
249	109	2		1	0
259	100	1	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - english	1	1
259	100	2	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - nepal	1	1
259	101	1		1	0
259	101	2		1	0
243	100	1		1	0
243	100	2		1	0
243	125	1	Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial. Updated	1	1
243	125	2	दैनिक नवीकरण सेवा सक्रिय छ। रमाईलो गर्नुहोस् <DAYS> दिनका लागि निःशुल्क! रु। <AMOUNT> + <TAX> (करहरू) नि: शुल्क परीक्षण पछि लागू हुनेछ। Updated	1	1
243	101	1		1	0
243	101	2		1	0
243	124	1		1	0
243	124	2		1	0
243	119	1		1	0
243	119	2		1	0
243	102	1		1	0
243	102	2		1	0
243	120	1		1	0
243	120	2		1	0
243	121	1		1	0
243	121	2		1	0
243	104	1		1	0
243	104	2		1	0
243	105	1		1	0
243	105	2		1	0
243	106	1		1	0
243	106	2		1	0
243	107	1		1	0
243	107	2		1	0
243	108	1		1	0
243	108	2		1	0
243	109	1		1	0
243	109	2		1	0
259	124	1		1	0
259	124	2		1	0
259	119	1		1	0
259	119	2		1	0
288	108	1		1	0
288	108	2		1	0
288	109	1		1	0
288	109	2		1	0
290	114	1	consent request English	1	1
290	114	2	consent request Nepali	1	1
290	110	1	consent invalid English	1	1
290	110	2	consent invalid Nepali	1	1
290	100	1	successful subscription english	1	1
290	100	2	successful subscription nepal	1	1
290	125	1		1	0
290	125	2		1	0
290	101	1		1	0
290	101	2		1	0
290	124	1		1	0
290	124	2		1	0
290	119	1		1	0
290	119	2		1	0
290	102	1		1	0
290	102	2		1	0
290	120	1		1	0
290	120	2		1	0
290	121	1		1	0
290	121	2		1	0
290	104	1		1	0
290	104	2		1	0
290	105	1		1	0
290	105	2		1	0
290	106	1		1	0
290	106	2		1	0
290	107	1		1	0
290	107	2		1	0
290	108	1		1	0
290	108	2		1	0
290	109	1		1	0
290	109	2		1	0
303	124	2		1	0
303	119	1		1	0
303	119	2		1	0
304	100	1		1	0
304	100	2		1	0
304	101	1		1	0
304	101	2		1	0
304	124	1		1	0
284	100	1	success -------------------------english	1	1
284	100	2	success -------------------------nepali	1	1
284	101	1		1	0
284	101	2		1	0
284	124	1		1	0
284	124	2		1	0
284	119	1		1	0
284	119	2		1	0
304	124	2		1	0
304	119	1		1	0
304	119	2		1	0
285	100	1	success--xxxxxxxxxxxx-xxxxxxxxxx----english	1	1
285	100	2	success--xxxxxxxxxxxx-xxxxxxxxxx----nepal	1	1
285	101	1		1	0
285	101	2		1	0
285	124	1		1	0
285	124	2		1	0
285	119	1		1	0
285	119	2		1	0
287	114	1	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	1	1
287	114	2	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	1	1
287	110	1	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	1	1
287	110	2	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	1	1
287	117	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
287	117	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
287	118	1	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	4	1
287	118	2	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	4	1
287	100	1	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	1	1
287	100	2	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	1	1
287	125	1		1	0
300	110	1	consent	4	1
300	110	2	consent	4	1
300	100	1		1	0
300	100	2		1	0
300	125	1		1	0
300	125	2		1	0
300	101	1		1	0
300	101	2		1	0
300	124	1		1	0
300	124	2		1	0
300	119	1		1	0
300	119	2		1	0
300	102	1		1	0
300	102	2		1	0
300	120	1		1	0
300	120	2		1	0
300	121	1		1	0
300	121	2		1	0
173	100	1	Hi ENGLISH, service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied. Dial to enjoy the service.	1	1
173	100	2	Hi NEPAL, service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied. Dial to enjoy the service.	1	1
173	125	1	Hi ENGLISH, Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.	1	1
173	125	2	Hi NEPALI, Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.	1	1
173	101	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
173	101	2	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	1	1
173	124	1		1	0
173	124	2		1	0
173	119	1		1	0
173	119	2		1	0
173	102	1		1	0
173	102	2		1	0
173	120	1		1	0
173	120	2		1	0
173	121	1		1	0
173	121	2		1	0
173	104	1		1	0
173	104	2		1	0
173	105	1		1	0
173	105	2		1	0
173	106	1		1	0
173	106	2		1	0
173	107	1		1	0
173	107	2		1	0
173	108	1		1	0
173	108	2		1	0
173	109	1		1	0
173	109	2		1	0
251	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-english	1	1
251	114	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx-nepali	1	1
251	110	1	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz-english	1	1
251	110	2	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz-nepali	1	1
251	100	1	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - english	1	1
251	100	2	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - nepali	1	1
251	101	1	Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.Dial - english	1	1
251	101	2	Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.Dial - nepali	1	1
251	124	1		1	0
251	124	2		1	0
251	119	1		1	0
251	119	2		1	0
251	102	1		1	0
300	104	1		1	0
300	104	2		1	0
300	105	1		1	0
300	105	2		1	0
300	106	1		1	0
300	106	2		1	0
300	107	1		1	0
300	107	2		1	0
300	108	1		1	0
300	108	2		1	0
300	109	1		1	0
300	109	2		1	0
306	114	1	consent	4	1
306	114	2	consent	4	1
306	110	1	consent	4	1
306	110	2	consent	4	1
306	100	1	successful	1	1
287	125	2		1	0
287	101	1		1	0
287	101	2		1	0
287	124	1		1	0
287	124	2		1	0
287	119	1		1	0
287	119	2		1	0
287	102	1		1	0
287	102	2		1	0
287	120	1		1	0
287	120	2		1	0
287	121	1		1	0
287	121	2		1	0
287	104	1		1	0
287	104	2		1	0
287	105	1		1	0
287	105	2		1	0
287	106	1		1	0
287	106	2		1	0
287	107	1		1	0
287	107	2		1	0
287	108	1		1	0
287	108	2		1	0
287	109	1		1	0
287	109	2		1	0
325	104	2		1	0
325	105	1		1	0
325	105	2		1	0
325	106	1		1	0
325	106	2		1	0
325	107	1	dffffff	1	0
325	107	2		1	0
325	108	1		1	0
325	108	2		1	0
306	100	2	successful	1	1
306	101	1		1	0
306	101	2		1	0
306	124	1		1	0
306	124	2		1	0
306	119	1		1	0
306	119	2		1	0
325	109	1		1	0
325	109	2		1	0
326	100	1		1	0
326	100	2		1	0
292	100	1		1	0
292	100	2		1	0
292	125	1		1	0
292	125	2		1	0
292	101	1		1	0
292	101	2		1	0
292	124	1		1	0
292	124	2		1	0
292	119	1		1	0
292	119	2		1	0
292	102	1		1	0
292	102	2		1	0
292	120	1		1	0
292	120	2		1	0
292	121	1		1	0
292	121	2		1	0
292	104	1		1	0
292	104	2		1	0
292	105	1		1	0
292	105	2		1	0
292	106	1		1	0
292	106	2		1	0
292	107	1		1	0
292	107	2		1	0
292	108	1		1	0
292	108	2		1	0
292	109	1		1	0
326	101	1		1	0
326	101	2		1	0
326	124	1		1	0
326	124	2		1	0
326	119	1		1	0
326	119	2		1	0
326	102	1		1	0
326	102	2		1	0
326	120	1		1	0
326	120	2		1	0
326	121	1		1	0
326	121	2		1	0
326	104	1		1	0
326	104	2		1	0
326	105	1		1	0
326	105	2		1	0
326	106	1		1	0
258	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
258	114	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
258	110	1	yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy	1	1
258	110	2	yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy	1	1
258	100	1	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - english	1	1
258	100	2	Daily Renewal service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied - nepal	1	1
258	101	1		1	0
258	101	2		1	0
258	124	1		1	0
258	124	2		1	0
258	119	1		1	0
258	119	2		1	0
326	106	2		1	0
326	107	1		1	0
326	107	2		1	0
327	100	1		1	0
327	100	2		1	0
327	101	1		1	0
327	101	2		1	0
327	124	1		1	0
327	124	2		1	0
327	119	1		1	0
327	119	2		1	0
328	114	1	consent request - english	4	1
328	114	2	consent request - nepali	4	1
328	110	1	consent invalid request - english	4	1
328	110	2	consent invalid request - nepali	4	1
305	100	1		1	0
305	100	2		1	0
305	125	1		1	0
305	125	2		1	0
305	101	1		1	0
305	101	2		1	0
305	124	1		1	0
305	124	2		1	0
305	119	1		1	0
305	119	2		1	0
305	102	1		1	0
305	102	2		1	0
305	120	1		1	0
305	120	2		1	0
305	121	1		1	0
305	121	2		1	0
305	104	1		1	0
305	104	2		1	0
305	105	1		1	0
305	105	2		1	0
305	106	1		1	0
264	100	1		1	0
264	100	2		1	0
264	125	1		1	0
264	125	2		1	0
264	101	1		1	0
264	101	2		1	0
264	124	1		1	0
264	124	2		1	0
264	119	1		1	0
264	119	2		1	0
264	102	1		1	0
264	102	2		1	0
264	120	1		1	0
264	120	2		1	0
264	121	1		1	0
264	121	2		1	0
264	104	1		1	0
264	104	2		1	0
264	105	1		1	0
264	105	2		1	0
264	106	1		1	0
264	106	2		1	0
264	107	1		1	0
264	107	2		1	0
264	108	1		1	0
264	108	2		1	0
264	109	1		1	0
264	109	2		1	0
305	106	2		1	0
305	107	1		1	0
305	107	2		1	0
305	108	1	This is the opt-out message  in ENG	1	1
305	108	2	This is the opt-out message  in NPL	1	1
305	109	1	This is the opt-in message  in ENG	1	1
305	109	2	This is the opt-in message  in NPL	1	1
328	100	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
328	100	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	1	1
328	101	1		1	0
328	101	2		1	0
328	124	1		1	0
328	124	2		1	0
328	119	1		1	0
328	119	2		1	0
330	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
330	114	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
330	110	1	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	4	1
330	110	2	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	4	1
330	100	1		1	0
330	100	2		1	0
330	101	1		1	0
330	101	2		1	0
330	124	1		1	0
330	124	2		1	0
330	119	1		1	0
330	119	2		1	0
292	109	2		1	0
359	100	1		1	0
293	100	1	Hi, Jyotish Sewa 30 Days renewal service is renewed for Rs. 60 (incl.taxes). To use, http://npjyotishsewa.com . To deactivate, send SMS <Keyword> to 17199	1	1
293	100	2	नमस्ते, ज्योतिष सेवा Day० दिन नवीकरण सेवा रु। 60 (incl.taxes)। प्रयोग गर्न, http://npjyotishsewa.com। निस्क्रिय गर्न, एसएमएस <कीवर्ड> १19१ 19 to मा पठाउनुहोस्	1	1
293	125	1		1	0
293	125	2		1	0
293	101	1		1	0
293	101	2		1	0
293	124	1		1	0
293	124	2		1	0
293	119	1		1	0
293	119	2		1	0
293	102	1		1	0
293	102	2		1	0
293	120	1		1	0
293	120	2		1	0
293	121	1		1	0
293	121	2		1	0
293	104	1		1	0
293	104	2		1	0
293	105	1		1	0
293	105	2		1	0
293	106	1		1	0
293	106	2		1	0
293	107	1		1	0
293	107	2		1	0
293	108	1		1	0
293	108	2		1	0
293	109	1		1	0
293	109	2		1	0
308	100	1	HelloWorld ENG	1	1
308	100	2	HelloWorld NPL	1	1
308	125	1		1	0
308	125	2		1	0
308	101	1		1	0
308	101	2		1	0
308	124	1		1	0
308	124	2		1	0
308	119	1		1	0
308	119	2		1	0
308	102	1		1	0
308	102	2		1	0
308	120	1		1	0
308	120	2		1	0
308	121	1		1	0
308	121	2		1	0
308	104	1		1	0
308	104	2		1	0
308	105	1		1	0
308	105	2		1	0
308	106	1		1	0
308	106	2		1	0
308	107	1		1	0
308	107	2		1	0
308	108	1		1	0
308	108	2		1	0
308	109	1		1	0
308	109	2		1	0
309	114	1	asdasdasd	4	1
309	114	2	asdasdasd	4	1
309	110	1	asdasd	4	1
309	110	2	asdasdasd	4	1
313	114	1	trt	4	1
313	114	2	sdfgf	4	1
313	110	1	dgdrfg	4	1
313	110	2	werteg	4	1
314	100	1		2	0
314	100	2		2	0
314	125	1		2	0
314	125	2		2	0
314	101	1		2	0
314	101	2		2	0
314	124	1		2	0
314	124	2		2	0
314	119	1		2	0
314	119	2		2	0
314	102	1		2	0
314	102	2		2	0
314	120	1		2	0
314	120	2		2	0
314	121	1		2	0
314	121	2		2	0
314	104	1		2	0
314	104	2		2	0
314	105	1		2	0
314	105	2		2	0
314	106	1		2	0
314	106	2		2	0
291	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
291	114	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
291	110	1	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	4	1
291	110	2	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	4	1
291	100	1		1	0
291	100	2		1	0
291	125	1		1	0
291	125	2		1	0
291	101	1		1	0
291	101	2		1	0
291	124	1		1	0
291	124	2		1	0
291	119	1		1	0
291	119	2		1	0
291	102	1		1	0
291	102	2		1	0
291	120	1		1	0
291	120	2		1	0
291	121	1		1	0
291	121	2		1	0
291	104	1		1	0
291	104	2		1	0
291	105	1		1	0
291	105	2		1	0
291	106	1		1	0
291	106	2		1	0
291	107	1		1	0
291	107	2		1	0
291	108	1		1	0
291	108	2		1	0
291	109	1		1	0
291	109	2		1	0
296	114	1	consent request - english	4	1
296	114	2	consent request - nepali	4	1
296	110	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
296	110	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
296	117	1	consent request - english	4	1
296	117	2	consent request - nepali	4	1
296	118	1	consent response - english	4	1
296	118	2	consent response - nepali	4	1
296	100	1	successfull subscription - english	1	1
296	100	2	successfull subscription - nepali	1	1
296	101	1		1	0
296	101	2		1	0
130	114	1	do you wish to subscribe?	4	1
130	114	2	do you wish to subscribe?	4	1
130	110	1	do you wish to subscribe?	4	1
130	110	2	do you wish to subscribe?	4	1
130	100	1	Successful subscription	1	1
130	100	2	सफल सदस्यता	1	1
130	125	1		1	0
130	125	2		1	0
130	101	1	Unsuccessful subscriptionता	1	1
130	101	2	असफल सदस्य	1	1
130	124	1	Already subscription	1	1
130	124	2	पहिले नै सदस्यता	1	1
297	117	1	consent for <AMOUNT>	4	1
297	117	2	consent for <AMOUNT>	4	1
297	118	1	consent for <AMOUNT>	4	1
297	118	2	consent for <AMOUNT>	4	1
297	100	1	successfully subscribed with <AMOUNT>	1	1
297	100	2	successfully subscribed with <AMOUNT>	1	1
297	125	1		1	0
297	125	2		1	0
297	101	1		1	0
297	101	2		1	0
297	124	1		1	0
297	124	2		1	0
297	119	1		1	0
297	119	2		1	0
297	102	1	successfully subscribed with <AMOUNT>	1	1
297	102	2	successfully subscribed with <AMOUNT>	1	1
297	120	1		1	0
297	120	2		1	0
297	121	1		1	0
297	121	2		1	0
297	104	1		1	0
297	104	2		1	0
297	105	1	successfully subscribed with <AMOUNT>	1	1
297	105	2	successfully subscribed with <AMOUNT>	1	1
297	106	1		1	0
297	106	2		1	0
297	107	1		1	0
297	107	2		1	0
297	108	1		1	0
297	108	2		1	0
297	109	1		1	0
297	109	2		1	0
296	124	1		1	0
296	124	2		1	0
296	119	1		1	0
296	119	2		1	0
296	102	1		1	0
296	102	2		1	0
296	120	1		1	0
296	120	2		1	0
296	121	1		1	0
296	121	2		1	0
296	104	1		1	0
296	104	2		1	0
296	105	1		1	0
296	105	2		1	0
296	106	1		1	0
296	106	2		1	0
296	107	1	successfull unsubscription - english	1	1
296	107	2	successfull unsubscription - nepali	1	1
359	100	2		1	0
359	125	1		1	0
359	125	2		1	0
359	101	1		1	0
359	101	2		1	0
359	124	1		1	0
359	124	2		1	0
359	119	1		1	0
359	119	2		1	0
359	102	1		1	0
359	102	2		1	0
359	120	1		1	0
359	120	2		1	0
359	121	1		1	0
130	119	1	Unsuccessful Subscription Insufficient Balance - EN	1	1
130	119	2	Unsuccessful Subscription Insufficient Balance - NP	1	1
130	102	1	Successful Renewal Charging - EN	1	1
130	102	2	Successful Renewal Charging - NP	1	1
130	120	1	Unsuccessful Renewal (Insufficient Balance)\t- EN	1	1
130	120	2	Unsuccessful Renewal (Insufficient Balance)\t- NP	1	1
130	121	1	Unsuccessful Renewal (Other Reasons) - EN	1	1
130	121	2	Unsuccessful Renewal (Other Reasons) - NP	1	1
130	104	1	Grace Period - EN	1	1
130	104	2	Grace Period - NP	1	1
130	105	1	Resume Subscription - EN	1	1
130	105	2	Resume Subscription - NP	1	1
130	106	1	Suspension - EN	1	1
130	106	2	Suspension - NP	1	1
130	107	1	Unsuccessful subscription	1	1
359	121	2		1	0
359	104	1		1	0
359	104	2		1	0
359	105	1		1	0
359	105	2		1	0
359	106	1		1	0
359	106	2		1	0
359	107	1		1	0
359	107	2		1	0
359	108	1		1	0
359	108	2		1	0
359	109	1		1	0
359	109	2		1	0
206	100	1		1	0
206	100	2		1	0
206	125	1		1	0
206	125	2		1	0
206	101	1		1	0
206	101	2		1	0
206	124	1		1	0
206	124	2		1	0
302	100	1		1	0
302	100	2		1	0
302	125	1		1	0
302	125	2		1	0
302	101	1		1	0
302	101	2		1	0
302	124	1		1	0
302	124	2		1	0
302	119	1		1	0
302	119	2		1	0
302	102	1		1	0
302	102	2		1	0
302	120	1		1	0
302	120	2		1	0
302	121	1		1	0
302	121	2		1	0
302	104	1		1	0
302	104	2		1	0
302	105	1		1	0
302	105	2		1	0
302	106	1		1	0
302	106	2		1	0
302	107	1		1	0
302	107	2		1	0
302	108	1		1	0
302	108	2		1	0
302	109	1		1	0
302	109	2		1	0
130	107	2	असफल सदस्यता	1	1
130	108	1	Opt-in message -eng	1	1
130	108	2	Opt-in message -nep	1	1
130	109	1	Opt-out message -eng	1	1
130	109	2	Opt-out message ne	1	1
147	114	1	Do you want to subscribe ?	4	1
147	114	2	के तपाई सदस्यता लिन चाहानुहुन्छ?	4	1
147	110	1	Invalid input	4	1
147	110	2	अवैध इनपुट	4	1
147	100	1	Successful subscription	2	1
147	100	2	सफल सदस्यता	2	1
147	125	1		2	0
147	125	2		2	0
147	101	1	Unsuccessful subscription	2	1
147	101	2	असफल सदस्यता	2	1
147	124	1	Already subscription	2	1
147	124	2	पहिले नै सदस्यता	2	1
147	119	1	Insufficient balance	2	1
353	100	1		1	0
353	100	2		1	0
353	125	1		1	0
353	125	2		1	0
353	101	1		1	0
353	101	2		1	0
353	124	1		1	0
353	124	2		1	0
353	119	1		1	0
353	119	2		1	0
353	102	1		1	0
353	102	2		1	0
353	120	1		1	0
353	120	2		1	0
353	121	1		1	0
353	121	2		1	0
353	104	1		1	0
353	104	2		1	0
353	105	1		1	0
353	105	2		1	0
353	106	1		1	0
353	106	2		1	0
353	107	1		1	0
353	107	2		1	0
353	108	1		1	0
353	108	2		1	0
353	109	1		1	0
353	109	2		1	0
354	100	1		1	0
354	100	2		1	0
354	125	1		1	0
354	125	2		1	0
354	101	1		1	0
354	101	2		1	0
354	124	1		1	0
147	119	2	अपर्याप्त ब्यालेन्स	2	1
147	102	1	Successful Renewal charging	2	1
147	102	2	सफल नवीकरण चार्ज	2	1
147	120	1	Renewal unuccessful due to insufficient balance	2	1
147	120	2	अपर्याप्त ब्यालेन्सको कारण नविकरण असफल भयो	2	1
147	121	1	Renewal due to other reasons	2	1
147	121	2	अन्य कारणका कारण नविकरण	2	1
147	104	1	Grace period	2	1
147	104	2	अनुग्रह अवधि	2	1
147	105	1		2	0
147	105	2		2	0
147	106	1		2	0
147	106	2		2	0
147	107	1	Unsubcription	2	1
147	107	2	सदस्यता रद्द	2	1
147	108	1	Optin - English	2	1
147	108	2	अंग्रेजी	2	1
147	109	1	Optout - English	2	1
147	109	2	Optout - अंग्रेजी	2	1
310	101	1	subscription success	1	1
314	107	1		2	0
314	107	2		2	0
314	108	1		2	0
314	108	2		2	0
314	109	1		2	0
314	109	2		2	0
354	124	2		1	0
354	119	1		1	0
354	119	2		1	0
354	102	1		1	0
354	102	2		1	0
354	120	1		1	0
354	120	2		1	0
354	121	1		1	0
354	121	2		1	0
354	104	1		1	0
354	104	2		1	0
354	105	1		1	0
354	105	2		1	0
354	106	1		1	0
354	106	2		1	0
354	107	1		1	0
354	107	2		1	0
354	108	1		1	0
354	108	2		1	0
354	109	1		1	0
354	109	2		1	0
200	100	1		1	0
200	100	2		1	0
200	125	1		1	0
200	125	2		1	0
200	101	1		1	0
200	101	2		1	0
200	124	1		1	0
317	100	1	Successful Subscription	1	0
317	100	2		1	0
317	125	1		1	0
317	125	2		1	0
317	101	1		1	0
317	101	2		1	0
317	124	1		1	0
317	124	2		1	0
317	119	1		1	0
317	119	2		1	0
317	102	1		1	0
317	102	2		1	0
317	120	1		1	0
317	120	2		1	0
317	121	1		1	0
317	121	2		1	0
317	104	1		1	0
317	104	2		1	0
317	105	1		1	0
317	105	2		1	0
317	106	1		1	0
317	106	2		1	0
317	107	1	Unsubscription	1	1
317	107	2	Unsubscription	1	1
317	108	1		1	0
317	108	2		1	0
317	109	1		1	0
317	109	2		1	0
316	100	1		1	0
316	100	2		1	0
316	125	1		1	0
316	125	2		1	0
316	101	1		1	0
316	101	2		1	0
316	124	1		1	0
316	124	2		1	0
316	119	1		1	0
316	119	2		1	0
316	102	1		1	0
316	102	2		1	0
316	120	1		1	0
316	120	2		1	0
316	121	1		1	0
316	121	2		1	0
316	104	1		1	0
316	104	2		1	0
316	105	1		1	0
316	105	2		1	0
316	106	1		1	0
316	106	2		1	0
316	107	1	unsubscribe	1	0
316	107	2		1	0
316	108	1		1	0
316	108	2		1	0
316	109	1		1	0
316	109	2		1	0
318	100	1		1	0
318	100	2		1	0
318	125	1		1	0
318	125	2		1	0
318	101	1		1	0
318	101	2		1	0
318	124	1		1	0
318	124	2		1	0
318	119	1		1	0
318	119	2		1	0
318	102	1		1	0
318	102	2		1	0
318	120	1		1	0
318	120	2		1	0
318	121	1		1	0
318	121	2		1	0
318	104	1		1	0
318	104	2		1	0
318	105	1		1	0
318	105	2		1	0
318	106	1		1	0
318	106	2		1	0
318	107	1	Unsubscription	1	1
318	107	2	Unsubscription	1	1
318	108	1		1	0
318	108	2		1	0
318	109	1		1	0
318	109	2		1	0
205	114	1	test test	4	1
205	114	2	test test	4	1
205	110	1	test test	4	1
205	110	2	test test	4	1
205	123	1	test test	1	1
205	123	2	test test	1	1
205	100	1	Hi ENGLISH, service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied. Dial to enjoy the service.	1	1
205	100	2	Hi NEPALI, service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied. Dial to enjoy the service.	1	1
205	125	1	Hi ENGLISH, Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.	1	1
205	125	2	Hi NEPALI, Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.	1	1
205	101	1		1	0
205	101	2		1	0
205	124	1		1	0
205	124	2		1	0
205	119	1		1	0
205	119	2		1	0
205	102	1		1	0
205	102	2		1	0
205	120	1		1	0
205	120	2		1	0
205	121	1		1	0
205	121	2		1	0
205	104	1		1	0
205	104	2		1	0
205	105	1		1	0
205	105	2		1	0
205	106	1		1	0
205	106	2		1	0
205	107	1		1	0
205	107	2		1	0
205	108	1		1	0
205	108	2		1	0
205	109	1		1	0
205	109	2		1	0
184	114	1	consent request message- english	4	1
184	114	2	सहमति अनुरोध सन्देश	4	1
184	110	1	Consent invalid message	4	1
184	110	2	अवैध सन्देश - invalid	4	1
184	100	1	successfully subscribed-english	1	1
184	100	2	successfully subscribed-nepali-सफलतापूर्वक सदस्यता	1	1
184	101	1	unsuccessful subscription - english	1	1
184	101	2	असफल सदस्यता - nepali - unsuccessful subscription	1	1
184	124	1	Already subscribed -english	1	1
184	124	2	Already subscribed - nepali - पहिल्यै सदस्यता लिइएको छ	1	1
184	119	1		1	0
184	119	2		1	0
200	124	2		1	0
200	119	1		1	0
200	119	2		1	0
200	102	1		1	0
200	102	2		1	0
200	120	1		1	0
200	120	2		1	0
200	121	1		1	0
200	121	2		1	0
200	104	1		1	0
200	104	2		1	0
200	105	1		1	0
200	105	2		1	0
200	106	1		1	0
200	106	2		1	0
200	107	1		1	0
200	107	2		1	0
200	108	1		1	0
200	108	2		1	0
200	109	1		1	0
200	109	2		1	0
355	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
355	114	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
355	110	1	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	4	1
355	110	2	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	4	1
355	100	1		1	0
355	100	2		1	0
355	101	1		1	0
355	101	2		1	0
355	124	1		1	0
355	124	2		1	0
355	119	1		1	0
355	119	2		1	0
206	119	1		1	0
206	119	2		1	0
206	102	1		1	0
206	102	2		1	0
206	120	1		1	0
206	120	2		1	0
206	121	1		1	0
206	121	2		1	0
206	104	1		1	0
206	104	2		1	0
206	105	1		1	0
319	100	1		1	0
319	100	2		1	0
319	125	1		1	0
319	125	2		1	0
319	101	1		1	0
319	101	2		1	0
319	124	1		1	0
319	124	2		1	0
319	119	1		1	0
319	119	2		1	0
319	102	1		1	0
319	102	2		1	0
319	120	1		1	0
319	120	2		1	0
319	121	1		1	0
319	121	2		1	0
319	104	1		1	0
319	104	2		1	0
319	105	1		1	0
319	105	2		1	0
319	106	1		1	0
319	106	2		1	0
319	107	1		1	0
319	107	2		1	0
319	108	1		1	0
319	108	2		1	0
319	109	1		1	0
319	109	2		1	0
206	105	2		1	0
206	106	1		1	0
206	106	2		1	0
206	107	1		1	0
206	107	2		1	0
206	108	1		1	0
206	108	2		1	0
206	109	1		1	0
206	109	2		1	0
360	100	1		1	0
360	100	2		1	0
360	125	1		1	0
360	125	2		1	0
360	101	1		1	0
360	101	2		1	0
360	124	1		1	0
360	124	2		1	0
360	119	1		1	0
360	119	2		1	0
360	102	1		1	0
360	102	2		1	0
360	120	1		1	0
360	120	2		1	0
360	121	1		1	0
360	121	2		1	0
360	104	1		1	0
360	104	2		1	0
360	105	1		1	0
360	105	2		1	0
360	106	1		1	0
360	106	2		1	0
360	107	1		1	0
360	107	2		1	0
360	108	1		1	0
360	108	2		1	0
360	109	1		1	0
360	109	2		1	0
361	114	1	gertger	4	1
361	114	2	ertgtrge	4	1
361	110	1	rtgertgeg	4	1
361	110	2	tgeree	4	1
362	114	1	jyv	4	1
362	114	2	rrr	4	1
362	110	1	rr	4	1
362	110	2	rr	4	1
257	100	1	egf	1	1
257	100	2	etf	1	1
257	125	1		1	0
257	125	2		1	0
257	101	1		1	0
257	101	2		1	0
257	124	1		1	0
257	124	2		1	0
257	119	1		1	0
257	119	2		1	0
257	102	1		1	0
257	102	2		1	0
257	120	1		1	0
257	120	2		1	0
257	121	1		1	0
257	121	2		1	0
257	104	1		1	0
257	104	2		1	0
257	105	1		1	0
257	105	2		1	0
257	106	1		1	0
257	106	2		1	0
257	107	1		1	0
257	107	2		1	0
257	108	1		1	0
257	108	2		1	0
257	109	1		1	0
257	109	2		1	0
363	100	1		1	0
363	100	2		1	0
363	101	1		1	0
363	101	2		1	0
363	124	1		1	0
363	124	2		1	0
363	119	1		1	0
363	119	2		1	0
364	100	1		1	0
364	100	2		1	0
364	101	1		1	0
364	101	2		1	0
364	124	1		1	0
364	124	2		1	0
364	119	1		1	0
364	119	2		1	0
365	114	1	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
365	114	2	xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	4	1
365	110	1	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	4	1
365	110	2	rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr	4	1
365	100	1	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	1	1
365	100	2	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	1	1
365	101	1		1	0
365	101	2		1	0
365	124	1		1	0
365	124	2		1	0
365	119	1		1	0
365	119	2		1	0
366	114	1	wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww	4	1
366	114	2	wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww	4	1
366	110	1	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	4	1
366	110	2	zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz	4	1
366	100	1	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	1	1
366	100	2	aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa	1	1
366	101	1		1	0
366	101	2		1	0
366	124	1		1	0
366	124	2		1	0
366	119	1		1	0
366	119	2		1	0
181	114	1	Request--ENGLISH	4	1
181	114	2	Reply--NEPALI	4	1
181	110	1	Reply INVALID--ENGLISH	4	1
181	110	2	Reply INVALID--NEPALI	4	1
181	100	1	Hi ENGLISH, service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied. Dial to enjoy the service.	1	1
181	100	2	Hi NEPALI, service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied. Dial to enjoy the service.	1	1
181	125	1	Hi ENGLISH, Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.	1	1
181	125	2	Hi NEPALI, Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.	1	1
181	101	1		1	0
181	101	2		1	0
181	124	1		1	0
181	124	2		1	0
181	119	1		1	0
181	119	2		1	0
181	102	1		1	0
181	102	2		1	0
181	120	1		1	0
181	120	2		1	0
181	121	1		1	0
181	121	2		1	0
181	104	1		1	0
181	104	2		1	0
181	105	1		1	0
181	105	2		1	0
181	106	1		1	0
181	106	2		1	0
181	107	1	unsub sucess nilu	1	1
181	107	2	unsub sucess nilunp	1	1
181	108	1		1	0
181	108	2		1	0
181	109	1		1	0
181	109	2		1	0
204	114	1	Consent Message	4	1
204	114	2	Consent Message	4	1
204	110	1	Consent Message	4	1
204	110	2	Consent Message	4	1
204	117	1	Consent Message	4	1
204	117	2	Consent Message	4	1
204	118	1	Consent Message	4	1
204	118	2	Consent Message	4	1
204	100	1	Hi ENGLISH, service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied. Dial to enjoy the service.	1	1
204	100	2	Hi NEPALI, service is activated. Rs. <AMOUNT>+<TAX>(taxes) will be applied. Dial to enjoy the service.	1	1
204	125	1	Hi ENGLISH, Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.	1	1
204	125	2	Hi NEPALI, Daily Renewal service is activated. Enjoy <DAYS> days for FREE! Rs. <AMOUNT>+<TAX>(taxes) will be applied after FREE trial.	1	1
204	101	1		1	0
204	101	2		1	0
204	124	1		1	0
204	124	2		1	0
204	119	1		1	0
204	119	2		1	0
204	102	1		1	0
204	102	2		1	0
204	120	1		1	0
204	120	2		1	0
204	121	1		1	0
204	121	2		1	0
204	104	1		1	0
204	104	2		1	0
204	105	1		1	0
204	105	2		1	0
204	106	1		1	0
204	106	2		1	0
204	107	1	UNSUBCRIPTION-XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX	1	1
204	107	2	UNSUBCRIPTION-YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY	1	1
204	108	1		1	0
204	108	2		1	0
204	109	1		1	0
204	109	2		1	0
\.


--
-- Data for Name: service_provision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_provision (id, service_id, provision_type, provision_cycle, provision_data_id, provision_url_data) FROM stdin;
86	300	140	150	109	
87	300	140	160	104	
88	300	140	160	107	
89	300	143	161	107	
90	306	140	150	104	
91	306	140	150	108	ghhgh
92	306	143	161	104	
97	307	142	158	109	rfgrfg
13	302	140	150	104	
14	302	140	150	107	
15	302	143	161	107	
333	356	143	161	107	
99	308	143	161	108	
334	357	143	161	105	
335	358	143	161	107	
336	359	143	161	104	
104	309	143	161	104	
105	309	143	161	105	
28	301	140	150	104	NadagamMusic
29	301	143	161	108	
115	310	142	158	109	hgvjhgv
116	310	142	157	109	hfvgjg
117	310	143	161	104	
394	365	143	161	107	
395	366	143	161	105	
399	181	140	150	114	
400	181	143	161	104	
401	204	140	150	108	Gate
128	313	141	155	109	rgrt
52	295	140	151	104	unsub1
53	295	140	151	108	unsub2
54	295	143	161	104	
55	119	140	150	104	test
56	119	143	161	104	
57	126	140	150	104	dfgh
58	126	143	161	104	
59	303	143	161	104	
60	304	143	161	104	
129	313	143	161	107	
130	314	143	161	104	
131	315	140	150	104	WW1
132	315	140	150	107	WW2
133	315	143	161	105	
134	311	141	155	109	sefdr
67	305	143	161	107	
135	311	141	156	109	rwetert
136	311	143	161	104	
137	312	140	150	110	grthgtryh
138	312	140	151	110	weretey
139	312	141	155	109	sdf
140	312	141	156	109	werhgerkt
141	312	142	158	109	rgrthrt
142	312	142	157	110	werterjkhtge
402	204	143	161	113	
82	130	140	150	104	
83	130	143	161	104	
84	147	140	150	104	
85	147	143	161	104	
143	312	143	161	104	
153	317	140	150	104	fghj
154	317	140	150	109	dsfgrf
155	317	140	151	104	sdfghj
156	317	140	151	110	dfghj
157	317	141	155	104	cbvbnn
158	317	141	155	109	fghj
159	317	141	156	104	dfghjk
160	317	141	156	109	fdghjjk
161	317	142	158	104	dfcvbnm
162	317	142	158	110	dfghj
163	317	142	157	104	dfghjk
164	317	142	157	110	xvcbb
165	317	143	161	104	
166	317	143	161	107	
167	317	143	161	105	
168	316	141	155	104	fghj
169	316	141	155	109	cbvnm
170	316	141	156	104	gfhjjk
171	316	141	156	109	fdghj
172	316	142	158	104	hrdcth
173	316	142	158	109	ygyh
174	316	142	157	104	gjgvytgv
175	316	142	157	109	ghjgh
176	316	143	161	104	
177	318	140	150	104	
178	318	140	150	105	
179	318	140	150	107	
180	318	140	151	104	
181	318	140	151	105	
182	318	140	151	107	
183	318	143	161	104	
184	318	143	161	107	
185	318	143	161	105	
186	205	140	150	107	
187	205	143	161	104	
188	184	140	150	104	
189	184	143	161	107	
194	319	140	150	\N	Samaagama
195	319	140	150	112	Naaaa
196	319	143	161	108	
204	324	140	150	104	rrff
205	324	140	150	105	rewf
206	324	140	150	107	erfwef
207	324	140	150	108	erfer
208	324	140	150	109	aqedfef
209	324	140	150	110	efrf
210	324	140	151	104	rfwerf
211	324	140	151	105	werfe
212	324	140	151	107	erfawe
213	324	140	151	108	werfw
214	324	140	151	109	erfwerf
215	324	140	151	110	efdawfr
216	324	143	161	104	
217	324	143	161	107	
218	324	143	161	108	
231	325	140	150	104	wregewrf
232	325	140	150	105	wergwerf
233	325	140	150	108	wferf
234	325	140	150	109	erjhf
235	325	140	150	110	segvff
236	325	140	151	104	egfvhre
237	325	140	151	107	wjhberf
238	325	140	151	108	gvgh
239	325	140	151	109	wrefwe
240	325	140	151	110	werf
241	325	143	161	104	
242	325	143	161	107	
251	326	140	150	104	serfr
252	326	140	150	108	werfr
253	326	140	150	110	sff
254	326	140	151	104	erfrerfr
255	326	140	151	108	rfe
256	326	140	151	109	erfwerf
257	326	143	161	104	
258	326	143	161	107	
259	327	140	150	104	trgdtr
260	327	140	150	108	rtgrgt
261	327	140	150	109	srtgdrt
262	327	140	150	110	drtgtr
263	327	143	161	104	
264	327	143	161	107	
265	328	143	161	104	
266	330	143	161	107	
267	331	140	150	104	dtgdrg
268	331	140	150	107	rdtgr
269	331	140	150	108	srgdrtg
270	331	140	150	108	erte
271	331	140	150	109	ergdrtg
272	331	140	150	110	drgdtrg
273	331	140	151	104	rgdrtg
274	331	140	151	105	rgdrt
275	331	140	151	108	sgdrtg
276	331	140	151	109	grtg
277	331	140	151	110	ergrdtg
278	331	143	161	107	
279	331	143	161	105	
280	331	143	161	108	
283	332	140	150	104	fdg
284	332	140	150	107	sdfs
285	332	140	150	108	sdfv
286	332	140	150	109	aerfwer
287	332	140	150	110	erfef
288	332	140	151	104	sfsser
289	332	140	151	105	erfwe
290	332	140	151	107	werfe
291	332	140	151	108	erfwe
292	332	140	151	109	fewrfwe
293	332	140	151	110	rfwefwe
294	332	143	161	104	
295	332	143	161	107	
296	332	143	161	108	
297	296	140	151	104	aaaaaaaaaaaaa
298	296	140	151	107	ccccccccccccc
299	296	140	151	110	bbbbbbbbbbbbb
300	296	143	161	104	
301	296	143	161	107	
361	206	143	161	105	
362	206	143	161	104	
363	360	143	161	107	
309	333	140	150	104	erfrtgwr
310	333	140	151	104	erfgertg
311	333	140	151	107	werfertg
312	333	140	151	109	rtgetrge
313	333	140	151	110	egrtgrtg
314	333	143	161	104	
315	333	143	161	107	
364	361	143	161	107	
365	362	143	161	107	
366	257	143	161	107	
319	334	143	161	105	
320	336	143	161	104	
321	347	143	161	104	
322	349	143	161	104	
367	363	143	161	107	
325	353	143	161	104	
327	354	143	161	107	
328	200	143	161	107	
331	355	140	150	104	
332	355	143	161	105	
375	364	140	150	105	test2?test5
376	364	140	150	107	test3
377	364	143	161	108	
386	298	140	150	104	
387	298	140	150	105	
388	298	140	150	107	ghjk
389	298	140	150	109	yjg
390	298	140	150	110	cvbnm
391	298	141	155	109	gvjh
392	298	142	158	109	hkjg
393	298	143	161	104	
\.


--
-- Data for Name: service_tariff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_tariff (service_id, tariff_id) FROM stdin;
174	17
194	18
214	17
215	19
219	17
216	17
216	19
223	17
223	18
226	17
235	19
238	18
240	18
252	17
342	20
358	17
361	19
362	17
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (status, status_name) FROM stdin;
1	Active
2	Grace
3	Suspend
4	Trial
5	Park
6	Unsubscribe
\.


--
-- Data for Name: subscriber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber (subscriber_id, msisdn, operator_id, cus_type, pref_lang, sub_status_id, status_detail_id, p_offer_id, brand_id, loyalty_id, category_id, device_model_id, subscribed_dttm, activated_dttm, expiry_dttm) FROM stdin;
283	9779880000008	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:40	2018-09-09 00:00:00	\N
308	9771231231400	2	1	ne	5	3	5	8	8	5	48	2021-05-14 13:51:37	2018-09-09 00:00:00	\N
284	9779880000007	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:40	2018-09-09 00:00:00	\N
285	9779880000009	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:41	2018-09-09 00:00:00	\N
286	9779880000010	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:43:59	2018-09-09 00:00:00	\N
261	9771334567008	2	1	ne	5	3	5	8	8	5	1	2021-03-15 16:28:56	2018-09-09 00:00:00	\N
262	9771334467008	2	1	ne	5	3	5	8	8	5	1	2021-03-15 16:31:57	2018-09-09 00:00:00	\N
263	9771333467008	2	1	ne	5	3	5	8	8	5	1	2021-03-15 16:32:49	2018-09-09 00:00:00	\N
264	9771333407008	2	1	ne	5	3	5	8	8	5	1	2021-03-15 16:42:10	2018-09-09 00:00:00	\N
265	9771333497008	2	1	ne	5	3	5	8	8	5	1	2021-03-15 16:44:22	2018-09-09 00:00:00	\N
266	9771333496008	2	1	ne	5	3	5	8	8	5	1	2021-03-15 16:45:04	2018-09-09 00:00:00	\N
267	9779333496008	2	1	ne	5	3	5	8	8	5	1	2021-03-15 16:48:25	2018-09-09 00:00:00	\N
268	9779533496008	2	1	ne	5	3	5	8	8	5	1	2021-03-15 16:50:51	2018-09-09 00:00:00	\N
290	9771231231434	2	1	ne	5	3	5	8	8	5	1	2021-03-24 13:48:36	2018-09-09 00:00:00	\N
309	9771231231422	2	1	ne	5	3	5	8	8	5	48	2021-05-14 13:57:35	2018-09-09 00:00:00	\N
291	9771231231435	2	1	ne	5	3	5	8	8	5	1	2021-03-24 14:07:36	2018-09-09 00:00:00	\N
227	9771234567077	2	1	en	5	3	5	8	8	5	1	2021-03-03 11:17:51	2018-09-09 00:00:00	\N
235	9778769147347	1	1	ne	5	3	5	8	8	5	1	2021-03-10 12:05:46	2018-09-09 00:00:00	\N
236	9778769147349	1	1	ne	5	3	5	8	8	5	1	2021-03-10 12:06:23	2018-09-09 00:00:00	\N
237	9778769147341	1	1	ne	5	3	5	8	8	5	1	2021-03-10 12:09:01	2018-09-09 00:00:00	\N
238	9778769147340	1	1	ne	5	3	5	8	8	5	1	2021-03-10 12:10:07	2018-09-09 00:00:00	\N
239	9778769147350	1	1	ne	5	3	5	8	8	5	1	2021-03-10 12:25:14	2018-09-09 00:00:00	\N
240	9778769147360	1	1	ne	5	3	5	8	8	5	1	2021-03-10 12:26:05	2018-09-09 00:00:00	\N
241	9778769147370	2	1	ne	5	3	5	8	8	5	1	2021-03-10 12:39:31	2018-09-09 00:00:00	\N
243	9778769147320	2	1	ne	5	3	5	8	8	5	1	2021-03-10 13:04:33	2018-09-09 00:00:00	\N
244	9778769147020	2	1	ne	5	3	5	8	8	5	1	2021-03-10 13:23:04	2018-09-09 00:00:00	\N
245	9778769149020	2	1	ne	5	3	5	8	8	5	1	2021-03-10 13:25:22	2018-09-09 00:00:00	\N
246	9778769549020	2	1	ne	5	3	5	8	8	5	1	2021-03-10 13:26:16	2018-09-09 00:00:00	\N
299	9771231231438	2	1	ne	5	3	5	8	8	5	1	2021-03-29 16:44:03	2018-09-09 00:00:00	\N
300	9771231231439	2	1	ne	5	3	5	8	8	5	1	2021-03-29 16:53:02	2018-09-09 00:00:00	\N
303	9771231231410	2	1	ne	5	3	5	8	8	5	48	2021-04-02 05:35:09	2018-09-09 00:00:00	\N
304	9771231231411	2	1	ne	5	3	5	8	8	5	48	2021-04-02 11:33:30	2018-09-09 00:00:00	\N
305	9771231231412	2	1	ne	5	3	5	8	8	5	48	2021-04-02 17:02:22	2018-09-09 00:00:00	\N
306	9771231231414	2	1	ne	5	3	5	8	8	5	48	2021-04-20 17:13:28	2018-09-09 00:00:00	\N
310	9771231231433	2	1	ne	5	3	5	8	8	5	48	2021-05-14 13:58:30	2018-09-09 00:00:00	\N
307	9771231231490	2	1	ne	5	3	5	8	8	5	48	2021-04-30 17:57:28	2018-09-09 00:00:00	\N
233	9778769147345	1	1	en	5	3	5	8	8	5	1	2021-03-04 16:55:27	2018-09-09 00:00:00	\N
311	9771231231444	2	1	ne	5	3	5	8	8	5	48	2021-05-14 14:08:03	2018-09-09 00:00:00	\N
260	9771234567008	2	2	ne	5	3	5	8	8	5	1	2021-03-10 18:12:14	2018-09-09 00:00:00	\N
234	9778769147346	1	1	ne	5	3	5	8	8	5	1	2021-03-10 11:58:05	2018-09-09 00:00:00	\N
276	9779880000002	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:40	2018-09-09 00:00:00	\N
312	9771231231455	2	1	ne	5	3	5	8	8	5	48	2021-05-14 14:12:56	2018-09-09 00:00:00	\N
277	9779880000001	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:40	2018-09-09 00:00:00	\N
278	9779880000000	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:40	2018-09-09 00:00:00	\N
279	9779880000003	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:40	2018-09-09 00:00:00	\N
280	9779880000004	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:40	2018-09-09 00:00:00	\N
281	9779880000005	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:40	2018-09-09 00:00:00	\N
282	9779880000006	2	1	ne	5	3	5	8	8	5	1	2021-03-16 12:32:40	2018-09-09 00:00:00	\N
222	9779809399172	2	1	en	5	3	4	8	8	5	1	2021-03-01 15:41:47	2018-09-09 00:00:00	\N
223	9771231231431	2	1	en	5	3	5	8	8	5	1	2021-03-01 22:39:54	2018-09-09 00:00:00	\N
329	9771234567890	2	1	ne	5	3	5	8	8	5	48	2021-06-23 12:22:21	2018-09-09 00:00:00	\N
330	9771231231429	2	1	ne	5	3	5	8	8	5	48	2021-06-23 23:35:51	2018-09-09 00:00:00	\N
333	9772231231331	2	1	ne	5	3	5	8	8	5	48	2021-08-02 16:55:19	2018-09-09 00:00:00	\N
314	9771231231430	2	1	ne	5	3	5	8	8	5	48	2021-06-30 02:58:10	2018-09-09 00:00:00	\N
331	9771231231428	2	1	ne	5	3	5	8	8	5	48	2021-07-08 15:55:25	2018-09-09 00:00:00	\N
332	9772231231330	2	1	ne	5	3	5	8	8	5	48	2021-08-01 20:33:29	2018-09-09 00:00:00	\N
\.


--
-- Data for Name: subscriber_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_brand (brand_id, brand_name, operator_id, ngbss_brand, p_offer_list, description) FROM stdin;
1	smoke	2	1	{1}	testDescription
7	casd	2	5	{1,2,4}	vfdv
8	1215	2	1215	\N	\N
9	Test	2	123	{1}	Test
11	MyBrand	2	CBS13	{1}	null
\.


--
-- Data for Name: subscriber_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_category (category_id, category_name, operator_id, ngbss_category, description) FROM stdin;
1	smoke	1	1	smoke
4	dssfs	1	3	fsdfs
6	TestCat	1	CBS123	\N
7	Test	1	123	Test
9	Mycat	1	CBS10	\N
11	Test123	2	4123	Sherantha-Test
14	Test1	2	123	\N
5	test2	2	test2	\N
16	aaa	2	aaa	aaa
19	sf	2	aa	\N
\.


--
-- Data for Name: subscriber_loyalty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_loyalty (loyalty_id, loyalty_name, operator_id, ngbss_loyalty, description) FROM stdin;
1	smoke	2	test	smoke
8	test1	2	test1	Test description
9	vims1	2	vim123	asdadasd
11	ncell	2	aaa	des
\.


--
-- Data for Name: subscriber_primary_offer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_primary_offer (p_offer_id, p_offer_name, operator_id, ngbss_p_offer, description, cus_type) FROM stdin;
1	smoke	2	1	smoke	\N
2	smoke1	2	2	smoke1	\N
4	cdsvs	2	3	vsdvsdvcas	\N
5	R3030	2	R3030	\N	\N
8	Test	2	123	Test	3
10	MyPrime	2	CBS12	null	1
\.


--
-- Data for Name: subscriber_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_status (status_id, status_name, operator_id, ngbss_status, description) FROM stdin;
1	TEST01	2	1	TEST01
5	B01	2	B01	\N
6	Test	2	123	Test
9	test3	2	cdjsd	\N
10	gk	2	gk	des
21	ll	2	ll	des
23	dd	2	dd	fd
\.


--
-- Data for Name: subscriber_status_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_status_detail (status_details_id, status_details_name, operator_id, ngbss_status_details, description) FROM stdin;
1	DETAILS01	2	1	DETAILS01
3	test	2	test	\N
4	Test	2	123	Test
7	MyDetails	2	CBS14	null
8	test4	2	sefilb	\N
\.


--
-- Data for Name: subscriber_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_type (id, sub_type_name, sub_type_code, tax_precentage, tax_msg) FROM stdin;
3	roamer	3	25.0000	\N
4	blocked	4	25.0000	\N
1	prepaid	0	25.0000	\N
5	allowed	2	25.0000	\N
2	postpaid	1	25.0000	\N
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription (id, sub_id, msisdn, service_id, subscribed_dttm, expire_dttm, status, admin_status, group_id, is_primary, renew_check, suspended_date, retry_cycle, pref_lang, partner_id, category_id, unsubscribed_date, data, reminder_date) FROM stdin;
1290	314	9771231231430	204	2021-08-06 15:36:46	2021-08-09 15:36:42	6	1	0	1	1	\N	0	ne	2	0	2021-08-06 15:36:50.208697	{"channel": 104, "price_id": "null", "consent_id": "122", "final_expiry": "2021-08-18 15:36:46", "next_renewal": 0, "renewal_hour": 16}	2021-08-16 15:36:46
\.


--
-- Data for Name: tariff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tariff (tariff_id, tariff_vasp_id, tariff_ngbss_id, tariff_price_value, tariff_description, operator_id, tariff_created_by, tariff_created_dttm, tariff_updated_by, tariff_updated_dttm) FROM stdin;
17	Tariif123	7897	70.00000000	Test123	2	admin	2021-02-25 19:34:54	\N	\N
18	bug1	4432	12.00000000	null	2	admin	2021-03-02 10:28:54	\N	\N
19	TariffMicro10	111	10.00000000	null	2	admin	2021-03-02 11:02:22	\N	\N
20	TariffMicro20	1111	20.00000000	null	2	admin	2021-03-02 11:02:33	\N	\N
21	TariffMicro30	11111	30.00000000	null	2	admin	2021-03-02 11:02:47	\N	\N
22	TariffMicro50	1111111	50.00000000	null	2	admin	2021-03-02 11:03:06	\N	\N
23	SubscriptionFeeTariff	11111111	50.00000000	null	2	admin	2021-03-02 11:03:45	\N	\N
24	RenewalFeeTariff	1111111111	100.00000000	null	2	admin	2021-03-02 11:04:13	\N	\N
25	h_tarrif1	as12zzk	10.00000000	null	2	admin	2021-03-17 10:17:49	\N	\N
26	h_tariff2	234ce3g	5.00000000	null	2	admin	2021-03-17 10:24:17	\N	\N
27	test12	1234434	12.00000000	setgetr	2	admin	2021-04-19 12:24:19	admin	\N
29	Decimal8	123	12345678.12345678	\N	2	admin	2021-04-19 15:10:16	admin	\N
28	test19	1234477	46.00000000	hsdfgdhflg	2	admin	2021-04-19 13:10:48	admin	\N
30	asdadada	12311	123.00000000	asdadasdada	2	admin	2021-06-25 21:44:05	\N	\N
\.


--
-- Data for Name: user_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_options (id, key_name, accept_or_reject) FROM stdin;
\.


--
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 169, true);


--
-- Name: channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channel_id_seq', 4, true);


--
-- Name: charging_error_code_error_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.charging_error_code_error_code_id_seq', 6, true);


--
-- Name: default_provisioning_default_provisioning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.default_provisioning_default_provisioning_id_seq', 18, true);


--
-- Name: device_model_device_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_model_device_model_id_seq', 51, true);


--
-- Name: network_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.network_id_seq', 2, true);


--
-- Name: price_plan_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.price_plan_price_id_seq', 276, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 63, true);


--
-- Name: provisioning_provisioning_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provisioning_provisioning_id_seq', 114, true);


--
-- Name: service_provision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_provision_id_seq', 402, true);


--
-- Name: service_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_service_id_seq', 366, true);


--
-- Name: subscriber_brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_brand_brand_id_seq', 11, true);


--
-- Name: subscriber_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_category_category_id_seq', 20, true);


--
-- Name: subscriber_loyalty_loyalty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_loyalty_loyalty_id_seq', 15, true);


--
-- Name: subscriber_primary_offer_p_offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_primary_offer_p_offer_id_seq', 10, true);


--
-- Name: subscriber_status_details_status_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_status_details_status_details_id_seq', 8, true);


--
-- Name: subscriber_status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_status_status_id_seq', 34, true);


--
-- Name: subscriber_subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_subscriber_id_seq', 333, true);


--
-- Name: subscriber_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_type_id_seq', 2, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscription_id_seq', 1290, true);


--
-- Name: tariff_tariff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tariff_tariff_id_seq', 30, true);


--
-- Name: user_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_options_id_seq', 1, false);


--
-- Name: brand_p_offer brand_p_offer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand_p_offer
    ADD CONSTRAINT brand_p_offer_pkey PRIMARY KEY (brand_id, p_offer_id);


--
-- Name: category category_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_category_name_key UNIQUE (category_name);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- Name: channel channel_channel_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_channel_code_key UNIQUE (channel_code);


--
-- Name: channel channel_channel_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_channel_name_key UNIQUE (channel_name);


--
-- Name: channel channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_pkey PRIMARY KEY (id);


--
-- Name: charging_error_code charging_error_code_operator_id_error_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_error_code
    ADD CONSTRAINT charging_error_code_operator_id_error_code_key UNIQUE (operator_id, error_code);


--
-- Name: charging_error_code charging_error_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_error_code
    ADD CONSTRAINT charging_error_code_pkey PRIMARY KEY (error_code_id);


--
-- Name: default_provisioning default_provisioning_endpoint_name_list_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.default_provisioning
    ADD CONSTRAINT default_provisioning_endpoint_name_list_check CHECK ((0 < ALL (endpoint_name_list))) NOT VALID;


--
-- Name: default_provisioning default_provisioning_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_provisioning
    ADD CONSTRAINT default_provisioning_pkey PRIMARY KEY (default_provisioning_id);


--
-- Name: device_model device_model_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_model
    ADD CONSTRAINT device_model_name UNIQUE (device_model_name);


--
-- Name: device_model device_model_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_model
    ADD CONSTRAINT device_model_pk PRIMARY KEY (device_model_id);


--
-- Name: general_configuration general_configuration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.general_configuration
    ADD CONSTRAINT general_configuration_pkey PRIMARY KEY (param_name);


--
-- Name: network network_network_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.network
    ADD CONSTRAINT network_network_code_key UNIQUE (network_code);


--
-- Name: network network_network_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.network
    ADD CONSTRAINT network_network_name_key UNIQUE (network_name);


--
-- Name: network network_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.network
    ADD CONSTRAINT network_pkey PRIMARY KEY (id);


--
-- Name: price_plan price_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_plan
    ADD CONSTRAINT price_plan_pkey PRIMARY KEY (price_id);


--
-- Name: price_plan price_plan_price_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_plan
    ADD CONSTRAINT price_plan_price_name_key UNIQUE (price_name);


--
-- Name: subscription primary_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT primary_key PRIMARY KEY (id);


--
-- Name: subscriber primery_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT primery_key PRIMARY KEY (subscriber_id);


--
-- Name: product_category product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_pkey PRIMARY KEY (category_id, product_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: product product_product_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_name_key UNIQUE (product_name);


--
-- Name: product_svc_fk product_svc_fk_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_svc_fk
    ADD CONSTRAINT product_svc_fk_pkey PRIMARY KEY (product_id, service_id);


--
-- Name: provisioning_class provisioning_class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning_class
    ADD CONSTRAINT provisioning_class_pkey PRIMARY KEY (class_name);


--
-- Name: provisioning provisioning_endpoint_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning
    ADD CONSTRAINT provisioning_endpoint_name_key UNIQUE (endpoint_name);


--
-- Name: provisioning_group provisioning_group_group_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning_group
    ADD CONSTRAINT provisioning_group_group_code_key UNIQUE (group_code);


--
-- Name: provisioning_group provisioning_group_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning_group
    ADD CONSTRAINT provisioning_group_group_name_key UNIQUE (group_name);


--
-- Name: provisioning_group provisioning_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning_group
    ADD CONSTRAINT provisioning_group_pkey PRIMARY KEY (group_id);


--
-- Name: provisioning provisioning_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning
    ADD CONSTRAINT provisioning_pkey PRIMARY KEY (provisioning_id);


--
-- Name: service service_alias_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_alias_key UNIQUE (service_alias);


--
-- Name: service service_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_pkey PRIMARY KEY (service_id);


--
-- Name: service_provision service_provision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_provision
    ADD CONSTRAINT service_provision_pkey PRIMARY KEY (id);


--
-- Name: service service_service_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_service_code_key UNIQUE (service_code);


--
-- Name: service service_service_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_service_name_key UNIQUE (service_name);


--
-- Name: service_tariff service_tariff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_tariff
    ADD CONSTRAINT service_tariff_pkey PRIMARY KEY (service_id, tariff_id);


--
-- Name: subscriber sub_msisdn; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT sub_msisdn UNIQUE (msisdn);


--
-- Name: subscriber_brand subscriber_brand_brand_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_brand
    ADD CONSTRAINT subscriber_brand_brand_name_key UNIQUE (brand_name);


--
-- Name: subscriber_brand subscriber_brand_operator_id_ngbss_brand_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_brand
    ADD CONSTRAINT subscriber_brand_operator_id_ngbss_brand_key UNIQUE (operator_id, ngbss_brand);


--
-- Name: subscriber_brand subscriber_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_brand
    ADD CONSTRAINT subscriber_brand_pkey PRIMARY KEY (brand_id);


--
-- Name: subscriber_category subscriber_category_category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_category
    ADD CONSTRAINT subscriber_category_category_name_key UNIQUE (category_name);


--
-- Name: subscriber_category subscriber_category_operator_id_ngbss_category_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_category
    ADD CONSTRAINT subscriber_category_operator_id_ngbss_category_key UNIQUE (operator_id, ngbss_category);


--
-- Name: subscriber_category subscriber_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_category
    ADD CONSTRAINT subscriber_category_pkey PRIMARY KEY (category_id);


--
-- Name: subscriber_loyalty subscriber_loyalty_loyalty_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_loyalty
    ADD CONSTRAINT subscriber_loyalty_loyalty_name_key UNIQUE (loyalty_name);


--
-- Name: subscriber_loyalty subscriber_loyalty_operator_id_ngbss_loyalty_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_loyalty
    ADD CONSTRAINT subscriber_loyalty_operator_id_ngbss_loyalty_key UNIQUE (operator_id, ngbss_loyalty);


--
-- Name: subscriber_loyalty subscriber_loyalty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_loyalty
    ADD CONSTRAINT subscriber_loyalty_pkey PRIMARY KEY (loyalty_id);


--
-- Name: subscriber_primary_offer subscriber_primary_offer_operator_id_ngbss_p_offer_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_primary_offer
    ADD CONSTRAINT subscriber_primary_offer_operator_id_ngbss_p_offer_key UNIQUE (operator_id, ngbss_p_offer);


--
-- Name: subscriber_primary_offer subscriber_primary_offer_p_offer_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_primary_offer
    ADD CONSTRAINT subscriber_primary_offer_p_offer_name_key UNIQUE (p_offer_name);


--
-- Name: subscriber_primary_offer subscriber_primary_offer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_primary_offer
    ADD CONSTRAINT subscriber_primary_offer_pkey PRIMARY KEY (p_offer_id);


--
-- Name: subscriber_status_detail subscriber_status_details_operator_id_ngbss_status_details_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status_detail
    ADD CONSTRAINT subscriber_status_details_operator_id_ngbss_status_details_key UNIQUE (operator_id, ngbss_status_details);


--
-- Name: subscriber_status_detail subscriber_status_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status_detail
    ADD CONSTRAINT subscriber_status_details_pkey PRIMARY KEY (status_details_id);


--
-- Name: subscriber_status_detail subscriber_status_details_status_details_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status_detail
    ADD CONSTRAINT subscriber_status_details_status_details_name_key UNIQUE (status_details_name);


--
-- Name: subscriber_status subscriber_status_operator_id_ngbss_status_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status
    ADD CONSTRAINT subscriber_status_operator_id_ngbss_status_key UNIQUE (operator_id, ngbss_status);


--
-- Name: subscriber_status subscriber_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status
    ADD CONSTRAINT subscriber_status_pkey PRIMARY KEY (status_id);


--
-- Name: subscriber_status subscriber_status_status_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status
    ADD CONSTRAINT subscriber_status_status_name_key UNIQUE (status_name);


--
-- Name: subscriber_type subscriber_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_type
    ADD CONSTRAINT subscriber_type_pkey PRIMARY KEY (id);


--
-- Name: subscriber_type subscriber_type_sub_type_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_type
    ADD CONSTRAINT subscriber_type_sub_type_code_key UNIQUE (sub_type_code);


--
-- Name: subscriber_type subscriber_type_sub_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_type
    ADD CONSTRAINT subscriber_type_sub_type_name_key UNIQUE (sub_type_name);


--
-- Name: subscription subscription_sub_id_service_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_sub_id_service_id_key UNIQUE (sub_id, service_id);


--
-- Name: tariff tariff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff
    ADD CONSTRAINT tariff_pkey PRIMARY KEY (tariff_id);


--
-- Name: tariff tariff_tariff_vasp_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariff
    ADD CONSTRAINT tariff_tariff_vasp_id_key UNIQUE (tariff_vasp_id);


--
-- Name: user_options user_options_key_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_options
    ADD CONSTRAINT user_options_key_name_key UNIQUE (key_name);


--
-- Name: user_options user_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_options
    ADD CONSTRAINT user_options_pkey PRIMARY KEY (id);


--
-- Name: category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX category_id ON public.product_category USING btree (category_id);


--
-- Name: default_provisioning_operator_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX default_provisioning_operator_idx ON public.default_provisioning USING btree (operator_id, subscription_action, endpoint_type) WHERE (partner_id IS NULL);


--
-- Name: default_provisioning_partner_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX default_provisioning_partner_idx ON public.default_provisioning USING btree (operator_id, partner_id, subscription_action, endpoint_type) WHERE (partner_id IS NOT NULL);


--
-- Name: fki_fk_service_message___service; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_service_message___service ON public.service_message USING btree (service_id);


--
-- Name: fki_fk_service_provision___service; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_service_provision___service ON public.service_provision USING btree (service_id);


--
-- Name: fki_fk_service_tariff___service; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_service_tariff___service ON public.service_tariff USING btree (service_id);


--
-- Name: fki_fk_service_tariff___tariff; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_service_tariff___tariff ON public.service_tariff USING btree (tariff_id);


--
-- Name: idx_expire_dttm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_expire_dttm ON public.subscription USING btree (expire_dttm);


--
-- Name: price_plan_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX price_plan_type ON public.price_plan USING btree (price_plan_type);


--
-- Name: price_rental_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX price_rental_type ON public.price_plan USING btree (price_rental_type);


--
-- Name: price_schema_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX price_schema_type ON public.price_plan USING btree (price_schema_type);


--
-- Name: price_serv_cont_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX price_serv_cont_type ON public.price_plan USING btree (price_serv_cont_type);


--
-- Name: product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX product_id ON public.product_category USING btree (product_id);


--
-- Name: subscriber_brand brand_p_offer_list_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER brand_p_offer_list_insert AFTER INSERT ON public.subscriber_brand FOR EACH ROW EXECUTE FUNCTION public.brand_p_offer_insert();


--
-- Name: subscriber_brand brand_p_offer_list_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER brand_p_offer_list_update AFTER UPDATE ON public.subscriber_brand FOR EACH ROW EXECUTE FUNCTION public.brand_p_offer_update();


--
-- Name: product product_svc_fk_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER product_svc_fk_insert AFTER INSERT ON public.product FOR EACH ROW EXECUTE FUNCTION public.product_svc_fk_insert();


--
-- Name: product product_svc_fk_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER product_svc_fk_update AFTER UPDATE ON public.product FOR EACH ROW EXECUTE FUNCTION public.product_svc_fk_update();


--
-- Name: default_provisioning provisioning_default_provisioning_fk_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER provisioning_default_provisioning_fk_insert AFTER INSERT ON public.default_provisioning FOR EACH ROW EXECUTE FUNCTION public.provisioning_default_provisioning_fk_insert();


--
-- Name: default_provisioning provisioning_default_provisioning_fk_update; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER provisioning_default_provisioning_fk_update AFTER UPDATE ON public.default_provisioning FOR EACH ROW EXECUTE FUNCTION public.provisioning_default_provisioning_fk_update();

--
-- Name: provisioning_default_provisioning_fk default_provisioning__provisioning_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning_default_provisioning_fk
    ADD CONSTRAINT default_provisioning__provisioning_id_fkey FOREIGN KEY (provisioning_id) REFERENCES public.provisioning(provisioning_id) ON DELETE RESTRICT NOT VALID;


--
-- Name: brand_p_offer fk_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand_p_offer
    ADD CONSTRAINT fk_brand_id FOREIGN KEY (brand_id) REFERENCES public.subscriber_brand(brand_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: brand_p_offer fk_offer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand_p_offer
    ADD CONSTRAINT fk_offer_id FOREIGN KEY (p_offer_id) REFERENCES public.subscriber_primary_offer(p_offer_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: service_tariff fk_service_tariff___tariff; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_tariff
    ADD CONSTRAINT fk_service_tariff___tariff FOREIGN KEY (tariff_id) REFERENCES public.tariff(tariff_id) ON DELETE RESTRICT NOT VALID;


--
-- Name: subscriber fk_subscriber___device_model; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT fk_subscriber___device_model FOREIGN KEY (device_model_id) REFERENCES public.device_model(device_model_id) NOT VALID;


--
-- Name: subscriber fk_subscriber___subscriber_brand; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT fk_subscriber___subscriber_brand FOREIGN KEY (brand_id) REFERENCES public.subscriber_brand(brand_id) NOT VALID;


--
-- Name: subscriber fk_subscriber___subscriber_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT fk_subscriber___subscriber_category FOREIGN KEY (category_id) REFERENCES public.subscriber_category(category_id) NOT VALID;


--
-- Name: subscriber fk_subscriber___subscriber_loyalty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT fk_subscriber___subscriber_loyalty FOREIGN KEY (loyalty_id) REFERENCES public.subscriber_loyalty(loyalty_id) NOT VALID;


--
-- Name: subscriber fk_subscriber___subscriber_primary_offer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT fk_subscriber___subscriber_primary_offer FOREIGN KEY (p_offer_id) REFERENCES public.subscriber_primary_offer(p_offer_id) NOT VALID;


--
-- Name: subscriber fk_subscriber___subscriber_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT fk_subscriber___subscriber_status FOREIGN KEY (sub_status_id) REFERENCES public.subscriber_status(status_id) NOT VALID;


--
-- Name: subscriber fk_subscriber___subscriber_status_detail; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT fk_subscriber___subscriber_status_detail FOREIGN KEY (status_detail_id) REFERENCES public.subscriber_status_detail(status_details_id) NOT VALID;


--
-- Name: product_category product_category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id) ON DELETE CASCADE NOT VALID;


--
-- Name: product_category product_category_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE RESTRICT NOT VALID;


--
-- Name: product_svc_fk product_svc_fk_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_svc_fk
    ADD CONSTRAINT product_svc_fk_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id) ON DELETE CASCADE NOT VALID;


--
-- Name: product_svc_fk product_svc_fk_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_svc_fk
    ADD CONSTRAINT product_svc_fk_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(service_id) ON DELETE RESTRICT NOT VALID;


--
-- Name: provisioning provisioning_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning
    ADD CONSTRAINT provisioning_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.provisioning_group(group_id) ON DELETE RESTRICT NOT VALID;


--
-- Name: provisioning_default_provisioning_fk provisioning_id_fk_default_provisioning_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provisioning_default_provisioning_fk
    ADD CONSTRAINT provisioning_id_fk_default_provisioning_id_fkey FOREIGN KEY (default_provisioning_id) REFERENCES public.default_provisioning(default_provisioning_id) ON DELETE CASCADE NOT VALID;


--
-- Name: service_provision service_provision_provision_data_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_provision
    ADD CONSTRAINT service_provision_provision_data_id_fkey FOREIGN KEY (provision_data_id) REFERENCES public.provisioning(provisioning_id) ON DELETE RESTRICT NOT VALID;


--
-- Name: service service_service_price_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service
    ADD CONSTRAINT service_service_price_plan_fkey FOREIGN KEY (service_price_plan) REFERENCES public.price_plan(price_id) ON DELETE RESTRICT NOT VALID;


--
-- Name: subscription subscription_fk_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription
    ADD CONSTRAINT subscription_fk_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.service(service_id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

