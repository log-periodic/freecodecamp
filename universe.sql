--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years numeric,
    is_eliptical boolean,
    number_of_stars integer,
    year_discovered integer,
    galaxy_code integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: habitable; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.habitable (
    habitable_id integer NOT NULL,
    name character varying,
    distance_from_earth integer NOT NULL,
    code_name integer
);


ALTER TABLE public.habitable OWNER TO freecodecamp;

--
-- Name: habitable_habitable_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.habitable_habitable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.habitable_habitable_id_seq OWNER TO freecodecamp;

--
-- Name: habitable_habitable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.habitable_habitable_id_seq OWNED BY public.habitable.habitable_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    age_in_millions_of_years numeric,
    distance_from_planet integer,
    color text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    age_in_millions_of_years numeric,
    distance_from_star integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years numeric,
    is_dead boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: habitable habitable_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable ALTER COLUMN habitable_id SET DEFAULT nextval('public.habitable_habitable_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 1000.5, true, 2000000, 1774, 3113);
INSERT INTO public.galaxy VALUES (2, 'Andromeda2', 1000.5, false, 1000000, 1774, 3114);
INSERT INTO public.galaxy VALUES (3, 'Andromeda3', 905, false, 1000000, 1873, 2113);
INSERT INTO public.galaxy VALUES (4, 'Andromeda4', 905, false, 1000000, 1873, 2117);
INSERT INTO public.galaxy VALUES (5, 'Andromeda5', 805, true, 1000000, 1773, 2116);
INSERT INTO public.galaxy VALUES (6, 'Andromeda6', 805, true, 1000000, 1773, 116);


--
-- Data for Name: habitable; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.habitable VALUES (1, 'Earth', 199999999, 23);
INSERT INTO public.habitable VALUES (2, 'Earth', 2312123, 20);
INSERT INTO public.habitable VALUES (3, 'Earth2', 2312123, 221);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 2, 10, 400, 'yellow');
INSERT INTO public.moon VALUES (2, 'Moon2', 1, 10, 400, 'yellow');
INSERT INTO public.moon VALUES (3, 'Moon3', 5, 20, 300, 'red');
INSERT INTO public.moon VALUES (4, 'Moon4', 5, 20, 300, 'red');
INSERT INTO public.moon VALUES (5, 'Moon5', 2, 20, 300, 'red');
INSERT INTO public.moon VALUES (6, 'Moon6', 4, 10, 300, 'green');
INSERT INTO public.moon VALUES (7, 'Moon7', 4, 10, 300, 'green');
INSERT INTO public.moon VALUES (8, 'Moon8', 4, 10, 300, 'green');
INSERT INTO public.moon VALUES (9, 'Moon9', 4, 10, 300, 'green');
INSERT INTO public.moon VALUES (10, 'Moon10', 6, 11, 200, 'blue');
INSERT INTO public.moon VALUES (11, 'Moon11', 2, 15, 150, 'blue');
INSERT INTO public.moon VALUES (12, 'Moon12', 2, 15, 150, 'yellow');
INSERT INTO public.moon VALUES (13, 'Moon13', 11, 25, 250, 'yellow');
INSERT INTO public.moon VALUES (14, 'Moon14', 9, 25, 250, 'yellow');
INSERT INTO public.moon VALUES (15, 'Moon15', 3, 25, 250, 'yellow');
INSERT INTO public.moon VALUES (16, 'Moon16', 2, 5, 150, 'black');
INSERT INTO public.moon VALUES (17, 'Moon17', 2, 5, 150, 'black');
INSERT INTO public.moon VALUES (18, 'Moon18', 12, 25, 312, 'white');
INSERT INTO public.moon VALUES (19, 'Moon19', 11, 25, 312, 'white');
INSERT INTO public.moon VALUES (20, 'Moon20', 11, 25, 312, 'white');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 499, 200000);
INSERT INTO public.planet VALUES (2, 'Earth2', 1, 199, 15000);
INSERT INTO public.planet VALUES (3, 'Earth3', 1, 299, 20200);
INSERT INTO public.planet VALUES (4, 'Earth4', 2, 619, 20000);
INSERT INTO public.planet VALUES (5, 'Eart5', 4, 419, 20300);
INSERT INTO public.planet VALUES (6, 'Earth6', 5, 409, 2000);
INSERT INTO public.planet VALUES (7, 'Earth7', 2, 299, 20000);
INSERT INTO public.planet VALUES (8, 'Earth8', 6, 399, 100000);
INSERT INTO public.planet VALUES (9, 'Earth9', 4, 399, 20000);
INSERT INTO public.planet VALUES (10, 'Earth10', 1, 499, 200000);
INSERT INTO public.planet VALUES (11, 'Earth11', 2, 399, 20000);
INSERT INTO public.planet VALUES (12, 'Earth12', 2, 499, 20000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Nova', 1, 100, true);
INSERT INTO public.star VALUES (2, 'Nova2', 2, 100, true);
INSERT INTO public.star VALUES (3, 'Nova3', 3, 100, false);
INSERT INTO public.star VALUES (4, 'Nova4', 4, 100, false);
INSERT INTO public.star VALUES (5, 'Nova5', 5, 100, false);
INSERT INTO public.star VALUES (6, 'Nova6', 6, 100, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: habitable_habitable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.habitable_habitable_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_galaxy_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_code_key UNIQUE (galaxy_code);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: habitable habitable_code_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable
    ADD CONSTRAINT habitable_code_name_key UNIQUE (code_name);


--
-- Name: habitable habitable_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable
    ADD CONSTRAINT habitable_pkey PRIMARY KEY (habitable_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: habitable habitable_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.habitable
    ADD CONSTRAINT habitable_name_fkey FOREIGN KEY (name) REFERENCES public.planet(name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

