--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Postgres.app)
-- Dumped by pg_dump version 16.4 (Postgres.app)

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
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    englishtext character varying(100),
    igbotext character varying(100)
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questions_id_seq OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (id, englishtext, igbotext) FROM stdin;
1	9	itoolu
2	10	iri
3	20	Iri abụọ
4	100	otu nari
5	20	nari abụọ
6	999	nari itoolu na iri itoolu na itoolu
7	15	iri na ise
8	1	otu
9	2	abụọ
10	3	atọ
11	4	anọ
12	5	ise
13	6	isii
14	7	asaa
15	8	asatọ
16	head	isi
18	hair	ntutu (isi)
19	face	ihu
20	good face	ihu oma
21	eye(s)	anya
22	eyebrow(s)	nku anya
23	arc/wing	nku
24	nose	imi
25	ear	ntị
26	mouth	ọnụ
27	lips	egbugbere ọnụ
155	teeth	eze
28	cheek	nti
29	neck	olu
30	shoulder	ubu (aka)
31	chest	obi
32	hat	obi
33	hat of the father	obi nna
34	breast	ara
35	armpit	ab_
36	hand(s)	aka
37	fingers	mkpịsị aka
38	finger nail(s)	mbọ aka
39	stomach	afọ
40	navel	otube
41	leg(s)	ụkwụ
42	toe(s)	mkpịsị ụkwụ
43	toenail(s)	mbọ ụkwụ
44	foot (feet)	ọba ụkwụ
45	knee(s)	ikpere
46	butt	ike
47	tongue	ire
48	my head	isi m
49	my left hand	aka ekpe m
50	my right hand	aka nri m
52	food	nri
53	clothes	akwa
54	come	b_a
55	wait	chere
56	god	chi
249	thank you	daalụ
57	dress	efe
58	what	gịnị
51	forgive	gbaghara
59	pour	gbanye
60	war	agha
61	tell me	gwa m
62	leave me	hapụ m
63	them	ha
64	walk	ije
65	cup	iko
66	desert	ịkpa
67	play	ịkpa
68	ask	jụọ
69	how are you?	kedu
70	like	ka
71	bag	akpa
72	star	kpakpando
73	word	okwu
74	cup of water	iko mmiri
75	ask a question	jụọ ajụjụ
76	ask me a question	jụọ m ajụjụ
77	ask them a question	jụọ ha ajụjụ
78	you are like your mother	ị dị ka nne gi
79	your mother	nne gi
80	look at me	lee m anya
81	rub cream	tee ude
82	beg me	yọọ m
83	avoid me	zee m
84	speak	kwuo
85	talk to me	gwa m okwu
86	look	lee
87	a drink	mmanya
88	water	mmiri
89	me	m
90	mother	nne
91	father	nna
92	happiness	aṅụrị
93	monkey	enwe
94	give	nye
95	orange	oroma
96	what is it?	o gịnị
97	leave	pụọ
98	eat	rie
99	cook	sie
100	rub	tee
101	cream	ude
102	world	ụwa
103	comb	mvọ
104	take	were
105	beg	yọọ
106	avoid	zee
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_id_seq', 1, false);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

