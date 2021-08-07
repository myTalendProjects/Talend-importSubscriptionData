--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg90+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg90+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: device_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_model (
    device_model_id integer NOT NULL,
    operator_id integer NOT NULL,
    device_model_name character varying(150) NOT NULL,
    device_model_code character varying(150) NOT NULL,
    description text
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
-- Name: language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.language (
    language_id integer NOT NULL,
    operator_id integer NOT NULL,
    language_name character varying(150) NOT NULL,
    language_code character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.language OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.language_language_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.language_language_id_seq OWNER TO postgres;

--
-- Name: language_language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.language_language_id_seq OWNED BY public.language.language_id;


--
-- Name: subscriber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber (
    subscriber_id integer NOT NULL,
    msisdn character varying(20) NOT NULL,
    operator_id integer NOT NULL,
    cus_type smallint,
    pref_lang smallint,
    sub_status_id integer,
    status_detail_id integer,
    p_offer_id integer,
    brand_id integer,
    loyalty_id integer,
    category_id integer,
    device_model_id integer,
    subscribed_dttm date,
    activated_dttm date,
    expiry_dttm date
);


ALTER TABLE public.subscriber OWNER TO postgres;

--
-- Name: subscriber_brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber_brand (
    brand_id integer NOT NULL,
    operator_id integer NOT NULL,
    brand_name character varying(50) NOT NULL,
    ngbss_brand character varying(50) NOT NULL,
    p_offer_list integer[],
    description text
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
    operator_id integer NOT NULL,
    category_name character varying(50) NOT NULL,
    ngbss_category character varying(50) NOT NULL,
    description text
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
    operator_id integer NOT NULL,
    loyalty_name character varying(50) NOT NULL,
    ngbss_loyalty character varying(50) NOT NULL,
    description text
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
    operator_id integer NOT NULL,
    p_offer_name character varying(50) NOT NULL,
    ngbss_p_offer character varying(50) NOT NULL,
    description text
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
    operator_id integer NOT NULL,
    status_name character varying(50) NOT NULL,
    ngbss_status character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.subscriber_status OWNER TO postgres;

--
-- Name: subscriber_status_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriber_status_detail (
    status_details_id integer NOT NULL,
    operator_id integer NOT NULL,
    status_details_name character varying(50) NOT NULL,
    ngbss_status_details character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.subscriber_status_detail OWNER TO postgres;

--
-- Name: subscriber_status_detail_status_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_status_detail_status_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_status_detail_status_details_id_seq OWNER TO postgres;

--
-- Name: subscriber_status_detail_status_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_status_detail_status_details_id_seq OWNED BY public.subscriber_status_detail.status_details_id;


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
    subscriber_type_id integer NOT NULL,
    operator_id integer NOT NULL,
    subscriber_type_name character varying(150) NOT NULL,
    subscriber_type_code character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.subscriber_type OWNER TO postgres;

--
-- Name: subscriber_type_subscriber_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_type_subscriber_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subscriber_type_subscriber_type_id_seq OWNER TO postgres;

--
-- Name: subscriber_type_subscriber_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_type_subscriber_type_id_seq OWNED BY public.subscriber_type.subscriber_type_id;


--
-- Name: device_model device_model_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_model ALTER COLUMN device_model_id SET DEFAULT nextval('public.device_model_device_model_id_seq'::regclass);


--
-- Name: language language_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language ALTER COLUMN language_id SET DEFAULT nextval('public.language_language_id_seq'::regclass);


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

ALTER TABLE ONLY public.subscriber_status_detail ALTER COLUMN status_details_id SET DEFAULT nextval('public.subscriber_status_detail_status_details_id_seq'::regclass);


--
-- Name: subscriber_type subscriber_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_type ALTER COLUMN subscriber_type_id SET DEFAULT nextval('public.subscriber_type_subscriber_type_id_seq'::regclass);


--
-- Data for Name: device_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_model (device_model_id, operator_id, device_model_name, device_model_code, description) FROM stdin;
614	1	Century Exports_1 Music	Century Exports_1 Music	Century Exports-BasicPhone
615	1	Intex IE0219ND/ECO111	Intex IE0219ND/ECO111	Intex-Basic Phone
616	1	TeleTalk CL101 Music	TeleTalk CL101 Music	TeleTalk-Basic Phone
617	1	Vivo 1820/Y91C/Y91C 2020/Y91I	Vivo 1820/Y91C/Y91C 2020/Y91I	Vivo-Phablet
618	1	Itel Technology Limited IT2163/Value 100	Itel Technology Limited IT2163/Value 100	Itel Technology Limited-Basic Phone
620	1	Nokia X1-01	Nokia X1-01	Nokia-Basic Phone
622	1	Oppo CPH1909/A5s	Oppo CPH1909/A5s	Oppo-Smartphone
623	1	Hmd Global Oy TA-1010/NOKIA105 SS/Nokia 105/Nokia 105 SS	Hmd Global Oy TA-1010/NOKIA105 SS/Nokia 105/Nokia 105 SS	Hmd Global Oy-Basic Phone
624	1	Xiaomi M2006C3MG/Xiaomi Redmi 9C	Xiaomi M2006C3MG/Xiaomi Redmi 9C	Xiaomi-Phablet
625	1	Oppo CPH1911/ F11	Oppo CPH1911/ F11	Oppo-Smartphone
628	1	Samsung SM-J120HDS/Samsung Galaxy J1 (2016)	Samsung SM-J120HDS/Samsung Galaxy J1 (2016)	\N
629	1	Samsung SM-J720FDS/Samsung Galaxy J7 DUO	Samsung SM-J720FDS/Samsung Galaxy J7 DUO	\N
630	1	Shenzhen Blephone K7/Lephone K7	Shenzhen Blephone K7/Lephone K7	\N
631	1	Apple A1688/Apple iPhone 6S	Apple A1688/Apple iPhone 6S	\N
632	1	Agaston A1806/Tambo A1806	Agaston A1806/Tambo A1806	\N
633	1	Samsung SM-G615FDS/Samsung Galaxy J7 MAX	Samsung SM-G615FDS/Samsung Galaxy J7 MAX	\N
634	1	Samsung SM-A605FDS/Samsung Galaxy A6 Plus	Samsung SM-A605FDS/Samsung Galaxy A6 Plus	\N
635	1	Gionee GN128/P2S/P4	Gionee GN128/P2S/P4	\N
636	1	Samsung SM-J120GDS/Samsung Galaxy J1 (2016) Duos	Samsung SM-J120GDS/Samsung Galaxy J1 (2016) Duos	\N
\.


--
-- Data for Name: language; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.language (language_id, operator_id, language_name, language_code, description) FROM stdin;
\.


--
-- Data for Name: subscriber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber (subscriber_id, msisdn, operator_id, cus_type, pref_lang, sub_status_id, status_detail_id, p_offer_id, brand_id, loyalty_id, category_id, device_model_id, subscribed_dttm, activated_dttm, expiry_dttm) FROM stdin;
109	9800000005	1	1	\N	1	\N	3	\N	\N	\N	636	\N	2010-05-15	\N
117	9800000019	1	1	\N	1	\N	2	\N	\N	\N	628	\N	2018-10-25	\N
110	9800000006	1	1	\N	1	\N	2	\N	\N	\N	635	\N	2015-11-09	\N
111	9800000010	1	1	\N	1	\N	2	\N	\N	\N	634	\N	2019-07-12	\N
112	9800000011	1	2	\N	4	\N	6	\N	\N	\N	633	\N	2015-06-04	\N
113	9800000014	1	1	\N	1	\N	7	\N	\N	\N	632	\N	2013-09-29	\N
114	9800000015	1	1	\N	1	\N	3	\N	\N	\N	631	\N	2010-05-24	\N
115	9800000016	1	1	\N	1	\N	8	\N	\N	\N	630	\N	2016-05-22	\N
116	9800000018	1	1	\N	1	\N	2	\N	\N	\N	629	\N	2016-12-24	\N
\.


--
-- Data for Name: subscriber_brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_brand (brand_id, operator_id, brand_name, ngbss_brand, p_offer_list, description) FROM stdin;
\.


--
-- Data for Name: subscriber_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_category (category_id, operator_id, category_name, ngbss_category, description) FROM stdin;
\.


--
-- Data for Name: subscriber_loyalty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_loyalty (loyalty_id, operator_id, loyalty_name, ngbss_loyalty, description) FROM stdin;
\.


--
-- Data for Name: subscriber_primary_offer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_primary_offer (p_offer_id, operator_id, p_offer_name, ngbss_p_offer, description) FROM stdin;
1	1	Sajilo_Sajilo	Sajilo_Sajilo	Sajilo_Sajilo tariff plan
2	1	Sajilo Bonus Plus	Sajilo Bonus Plus	Sajilo Bonus Plus tariff plan
3	1	RAMRO_Ramro	RAMRO_Ramro	RAMRO_Ramro tariff plan
4	1	Mero_Plan 299	Mero_Plan 299	Mero_Plan 299 tariff plan
5	1	Postpaid_299_Ad	Postpaid_299_Ad	Postpaid_299_Ad tariff plan
6	1	Classic_Ad_Monthly	Classic_Ad_Monthly	Classic_Ad_Monthly tariff plan
7	1	Sajilo_SIMSIM	Sajilo_SIMSIM	Sajilo_SIMSIM tariff plan
8	1	Sajilo Masik Bonus Pack	Sajilo Masik Bonus Pack	Sajilo Masik Bonus Pack tariff plan
\.


--
-- Data for Name: subscriber_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_status (status_id, operator_id, status_name, ngbss_status, description) FROM stdin;
1	1	Active	Active	Active status
2	1	Expired	Expired	Expired status
4	1	Two-Way Block	Two-Way Block	Two-Way Block status
3	1	One-Way Block	One-Way Block	One-Way Block status
\.


--
-- Data for Name: subscriber_status_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_status_detail (status_details_id, operator_id, status_details_name, ngbss_status_details, description) FROM stdin;
\.


--
-- Data for Name: subscriber_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriber_type (subscriber_type_id, operator_id, subscriber_type_name, subscriber_type_code, description) FROM stdin;
1	1	Prepaid	Prepaid	Prepaid Type
2	1	Postpaid Advance	Postpaid Advance	Postpaid Advance Type
3	1	Postpaid	Postpaid	Postpaid Type
\.


--
-- Name: device_model_device_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_model_device_model_id_seq', 636, true);


--
-- Name: language_language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.language_language_id_seq', 1, false);


--
-- Name: subscriber_brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_brand_brand_id_seq', 1, false);


--
-- Name: subscriber_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_category_category_id_seq', 1, false);


--
-- Name: subscriber_loyalty_loyalty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_loyalty_loyalty_id_seq', 1, false);


--
-- Name: subscriber_primary_offer_p_offer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_primary_offer_p_offer_id_seq', 8, true);


--
-- Name: subscriber_status_detail_status_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_status_detail_status_details_id_seq', 1, false);


--
-- Name: subscriber_status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_status_status_id_seq', 4, true);


--
-- Name: subscriber_subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_subscriber_id_seq', 117, true);


--
-- Name: subscriber_type_subscriber_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_type_subscriber_type_id_seq', 3, true);


--
-- Name: device_model device_model_device_model_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_model
    ADD CONSTRAINT device_model_device_model_code_key UNIQUE (device_model_code);


--
-- Name: device_model device_model_device_model_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_model
    ADD CONSTRAINT device_model_device_model_name_key UNIQUE (device_model_name);


--
-- Name: device_model device_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_model
    ADD CONSTRAINT device_model_pkey PRIMARY KEY (device_model_id);


--
-- Name: language language_language_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_language_code_key UNIQUE (language_code);


--
-- Name: language language_language_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_language_name_key UNIQUE (language_name);


--
-- Name: language language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.language
    ADD CONSTRAINT language_pkey PRIMARY KEY (language_id);


--
-- Name: subscriber_brand subscriber_brand_brand_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_brand
    ADD CONSTRAINT subscriber_brand_brand_name_key UNIQUE (brand_name);


--
-- Name: subscriber_brand subscriber_brand_ngbss_brand_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_brand
    ADD CONSTRAINT subscriber_brand_ngbss_brand_key UNIQUE (ngbss_brand);


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
-- Name: subscriber_category subscriber_category_ngbss_category_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_category
    ADD CONSTRAINT subscriber_category_ngbss_category_key UNIQUE (ngbss_category);


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
-- Name: subscriber_loyalty subscriber_loyalty_ngbss_loyalty_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_loyalty
    ADD CONSTRAINT subscriber_loyalty_ngbss_loyalty_key UNIQUE (ngbss_loyalty);


--
-- Name: subscriber_loyalty subscriber_loyalty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_loyalty
    ADD CONSTRAINT subscriber_loyalty_pkey PRIMARY KEY (loyalty_id);


--
-- Name: subscriber subscriber_msisdn_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_msisdn_key UNIQUE (msisdn);


--
-- Name: subscriber subscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_pkey PRIMARY KEY (subscriber_id);


--
-- Name: subscriber_primary_offer subscriber_primary_offer_ngbss_p_offer_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_primary_offer
    ADD CONSTRAINT subscriber_primary_offer_ngbss_p_offer_key UNIQUE (ngbss_p_offer);


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
-- Name: subscriber_status_detail subscriber_status_detail_ngbss_status_details_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status_detail
    ADD CONSTRAINT subscriber_status_detail_ngbss_status_details_key UNIQUE (ngbss_status_details);


--
-- Name: subscriber_status_detail subscriber_status_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status_detail
    ADD CONSTRAINT subscriber_status_detail_pkey PRIMARY KEY (status_details_id);


--
-- Name: subscriber_status_detail subscriber_status_detail_status_details_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status_detail
    ADD CONSTRAINT subscriber_status_detail_status_details_name_key UNIQUE (status_details_name);


--
-- Name: subscriber_status subscriber_status_ngbss_status_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_status
    ADD CONSTRAINT subscriber_status_ngbss_status_key UNIQUE (ngbss_status);


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
    ADD CONSTRAINT subscriber_type_pkey PRIMARY KEY (subscriber_type_id);


--
-- Name: subscriber_type subscriber_type_subscriber_type_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_type
    ADD CONSTRAINT subscriber_type_subscriber_type_code_key UNIQUE (subscriber_type_code);


--
-- Name: subscriber_type subscriber_type_subscriber_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber_type
    ADD CONSTRAINT subscriber_type_subscriber_type_name_key UNIQUE (subscriber_type_name);


--
-- Name: subscriber subscriber_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.subscriber_brand(brand_id) ON DELETE RESTRICT;


--
-- Name: subscriber subscriber_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.subscriber_category(category_id) ON DELETE RESTRICT;


--
-- Name: subscriber subscriber_cus_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_cus_type_fkey FOREIGN KEY (cus_type) REFERENCES public.subscriber_type(subscriber_type_id) ON DELETE RESTRICT;


--
-- Name: subscriber subscriber_device_model_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_device_model_id_fkey FOREIGN KEY (device_model_id) REFERENCES public.device_model(device_model_id) ON DELETE RESTRICT;


--
-- Name: subscriber subscriber_loyalty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_loyalty_id_fkey FOREIGN KEY (loyalty_id) REFERENCES public.subscriber_loyalty(loyalty_id) ON DELETE RESTRICT;


--
-- Name: subscriber subscriber_p_offer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_p_offer_id_fkey FOREIGN KEY (p_offer_id) REFERENCES public.subscriber_primary_offer(p_offer_id) ON DELETE RESTRICT;


--
-- Name: subscriber subscriber_pref_lang_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_pref_lang_fkey FOREIGN KEY (pref_lang) REFERENCES public.language(language_id) ON DELETE RESTRICT;


--
-- Name: subscriber subscriber_status_detail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_status_detail_id_fkey FOREIGN KEY (status_detail_id) REFERENCES public.subscriber_status_detail(status_details_id) ON DELETE RESTRICT;


--
-- Name: subscriber subscriber_sub_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_sub_status_id_fkey FOREIGN KEY (sub_status_id) REFERENCES public.subscriber_status(status_id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

