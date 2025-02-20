--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-20 12:31:24

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
-- TOC entry 4864 (class 0 OID 0)
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
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 219
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredients_ingredient_id_seq OWNED BY public.ingredients.ingredient_id;


--
-- TOC entry 4700 (class 2604 OID 16477)
-- Name: dishes dish_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes ALTER COLUMN dish_id SET DEFAULT nextval('public.dishes_dish_id_seq'::regclass);


--
-- TOC entry 4703 (class 2604 OID 16489)
-- Name: ingredients ingredient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN ingredient_id SET DEFAULT nextval('public.ingredients_ingredient_id_seq'::regclass);


--
-- TOC entry 4856 (class 0 OID 16474)
-- Dependencies: 218
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dishes (dish_id, dish_name, description, image_url, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4858 (class 0 OID 16486)
-- Dependencies: 220
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingredients (ingredient_id, dish_id, ingredient_name, quantity, unit) FROM stdin;
\.


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 217
-- Name: dishes_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dishes_dish_id_seq', 1, false);


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 219
-- Name: ingredients_ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_ingredient_id_seq', 1, false);


--
-- TOC entry 4705 (class 2606 OID 16483)
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (dish_id);


--
-- TOC entry 4708 (class 2606 OID 16491)
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (ingredient_id);


--
-- TOC entry 4706 (class 1259 OID 16484)
-- Name: idx_dish_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dish_name ON public.dishes USING btree (dish_name);


--
-- TOC entry 4709 (class 2606 OID 16492)
-- Name: ingredients ingredients_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dishes(dish_id) ON DELETE CASCADE;


-- Completed on 2025-02-20 12:31:25

--
-- PostgreSQL database dump complete
--

