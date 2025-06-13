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
    name character varying(100) NOT NULL,
    description text,
    size integer NOT NULL,
    age numeric NOT NULL,
    is_active boolean NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    composition text,
    radius integer NOT NULL,
    has_water boolean NOT NULL,
    planet_id integer
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
    name character varying(100) NOT NULL,
    planet_type text,
    diameter integer NOT NULL,
    has_life boolean NOT NULL,
    star_id integer
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
-- Name: scientist; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scientist (
    scientist_id integer NOT NULL,
    name character varying(100) NOT NULL,
    field text NOT NULL,
    age integer,
    is_alive boolean NOT NULL
);


ALTER TABLE public.scientist OWNER TO freecodecamp;

--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scientist_scientist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scientist_scientist_id_seq OWNER TO freecodecamp;

--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scientist_scientist_id_seq OWNED BY public.scientist.scientist_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text,
    mass integer NOT NULL,
    brightness numeric,
    is_visible boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: scientist scientist_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist ALTER COLUMN scientist_id SET DEFAULT nextval('public.scientist_scientist_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 100000, 13.51, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy', 220000, 10.0, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 81', 'Large spiral galaxy', 90000, 11.5, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting grand design', 76000, 9.0, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual shape galaxy', 125000, 12.4, true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Satellite of Milky Way', 14000, 13.0, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Rock', 1737, false, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Rock', 11, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Rock', 6, false, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'Rock', 1821, false, 1);
INSERT INTO public.moon VALUES (5, 'Europa', 'Ice', 1560, true, 1);
INSERT INTO public.moon VALUES (6, 'Titan', 'Ice', 2575, true, 3);
INSERT INTO public.moon VALUES (7, 'Ganymede', 'Rock/Ice', 2634, true, 3);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Ice', 2410, false, 3);
INSERT INTO public.moon VALUES (9, 'Kepler-m1', 'Gas', 1000, false, 4);
INSERT INTO public.moon VALUES (10, 'Kepler-m2', 'Ice', 800, false, 4);
INSERT INTO public.moon VALUES (11, 'Gliese-m1', 'Gas', 1100, false, 5);
INSERT INTO public.moon VALUES (12, 'Gliese-m2', 'Rock', 950, false, 5);
INSERT INTO public.moon VALUES (13, 'Alpha-m1', 'Ice', 1300, false, 6);
INSERT INTO public.moon VALUES (14, 'Alpha-m2', 'Gas', 1250, false, 6);
INSERT INTO public.moon VALUES (15, 'Sirius-m1', 'Rock', 700, false, 8);
INSERT INTO public.moon VALUES (16, 'Sirius-m2', 'Rock', 600, false, 9);
INSERT INTO public.moon VALUES (17, 'Betel-m1', 'Gas', 1500, false, 10);
INSERT INTO public.moon VALUES (18, 'Betel-m2', 'Gas', 1550, false, 11);
INSERT INTO public.moon VALUES (19, 'Rigel-m1', 'Gas', 1400, false, 12);
INSERT INTO public.moon VALUES (20, 'Rigel-m2', 'Gas', 1450, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 12742, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 6779, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 12104, false, 1);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 'Super-Earth', 24000, false, 2);
INSERT INTO public.planet VALUES (5, 'Gliese 581c', 'Super-Earth', 15000, false, 2);
INSERT INTO public.planet VALUES (6, 'Alpha b', 'Gas giant', 50000, false, 3);
INSERT INTO public.planet VALUES (7, 'Alpha c', 'Ice giant', 60000, false, 3);
INSERT INTO public.planet VALUES (8, 'Sirius b-1', 'Rocky', 11000, false, 4);
INSERT INTO public.planet VALUES (9, 'Sirius b-2', 'Rocky', 9000, false, 4);
INSERT INTO public.planet VALUES (10, 'Betel b', 'Gas giant', 70000, false, 5);
INSERT INTO public.planet VALUES (11, 'Betel c', 'Ice giant', 60000, false, 5);
INSERT INTO public.planet VALUES (12, 'Rigel Prime', 'Gas giant', 80000, false, 6);


--
-- Data for Name: scientist; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scientist VALUES (1, 'Carl Sagan', 'Astronomy', 62, false);
INSERT INTO public.scientist VALUES (2, 'Neil deGrasse Tyson', 'Astrophysics', 65, true);
INSERT INTO public.scientist VALUES (3, 'Jocelyn Bell Burnell', 'Radio Astronomy', 80, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 1989000, 1.0, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red dwarf', 123000, 0.0017, true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'Main sequence', 1100000, 1.519, true, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'White dwarf', 2010000, 25.4, true, 2);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red supergiant', 8800000, 126000, false, 3);
INSERT INTO public.star VALUES (6, 'Rigel', 'Blue supergiant', 21000000, 120000, true, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: scientist_scientist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scientist_scientist_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: scientist scientist_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_name_key UNIQUE (name);


--
-- Name: scientist scientist_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scientist
    ADD CONSTRAINT scientist_pkey PRIMARY KEY (scientist_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

