--
-- PostgreSQL database dump
--

\restrict WDiJ964bdr65QTf01aGMMTefOdv9gHuFcZ3EG8oPNJwjWfzSlEfDoDWkS3sQM6n

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    password character varying(100)
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admin_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_admin_id_seq OWNER TO postgres;

--
-- Name: admin_admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_admin_id_seq OWNED BY public.admin.admin_id;


--
-- Name: bike; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bike (
    bike_id integer NOT NULL,
    name character varying(100),
    model character varying(100),
    segment character varying(50),
    price numeric(10,2),
    image character varying(255),
    spotlight boolean DEFAULT false,
    brand_id integer,
    dealer_id integer
);


ALTER TABLE public.bike OWNER TO postgres;

--
-- Name: bike_bike_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bike_bike_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bike_bike_id_seq OWNER TO postgres;

--
-- Name: bike_bike_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bike_bike_id_seq OWNED BY public.bike.bike_id;


--
-- Name: bike_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bike_detail (
    detail_id integer NOT NULL,
    bike_id integer,
    featurename character varying(100),
    featurevalue character varying(100)
);


ALTER TABLE public.bike_detail OWNER TO postgres;

--
-- Name: bike_detail_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bike_detail_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bike_detail_detail_id_seq OWNER TO postgres;

--
-- Name: bike_detail_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bike_detail_detail_id_seq OWNED BY public.bike_detail.detail_id;


--
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    booking_id integer NOT NULL,
    user_id integer,
    bike_id integer,
    booking_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50)
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- Name: booking_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_booking_id_seq OWNER TO postgres;

--
-- Name: booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_booking_id_seq OWNED BY public.booking.booking_id;


--
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    brand_id integer NOT NULL,
    brand_name character varying(100),
    country character varying(100)
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- Name: brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brand_brand_id_seq OWNER TO postgres;

--
-- Name: brand_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_brand_id_seq OWNED BY public.brand.brand_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(100),
    location character varying(150),
    contact character varying(15),
    email character varying(100),
    password character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: vendor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor (
    dealer_id integer NOT NULL,
    dealer_name character varying(100),
    email character varying(100),
    location character varying(150),
    contact character varying(15)
);


ALTER TABLE public.vendor OWNER TO postgres;

--
-- Name: vendor_dealer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_dealer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendor_dealer_id_seq OWNER TO postgres;

--
-- Name: vendor_dealer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_dealer_id_seq OWNED BY public.vendor.dealer_id;


--
-- Name: admin admin_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_admin_id_seq'::regclass);


--
-- Name: bike bike_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bike ALTER COLUMN bike_id SET DEFAULT nextval('public.bike_bike_id_seq'::regclass);


--
-- Name: bike_detail detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bike_detail ALTER COLUMN detail_id SET DEFAULT nextval('public.bike_detail_detail_id_seq'::regclass);


--
-- Name: booking booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN booking_id SET DEFAULT nextval('public.booking_booking_id_seq'::regclass);


--
-- Name: brand brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN brand_id SET DEFAULT nextval('public.brand_brand_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: vendor dealer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor ALTER COLUMN dealer_id SET DEFAULT nextval('public.vendor_dealer_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (admin_id, name, email, password) FROM stdin;
\.


--
-- Data for Name: bike; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bike (bike_id, name, model, segment, price, image, spotlight, brand_id, dealer_id) FROM stdin;
1	Hero Splendor Plus	BS6	Commuter	74152.00	splendor.jpg	t	1	1
2	TVS Raider	BS6	Sports	82000.00	raider.jpg	t	2	1
3	Bajaj Pulsar 125	BS6	Sports	81556.00	pulsar_125.jpg	t	3	1
4	Honda SP 125	BS6	Commuter	87878.00	sp_125.jpg	t	4	1
\.


--
-- Data for Name: bike_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bike_detail (detail_id, bike_id, featurename, featurevalue) FROM stdin;
\.


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booking (booking_id, user_id, bike_id, booking_date, status) FROM stdin;
\.


--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brand (brand_id, brand_name, country) FROM stdin;
1	Hero	India
2	TVS	India
3	Bajaj	India
4	Honda	Japan
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, name, location, contact, email, password) FROM stdin;
\.


--
-- Data for Name: vendor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor (dealer_id, dealer_name, email, location, contact) FROM stdin;
1	Main Dealer	dealer@mail.com	Pune	9999999999
\.


--
-- Name: admin_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_admin_id_seq', 1, false);


--
-- Name: bike_bike_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bike_bike_id_seq', 4, true);


--
-- Name: bike_detail_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bike_detail_detail_id_seq', 1, false);


--
-- Name: booking_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_booking_id_seq', 1, false);


--
-- Name: brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_brand_id_seq', 4, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: vendor_dealer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_dealer_id_seq', 1, true);


--
-- Name: admin admin_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_email_key UNIQUE (email);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);


--
-- Name: bike_detail bike_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bike_detail
    ADD CONSTRAINT bike_detail_pkey PRIMARY KEY (detail_id);


--
-- Name: bike bike_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bike
    ADD CONSTRAINT bike_pkey PRIMARY KEY (bike_id);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_id);


--
-- Name: brand brand_brand_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_brand_name_key UNIQUE (brand_name);


--
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brand_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: vendor vendor_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT vendor_email_key UNIQUE (email);


--
-- Name: vendor vendor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor
    ADD CONSTRAINT vendor_pkey PRIMARY KEY (dealer_id);


--
-- Name: bike bike_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bike
    ADD CONSTRAINT bike_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(brand_id);


--
-- Name: bike bike_dealer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bike
    ADD CONSTRAINT bike_dealer_id_fkey FOREIGN KEY (dealer_id) REFERENCES public.vendor(dealer_id);


--
-- Name: bike_detail bike_detail_bike_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bike_detail
    ADD CONSTRAINT bike_detail_bike_id_fkey FOREIGN KEY (bike_id) REFERENCES public.bike(bike_id);


--
-- Name: booking booking_bike_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_bike_id_fkey FOREIGN KEY (bike_id) REFERENCES public.bike(bike_id);


--
-- Name: booking booking_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

\unrestrict WDiJ964bdr65QTf01aGMMTefOdv9gHuFcZ3EG8oPNJwjWfzSlEfDoDWkS3sQM6n

