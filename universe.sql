--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    nationality text,
    birth_year integer,
    discoveries_count integer
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.astronomer ALTER COLUMN astronomer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.astronomer_astronomer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    distance_light_years numeric,
    has_black_hole boolean,
    discovered_year integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    type character varying(50),
    diameter_km integer,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    type character varying(50),
    mass_earth_units numeric,
    has_atmosphere boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_class character varying(10),
    temperature_kelvin integer,
    is_visible boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer OVERRIDING SYSTEM VALUE VALUES (1, 'Galileo Galilei', 'Italian', 1564, 15);
INSERT INTO public.astronomer OVERRIDING SYSTEM VALUE VALUES (2, 'Edwin Hubble', 'American', 1889, 8);
INSERT INTO public.astronomer OVERRIDING SYSTEM VALUE VALUES (3, 'Johannes Kepler', 'German', 1571, 12);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 'Spiral', 0, true, 1610);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 'Spiral', 2537000, true, 964);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 'Spiral', 3000000, false, 1654);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Whirlpool', 'Spiral', 23000000, true, 1773);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Sombrero', 'Elliptical', 29000000, true, 1781);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Centaurus A', 'Elliptical', 13000000, true, 1826);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 3, 'Rocky', 3474, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 4, 'Rocky', 22, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 4, 'Rocky', 12, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 5, 'Volcanic', 3642, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 5, 'Icy', 3121, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 5, 'Icy', 5262, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 5, 'Rocky', 4820, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Titan', 6, 'Icy', 5149, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Enceladus', 6, 'Icy', 504, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Mimas', 6, 'Icy', 396, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Tethys', 6, 'Icy', 1062, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Dione', 6, 'Icy', 1122, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Rhea', 6, 'Icy', 1527, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Iapetus', 6, 'Icy', 1469, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Miranda', 7, 'Icy', 471, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Ariel', 7, 'Icy', 1157, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Umbriel', 7, 'Icy', 1169, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Titania', 7, 'Icy', 1576, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Oberon', 7, 'Icy', 1522, true);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Triton', 8, 'Icy', 2706, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', 1, 'Terrestrial', 0.055, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 1, 'Terrestrial', 0.815, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', 1, 'Terrestrial', 1.0, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 1, 'Terrestrial', 0.107, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 1, 'Gas Giant', 317.8, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 1, 'Gas Giant', 95.2, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Uranus', 1, 'Ice Giant', 14.5, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Neptune', 1, 'Ice Giant', 17.1, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Proxima b', 2, 'Terrestrial', 1.27, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Sirius b', 3, 'White Dwarf', 0.98, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Betelgeuse I', 4, 'Gas Giant', 250.0, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Rigel Prime', 5, 'Terrestrial', 2.5, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, 'G2V', 5778, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Proxima Centauri', 1, 'M5.5Ve', 3042, false);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Sirius', 1, 'A1V', 9940, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Betelgeuse', 1, 'M1-2', 3500, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Rigel', 1, 'B8Ia', 12100, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Andromeda Prime', 2, 'G5V', 5500, false);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


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

