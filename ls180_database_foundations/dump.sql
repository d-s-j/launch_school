--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

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
-- Name: users; Type: TABLE; Schema: public; Owner: dylanjones
--

CREATE TABLE public.users (
    id integer NOT NULL,
    full_name character varying(25) NOT NULL,
    enabled boolean DEFAULT true,
    last_login timestamp without time zone DEFAULT now(),
    CONSTRAINT users_full_name_check CHECK (((full_name)::text <> ''::text))
);


ALTER TABLE public.users OWNER TO dylanjones;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dylanjones
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dylanjones;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dylanjones
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: dylanjones
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dylanjones
--

INSERT INTO public.users VALUES (1, 'John Smith', false, '2020-06-03 14:12:53.658314');
INSERT INTO public.users VALUES (4, 'O''Leary', false, '2020-06-05 12:08:11.369234');
INSERT INTO public.users VALUES (3, 'Harry Potter', true, '2020-06-03 15:15:06.689049');
INSERT INTO public.users VALUES (5, 'Jane Smith', true, '2020-06-08 12:49:07.867286');
INSERT INTO public.users VALUES (2, 'Alice Walker', true, '2020-06-03 15:15:06.689049');


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dylanjones
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: users users_id_key; Type: CONSTRAINT; Schema: public; Owner: dylanjones
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_id_key UNIQUE (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dylanjones
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

