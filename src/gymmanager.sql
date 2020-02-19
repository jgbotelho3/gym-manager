--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.2 (Ubuntu 12.2-1.pgdg18.04+1)

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

--
-- Name: instructors; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.instructors (
    id integer NOT NULL,
    avatar_url text,
    name text,
    birth timestamp without time zone,
    gender text,
    created_at timestamp without time zone,
    services text
);


--
-- Name: intructors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.intructors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intructors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.intructors_id_seq OWNED BY public.instructors.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.members (
    id integer NOT NULL,
    name text NOT NULL,
    avatar_url text,
    email text,
    gender text NOT NULL,
    birth timestamp without time zone,
    blood text,
    weight integer,
    height integer,
    instructor_id integer
);


--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: instructors id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instructors ALTER COLUMN id SET DEFAULT nextval('public.intructors_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Data for Name: instructors; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.instructors (id, avatar_url, name, birth, gender, created_at, services) FROM stdin;
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.members (id, name, avatar_url, email, gender, birth, blood, weight, height, instructor_id) FROM stdin;
\.


--
-- Name: intructors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.intructors_id_seq', 16, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.members_id_seq', 4, true);


--
-- Name: instructors intructors_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT intructors_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

