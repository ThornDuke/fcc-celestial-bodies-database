--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE universe OWNER TO postgres;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    type character varying(5),
    catalogue character varying(15),
    right_ascension character varying(7) NOT NULL,
    declination character varying(6) NOT NULL,
    name character varying(50),
    redshift numeric(4,2),
    magnitude numeric(3,1)
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    parent character varying(30) NOT NULL,
    mean_radius_km numeric(6,1),
    discovery_yr integer,
    discoverer character varying(30),
    is_nakedeye_visible boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: osservations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.osservations (
    osservations_id integer NOT NULL,
    name character varying(255) NOT NULL,
    date date,
    object character varying(40),
    notes text
);


ALTER TABLE public.osservations OWNER TO postgres;

--
-- Name: osservations_osservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.osservations_osservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.osservations_osservation_id_seq OWNER TO postgres;

--
-- Name: osservations_osservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.osservations_osservation_id_seq OWNED BY public.osservations.osservations_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    host_star character varying(30),
    distance_ly numeric(4,2),
    mass_em numeric(4,2),
    radius_er numeric(4,2),
    notes text,
    is_extra_solar boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_au integer NOT NULL,
    mass_sunmasses integer,
    spectral_type character varying(10),
    distance_ly integer,
    constellation character varying(50),
    magnitude numeric(4,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: osservations osservations_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.osservations ALTER COLUMN osservations_id SET DEFAULT nextval('public.osservations_osservation_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'G', 'DDO 221', '00 02.0', '-15 28', 'Wolf Lundmark Melotte', 0.00, 11.0);
INSERT INTO public.galaxy VALUES (2, 'GPair', 'M51', '13 29.9', '+47 12', 'Whirlpool Galaxy', 0.00, 8.9);
INSERT INTO public.galaxy VALUES (3, 'G', 'M87', '12 30.8', '+12 23', 'Virgo A', 0.00, 9.6);
INSERT INTO public.galaxy VALUES (4, 'G', 'M104', '12 39.9', '-11 37', 'Sombrero', 0.00, 9.0);
INSERT INTO public.galaxy VALUES (5, 'CL', '', '15 16.1', '-00 08', 'Serpens Dwarf', 0.00, NULL);
INSERT INTO public.galaxy VALUES (6, 'G', NULL, '01 00.2', '-33 42', 'Sculptor Dwarf', 0.00, 8.6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 1738.0, 0, 'humanity', true, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Mars', 11267.0, 1877, 'Hall', true, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Mars', 6.2, 1877, 'Hall', true, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 'Jupiter', 1821.6, 1610, 'Galileo', false, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 'Jupiter', 1560.8, 1610, 'Galileo', false, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Jupiter', 2634.1, 1610, 'Galileo', false, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Jupiter', 2410.3, 1610, 'Galileo', false, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Jupiter', 83.5, 1892, 'Barnard', false, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', 'Jupiter', 69.8, 1905, 'Perrine', false, NULL);
INSERT INTO public.moon VALUES (10, 'Elara', 'Jupiter', 43.0, 1905, 'Perrine', false, NULL);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 'Jupiter', 30.0, 1908, 'Melotte', false, NULL);
INSERT INTO public.moon VALUES (12, 'Sinope', 'Jupiter', 19.0, 1914, 'Nicholson', false, NULL);
INSERT INTO public.moon VALUES (13, 'Lisithea', 'Jupiter', 18.0, 1938, 'Nicholson', false, NULL);
INSERT INTO public.moon VALUES (14, 'Carme', 'Jupiter', 23.0, 1938, 'Nicholson', false, NULL);
INSERT INTO public.moon VALUES (15, 'Ananke', 'Jupiter', 14.0, 1951, 'Nicholson', false, NULL);
INSERT INTO public.moon VALUES (16, 'Mimas', 'Saturn', 198.2, 1789, 'Herschel', false, NULL);
INSERT INTO public.moon VALUES (17, 'Enceladus', 'Saturn', 252.1, 1789, 'Herschel', false, NULL);
INSERT INTO public.moon VALUES (18, 'Tethys', 'Saturn', 533.1, 1686, 'Cassini', false, NULL);
INSERT INTO public.moon VALUES (19, 'Dione', 'Saturn', 561.4, 1686, 'Cassini', false, NULL);
INSERT INTO public.moon VALUES (20, 'Rhea', 'Saturn', 763.8, 1673, 'Cassini', false, NULL);


--
-- Data for Name: osservations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.osservations VALUES (1, 'Girella', '1976-12-21', 'M31', 'Gira davvero!');
INSERT INTO public.osservations VALUES (2, 'Lontananze', '2012-07-14', 'Centipede', NULL);
INSERT INTO public.osservations VALUES (3, 'Padellame', '1999-03-09', 'Odoacria', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Sun', 0.00, 0.05, 0.38, NULL, false, NULL);
INSERT INTO public.planet VALUES (2, 'Earth', 'Sun', 0.00, 1.00, 1.00, NULL, false, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Sun', 0.00, 99.99, 10.73, NULL, false, NULL);
INSERT INTO public.planet VALUES (4, 'd PC', 'Proxima Centauri', 4.24, 0.26, NULL, 'One disputed candidate', true, NULL);
INSERT INTO public.planet VALUES (5, 'b L', 'Lalande', 8.30, 2.69, NULL, '1 candidate', true, NULL);
INSERT INTO public.planet VALUES (6, 'Aegir', 'Epsilon Eridani', 10.48, 1.40, NULL, '1 inferred planet, 1 or possibly 2 inner debris discs, and an outer disc', true, NULL);
INSERT INTO public.planet VALUES (7, 'b Lacaille', 'Lacaille 9532', 10.72, 1.40, NULL, '1 candidate', true, NULL);
INSERT INTO public.planet VALUES (8, 'b Ross', 'Ross 128', 11.00, 1.40, NULL, NULL, true, NULL);
INSERT INTO public.planet VALUES (9, 'g TC', 'Tau Ceti', 11.92, 1.75, NULL, '4 disputed candidates', true, NULL);
INSERT INTO public.planet VALUES (10, 'd GJ', 'GJ 1061', 11.98, 1.74, NULL, 'two solutions for ds orbit', true, NULL);
INSERT INTO public.planet VALUES (11, 'b YZ C', 'YZ Ceti', 12.12, 0.70, NULL, NULL, true, NULL);
INSERT INTO public.planet VALUES (12, 'e L', 'Luyten Star', 12.34, 1.18, NULL, NULL, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Westerlund 1-26', 2550, 25, 'S3V', 5000, 'Cygnus', 11.14, NULL);
INSERT INTO public.star VALUES (2, 'VV Cephei A', 1900, 18, 'S2V', 5000, 'Cepheus', 4.91, NULL);
INSERT INTO public.star VALUES (3, 'UY Scuti', 1900, 10, 'S4V', 9500, 'Scutum', 12.25, NULL);
INSERT INTO public.star VALUES (4, 'WOH G64', 1550, 22, 'S5V', 170000, 'Dorado', 18.46, NULL);
INSERT INTO public.star VALUES (5, 'VX Sagittarii', 1520, 12, 'S4V', 5100, 'Sagittarius', 11.72, NULL);
INSERT INTO public.star VALUES (6, 'VY Canis Maioris', 1420, 17, 'S2V', 3500, 'Canis Major', 7.96, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: osservations_osservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.osservations_osservation_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: osservations osservations_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.osservations
    ADD CONSTRAINT osservations_name_key UNIQUE (name);


--
-- Name: osservations osservations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.osservations
    ADD CONSTRAINT osservations_pkey PRIMARY KEY (osservations_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

