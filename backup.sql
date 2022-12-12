--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6 (Ubuntu 14.6-1.pgdg20.04+1)
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
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: uacrkr226u0brm
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO uacrkr226u0brm;

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
-- Name: count_chicks; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.count_chicks (
    id bigint NOT NULL,
    date_start timestamp(6) without time zone,
    date_end timestamp(6) without time zone,
    house character varying,
    chicks_start integer,
    kukko_start integer
);


ALTER TABLE public.count_chicks OWNER TO hyfhpkuapmdkcl;

--
-- Name: count_chicks_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.count_chicks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.count_chicks_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: count_chicks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.count_chicks_id_seq OWNED BY public.count_chicks.id;


--
-- Name: egg_collects; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.egg_collects (
    id bigint NOT NULL,
    day character varying,
    month character varying,
    year character varying,
    prima double precision DEFAULT 0.0,
    craggs double precision DEFAULT 0.0,
    big_small character varying DEFAULT '0+0'::character varying,
    comments character varying DEFAULT ''::character varying,
    flooreggs double precision DEFAULT 0.0,
    egg_width double precision DEFAULT 0.0,
    deads_chick double precision DEFAULT 0.0,
    deads_hen double precision DEFAULT 0.0,
    water_ml_day double precision DEFAULT 0.0,
    feed_g_day double precision DEFAULT 0.0,
    hen_width double precision DEFAULT 0.0,
    house character varying,
    period integer,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.egg_collects OWNER TO hyfhpkuapmdkcl;

--
-- Name: egg_collects_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.egg_collects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.egg_collects_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: egg_collects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.egg_collects_id_seq OWNED BY public.egg_collects.id;


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
-- Name: locations; Type: TABLE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying,
    link character varying
);


ALTER TABLE public.locations OWNER TO hyfhpkuapmdkcl;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: hyfhpkuapmdkcl
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO hyfhpkuapmdkcl;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


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
    washing_time character varying,
    free_day boolean DEFAULT false,
    vacation boolean DEFAULT false
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
-- Name: count_chicks id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.count_chicks ALTER COLUMN id SET DEFAULT nextval('public.count_chicks_id_seq'::regclass);


--
-- Name: egg_collects id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.egg_collects ALTER COLUMN id SET DEFAULT nextval('public.egg_collects_id_seq'::regclass);


--
-- Name: eggs_collections id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.eggs_collections ALTER COLUMN id SET DEFAULT nextval('public.eggs_collections_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


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
-- Data for Name: count_chicks; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.count_chicks (id, date_start, date_end, house, chicks_start, kukko_start) FROM stdin;
1	2022-12-04 00:00:00	2023-01-01 00:00:00	Uusikana	9054	672
\.


--
-- Data for Name: egg_collects; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.egg_collects (id, day, month, year, prima, craggs, big_small, comments, flooreggs, egg_width, deads_chick, deads_hen, water_ml_day, feed_g_day, hen_width, house, period, created_at) FROM stdin;
1	1	12	2022	7918	102	368+132	50-66 seula	0	58.75	0	0	183	121	0	Uusikana	1	2022-12-01 00:00:00
\.


--
-- Data for Name: eggs_collections; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.eggs_collections (id, user_id, years, month, day, lsl_prima, craggs, big_plus_small, floor_eggs, egg_weight, deads, water_ml_day, feed_g_day, hen_weight, check_nests, mark_1, mark_1_with_years, info_started) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.locations (id, name, link) FROM stdin;
1	Farm Rymättylä	https://goo.gl/maps/gcZo2z5zytAdWPtt6
2	Kajander Rauno Juhani	https://goo.gl/maps/xTNV8v2JmCfaprnTA
9	Seljänkulma 31500 Koski Tl	https://goo.gl/maps/Ap1vXEbzUddzF56o8
14	Askainen	https://goo.gl/maps/9opGdPwXXPU5AA2CA
15	Masku	https://goo.gl/maps/uB1vL578gY7wya3T8
17	Kökemäki	https://goo.gl/maps/ydnVFt4A2nCbRrei9
18	Mietoinen	https://goo.gl/maps/FzpFHhQx3z7NJuT59
16	Laitila	https://goo.gl/maps/B9f6BzH7aN8z8agG8
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
7	7	13	11	2022	45
8	14	20	11	2022	46
9	28	4	12	2022	48
10	5	11	12	2022	49
11	12	18	12	2022	50
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
8	8	t	t	t	t	t	t	t	t
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.schema_migrations (version) FROM stdin;
20220721152103
20220811191255
20220928172335
20221105185558
20221106183017
20221128193052
20221203185505
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
8	Sanna	Sanna@email.com			Qwerty1234			t
\.


--
-- Data for Name: work_lists; Type: TABLE DATA; Schema: public; Owner: hyfhpkuapmdkcl
--

COPY public.work_lists (id, user_id, years, month, day, work_start, work_stop, break_start, break_stop, hours, comment, work_start_minutes, work_stop_minutes, break_start_minutes, break_stop_minutes, hours_minutes, washing_time_minutes, washing_time, free_day, vacation) FROM stdin;
2	6	2022	8	1	06:00	16:00	00:00	00:00	10:00	transport HH- Mellila	360	960	0	0	600	\N	\N	f	f
3	6	2022	8	2	06:00	15:00	00:00	00:00	09:30	transport HH - Humpila, boxes work	360	900	0	0	570	\N	\N	f	f
4	6	2022	8	3	06:00	19:20	00:00	00:00	13:20	transport HH -> Mellila, load chiks	360	1160	0	0	800	\N	\N	f	f
5	6	2022	8	8	06:00	14:00	00:00	00:00	08:00	clean and washing room 3	360	840	0	0	480	\N	\N	f	f
6	6	2022	8	9	06:30	17:20	00:00	00:00	10:50	kill hens askainen	390	1040	0	0	650	\N	\N	f	f
7	6	2022	8	10	06:00	14:40	00:00	00:00	08:40	clean and washing room 1 to HH	360	880	0	0	520	\N	\N	f	f
8	6	2022	8	11	06:00	16:00	00:00	00:00	10:00	washing metals to HH	360	960	0	0	600	\N	\N	f	f
9	6	2022	8	12	06:00	16:40	00:00	00:00	10:40	Build room 1 2 3 	360	1000	0	0	640	\N	\N	f	f
10	6	2022	8	15	16:00	20:15	00:00	00:00	04:15	Load chiks	960	1215	0	0	255	\N	\N	f	f
11	6	2022	8	16	08:00	15:30	00:00	00:00	07:30	Washing boxes	480	930	0	0	450	\N	\N	f	f
12	6	2022	8	17	16:00	19:15	00:00	00:00	03:15	load chiks	960	1155	0	0	195	\N	\N	f	f
13	6	2022	8	18	05:00	15:35	00:00	00:00	10:35	Load chiks, clean room 1-2\r\n	300	935	0	0	635	\N	\N	f	f
14	6	2022	8	19	06:00	15:00	00:00	00:00	09:00	Clean box, load chiks	360	900	0	0	540	\N	\N	f	f
15	6	2022	8	22	08:00	16:00	00:00	00:00	08:00	washing boxes	480	960	0	0	480	\N	\N	f	f
16	6	2022	8	23	07:30	15:30	00:00	00:00	08:00	washing boxes and clean FH	450	930	0	0	480	\N	\N	f	f
17	6	2022	8	24	08:00	16:00	00:00	00:00	08:00	Washing boxes	480	960	0	0	480	\N	\N	f	f
18	6	2022	8	25	06:00	14:00	00:00	00:00	08:00	Washing room\r\n	360	840	0	0	480	\N	\N	f	f
19	6	2022	8	26	08:00	17:45	00:00	00:00	09:45	Washing fh\r\n	480	1065	0	0	585	\N	\N	f	f
20	6	2022	8	29	06:00	14:30	00:00	00:00	08:30	killing chiks 	360	870	0	0	510	\N	\N	f	f
21	6	2022	8	30	08:00	14:30	00:00	00:00	06:30	Clean parvi\r\n	480	870	0	0	390	\N	\N	f	f
22	6	2022	8	31	08:00	18:30	00:00	00:00	10:30	clean parvi	480	1110	0	0	630	\N	\N	f	f
23	6	2022	9	1	06:00	14:30	00:00	00:00	08:30	cleaning alakerta	360	870	0	0	510	\N	\N	f	f
25	6	2022	9	3	08:00	17:00	00:00	00:00	09:00	cleaning parvi and alakerta	480	1020	0	0	540	\N	\N	f	f
26	6	2022	9	5	06:00	15:00	00:00	00:00	09:00	transport Sastamala in Loimaa	360	900	0	0	540	\N	\N	f	f
27	6	2022	9	6	07:00	14:40	00:00	00:00	07:40	transport Sastamala in Loimaa	420	880	0	0	460	\N	\N	f	f
28	6	2022	9	7	07:00	17:00	00:00	00:00	10:00	Transport Sastamala in alastaro and Kokemäki	420	1020	0	0	600	\N	\N	f	f
31	6	2022	9	12	06:00	17:00	00:00	00:00	11:00	Load chiks huitinen	360	1020	0	0	660	\N	\N	f	f
32	6	2022	9	13	07:00	16:00	00:00	00:00	09:00	Load chiks huitinen\r\n	420	960	0	0	540	\N	\N	f	f
33	6	2022	9	14	07:30	17:00	00:00	00:00	09:30	Load chiks huitinen\r\n	450	1020	0	0	570	\N	\N	f	f
37	6	2022	9	15	00:00	00:00	00:00	00:00	00:00	HAMK 	0	0	0	0	0	\N	\N	f	f
30	6	2022	9	9	08:00	16:30	00:00	00:00	08:30	Washing fh(washing 8 hours)	480	990	0	0	510	480	08:00	f	f
42	6	2022	9	27	08:00	15:00	00:00	00:00	07:00	washing plastic for nests	480	900	0	0	420	\N	\N	f	f
43	6	2022	9	28	08:00	16:00	00:00	00:00	08:00	 Unload boxes, prepare yellow plastic for washing	480	960	0	0	480	\N	\N	f	f
24	6	2022	9	2	08:00	16:30	00:00	00:00	08:30	cleaning parvi	480	990	0	0	510	\N	\N	f	f
34	6	2022	9	20	08:00	19:00	00:00	00:00	11:00	washing Kokemäki(washing 10:30 hours)	480	1140	0	0	660	630	10:30	f	f
39	6	2022	9	21	08:00	19:00	00:00	00:00	11:00	washing Kokemäki(washing 7:30 hours)	480	1140	0	0	660	450	07:30	f	f
44	6	2022	9	29	08:00	14:30	00:00	00:00	06:30	Washing yellow plastic\r\n	480	870	0	0	390	390	06:30	f	f
36	6	2022	9	16	08:00	16:30	00:00	00:00	08:30	washing boxes(washing 7 hours)	480	990	0	0	510	420	07:00	f	f
29	6	2022	9	8	08:00	16:30	00:00	00:00	08:30	washing fh(washing 7 hours)	480	990	0	0	510	420	07:00	f	f
41	6	2022	9	26	06:00	19:30	00:00	00:00	13:30	collect Kökemäki	360	1170	0	0	810	\N	\N	f	f
40	6	2022	9	23	06:00	13:20	00:00	00:00	07:20	Transport Laitila - Mynämäki	360	800	0	0	440	\N	\N	f	f
38	6	2022	9	22	06:00	13:50	00:00	00:00	07:50	transport Laitila - Mynämäki	360	830	0	0	470	\N	\N	f	f
35	6	2022	9	19	06:00	18:00	00:00	00:00	12:00	washing Kokemäki(washing 8 hours)	360	1080	0	0	720	480	08:00	f	f
45	6	2022	10	3	08:00	16:30	00:00	00:00	08:30	washing instruments and egg room alakerta	480	990	0	0	510	300	05:00	f	f
46	6	2022	10	4	14:00	22:30	00:00	00:00	08:30	washing parvi	840	1350	0	0	510	420	07:00	f	f
47	6	2022	10	5	09:00	16:00	00:00	00:00	07:00	paint	540	960	0	0	420	0	00:00	f	f
48	6	2022	10	6	08:00	16:00	00:00	00:00	08:00	paint	480	960	0	0	480	0	00:00	f	f
49	6	2022	10	7	05:00	14:30	00:00	00:00	09:30	humpila	300	870	0	0	570	0	00:00	f	f
50	6	2022	10	9	00:00	00:00	00:00	00:00	00:00		0	0	0	0	0	0	00:00	f	f
1	1	2022	2	1	00:00	00:00	00:00	00:00	00:00	123dqsd	0	0	0	0	0	0	00:00	f	f
51	6	2022	10	10	09:00	17:00	00:00	00:00	08:00	Paint house\r\n	540	1020	0	0	480	0	00:00	f	f
52	6	2022	10	12	09:00	17:30	00:00	00:00	08:30	 Paint house\r\n	540	1050	0	0	510	0	00:00	f	f
54	6	2022	10	11	08:00	15:00	00:00	00:00	07:00	extra work	480	900	0	0	420	0	00:00	f	f
53	6	2022	10	13	08:00	16:00	00:00	00:00	08:00	parvi alakerta finish work	480	960	0	0	480	0	00:00	f	f
56	2	2022	10	1	08:00	16:00	00:00	00:00	08:00	Collect eggs	480	960	0	0	480	0	00:00	f	f
57	2	2022	10	3	08:00	13:00	00:00	00:00	05:00	Collect chicken 	480	780	0	0	300	360	06:00	f	f
58	6	2022	10	19	09:00	17:30	00:00	00:00	08:30	washing trailer	540	1050	0	0	510	420	07:00	f	f
55	6	2022	10	18	09:00	17:00	00:00	00:00	08:00	assembling the structure in fh	540	1020	0	0	480	0	00:00	f	f
59	6	2022	10	20	08:00	16:30	00:00	00:00	08:30	wood work, oil work for tailer	480	990	0	0	510	0	00:00	f	f
60	6	2022	10	21	08:00	16:30	00:00	00:00	08:30	oil work for trailer, welning work(4 hours),work with leaves\r\n	480	990	0	0	510	0	00:00	f	f
61	6	2022	10	24	06:00	16:15	00:00	00:00	10:15	Load Huitinen chinks and unload  Askainen chiks	360	975	0	0	615	0	00:00	f	f
62	6	2022	10	25	06:00	16:15	00:00	00:00	10:15	Load Huitinen chinks and unload  Askainen chiks	360	975	0	0	615	0	00:00	f	f
75	3	2022	11	1	08:00	15:30	00:00	00:00	07:30	Check FH, HH, Mietoinen, collect eggs, metal work in FH , cheking houses (evening time) 	480	930	0	0	450	0	00:00	f	f
64	6	2022	10	28	07:00	14:00	00:00	00:00	07:00	Load chiks masku	420	840	0	0	420	0	00:00	f	f
63	6	2022	10	27	07:00	14:00	00:00	00:00	07:00	Load chiks masku	420	840	0	0	420	0	00:00	f	f
66	6	2022	11	2	07:00	16:30	00:00	00:00	09:30	load chiks in Masku(prepearing for Niko boxes washing )	420	990	0	0	570	0	00:00	f	f
65	6	2022	11	1	00:00	00:00	00:00	00:00	00:00		0	0	0	0	0	0	00:00	f	f
68	1	2022	2	6	00:00	00:00	00:00	00:00	00:00		0	0	0	0	0	0	00:00	f	f
69	6	2022	11	3	12:00	21:00	00:00	00:00	09:00	unload and washing trucks and boxes	720	1260	0	0	540	360	06:00	f	f
70	2	2022	11	2	16:00	18:00	00:00	00:00	02:00	Transport Rymättylä - Nousiainen - Rymättylä 	960	1080	0	0	120	0	00:00	f	f
71	2	2022	11	3	08:00	12:30	00:00	00:00	04:30	Fh, metal up, hh, collect eggs. 	480	750	0	0	270	0	00:00	f	f
73	6	2022	11	4	07:00	16:00	00:00	00:00	09:00	unload boxes, washing volvo, washing boxes, clean area	420	960	0	0	540	480	08:00	f	f
84	3	2022	11	7	08:00	16:00	00:00	00:00	08:00	Fh, HH, collect eggs, shits away UK, cleaning floor in.HH room1, farm work 	480	960	0	0	480	0	00:00	f	f
78	3	2022	11	4	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
85	6	2022	11	8	06:00	14:50	00:00	00:00	08:50	Tr Yläne to Aslaonen tr	360	890	0	0	530	0	00:00	f	f
86	6	2022	11	10	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
87	2	2022	11	8	06:00	14:00	00:00	00:00	08:00	Transport Yläne -> Askainen	360	840	0	0	480	0	00:00	f	f
77	3	2022	11	3	05:00	15:00	00:00	00:00	10:00	Vaccination in Humppila	300	900	0	0	600	0	00:00	f	f
76	3	2022	11	2	08:00	14:30	00:00	00:00	06:30	Check FH, HH, Mietoinen, collect eggs , cheking houses (evening time) 	480	870	0	0	390	0	00:00	f	f
74	3	2022	11	5	08:00	14:30	00:00	00:00	06:30	Check FH, HH, Mietoinen, collect eggs, cheking houses (evening time) \r\n	480	870	0	0	390	0	00:00	f	f
72	2	2022	11	4	08:00	16:00	15:30	00:00	08:00	Fh, hh, Mietoinen, collect eggs, shits away uk, evening checks. 	480	960	930	0	480	0	00:00	f	f
79	3	2022	11	6	08:00	14:00	00:00	00:00	06:00	Check FH, HH, Mietoinen, collect eggs , cheking houses (evening time) 	480	840	0	0	360	0	00:00	f	f
81	2	2022	11	5	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
82	2	2022	11	6	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
80	2	2022	11	7	06:00	17:30	00:00	00:00	11:30	Transport Yläne, house to house	360	1050	0	0	690	0	00:00	f	f
83	6	2022	11	7	06:00	17:30	00:00	00:00	11:30	Tr Yläne, house to house	360	1050	0	0	690	0	00:00	f	f
67	2	2022	11	1	08:00	15:15	00:00	00:00	07:15	Hh, collect eggs, cleaning uk, transport dead chickens away, poison work. Collect chicken Masku (1,5 h).	480	915	0	0	435	0	00:00	f	f
89	2	2022	11	9	08:00	13:00	00:00	00:00	05:00	Transport Masku -> Askainen	480	780	0	0	300	0	00:00	f	f
88	3	2022	11	8	08:00	14:00	00:00	00:00	06:00	Check Fh,HH, collect eggs (seula to kenno) farm work 	480	840	0	0	360	0	00:00	f	f
90	3	2022	11	9	08:00	16:00	00:00	00:00	08:00	Check fh, HH,collect eggs, cleaning Silo 5,6 silo-work"	480	960	0	0	480	0	00:00	f	f
91	2	2022	11	10	08:00	16:00	00:00	00:00	08:00	Hh, collect eggs, cleaning uk, poison work, asphalt cleaning	480	960	0	0	480	0	00:00	f	f
92	6	2022	11	9	07:00	14:30	00:00	00:00	07:30	tr Masku => Askainen	420	870	0	0	450	0	00:00	f	f
94	6	2022	11	11	07:00	16:15	00:00	00:00	09:15	work to second farm 	420	975	0	0	555	0	00:00	f	f
95	3	2022	11	11	08:00	15:30	00:00	00:00	07:30	Cheking FH, collect eggs,cleaning roofs , Al/Pr-rehu-works, boxes work 	480	930	0	0	450	0	00:00	f	f
93	3	2022	11	10	05:00	17:00	00:00	00:00	12:00	vaccination in Humppila	300	1020	0	0	720	0	00:00	f	f
96	2	2022	11	11	08:00	15:30	00:00	00:00	07:30	Hh, shits away uk, räystaskouru work	480	930	0	0	450	0	00:00	f	f
97	2	2022	11	12	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
98	2	2022	11	13	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
100	6	2022	11	14	07:00	15:00	00:00	00:00	08:00	tr laitila -> parvi	420	900	0	0	480	0	00:00	f	f
101	6	2022	11	15	07:00	14:15	00:00	00:00	07:15	tr laitila -> alakerta	420	855	0	0	435	0	00:00	f	f
102	2	2022	11	15	07:00	16:00	00:00	00:00	09:00	Checking Mietoinen, hh, put food to room2 hh, collect eggs, leaves work 	420	960	0	0	540	0	00:00	f	f
103	1	2022	2	15	00:00	00:00	00:00	00:00	00:00		0	0	0	0	0	0	00:00	f	f
104	1	2022	2	17	00:00	00:00	00:00	00:00	00:00		0	0	0	0	0	0	00:00	f	f
105	6	2022	11	16	07:00	15:00	00:00	00:00	08:00	tr laitila -> alakerta	420	900	0	0	480	0	00:00	f	f
106	3	2022	11	15	05:00	17:00	00:00	00:00	12:00	Vaccination in Humppila	300	1020	0	0	720	0	00:00	f	f
107	3	2022	11	16	07:00	15:00	00:00	00:00	08:00	tr. Laitila-Al/Pr., Mietoinen metal works 	420	900	0	0	480	0	00:00	f	f
108	3	2022	11	14	08:00	15:30	00:00	00:00	07:30	FH, HH, collect eggs, shits away (UK), HH works 	480	930	0	0	450	0	00:00	f	f
109	2	2022	11	16	08:00	16:30	00:00	00:00	08:30	Fh: put metal and foodlines up, put away yellow plastic, collect eggs, cleaning, cleaning waterroads.	480	990	0	0	510	0	00:00	f	f
99	2	2022	11	14	07:00	15:10	00:00	00:00	08:10	Transport Laitila -> Parvi	420	910	0	0	490	0	00:00	f	f
111	6	2022	11	18	06:00	18:00	00:00	00:00	12:00	Washing room 4 snd asfalts	360	1080	0	0	720	600	10:00	f	f
113	2	2022	11	18	08:00	16:00	00:00	00:00	08:00	Fh, hh, ap, collect eggs, shits away uk, cleaning uk, tractor work	480	960	0	0	480	0	00:00	f	f
112	2	2022	11	17	08:00	16:00	00:00	00:00	08:00	Fh, hh, Alakerta puru work and install shocker, collect eggs, shits work uk, rattpoison, wood away fh old puru place.	480	960	0	0	480	0	00:00	f	f
114	3	2022	11	17	05:00	16:00	00:00	00:00	11:00	vaccination in Humppila	300	960	0	0	660	0	00:00	f	f
115	3	2022	11	19	08:00	14:00	00:00	00:00	06:00	FH, HH, collect eggs, Al, cleaning floor HH room 3	480	840	0	0	360	0	00:00	f	f
116	3	2022	11	20	08:00	12:00	00:00	00:00	04:00	Fh, HH  collect eggs, Al 	480	720	0	0	240	0	00:00	f	f
117	3	2022	11	12	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
118	3	2022	11	18	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
119	3	2022	11	22	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
120	3	2022	11	21	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
121	3	2022	11	13	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
122	6	2022	11	21	07:30	19:50	00:00	00:00	12:20	Washing room 3	450	1190	0	0	740	600	10:00	f	f
110	6	2022	11	17	07:00	18:15	00:00	00:00	11:15	Washing Masku house, room 4	420	1095	0	0	675	480	08:00	f	f
124	2	2022	11	21	08:00	16:30	00:00	00:00	08:30	Fh, hh, collect eggs, shits away uk/ap	480	990	0	0	510	0	00:00	f	f
125	2	2022	11	19	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
126	2	2022	11	20	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
127	2	2022	11	22	08:00	16:00	00:00	00:00	08:00	Fh, hh, fixing work hh, Mietoinen, collect eggs, AP.	480	960	0	0	480	0	00:00	f	f
129	3	2022	11	23	07:00	14:00	00:00	00:00	07:00	Masku, Mietoinen, Chening FH, HH, collect eggs, Al/Pr works 	420	840	0	0	420	0	00:00	f	f
131	3	2022	11	24	05:00	16:00	00:00	00:00	11:00	vaccination in Humppila	300	960	0	0	660	0	00:00	f	f
123	6	2022	11	22	07:30	18:30	00:00	00:00	11:00	Washing room4 finish	450	1110	0	0	660	540	09:00	f	f
130	6	2022	11	23	07:00	17:15	00:00	00:00	10:15	Finish washing masku	420	1035	0	0	615	540	09:00	f	f
128	2	2022	11	23	17:20	18:50	00:00	00:00	01:30	Mietoinen work	1040	1130	0	0	90	0	00:00	f	f
132	2	2022	11	24	08:00	14:30	00:00	00:00	06:30	Check Mietoinen, collect eggs, cleaning uk, check AP.	480	870	0	0	390	0	00:00	f	f
133	2	2022	11	25	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
134	3	2022	11	25	08:00	15:00	00:00	00:00	07:00	FH, HH, collect eggs, shits away UK/Al/Pr 	480	900	0	0	420	0	00:00	f	f
135	6	2022	11	24	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
136	6	2022	11	25	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
137	6	2022	11	26	08:00	14:45	00:00	00:00	06:45	Washing outside well and ventilation masku 	480	885	0	0	405	300	05:00	f	f
138	3	2022	11	26	08:00	12:30	00:00	00:00	04:30	FH, HH, collect eggs, Al/Pr. Parvi spiral-work	480	750	0	0	270	0	00:00	f	f
139	6	2022	11	28	07:00	16:00	00:00	00:00	09:00	Tr hh -> Pertteli and vaccination 	420	960	0	0	540	0	00:00	f	f
140	2	2022	11	26	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
141	2	2022	11	27	08:00	12:30	00:00	00:00	04:30	Checking fh, hh, ap, uk. Collecting eggs.	480	750	0	0	270	0	00:00	f	f
142	2	2022	11	28	07:00	16:15	00:00	00:00	09:15	Uploading chicken hh. Checking hh, ap, uk. Collect eggs. Shits away uk, ap.	420	975	0	0	555	0	00:00	f	f
144	2	2022	11	29	07:00	17:40	00:00	00:00	10:40	Transport Hh -> Terttilä, box work	420	1060	0	0	640	0	00:00	f	f
145	3	2022	11	28	07:00	16:00	00:00	00:00	09:00	transport HH - Pertteli (vaccination)	420	960	0	0	540	0	00:00	f	f
146	3	2022	11	29	07:00	15:00	00:00	00:00	08:00	collect chicks HH, collect eggs, FH, Al/Pr	420	900	0	0	480	0	00:00	f	f
147	6	2022	11	30	07:00	14:20	00:00	00:00	07:20	tr hh -> laitila	420	860	0	0	440	0	00:00	f	f
143	6	2022	11	29	07:00	17:30	00:00	00:00	10:30	Transport Hh -> Terttilä	420	1050	0	0	630	0	00:00	f	f
148	2	2022	11	30	07:00	15:30	00:00	00:00	08:30	Upload chicken hh. Checking hh, ap, uk, collect eggs, cleaning ap, fh mixing puru.	420	930	0	0	510	0	00:00	f	f
149	3	2022	11	30	05:00	16:30	00:00	00:00	11:30	vaccination in Humppila	300	990	0	0	690	0	00:00	f	f
150	6	2022	12	1	07:00	15:50	00:00	00:00	08:50	Tr hh -> laitila	420	950	0	0	530	0	00:00	f	f
151	2	2022	12	1	06:30	14:30	00:00	00:00	08:00	Metal work hh, collect chicken hh, cleaning corridor area hh, collect eggs, shit work uk, cleaning uk, check ap.	390	870	0	0	480	0	00:00	f	f
152	3	2022	12	1	05:00	16:00	00:00	00:00	11:00	vaccination in Humppila	300	960	0	0	660	0	00:00	f	f
153	3	2022	12	2	08:00	16:00	00:00	00:00	08:00	FH, HH, collect eggs, shits away UK/Al/Pr, metall works in HH.	480	960	0	0	480	0	00:00	f	f
154	6	2022	12	2	06:00	16:30	00:00	00:00	10:30	tr Mietoinen-> Lieto	360	990	0	0	630	0	00:00	f	f
155	2	2022	12	2	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
209	3	2022	12	12	08:00	16:00	00:00	00:00	08:00	FH cleaning floor /metal works, collect eggs, shits away UK/Al/Pr	480	960	0	0	480	0	00:00	f	f
156	2	2022	12	3	08:00	16:00	00:00	00:00	08:00	Fh, hh, uk, ap (+ extra time loading chicks Mietoinen). Mixing puru mh, ph.	480	960	0	0	480	0	00:00	f	f
188	2	2022	12	4	08:00	12:00	00:00	00:00	04:00	Fh, hh, collect eggs uk, ap.	480	720	0	0	240	0	00:00	f	f
189	6	2022	12	6	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
190	6	2022	12	5	07:00	15:15	00:00	00:00	08:15	tr mietoinen -> Lieto	420	915	0	0	495	0	00:00	f	f
191	3	2022	12	5	07:00	15:00	00:00	00:00	08:00	loading chicks in Mietoinen, Mietoinen works, collect eggs, shits away UK 	420	900	0	0	480	0	00:00	f	f
193	3	2022	12	7	06:00	15:30	00:00	00:00	09:30	loading chicks in Mietoinen, Mietoinen works, FH, collect eggs, shits away UK/Al/Pr. 	360	930	0	0	570	0	00:00	f	f
192	6	2022	12	7	06:00	15:00	00:00	00:00	09:00	load chiks mietoinen and cleaning metal	360	900	0	0	540	0	00:00	f	f
194	6	2022	12	8	07:00	15:40	00:00	00:00	08:40	Tr hh -> Kokemäki	420	940	0	0	520	0	00:00	f	f
195	3	2022	12	8	07:00	15:00	00:00	00:00	08:00	loading chicks in HH, collect eggs, Al/Pr works, FH + FH metall works	420	900	0	0	480	0	00:00	f	f
196	6	2022	12	9	07:00	18:00	00:00	00:00	11:00	load hh and washing hh room1	420	1080	0	0	660	300	05:00	f	f
197	3	2022	12	9	07:00	17:00	00:00	00:00	10:00	loading chicks HH, HH-works, FH, collect eggs, shits away UK/Al/Pr.	420	1020	0	0	600	0	00:00	f	f
198	2	2022	12	6	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
199	2	2022	12	9	07:00	19:00	00:00	00:00	12:00	Uploading chicken hh, shits away hh.	420	1140	0	0	720	0	00:00	f	f
200	2	2022	12	8	07:00	19:00	00:00	00:00	12:00	Uploading chicken hh, shits away hh.	420	1140	0	0	720	0	00:00	f	f
201	2	2022	12	7	06:00	12:15	00:00	00:00	06:15	Uploading chicken Mietoinen (6:00-8:15).\r\nCollect metal Mietoinen (11:00-15:00)	360	735	0	0	375	0	00:00	f	f
202	2	2022	12	5	07:00	15:00	00:00	00:00	08:00	Uploading chicken Mietoinen, shits away ap.	420	900	0	0	480	0	00:00	f	f
203	6	2022	12	10	06:00	16:45	00:00	00:00	10:45	Finish washing first room	360	1005	0	0	645	600	10:00	f	f
204	3	2022	12	10	08:00	14:30	00:00	00:00	06:30	FH, collect eggs, Al/Pr, cleaning HH room 3	480	870	0	0	390	0	00:00	f	f
205	2	2022	12	10	14:00	22:00	00:00	00:00	08:00	Shits away hh room 3. Washing hh room 2.	840	1320	0	0	480	300	05:00	f	f
206	2	2022	12	11	00:00	00:00	00:00	00:00	00:00	Free day	0	0	0	0	0	0	00:00	t	f
207	6	2022	12	12	06:00	15:00	00:00	00:00	09:00	washing hh room 2 75%	360	900	0	0	540	0	00:00	f	f
208	2	2022	12	12	06:00	16:40	00:00	00:00	10:40	Transport Sastamala-> Mynämäki 	360	1000	0	0	640	0	00:00	f	f
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
28	28	7	8	9	10	11	12	13
29	29	7	8	9	10	11	12	13
30	30	7	8	9	10	11	12	13
31	31	7	8	9	10	11	12	13
32	32	7	8	9	10	11	12	13
33	33	7	8	9	10	11	12	13
34	34	14	15	16	17	18	19	20
35	35	14	15	16	17	18	19	20
36	36	14	15	16	17	18	19	20
37	37	14	15	16	17	18	19	20
38	38	14	15	16	17	18	19	20
39	39	14	15	16	17	18	19	20
40	40	28	29	30	1	2	3	4
41	41	28	29	30	1	2	3	4
42	42	28	29	30	1	2	3	4
43	43	28	29	30	1	2	3	4
44	44	5	6	7	8	9	10	11
45	45	5	6	7	8	9	10	11
46	46	5	6	7	8	9	10	11
47	47	5	6	7	8	9	10	11
48	48	5	6	7	8	9	10	11
49	49	5	6	7	8	9	10	11
50	50	5	6	7	8	9	10	11
51	51	5	6	7	8	9	10	11
52	52	12	13	14	15	16	17	18
53	53	12	13	14	15	16	17	18
54	54	12	13	14	15	16	17	18
55	55	12	13	14	15	16	17	18
56	56	12	13	14	15	16	17	18
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
29	2	\N	7	tr	10	farm	10	farm	6	free	0	farm	8	farm	4	farm	4
30	4	\N	7	tr	8	tr	8	tr	8	farm	8	tr	8	free	0	free	0
31	6	\N	7	tr	10	tr	10	tr	8	free	0	tr	10	free	0	free	0
32	7	\N	7	tr	\N	tr	\N	farm	\N	farm	\N	tr	\N	farm	\N	free	\N
28	3	\N	7	farm	6	farm	8	tr	8	farm	8	tr	8	free	\N	free	\N
34	6	\N	8	tr laitila	8	tr laitila	8	tr laitila	8	washing Maku house	8	washing Maku house	8		\N		\N
35	2	\N	8	tr laitila	8	tr laitila	8	farm	8	farm	8	farm	8		\N		\N
36	4	\N	8	tr laitila	8	tr laitila	8	tr laitila	8	farm	8	farm	8		\N		\N
43	2	\N	9	farm	8	tr	10	fh hh uk ap	8	fh hh uk ap	8	free	0	farm	6	farm	6
39	7	\N	8	free	0	tr laitila	8	tr laitila	8	farm	8	farm	8		\N		\N
38	3	\N	8	farm	8	farm	8	farm	8	farm	8	Free	\N	farm	8	Farm	8
41	4	\N	9	tr	8	tr	8	tr	8	tr	8	tr	8		\N		\N
42	3	\N	9	tr	8	farm	8	humpila	8	humpila	8	farm	8		\N		\N
40	6	\N	9	tr	10	tr	10	tr	10	tr	10	tr	10		\N		\N
44	3	\N	10	tr	8	free	\N	farm	8	tr	8	tr	8		\N		\N
47	4	\N	10	farm	8	free	\N	mi+hh	8	tr	8	tr	8		\N		\N
49	2	\N	10	farm	8	free	\N	free	\N	fatm	8	farm	8		6		6
50	6	\N	10	tr	9	free	\N	mi metals	8	tr	10	tr	10		\N		\N
51	7	\N	10	tr	9	free	\N		8	tr	10	tr	10		\N		\N
52	6	\N	11	washing hh	10	washing hh	10	washing hh	10	washing hh	10	washing hh	10	washing hh	10		\N
53	3	\N	11	egg+wash	8	egg+wash	8	tr	8	egg+wash	8	farm	8	farm	8		\N
54	2	\N	11	tr	10	tr	10	farm	6	tr	10	free	0	farm	6	farm	6
56	7	\N	11	tr	10	tr	10	tr	10	tr	10	washing	10	washing	10		\N
55	4	\N	11	tr	8	tr	8	tr	8	tr	8	free	0	washing	8		\N
\.


--
-- Name: count_chicks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.count_chicks_id_seq', 1, true);


--
-- Name: egg_collects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.egg_collects_id_seq', 36, true);


--
-- Name: eggs_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.eggs_collections_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.locations_id_seq', 18, true);


--
-- Name: periods_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.periods_id_seq', 11, true);


--
-- Name: rules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.rules_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: work_lists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.work_lists_id_seq', 209, true);


--
-- Name: work_shift_schedule_days_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.work_shift_schedule_days_id_seq', 56, true);


--
-- Name: work_shift_schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hyfhpkuapmdkcl
--

SELECT pg_catalog.setval('public.work_shift_schedules_id_seq', 56, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: count_chicks count_chicks_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.count_chicks
    ADD CONSTRAINT count_chicks_pkey PRIMARY KEY (id);


--
-- Name: egg_collects egg_collects_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.egg_collects
    ADD CONSTRAINT egg_collects_pkey PRIMARY KEY (id);


--
-- Name: eggs_collections eggs_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.eggs_collections
    ADD CONSTRAINT eggs_collections_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: hyfhpkuapmdkcl
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


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
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: uacrkr226u0brm
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

