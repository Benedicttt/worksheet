--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-1.pgdg22.04+1)

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
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: udga350s7ocpm3
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO udga350s7ocpm3;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO hyfhpkuapmdkcl;

--
-- Name: eggs_collections; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.eggs_collections (
    id bigint NOT NULL,
    user_id integer,
    years character varying,
    month character varying,
    day integer,
    lsl_prima character varying,
    craggs character varying,
    big_plus_small character varying,
    floor_eggs character varying,
    egg_weight character varying,
    deads character varying,
    water_ml_day character varying,
    feed_g_day character varying,
    hen_weight character varying,
    check_nests boolean,
    mark_1 character varying,
    mark_1_with_years character varying,
    info_started character varying
);


ALTER TABLE public.eggs_collections OWNER TO hyfhpkuapmdkcl;

--
-- Name: eggs_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.eggs_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eggs_collections_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: eggs_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.eggs_collections_id_seq OWNED BY public.eggs_collections.id;


--
-- Name: periods; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.periods (
    id bigint NOT NULL,
    "to" integer,
    "from" integer,
    month integer,
    year integer,
    week_number integer
);


ALTER TABLE public.periods OWNER TO hyfhpkuapmdkcl;

--
-- Name: periods_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.periods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.periods_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: periods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.periods_id_seq OWNED BY public.periods.id;


--
-- Name: rules; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.rules (
    id bigint NOT NULL,
    user_id integer,
    worker boolean DEFAULT true,
    manager boolean DEFAULT false,
    create_user boolean,
    edit_user boolean,
    edit_all_work_list boolean,
    edit_work_list boolean,
    edit_all_eggs_collection boolean,
    edit_eggs_collection boolean
);


ALTER TABLE public.rules OWNER TO hyfhpkuapmdkcl;

--
-- Name: rules_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.rules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rules_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: rules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.rules_id_seq OWNED BY public.rules.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO hyfhpkuapmdkcl;

--
-- Name: users; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    first_name character varying,
    email character varying,
    nickname character varying,
    phone character varying,
    password character varying,
    telegram character varying,
    last_name character varying,
    is_available boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO hyfhpkuapmdkcl;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: work_lists; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.work_lists (
    id bigint NOT NULL,
    user_id integer,
    years integer,
    month integer,
    day integer,
    work_start character varying,
    work_stop character varying,
    break_start character varying,
    break_stop character varying,
    hours character varying,
    comment character varying,
    work_start_minutes double precision,
    work_stop_minutes double precision,
    break_start_minutes double precision,
    break_stop_minutes double precision,
    hours_minutes double precision,
    washing_time_minutes double precision,
    washing_time character varying
);


ALTER TABLE public.work_lists OWNER TO hyfhpkuapmdkcl;

--
-- Name: work_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.work_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_lists_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: work_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.work_lists_id_seq OWNED BY public.work_lists.id;


--
-- Name: work_shift_schedule_days; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.work_shift_schedule_days (
    id bigint NOT NULL,
    work_shift_schedule_id integer,
    monday_number_day integer,
    tuesday_number_day integer,
    wednesday_number_day integer,
    thursday_number_day integer,
    friday_number_day integer,
    saturday_number_day integer,
    sunday_number_day integer
);


ALTER TABLE public.work_shift_schedule_days OWNER TO hyfhpkuapmdkcl;

--
-- Name: work_shift_schedule_days_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.work_shift_schedule_days_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_shift_schedule_days_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: work_shift_schedule_days_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.work_shift_schedule_days_id_seq OWNED BY public.work_shift_schedule_days.id;


--
-- Name: work_shift_schedules; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.work_shift_schedules (
    id bigint NOT NULL,
    user_id integer,
    comment character varying,
    period_id integer,
    monday character varying,
    monday_hours double precision DEFAULT 0.0,
    tuesday character varying,
    tuesday_hours double precision DEFAULT 0.0,
    wednesday character varying,
    wednesday_hours double precision DEFAULT 0.0,
    thursday character varying,
    thursday_hours double precision DEFAULT 0.0,
    friday character varying,
    friday_hours double precision DEFAULT 0.0,
    saturday character varying,
    saturday_hours double precision DEFAULT 0.0,
    sunday character varying,
    sunday_hours double precision DEFAULT 0.0
);


ALTER TABLE public.work_shift_schedules OWNER TO hyfhpkuapmdkcl;

--
-- Name: work_shift_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.work_shift_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.work_shift_schedules_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: work_shift_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.work_shift_schedules_id_seq OWNED BY public.work_shift_schedules.id;


--
-- Name: eggs_collections id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.eggs_collections ALTER COLUMN id SET DEFAULT nextval('public.eggs_collections_id_seq'::regclass);


--
-- Name: periods id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.periods ALTER COLUMN id SET DEFAULT nextval('public.periods_id_seq'::regclass);


--
-- Name: rules id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.rules ALTER COLUMN id SET DEFAULT nextval('public.rules_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: work_lists id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.work_lists ALTER COLUMN id SET DEFAULT nextval('public.work_lists_id_seq'::regclass);


--
-- Name: work_shift_schedule_days id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.work_shift_schedule_days ALTER COLUMN id SET DEFAULT nextval('public.work_shift_schedule_days_id_seq'::regclass);


--
-- Name: work_shift_schedules id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.work_shift_schedules ALTER COLUMN id SET DEFAULT nextval('public.work_shift_schedules_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2022-07-31 15:12:33.494279	2022-07-31 15:12:33.494279
\.


--
-- Data for Name: eggs_collections; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.eggs_collections (id, user_id, years, month, day, lsl_prima, craggs, big_plus_small, floor_eggs, egg_weight, deads, water_ml_day, feed_g_day, hen_weight, check_nests, mark_1, mark_1_with_years, info_started) FROM stdin;
\.


--
-- Data for Name: periods; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.periods (id, "to", "from", month, year, week_number) FROM stdin;
1	8	14	8	2022	32
2	15	21	8	2022	33
3	22	28	8	2022	34
4	29	4	9	2022	35
5	12	18	9	2022	37
6	26	2	10	2022	39
\.


--
-- Data for Name: rules; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.rules (id, user_id, worker, manager, create_user, edit_user, edit_all_work_list, edit_work_list, edit_all_eggs_collection, edit_eggs_collection) FROM stdin;
1	1	t	t	t	t	t	t	t	t
2	2	t	f	f	t	f	t	f	t
3	3	t	f	f	t	f	t	f	t
4	4	t	f	f	t	f	t	f	t
5	5	t	f	f	t	f	t	f	t
6	6	t	f	f	t	f	t	f	t
7	7	t	f	f	t	f	t	f	t
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.schema_migrations (version) FROM stdin;
20220721152103
20220811191255
20220928172335
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.users (id, first_name, email, nickname, phone, password, telegram, last_name, is_available) FROM stdin;
3	Evgenij	Evgenij@email.com		+79199621364	Qwerty123		Kirychenko	t
4	Niko	Niko@email.com		+79199621364	Qwerty123			t
5	Alex	Alex@email.com		+79199621364	Qwerty123			t
6	Serhii	Serhii@email.com	benedict	+79199621364	Folken123		Kyivskyi	t
1	admin	admin@email.com	admin		Admin1234			t
7	Evgenij	Evgenij.Chearanjov@email.com			Qwerty1234		Chearanjov	t
2	Sviatoslav	melnykso88@gmail.com			Qwerty123		Melnyk	t
\.


--
-- Data for Name: work_lists; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.work_lists (id, user_id, years, month, day, work_start, work_stop, break_start, break_stop, hours, comment, work_start_minutes, work_stop_minutes, break_start_minutes, break_stop_minutes, hours_minutes, washing_time_minutes, washing_time) FROM stdin;
1	1	2022	2	1	:	:	-1:1	:	:	123dqsd	\N	\N	\N	\N	\N	\N	\N
2	6	2022	8	1	06:00	16:00	00:00	00:00	10:00	transport HH- Mellila	360	960	0	0	600	\N	\N
3	6	2022	8	2	06:00	15:00	00:00	00:00	09:30	transport HH - Humpila, boxes work	360	900	0	0	570	\N	\N
4	6	2022	8	3	06:00	19:20	00:00	00:00	13:20	transport HH -> Mellila, load chiks	360	1160	0	0	800	\N	\N
5	6	2022	8	8	06:00	14:00	00:00	00:00	08:00	clean and washing room 3	360	840	0	0	480	\N	\N
6	6	2022	8	9	06:30	17:20	00:00	00:00	10:50	kill hens askainen	390	1040	0	0	650	\N	\N
7	6	2022	8	10	06:00	14:40	00:00	00:00	08:40	clean and washing room 1 to HH	360	880	0	0	520	\N	\N
8	6	2022	8	11	06:00	16:00	00:00	00:00	10:00	washing metals to HH	360	960	0	0	600	\N	\N
9	6	2022	8	12	06:00	16:40	00:00	00:00	10:40	Build room 1 2 3 	360	1000	0	0	640	\N	\N
10	6	2022	8	15	16:00	20:15	00:00	00:00	04:15	Load chiks	960	1215	0	0	255	\N	\N
11	6	2022	8	16	08:00	15:30	00:00	00:00	07:30	Washing boxes	480	930	0	0	450	\N	\N
12	6	2022	8	17	16:00	19:15	00:00	00:00	03:15	load chiks	960	1155	0	0	195	\N	\N
13	6	2022	8	18	05:00	15:35	00:00	00:00	10:35	Load chiks, clean room 1-2\r\n	300	935	0	0	635	\N	\N
14	6	2022	8	19	06:00	15:00	00:00	00:00	09:00	Clean box, load chiks	360	900	0	0	540	\N	\N
15	6	2022	8	22	08:00	16:00	00:00	00:00	08:00	washing boxes	480	960	0	0	480	\N	\N
16	6	2022	8	23	07:30	15:30	00:00	00:00	08:00	washing boxes and clean FH	450	930	0	0	480	\N	\N
17	6	2022	8	24	08:00	16:00	00:00	00:00	08:00	Washing boxes	480	960	0	0	480	\N	\N
18	6	2022	8	25	06:00	14:00	00:00	00:00	08:00	Washing room\r\n	360	840	0	0	480	\N	\N
19	6	2022	8	26	08:00	17:45	00:00	00:00	09:45	Washing fh\r\n	480	1065	0	0	585	\N	\N
20	6	2022	8	29	06:00	14:30	00:00	00:00	08:30	killing chiks 	360	870	0	0	510	\N	\N
21	6	2022	8	30	08:00	14:30	00:00	00:00	06:30	Clean parvi\r\n	480	870	0	0	390	\N	\N
22	6	2022	8	31	08:00	18:30	00:00	00:00	10:30	clean parvi	480	1110	0	0	630	\N	\N
23	6	2022	9	1	06:00	14:30	00:00	00:00	08:30	cleaning alakerta	360	870	0	0	510	\N	\N
25	6	2022	9	3	08:00	17:00	00:00	00:00	09:00	cleaning parvi and alakerta	480	1020	0	0	540	\N	\N
26	6	2022	9	5	06:00	15:00	00:00	00:00	09:00	transport Sastamala in Loimaa	360	900	0	0	540	\N	\N
27	6	2022	9	6	07:00	14:40	00:00	00:00	07:40	transport Sastamala in Loimaa	420	880	0	0	460	\N	\N
28	6	2022	9	7	07:00	17:00	00:00	00:00	10:00	Transport Sastamala in alastaro and Kokemäki	420	1020	0	0	600	\N	\N
31	6	2022	9	12	06:00	17:00	00:00	00:00	11:00	Load chiks huitinen	360	1020	0	0	660	\N	\N
32	6	2022	9	13	07:00	16:00	00:00	00:00	09:00	Load chiks huitinen\r\n	420	960	0	0	540	\N	\N
33	6	2022	9	14	07:30	17:00	00:00	00:00	09:30	Load chiks huitinen\r\n	450	1020	0	0	570	\N	\N
37	6	2022	9	15	00:00	00:00	00:00	00:00	00:00	HAMK 	0	0	0	0	0	\N	\N
30	6	2022	9	9	08:00	16:30	00:00	00:00	08:30	Washing fh(washing 8 hours)	480	990	0	0	510	480	08:00
42	6	2022	9	27	08:00	15:00	00:00	00:00	07:00	washing plastic for nests	480	900	0	0	420	\N	\N
43	6	2022	9	28	08:00	16:00	00:00	00:00	08:00	 Unload boxes, prepare yellow plastic for washing	480	960	0	0	480	\N	\N
24	6	2022	9	2	08:00	16:30	00:00	00:00	08:30	cleaning parvi	480	990	0	0	510	\N	\N
34	6	2022	9	20	08:00	19:00	00:00	00:00	11:00	washing Kokemäki(washing 10:30 hours)	480	1140	0	0	660	630	10:30
39	6	2022	9	21	08:00	19:00	00:00	00:00	11:00	washing Kokemäki(washing 7:30 hours)	480	1140	0	0	660	450	07:30
44	6	2022	9	29	08:00	14:30	00:00	00:00	06:30	Washing yellow plastic\r\n	480	870	0	0	390	390	06:30
36	6	2022	9	16	08:00	16:30	00:00	00:00	08:30	washing boxes(washing 7 hours)	480	990	0	0	510	420	07:00
29	6	2022	9	8	08:00	16:30	00:00	00:00	08:30	washing fh(washing 7 hours)	480	990	0	0	510	420	07:00
41	6	2022	9	26	06:00	19:30	00:00	00:00	13:30	collect Kökemäki	360	1170	0	0	810	\N	\N
40	6	2022	9	23	06:00	13:20	00:00	00:00	07:20	Transport Laitila - Mynämäki	360	800	0	0	440	\N	\N
38	6	2022	9	22	06:00	13:50	00:00	00:00	07:50	transport Laitila - Mynämäki	360	830	0	0	470	\N	\N
35	6	2022	9	19	06:00	18:00	00:00	00:00	12:00	washing Kokemäki(washing 8 hours)	360	1080	0	0	720	480	08:00
45	6	2022	10	3	08:00	16:30	00:00	00:00	08:30	washing instruments and egg room alakerta	480	990	0	0	510	300	05:00
46	6	2022	10	4	14:00	22:30	00:00	00:00	08:30	washing parvi	840	1350	0	0	510	420	07:00
47	6	2022	10	5	09:00	16:00	00:00	00:00	07:00	paint	540	960	0	0	420	0	00:00
48	6	2022	10	6	08:00	16:00	00:00	00:00	08:00	paint	480	960	0	0	480	0	00:00
49	6	2022	10	7	05:00	14:30	00:00	00:00	09:30	humpila	300	870	0	0	570	0	00:00
50	6	2022	10	9	00:00	00:00	00:00	00:00	00:00		0	0	0	0	0	0	00:00
51	6	2022	10	10	09:00	17:00	00:00	00:00	08:00	Paint house\r\n	540	1020	0	0	480	0	00:00
52	6	2022	10	12	09:00	17:30	00:00	00:00	08:30	 Paint house\r\n	540	1050	0	0	510	0	00:00
54	6	2022	10	11	08:00	15:00	00:00	00:00	07:00	extra work	480	900	0	0	420	0	00:00
53	6	2022	10	13	08:00	16:00	00:00	00:00	08:00	parvi alakerta finish work	480	960	0	0	480	0	00:00
56	2	2022	10	1	08:00	16:00	00:00	00:00	08:00	Collect eggs	480	960	0	0	480	0	00:00
57	2	2022	10	3	08:00	13:00	00:00	00:00	05:00	Collect chicken 	480	780	0	0	300	360	06:00
58	6	2022	10	19	09:00	17:30	00:00	00:00	08:30	washing trailer	540	1050	0	0	510	420	07:00
55	6	2022	10	18	09:00	17:00	00:00	00:00	08:00	assembling the structure in fh	540	1020	0	0	480	0	00:00
59	6	2022	10	20	08:00	16:30	00:00	00:00	08:30	wood work, oil work for tailer	480	990	0	0	510	0	00:00
60	6	2022	10	21	08:00	16:30	00:00	00:00	08:30	oil work for trailer, welning work(4 hours),work with leaves\r\n	480	990	0	0	510	0	00:00
61	6	2022	10	24	06:00	16:15	00:00	00:00	10:15	Load Huitinen chinks and unload  Askainen chiks	360	975	0	0	615	0	00:00
62	6	2022	10	25	06:00	16:15	00:00	00:00	10:15	Load Huitinen chinks and unload  Askainen chiks	360	975	0	0	615	0	00:00
67	2	2022	11	1	08:00	15:15	00:00	00:00	07:15	Hh, collect eggs, cleaning uk, transport dead chickens away, poison work.\r\nCollect chicken Masku (1,5 h).	480	915	0	0	435	0	00:00
64	6	2022	10	28	07:00	14:00	00:00	00:00	07:00	Load chiks masku	420	840	0	0	420	0	00:00
63	6	2022	10	27	07:00	14:00	00:00	00:00	07:00	Load chiks masku	420	840	0	0	420	0	00:00
66	6	2022	11	2	07:00	16:30	00:00	00:00	09:30	load chiks in Masku(prepearing for Niko boxes washing )	420	990	0	0	570	0	00:00
65	6	2022	11	1	00:00	00:00	00:00	00:00	00:00		0	0	0	0	0	0	00:00
\.


--
-- Data for Name: work_shift_schedule_days; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.work_shift_schedule_days (id, work_shift_schedule_id, monday_number_day, tuesday_number_day, wednesday_number_day, thursday_number_day, friday_number_day, saturday_number_day, sunday_number_day) FROM stdin;
1	1	8	9	10	11	12	13	14
2	2	8	9	10	11	12	13	14
3	3	8	9	10	11	12	13	14
4	4	8	9	10	11	12	13	14
5	5	8	9	10	11	12	13	14
6	6	15	16	17	18	19	20	21
7	7	15	16	17	18	19	20	21
8	8	15	16	17	18	19	20	21
9	9	15	16	17	18	19	20	21
10	10	22	23	24	25	26	27	28
11	11	22	23	24	25	26	27	28
12	12	22	23	24	25	26	27	28
13	13	22	23	24	25	26	27	28
14	14	29	30	31	1	2	3	4
15	15	29	30	31	1	2	3	4
16	16	29	30	31	1	2	3	4
17	17	29	30	31	1	2	3	4
18	18	12	13	14	15	16	17	18
19	19	12	13	14	15	16	17	18
20	20	12	13	14	15	16	17	18
21	21	12	13	14	15	16	17	18
22	22	26	27	28	29	30	1	2
23	23	26	27	28	29	30	1	2
24	24	26	27	28	29	30	1	2
25	25	26	27	28	29	30	1	2
26	26	26	27	28	29	30	1	2
27	27	26	27	28	29	30	1	2
\.


--
-- Data for Name: work_shift_schedules; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.work_shift_schedules (id, user_id, comment, period_id, monday, monday_hours, tuesday, tuesday_hours, wednesday, wednesday_hours, thursday, thursday_hours, friday, friday_hours, saturday, saturday_hours, sunday, sunday_hours) FROM stdin;
2	2	\N	1	box wash	8	kill hens askainen	8	box wash	10	eggs box wash	10	eggs+	10	free	0	free	0
3	4	\N	1	HH dry clean	8	kill hens askainen	8	wash hh	8	wash hh	8	wash hh	8	free	0	free	0
5	5	\N	1	HH dry clean	8	kill hens askainen	8	wash hh	8	wash hh	8	Mi ready for chiks	8	free	0	free	0
1	3	\N	1	eggs+	8	?	8	eggs+	8	humpila vac	8	free	0	eggs	4	eggs	4
4	6	\N	1	HH dry clean	8	kill hens askainen	8	wash hh	10	wash hh	10	wash hh	10	free	0	free1	0
6	3	\N	2	eqqs loading	8	humpila	8		8		8	eggs shit	8		0		0
7	2	\N	2	box loading	8		8		8	tr laitila	8	free	0		4		4
8	4	\N	2	hh + loading	8	tr hirvijoka	8		8	tr hirvijoka	8	tr laitila	8		0		0
9	6	\N	2	hh + loading	8		8		8	tr laitila	8	tr laitila	8		0		0
10	4	\N	3	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	\N	LOMA	\N
11	2	\N	3	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	\N	LOMA	\N
12	6	\N	3		8		8		8		8		8		\N		\N
13	3	\N	3		8		8		8		8		\N		4		4
14	3	\N	4	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	8
15	4	\N	4	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	8	LOMA	8
16	2	\N	4	kill chiks	8	cleaning parvi and alakerta	8	cleaning parvi and alakerta	8	cleaning parvi and alakerta	8	cleaning parvi and alakerta	8	cleaning parvi and alakerta	8		0
17	6	\N	4	kill chiks	8	cleaning parvi and alakerta	8	cleaning parvi and alakerta	8	cleaning parvi and alakerta	8	cleaning parvi and alakerta	8	cleaning parvi and alakerta	8		0
18	3	\N	5	tr kokemäki	8	tr kokemäki	8	tr kokemäki	8	kokemäki 	\N		\N		\N		\N
19	4	\N	5	tr kokemäki	8	tr kokemäki	8	tr kokemäki	8	kokemäki 	\N		\N		\N		\N
20	6	\N	5	tr kokemäki	8	tr kokemäki	8	tr kokemäki	8	kokemäki 	8	kokemäki 	8		\N		\N
21	2	\N	5	kokemäki 	8	kokemäki 	8	kokemäki 	8	kokemäki 	8	kokemäki 	8		\N		\N
26	7	\N	6	kokemäki farm	8		\N	farm	8	humppila	8	farm	8		\N		\N
22	3	\N	6	farm	8	farm	8	farm	8	humppila	8	uk,hh,mi	6		\N		\N
25	6	\N	6	kokemäki	10	farm	8	farm	8	farm	8	työajan tasaus	0		\N		\N
27	2	\N	6	Kokemaki	8	Free	0	Farm	8	Free	8	Farm	8		\N		\N
24	4	\N	6	kokemäki	8	farm	8	Farm	8	farm	8	farm	8		\N		\N
\.


--
-- Name: eggs_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.eggs_collections_id_seq', 1, false);


--
-- Name: periods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.periods_id_seq', 6, true);


--
-- Name: rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.rules_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- Name: work_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.work_lists_id_seq', 67, true);


--
-- Name: work_shift_schedule_days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.work_shift_schedule_days_id_seq', 27, true);


--
-- Name: work_shift_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.work_shift_schedules_id_seq', 27, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: eggs_collections eggs_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.eggs_collections
    ADD CONSTRAINT eggs_collections_pkey PRIMARY KEY (id);


--
-- Name: periods periods_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);


--
-- Name: rules rules_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT rules_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: work_lists work_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.work_lists
    ADD CONSTRAINT work_lists_pkey PRIMARY KEY (id);


--
-- Name: work_shift_schedule_days work_shift_schedule_days_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.work_shift_schedule_days
    ADD CONSTRAINT work_shift_schedule_days_pkey PRIMARY KEY (id);


--
-- Name: work_shift_schedules work_shift_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.work_shift_schedules
    ADD CONSTRAINT work_shift_schedules_pkey PRIMARY KEY (id);


--
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: udga350s7ocpm3
--

GRANT USAGE ON SCHEMA heroku_ext TO hyfhpkuapmdkcl;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: hyfhpkuapmdkcl
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO hyfhpkuapmdkcl;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO hyfhpkuapmdkcl;


--
-- PostgreSQL database dump complete
--

