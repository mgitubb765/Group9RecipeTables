--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-20 14:42:14

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
-- TOC entry 222 (class 1259 OID 16582)
-- Name: dish_ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dish_ingredients (
    ingredient_id integer NOT NULL,
    dish_id integer,
    ingredient_name character varying(255) NOT NULL,
    quantity character varying(50),
    unit character varying(50)
);


ALTER TABLE public.dish_ingredients OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16581)
-- Name: dish_ingredients_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dish_ingredients_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dish_ingredients_ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 4900 (class 0 OID 0)
-- Dependencies: 221
-- Name: dish_ingredients_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dish_ingredients_ingredient_id_seq OWNED BY public.dish_ingredients.ingredient_id;


--
-- TOC entry 224 (class 1259 OID 16594)
-- Name: dish_steps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dish_steps (
    step_id integer NOT NULL,
    dish_id integer,
    step_order integer NOT NULL,
    step_description text NOT NULL,
    estimated_time_minutes integer
);


ALTER TABLE public.dish_steps OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16593)
-- Name: dish_steps_step_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dish_steps_step_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dish_steps_step_id_seq OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 0)
-- Dependencies: 223
-- Name: dish_steps_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dish_steps_step_id_seq OWNED BY public.dish_steps.step_id;


--
-- TOC entry 218 (class 1259 OID 16474)
-- Name: dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes (
    dish_id integer NOT NULL,
    dish_name character varying(255) NOT NULL,
    description text,
    image_url character varying(255),
    created_at date DEFAULT CURRENT_DATE,
    updated_at date DEFAULT CURRENT_DATE
);


ALTER TABLE public.dishes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16473)
-- Name: dishes_dish_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dishes_dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dishes_dish_id_seq OWNER TO postgres;

--
-- TOC entry 4902 (class 0 OID 0)
-- Dependencies: 217
-- Name: dishes_dish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dishes_dish_id_seq OWNED BY public.dishes.dish_id;


--
-- TOC entry 220 (class 1259 OID 16486)
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients (
    ingredient_id integer NOT NULL,
    dish_id integer,
    ingredient_name character varying(255) NOT NULL,
    quantity character varying(50),
    unit character varying(50)
);


ALTER TABLE public.ingredients OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16485)
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredients_ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ingredients_ingredient_id_seq OWNER TO postgres;

--
-- TOC entry 4903 (class 0 OID 0)
-- Dependencies: 219
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredients_ingredient_id_seq OWNED BY public.ingredients.ingredient_id;


--
-- TOC entry 226 (class 1259 OID 16610)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255) NOT NULL,
    password_hash text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16609)
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
-- TOC entry 4904 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4719 (class 2604 OID 16585)
-- Name: dish_ingredients ingredient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish_ingredients ALTER COLUMN ingredient_id SET DEFAULT nextval('public.dish_ingredients_ingredient_id_seq'::regclass);


--
-- TOC entry 4720 (class 2604 OID 16597)
-- Name: dish_steps step_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish_steps ALTER COLUMN step_id SET DEFAULT nextval('public.dish_steps_step_id_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 16477)
-- Name: dishes dish_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes ALTER COLUMN dish_id SET DEFAULT nextval('public.dishes_dish_id_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 16489)
-- Name: ingredients ingredient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN ingredient_id SET DEFAULT nextval('public.ingredients_ingredient_id_seq'::regclass);


--
-- TOC entry 4721 (class 2604 OID 16613)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4890 (class 0 OID 16582)
-- Dependencies: 222
-- Data for Name: dish_ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dish_ingredients (ingredient_id, dish_id, ingredient_name, quantity, unit) FROM stdin;
\.


--
-- TOC entry 4892 (class 0 OID 16594)
-- Dependencies: 224
-- Data for Name: dish_steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dish_steps (step_id, dish_id, step_order, step_description, estimated_time_minutes) FROM stdin;
\.


--
-- TOC entry 4886 (class 0 OID 16474)
-- Dependencies: 218
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dishes (dish_id, dish_name, description, image_url, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4888 (class 0 OID 16486)
-- Dependencies: 220
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (ingredient_id, dish_id, ingredient_name, quantity, unit) FROM stdin;
\.


--
-- TOC entry 4894 (class 0 OID 16610)
-- Dependencies: 226
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password_hash, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4905 (class 0 OID 0)
-- Dependencies: 221
-- Name: dish_ingredients_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dish_ingredients_ingredient_id_seq', 1, false);


--
-- TOC entry 4906 (class 0 OID 0)
-- Dependencies: 223
-- Name: dish_steps_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dish_steps_step_id_seq', 1, false);


--
-- TOC entry 4907 (class 0 OID 0)
-- Dependencies: 217
-- Name: dishes_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dishes_dish_id_seq', 1, false);


--
-- TOC entry 4908 (class 0 OID 0)
-- Dependencies: 219
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_ingredient_id_seq', 1, false);


--
-- TOC entry 4909 (class 0 OID 0)
-- Dependencies: 225
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- TOC entry 4730 (class 2606 OID 16587)
-- Name: dish_ingredients dish_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish_ingredients
    ADD CONSTRAINT dish_ingredients_pkey PRIMARY KEY (ingredient_id);


--
-- TOC entry 4732 (class 2606 OID 16601)
-- Name: dish_steps dish_steps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish_steps
    ADD CONSTRAINT dish_steps_pkey PRIMARY KEY (step_id);


--
-- TOC entry 4725 (class 2606 OID 16483)
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (dish_id);


--
-- TOC entry 4728 (class 2606 OID 16491)
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (ingredient_id);


--
-- TOC entry 4734 (class 2606 OID 16619)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4736 (class 2606 OID 16621)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4726 (class 1259 OID 16484)
-- Name: idx_dish_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dish_name ON public.dishes USING btree (dish_name);


--
-- TOC entry 4738 (class 2606 OID 16588)
-- Name: dish_ingredients dish_ingredients_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish_ingredients
    ADD CONSTRAINT dish_ingredients_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(dish_id) ON DELETE CASCADE;


--
-- TOC entry 4739 (class 2606 OID 16602)
-- Name: dish_steps dish_steps_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dish_steps
    ADD CONSTRAINT dish_steps_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(dish_id) ON DELETE CASCADE;


--
-- TOC entry 4737 (class 2606 OID 16492)
-- Name: ingredients ingredients_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(dish_id) ON DELETE CASCADE;


-- Completed on 2025-02-20 14:42:14

--
-- PostgreSQL database dump complete
--

