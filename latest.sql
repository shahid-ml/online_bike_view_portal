--
-- PostgreSQL database dump
--

\restrict mbxeRcBK0O9y5W15KZxmMXa22jiiE81bf0rM140tw9LbunED6YQwORm7hmQAwBG

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

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
-- Name: bikes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bikes (
    id integer NOT NULL,
    bike_name character varying(100),
    brand character varying(100),
    price integer,
    image text,
    category character varying(20)
);


ALTER TABLE public.bikes OWNER TO postgres;

--
-- Name: bikes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bikes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bikes_id_seq OWNER TO postgres;

--
-- Name: bikes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bikes_id_seq OWNED BY public.bikes.id;


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
-- Name: offers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offers (
    id integer NOT NULL,
    name character varying(50),
    phone character varying(20),
    bike_id integer
);


ALTER TABLE public.offers OWNER TO postgres;

--
-- Name: offers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.offers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.offers_id_seq OWNER TO postgres;

--
-- Name: offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.offers_id_seq OWNED BY public.offers.id;


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
-- Name: bikes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bikes ALTER COLUMN id SET DEFAULT nextval('public.bikes_id_seq'::regclass);


--
-- Name: booking booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN booking_id SET DEFAULT nextval('public.booking_booking_id_seq'::regclass);


--
-- Name: brand brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN brand_id SET DEFAULT nextval('public.brand_brand_id_seq'::regclass);


--
-- Name: offers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offers ALTER COLUMN id SET DEFAULT nextval('public.offers_id_seq'::regclass);


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
5	TVS Apache RTR 160	BS6	Sports	125000.00	apache160.jpg	t	2	1
6	Royal Enfield Classic 350	BS6	Cruiser	210000.00	classic350.jpg	t	5	1
7	KTM Duke 200	BS6	Sports	190000.00	duke200.jpg	t	6	1
8	Yamaha R15	BS6	Sports	185000.00	r15.jpg	t	7	1
9	Bajaj Pulsar NS200	BS6	Sports	155000.00	ns200.jpg	t	3	1
10	Honda Hornet 2.0	BS6	Sports	140000.00	hornet200.jpg	t	4	1
11	Suzuki Gixxer SF	BS6	Sports	150000.00	gixxer.jpg	t	8	1
12	KTM RC 390	BS6	Sports	320000.00	rc390.jpg	t	6	1
\.


--
-- Data for Name: bike_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bike_detail (detail_id, bike_id, featurename, featurevalue) FROM stdin;
\.


--
-- Data for Name: bikes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bikes (id, bike_name, brand, price, image, category) FROM stdin;
4	TVS Apache RTR 160	TVS	130000	apache160.jpg	\N
1	Royal Enfield Classic 350	Royal Enfield	190000	classic350.jpg	100cc
2	KTM Duke 200	KTM	210000	duke200.jpg	150cc
3	Yamaha R15	Yamaha	180000	r15.jpg	200cc
5	Bajaj Pulsar NS200	Bajaj	155000	ns200.jpg	200cc
6	Honda Hornet 2.0	Honda	140000	hornet200.jpg	200cc
7	Suzuki Gixxer SF	Suzuki	150000	gixxer.jpg	150cc
8	KTM RC 390	KTM	320000	rc390.jpg	390cc
9	Royal Enfield Hunter 350	Royal Enfield	170000	hunter350.jpg	350cc
10	TVS Raider 125	TVS	95000	raider125.jpg	125cc
11	Bajaj Dominar 400	Bajaj	230000	dominar400.jpg	400cc
12	Yamaha MT 15	Yamaha	170000	mt15.jpg	150cc
13	Honda CB350	Honda	215000	cb350.jpg	350cc
14	Suzuki V-Strom SX	Suzuki	210000	vstrom.jpg	250cc
15	Hero Xpulse 200	Hero	145000	xpulse200.jpg	200cc
16	Kawasaki Ninja 300	Kawasaki	340000	ninja300.jpg	300cc
17	BMW G310R	BMW	285000	g310r.jpg	310cc
18	Royal Enfield Meteor 350	Royal Enfield	205000	meteor350.jpg	350cc
19	TVS Ronin	TVS	160000	ronin.jpg	225cc
20	Yamaha FZ S V3	Yamaha	125000	fzs.jpg	150cc
21	Hero Splendor Plus	Hero	75000	splendor.jpg	100cc
22	Honda Shine 125	Honda	90000	shine125.jpg	125cc
23	Bajaj Platina 100	Bajaj	70000	platina.jpg	100cc
24	TVS Sport	TVS	65000	tvssport.jpg	100cc
25	Hero Passion Pro	Hero	80000	passionpro.jpg	110cc
26	Honda SP 125	Honda	92000	sp125.jpg	125cc
27	Bajaj Pulsar 125	Bajaj	95000	pulsar125.jpg	125cc
28	TVS Apache RTR 200	TVS	145000	apache200.jpg	200cc
29	Yamaha FZ X	Yamaha	140000	fzx.jpg	150cc
30	Hero Glamour	Hero	88000	glamour.jpg	125cc
31	Royal Enfield Bullet 350	Royal Enfield	215000	bullet350.jpg	350cc
32	Jawa 42	Jawa	200000	jawa42.jpg	300cc
33	Yezdi Roadster	Yezdi	205000	yezdiroadster.jpg	350cc
34	Bajaj Avenger 220	Bajaj	140000	avenger220.jpg	220cc
35	Suzuki Intruder	Suzuki	135000	intruder.jpg	150cc
36	KTM Duke 390	KTM	310000	duke390.jpg	390cc
37	KTM Duke 250	KTM	240000	duke250.jpg	250cc
38	Yamaha R3	Yamaha	460000	yamahar3.jpg	300cc
39	Kawasaki Ninja 400	Kawasaki	520000	ninja400.jpg	400cc
40	BMW G310GS	BMW	310000	g310gs.jpg	310cc
41	Hero Karizma XMR	Hero	180000	karizma.jpg	210cc
42	TVS Apache RR310	TVS	275000	rr310.jpg	310cc
43	Bajaj Pulsar RS200	Bajaj	170000	rs200.jpg	200cc
44	Honda CBR 250R	Honda	200000	cbr250r.jpg	250cc
45	Suzuki Gixxer 250	Suzuki	195000	gixxer250.jpg	250cc
46	Royal Enfield Scram 411	Royal Enfield	210000	scram411.jpg	411cc
47	Hero Xtreme 125R	Hero	100000	xtreme125r.jpg	125cc
48	Yamaha Fazer 150	Yamaha	140000	fazer150.jpg	150cc
49	TVS Star City Plus	TVS	75000	starcity.jpg	110cc
50	Bajaj CT 110	Bajaj	68000	ct110.jpg	110cc
51	Honda Activa 6G	Honda	78000	activa6g.jpg	110cc
52	Honda Activa 125	Honda	85000	activa125.jpg	125cc
53	TVS Jupiter	TVS	76000	jupiter.jpg	110cc
54	TVS Ntorq 125	TVS	90000	ntorq125.jpg	125cc
55	Suzuki Access 125	Suzuki	88000	access125.jpg	125cc
56	Suzuki Burgman Street	Suzuki	95000	burgman.jpg	125cc
57	Hero Pleasure Plus	Hero	72000	pleasureplus.jpg	110cc
58	Hero Destini 125	Hero	82000	destini125.jpg	125cc
59	Yamaha Fascino 125	Yamaha	83000	fascino125.jpg	125cc
60	Yamaha Ray ZR 125	Yamaha	86000	rayzr125.jpg	125cc
61	Ola S1 Air	Ola	110000	olas1air.jpg	Electric
62	Ola S1 Pro	Ola	135000	olas1pro.jpg	Electric
63	Ather 450X	Ather	145000	ather450x.jpg	Electric
64	Ather 450S	Ather	130000	ather450s.jpg	Electric
65	TVS iQube	TVS	120000	iqube.jpg	Electric
66	Bajaj Chetak Electric	Bajaj	125000	chetakev.jpg	Electric
67	Hero Vida V1	Hero	140000	vidav1.jpg	Electric
68	Ampere Magnus EX	Ampere	95000	magnusex.jpg	Electric
69	Simple One	Simple Energy	150000	simpleone.jpg	Electric
70	Okaya Faast F2F	Okaya	90000	faastf2f.jpg	Electric
71	Honda Dio	Honda	75000	dio.jpg	110cc
72	Honda Dio 125	Honda	92000	dio125.jpg	125cc
73	TVS Scooty Pep Plus	TVS	65000	pepplus.jpg	90cc
74	TVS Zest 110	TVS	70000	zest110.jpg	110cc
75	Hero Maestro Edge 110	Hero	74000	maestro110.jpg	110cc
76	Hero Maestro Edge 125	Hero	86000	maestro125.jpg	125cc
77	Yamaha Aerox 155	Yamaha	150000	aerox155.jpg	155cc
78	Aprilia SR 125	Aprilia	120000	sr125.jpg	125cc
79	Aprilia SR 160	Aprilia	135000	sr160.jpg	160cc
80	Vespa ZX 125	Vespa	115000	vespazx.jpg	125cc
81	Vespa SXL 125	Vespa	130000	sxl125.jpg	125cc
82	Vespa SXL 150	Vespa	145000	sxl150.jpg	150cc
83	Suzuki Avenis 125	Suzuki	92000	avenis.jpg	125cc
84	Suzuki Let’s	Suzuki	70000	lets.jpg	110cc
85	Kinetic Green Zing	Kinetic	85000	zing.jpg	Electric
86	Bounce Infinity E1	Bounce	105000	infinitye1.jpg	Electric
87	Hero Electric Optima	Hero Electric	80000	optima.jpg	Electric
88	Hero Electric Photon	Hero Electric	90000	photon.jpg	Electric
89	Okinawa Praise Pro	Okinawa	115000	praisepro.jpg	Electric
90	Okinawa Ridge Plus	Okinawa	85000	ridgeplus.jpg	Electric
91	Ampere Reo	Ampere	60000	reo.jpg	Electric
92	Pure EV Epluto 7G	Pure EV	92000	epluto7g.jpg	Electric
93	Simple Dot One	Simple Energy	140000	dotone.jpg	Electric
94	River Indie	River	138000	riverindie.jpg	Electric
95	Lectrix EV LXS	Lectrix	98000	lectrixlxs.jpg	Electric
96	BGauss D15	BGauss	120000	d15.jpg	Electric
97	Benling Aura	Benling	95000	aura.jpg	Electric
98	Komaki XGT KM	Komaki	85000	xgtkm.jpg	Electric
99	Joy e-bike Wolf	Joy	78000	wolf.jpg	Electric
100	Detel Easy Plus	Detel	70000	easyplus.jpg	Electric
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
5	Royal Enfield	India
6	KTM	Austria
7	Yamaha	Japan
8	Suzuki	Japan
\.


--
-- Data for Name: offers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offers (id, name, phone, bike_id) FROM stdin;
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
-- Name: bikes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bikes_id_seq', 4, true);


--
-- Name: booking_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_booking_id_seq', 1, false);


--
-- Name: brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_brand_id_seq', 4, true);


--
-- Name: offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.offers_id_seq', 1, false);


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
-- Name: bikes bikes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bikes
    ADD CONSTRAINT bikes_pkey PRIMARY KEY (id);


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
-- Name: offers offers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offers
    ADD CONSTRAINT offers_pkey PRIMARY KEY (id);


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

\unrestrict mbxeRcBK0O9y5W15KZxmMXa22jiiE81bf0rM140tw9LbunED6YQwORm7hmQAwBG

