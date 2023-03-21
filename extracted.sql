--
-- PostgreSQL database dump
--

-- Dumped from database version 11.17 (Ubuntu 11.17-1.pgdg20.04+1)
-- Dumped by pg_dump version 11.15

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE TABLE "public"."ar_internal_metadata" (
    "key" character varying NOT NULL,
    "value" character varying,
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO hmbsjvszjwjnui;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE TABLE "public"."movies" (
    "id" bigint NOT NULL,
    "title" character varying NOT NULL,
    "release_date" "date",
    "poster_path" character varying,
    "description" "text" DEFAULT ' '::"text",
    "vote_count" integer,
    "vote_rating" numeric(5,2),
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL,
    "media_type" character varying
);


ALTER TABLE public.movies OWNER TO hmbsjvszjwjnui;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE SEQUENCE "public"."movies_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO hmbsjvszjwjnui;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER SEQUENCE "public"."movies_id_seq" OWNED BY "public"."movies"."id";


--
-- Name: movies_playlists; Type: TABLE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE TABLE "public"."movies_playlists" (
    "playlist_id" bigint NOT NULL,
    "movie_id" bigint NOT NULL
);


ALTER TABLE public.movies_playlists OWNER TO hmbsjvszjwjnui;

--
-- Name: playlists; Type: TABLE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE TABLE "public"."playlists" (
    "id" bigint NOT NULL,
    "user_id" bigint,
    "name" character varying NOT NULL,
    "active" boolean DEFAULT false,
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL
);


ALTER TABLE public.playlists OWNER TO hmbsjvszjwjnui;

--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE SEQUENCE "public"."playlists_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlists_id_seq OWNER TO hmbsjvszjwjnui;

--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER SEQUENCE "public"."playlists_id_seq" OWNED BY "public"."playlists"."id";


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE TABLE "public"."ratings" (
    "id" bigint NOT NULL,
    "user_id" bigint,
    "movie_id" bigint,
    "score" integer DEFAULT 0,
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL,
    "stars" character varying[] DEFAULT '{}'::character varying[]
);


ALTER TABLE public.ratings OWNER TO hmbsjvszjwjnui;

--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE SEQUENCE "public"."ratings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratings_id_seq OWNER TO hmbsjvszjwjnui;

--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER SEQUENCE "public"."ratings_id_seq" OWNED BY "public"."ratings"."id";


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE TABLE "public"."schema_migrations" (
    "version" character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO hmbsjvszjwjnui;

--
-- Name: users; Type: TABLE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE TABLE "public"."users" (
    "id" bigint NOT NULL,
    "first_name" character varying,
    "last_name" character varying,
    "username" character varying,
    "email" character varying NOT NULL,
    "password_digest" character varying,
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL,
    "role" integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO hmbsjvszjwjnui;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE SEQUENCE "public"."users_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO hmbsjvszjwjnui;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER SEQUENCE "public"."users_id_seq" OWNED BY "public"."users"."id";


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."movies" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."movies_id_seq"'::"regclass");


--
-- Name: playlists id; Type: DEFAULT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."playlists" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."playlists_id_seq"'::"regclass");


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."ratings" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."ratings_id_seq"'::"regclass");


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."users" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."users_id_seq"'::"regclass");


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: hmbsjvszjwjnui
--

COPY "public"."ar_internal_metadata" ("key", "value", "created_at", "updated_at") FROM stdin;
environment	production	2019-03-08 18:37:20.281824	2019-03-08 18:37:20.281824
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: hmbsjvszjwjnui
--

COPY "public"."movies" ("id", "title", "release_date", "poster_path", "description", "vote_count", "vote_rating", "created_at", "updated_at", "media_type") FROM stdin;
364089	Anthony Jeselnik: Thoughts and Prayers	2015-10-16	/Iv7VOkMwsgdp15bleC79luFRmF.jpg	There's no subject too dark as the comedian skewers taboos and riffs on national tragedies before pulling back the curtain on his provocative style.	52	\N	2020-07-04 03:36:39.676868	2020-07-04 03:36:39.676868	\N
278	The Shawshank Redemption	1994-09-23	/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg	\N	12591	\N	2019-03-29 20:16:11.42841	2020-07-02 13:58:33.022031	movie
550	Fight Club	1999-10-15	/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg	\N	15716	\N	2019-03-29 20:16:15.063939	2020-07-02 13:58:33.030961	movie
350	The Devil Wears Prada	2006-06-30	/u6QBDGUCOEMRekna95ip2MxplbQ.jpg	\N	6233	\N	2019-03-29 20:16:13.192534	2020-07-02 13:58:33.042173	movie
597	Titanic	1997-12-19	/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg	\N	13644	\N	2019-03-29 20:16:19.697169	2020-07-02 13:58:33.051523	movie
769	GoodFellas	1990-09-12	/oErEczcVUmJm0EPdvWsvK4g4Lv3.jpg	\N	5361	\N	2019-03-29 20:19:27.225767	2020-07-02 13:58:33.059634	movie
73	American History X	1998-10-30	/c2gsmSQ2Cqv8zosqKOCwRS0GFBS.jpg	\N	5578	\N	2019-03-29 20:19:49.689838	2020-07-02 13:58:33.069379	movie
207	Dead Poets Society	1989-06-02	/ai40gM7SUaGA6fthvsd87o8IQq4.jpg	\N	5526	\N	2019-03-29 20:20:01.392809	2020-07-02 13:58:33.081689	movie
281957	The Revenant	\N	/tSaBkriE7TpbjFoQUFXuikoz0dF.jpg	In the 1820s, a frontiersman, Hugh Glass, sets out on a path of vengeance against those who left him for dead after a bear mauling.	10497	\N	2019-03-12 16:11:20.839694	2020-07-02 13:58:33.091712	movie
637	Life Is Beautiful	1997-12-20	/mfnkSeeVOBVheuyn2lo4tfmOPQb.jpg	\N	6947	\N	2019-03-29 20:19:15.692751	2020-06-21 21:36:16.836059	\N
157336	Interstellar	2014-11-05	/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg	\N	17882	\N	2019-03-29 20:20:54.342924	2020-07-02 13:58:33.099599	movie
286217	The Martian	2015-10-02	/5BHuvQ6p9kfc091Z8RiFNhCwL4b.jpg	\N	11748	\N	2019-03-29 20:16:26.773109	2020-07-02 13:58:33.10728	movie
629	The Usual Suspects	1995-07-19	/d2IalvQ6eaEAsLVTFUEHf6roHEk.jpg	\N	5431	\N	2019-03-29 20:21:09.382609	2020-07-02 13:58:32.59781	movie
274	The Silence of the Lambs	1991-02-01	/rplLJ2hPcOQmkFhTqUte0MkEaO2.jpg	\N	8072	\N	2019-03-29 20:20:40.687157	2020-07-02 13:58:32.609705	movie
807	Se7en	1995-09-22	/GQP6noTBKsYiAYyn8PYXFcsSgH.jpg	\N	10180	\N	2019-03-29 20:20:26.241568	2020-07-02 13:58:32.618363	movie
567	Rear Window	1954-08-01	/ILVF0eJxHMddjxeQhswFtpMtqx.jpg	\N	2767	\N	2019-03-29 20:20:10.222504	2020-07-02 13:58:32.629198	movie
423	The Pianist	2002-09-17	/3DzePKMbLMIM636S6syCy3cLPqj.jpg	\N	3751	\N	2019-03-29 20:20:27.488702	2020-07-02 13:58:32.641727	movie
510	One Flew Over the Cuckoo's Nest	1975-11-18	/yMgm27NWJsNblsE6Y0px7NtUBl8.jpg	\N	5259	\N	2019-03-29 20:19:24.611994	2020-07-02 13:58:32.650755	movie
680	Pulp Fiction	1994-09-10	/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg	\N	14612	\N	2019-03-29 20:18:55.907179	2020-07-02 13:58:32.662548	movie
240	The Godfather: Part II	1974-12-20	/amvmeQWheahG3StKwIE1f7jRnkZ.jpg	\N	5624	\N	2019-03-29 20:19:09.131055	2020-07-02 13:58:32.674762	movie
272	Batman Begins	2005-06-15	/8RW2runSEc34IwKN2D1aPcJd2UL.jpg	\N	11737	\N	2019-03-29 20:16:04.558912	2020-07-02 13:58:32.685063	movie
345887	The Equalizer 2	\N	/cQvc9N6JiMVKqol3wcYrGshsIdZ.jpg	Robert McCall, who serves an unflinching justice for the exploited and oppressed, embarks on a relentless, globe-trotting quest for vengeance when a long-time girl friend is murdered.	1783	\N	2019-03-08 21:02:48.061092	2020-07-02 13:58:32.85852	movie
353081	Mission: Impossible - Fallout	\N	/AkJQpZp9WoNdj7pLYSj1L0RcMMN.jpg	When an IMF mission ends badly, the world is faced with dire consequences. As Ethan Hunt takes it upon himself to fulfill his original briefing, the CIA begin to question his loyalty and his motives. The IMF team find themselves in a race against time, hunted by assassins while trying to prevent a global catastrophe.	3398	\N	2019-03-08 21:03:08.181033	2020-07-02 13:58:30.23372	movie
27205	Inception	2010-07-15	/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg	\N	21444	\N	2019-03-29 20:20:38.894636	2020-07-02 13:58:32.586262	movie
347375	Mile 22	\N	/2L8ehd95eSW9x7KINYtZmRkAlrZ.jpg	An elite group of American operatives, aided by a top-secret tactical command team, must transport an asset who holds life-threatening information to an extraction point 22 miles away through the hostile streets of an Asian city.	763	\N	2019-03-08 21:03:33.673453	2020-07-02 13:58:32.872519	movie
263115	Logan	\N	/gGBu0hKw9BGddG8RkRAMX7B6NDB.jpg	In the near future, a weary Logan cares for an ailing Professor X in a hideout on the Mexican border. But Logan's attempts to hide from the world and his legacy are upended when a young mutant arrives, pursued by dark forces.	11735	\N	2019-03-12 16:10:28.279897	2020-07-02 13:58:32.880171	movie
155	The Dark Knight	\N	/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg	Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.	18188	\N	2019-03-18 16:08:35.568011	2020-07-02 13:58:32.888009	movie
399361	Triple Frontier	\N	/aBw8zYuAljVM1FeK5bZKITPH8ZD.jpg	Struggling to make ends meet, former special ops soldiers reunite for a high-stakes heist: stealing $75 million from a South American drug lord.	425	\N	2019-03-21 21:54:06.166927	2020-07-02 13:58:32.896633	movie
411728	The Professor and the Madman	\N	/yBaf5WjUqTQbc6mzPQBUcBiauDI.jpg	Professor James Murray begins work compiling words for the first edition of the Oxford English Dictionary in the mid 19th century and receives over 10,000 entries from a patient at Broadmoor Criminal Lunatic Asylum , Dr William Minor.	2	\N	2019-03-21 21:59:29.113422	2020-07-02 13:58:32.905396	movie
238	The Godfather	1972-03-15	/rPdtLWNsZmAtoZl9PK7S2wE3qiS.jpg	\N	9640	\N	2019-03-29 20:15:52.139744	2020-07-02 13:58:32.913426	movie
400535	Sicario: Day of the Soldado	2018-06-29	/msqWSQkU403cQKjQHnWLnugv7EY.jpg	\N	1165	\N	2019-03-29 20:16:37.190365	2020-07-02 13:58:32.921919	movie
399725	Ideal Home	\N	/nG1LGKXuxhzgmheGxZqDYekCzCr.jpg	A couple is going through marital troubles made worse when a previously unknown grandson shows up.	61	\N	2019-03-29 20:17:07.471661	2020-07-02 13:58:32.934475	movie
500682	The Highwaymen	\N	/i17M3ljNHX6zqXV0nJq1YRLEEoK.jpg	Legendary lawman Frank Hamer and Manny Gault, two former  Rangers by the time Bonnie & Clyde started their robbery reign, are commissioned as special investigators, coaxed by a consortium of banks to assemble a posse and end the robbery spree of the notorious duo reputed to have killed 13 cops and others.	12	\N	2019-03-29 20:17:59.828139	2020-07-02 13:58:32.9429	movie
497	The Green Mile	1999-12-10	/sOHqdY1RnSn6kcfAHKu28jvTebE.jpg	\N	7888	\N	2019-03-29 20:18:51.479233	2020-07-02 13:58:32.952091	movie
122	The Lord of the Rings: The Return of the King	2003-12-01	/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg	\N	12680	\N	2019-03-29 20:19:22.739693	2020-07-02 13:58:32.960975	movie
598	City of God	2002-02-05	/gCqnQaq8T4CfioP9uETLx9iMJF4.jpg	\N	3175	\N	2019-03-29 20:19:51.283516	2020-07-02 13:58:32.968568	movie
490132	Green Book	2018-11-16	/7BsvSuDQuoqhWmU2fL7W2GOcZHU.jpg	\N	2603	\N	2019-03-29 20:20:29.120347	2020-07-02 13:58:32.976923	movie
120	The Lord of the Rings: The Fellowship of the Ring	2001-12-18	/56zTpe2xvaA4alU51sRWPoKPYZy.jpg	\N	13931	\N	2019-03-29 20:20:36.10428	2020-07-02 13:58:32.98563	movie
299536	Avengers: Infinity War	2018-04-25	/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg	\N	12316	\N	2019-03-29 20:20:47.849009	2020-07-02 13:58:32.99363	movie
121	The Lord of the Rings: The Two Towers	2002-12-18	/5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg	\N	12020	\N	2019-03-29 20:20:58.7378	2020-07-02 13:58:33.001769	movie
424	Schindler's List	1993-12-15	/c8Ass7acuOe4za6DhSattE359gr.jpg	\N	7640	\N	2019-03-29 20:18:53.373438	2020-07-02 13:58:33.010783	movie
832	M	1931-05-11	/AqE126KXLcT3wwmeM3HtlKqyGze.jpg	\N	826	\N	2019-03-29 20:22:02.734345	2019-03-29 20:22:02.734345	\N
2503	The Bourne Ultimatum	2007-08-03	/d4DuphCHCjVUyffExnK5nLbn39K.jpg	\N	4317	\N	2019-04-06 04:19:03.167329	2020-07-02 13:58:32.451917	movie
37958	Immortals	2011-11-10	/swJ3VuuSMJUDoi899VuXG5OqmPG.jpg	Theseus is a mortal man chosen by Zeus to lead the fight against the ruthless King Hyperion, who is on a rampage across Greece to obtain a weapon that can destroy humanity.	2100	\N	2022-04-23 03:21:23.856435	2022-04-23 03:21:23.856435	movie
36773	The Third Miracle	1999-09-13	/mW96cgjejxCnvCoeD1hJq3s3Esa.jpg	The Vatican sends a priest to verify some miracles, performed by a woman who has been nominated for sainthood...	40	\N	2022-06-22 22:44:11.779959	2022-06-22 22:44:11.779959	movie
12509	Pollock	2000-09-06	/azsBSw2zw2uNHiCjTnbe9TJVEDB.jpg	In August of 1949, Life Magazine ran a banner headline that begged the question: "Jackson Pollock: Is he the greatest living painter in the United States?" The film is a look back into the life of an extraordinary man, a man who has fittingly been called "an artist dedicated to concealment, a celebrity who nobody knew." As he struggled with self-doubt, engaging in a lonely tug-of-war between needing to express himself and wanting to shut the world out, Pollock began a downward spiral.	242	\N	2022-06-22 22:44:16.205201	2022-06-22 22:44:16.205201	movie
2756	The Abyss	1989-08-09	/jel2BuDv7Bq4fuv2pUrTfiBm69o.jpg	A civilian oil rig crew is recruited to conduct a search and rescue effort when a nuclear submarine mysteriously sinks. One diver soon finds himself on a spectacular odyssey 25,000 feet below the ocean's surface where he confronts a mysterious force that has the power to change the world or destroy it.	2247	\N	2022-06-22 22:44:29.372948	2022-06-22 22:44:29.372948	movie
8986	Milk Money	1994-08-31	/od8SCOMLDq4iRYaHNqihQVn1SNE.jpg	Three young boys pool their money and pay V, a kindhearted prostitute, to strip for them. Afterward, she drives them home to the suburbs -- but then her car breaks down. It's just as well, though, because a mobster named Waltzer is after her, and V realizes the suburbs are the perfect place to hide. But things get a lot more complicated when V falls in love with Tom, a single father who is unaware of her real profession.	212	\N	2022-06-22 22:44:50.02403	2022-06-22 22:44:50.02403	movie
10922	The Human Stain	2003-10-29	/peS0GGnbBR7vXDaDGPxHNit4q0T.jpg	Coleman Silk is a worldly and admired professor who loses his job after unwittingly making a racial slur. To clear his name, Silk writes a book about the events with his friend and colleague Nathan Zuckerman, who in the process discovers a dark secret Silk has hidden his whole life. All the while, Silk engages in an affair with Faunia Farley, a younger woman whose tormented past threatens to unravel the layers of deception Silk has constructed.	358	\N	2022-06-22 22:45:11.22069	2022-06-22 22:45:11.22069	movie
4771	Gone Baby Gone	2007-06-06	/uIo4a0fCUFth4yVG3QToquAxuRG.jpg	When 4 year old Amanda McCready disappears from her home and the police make little headway in solving the case, the girl's aunt, Beatrice McCready hires two private detectives, Patrick Kenzie and Angie Gennaro. The detectives freely admit that they have little experience with this type of case, but the family wants them for two reasons—they're not cops and they know the tough neighborhood in which they all live.	3007	\N	2022-06-22 22:45:56.28889	2022-06-22 22:45:56.28889	movie
49527	Man on a Ledge	2012-01-13	/fn75crX6sRcKRc7lhuqKTenppQE.jpg	An ex-cop turned con threatens to jump to his death from a Manhattan hotel rooftop. The NYPD dispatch a female police psychologist to talk him down. However, unbeknownst to the police on the scene, the suicide attempt is a cover for the biggest diamond heist ever pulled.	2176	\N	2022-06-22 22:46:15.384187	2022-06-22 22:46:15.384187	movie
59	A History of Violence	2005-09-23	/rrc6GiAKHDrUjp8OmdVng9hRWBn.jpg	An average family is thrust into the spotlight after the father commits a seemingly self-defense murder at his diner.	2552	\N	2022-06-22 22:46:19.950186	2022-06-22 22:46:19.950186	movie
500	Reservoir Dogs	1992-09-02	/jX94vnfcuJ8rTnFbsoriY6dlHrC.jpg	\N	6792	\N	2019-03-29 20:21:53.668222	2020-07-02 13:58:32.694504	movie
16869	Inglourious Basterds	2009-08-18	/7sfbEnaARXDDhKm0CZ7D7uc2sbo.jpg	\N	11427	\N	2019-03-29 20:22:26.192735	2020-07-02 13:58:32.706755	movie
289	Casablanca	1942-11-26	/5K7cOHoay2mZusSLezBOY0Qxh8a.jpg	\N	2423	\N	2019-03-29 20:22:16.064244	2020-07-02 13:58:32.7157	movie
348	Alien	1979-05-25	/vfrQk5IPloGg1v9Rzbh2Eg3VGyM.jpg	\N	7281	\N	2019-03-29 20:23:22.355451	2020-07-02 13:58:32.726137	movie
7345	There Will Be Blood	2007-12-28	/fa0RDkAlCec0STeMNAhPaF89q6U.jpg	\N	2743	\N	2019-03-29 20:23:00.702212	2020-07-02 13:58:32.734273	movie
98	Gladiator	2000-05-01	/dvKsQB84W2Sv6s7jpGmzQBVyQe3.jpg	\N	9301	\N	2019-03-29 20:22:30.165177	2020-07-02 13:58:32.74207	movie
324786	Hacksaw Ridge	2016-10-07	/vVJRemwt0WyqnwLMIAaa2FNZBME.jpg	\N	6337	\N	2019-03-29 20:23:12.349628	2020-07-02 13:58:32.750043	movie
582	The Lives of Others	2006-03-15	/5BCyeLJHPcRwhu0YaRqUzw00JJ4.jpg	\N	1625	\N	2019-03-29 20:22:52.555086	2020-07-02 13:58:32.758274	movie
11	Star Wars	1977-05-25	/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg	\N	11057	\N	2019-03-29 20:21:34.436719	2020-07-02 13:58:32.768273	movie
205596	The Imitation Game	2014-11-14	/lLZxUpNnLHklJ7IA75CbjfE0xra.jpg	\N	9985	\N	2019-03-29 20:22:55.478728	2020-07-02 13:58:32.777196	movie
28	Apocalypse Now	1979-08-15	/gQB8Y5RCMkv2zwzFHbUJX3kAhvA.jpg	\N	3728	\N	2019-03-29 20:21:11.216819	2020-07-02 13:58:32.785304	movie
77	Memento	2000-10-11	/uprP8rtOgMYJQ2h3ldDFvGsaBgH.jpg	\N	7515	\N	2019-03-29 20:21:22.499742	2020-07-02 13:58:32.793001	movie
9061	Just Cause	1995-02-17	/z8WqDIUC00TPX6U24ah0C7IMEKf.jpg	A Harvard professor is lured back into the courtroom after twenty-five years to take the case of a young black man condemned to death for the horrific murder of a child.	391	\N	2022-06-22 22:46:24.202724	2022-06-22 22:46:24.202724	movie
361743	Top Gun: Maverick	2022-05-24	/62HCnUTziyWcpDaBO2i1DX17ljH.jpg	After more than thirty years of service as one of the Navy’s top aviators, and dodging the advancement in rank that would ground him, Pete “Maverick” Mitchell finds himself training a detachment of TOP GUN graduates for a specialized mission the likes of which no living pilot has ever seen.	1289	\N	2022-06-26 22:54:44.78626	2022-06-26 22:54:44.78626	movie
329865	Arrival	2016-11-11	/x2FJsf1ElAgr63Y3PNPtJrcmpoe.jpg	\N	10055	\N	2019-04-07 02:37:22.629456	2020-07-02 13:58:32.317385	movie
194662	Birdman	2014-10-17	/lvWL5ZRlYFh7M7fOvYswcRqyprI.jpg	\N	7483	\N	2019-04-07 02:37:43.451646	2020-07-02 13:58:32.326687	movie
210577	Gone Girl	2014-10-03	/tQf4DUygWo64AOuqgk4jEDCE3Ws.jpg	\N	10020	\N	2019-04-07 02:36:01.507202	2020-07-02 13:58:32.336967	movie
150540	Inside Out	2015-06-19	/lRHE0vzf3oYJrhbsHXjIkF4Tl5A.jpg	\N	12230	\N	2019-04-07 02:36:03.461014	2020-07-02 13:58:32.34609	movie
949	Heat	1995-12-15	/rrBuGu0Pjq7Y2BWSI6teGfZzviY.jpg	\N	3082	\N	2019-04-06 04:19:09.781408	2020-07-02 13:58:32.354196	movie
470	21 Grams	2003-11-21	/wZ0l6or5juuVWqDkLEgaghs4f9l.jpg	\N	1537	\N	2019-04-06 04:16:31.352203	2020-07-02 13:58:32.362042	movie
49017	Dracula Untold	2014-10-03	/m5h3NtZ2ZfryIHl1MvatmANvIqQ.jpg	\N	3641	\N	2019-04-07 02:37:10.551165	2020-07-02 13:58:32.370094	movie
374720	Dunkirk	2017-07-19	/ebSnODDg9lbsMIaWg2uAbjn7TO5.jpg	\N	8820	\N	2019-04-07 02:36:49.188003	2020-07-02 13:58:32.378673	movie
6479	I Am Legend	2007-12-14	/iPDkaSdKk2jRLTM65UOEoKtsIZ8.jpg	\N	8618	\N	2019-04-07 02:36:42.420426	2020-07-02 13:58:32.387582	movie
61791	Rise of the Planet of the Apes	2011-08-04	/cjLsuP75UDlRdJVMXzXg3TJ4umX.jpg	\N	7063	\N	2019-04-07 02:37:51.648654	2020-07-02 13:58:32.395656	movie
9741	Unbreakable	2000-11-22	/kXkV3RKsSf49wbSnUerKZFMQORB.jpg	\N	4652	\N	2019-04-07 02:36:01.706711	2020-07-02 13:58:32.40356	movie
2253	Valkyrie	2008-12-25	/pndQEAoazVogH1LUW21sAy9FpzH.jpg	\N	1864	\N	2019-04-06 04:18:11.893804	2020-07-02 13:58:32.416363	movie
254	King Kong	2005-12-14	/qVCZtwBGls866wBb4PAfYtAjyr8.jpg	\N	4115	\N	2019-04-07 02:37:16.181049	2020-07-02 13:58:32.430912	movie
307081	Southpaw	2015-07-24	/r6QlMEQGNvM0YpbN04qhx5xdMiQ.jpg	\N	3330	\N	2019-04-07 02:37:42.227153	2020-07-02 13:58:32.444057	movie
49047	Gravity	2013-10-04	/nGdGlz45Vt2dJiX2AljerQDSwIM.jpg	\N	9277	\N	2019-04-07 02:37:49.018769	2020-06-21 21:36:20.713606	\N
8358	Cast Away	2000-12-22	/4x4puNUAqBpi9sUMYL5dNPSdB6I.jpg	\N	5784	\N	2019-04-06 04:18:28.315885	2020-07-02 13:58:32.460147	movie
64682	The Great Gatsby	2013-05-10	/nwJbVKauPDgJVQgT7SQpVTVN4gA.jpg	\N	6853	\N	2019-04-06 04:17:12.331192	2020-07-02 13:58:32.468015	movie
338766	Hell or High Water	2016-08-12	/ljRRxqy2aXIkIBXLmOVifcOR021.jpg	\N	2369	\N	2019-04-06 04:18:24.449874	2020-07-02 13:58:32.486713	movie
12405	Slumdog Millionaire	2008-11-12	/5WU6uusqJrLfiBaNs3KpF4o8Lnj.jpg	\N	5580	\N	2019-04-06 04:18:47.292075	2020-07-02 13:58:32.497414	movie
12162	The Hurt Locker	2009-06-25	/8SwjvOchYljr7tSKpNeHjpyPbg5.jpg	\N	2980	\N	2019-04-06 04:18:17.703436	2020-07-02 13:58:32.50695	movie
75780	Jack Reacher	2012-12-21	/zlyhKMi2aLk25nOHnNm43MpZMtQ.jpg	\N	4064	\N	2019-04-06 04:18:15.802744	2020-07-02 13:58:32.51902	movie
5915	Into the Wild	2007-09-21	/2MSGZEE6XZd2r4ODNziwAw7Hpw0.jpg	\N	5519	\N	2019-04-06 04:18:13.395037	2020-07-02 13:58:32.533885	movie
640	Catch Me If You Can	2002-12-25	/vG3YcgXuZABv7C8nd5bEyuMfyTQ.jpg	\N	6973	\N	2019-04-06 04:18:01.183591	2020-07-02 13:58:32.543467	movie
23168	The Town	2010-09-17	/9AxWBqQIAYA4WHP25fU5P1sWw06.jpg	\N	2301	\N	2019-04-06 04:17:56.469334	2020-07-02 13:58:32.554448	movie
22803	Law Abiding Citizen	2009-10-15	/zRAPh8EbzsXNrVsEbZa9VcKKf6L.jpg	\N	2502	\N	2019-04-06 04:17:54.940391	2020-07-02 13:58:32.564582	movie
296098	Bridge of Spies	2015-10-16	/fmOOjHAQzxr0c1sfcY4qkiSRBH6.jpg	\N	4185	\N	2019-04-06 04:17:43.422606	2020-07-02 13:58:32.574126	movie
185	A Clockwork Orange	1971-12-18	/4sHeTAp65WrSSuc05nRBKddhBxO.jpg	\N	6356	\N	2019-03-29 20:21:32.244044	2020-07-02 13:58:32.80034	movie
359940	Three Billboards Outside Ebbing, Missouri	2017-11-10	/vgvw6w1CtcFkuXXn004S5wQsHRl.jpg	\N	5127	\N	2019-03-29 20:21:47.982482	2020-07-02 13:58:32.807359	movie
58595	Snow White and the Huntsman	2012-06-01	/xUNnFwO7XfjvrQ2hFfIlPTwqzDk.jpg	\N	5101	\N	2019-04-06 04:17:09.868922	2020-07-02 13:58:32.021779	movie
314365	Spotlight	2015-11-06	/28Vnvn1WI1wJtP1kDqeRCZ1GdYm.jpg	\N	4769	\N	2019-04-06 04:17:18.940766	2020-07-02 13:58:32.030816	movie
197	Braveheart	1995-05-24	/or1gBugydmjToAEq7OZY0owwFk.jpg	\N	5326	\N	2019-04-06 04:15:18.62707	2020-07-02 13:58:32.040767	movie
11324	Shutter Island	2010-02-14	/kve20tXwUZpu4GUX8l6X7Z4jmL6.jpg	\N	12061	\N	2019-03-29 20:22:57.078224	2020-07-02 13:58:32.052764	movie
162	Edward Scissorhands	1990-12-07	/1RFIbuW9Z3eN9Oxw2KaQG5DfLmD.jpg	\N	7103	\N	2019-04-06 04:15:25.085083	2020-07-02 13:58:32.062511	movie
53182	300: Rise of an Empire	2014-03-07	/vWIq0BP43tgUy5faBbcTfCJX9fs.jpg	\N	3746	\N	2019-04-06 04:17:01.685865	2020-07-02 13:58:32.069975	movie
64690	Drive	2011-09-16	/602vevIURmpDfzbnv5Ubi6wIkQm.jpg	\N	6509	\N	2019-04-06 04:16:12.012722	2020-07-02 13:58:32.080462	movie
489	Good Will Hunting	1997-12-05	/bABCBKYBK7A5G1x0FzoeoNfuj2.jpg	\N	5437	\N	2019-03-29 20:23:14.024207	2020-07-02 13:58:32.090593	movie
1949	Zodiac	2007-03-02	/6YmeO4pB7XTh8P8F960O1uA14JO.jpg	\N	4039	\N	2019-04-06 04:16:21.291055	2020-07-02 13:58:32.098788	movie
6977	No Country for Old Men	2007-11-08	/6d5XOczc226jECq0LIX0siKtgHR.jpg	\N	5709	\N	2019-04-06 04:16:02.822282	2020-07-02 13:58:32.106317	movie
745	The Sixth Sense	1999-08-06	/fIssD3w3SvIhPPmVo4WMgZDVLID.jpg	\N	5917	\N	2019-04-06 04:14:57.532068	2020-07-02 13:58:32.123966	movie
7485	Shooter	2007-03-22	/fSpxlya2TQ4zXEcTdmN3bjtiSZJ.jpg	\N	2257	\N	2019-04-06 04:16:05.014304	2020-06-21 21:36:21.535016	\N
9475	Scent of a Woman	1992-12-23	/4adI7IaveWb7EidYXfLb3MK3CgO.jpg	\N	1316	\N	2019-04-06 04:15:35.234819	2020-07-02 13:58:32.133574	movie
453	A Beautiful Mind	2001-12-12	/mV4k9qlrdvECe4COBTN256FROR3.jpg	\N	5253	\N	2019-04-06 04:18:04.759075	2020-07-02 13:58:32.142604	movie
68718	Django Unchained	2012-12-25	/7oWY8VDWW7thTzWh3OKYRkWUlD5.jpg	\N	15230	\N	2019-04-06 04:15:03.411428	2020-07-02 13:58:32.15611	movie
787	Mr. & Mrs. Smith	2005-06-10	/wzIO3ytxeSNt1wRpXLIdkNbGoDm.jpg	\N	5471	\N	2019-04-06 04:15:21.355595	2020-07-02 13:58:32.16396	movie
1955	The Elephant Man	1980-10-02	/19Hc54ebzdvF3usVEmyn948U4Xr.jpg	\N	1405	\N	2019-03-29 20:23:42.717499	2020-07-02 13:58:32.172209	movie
603	The Matrix	1999-03-30	/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg	\N	13870	\N	2019-03-29 20:22:42.302428	2020-07-02 13:58:32.180881	movie
111	Scarface	1983-12-08	/nGY6NnlDsWaRKAycWUgXanqLxia.jpg	\N	5189	\N	2019-03-29 20:22:28.15937	2020-07-02 13:58:32.190081	movie
1422	The Departed	2006-10-05	/jyAgiqVSx5fl0NNj7WoGGKweXrL.jpg	\N	7555	\N	2019-03-29 20:22:11.333686	2020-07-02 13:58:32.199664	movie
548	Rashomon	1950-12-26	/mwNCpjejHwq9KlpNB2gKII2yvbr.jpg	\N	800	\N	2019-03-29 20:21:20.779252	2020-06-21 21:36:21.621886	\N
1124	The Prestige	2006-10-19	/pvSESD7ujxWZwtYDb9l57qE0ywq.jpg	\N	7821	\N	2019-03-29 20:21:58.432644	2020-07-02 13:58:32.209606	movie
1262	Stranger Than Fiction	2006-11-10	/frsmEKSW2T0lx5sU4w3m3GwPeeS.jpg	\N	1160	\N	2019-04-06 04:18:30.727286	2020-07-02 13:58:32.218465	movie
8619	Master and Commander: The Far Side of the World	2003-11-14	/s1cVTQEZYn4nSjZLnFbzLP0j8y2.jpg	\N	1428	\N	2019-04-07 02:37:40.812383	2020-07-02 13:58:32.295227	movie
154400	The Drop	2014-09-12	/pkOsCxsRmQZ0wWlYse5u6xDGfgW.jpg	\N	1194	\N	2019-04-06 04:17:15.564223	2020-07-02 13:58:32.012622	movie
1366	Rocky	1976-11-21	/i5xiwdSsrecBvO7mIfAJixeEDSg.jpg	\N	3558	\N	2019-04-06 04:17:47.036626	2020-07-02 13:58:32.306091	movie
103	Taxi Driver	1976-02-08	/ekstpH614fwDX8DUln1a2Opz0N8.jpg	\N	4982	\N	2019-04-06 04:16:58.158374	2020-07-02 13:58:32.815654	movie
315635	Spider-Man: Homecoming	2017-07-07	/kY2c7wKgOfQjvbqe7yVzLTYkxJO.jpg	\N	10849	\N	2019-04-07 02:36:11.342882	2020-07-02 13:58:32.831946	movie
568	Apollo 13	1995-06-30	/7ksHQG9qbEyPBBTAe8NfJVAipmJ.jpg	\N	2731	\N	2019-04-07 02:36:58.382122	2020-07-02 13:58:32.840311	movie
228150	Fury	2014-10-17	/pfte7wdMobMF4CVHuOxyu6oqeeA.jpg	\N	6423	\N	2019-04-07 02:37:00.745061	2020-07-02 13:58:32.850237	movie
1724	The Incredible Hulk	2008-06-12	/vcFeElC8eXI668WSIxcDNkJSBxv.jpg	\N	6107	\N	2019-05-06 16:42:04.854034	2020-07-02 13:58:31.843119	movie
102899	Ant-Man	2015-07-14	/fddtVEUozxvLmehR5yGZjem44pD.jpg	\N	11638	\N	2019-05-06 16:42:30.768054	2020-07-02 13:58:31.851591	movie
24428	The Avengers	2012-04-25	/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg	\N	19203	\N	2019-05-06 16:40:26.282431	2020-07-02 13:58:31.860186	movie
1726	Iron Man	2008-04-30	/78lPtwv72eTNqFW9COBYI0dWDJa.jpg	\N	15315	\N	2019-05-06 16:40:42.892108	2020-07-02 13:58:31.868609	movie
100402	Captain America: The Winter Soldier	2014-03-20	/tVFRpFw3xTedgPGqxW0AOI8Qhh0.jpg	\N	10715	\N	2019-05-06 16:41:53.669915	2020-07-02 13:58:31.876892	movie
76338	Thor: The Dark World	2013-10-29	/wp6OxE4poJ4G7c0U2ZIXasTSMR7.jpg	\N	9888	\N	2019-05-06 16:42:36.723592	2020-07-02 13:58:31.895045	movie
1116	The Wind That Shakes the Barley	2007-03-16	/hAOrgxv0V29KOQNisenD7TRhfdi.jpg	\N	303	\N	2019-05-06 16:37:00.155623	2020-07-02 13:58:31.914946	movie
381288	Split	2016-09-26	/lli31lYTFpvxVBeFHWoe5PMfW5s.jpg	\N	10106	\N	2019-05-06 16:42:49.307807	2020-07-02 13:58:31.932124	movie
10479	Rules of Engagement	2000-04-07	/8qU4Df4PXZUO8rYgEXlFkb5BBSs.jpg	\N	276	\N	2019-05-06 16:36:41.377813	2020-07-02 13:58:31.94916	movie
10195	Thor	2011-04-21	/prSfAi1xGrhLQNxVSUFh61xQ4Qy.jpg	\N	12432	\N	2019-05-06 16:42:14.476471	2020-06-21 21:36:20.094434	\N
271110	Captain America: Civil War	2016-04-27	/8xA9XQ6KfvXFKcNLNRWSPT39Gaz.jpg	\N	13648	\N	2019-05-06 16:40:28.672484	2020-07-02 13:58:31.962517	movie
99861	Avengers: Age of Ultron	2015-04-22	/4ssDuvEDkSArWEdyBl2X5EHvYKU.jpg	\N	13065	\N	2019-05-06 16:40:51.699692	2020-07-02 13:58:31.970792	movie
363676	Sully	2016-09-09	/5L29r3uwDe49XDMaK2xDkDht9t0.jpg	\N	3758	\N	2019-04-13 22:37:25.832551	2020-07-02 13:58:31.983792	movie
4942	Leatherheads	\N	/dl2yu8iuwG3dqbpjalm2odadRaH.jpg	A light hearted comedy about the beginnings of Professional American Football. When a decorated war hero and college all star is tempted into playing professional football. Everyone see the chance to make some big money, but when a reporter digs up some dirt on the war hero... everyone could lose out.	213	\N	2019-04-27 01:16:03.005249	2020-07-02 13:58:31.992764	movie
483906	Polar	2019-01-25	/qOBEpKVLl8Q9CZScbOcRRVISezV.jpg	\N	712	\N	2019-04-13 22:38:04.303271	2020-07-02 13:58:32.226929	movie
198663	The Maze Runner	2014-09-19	/ode14q7WtDugFDp78fo9lCsmay9.jpg	\N	10509	\N	2019-05-15 21:33:11.437427	2020-07-02 13:58:31.170369	movie
607	Men in Black	1997-07-02	/uLOmOF5IzWoyrgIF5MfUnh5pa1X.jpg	\N	7751	\N	2019-05-15 21:32:20.369214	2020-07-02 13:58:31.182184	movie
4415	Les Misérables	\N	/zyPZSyRWQGXe0usHOaYR2hyAA0S.jpg	Jean Valjean, a Frenchman imprisoned for stealing bread, must flee a police officer named Javert. The pursuit consumes both men's lives, and soon Valjean finds himself in the midst of the student revolutions in France.	273	\N	2019-04-13 22:36:47.355179	2020-06-21 21:54:12.704421	\N
456740	Hellboy	\N	/mpc7oxbiPQ0ICn0EEnaSOUf5Ag5.jpg	Hellboy comes to England, where he must defeat Nimue, Merlin's consort and the Blood Queen. But their battle will bring about the end of the world, a fate he desperately tries to turn away.	206	\N	2019-04-22 16:46:18.746797	2020-07-02 13:58:28.946252	movie
283995	Guardians of the Galaxy Vol. 2	2017-04-19	/y4MBh0EjBlMuOzv9axM4qJlmhzz.jpg	\N	12175	\N	2019-05-06 16:42:20.457019	2020-07-02 13:58:31.128488	movie
450465	Glass	\N	/svIDTNUoajS8dLEo7EosxvyAsgJ.jpg	In a series of escalating encounters, security guard David Dunn uses his supernatural abilities to track Kevin Wendell Crumb, a disturbed man who has twenty-four personalities. Meanwhile, the shadowy presence of Elijah Price emerges as an orchestrator who holds secrets critical to both men.	2332	\N	2019-04-22 16:47:00.680748	2020-07-02 13:58:31.683868	movie
455207	Crazy Rich Asians	\N	/1XxL4LJ5WHdrcYcihEZUCgNCpAW.jpg	An American-born Chinese economics professor accompanies her boyfriend to Singapore for his best friend's wedding, only to get thrust into the lives of Asia's rich and famous.	1370	\N	2019-04-23 07:17:04.404863	2020-07-02 13:58:31.694814	movie
13701	Immortal Beloved	\N	/meRFVzGpBJiObWfdtOoNr0UPsP4.jpg	The life and death of the legendary Ludwig van Beethoven. Beside all the work he is known for, the composer once wrote a famous love letter to a nameless beloved and the movie tries to find out who this beloved was. Not easy as Beethoven has had many women in his life.	141	\N	2019-04-27 01:15:11.519862	2020-07-02 13:58:31.703153	movie
454227	Outlaw King	2018-11-09	/rT49ousKUWN3dV7UlhaC9onTNdl.jpg	\N	587	\N	2019-05-06 16:37:26.606545	2020-07-02 13:58:31.711849	movie
363088	Ant-Man and the Wasp	2018-07-04	/eivQmS3wqzqnQWILHLc4FsEfcXP.jpg	\N	5926	\N	2019-05-06 16:40:39.402134	2020-07-02 13:58:31.734982	movie
1771	Captain America: The First Avenger	2011-07-22	/vSNxAJTlD0r02V9sPYpOjqDZXUK.jpg	\N	12459	\N	2019-05-06 16:40:45.057492	2020-07-02 13:58:31.743735	movie
284054	Black Panther	2018-02-13	/uxzzxijgPIY7slzFvMotPv8wjKA.jpg	\N	11915	\N	2019-05-06 16:41:00.285576	2020-07-02 13:58:31.754467	movie
284053	Thor: Ragnarok	2017-10-25	/rzRwTcFvttcN1ZpX2xv4j3tSdJu.jpg	\N	11033	\N	2019-05-06 16:41:55.81158	2020-07-02 13:58:31.76314	movie
335983	Venom	2018-09-28	/2uNW4WbgBXL25BAbXGLnLqX71Sw.jpg	\N	5878	\N	2019-05-06 16:42:07.455838	2020-07-02 13:58:31.7752	movie
335984	Blade Runner 2049	2017-10-04	/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg	\N	6542	\N	2019-05-06 16:42:42.14902	2020-07-02 13:58:31.790507	movie
383498	Deadpool 2	2018-05-10	/to0spRl1CMDvyUbOnbb4fTk3VAd.jpg	\N	8408	\N	2019-05-06 16:42:46.561444	2020-07-02 13:58:31.800512	movie
181808	Star Wars: The Last Jedi	2017-12-13	/kOVEVeg59E0wsnXmF9nrh6OmWII.jpg	\N	8346	\N	2019-05-06 16:43:07.835932	2020-07-02 13:58:31.811268	movie
8966	Twilight	2008-11-21	/3Rr0cXFjJ7GVvtaQKmFSMXHG9yr.jpg	\N	7178	\N	2019-05-06 16:37:06.638232	2020-07-02 13:58:31.822752	movie
615	The Passion of the Christ	\N	/oFuLM1EaKhi1WNWiTjQ1HKIZ1Eg.jpg	"The Passion of the Christ" is a film about the last 12 hours in the life of Jesus. Director Mel Gibson received much criticism from critics and audiences for his explicit depiction of and focus on violence and on Christ's suffering, especially on the part of the Jewish community. The film's languages are Arabic, Latin and Hebrew and it's actors are laymen which was controversially received as well.	1658	\N	2019-04-22 15:54:39.565118	2020-07-02 13:58:32.234765	movie
270010	A Hologram for the King	\N	/dDHJBd2iv7KTDzI7ybNLs31vvkM.jpg	Alan Clay, a struggling American businessman, travels to Saudi Arabia to sell a new technology to the King, only to be challenged by endless Middle Eastern bureaucracy, a perpetually absent monarch, and a suspicious growth on his back.	566	\N	2019-04-22 15:54:48.932061	2020-07-02 13:58:32.241927	movie
1585	It's a Wonderful Life	\N	/rgj6QjdyCeDrO9KGt1kusGyhvb2.jpg	A holiday favourite for generations...  George Bailey has spent his entire life giving to the people of Bedford Falls.  All that prevents rich skinflint Mr. Potter from taking over the entire town is George's modest building and loan company.  But on Christmas Eve the business's $8,000 is lost and George's troubles begin.	1965	\N	2019-04-22 16:09:37.665228	2020-07-02 13:58:32.251771	movie
299534	Avengers: Endgame	\N	/or06FN3Dka5tukK1e9sl16pB3iy.jpg	After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and restore order to the universe once and for all, no matter what consequences may be in store.	0	\N	2019-04-22 16:46:26.42052	2020-07-02 13:58:32.278699	movie
11128	Ladder 49	2004-10-01	/wJABwt3LuLk7PKmkV4cwNixMHov.jpg	\N	351	\N	2019-05-15 21:30:29.954041	2020-07-02 13:58:31.538208	movie
559	Spider-Man 3	2007-05-03	/2jLxKF73SAPkyhIWrnv67IH7kJ1.jpg	\N	7002	\N	2019-05-15 21:34:19.976542	2020-07-02 13:58:31.546943	movie
1930	The Amazing Spider-Man	2012-07-04	/jIfkQNARYyERqRAq1p1c8xgePp4.jpg	\N	10266	\N	2019-05-15 21:35:22.130181	2020-07-02 13:58:31.555047	movie
49521	Man of Steel	2013-06-14	/7rIPjn5TUK04O25ZkMyHrGNPgLx.jpg	\N	9641	\N	2019-05-15 21:34:22.773488	2020-07-02 13:58:31.563299	movie
608	Men in Black II	2002-07-03	/enA22EPyzc2WQ1VVyY7zxresQQr.jpg	\N	5591	\N	2019-05-15 21:34:17.69568	2020-07-02 13:58:31.572268	movie
137113	Edge of Tomorrow	2014-06-06	/uUHvlkLavotfGsNtosDy8ShsIYF.jpg	\N	7948	\N	2019-05-15 21:32:57.276993	2020-07-02 13:58:31.582087	movie
135397	Jurassic World	2015-06-12	/2c0ajTi8nvrsYl5Oi1lVi6F0kd2.jpg	\N	13910	\N	2019-05-15 21:34:36.503604	2020-07-02 13:58:31.590606	movie
18239	The Twilight Saga: New Moon	2009-11-20	/j5jM5pq78ObAXX1WhTsb115EkLl.jpg	\N	5079	\N	2019-05-14 16:07:51.581769	2020-07-02 13:58:31.598128	movie
209112	Batman v Superman: Dawn of Justice	2016-03-25	/5UsK3grJvtQrtzEgqNlDljJW96w.jpg	\N	11857	\N	2019-05-15 21:33:18.640751	2020-07-02 13:58:31.60567	movie
284052	Doctor Strange	2016-11-04	/gwi5kL7HEWAOTffiA14e4SbOGra.jpg	\N	12349	\N	2019-05-15 21:33:28.103085	2020-07-02 13:58:31.612791	movie
10675	Frantic	1988-02-26	/A29dWOdxYvqJRXBbjGt3633fxtm.jpg	\N	417	\N	2019-05-14 16:04:59.149062	2020-07-02 13:58:31.619677	movie
68721	Iron Man 3	2013-05-03	/qhPtAc1TKbMPqNvcdXSOn9Bn7hZ.jpg	\N	13942	\N	2019-05-15 21:32:37.933191	2020-07-02 13:58:31.62697	movie
218	The Terminator	1984-10-26	/qvktm0BHcnmDpul4Hz01GIazWPr.jpg	\N	6718	\N	2019-05-15 21:34:14.410783	2020-07-02 13:58:31.63389	movie
156022	The Equalizer	2014-09-26	/5tb6sejph4zJKC1vrkwPiA2EjXZ.jpg	\N	4903	\N	2019-05-15 21:34:33.841912	2020-07-02 13:58:31.645666	movie
22	Pirates of the Caribbean: The Curse of the Black Pearl	2003-07-09	/z8onk7LV9Mmw6zKz4hT6pzzvmvl.jpg	\N	12194	\N	2019-05-15 21:32:12.153625	2020-07-02 13:58:31.151302	movie
2019	Hard Target	1993-08-20	/x9HfOKWAB506jJVWo0z848SKDML.jpg	\N	408	\N	2019-05-14 16:07:00.985327	2020-07-02 13:58:31.652636	movie
140607	Star Wars: The Force Awakens	2015-12-18	/9rd002JS49RwDW944fF1wjU8iTV.jpg	\N	12503	\N	2019-05-15 21:33:02.333393	2020-07-02 13:58:31.659901	movie
293660	Deadpool	2016-02-12	/yGSxMiF0cYuAiyuve5DA6bnWEOI.jpg	\N	19931	\N	2019-05-15 21:33:31.898688	2020-07-02 13:58:31.667188	movie
119450	Dawn of the Planet of the Apes	2014-07-11	/ie14Sm0hRI5f7Te2KIfU64NyCPr.jpg	\N	6996	\N	2019-05-15 21:30:41.385638	2020-07-02 13:58:31.674907	movie
297762	Wonder Woman	2017-05-30	/imekS7f1OuHyUP2LAiTEM0zBzUz.jpg	\N	12293	\N	2019-05-06 16:43:46.546233	2020-07-02 13:58:32.004091	movie
246655	X-Men: Apocalypse	2016-05-27	/2mtQwJKVKQrZgTz49Dizb25eOQQ.jpg	\N	8180	\N	2019-05-15 21:34:53.55398	2020-07-02 13:58:30.196174	movie
19995	Avatar	2009-12-18	/6EiRUJpuoeQPghrs3YNktfnqOVh.jpg	\N	18451	\N	2019-05-15 21:32:29.54402	2020-07-02 13:58:31.159946	movie
58	Pirates of the Caribbean: Dead Man's Chest	2006-07-07	/AdRQGfT05z6L9gIpUpkh4McMmpm.jpg	\N	9262	\N	2019-05-15 21:35:04.507343	2020-07-02 13:58:31.191224	movie
10052	Dragonfly	2002-02-22	/3oovIyB7In2d5aR5FVdOYC2xXBK.jpg	\N	373	\N	2019-05-15 21:30:26.984557	2020-07-02 13:58:31.199006	movie
10138	Iron Man 2	2010-05-07	/6WBeq4fCfn7AN0o21W9qNcRF2l9.jpg	\N	12132	\N	2019-05-15 21:32:33.404435	2020-07-02 13:58:31.208343	movie
315837	Ghost in the Shell	2017-03-31	/myRzRzCxdfUWjkJWgpHHZ1oGkJd.jpg	\N	5064	\N	2019-05-15 21:31:49.67983	2020-06-21 21:36:19.977228	\N
2320	Executive Decision	1996-03-15	/m3CVqpSbvqvqNcY2dBjRQ44kN2l.jpg	\N	387	\N	2019-05-14 16:06:05.749454	2020-07-02 13:58:31.218966	movie
11967	Young Guns	1988-08-12	/5y7my8CrEPcW4IBpNwtfS6oPs4q.jpg	\N	407	\N	2019-05-14 16:07:28.401553	2020-07-02 13:58:31.227747	movie
12123	Chain Reaction	1996-08-02	/vWkF2tfnrRBHExZmGeOC9bM0siq.jpg	\N	444	\N	2019-05-14 16:06:39.28735	2020-07-02 13:58:31.236021	movie
38363	Fair Game	2010-05-20	/yHzv4lQYNV5FfOzf2sj6jm8MTQD.jpg	\N	379	\N	2019-05-14 16:07:06.338376	2020-07-02 13:58:31.246139	movie
127585	X-Men: Days of Future Past	2014-05-23	/bvN8iUpHyBIvniUk4e52SUZMA7Z.jpg	\N	9906	\N	2019-05-15 21:32:55.278103	2020-07-02 13:58:31.255711	movie
8984	Disclosure	1994-12-09	/m10Sx3ikuXhJomFnN3OYpkBpYEc.jpg	\N	392	\N	2019-05-14 16:06:16.72105	2020-06-21 21:36:20.06428	\N
330459	Rogue One: A Star Wars Story	2016-12-14	/5jX3p0apUG5bkMHtnKZch0xpkBS.jpg	\N	9141	\N	2019-05-06 16:44:09.99163	2020-07-02 13:58:31.263532	movie
574	The Man Who Knew Too Much	\N	/ug018KcUTmkpnIcaXz6Ei8ttWF5.jpg	A widescreen, Technicolor remake by Hitchcock of his 1934 film of the same title. A couple vacationing in Morocco with their young son accidentally stumble upon an assassination plot. When the child is kidnapped to ensure their silence, they have to take matters into their own hands to save him.	541	\N	2019-05-10 17:46:21.247725	2020-07-02 13:58:31.27375	movie
4836	Layer Cake	\N	/adTpRoxdz2Apw1Y7fT9wYkOHAw4.jpg	When a seemingly straight-forward drug deal goes awry, XXXX has to break his die-hard rules and turn up the heat, not only to outwit the old regime and come out on top, but to save his own skin...	878	\N	2019-05-15 21:30:13.022171	2020-07-02 13:58:31.28214	movie
324857	Spider-Man: Into the Spider-Verse	\N	/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg	Miles Morales is juggling his life between being a high school student and being a spider-man. When Wilson "Kingpin" Fisk uses a super collider, others from across the Spider-Verse are transported to this dimension.	3648	\N	2019-05-10 17:37:29.128556	2020-07-02 13:58:31.426701	movie
177572	Big Hero 6	2014-11-07	/2mxS4wUimwlLmI1xp6QW6NSU361.jpg	\N	10064	\N	2019-05-15 21:34:49.037706	2020-07-02 13:58:23.655878	movie
491472	At Eternity's Gate	\N	/7rUnZrcSyfwfloeI5aoccztSLSg.jpg	Famed but tormented artist Vincent van Gogh spends his final years in Arles, France, painting masterworks of the natural world that surrounds him.	450	\N	2019-05-10 17:53:23.27048	2020-07-02 13:58:31.447319	movie
78	Blade Runner	1982-06-25	/vfzE3pjE5G7G7kcZWrA3fnbZo7V.jpg	\N	7374	\N	2019-05-14 16:04:23.608038	2020-07-02 13:58:31.459082	movie
487558	BlacKkKlansman	2018-07-30	/55W6mUVv4CXMMQHHhV2zXtLSpXQ.jpg	\N	2920	\N	2019-05-14 16:05:55.519345	2020-07-02 13:58:31.469292	movie
16608	The Proposition	2006-06-09	/e4j7s9SzaJTfjkorMX1iY38IzZi.jpg	\N	328	\N	2019-05-14 16:06:35.980967	2020-07-02 13:58:31.483667	movie
429351	12 Strong	2018-01-19	/j18021qCeRi3yUBtqd2UFj1c0RQ.jpg	\N	1283	\N	2019-05-15 21:31:07.333354	2020-07-02 13:58:31.493795	movie
141052	Justice League	2017-11-17	/eifGNCSDuxJeS1loAXil5bIGgvC.jpg	\N	7387	\N	2019-05-15 21:33:13.426843	2020-07-02 13:58:31.502987	movie
348350	Solo: A Star Wars Story	2018-05-25	/3IGbjc5ZC5yxim5W0sFING2kdcz.jpg	\N	3713	\N	2019-05-15 21:33:42.769615	2020-07-02 13:58:31.51389	movie
351286	Jurassic World: Fallen Kingdom	2018-06-22	/c9XxwwhPHdaImA2f1WEfEsbhaFB.jpg	\N	5829	\N	2019-05-15 21:33:49.468229	2020-07-02 13:58:31.522159	movie
49026	The Dark Knight Rises	2012-07-20	/85cWkCVftiVs0BVey6pxX8uNmLt.jpg	\N	13763	\N	2019-05-14 16:06:50.788884	2020-07-02 13:58:31.530038	movie
1927	Hulk	2003-06-20	/qnngKqAcqfH2pBxDoKu5lxzSbTo.jpg	\N	3078	\N	2019-05-25 03:02:34.278881	2020-07-02 13:58:31.388741	movie
10632	The Hunted	2003-03-11	/iIl3l7BPenoVpdRJAqIXeIgMQvV.jpg	\N	314	\N	2019-05-18 00:21:39.604774	2020-07-02 13:58:31.402922	movie
388	Inside Man	2006-03-23	/mf4i9zZVXMmqWsEb9D0OAY7k3t.jpg	\N	2865	\N	2019-05-19 08:41:09.919244	2020-07-02 13:58:30.90722	movie
14292	Miracle	2004-02-06	/rzTvD3be2JkfCknloql6uHyum5F.jpg	\N	266	\N	2019-05-18 00:21:29.401473	2020-07-02 13:58:30.914584	movie
625	The Killing Fields	1984-11-02	/cPtW4lp8to8jMKHqhUWMMjWPmAG.jpg	\N	292	\N	2019-05-18 00:21:46.661037	2020-07-02 13:58:30.926199	movie
12690	Appaloosa	2008-09-12	/qLLUC8QaNx4BK1Vuf7XqSyd8icX.jpg	\N	477	\N	2019-05-18 00:20:18.422161	2020-07-02 13:58:30.937182	movie
9333	Last Man Standing	1996-09-20	/4yBM8DZmX5cGWAEIO6w9nCycJMe.jpg	\N	400	\N	2019-05-18 00:23:02.805685	2020-06-21 21:36:18.424716	\N
96721	Rush	2013-09-27	/uWcMgxO3p3qwVFUxsRz1HbTzGvT.jpg	\N	3823	\N	2019-05-25 03:00:39.309502	2020-07-02 13:58:30.94544	movie
11386	The Crying Game	1992-11-27	/kdaROz8u9vEBuebDN2NNgcx99Kb.jpg	\N	307	\N	2019-05-18 00:20:25.331549	2020-07-02 13:58:30.953841	movie
9594	Double Impact	1991-08-10	/tmzwvSqoMC37Tgqwj4mA2dHNSmw.jpg	\N	376	\N	2019-05-18 00:20:29.263874	2020-07-02 13:58:30.96263	movie
854	The Mask	1994-07-29	/yd3wjLLeQHJ3oRDy4wwiNNFVyLW.jpg	\N	5137	\N	2019-05-15 21:36:00.886051	2020-07-02 13:58:30.970422	movie
310	Bruce Almighty	2003-05-23	/3XJKBKh9Km89EoUEitVTSnrlAkZ.jpg	\N	6105	\N	2019-05-15 21:37:50.177892	2020-07-02 13:58:30.98082	movie
10648	Magnum Force	1973-12-24	/hvX2msiJR0bHCUkMgm1IoIBTQpG.jpg	\N	416	\N	2019-05-16 18:01:13.646041	2020-07-02 13:58:30.990076	movie
9611	Romy and Michele's High School Reunion	1997-04-25	/etg1pHDwJfWbr5XeOkVxErjBRld.jpg	\N	251	\N	2019-05-15 21:38:26.948674	2020-07-02 13:58:30.998585	movie
9942	Major League	1989-04-06	/AmkpKDT6Zk8tw5eGplUD1yH5p3W.jpg	\N	333	\N	2019-05-15 21:38:07.777681	2020-07-02 13:58:31.007248	movie
4011	Beetlejuice	1988-03-30	/nnl6OWkyPpuMm595hmAxNW3rZFn.jpg	\N	2943	\N	2019-05-15 21:37:27.839998	2020-07-02 13:58:31.015637	movie
10876	Quills	2000-11-22	/aR0sUb5zOh7VgQ2fUn5Aeqv7VQE.jpg	\N	239	\N	2019-05-18 00:23:17.787765	2020-07-02 13:58:31.024787	movie
4133	Blow	2001-04-05	/ii4sylRdQnLFPMCLhaER7vb0J6N.jpg	\N	2323	\N	2019-05-18 00:14:30.950816	2020-07-02 13:58:31.033282	movie
105	Back to the Future	1985-07-03	/7lyBcpYB0Qt8gYhXYaEZUNlNQAv.jpg	\N	10775	\N	2019-05-15 21:41:48.829552	2020-07-02 13:58:31.043658	movie
9566	The Fan	1996-08-15	/lu7CjP8YES5dJMCFg5O9o9jCkjl.jpg	\N	347	\N	2019-05-18 00:21:36.633145	2020-07-02 13:58:31.052209	movie
9909	Dangerous Minds	1995-08-11	/y2iKziYm1rG5AWfL3el7HgxhoIp.jpg	\N	427	\N	2019-05-18 00:21:22.960563	2020-07-02 13:58:31.059894	movie
82693	Silver Linings Playbook	2012-12-25	/y7iOVneBvITlBdhy6tVqXVOa1Js.jpg	\N	7537	\N	2019-05-15 21:36:27.250439	2020-07-02 13:58:31.067439	movie
11866	Flight of the Phoenix	2004-12-17	/pcj6unMsKCw0ogWFlUXmbc9gKap.jpg	\N	429	\N	2019-05-18 00:17:45.146501	2020-07-02 13:58:31.075322	movie
1891	The Empire Strikes Back	1980-05-20	/7BuH8itoSrLExs2YZSsM01Qk2no.jpg	\N	9688	\N	2019-05-15 21:41:07.396992	2020-07-02 13:58:31.084033	movie
426	Vertigo	1958-05-09	/15uOEfqBNTVtDUT7hGBVCka0rZz.jpg	\N	2461	\N	2019-05-15 21:41:53.693708	2020-07-02 13:58:31.095285	movie
808	Shrek	2001-05-16	/iB64vpL3dIObOtMZgX3RqdVdQDc.jpg	\N	8453	\N	2019-05-15 21:37:56.601176	2020-07-02 13:58:31.111116	movie
207703	Kingsman: The Secret Service	2015-02-13	/ay7xwXn1G9fzX9TUBlkGA584rGi.jpg	\N	10139	\N	2019-05-15 21:37:43.821081	2020-07-02 13:58:30.703361	movie
2105	American Pie	1999-07-09	/5P68by2Thn8wHAziyWGEw2O7hco.jpg	\N	4250	\N	2019-05-15 21:38:23.714185	2020-07-02 13:58:31.119455	movie
8764	Top Secret!	1984-06-08	/sV0iQ3CtlTJ9uhYu7qNql9EsPsA.jpg	\N	430	\N	2019-05-15 21:38:22.052703	2020-07-02 13:58:31.13648	movie
118340	Guardians of the Galaxy	2014-07-30	/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg	\N	17656	\N	2019-05-15 21:39:46.220524	2020-06-21 21:36:19.309788	\N
11418	National Lampoon's European Vacation	1985-07-25	/6AhVFxvDs2WZgfpC0bm2n2mshaa.jpg	\N	368	\N	2019-05-15 21:37:36.455326	2020-07-02 13:58:31.290368	movie
20352	Despicable Me	2010-07-09	/wqtH95Ri9Au2euC4p86lLoFCJQk.jpg	\N	9948	\N	2019-05-15 21:38:10.073705	2020-06-21 21:36:19.324652	\N
10328	Cocoon	1985-06-21	/wqNNm36j3nkucAucHEGAW5pNZcd.jpg	\N	566	\N	2019-05-15 21:37:33.979209	2020-07-02 13:58:30.710218	movie
2614	Innerspace	1987-06-30	/A4azclZQjqeQxXvcok3rdUmuq8a.jpg	\N	560	\N	2019-05-15 21:37:31.045019	2020-07-02 13:58:30.717109	movie
585	Monsters, Inc.	2001-11-01	/sgheSKxZkttIe8ONsf2sWXPgip3.jpg	\N	10643	\N	2019-05-15 21:37:22.183198	2020-07-02 13:58:30.723801	movie
862	Toy Story	1995-11-22	/uXDfjJbdP4ijW5hWSBrPrlKpxab.jpg	\N	10016	\N	2019-05-15 21:36:04.456319	2020-07-02 13:58:30.730644	movie
1402	The Pursuit of Happyness	2006-12-14	/flZzAgxkUY17x13MLjHuURgui1z.jpg	\N	5074	\N	2019-05-25 03:00:30.865398	2020-07-02 13:58:30.737948	movie
9093	The Four Feathers	2002-09-20	/jE5Fdoq2xZqfNEptdSXMJr1uN8x.jpg	\N	259	\N	2019-05-18 00:21:43.929554	2020-07-02 13:58:30.746444	movie
9587	Little Women	1994-12-21	/y0pO7ttoCot431dfyrJQMIUddBK.jpg	\N	472	\N	2019-05-18 00:20:58.087734	2020-06-21 21:36:21.940046	\N
75174	The Grey	\N	/a0Vt3wx8ciKmPt4iXPx9sH4HBVU.jpg	An oil drilling team struggles to survive after a plane crash strands them in the wilds of Alaska. Hunting them is a pack of wolves that sees them as intruders.	2265	\N	2019-05-25 02:36:03.74296	2020-07-02 13:58:30.753536	movie
2322	Sneakers	1992-09-09	/pY7wNO4J0QMAH9Q4nJL3QLlPVvC.jpg	\N	442	\N	2019-05-18 00:19:16.445142	2020-07-02 13:58:30.761884	movie
92591	Bernie	2012-04-27	/gDCYRqLONVy2OgrK86kHndKMSNu.jpg	\N	497	\N	2019-05-18 00:22:13.841254	2020-07-02 13:58:30.770533	movie
164457	Out of the Furnace	\N	/lP5dmVXryu8gQ05ox5XtEBaUH7G.jpg	Two brothers live in the economically-depressed Rust Belt, when a cruel twist of fate lands one in prison. His brother is then lured into one of the most violent crime rings in the Northeast.	1062	\N	2019-05-15 23:53:29.980485	2020-07-02 13:58:30.779168	movie
274870	Passengers	2016-12-21	/n5DpXC4ZxH4dnydcz7qav9iA4U.jpg	\N	7780	\N	2019-05-25 03:01:01.039388	2020-07-02 13:58:30.899025	movie
76341	Mad Max: Fury Road	2015-05-15	/sQuxceRcV3cxKH5CAnAUZe0qFKS.jpg	\N	14247	\N	2019-05-15 21:35:29.559777	2020-07-02 13:58:25.66481	movie
762	Monty Python and the Holy Grail	1975-03-14	/8AVb7tyxZRsbKJNOTJHQZl7JYWO.jpg	\N	2999	\N	2019-05-15 21:37:59.82752	2020-07-02 13:58:31.302693	movie
243938	Hot Tub Time Machine 2	2015-02-20	/tQtWuwvMf0hCc2QR2tkolwl7c3c.jpg	\N	500	\N	2019-05-15 21:38:16.178799	2020-07-02 13:58:31.311371	movie
9644	National Lampoon's Loaded Weapon 1	1993-02-04	/tIdlDgiVQ4kbgVXXIlP8LswubkN.jpg	\N	286	\N	2019-05-15 21:38:35.289049	2020-07-02 13:58:31.319915	movie
260513	Incredibles 2	2018-06-14	/9lFKBtaVIhP7E2Pk0IY1CwTKTMZ.jpg	\N	6154	\N	2019-05-19 11:53:41.214907	2020-07-02 13:58:31.328197	movie
446791	All the Money in the World	\N	/q6nE9Hf0ezszjI4DbCxwzQ73MMy.jpg	The story of the kidnapping of 16-year-old John Paul Getty III and the desperate attempt by his devoted mother to convince his billionaire grandfather Jean Paul Getty to pay the ransom.	1176	\N	2019-05-19 13:37:59.455703	2020-07-02 13:58:31.340053	movie
281338	War for the Planet of the Apes	2017-07-14	/ijQHiImv16vNSeZQsmih04kwn0C.jpg	\N	5197	\N	2019-05-25 03:02:49.824557	2020-07-02 13:58:31.349076	movie
399360	Alpha	2018-08-17	/afdZAIcAQscziqVtsEoh2PwsYTW.jpg	\N	1141	\N	2019-05-25 03:02:55.818025	2020-07-02 13:58:31.357115	movie
13811	Knowing	2009-03-20	/5XnNteYoOQ727JoZqyVcENT28Dv.jpg	\N	2709	\N	2019-05-25 03:03:01.963324	2020-07-02 13:58:31.367538	movie
273248	The Hateful Eight	2015-12-25	/nZeKw2oDiODgnht9OrohB2jBhjq.jpg	\N	7979	\N	2019-05-25 03:02:21.686954	2020-07-02 13:58:31.376718	movie
2675	Signs	2002-08-02	/hyZkNEbNgnciUVTyu4NZTjlCh4L.jpg	\N	2824	\N	2019-05-27 01:27:39.412772	2020-07-02 13:58:30.80878	movie
68724	Elysium	2013-08-09	/6hVMt55kzUHvxnc5lduqXyMh8VP.jpg	\N	5368	\N	2019-05-27 01:27:18.603649	2020-07-02 13:58:30.817542	movie
20662	Robin Hood	2010-05-14	/9NS5QGOfck24yL3bZqWeW06PgPC.jpg	\N	2546	\N	2019-05-27 01:27:20.119677	2020-06-21 21:34:49.170033	\N
168672	American Hustle	2013-12-12	/koXGRfatN0tURFWMA0Keb0p0Gtg.jpg	\N	4421	\N	2019-05-27 01:27:17.233198	2020-07-02 13:58:30.82479	movie
11322	Public Enemies	2009-07-01	/3KgtekisQBrHRsm2cD5UOB6Ce3k.jpg	\N	2292	\N	2019-05-27 01:27:10.55301	2020-07-02 13:58:30.83144	movie
819	Sleepers	1996-10-18	/urVlSfM8lVVKurnN5rWXx7t8Pz8.jpg	\N	1410	\N	2019-05-27 01:27:08.4583	2020-07-02 13:58:30.83875	movie
97630	Zero Dark Thirty	2012-12-19	/coeTvXKAYZlrcIfsCfYV5Hw1npu.jpg	\N	2532	\N	2019-05-27 01:28:26.061108	2020-07-02 13:58:30.845712	movie
2567	The Aviator	2004-12-17	/jOKRLQ3GWpMobI9BwOVaNZA8fpv.jpg	\N	2651	\N	2019-05-27 01:28:18.313857	2020-07-02 13:58:30.852712	movie
9693	Children of Men	2006-12-25	/6GnBsOIi1t4aGuLh3NF9TfU8u37.jpg	\N	3643	\N	2019-05-27 01:28:16.606896	2020-07-02 13:58:30.859522	movie
1372	Blood Diamond	2006-12-07	/m6rZ3dmqjcTvVNKtqwQ6hxYQ9nk.jpg	\N	3882	\N	2019-05-27 01:28:09.657992	2020-07-02 13:58:30.868289	movie
524	Casino	1995-11-22	/4TS5O1IP42bY2BvgMxL156EENy.jpg	\N	2418	\N	2019-05-27 01:28:11.508932	2020-06-21 21:34:50.108803	\N
1495	Kingdom of Heaven	2005-05-06	/3fQJxq26GU9a4dCQywZ6r8vgYKS.jpg	\N	2061	\N	2019-05-27 01:28:07.246599	2020-07-02 13:58:30.875205	movie
241	Natural Born Killers	1994-08-25	/1YATliAgjKOo9SvGWVwS3PujUFd.jpg	\N	1627	\N	2019-05-27 01:28:52.841282	2020-07-02 13:58:30.884255	movie
110415	Snowpiercer	2014-06-27	/9JPx09Rr0Txq2eSQfjq1DEBR5cx.jpg	\N	4702	\N	2019-05-27 01:27:53.228854	2020-06-21 21:34:50.123548	\N
581	Dances with Wolves	1990-11-09	/cvaBVpS0GzKqBd63pFT8f1E8OKv.jpg	\N	1954	\N	2019-05-27 01:28:47.387732	2020-07-02 13:58:30.891565	movie
2649	The Game	1997-09-12	/4UOa079915QjiTA2u5hT2yKVgUu.jpg	\N	2891	\N	2019-05-27 01:28:34.10499	2020-07-02 13:58:30.510841	movie
37165	The Truman Show	1998-06-05	/jW8w2QZnCSRblYWPc5FKAkS1cal.jpg	\N	9263	\N	2019-05-27 01:26:51.616403	2020-07-02 13:58:30.518379	movie
68734	Argo	2012-10-12	/rLneZNaulvXFfCJeJMy8gN2VvhQ.jpg	\N	5095	\N	2019-05-27 01:26:46.711801	2020-07-02 13:58:30.526116	movie
1813	The Devil's Advocate	1997-10-17	/5ZzBGpxy55OQzHxKVY11IpY6a0o.jpg	\N	2594	\N	2019-05-27 01:26:36.825249	2020-07-02 13:58:30.535953	movie
2668	Sleepy Hollow	1999-11-18	/660DFxWpSfZ1d1PruZ6Nd9vKXNE.jpg	\N	3433	\N	2019-05-27 01:26:38.507373	2020-06-21 21:34:51.343882	\N
369885	Allied	2016-11-23	/sV4lXM32quwminL3TP36nlNPp7Q.jpg	\N	2743	\N	2019-05-27 01:26:31.492611	2020-07-02 13:58:30.543403	movie
4982	American Gangster	2007-11-02	/8sV6nWuKczuXRt0C6EWoXqJAj6G.jpg	\N	2609	\N	2019-05-27 01:26:17.828716	2020-07-02 13:58:30.551167	movie
508	Love Actually	2003-11-07	/7QPeVsr9rcFU9Gl90yg0gTOTpVv.jpg	\N	3559	\N	2019-05-27 01:25:59.996985	2020-07-02 13:58:30.559361	movie
2924	Backdraft	1991-05-24	/bymJtYNIdiAiBR1LRetaJXbfryc.jpg	\N	606	\N	2019-05-27 01:25:36.545657	2020-07-02 13:58:30.569062	movie
1885	The Karate Kid	1984-06-22	/5HYCcuedxqW9ss4qSM4NVEDTnRj.jpg	\N	1721	\N	2019-05-27 01:25:38.707453	2020-06-21 21:34:51.380392	\N
840	Close Encounters of the Third Kind	1977-11-16	/kzD5ng3BvRUxW9vBfCkg61XjITR.jpg	\N	1987	\N	2019-05-27 01:25:28.900635	2020-07-02 13:58:30.576546	movie
561	Constantine	2005-02-18	/1y1n7ZVlNyol4U26yZZAnhcqqfb.jpg	\N	3223	\N	2019-05-27 01:24:18.457358	2020-07-02 13:58:30.583196	movie
1844	Entrapment	1999-04-30	/onEHQY4M22CluNfocJRGsVg0dK6.jpg	\N	983	\N	2019-05-25 05:28:44.711742	2020-07-02 13:58:30.590036	movie
72190	World War Z	2013-06-21	/aCnVdvExw6UWSeQfr0tUH3jr4qG.jpg	\N	9057	\N	2019-05-25 05:28:25.977264	2020-07-02 13:58:30.596851	movie
1640	Crash	2005-05-06	/86BdPC6RDX88NC880pLidKn2LCj.jpg	\N	1881	\N	2019-05-25 05:28:22.148265	2020-07-02 13:58:30.604216	movie
7840	10,000 BC	2008-03-05	/peOt178DNroZYzm2ncz9aZLzgB4.jpg	\N	1616	\N	2019-05-25 05:28:17.977365	2020-07-02 13:58:30.611271	movie
186	Lucky Number Slevin	2006-04-07	/x21s3p5wPww534nYj1cWakTcqz4.jpg	\N	2218	\N	2019-05-25 05:28:08.679197	2020-07-02 13:58:30.618526	movie
616	The Last Samurai	2003-12-05	/wwCOJtRAkn287NbWUtOTlYbiL4Z.jpg	\N	3373	\N	2019-05-25 05:27:41.603386	2020-07-02 13:58:30.6254	movie
2502	The Bourne Supremacy	2004-07-23	/7IYGiDrquvX3q7e9PV6Pejs6b2g.jpg	\N	4335	\N	2019-05-25 05:25:57.040033	2020-07-02 13:58:30.632796	movie
264660	Ex Machina	2015-04-10	/9goPE2IoMIXxTLWzl7aizwuIiLh.jpg	\N	7964	\N	2019-05-25 05:26:28.900148	2020-07-02 13:58:30.639922	movie
664	Twister	1996-05-10	/ba6Bg9mxphS24tpSe98vZccEe3S.jpg	\N	1569	\N	2019-05-25 05:28:03.262181	2020-07-02 13:58:30.646866	movie
193756	Lone Survivor	2013-12-24	/zaBIrloyhGK7iNTZMb3f9SARsl8.jpg	\N	2275	\N	2019-05-25 05:27:22.34254	2020-07-02 13:58:30.656142	movie
146	Crouching Tiger, Hidden Dragon	2000-12-08	/tKqJ6yWtOnTbiA2uzac2gejDqpI.jpg	\N	1576	\N	2019-05-25 05:27:47.688564	2020-06-21 21:36:16.764668	\N
300671	13 Hours: The Secret Soldiers of Benghazi	2016-01-15	/4qnEeVPM8Yn5dIVC4k4yyjrUXeR.jpg	\N	1551	\N	2019-05-25 05:26:54.281411	2020-07-02 13:58:30.667614	movie
10200	The Day the Earth Stood Still	2008-12-12	/mrw9NShY6I2FgXwk8Ge437pn08N.jpg	\N	1737	\N	2019-05-25 05:27:04.993198	2020-06-21 21:36:16.777066	\N
141	Donnie Darko	2001-10-26	/fhQoQfejY1hUcwyuLgpBrYs6uFt.jpg	\N	6664	\N	2019-05-25 05:27:50.777257	2020-07-02 13:58:30.674809	movie
205587	The Judge	2014-10-10	/tefUxj4Gg9hgQNgfEYd7kJQrIlD.jpg	\N	2335	\N	2019-05-25 05:26:06.108131	2020-07-02 13:58:30.681946	movie
14	American Beauty	1999-09-15	/wby9315QzVKdW9BonAefg8jGTTb.jpg	\N	6472	\N	2019-05-25 05:26:41.943648	2020-07-02 13:58:30.688854	movie
4553	The Machinist	2004-10-22	/yTJlby9UsRLvk1jCnnFqQikK8CS.jpg	\N	2394	\N	2019-05-25 05:27:31.132593	2020-07-02 13:58:30.696237	movie
1018	Mulholland Drive	2001-10-06	/tVxGt7uffLVhIIcwuldXOMpFBPX.jpg	\N	2930	\N	2019-05-27 01:25:51.748457	2020-07-02 13:58:30.787106	movie
76203	12 Years a Slave	2013-10-30	/xdANQijuNrJaw1HA61rDccME4Tm.jpg	\N	6565	\N	2019-05-25 05:26:49.017042	2020-07-02 13:58:30.31321	movie
37799	The Social Network	2010-10-01	/n0ybibhJtQ5icDqTp8eRytcIHJx.jpg	\N	6046	\N	2019-05-25 05:26:44.148915	2020-07-02 13:58:30.323954	movie
11036	The Notebook	2004-06-25	/rNzQyW4f8B8cQeg7Dgj3n6eT5k9.jpg	\N	6052	\N	2019-05-25 03:03:39.758484	2020-07-02 13:58:30.33218	movie
594	The Terminal	2004-06-17	/vRYbjHs129MARMq1VDbnk9Jboen.jpg	\N	3744	\N	2019-05-25 05:28:06.618905	2020-07-02 13:58:30.339709	movie
13537	Shattered Glass	2003-11-14	/1KHHNkrf8t15sXXF9d9TGq1T9jv.jpg	\N	187	\N	2019-05-26 02:16:14.753132	2020-07-02 13:58:30.34845	movie
300673	The Finest Hours	2016-01-29	/6UG91TJ4DKI6FGdqXZfDBeRZHX8.jpg	\N	937	\N	2019-05-25 05:28:50.129072	2020-07-02 13:58:30.355236	movie
275	Fargo	1996-03-08	/kKpORM0G7xDvJGQiXpQ0wUp9Dwo.jpg	\N	3842	\N	2019-05-27 01:27:30.787923	2020-06-21 21:39:41.995631	\N
9437	Kiss the Girls	1997-10-03	/25h5I3E3ydhazsPDnscWHivq5pn.jpg	\N	606	\N	2019-05-27 01:28:39.403559	2020-07-02 13:58:30.503484	movie
446354	The Post	2017-12-22	/h4XG3g6uMMPIBPjAoQhC2QIMdkl.jpg	\N	2481	\N	2019-05-27 01:26:26.748696	2020-07-02 13:58:30.794127	movie
1538	Collateral	2004-08-04	/iOpi3ut5DhQIbrVVjlnmfy2U7dI.jpg	\N	2521	\N	2019-05-25 05:25:51.311509	2020-07-02 13:58:30.297261	movie
2501	The Bourne Identity	2002-06-14	/vN6jGCuzefysLVFrzK3Vs6xAdu1.jpg	\N	5374	\N	2019-05-25 05:25:54.750916	2020-07-02 13:58:30.304567	movie
1579	Apocalypto	2006-12-08	/qbOG3FpCpuYFGhAbJWsAeZ603JF.jpg	\N	2275	\N	2019-05-27 01:27:40.77041	2020-07-02 13:58:30.801574	movie
282035	The Mummy	2017-06-06	/zxkY8byBnCsXodEYpK8tmwEGXBI.jpg	\N	4422	\N	2019-06-28 02:10:20.462514	2019-06-28 02:10:20.462514	\N
70160	The Hunger Games	2012-03-12	/mgZKtOvxtDX5HtUa5fAVQ5d1Afh.jpg	\N	14657	\N	2019-06-28 02:11:57.467607	2020-06-21 21:34:48.649879	\N
414	Batman Forever	1995-06-16	/k6EQ2OewzjF8TcPgok9wxpPAgXW.jpg	\N	2776	\N	2019-06-28 02:13:03.89852	2020-07-02 13:58:30.487348	movie
604	The Matrix Reloaded	2003-05-15	/aA5qHS0FbSXO8PxcxUIHbDrJyuh.jpg	\N	5763	\N	2019-06-28 02:12:55.960835	2020-07-02 13:58:30.495069	movie
49538	X-Men: First Class	2011-06-01	/8T1g9A31xolqkHQfcvIW0Px2Fb2.jpg	\N	8267	\N	2019-06-28 02:12:31.216647	2020-07-02 13:58:30.11632	movie
269149	Zootopia	2016-02-11	/hlK0e0wAQ3VLuJcsfIYPvb4JVud.jpg	\N	10040	\N	2019-06-28 02:12:27.03316	2020-07-02 13:58:30.124081	movie
85	Raiders of the Lost Ark	1981-06-12	/awUGN7ZCNq2EUTdpVaHDX23anOZ.jpg	\N	6667	\N	2019-06-28 02:12:20.558354	2020-07-02 13:58:30.131397	movie
419430	Get Out	2017-02-24	/qbaIViX3tgWSTSFXbldq0ODMdi4.jpg	\N	8842	\N	2019-06-28 02:12:07.129244	2020-07-02 13:58:30.138684	movie
9799	The Fast and the Furious	2001-06-22	/5En3O5t9LG8PfRaNs3vKfMdjQ1B.jpg	\N	5459	\N	2019-06-28 02:11:52.780563	2020-07-02 13:58:30.145866	movie
679	Aliens	1986-07-18	/xwdPTZyyBa4U3V2N0EmozTCeEAY.jpg	\N	5130	\N	2019-06-28 02:11:43.659878	2020-07-02 13:58:30.152853	movie
70981	Prometheus	2012-05-30	/qsYQflQhOuhDpQ0W2aOcwqgDAeI.jpg	\N	7433	\N	2019-06-28 02:11:38.460934	2020-07-02 13:58:30.16069	movie
329	Jurassic Park	1993-06-11	/9i3plLl89DHMz7mahksDaAo7HIS.jpg	\N	9083	\N	2019-06-28 02:09:57.994416	2020-07-02 13:58:30.169551	movie
280	Terminator 2: Judgment Day	1991-07-03	/1lB6KF7CDdaxykXdsd0y6ISNiOs.jpg	\N	6733	\N	2019-06-28 02:09:46.156912	2020-07-02 13:58:30.176308	movie
41154	Men in Black 3	2012-05-23	/e7kebbtwqzqam6l11aQNl7lXMs0.jpg	\N	6463	\N	2019-06-28 02:09:39.292881	2020-07-02 13:58:30.182866	movie
36658	X2	2003-04-24	/bWMw0FMsY8DICgrQnrTSWbzEgtr.jpg	\N	6194	\N	2019-06-28 02:11:24.224052	2020-06-21 21:34:48.741046	\N
557	Spider-Man	2002-05-01	/gh4cZbhZxyTbgxQPxD0dOudNPTn.jpg	\N	9947	\N	2019-06-28 02:09:24.741637	2020-07-02 13:58:30.189469	movie
109445	Frozen	2013-11-27	/kgwjIb2JDHRhNk13lmSxiClFjVk.jpg	\N	9836	\N	2019-06-28 02:08:34.704875	2020-07-02 13:58:30.202809	movie
22881	The Blind Side	2009-11-20	/bMgq7VBriuBFknXEe9E9pVBYGZq.jpg	\N	2854	\N	2019-06-22 01:22:01.945489	2020-07-02 13:58:30.210159	movie
1491	The Illusionist	2006-08-18	/4I1oOPHNrHLcvz3wTMuETJLws9z.jpg	\N	2731	\N	2019-06-15 04:46:03.758543	2020-07-02 13:58:30.219517	movie
36657	X-Men	2000-07-13	/bRDAc4GogyS9ci3ow7UnInOcriN.jpg	\N	6912	\N	2019-06-28 02:08:59.112179	2020-06-21 21:34:48.780542	\N
11778	The Deer Hunter	1978-12-08	/sj0SNprRmhWhfETBTkIJu55hM2F.jpg	\N	1736	\N	2019-06-14 20:19:49.217732	2020-07-02 13:58:30.226568	movie
13183	Watchmen	2009-03-05	/aZvOkdo203bm1kpcY0A0Tn074ER.jpg	\N	4992	\N	2019-06-28 02:12:52.229278	2020-07-02 13:58:30.240655	movie
652	Troy	2004-05-03	/kWj4RJzZeJGeyGA3DVGQiNkUjkt.jpg	\N	5440	\N	2019-06-28 17:01:52.223748	2020-07-02 13:58:30.247657	movie
64686	47 Ronin	2013-12-25	/xDHnmcroujCRG0ysYQaiswjbyHd.jpg	\N	2080	\N	2019-06-14 20:18:07.071503	2020-07-02 13:58:30.255057	movie
954	Mission: Impossible	1996-05-22	/lirMXnE7NoVLDr3qeqf48fR1mk4.jpg	\N	4760	\N	2019-06-28 02:11:34.300522	2020-06-21 21:34:50.973333	\N
2026	Hostage	2005-03-11	/4hne3v6jN4MlCnhSkxOW7YspJhr.jpg	\N	844	\N	2019-06-14 20:18:04.28666	2020-07-02 13:58:30.266643	movie
921	Cinderella Man	2005-06-02	/wkeOjIcpuqLMW4GnVowlM9VI0JE.jpg	\N	1110	\N	2019-06-11 04:09:49.810153	2020-07-02 13:58:30.274073	movie
628	Interview with the Vampire	1994-11-11	/t7NU8IcmcNBrlunCxiycX9JV7Rp.jpg	\N	2691	\N	2019-04-06 04:18:02.820326	2020-07-02 13:58:30.282832	movie
8587	The Lion King	1994-06-23	/sKCr78MXSLixwmZ8DyJLrpMsd15.jpg	\N	10160	\N	2019-06-14 20:18:04.566764	2020-06-21 21:34:51.005616	\N
274857	King Arthur: Legend of the Sword	2017-05-12	/gvSWdJN7peehxJYOugV9IwqiAFi.jpg	\N	3268	\N	2019-05-27 02:39:56.113827	2020-07-02 13:58:30.363983	movie
447404	Pokémon Detective Pikachu	2019-05-03	/wgQ7APnFpf1TuviKHXeEe3KnsTV.jpg	\N	937	\N	2019-05-29 02:18:59.528128	2020-07-02 13:58:30.370878	movie
9411	Fallen	1998-01-16	/wfzlDHojkX8NuTRMBeZG9FjEhOV.jpg	\N	594	\N	2019-06-01 01:26:57.748434	2020-06-21 21:34:51.281212	\N
2080	X-Men Origins: Wolverine	2009-04-28	/mQglrQzgZT0Oj9cQYPsLI8dsEqB.jpg	\N	6543	\N	2019-06-28 02:12:50.695457	2020-07-02 13:58:30.093506	movie
76170	The Wolverine	2013-07-23	/fvNIRADfDNihVNWx2JvBsaPYUow.jpg	\N	6198	\N	2019-06-28 02:12:46.065697	2020-07-02 13:58:30.100748	movie
14160	Up	2009-05-28	/rIfKIYMbwVlnAXOOaQRsm34GW3S.jpg	\N	12432	\N	2019-06-28 02:12:33.169775	2020-07-02 13:58:30.108211	movie
711	Finding Forrester	\N	/heHi6n68fDiQoUc7SMletM9Adjz.jpg	Gus Van Sant tells the story of a young African American man named Jamal who confronts his talents while living on the streets of the Bronx. He accidentally runs into an old writer named Forrester who discovers his passion for writing. With help from his new mentor Jamal receives a scholarship to a private school.	527	\N	2019-06-02 01:15:05.005646	2020-07-02 13:58:30.378004	movie
152603	Only Lovers Left Alive	\N	/kffoWJ7FfPRlFFBGixOMbq3blQp.jpg	A depressed musician reunites with his lover in the desolate streets of Detroit. Though their romance has endured several centuries, it is tested by the arrival of her capricious and unpredictable younger sister.	1048	\N	2019-06-04 02:37:49.048265	2020-07-02 13:58:30.385359	movie
25196	Crazy Heart	\N	/zwao2YMsqf27IzNEtDNWSe0W9jH.jpg	When reporter, Jean Craddock interviews Bad Blake—an alcoholic, seen-better-days country music legend—they connect, and the hard-living crooner sees a possible saving grace in a life with Jean and her young son.	473	\N	2019-06-15 04:45:41.458429	2020-07-02 13:58:30.392465	movie
15	Citizen Kane	1941-05-01	/sav0jxhqiH0bPr2vZFU0Kjt2nZL.jpg	\N	2414	\N	2019-06-22 01:38:46.564011	2020-07-02 13:58:30.399488	movie
299537	Captain Marvel	2019-03-06	/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg	\N	5963	\N	2019-06-28 02:06:02.234764	2020-07-02 13:58:30.406895	movie
333339	Ready Player One	2018-03-28	/pU1ULUq8D3iRxl1fdX2lZIzdHuI.jpg	\N	7140	\N	2019-06-28 02:08:28.98532	2020-07-02 13:58:30.414133	movie
500664	Upgrade	2018-06-01	/8fDtXi6gVw8WUMWGT9XFz7YwkuE.jpg	\N	1371	\N	2019-06-28 02:08:49.312912	2020-07-02 13:58:30.420879	movie
364	Batman Returns	1992-06-19	/jKBjeXM7iBBV9UkUcOXx3m7FSHY.jpg	\N	3216	\N	2019-06-28 02:09:49.870967	2020-07-02 13:58:30.427643	movie
126889	Alien: Covenant	2017-05-09	/zecMELPbU5YMQpC81Z8ImaaXuf9.jpg	\N	4994	\N	2019-06-28 02:09:53.099459	2020-07-02 13:58:30.434445	movie
564	The Mummy	1999-04-16	/yhIsVvcUm7QxzLfT6HW2wLf5ajY.jpg	\N	4984	\N	2019-06-28 02:13:07.967935	2020-07-02 13:58:30.441625	movie
353486	Jumanji: Welcome to the Jungle	2017-12-09	/bXrZ5iHBEjH7WMidbUDQ0U2xbmr.jpg	\N	7264	\N	2019-06-28 02:10:48.843023	2020-07-02 13:58:30.448219	movie
9806	The Incredibles	2004-11-05	/2LqaLgk4Z226KkgPJuiOQ58wvrm.jpg	\N	10704	\N	2019-06-28 02:11:15.409539	2020-07-02 13:58:30.45483	movie
427641	Rampage	2018-04-12	/MGADip4thVSErP34FAAfzFBTZ5.jpg	\N	3218	\N	2019-06-28 02:13:00.528967	2020-07-02 13:58:30.461595	movie
558	Spider-Man 2	2004-06-25	/olxpyq9kJAZ2NU1siLshhhXEPR7.jpg	\N	8076	\N	2019-06-28 02:13:17.188562	2020-07-02 13:58:30.472709	movie
36557	Casino Royale	2006-11-14	/ta2BX3THwYXytWuVVozaT0NsMM8.jpg	\N	6035	\N	2019-06-28 02:13:30.910919	2020-07-02 13:58:30.480776	movie
319389	Lovesick	\N	/cOnSzmvxiTPxGNTpNxVsZw83NE.jpg	The story of Charlie Darby, who has everything going for him: a great job, friends, family, the whole package. The one thing Charlie doesn't have is love, because every time he gets close, he goes clinically insane. When he meets the perfect girl, Charlie must overcome his psychosis to claim his chance at true love.	44	\N	2019-07-21 17:56:09.561274	2019-07-21 17:56:09.561274	\N
89941	Lovesick	\N	/5cnXKoXKT5YtO4y24PIaCfDwnCA.jpg	Ariel Lin is a girl who has love phobia caused by her HS ex-bfd who left her heart broken. She vows never to fall in love again but then she meets a handsome doctor in the hospital who seems to a perfect guy. Her new journey starts when she tries to show all women that the doctor is not that good as everyone thinks he is but fate is playing a trick on her. Because the more she does things to uncover the doctor, the more she discovers that he may be the right guy who can cure her phobia of love.	7	\N	2019-07-21 17:56:15.12464	2019-07-21 17:56:15.12464	\N
34584	The NeverEnding Story	1984-07-20	/jq67Zg1TVXNZxTvcXxfIdxK3IWV.jpg	\N	1962	\N	2019-06-28 20:42:35.108691	2020-06-21 21:34:47.924804	\N
39254	Real Steel	2011-10-06	/4GIeI5K5YdDUkR3mNQBoScpSFEf.jpg	\N	4591	\N	2019-06-28 20:40:05.643787	2020-07-02 13:58:29.962648	movie
1578	Raging Bull	1980-11-14	/rEviyDWNbAFmvvCPlkMRPAGUElG.jpg	\N	1866	\N	2019-06-28 20:39:39.770989	2020-07-02 13:58:29.972642	movie
792	Platoon	1986-12-19	/8hDlxJZYCJJLRHbSk7hsRQ9SNp7.jpg	\N	2158	\N	2019-06-28 20:39:23.99043	2020-07-02 13:58:29.97978	movie
8741	The Thin Red Line	1998-12-25	/seMydAaoxQP6F0xbE1jOcTmn5Jr.jpg	\N	1411	\N	2019-06-28 20:39:12.312388	2020-07-02 13:58:29.98711	movie
184	Jackie Brown	1997-12-24	/ewbLUXvm4riZL0aepy90o0vMesn.jpg	\N	3051	\N	2019-06-28 20:42:40.320301	2020-07-02 13:58:29.993906	movie
9944	The Pelican Brief	1993-12-16	/1V9B0fk3dh2Af2yUI5mAEETJNNT.jpg	\N	663	\N	2019-06-28 20:42:21.256495	2020-07-02 13:58:30.002547	movie
1359	American Psycho	2000-04-14	/AdBOkKdmeYLWDZ1b9PCpyesiudo.jpg	\N	4231	\N	2019-06-28 20:42:00.459018	2020-07-02 13:58:30.009534	movie
44264	True Grit	2010-12-22	/krK7cQms3FlJ3HPkvXC3YyEFP2K.jpg	\N	2840	\N	2019-06-28 20:41:42.264061	2020-07-02 13:58:30.017545	movie
192	The Name of the Rose	1986-09-24	/lJFoMOZoiISnBeKYKMlrzvu5PNy.jpg	\N	1475	\N	2019-06-28 20:41:06.196514	2020-07-02 13:58:30.026066	movie
1830	Lord of War	2005-09-16	/xEdwdFZRwrNAvTDx0fAV3MAInaA.jpg	\N	2290	\N	2019-06-28 20:38:52.101267	2020-07-02 13:58:30.033143	movie
18	The Fifth Element	1997-05-09	/fPtlCO1yQtnoLHOwKtWz7db6RGU.jpg	In 2257, a taxi driver is unintentionally given the task of saving a young girl who is part of the key that will ensure the survival of humanity.	6366	\N	2019-07-31 17:46:52.47762	2020-07-02 13:58:30.040023	movie
2666	Dark City	1998-02-27	/loNQRtd5IEqHLg9OxB2y8vgcXyn.jpg	A man struggles with memories of his past, including a wife he cannot remember, in a nightmarish world with no sun and run by beings with telekinetic powers who seek the souls of humans.	1377	\N	2019-07-21 17:01:03.201241	2020-07-02 13:58:30.04798	movie
9604	Red Heat	1988-06-17	/w5YExpX5rP5KtvY2HUZxwtMtZHV.jpg	\N	628	\N	2019-07-04 02:36:07.502032	2020-07-02 13:58:30.055278	movie
1620	Hitman	2007-11-21	/iOpwsMKTgQaw3eWFa4PiZ08Hv36.jpg	\N	1691	\N	2019-06-28 20:40:18.100001	2020-07-02 13:58:30.062601	movie
10474	The Basketball Diaries	1995-04-21	/9qX10tQz0hvppk30CDrz73fZTPQ.jpg	\N	877	\N	2019-06-28 20:40:50.714375	2020-07-02 13:58:30.071973	movie
153	Lost in Translation	2003-09-18	/yDY1LLuMdWA0xO09ciVeDHHJWFr.jpg	\N	3510	\N	2019-06-28 20:40:11.779658	2020-07-02 13:58:30.079126	movie
7007	Rising Sun	1993-07-30	/jVWEeZ383peKxwE284AdyHqq6GH.jpg	\N	329	\N	2019-06-28 20:39:57.796949	2020-07-02 13:58:30.086136	movie
500860	The Mustang	\N	/sXQzQcjNAYYosymYPVaXh1nYKaJ.jpg	While participating in a rehabilitation program training wild mustangs, a convict at first struggles to connect with the horses and his fellow inmates, but he learns to confront his violent past as he soothes an especially feisty horse.	36	\N	2019-06-28 20:23:57.082231	2020-07-02 13:58:30.289813	movie
137	Groundhog Day	1993-02-11	/gCgt1WARPZaXnq523ySQEUKinCs.jpg	\N	4046	\N	2019-06-28 20:39:01.629252	2020-07-02 13:58:29.638439	movie
403	Driving Miss Daisy	1989-12-13	/iaCzvcY42HihFxQBTZCTKMpsI0P.jpg	\N	650	\N	2019-06-28 20:36:45.148075	2020-07-02 13:58:29.645856	movie
9631	The Negotiator	1998-07-29	/8vQYiXMbK8t0fTCTGXbXo8NClqI.jpg	\N	975	\N	2019-07-13 03:08:07.421628	2020-07-02 13:58:29.653914	movie
65034	Too Big to Fail	\N	/y9sEFZRP9Aoie7sz0CdjAWoiIOt.jpg	An intimate look at the epochal financial crisis of 2008 and the powerful men and women who decided the fate of the world's economy in a matter of a few weeks.	96	\N	2019-07-04 03:15:29.455598	2020-07-02 13:58:29.661116	movie
2323	Field of Dreams	\N	/8PT4sAcneQ7MtZ1Mqoe2EyOJHmZ.jpg	Ray Kinsella is an Iowa farmer who hears a mysterious voice telling him to turn his cornfield into a baseball diamond. He does, but the voice's directions don't stop -- even after the spirits of deceased ballplayers turn up to play.	678	\N	2019-06-28 20:35:25.133885	2020-07-02 13:58:29.675874	movie
853	Enemy at the Gates	2001-03-16	/9cSoNnB31hGY2mL78VT8mAbz6nR.jpg	\N	1748	\N	2019-06-28 20:40:15.018998	2020-07-02 13:58:29.873759	movie
2108	The Breakfast Club	1985-02-15	/gp4zlj7wgbiofLMNsTPndMuO3PN.jpg	\N	4369	\N	2019-06-28 20:40:20.364971	2020-07-02 13:58:29.882763	movie
1587	What's Eating Gilbert Grape	1993-12-17	/8FxWgsfDNosewo7H65oE4QkOb7g.jpg	\N	1856	\N	2019-06-28 20:39:33.562129	2020-07-02 13:58:29.631318	movie
3131	Gangs of New York	2002-12-19	/lemqKtcCuAano5aqrzxYiKC8kkn.jpg	\N	3507	\N	2019-06-28 20:40:42.392434	2020-07-02 13:58:29.889882	movie
744	Top Gun	1986-05-16	/b7ubPzNej5vR4mfahk7jhP6yXQG.jpg	\N	3160	\N	2019-06-28 20:42:14.098203	2020-07-02 13:58:29.897858	movie
566228	The Inventor: Out for Blood in Silicon Valley	\N	/u21ImPnHHX2SFgkdHIjwlpEwRux.jpg	With a magical new invention that promised to revolutionize blood testing, Elizabeth Holmes became the world’s youngest self-made billionaire, heralded as the next Steve Jobs. Then, overnight, her 10-billion-dollar company dissolved. The rise and fall of Theranos is a window into the psychology of fraud.	47	\N	2019-07-04 03:41:16.505815	2020-07-02 13:58:29.905551	movie
324213	Love Sick	\N	\N	Will he catch up to the girl of his dreams before it's too late?	3	\N	2019-07-21 17:52:42.437882	2020-07-02 13:58:29.919532	movie
10637	Remember the Titans	2000-09-29	/825ohvC4wZ3gCuncCaqkWeQnK8h.jpg	\N	1334	\N	2019-06-28 20:41:56.085574	2020-07-02 13:58:29.93743	movie
380	Rain Man	1988-12-11	/8L6EMburnnVx8cvQmhGgC826JNc.jpg	\N	3186	\N	2019-06-28 20:41:09.094885	2020-07-02 13:58:29.945678	movie
11321	Seven Pounds	2008-12-18	/28lEV4CA93osYhxl2ZDqrgfWtMM.jpg	\N	3791	\N	2019-06-28 20:40:51.998992	2020-07-02 13:58:29.954463	movie
71357	Lovesick	\N	/dPV7l8vP1q8UcQJEvv96tNkptw1.jpg	Forget about accountants who want to fly, professors whose brains are being zapped by aliens and bored housewives passing the time. The one all-consuming problem Manhattan psychiatrist Saul Benjamin has is himself! Saul (Dudley Moore) and Chloe (Elizabeth McGovern), one of his patients, are in love. The situation could get him bounced from his profession but for lovers of romantic comedy, it's all delightful.	4	\N	2019-07-21 17:59:21.414251	2019-07-21 17:59:21.414251	\N
99970523	Dark	\N	/ajmkAwuK1TRFWMjKoSMgoAXbnc7.jpg	A missing child causes four families to help each other for answers. What they could not imagine is that this mystery would be connected to innumerable other secrets of the small town.	401	\N	2019-07-29 14:32:15.727215	2020-07-09 00:17:12.889671	tv
752	V for Vendetta	2006-02-23	/2ySXWBckQboalTZjhaLWRqc3gCN.jpg	In a world in which Great Britain has become a fascist state, a masked vigilante known only as “V” conducts guerrilla warfare against the oppressive British government. When V rescues a young woman from the secret police, he finds in her an ally with whom he can continue his fight to free the people of Britain.	12141	\N	2022-04-23 06:15:37.445123	2022-04-23 06:15:37.445123	movie
4944	Burn After Reading	2008-09-12	/jdwSkQu3XirmX18MNj8CqFWsCk.jpg	When a disc containing memoirs of a former CIA analyst falls into the hands of gym employees, Linda and Chad, they see a chance to make enough money for Linda to have life-changing cosmetic surgery. Predictably, events whirl out of control for the duo, and those in their orbit.	2342	\N	2019-07-31 16:02:03.020901	2020-07-02 13:58:29.776147	movie
881	A Few Good Men	1992-12-11	/rLOk4z9zL1tTukIYV56P94aZXKk.jpg	When cocky military lawyer Lt. Daniel Kaffee and his co-counsel, Lt. Cmdr. JoAnne Galloway, are assigned to a murder case, they uncover a hazing ritual that could implicate high-ranking officials such as shady Col. Nathan Jessep.	1632	\N	2019-07-31 16:04:27.181957	2020-07-02 13:58:29.783198	movie
318846	The Big Short	2015-12-11	/isuQWbJPbjybBEWdcCaBUPmU0XO.jpg	The men who made millions from a global economic meltdown.	4775	\N	2019-07-31 16:04:38.042477	2020-07-02 13:58:29.790282	movie
9208	Broken Arrow	1996-02-09	/2AlvHCeaZtFeR2H0IDoa2BmXOyK.jpg	When rogue stealth-fighter pilot Vic Deakins deliberately drops off the radar while on maneuvers, the Air Force ends up with two stolen nuclear warheads -- and Deakins's co-pilot, Riley Hale, is the military's only hope for getting them back. Traversing the deserted canyons of Utah, Hale teams with park ranger Terry Carmichael to put Deakins back in his box.	728	\N	2019-07-31 16:03:40.908541	2020-07-02 13:58:29.804039	movie
4614	The Sum of All Fears	2002-05-31	/3E4LW4bjRhEMDeeXeIsmkJ94v8K.jpg	When the president of Russia suddenly dies, a man whose politics are virtually unknown succeeds him. The change in political leaders sparks paranoia among American CIA officials, so CIA director Bill Cabot recruits a young analyst to supply insight and advice on the situation. Then the unthinkable happens: a nuclear bomb explodes in a U.S. city, and America is quick to blame the Russians.	755	\N	2019-07-31 16:03:07.312524	2020-07-02 13:58:29.812164	movie
146233	Prisoners	2013-09-21	/uhviyknTT5cEQXbn6vWIqfM4vGm.jpg	When Keller Dover's daughter and her friend go missing, he takes matters into his own hands as the police pursue multiple leads and the pressure mounts. But just how far will this desperate father go to protect his family?	5913	\N	2019-07-31 16:00:47.639202	2020-07-02 13:58:29.824883	movie
8321	In Bruges	2008-02-08	/jMiBBqk72VRo1Y39x2ZbbenEU3a.jpg	Ray and Ken, two hit men, are in Bruges, Belgium, waiting for their next mission. While they are there they have time to think and discuss their previous assignment. When the mission is revealed to Ken, it is not what he expected.	2512	\N	2019-07-31 16:03:10.456643	2020-07-02 13:58:29.833536	movie
369972	First Man	2018-10-12	/i91mfvFcPPlaegcbOyjGgiWfZzh.jpg	A look at the life of the astronaut, Neil Armstrong, and the legendary space mission that led him to become the first man to walk on the Moon on July 20, 1969.	2477	\N	2019-07-27 16:31:24.96247	2020-07-02 13:58:29.688793	movie
44835	Hesher	2010-01-22	/dD03azf3h1hUHVzVkkqJs96Kkay.jpg	A young boy has lost his mother and is losing touch with his father and the world around him. Then he meets Hesher who manages to make his life even more chaotic.	519	\N	2022-04-23 06:15:58.408376	2022-04-23 06:15:58.408376	movie
346672	Underworld: Blood Wars	2017-01-06	/sDupSRbqxJhSrjKQI33w7Fd8Owz.jpg	Vampire death dealer Selene fends off brutal attacks from both the Lycan clan and the Vampire faction that betrayed her. With her only allies, David and his father Thomas, she must stop the eternal war between Lycans and Vampires, even if it means she has to make the ultimate sacrifice.	2348	\N	2019-07-31 16:02:32.158411	2020-07-02 13:58:29.046441	movie
297802	Aquaman	2018-12-07	/5Kg76ldv7VxeX9YlcQXiowHgdX6.jpg	Once home to the most advanced civilization on Earth, Atlantis is now an underwater kingdom ruled by the power-hungry King Orm. With a vast army at his disposal, Orm plans to conquer the remaining oceanic people and then the surface world. Standing in his way is Arthur Curry, Orm's half-human, half-Atlantean brother and true heir to the throne.	6594	\N	2019-07-31 15:56:46.80884	2020-07-02 13:58:29.707365	movie
334541	Manchester by the Sea	2016-11-18	/e8daDzP0vFOnGyKmve95Yv0D0io.jpg	After his older brother passes away, Lee Chandler is forced to return home to care for his 16-year-old nephew. There he is compelled to deal with a tragic past that separated him from his family and the community where he was born and raised.	3250	\N	2019-07-31 15:59:47.779018	2020-07-02 13:58:29.715451	movie
395991	Only the Brave	2017-10-20	/rwJVB0muOMhkI5pTt9wwr4XCMBY.jpg	Members of the Granite Mountain Hotshots battle deadly wildfires to save an Arizona town.	627	\N	2019-07-31 16:00:56.599813	2020-07-02 13:58:29.73736	movie
235	Stand by Me	1986-08-08	/7QbJa6syM4ZYxtey0d7qB7bmhzb.jpg	After the death of a friend, a writer recounts a boyhood journey to find the body of a missing boy.	2919	\N	2019-07-31 16:01:05.278393	2020-07-02 13:58:29.744961	movie
416477	The Big Sick	2017-06-23	/qquEFkFbQX1i8Bal260EgGCnZ0f.jpg	Pakistan-born comedian Kumail Nanjiani and grad student Emily Gardner fall in love but struggle as their cultures clash. When Emily contracts a mysterious illness, Kumail finds himself forced to face her feisty parents, his family's expectations, and his true feelings.	1332	\N	2019-07-31 16:03:21.716567	2020-07-02 13:58:29.75208	movie
24	Kill Bill: Vol. 1	2003-10-10	/v7TaX8kXMXs5yFFGR41guUDNcnB.jpg	An assassin is shot by her ruthless employer, Bill, and other members of their assassination circle – but she lives to plot her vengeance.	9626	\N	2019-07-31 17:46:51.710192	2020-07-02 13:58:29.759755	movie
624	Easy Rider	1969-07-14	/xfCjoGUKbAX71XFm8cfu0jvAWeo.jpg	A cross-country trip to sell drugs puts two hippie bikers on a collision course with small-town prejudices.	881	\N	2019-07-31 16:03:33.427044	2020-07-02 13:58:29.768549	movie
9994546	Curb Your Enthusiasm	\N	/xBr9txlyX5ToPTS5n0tTcVvndhQ.jpg	The off-kilter, unscripted comic vision of Larry David, who plays himself in a parallel universe in which he can't seem to do anything right, and, by his standards, neither can anyone else.	277	\N	2019-08-03 22:44:49.865843	2020-07-09 00:17:12.927089	tv
8007	Behind Enemy Lines	2001-11-30	/2IVvws0ZuvOX4V4P6sisl6oVlj0.jpg	While flying a routine reconnaissance mission over Bosnia, fighter pilot Chris Burnett photographs something he wasn't supposed to see and gets shot down behind enemy lines, where he must outrun an army led by a ruthless Serbian general. With time running out and a deadly tracker on his trail, Burnett's commanding officer decides to risk his career and launch a renegade rescue mission to save his life.	715	\N	2019-07-31 16:04:09.923597	2020-07-02 13:58:29.7971	movie
495764	Birds of Prey (and the Fantabulous Emancipation of One Harley Quinn)	2020-02-05	/h4VB6m0RwcicVEZvzftYZyKXs6K.jpg	Harley Quinn joins forces with a singer, an assassin and a police detective to help a young girl who had a hit placed on her after she stole a rare diamond from a crime lord.	4857	\N	2020-07-08 19:41:49.810686	2020-07-08 19:41:49.810686	movie
99966732	Stranger Things	\N	/x2LSRK2Cm7MZhjluni1msVJ3wDF.jpg	When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.	2400	\N	2019-07-18 19:15:44.6153	2020-07-09 00:17:12.882845	tv
5176	3:10 to Yuma	2007-09-06	/voMB69AsLnPNmtfbrBl0lbeFKDH.jpg	In Arizona in the late 1800s, infamous outlaw Ben Wade and his vicious gang of thieves and murderers have plagued the Southern Railroad. When Wade is captured, Civil War veteran Dan Evans, struggling to survive on his drought-plagued ranch, volunteers to deliver him alive to the "3:10 to Yuma", a train that will take the killer to trial.	1885	\N	2019-08-03 17:27:21.965342	2020-07-02 13:58:29.45847	movie
296	Terminator 3: Rise of the Machines	2003-07-02	/jdG3l2e7kJ4bl91YLRLUAmvbZMX.jpg	It's been 10 years since John Connor saved Earth from Judgment Day, and he's now living under the radar, steering clear of using anything Skynet can trace. That is, until he encounters T-X, a robotic assassin ordered to finish what T-1000 started. Good thing Connor's former nemesis, the Terminator, is back to aid the now-adult Connor … just like he promised.	3609	\N	2019-07-31 17:51:02.299379	2020-07-02 13:58:29.466446	movie
562	Die Hard	1988-07-15	/aJCpHDC6RoGz7d1Fzayl019xnxX.jpg	NYPD cop John McClane's plan to reconcile with his estranged wife is thrown for a serious loop when, minutes after he arrives at her office, the entire building is overtaken by a group of terrorists. With little help from the LAPD, wisecracking McClane sets out to single-handedly rescue the hostages and bring the bad guys down.	6354	\N	2019-07-31 17:47:31.153606	2020-07-02 13:58:29.476307	movie
206647	Spectre	2015-11-06	/672kUEMtTHcaVYSVY4eiHEliHFa.jpg	A cryptic message from Bond’s past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.	6818	\N	2019-07-31 17:47:23.345773	2020-07-02 13:58:29.486656	movie
99979618	City on a Hill	\N	/gkapQgvgf9kH7VTr0dicsIRLoi.jpg	In early 90s Boston, an African-American District Attorney comes in from Brooklyn advocating change and forms an unlikely alliance with a corrupt yet venerated FBI veteran invested in maintaining the status quo. Together they take on a family of armored car robbers from Charlestown in a case that grows to encompass and eventually upend Boston’s city-wide criminal justice system.	7	\N	2019-08-16 20:08:03.513143	2020-07-09 00:17:12.939316	tv
99976479	The Boys	\N	/dzOxNbbz1liFzHU1IPvdgUR647b.jpg	A group of vigilantes known informally as “The Boys” set out to take down corrupt superheroes with no more than blue-collar grit and a willingness to fight dirty.	72	\N	2019-08-16 20:11:14.611247	2020-07-09 00:17:12.945203	tv
339403	Baby Driver	2017-06-28	/dN9LbVNNZFITwfaRjl4tmwGWkRg.jpg	After being coerced into working for a crime boss, a young getaway driver finds himself taking part in a heist doomed to fail.	8324	\N	2019-07-31 17:47:52.624424	2020-07-02 13:58:29.855996	movie
9991396	Breaking Bad	\N	/9PknVc5uubhVLZ6ofvfJAprM9UZ.jpg	When Walter White, a New Mexico chemistry teacher, is diagnosed with Stage III cancer and given a prognosis of only two years left to live. He becomes filled with a sense of fearlessness and an unrelenting desire to secure his family's financial future at any cost as he enters the dangerous world of drugs and crime.	3393	\N	2019-08-03 22:46:21.839575	2020-07-09 00:17:12.951138	tv
336890	Goon: Last of the Enforcers	2017-03-17	/emio9KDrLXqqX4wXa4YTacBQXG.jpg	During a pro lockout, Doug "The Thug" Glatt is injured and must choose whether to defend his team against a dangerous new enemy, or be there for his wife as she prepares to give birth to his daughter.	141	\N	2019-08-03 22:47:33.485929	2020-07-02 13:58:29.425998	movie
346910	The Predator	2018-09-14	/wMq9kQXTeQCHUZOG4fAe5cAxyUA.jpg	When a kid accidentally triggers the universe's most lethal hunters' return to Earth, only a ragtag crew of ex-soldiers and a disgruntled female scientist can prevent the end of the human race.	2133	\N	2019-07-31 17:48:46.554209	2020-07-02 13:58:29.865854	movie
9991438	The Wire	\N	\N	Told from the points of view of both the Baltimore homicide and narcotics detectives and their targets, the series captures a universe in which the national war on drugs has become a permanent, self-sustaining bureaucracy, and distinctions between good and evil are routinely obliterated.	824	\N	2019-08-03 22:46:27.501373	2020-07-09 00:17:12.896254	tv
999124067	Winning Time: The Rise of the Lakers Dynasty	\N	/npyfYUOoHWVZJyqI1jscbT6taCt.jpg	A fast-break series chronicling the professional and personal lives of the 1980s Los Angeles Lakers, one of sports’ most revered and dominant dynasties — a team that defined an era, both on and off the court.	8	\N	2022-04-23 19:33:11.31031	2022-04-23 19:33:11.31031	tv
332562	A Star Is Born	2018-10-03	/wrFpXMNBRj2PBiN4Z5kix51XaIZ.jpg	Seasoned musician Jackson Maine discovers — and falls in love with — struggling artist Ally. She has just about given up on her dream to make it big as a singer — until Jack coaxes her into the spotlight. But even as Ally's career takes off, the personal side of their relationship is breaking down, as Jack fights an ongoing battle with his own internal demons.	6143	\N	2019-08-16 20:17:19.837396	2020-07-02 13:58:29.51884	movie
99962668	Lovesick	\N	/5tzkaQSZtAvGCvrgjfkNt4tn8qF.jpg	After finding out he has an STI, Dylan must get back in touch with every girl he has ever had sex with to let them know the bad news.	35	\N	2019-08-03 22:44:03.497134	2020-07-09 00:17:12.902322	tv
9991399	Game of Thrones	\N	/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg	Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night's Watch, is all that stands between the realms of men and icy horrors beyond.	6188	\N	2019-08-03 20:49:56.602554	2020-07-09 00:17:12.908889	tv
9991420	New Girl	\N	/8oCqMlKKomCArVtyOjRzMN6g40Z.jpg	Jessica Day is an offbeat and adorable girl in her late 20s who, after a bad breakup, moves in with three single guys. Goofy, positive, vulnerable and honest to a fault, Jess has faith in people, even when she shouldn't. Although she's dorky and awkward, she's comfortable in her own skin. More prone to friendships with women, she's not used to hanging with the boys—especially at home.	426	\N	2019-08-03 22:44:23.90143	2020-07-09 00:17:12.914695	tv
9992710	It's Always Sunny in Philadelphia	\N	/AjyldoY2aGpe7jfBB3BxAqU5qai.jpg	Four egocentric friends who run a neighborhood Irish pub in Philadelphia try to find their way through the adult world of work and relationships. Unfortunately, their warped views and precarious judgments often lead them to trouble, creating a myriad of uncomfortable situations that usually only get worse before they get better.	405	\N	2019-08-03 22:44:39.693472	2020-07-09 00:17:12.920464	tv
99954344	The Leftovers	\N	/ri8xr223xBb2TeHX3GKypvQPV2B.jpg	When 2% of the world's population abruptly disappears without explanation, the world struggles to understand just what they're supposed to do about it. The drama series 'The Leftovers' is the story of the people who didn't make the cut.\n\nBased on the bestselling novel by Tom Perrotta, 'The Leftovers' follows Kevin Garvey, a father of two and the chief of police in a small New York suburb, as he tries to maintain some semblance of normalcy when the notion no longer applies.	387	\N	2019-08-03 22:46:04.814901	2020-07-09 00:17:12.933031	tv
99967744	Mindhunter	\N	/fbKE87mojpIETWepSbD5Qt741fp.jpg	An agent in the FBI's Elite Serial Crime Unit develops profiling techniques as he pursues notorious serial killers and rapists.	583	\N	2019-08-16 20:11:44.139929	2020-07-09 00:17:12.957701	tv
99942009	Black Mirror	\N	/pXeuSWSKgWUnhRFHZ4TjAUU8lbE.jpg	A contemporary British re-working of The Twilight Zone with stories that tap into the collective unease about our modern world. \n\nOver the last ten years, technology has transformed almost every aspect of our lives before we've had time to stop and question it. In every home; on every desk; in every palm - a plasma screen; a monitor; a smartphone - a black mirror of our 21st Century existence.	1363	\N	2019-08-21 07:38:11.749694	2020-07-09 00:17:12.98674	tv
99944217	Vikings	\N	/94gP9uXNdbypwCLORjeurlad15Z.jpg	Vikings follows the adventures of Ragnar Lothbrok, the greatest hero of his age. The series tells the sagas of Ragnar's band of Viking brothers and his family, as he rises to become King of the Viking tribes. As well as being a fearless warrior, Ragnar embodies the Norse traditions of devotion to the gods. Legend has it that he was a direct descendant of Odin, the god of war and warriors.	1674	\N	2019-08-21 07:38:32.297063	2020-07-09 00:17:12.992721	tv
9992316	The Office	\N	/qWnJzyZhyy74gjpSjIXWmuk0ifX.jpg	The everyday lives of office employees in the Scranton, Pennsylvania branch of the fictional Dunder Mifflin Paper Company.	644	\N	2019-08-31 23:07:33.578312	2020-07-09 00:17:13.018168	tv
99934307	Shameless	\N	/iRyQTp2L437k6zfFCvZSOWaxQFA.jpg	Chicagoan Frank Gallagher is the proud single dad of six smart, industrious, independent kids, who without him would be... perhaps better off. When Frank's not at the bar spending what little money they have, he's passed out on the floor. But the kids have found ways to grow up in spite of him. They may not be like any family you know, but they make no apologies for being exactly who they are.	875	\N	2019-09-18 01:52:24.104336	2020-07-09 00:17:13.030353	tv
99946533	The Americans	\N	/qB7WPVQnmODg2mZ1xUmPOrCa0wL.jpg	Set during the Cold War period in the 1980s, The Americans is the story of Elizabeth and Philip Jennings, two Soviet KGB officers posing as an American married couple in the suburbs of Washington D.C. and their neighbor, Stan Beeman, an FBI Counterintelligence agent.	409	\N	2019-10-07 15:10:21.198832	2020-07-09 00:17:13.055781	tv
99960573	Silicon Valley	\N	/dc5r71XI1gD4YwIUoEYCLiVvtss.jpg	In the high-tech gold rush of modern Silicon Valley, the people most qualified to succeed are the least capable of handling success. Partially inspired by Mike Judge’s own experiences as a Silicon Valley engineer in the late ‘80s, Silicon Valley is an American sitcom that centers around six programmers who are living together and trying to make it big in the Silicon Valley.	602	\N	2019-10-10 01:42:15.496413	2020-07-09 00:17:13.061687	tv
99960735	The Flash	\N	/wHa6KOJAoNTFLFtp7wguUJKSnju.jpg	After a particle accelerator causes a freak storm, CSI Investigator Barry Allen is struck by lightning and falls into a coma. Months later he awakens with the power of super speed, granting him the ability to move through Central City like an unseen guardian angel. Though initially excited by his newfound powers, Barry is shocked to discover he is not the only "meta-human" who was created in the wake of the accelerator explosion -- and not everyone is using their new powers for good. Barry partners with S.T.A.R. Labs and dedicates his life to protect the innocent. For now, only a few close friends and associates know that Barry is literally the fastest man alive, but it won't be long before the world learns what Barry Allen has become...The Flash.	2930	\N	2019-10-25 14:58:36.167276	2020-07-09 00:17:13.201944	tv
99984977	Russian Doll	\N	/1ju4vQ1EwlIkQxEgWiYmxOs3iBG.jpg	Nadia keeps dying and reliving her 36th birthday party. She's trapped in a surreal time loop -- and staring down the barrel of her own mortality.	408	\N	2022-04-23 19:31:02.017887	2022-04-23 19:31:02.017887	tv
99973107	Barry	\N	/2rdMty10eLffdDRPkHdc9VXNFJK.jpg	A hit man from the Midwest moves to Los Angeles and gets caught up in the city's theatre arts scene.	78	\N	2019-08-17 01:38:53.633595	2020-07-09 00:17:12.96331	tv
99967195	Legion	\N	/vT0Zsbm4GWd7llNjgWEtwY0CqOv.jpg	David Haller, AKA Legion, is a troubled young man who may be more than human. Diagnosed as schizophrenic, David has been in and out of psychiatric hospitals for years. But after a strange encounter with a fellow patient, he’s confronted with the possibility that the voices he hears and the visions he sees might be real.	596	\N	2019-08-16 20:12:05.504945	2020-07-09 00:17:12.969253	tv
11329	Runaway Jury	2003-10-09	/g58RA1zzE39KnkRpKRfgA5RxoXP.jpg	A juror on the inside and a woman on the outside manipulate a court trial involving a major gun manufacturer.	597	\N	2019-08-17 19:56:57.036187	2020-07-02 13:58:29.594924	movie
947	Lawrence of Arabia	1962-12-10	/vOEbimiBaTQr9SDFfDHHWCZdZK2.jpg	The story of British officer T.E. Lawrence's mission to aid the Arab tribes in their revolt against the Ottoman Empire during the First World War. Lawrence becomes a flamboyant, messianic figure in the cause of Arab unity but his psychological instability threatens to undermine his achievements.	1470	\N	2019-08-17 19:59:39.424507	2020-07-02 13:58:29.603122	movie
254320	The Lobster	2016-05-13	/vQ6NifiuDJ1HuFH04stzVojo3T.jpg	In a dystopian near future, single people, according to the laws of The City, are taken to The Hotel, where they are obliged to find a romantic partner in forty-five days or are transformed into beasts and sent off into The Woods.	3041	\N	2019-08-17 19:58:57.684409	2020-07-02 13:58:29.610248	movie
205775	In the Heart of the Sea	2015-12-11	/gLZEULfcS3uhfWDSEclOUgWiN41.jpg	In the winter of 1820, the New England whaling ship Essex was assaulted by something no one could believe: a whale of mammoth size and will, and an almost human sense of vengeance.  The real-life maritime disaster would inspire Herman Melville’s Moby Dick.  But that told only half the story.  “Heart of the Sea” reveals the encounter’s harrowing aftermath, as the ship’s surviving crew is pushed to their limits and forced to do the unthinkable to stay alive.  Braving storms, starvation, panic and despair, the men will call into question their deepest beliefs, from the value of their lives to the morality of their trade, as their captain searches for direction on the open sea and his first mate still seeks to bring the great whale down.	2190	\N	2019-08-17 20:02:57.685733	2020-07-02 13:58:29.617098	movie
858	Sleepless in Seattle	1993-06-24	/2RYvPaAj3EODzReumq9H4VbAMu0.jpg	A young boy who tries to set his dad up on a date after the death of his mother. He calls into a radio station to talk about his dad's loneliness which soon leads the dad into meeting a journalist, Annie who flies to Seattle, to write a story about the boy and his dad. Yet Annie ends up with more than just a story in this popular romantic comedy.	1160	\N	2019-08-17 20:01:43.846205	2020-07-02 13:58:29.624157	movie
109424	Captain Phillips	2013-10-11	/2x8ida0rHokUv80Ah4eBNb2eXas.jpg	The true story of Captain Richard Phillips and the 2009 hijacking by Somali pirates of the US-flagged MV Maersk Alabama, the first American cargo ship to be hijacked in two hundred years.	4010	\N	2019-08-17 20:02:49.088136	2020-07-02 13:58:29.161658	movie
117	The Untouchables	1987-06-03	/iK4twY48a1nVCez0qXE5w4JFvXw.jpg	Young Treasury Agent Elliot Ness arrives in Chicago and is determined to take down Al Capone, but it's not going to be easy because Capone has the police in his pocket. Ness meets Jimmy Malone, a veteran patrolman and probably the most honorable one on the force. He asks Malone to help him get Capone, but Malone warns him that if he goes after Capone, he is going to war.	2860	\N	2019-08-17 20:02:43.964926	2020-07-02 13:58:29.174012	movie
33909	Wall Street: Money Never Sleeps	2010-09-20	/oL95NntghnZsTrBPxaVU2QOLcJu.jpg	As the global economy teeters on the brink of disaster, a young Wall Street trader partners with disgraced former Wall Street corporate raider Gordon Gekko on a two tiered mission: To alert the financial community to the coming doom, and to find out who was responsible for the death of the young trader's mentor.	819	\N	2019-08-17 20:00:52.917943	2020-07-02 13:58:29.18356	movie
82633	Lawless	2012-08-29	/kmjy8rX4lY2x1UCJIH24VvUtDXJ.jpg	Set in the Depression-era Franklin County, Virginia, a bootlegging gang is threatened by authorities who want a cut of their profits.	1700	\N	2019-08-17 20:01:15.548262	2020-07-02 13:58:29.191501	movie
41733	Due Date	2010-11-04	/sBxWS09pOOyXZ0dcnqfqqCAQGan.jpg	Peter Highman must scramble across the US in five days to be present for the birth of his first child. He gets off to a bad start when his wallet and luggage are stolen, and put on the 'no-fly' list. Peter embarks on a terrifying journey when he accepts a ride from an actor.	3074	\N	2019-08-17 20:00:32.190026	2020-07-02 13:58:29.149879	movie
337170	American Made	2017-08-08	/23ILgoPSO5ShKcTZOuiTVfqFAUB.jpg	The true story of pilot Barry Seal, who transported contraband for the CIA and the Medellin cartel in the 1980s.	2264	\N	2019-08-17 01:39:05.575111	2020-07-02 13:58:29.542134	movie
440161	The Sisters Brothers	2018-09-21	/7Tl2nZ6uvmxwK14Skbf9VFHEHpX.jpg	Oregon, 1851. Hermann Kermit Warm, a chemist and aspiring gold prospector, keeps a profitable secret that the Commodore wants to know, so he sends the Sisters brothers, two notorious assassins, to capture him on his way to California.	678	\N	2019-08-17 19:58:32.408035	2020-07-02 13:58:29.553239	movie
9509	Man on Fire	2004-04-23	/grCGLCcTHv9TChibzOwzUpykcjB.jpg	Jaded ex-CIA operative John Creasy reluctantly accepts a job as the bodyguard for a 10-year-old girl in Mexico City. They clash at first, but eventually bond, and when she's kidnapped he's consumed by fury and will stop at nothing to save her life.	2603	\N	2019-08-17 20:01:12.404951	2020-07-02 13:58:29.560929	movie
409	The English Patient	1996-11-14	/yqaKkARc9Ku8mIENQt8bGVHaowJ.jpg	In the 1930s, Count Almásy is a Hungarian map maker employed by the Royal Geographical Society to chart the vast expanses of the Sahara Desert along with several other prominent explorers. As World War II unfolds, Almásy enters into a world of love, betrayal, and politics.	1027	\N	2019-08-17 20:01:31.744159	2020-07-02 13:58:29.568358	movie
261023	Black Mass	2015-09-18	/nSbpuyd2UySuW7kaoXzYUfes1Bl.jpg	The true story of Whitey Bulger, the brother of a state senator and the most infamous violent criminal in the history of South Boston, who became an FBI informant to take down a Mafia family invading his turf.	2073	\N	2019-08-17 20:03:22.420536	2020-07-02 13:58:29.579444	movie
2118	L.A. Confidential	1997-09-19	/6w1tl5bvnMVc8qenSwqUPFF4MKr.jpg	Three detectives in the corrupt and brutal L.A. police force of the 1950s use differing methods to uncover a conspiracy behind the shotgun slayings of the patrons at an all-night diner.	2363	\N	2019-08-17 19:57:41.955226	2020-07-02 13:58:29.586784	movie
9998592	Parks and Recreation	\N	/zyJpE27k5rjjwhwvxSeHenxF6GB.jpg	Hilarious ensemble comedy that follows Leslie Knope, a mid-level bureaucrat in the Parks and Recreation Department of Pawnee, Indiana, and her tireless efforts to make her quintessentially American town just a little bit more fun.	581	\N	2020-07-09 01:52:26.149341	2020-07-09 01:52:26.149341	tv
577922	Tenet	2020-08-22	/oh8XmxWlySHgGLlx8QOBmq9k72j.jpg	Armed with only one word - Tenet - and fighting for the survival of the entire world, the Protagonist journeys through a twilight world of international espionage on a mission that will unfold in something beyond real time.	7037	\N	2022-04-23 20:47:13.472763	2022-04-23 20:47:13.472763	movie
454	Romeo + Juliet	1996-11-01	/9ibvi4wGDyq3DcxIn7ShEMoODUg.jpg	In director Baz Luhrmann's contemporary take on William Shakespeare's classic tragedy, the Montagues and Capulets have moved their ongoing feud to the sweltering suburb of Verona Beach, where Romeo and Juliet fall in love and secretly wed. Though the film is visually modern, the bard's dialogue remains.	2842	\N	2019-08-17 20:04:37.9015	2020-07-02 13:58:29.24074	movie
955	Mission: Impossible II	2000-05-24	/12mI7kU22nJrmtAgGcDP8tbAz4a.jpg	With computer genius Luther Stickell at his side and a beautiful thief on his mind, agent Ethan Hunt races across Australia and Spain to stop a former IMF agent from unleashing a genetically engineered biological weapon called Chimera. This mission, should Hunt choose to accept it, plunges him into the center of an international crisis of terrifying magnitude.	3655	\N	2019-08-19 09:21:16.54054	2020-07-02 13:58:29.248783	movie
782	Gattaca	1997-10-24	/7jzm9QpoV7XrsNDf8YQEYxOy2AT.jpg	In a future society in the era of indefinite eugenics, humans are set on a life course depending on their DNA. Young Vincent Freeman is born with a condition that would prevent him from space travel, yet is determined to infiltrate the GATTACA space program.	3376	\N	2019-08-19 09:20:43.247782	2020-07-02 13:58:29.256682	movie
180	Minority Report	2002-06-21	/q8dbg0WhfbCJDCrfXWTOzJoVDnV.jpg	John Anderton is a top 'Precrime' cop in the late-21st century, when technology can predict crimes before they're committed. But Anderton becomes the quarry when another investigator targets him for a murder charge.	4744	\N	2019-08-19 09:20:21.671356	2020-07-02 13:58:29.264916	movie
161	Ocean's Eleven	2001-12-07	/v5D7K4EHuQHFSjveq8LGxdSfrGS.jpg	Less than 24 hours into his parole, charismatic thief Danny Ocean is already rolling out his next plan: In one night, Danny's hand-picked crew of specialists will attempt to steal more than $150 million from three Las Vegas casinos. But to score the cash, Danny risks his chances of reconciling with ex-wife, Tess.	6847	\N	2019-08-19 09:21:13.170806	2020-07-02 13:58:29.272815	movie
10764	Quantum of Solace	2008-10-31	/aSBIBTM2mLYLilRBW6XWVitXAKo.jpg	Quantum of Solace continues the adventures of James Bond after Casino Royale. Betrayed by Vesper, the woman he loved, 007 fights the urge to make his latest mission personal. Pursuing his determination to uncover the truth, Bond and M interrogate Mr. White, who reveals that the organization that blackmailed Vesper is far more complex and dangerous than anyone had imagined.	4590	\N	2019-08-19 09:18:39.051827	2020-07-02 13:58:29.280389	movie
4995	Boogie Nights	1997-10-10	/wnE24UPCPQsQnbBOu4zVE2qaDNm.jpg	Set in 1977, back when sex was safe, pleasure was a business and business was booming, idealistic porn producer Jack Horner aspires to elevate his craft to an art form. Horner discovers Eddie Adams, a hot young talent working as a busboy in a nightclub, and welcomes him into the extended family of movie-makers, misfits and hangers-on that are always around. Adams' rise from nobody to a celebrity adult entertainer is meteoric, and soon the whole world seems to know his porn alter ego, "Dirk Diggler". Now, when disco and drugs are in vogue, fashion is in flux and the party never seems to stop, Adams' dreams of turning sex into stardom are about to collide with cold, hard reality.	1517	\N	2019-08-17 20:03:50.646201	2020-07-02 13:58:29.288433	movie
2001	We Own the Night	2007-05-25	/rsKhSr3UNjG2DhVj2KPj0ARujez.jpg	A New York nightclub manager tries to save his brother and father from Russian mafia hitmen.	629	\N	2019-10-18 02:49:43.958392	2020-07-02 13:58:28.308754	movie
65	8 Mile	2002-11-08	/7BmQj8qE1FLuLTf7Xjf9sdIHzoa.jpg	The setting is Detroit in 1995. The city is divided by 8 Mile, a road that splits the town in half along racial lines. A young white rapper, Jimmy "B-Rabbit" Smith Jr. summons strength within himself to cross over these arbitrary boundaries to fulfill his dream of success in hip hop. With his pal Future and the three one third in place, all he has to do is not choke.	3544	\N	2019-08-17 20:03:39.956846	2020-07-02 13:58:29.296064	movie
25	Jarhead	2005-11-04	/4rCzaZy5Qkvxh5xaVpHriXSLTgC.jpg	Jarhead is a film about a US Marine Anthony Swofford’s experience in the Gulf War. After putting up with an arduous boot camp, Swofford and his unit are sent to the Persian Gulf where they are eager to fight, but are forced to stay back from the action. Swofford struggles with the possibility of his girlfriend cheating on him, and as his mental state deteriorates, his desire to kill increases.	1313	\N	2019-08-17 20:03:38.306271	2020-07-02 13:58:29.303279	movie
35588	Geronimo: An American Legend	1993-12-10	/rmbeg5wHVjC68G00SKQ0xZQpZru.jpg	The Apache Indians have reluctantly agreed to settle on a US Government approved reservation. Not all the Apaches are able to adapt to the life of corn farmers. One in particular, Geronimo, is restless. Pushed over the edge by broken promises and necessary actions by the government, Geronimo and thirty or so other warriors form an attack team which humiliates the government by evading capture, whi	71	\N	2019-08-19 09:16:44.986955	2020-07-02 13:58:29.311022	movie
388399	Patriots Day	2016-12-21	/mIDxsJTrOC7NhgOo3GziiHyKfsQ.jpg	In the aftermath of an unspeakable act of terror, Police Sergeant Tommy Saunders joins courageous survivors, first responders and investigators in a race against the clock to hunt down the Boston Marathon bombers before they strike again.	1386	\N	2019-08-17 20:04:28.187529	2020-07-02 13:58:29.199136	movie
686	Contact	1997-07-11	/bCpMIywuNZeWt3i5UMLEIc0VSwM.jpg	Contact is a science fiction film about an encounter with alien intelligence. Based on the novel by Carl Sagan the film starred Jodie Foster as the one chosen scientist who must make some difficult decisions between her beliefs, the truth, and reality.	2252	\N	2019-08-17 20:04:45.920831	2020-07-02 13:58:29.206768	movie
1368	First Blood	1982-10-22	/bbYNNEGLXrV3lJpHDg7CKaPscCb.jpg	When former Green Beret John Rambo is harassed by local law enforcement and arrested for vagrancy, the Vietnam vet snaps, runs for the hills and rat-a-tat-tats his way into the action-movie hall of fame. Hounded by a relentless sheriff, Rambo employs heavy-handed guerilla tactics to shake the cops off his tail.	2912	\N	2019-08-19 09:20:45.733346	2020-07-02 13:58:29.213901	movie
393	Kill Bill: Vol. 2	2004-04-16	/2yhg0mZQMhDyvUQ4rG1IZ4oIA8L.jpg	The Bride unwaveringly continues on her roaring rampage of revenge against the band of assassins who had tried to kill her and her unborn child. She visits each of her former associates one-by-one, checking off the victims on her Death List Five until there's nothing left to do … but kill Bill.	7781	\N	2019-08-19 09:20:50.977781	2020-07-02 13:58:29.222001	movie
587	Big Fish	2003-12-25	/tjK063yCgaBAluVU72rZ6PKPH2l.jpg	Throughout his life Edward Bloom has always been a man of big appetites, enormous passions and tall tales. In his later years, he remains a huge mystery to his son, William. Now, to get to know the real man, Will begins piecing together a true picture of his father from flashbacks of his amazing adventures.	3977	\N	2019-08-17 20:04:43.320779	2020-07-02 13:58:29.228791	movie
587792	Palm Springs	2020-01-26	/yf5IuMW6GHghu39kxA0oFx7Bxmj.jpg	When carefree Nyles and reluctant maid of honor Sarah have a chance encounter at a Palm Springs wedding, things get complicated as they are unable to escape the venue, themselves, or each other.	67	\N	2020-07-13 03:34:07.546664	2020-07-13 03:34:07.546664	movie
765119	The Bubble	2022-03-25	/edYk5TSowZIDv138bCpF5ls3XI5.jpg	Sneaking out. Hooking up. Melting down. The cast and crew of a blockbuster action franchise attempt to shoot a sequel while quarantining at a posh hotel.	169	\N	2022-04-23 22:53:58.507509	2022-04-23 22:53:58.507509	movie
5548	RoboCop	1987-07-17	/hHtOgGb3NihlyRATHlKPaFApbrd.jpg	In a violent, near-apocalyptic Detroit, evil corporation Omni Consumer Products wins a contract from the city government to privatize the police force. To test their crime-eradicating cyborgs, the company leads street cop Alex Murphy into an armed confrontation with crime lord Boddicker so they can use his body to support their untested RoboCop prototype. But when RoboCop learns of the company's nefarious plans, he turns on his masters.	2512	\N	2019-08-19 09:23:22.891346	2020-06-21 21:34:47.156073	\N
999118357	1883	\N	/waLbm384SQDwLTCn6ttPqQS5kfV.jpg	Follow the Dutton family as they embark on a journey west through the Great Plains toward the last bastion of untamed America. A stark retelling of Western expansion, and an intense study of one family fleeing poverty to seek a better future in America’s promised land — Montana.	108	\N	2022-04-23 22:58:29.191351	2022-04-23 22:58:29.191351	tv
99983631	What We Do in the Shadows	\N	/sI9Ys1MYtwwCPewWyyvJcz0s89t.jpg	A documentary-style look into the daily (or rather, nightly) lives of a group of vampires in Staten Island who have “lived” together for hundreds and hundreds of years.	296	\N	2022-04-23 23:02:01.881073	2022-04-23 23:02:01.881073	tv
534	Terminator Salvation	2009-05-20	/gw6JhlekZgtKUFlDTezq3j5JEPK.jpg	All grown up in post-apocalyptic 2018, John Connor must lead the resistance of humans against the increasingly dominating militaristic robots. But when Marcus Wright appears, his existence confuses the mission as Connor tries to determine whether Wright has come from the future or the past -- and whether he's friend or foe.	3805	\N	2019-08-19 09:21:53.300749	2020-07-02 13:58:29.31877	movie
163	Ocean's Twelve	2004-12-10	/oV3BVdY3UtEHRxpixmntpxHJwSc.jpg	Danny Ocean reunites with his old flame and the rest of his merry band of thieves in carrying out three huge heists in Rome, Paris and Amsterdam – but a Europol agent is hot on their heels.	4109	\N	2019-08-19 09:22:32.321264	2020-07-02 13:58:29.326148	movie
324668	Jason Bourne	2016-07-29	/xA7N41glw17MBQtcWSm2eBlBRuG.jpg	The most dangerous former operative of the CIA is drawn out of hiding to uncover hidden truths about his past.	3688	\N	2019-08-19 09:21:34.007009	2020-07-02 13:58:29.333369	movie
956	Mission: Impossible III	2006-05-04	/5l0hS4A119jCA1A02XsFZHq1uRD.jpg	Retired from active duty to train new IMF agents, Ethan Hunt is called back into action to confront sadistic arms dealer, Owen Davian. Hunt must try to protect his girlfriend while working with his new team to complete the mission.	3706	\N	2019-08-19 09:22:24.341957	2020-07-02 13:58:29.345211	movie
56292	Mission: Impossible - Ghost Protocol	2011-12-21	/7GCKNRbzcA4rJXAKoE8KS9IDnZP.jpg	Ethan Hunt and his team are racing against time to track down a dangerous terrorist named Hendricks, who has gained access to Russian nuclear launch codes and is planning a strike on the United States. An attempt to stop him ends in an explosion causing severe destruction to the Kremlin and the IMF to be implicated in the bombing, forcing the President to disavow them. No longer being aided by the government, Ethan and his team chase Hendricks around the globe, although they might still be too late to stop a disaster.	6257	\N	2019-08-19 09:21:19.61144	2020-07-02 13:58:29.352693	movie
99963247	Westworld	\N	/6aj09UTMQNyfSfk0ZX8rYOEsXL2.jpg	A dark odyssey about the dawn of artificial consciousness and the evolution of sin. Set at the intersection of the near future and the reimagined past, it explores a world in which every human appetite, no matter how noble or depraved, can be indulged.	1888	\N	2019-08-21 07:38:35.969446	2020-07-09 00:17:12.975036	tv
99960574	Peaky Blinders	\N	/jeWoeUQyHdxGFNZCrzbOUP78FiZ.jpg	A gangster family epic set in 1919 Birmingham, England and centered on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby, who means to move up in the world.	520	\N	2019-08-21 07:37:40.766346	2020-07-09 00:17:12.980866	tv
1572	Die Hard: With a Vengeance	1995-05-19	/7mBUd8Y6AhcdICaMnSV8UPtF8rc.jpg	New York detective John McClane is back and kicking bad-guy butt in the third installment of this action-packed series, which finds him teaming with civilian Zeus Carver to prevent the loss of innocent lives. McClane thought he'd seen it all, until a genius named Simon engages McClane, his new "partner" -- and his beloved city -- in a deadly game that demands their concentration.	3364	\N	2019-08-19 09:22:29.176139	2020-07-02 13:58:28.923234	movie
605	The Matrix Revolutions	2003-11-05	/cm14gG8xBghwIAy1GX0ryI2HA4U.jpg	The human city of Zion defends itself against the massive invasion of the machines as Neo fights to end the war at another front while also opposing the rogue Agent Smith.	5310	\N	2019-08-19 09:21:47.277985	2020-07-02 13:58:28.930328	movie
273481	Sicario	2015-09-18	/tw0lXhbNkklvseuJ4aYldkVyXV7.jpg	An idealistic FBI agent is enlisted by a government task force to aid in the escalating war against drugs at the border area between the U.S. and Mexico.	4601	\N	2019-08-19 09:21:22.759248	2020-07-02 13:58:28.938011	movie
36668	X-Men: The Last Stand	2006-05-24	/7RSSkRpwvkNN5iKO8zACtBA0KhQ.jpg	When a cure is found to treat mutations, lines are drawn amongst the X-Men—led by Professor Charles Xavier—and the Brotherhood, a band of powerful mutants organised under Xavier's former ally, Magneto.	6027	\N	2019-08-21 07:42:20.054578	2020-07-02 13:58:28.954274	movie
1487	Hellboy	2004-04-02	/pg6tCxOuON9vUqtoj8GJw1saklz.jpg	In the final days of World War II, the Nazis attempt to use black magic to aid their dying cause. The Allies raid the camp where the ceremony is taking place, but not before a demon—Hellboy—has already been conjured. Joining the Allied forces, Hellboy eventually grows to adulthood, serving the cause of good rather than evil.	4165	\N	2019-08-21 07:41:40.75588	2020-06-21 21:34:49.206894	\N
87421	Riddick	2013-09-06	/xhdDd6Gd6EaPBwNdCjNW2HCnIQY.jpg	Betrayed by his own kind and left for dead on a desolate planet, Riddick fights for survival against alien predators and becomes more powerful and dangerous than ever before. Soon bounty hunters from throughout the galaxy descend on Riddick only to find themselves pawns in his greater scheme for revenge. With his enemies right where he wants them, Riddick unleashes a vicious attack of vengeance before returning to his home planet of Furya to save it from destruction.	2910	\N	2019-08-19 09:24:09.773258	2020-07-02 13:58:28.964112	movie
1858	Transformers	2007-06-27	/oz7WsSLalkh60q1e0uzqqpbaB2g.jpg	Young teenager, Sam Witwicky becomes involved in the ancient struggle between two extraterrestrial factions of transforming robots – the heroic Autobots and the evil Decepticons. Sam holds the clue to unimaginable power and the Decepticons will stop at nothing to retrieve it.	6734	\N	2019-08-21 07:39:18.9374	2020-06-21 21:34:49.249792	\N
379	Miller's Crossing	1990-09-21	/ab3pnsTKp3BgcAFy0FgWBFBg9FL.jpg	Set in 1929, a political boss and his advisor have a parting of the ways when they both fall for the same woman.	768	\N	2019-08-21 07:35:10.516611	2020-07-02 13:58:28.974015	movie
16320	Serenity	2005-09-30	/4sqUOaPFoP2W81mq1UYqZqf5WzA.jpg	When the renegade crew of Serenity agrees to hide a fugitive on their ship, they find themselves in an action-packed battle between the relentless military might of a totalitarian regime who will destroy anything – or anyone – to get the girl back and the bloodthirsty creatures who roam the uncharted areas of space. But... the greatest danger of all may be on their ship.	2022	\N	2019-08-19 09:23:27.157116	2020-06-21 21:34:49.260782	\N
23483	Kick-Ass	2010-04-16	/2b3nofmXDfdn7bsM6zS9Upsa832.jpg	Dave Lizewski is an unnoticed high school student and comic book fan who one day decides to become a super-hero, even though he has no powers, training or meaningful reason to do so.	7741	\N	2019-08-23 06:35:56.618257	2020-07-02 13:58:28.981637	movie
45612	Source Code	2011-04-01	/AtQDTlj3MFOXJd5C9OopaRo3rRo.jpg	Decorated soldier Captain Colter Stevens wakes up in the body of an unknown man, discovering he's involved in a mission to find the bomber of a Chicago commuter train. He learns he's part of a top-secret experimental program that enables him to experience the final 8 minutes of another person's life. Colter re-lives the train incident over and over again, gathering more clues each time.	4700	\N	2019-08-19 09:22:55.589467	2020-07-02 13:58:28.988785	movie
76726	Chronicle	2012-02-02	/kdyrdFIt29FUmLIKvedAc2j4rpo.jpg	Three high school students make an incredible discovery, leading to their developing uncanny powers beyond their understanding. As they learn to control their abilities and use them to their advantage, their lives start to spin out of control, and their darker sides begin to take over.	3161	\N	2019-08-21 07:30:55.379031	2020-07-02 13:58:29.359618	movie
397538	Borg vs McEnroe	2017-10-24	/9jdg8VxleYb1DhPiEfHM7DzfvGw.jpg	The Swedish Björn Borg and the American John McEnroe, the best tennis players in the world, maintain a legendary duel during the 1980 Wimbledon tournament.	583	\N	2019-08-26 04:28:32.189909	2020-07-02 13:58:28.906187	movie
9869	Patriot Games	1992-06-04	/s6rjBhuGLnYqLNMdgwsjTsXbrAs.jpg	When CIA Analyst Jack Ryan interferes with an IRA assassination, a renegade faction targets Jack and his family as revenge.	752	\N	2019-08-19 09:23:06.695891	2020-07-02 13:58:28.914345	movie
9994613	Band of Brothers	\N	/bIBHeN4GkkNx0TBSiqGdqLSf4fd.jpg	Drawn from interviews with survivors of Easy Company, as well as their journals and letters, Band of Brothers chronicles the experiences of these men from paratrooper training in Georgia through the end of the war. As an elite rifle company parachuting into Normandy early on D-Day morning, participants in the Battle of the Bulge, and witness to the horrors of war, the men of Easy knew extraordinary bravery and extraordinary fear - and became the stuff of legend. Based on Stephen E. Ambrose's acclaimed book of the same name.	1481	\N	2019-08-31 23:07:11.832353	2020-07-09 00:17:12.998526	tv
9994607	Lost	\N	/jyGspygDXJMydTOJj7iWNx9Elyd.jpg	Stripped of everything, the survivors of a horrific plane crash  must work together to stay alive. But the island holds many secrets.	1334	\N	2019-08-31 23:07:22.39027	2020-07-09 00:17:13.004686	tv
11253	Hellboy II: The Golden Army	2008-07-11	/fGQAO4RgUzspO7L4u5KXirIn34s.jpg	An evil elf breaks an ancient pact between humans and creatures, and is on a mission to release 'The Golden Army', a deadly group of fighting machines that can destroy the human race. As Hell on Earth is ready to erupt, Hellboy and his crew set out to defeat prince and his army.	2955	\N	2019-08-31 23:06:35.831885	2020-07-02 13:58:29.055388	movie
277	Underworld	2003-09-19	/zsnQ41UZ3jo1wEeemF0eA9cAIU0.jpg	Vampires and werewolves have waged a nocturnal war against each other for centuries. But all bets are off when a female vampire warrior named Selene, who's famous for her strength and werewolf-hunting prowess, becomes smitten with a peace-loving male werewolf, Michael, who wants to end the war.	3966	\N	2019-08-31 23:12:51.426222	2020-06-21 00:18:19.080236	\N
1895	Star Wars: Episode III - Revenge of the Sith	2005-05-17	/xfSAoBEm9MNBjmlNcDYLvLSMlnq.jpg	The evil Darth Sidious enacts his final plan for unlimited power -- and the heroic Jedi Anakin Skywalker must choose a side.	7732	\N	2019-08-31 23:04:59.718798	2020-07-02 13:58:29.067197	movie
99983125	Cursed	\N	/wrLC5kx0nEq9U0MyJD7dnOT6m5F.jpg	In this fresh take on the Arthurian legend, teenager Nimue joins forces with mercenary Arthur on a quest to find Merlin and deliver an ancient sword.	215	\N	2020-07-27 00:13:05.941491	2020-07-27 00:13:05.941491	tv
1271	300	2007-03-07	/h7Lcio0c9ohxPhSZg42eTlKIVVY.jpg	Based on Frank Miller's graphic novel, "300" is very loosely based the 480 B.C. Battle of Thermopylae, where the King of Sparta led his army against the advancing Persians; the battle is said to have inspired all of Greece to band together against the Persians, and helped usher in the world's first democracy.	8390	\N	2019-08-31 23:07:55.625786	2020-07-02 13:58:29.083993	movie
101299	The Hunger Games: Catching Fire	2013-11-15	/7c1JtraYsjMMnk8Md0IMoyRzqZJ.jpg	Katniss Everdeen has returned home safe after winning the 74th Annual Hunger Games along with fellow tribute Peeta Mellark. Winning means that they must turn around and leave their family and close friends, embarking on a "Victor's Tour" of the districts. Along the way Katniss senses that a rebellion is simmering, but the Capitol is still very much in control as President Snow prepares the 75th Annual Hunger Games (The Quarter Quell) - a competition that could change Panem forever.	11542	\N	2019-08-31 23:07:18.875715	2020-07-02 13:58:29.092959	movie
2055	Open Range	2003-08-29	/d0zydHSE3kaidjDdlc4T6xnp113.jpg	A former gunslinger is forced to take up arms again when he and his cattle crew are threatened by a corrupt lawman.	475	\N	2019-08-31 22:58:00.241926	2020-07-02 13:58:29.112895	movie
165	Back to the Future Part II	1989-11-22	/hQq8xZe5uLjFzSBt4LanNP7SQjl.jpg	Marty and Doc are at it again in this wacky sequel to the 1985 blockbuster as the time-traveling duo head to 2015 to nip some McFly family woes in the bud. But things go awry thanks to bully Biff Tannen and a pesky sports almanac. In a last-ditch attempt to set things straight, Marty finds himself bound for 1955 and face to face with his teenage parents -- again.	7221	\N	2019-08-31 23:06:40.736683	2020-07-02 13:58:29.129661	movie
268	Batman	1989-06-23	/lH3dsbxA4wLalWKNYpVldX8zfPP.jpg	The Dark Knight of Gotham City begins his war on crime with his first major enemy being the clownishly homicidal Joker, who has seized control of Gotham's underworld.	3999	\N	2019-08-31 23:06:56.702211	2020-06-21 21:34:49.212403	\N
1894	Star Wars: Episode II - Attack of the Clones	2002-05-15	/oZNPzxqM2s5DyVWab09NTQScDQt.jpg	Following an assassination attempt on Senator Padmé Amidala, Jedi Knights Anakin Skywalker and Obi-Wan Kenobi investigate a mysterious plot that could change the galaxy forever.	7477	\N	2019-08-31 23:03:54.218622	2020-07-02 13:58:29.141623	movie
15487	The Greatest Game Ever Played	2005-09-30	/kh4vd6wKa6j9xVFzxhQrsT0p2YN.jpg	A biopic of 20-year-old Francis Ouimet who defeated his golfing idol and 1900 US Open Champion, Harry Vardon.	207	\N	2019-08-26 13:05:10.492327	2020-07-02 13:58:28.570839	movie
43074	Ghostbusters	2016-07-14	/l5I1r1QKZStgFYS1tM9bOTym6pd.jpg	Following a ghost invasion of Manhattan, paranormal enthusiasts Erin Gilbert and Abby Yates, nuclear engineer Jillian Holtzmann, and subway worker Patty Tolan band together to stop the otherworldly threat.	3926	\N	2019-08-31 23:03:11.173181	2020-06-21 21:34:49.239593	\N
531309	Brightburn	2019-05-24	/sJWwkYc9ajwnPRSkqj8Aue5JbKz.jpg	What if a child from another world crash-landed on Earth, but instead of becoming a hero to mankind, he proved to be something far more sinister?	710	\N	2019-08-31 22:21:09.926978	2020-07-02 13:58:29.003469	movie
297761	Suicide Squad	2016-08-03	/xFw9RXKZDvevAGocgBK0zteto4U.jpg	From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.	14014	\N	2019-08-31 23:03:17.205164	2020-07-02 13:58:28.55752	movie
479455	Men in Black: International	2019-06-12	/dPrUPFcgLfNbmDL8V69vcrTyEfb.jpg	The Men in Black have always protected the Earth from the scum of the universe. In this new adventure, they tackle their biggest, most global threat to date: a mole in the Men in Black organization.	752	\N	2019-08-26 20:05:16.688406	2020-07-02 13:58:28.996039	movie
285	Pirates of the Caribbean: At World's End	2007-05-19	/bXb00CkHqx7TPchTGG131sWV59y.jpg	Captain Barbossa, long believed to be dead, has come back to life and is headed to the edge of the Earth with Will Turner and Elizabeth Swann. But nothing is quite as it seems.	8656	\N	2019-08-31 23:08:20.127677	2020-07-02 13:58:29.029292	movie
11468	The Salton Sea	2002-02-02	/i3InMSlLUNBEdQTKazMdyVP1ryX.jpg	After the murder of his beloved wife, a man in search of redemption is set adrift in a world where nothing is as it seems. On his journey, he befriends slacker Jimmy "The Finn", becomes involved in rescuing his neighbor Colette from her own demons, and gets entangled in a web of deceit full of unexpected twists and turns.	171	\N	2019-08-31 22:58:01.823668	2020-07-02 13:58:29.038109	movie
99987108	Chernobyl	\N	/hlLXt2tOPT6RRnjiUmoxyG1LTFi.jpg	A dramatization of the true story of one of the worst man-made catastrophes in history, the catastrophic nuclear accident at Chernobyl. A tale of the brave men and women who sacrificed to save Europe from unimaginable disaster.	537	\N	2019-09-09 13:55:05.359635	2020-07-09 00:17:13.024164	tv
547016	The Old Guard	2020-07-10	/cjr4NWURcVN3gW5FlHeabgBHLrY.jpg	Four immortal mercenaries who've secretly protected humanity for centuries become targeted for their mysterious powers just as they discover a new immortal.	453	\N	2020-07-13 05:05:30.503601	2020-07-13 05:05:30.503601	movie
66	Absolute Power	1997-02-14	/xX9gmwtnTi0Y8WcTF7Jsg9Hdp6W.jpg	A master thief coincidentally is robbing a house where a murder—in which the President of The United States is involved—occurs in front of his eyes. He is forced to run, while holding evidence that could convict the President.	422	\N	2019-09-05 20:25:12.070234	2020-07-02 13:58:28.71345	movie
2062	Ratatouille	2007-06-22	/npHNjldbeTHdKKw28bJKs7lzqzj.jpg	A rat named Remy dreams of becoming a great French chef despite his family's wishes and the obvious problem of being a rat in a decidedly rodent-phobic profession. When fate places Remy in the sewers of Paris, he finds himself ideally situated beneath a restaurant made famous by his culinary hero, Auguste Gusteau. Despite the apparent dangers of being an unlikely - and certainly unwanted - visitor in the kitchen of a fine French restaurant, Remy's passion for cooking soon sets into motion a hilarious and exciting rat race that turns the culinary world of Paris upside down.	9499	\N	2019-09-12 16:39:53.69805	2020-07-02 13:58:28.724271	movie
834	Underworld: Evolution	2006-01-20	/oJaQG353uOzOqffQ5K2hg03k4Vp.jpg	As the war between the vampires and the Lycans rages on, Selene, a former member of the Death Dealers (an elite vampire special forces unit that hunts werewolves), and Michael, the werewolf hybrid, work together in an effort to unlock the secrets of their respective bloodlines.	2416	\N	2019-08-31 23:13:36.325544	2020-07-02 13:58:28.738083	movie
12437	Underworld: Rise of the Lycans	2009-01-23	/6pLPWF7AXhljLJf8WTli9BuVfyv.jpg	A prequel to the first two Underworld films, this fantasy explains the origins of the feud between the Vampires and the Lycans. Aided by his secret love, Sonja, courageous Lucian leads the Lycans in battle against brutal Vampire king Viktor. Determined to break the king's enslavement of his people, Lucian faces off against the Death Dealer army in a bid for Lycan independence.	2218	\N	2019-08-31 23:12:56.728327	2020-07-02 13:58:28.747851	movie
52520	Underworld: Awakening	2012-01-19	/7RhbiSYegjZbVsxuJzX77SqmU9g.jpg	Having escaped years of imprisonment, vampire warrioress Selene finds herself in a changed world where humans have discovered the existence of both Vampire and Lycan clans and are conducting an all-out war to eradicate both immortal species. Now Selene must battle the humans and a frightening new breed of super Lycans to ensure the death dealers' survival.	2649	\N	2019-08-31 23:13:23.451138	2020-07-02 13:58:28.766011	movie
687	Dead Man Walking	1995-12-29	/wQmmJi5ypfHH2boXrQBmsep7qb2.jpg	A justice drama based on a true story about a man on death row who in his last days forms a strong relationship with a nun who teaches him forgiveness and gives him spirituality as she accompanies him to his execution.	680	\N	2019-09-13 20:50:40.101572	2020-07-02 13:58:28.794311	movie
11973	Thirteen Days	2000-12-24	/aLx9UXH9fK2v6NDMvMyW4X88K3u.jpg	The story of the Cuban Missile Crisis in 1962—the nuclear standoff with the USSR sparked by the discovery by the Americans of missile bases established on the Soviet-allied island of Cuba.	334	\N	2019-09-12 16:36:10.011935	2020-07-02 13:58:28.802795	movie
10668	Suicide Kings	1998-04-17	/rQ2Sidqubi7XiHDScFe1faIz3Uv.jpg	Charlie, a former mobster, is abducted by five privileged young men desperate to raise a $2 million ransom to save the sister of a friend. As Charlie plays mind games, however, his captors splinter -- each wondering whether one of their own had a hand in the crime.	128	\N	2019-09-02 09:23:13.382234	2020-07-02 13:58:28.579312	movie
506574	Descendants 3	2019-08-09	/7IRy0iHdaS0JI3ng4ZYlk5gLSFn.jpg	The teenagers of Disney's most infamous villains return to the Isle of the Lost to recruit a new batch of villainous offspring to join them at Auradon Prep.	251	\N	2019-09-05 15:05:33.30865	2020-07-02 13:58:28.590548	movie
514999	Murder Mystery	2019-06-14	/bSMSO9xupd4R4vwTPqigHn2quLN.jpg	After attending a gathering on a billionaire's yacht during a European vacation, a New York cop and his wife become prime suspects when he's murdered.	1422	\N	2019-09-07 00:43:19.575476	2020-07-02 13:58:28.599124	movie
546554	Knives Out	2019-11-27	/7910jEmfACDiAgzDw9i3z9EQyVn.jpg	A family gathering goes horribly awry when the patriarch dies, and two detectives are sent to investigate.	0	\N	2019-09-09 13:54:24.321746	2020-07-02 13:58:28.612613	movie
493551	Operation Finale	2018-08-29	/nlIdPeH5IrR1qRErschnVQeZAQu.jpg	In 1960, a team of Israeli secret agents is deployed to find Adolf Eichmann, the infamous Nazi architect of the Holocaust, supposedly hidden in Argentina, and get him to Israel to be judged.	313	\N	2019-09-09 17:53:44.023957	2020-07-02 13:58:28.643706	movie
463257	The Peanut Butter Falcon	2019-08-09	/qyQcRGvdW3VtxHR4fSDgPOePEip.jpg	A down-on-his-luck crab fisherman embarks on a journey to get a young man with Down syndrome to a professional wrestling school in rural North Carolina and away from the retirement home where he’s lived most of his life.	24	\N	2019-09-10 13:23:43.3999	2020-07-02 13:58:28.655875	movie
438145	Black '47	2018-09-28	/gZiu9RIcMeQLUaDVqQffQTl6bhy.jpg	In 1847, when Ireland is in the grip of the Great Famine that has ravaged the country for two long years, Feeney, a hardened Irish Ranger who has been fighting for the British Army abroad, returns home to reunite with his estranged family, only to discover the cruelest reality, a black land where death reigns.	109	\N	2019-09-11 01:45:50.808169	2020-07-02 13:58:28.678455	movie
459992	Long Shot	2019-05-03	/m2ttWZ8rMRwIMT7zA48Jo6mTkDS.jpg	Fred Flarsky is a gifted and free-spirited journalist who has a knack for getting into trouble. Charlotte Field is one of the most influential women in the world -- a smart, sophisticated and accomplished politician. When Fred unexpectedly runs into Charlotte, he soon realizes that she was his former baby sitter and childhood crush. When Charlotte decides to make a run for the presidency, she impulsively hires Fred as her speechwriter -- much to the dismay of her trusted advisers.	492	\N	2019-09-12 16:40:30.354151	2020-07-02 13:58:28.687271	movie
223485	Slow West	2015-04-16	/i1P8CZmq5xW91Fi1G5y7QHTRysH.jpg	In the Old West, a 17-year-old Scottish boy teams up with a mysterious gunman to find the woman with whom he is infatuated.	556	\N	2019-09-07 18:52:19.442336	2020-07-02 13:58:28.703644	movie
99971712	The Good Doctor	\N	/53P8oHo9cfOsgb1cLxBi4pFY0ja.jpg	A young surgeon with Savant syndrome is recruited into the surgical unit of a prestigious hospital. The question will arise: can a person who doesn't have the ability to relate to people actually save their lives?	354	\N	2019-09-25 22:03:19.554192	2020-07-09 00:17:13.036679	tv
2048	I, Robot	2004-07-16	/zDu0TsCZHPzDO0d0iG9QynKGr4J.jpg	In 2035, where robots are common-place and abide by the three laws of robotics, a techno-phobic cop investigates an apparent suicide. Suspecting that a robot may be responsible for the death, his investigation leads him to believe that humanity may be in danger.	7260	\N	2019-10-03 07:23:11.773762	2020-07-02 13:58:28.323631	movie
9738	Fantastic Four	2005-07-08	/8HLQLILZLhDQWO6JDpvY6XJLH75.jpg	During a space voyage, four scientists are altered by cosmic rays: Reed Richards gains the ability to stretch his body; Sue Storm can become invisible; Johnny Storm controls fire; and Ben Grimm is turned into a super-strong … thing. Together, these "Fantastic Four" must now thwart the evil plans of Dr. Doom and save the world from certain destruction.	5894	\N	2019-10-03 07:24:32.197911	2020-07-02 13:58:28.332597	movie
9495	The Crow	1994-05-11	/wF2Tnf0bdYrzCKVbWh0mFwPJS6k.jpg	Exactly one year after young rock guitarist Eric Draven and his fiancée are brutally killed by a ruthless gang of criminals, Draven -- watched over by a hypnotic crow -- returns from the grave to exact revenge.	1925	\N	2019-10-02 14:22:57.43062	2020-07-02 13:58:28.34134	movie
8224	8MM	1999-02-26	/hqMOHPqKdqaWwLulYCMsPYvt93P.jpg	A small, seemingly innocuous plastic reel of film leads surveillance specialist Tom Welles down an increasingly dark and frightening path. With the help of the streetwise Max, he relentlessly follows a bizarre trail of evidence to determine the fate of a complete stranger. As his work turns into obsession, he drifts farther and farther away from his wife, family and simple life as a small-town PI.	895	\N	2019-10-03 07:22:55.812041	2020-07-02 13:58:28.35147	movie
107	Snatch	2001-01-19	/56mOJth6DJ6JhgoE2jtpilVqJO.jpg	The second film from British director Guy Ritchie. Snatch tells an obscure story similar to his first fast-paced crazy character-colliding filled film “Lock, Stock and Two Smoking Barrels.” There are two overlapping stories here – one is the search for a stolen diamond, and the other about a boxing promoter who’s having trouble with a psychotic gangster.	4999	\N	2019-09-28 02:42:49.091477	2020-07-02 13:58:28.359514	movie
429617	Spider-Man: Far from Home	2019-06-28	/lcq8dVxeeOqHvvgcte707K0KVx5.jpg	Peter Parker and his friends go on a summer trip to Europe. However, they will hardly be able to rest - Peter will have to agree to help Nick Fury uncover the mystery of creatures that cause natural disasters and destruction throughout the continent.	3572	\N	2019-09-19 22:15:46.566625	2020-07-02 13:58:28.810621	movie
320288	Dark Phoenix	2019-06-05	/cCTJPelKGLhALq3r51A9uMonxKj.jpg	The X-Men face their most formidable and powerful foe when one of their own, Jean Grey, starts to spiral out of control. During a rescue mission in outer space, Jean is nearly killed when she's hit by a mysterious cosmic force. Once she returns home, this force not only makes her infinitely more powerful, but far more unstable. The X-Men must now band together to save her soul and battle aliens that want to use Grey's new abilities to rule the galaxy.	1836	\N	2019-09-22 01:20:18.462675	2020-07-02 13:58:25.905466	movie
445571	Game Night	2018-02-23	/85R8LMyn9f2Lev2YPBF8Nughrkv.jpg	Max and Annie's weekly game night gets kicked up a notch when Max's brother Brooks arranges a murder mystery party -- complete with fake thugs and federal agents. So when Brooks gets kidnapped, it's all supposed to be part of the game. As the competitors set out to solve the case, they start to learn that neither the game nor Brooks are what they seem to be. The friends soon find themselves in over their heads as each twist leads to another unexpected turn over the course of one chaotic night.	3021	\N	2019-10-03 07:26:02.317846	2020-07-02 13:58:28.301341	movie
58102	Some Mother's Son	1996-12-25	/7db54OfwIgtpOSy25jWAx2gqXP5.jpg	Based on the true story of the 1981 hunger strike in a British prison, in which IRA prisoner Bobby Sands led a protest against the treatment of IRA prisoners as criminals rather than as prisoners of war. The film focuses on the mothers of two of the strikers, and their struggle to save the lives of their sons.	11	\N	2019-09-28 07:07:03.761191	2020-07-02 13:58:28.316155	movie
515195	Yesterday	2019-06-27	/7QPdjLr46huVv25W0eO2XZGOj3O.jpg	Jack Malik is a struggling singer-songwriter in an English seaside town whose dreams of fame are rapidly fading, despite the fierce devotion and support of his childhood best friend, Ellie. After a freak bus accident during a mysterious global blackout, Jack wakes up to discover that he's the only person on Earth who can remember The Beatles.	520	\N	2019-09-19 22:15:51.406514	2020-07-02 13:58:28.819572	movie
287947	Shazam!	2019-03-23	/xnopI5Xtky18MPhK40cZAGAOVeV.jpg	A boy is given the ability to become an adult superhero in times of need with a single magic word.	3368	\N	2019-09-22 01:20:30.890488	2020-07-02 13:58:28.83189	movie
419704	Ad Astra	2019-09-17	/fpe0eG2TBLJLQiqlhhvaWIfixXz.jpg	An astronaut travels to the outer edges of the solar system to find his father and unravel a mystery that threatens the survival of our planet. He uncovers secrets which challenge the nature of human existence and our place in the cosmos.	236	\N	2019-09-25 22:03:02.412766	2020-07-02 13:58:28.839526	movie
412117	The Secret Life of Pets 2	2019-05-24	/nYcaCNkB4EgVyvrXxxbklefDrGL.jpg	Max the terrier must cope with some major life changes when his owner gets married and has a baby. When the family takes a trip to the countryside, nervous Max has numerous run-ins with canine-intolerant cows, hostile foxes and a scary turkey. Luckily for Max, he soon catches a break when he meets Rooster, a gruff farm dog who tries to cure the lovable pooch of his neuroses.	611	\N	2019-09-25 22:03:08.039567	2020-07-02 13:58:28.849304	movie
401981	Red Sparrow	2018-03-02	/vLCogyfQGxVLDC1gqUdNAIkc29L.jpg	Prima ballerina, Dominika Egorova faces a bleak and uncertain future after she suffers an injury that ends her career. She soon turns to Sparrow School, a secret intelligence service that trains exceptional young people to use their minds and bodies as weapons. Dominika emerges as the most dangerous Sparrow after completing the sadistic training process. As she comes to terms with her new abilities, she meets a CIA agent who tries to convince her that he is the only person she can trust.	3640	\N	2019-09-25 22:08:36.648889	2020-07-02 13:58:28.871435	movie
399170	Logan Lucky	2017-08-18	/mQrhrBaaHvRfBQq0Px3HtVbH9iE.jpg	Trying to reverse a family curse, brothers Jimmy and Clyde Logan set out to execute an elaborate robbery during the legendary Coca-Cola 600 race at the Charlotte Motor Speedway.	1780	\N	2019-10-03 07:20:03.854284	2020-07-02 13:58:28.882335	movie
99948891	Brooklyn Nine-Nine	\N	/A3SymGlOHefSKbz1bCOz56moupS.jpg	A single-camera ensemble comedy following the lives of an eclectic group of detectives in a New York precinct, including one slacker who is forced to shape up when he gets a new boss.	726	\N	2019-10-07 15:12:20.786608	2020-07-09 00:17:13.042904	tv
1940	Entourage	\N	/2nHQonjDRhaDpT5aQ4H3Mjm6luf.jpg	Film star Vince Chase navigates the vapid terrain of Los Angeles with a close circle of friends and his trusty agent.	230	\N	2019-10-07 15:11:45.440499	2019-10-07 15:11:45.440499	\N
504949	The King	2019-10-11	/8u0QBGUbZcBW59VEAdmeFl9g98N.jpg	In 15th-century England, Prince Hal transforms from wayward wastrel to powerful king after he reluctantly inherits the throne and it's many conflicts.	7	\N	2019-10-11 16:26:40.492135	2019-10-11 16:26:40.492135	\N
99965708	Taboo	\N	\N	Adventurer James Keziah Delaney returns to London from Africa in 1814 along with fourteen stolen diamonds to seek vengeance after the death of his father.	500	\N	2019-10-07 15:18:12.148355	2020-07-09 00:17:13.049623	tv
13466	October Sky	1999-02-19	/nCyfS0SoojD1z4GAbIphEZsaoJi.jpg	Based on the true story of Homer Hickam, a coal miner's son who was inspired by the first Sputnik launch to take up rocketry against his father's wishes, and eventually became a NASA scientist.	530	\N	2019-10-09 12:43:08.773699	2020-07-02 13:58:28.501864	movie
927	Gremlins	1984-06-07	/5t16qsvUmksew50X0o6D5y0lrJM.jpg	When Billy Peltzer is given a strange but adorable pet named Gizmo for Christmas, he inadvertently breaks the three important rules of caring for a Mogwai, and unleashes a horde of mischievous gremlins on a small town.	3517	\N	2019-10-03 07:28:17.486682	2020-07-02 13:58:28.367358	movie
188222	Entourage	2015-06-03	/y8zMue7ibjg7vXma6XE5tkQ3KiS.jpg	Movie star Vincent Chase, together with his boys, Eric, Turtle and Johnny, are back…and back in business with super agent-turned-studio head Ari Gold. Some of their ambitions have changed, but the bond between them remains strong as they navigate the capricious and often cutthroat world of Hollywood.	659	\N	2019-10-07 15:11:42.554462	2020-07-02 13:58:28.383387	movie
539	Psycho	1960-09-08	/81d8oyEFgj7FlxJqSDXWr8JH8kV.jpg	When larcenous real estate clerk Marion Crane goes on the lam with a wad of cash and hopes of starting a new life, she ends up at the notorious Bates Motel, where manager Norman Bates cares for his housebound mother. The place seems quirky, but fine… until Marion decides to take a shower.	5347	\N	2019-10-07 17:33:47.555952	2020-07-02 13:58:28.399255	movie
396806	Anon	2018-05-04	/xhBTO9n3fxy3HJt7WlR9h9vvVmk.jpg	Set in a near-future world where there is no privacy, ignorance or anonymity, our private memories are recorded and crime almost ceases to exist. In trying to solve a series of unsolved murders, Sal Frieland stumbles onto a young woman who appears to have subverted the system and disappeared. She has no identity, no history and no record. Sal realizes it may not be the end of crime but the beginning. Known only as 'The Girl', Sal must find her before he becomes the next victim.	751	\N	2019-10-09 03:24:49.835606	2020-07-02 13:58:28.409162	movie
399248	Beirut	2018-04-11	/s2qIeFsI9TskZr1LkSwljQDh5nl.jpg	In 1980s Beirut, Mason Skiles is a former U.S. diplomat who is called back into service to save a colleague from the group that is possibly responsible for his own family's death. Meanwhile, a CIA field agent who is working under cover at the American embassy is tasked with keeping Mason alive and ensuring that the mission is a success.	232	\N	2019-10-11 16:26:21.381004	2020-07-02 13:58:28.4276	movie
559969	El Camino: A Breaking Bad Movie	2019-10-11	/4H5lOSPKvTvIlRdxdf1E9ReAtXd.jpg	In the wake of his dramatic escape from captivity, Jesse Pinkman must come to terms with his past in order to forge some kind of future.	1	\N	2019-10-11 16:26:32.841797	2020-07-02 13:58:28.434739	movie
476669	The King's Man	2020-02-14	/9hd5th0fvFmAwkVOntWG4cilmSk.jpg	As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them.	0	\N	2019-10-11 16:27:04.980241	2020-07-02 13:58:28.443693	movie
420818	The Lion King	2019-07-12	/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg	Simba idolises his father, King Mufasa, and takes to heart his own royal destiny. But not everyone in the kingdom celebrates the new cub's arrival. Scar, Mufasa's brother—and former heir to the throne—has plans of his own. The battle for Pride Rock is ravaged with betrayal, tragedy and drama, ultimately resulting in Simba's exile. With help from a curious pair of newfound friends, Simba will have to figure out how to grow up and take back what is rightfully his.	2754	\N	2019-10-11 20:39:35.251267	2020-07-02 13:58:28.454404	movie
20504	The Book of Eli	2010-01-11	/1H1y9ZiqNFaLgQiRDDZLA55PviW.jpg	A post-apocalyptic tale, in which a lone man fights his way across America in order to protect a sacred book that holds the secrets to saving humankind.	3675	\N	2019-10-19 21:14:45.612213	2020-07-02 13:58:27.189708	movie
523172	Late Night	2019-06-07	/xxwb5KBqS0SHsUcyLgWMk3vuVxY.jpg	A legendary late-night talk show host's world is turned upside down when she hires her only female staff writer. Originally intended to smooth over diversity concerns, her decision has unexpectedly hilarious consequences as the two women separated by culture and generation are united by their love of a biting punchline.	127	\N	2019-10-12 21:48:35.02123	2020-07-02 13:58:28.462965	movie
530382	In the Shadow of the Moon	2019-09-21	/5DSVYlKwEzGBxTkS95L73c3oxLs.jpg	In 1988, Philadelphia police officer Thomas "Locke" Lockhart, hungry to become a detective, begins tracking a serial killer whose crimes defy scientific explanation. When the killer mysteriously resurfaces nine years later, Locke's obsession with finding the truth threatens to destroy his career, his family, and possibly his sanity.	179	\N	2019-10-12 22:35:55.473859	2020-07-02 13:58:28.473161	movie
11593	Nobody's Fool	1994-12-23	/yTpm5R28mDWYS3tSvYdU5wNenC8.jpg	Sully is a rascally ne'er-do-well approaching retirement age. While he is pressing a worker's compensation suit for a bad knee, he secretly works for his nemesis, Carl, and flirts with Carl's young wife Toby. Sully's long- forgotten son and family have moved back to town, so Sully faces unfamiliar family responsibilities. Meanwhile, Sully's landlady's banker son plots to push through a new development and evict Sully from his mother's life.	122	\N	2019-10-08 00:28:12.678706	2020-07-02 13:58:28.485525	movie
516486	Greyhound	2020-07-10	/AsdB9A2XGalCZVjlyG9tRf03IfW.jpg	A first-time captain leads a convoy of allied ships carrying thousands of soldiers across the treacherous waters of the “Black Pit” to the front lines of WW2. With no air cover protection for 5 days, the captain and his convoy must battle the surrounding enemy Nazi U-boats in order to give the allies a chance to win the war.	73	\N	2020-07-13 05:06:03.329917	2020-07-13 05:06:03.329917	movie
653349	Vacation Friends	2021-08-27	/uTgZuqUQbaCB6Wfk03N8IUEuzQf.jpg	When a straight-laced couple that has fun with a rowdy couple on vacation in Mexico return to the States, they discover that the crazy couple they met in Mexico followed them back home and decide to play tricks on them.	442	\N	2022-05-02 03:44:47.249543	2022-05-02 03:44:47.249543	movie
12106	The Quick and the Dead	1995-02-09	/fQk89YaQdeBcS7AmlKODKOxIAPU.jpg	A mysterious woman comes to compete in a quick-draw elimination tournament, in a town taken over by a notorious gunman.	805	\N	2019-10-15 11:56:10.631025	2020-07-02 13:58:27.984164	movie
2604	Born on the Fourth of July	1989-12-20	/hFoRzZa9GnOuwD5X7QvuO8hNsVk.jpg	The biography of Ron Kovic. Paralyzed in the Vietnam war, he becomes an anti-war and pro-human rights political activist after feeling betrayed by the country he fought for.	791	\N	2019-10-18 02:40:10.857016	2020-07-02 13:58:27.998049	movie
37834	Knight and Day	2010-06-23	/a7JmOBMNj5erYTgt4u1mQgvHItu.jpg	A fugitive couple goes on a glamorous and sometimes deadly adventure where nothing and no one – even themselves – are what they seem. Amid shifting alliances and unexpected betrayals, they race across the globe, with their survival ultimately hinging on the battle of truth vs. trust.	2631	\N	2019-10-18 02:40:35.204024	2020-07-02 13:58:28.538734	movie
11259	Far and Away	1992-05-22	/hBFM3xgnlzs1EId37IpZEIVts20.jpg	A young man leaves Ireland with his landlord's daughter after some trouble with her father, and they dream of owning land at the big giveaway in Oklahoma ca. 1893. When they get to the new land, they find jobs and begin saving money. The man becomes a local barehands boxer, and rides in glory until he is beaten, then his employers steal all the couple's money and they must fight off starvation in the winter, and try to keep their dream of owning land alive. Meanwhile, the woman's parents find out where she has gone and have come to America to find her and take her back.	555	\N	2019-10-18 02:40:06.652205	2020-07-02 13:58:28.005891	movie
9346	Risky Business	1983-08-05	/9eu4lZIfHlDFsbKzZdWrdwDt2sp.jpg	Meet Joel Goodson, an industrious, college-bound 17-year-old and a responsible, trustworthy son. However, when his parents go away and leave him home alone in the wealthy Chicago suburbs with the Porsche at his disposal he quickly decides he has been good for too long and it is time to enjoy himself. After an unfortunate incident with the Porsche Joel must raise some cash, in a risky way.	612	\N	2019-10-18 02:40:25.985004	2020-07-02 13:58:28.547407	movie
11976	Legend	1986-04-18	/mm7ECw4J2lPc3X65BpV3Bq14jXE.jpg	Set in a timeless mythical forest inhabited by fairies, goblins, unicorns and mortals, this fantastic story follows a mystical forest dweller, chosen by fate, to undertake a heroic quest. He must save the beautiful Princess  Lili and defeat the demonic Lord of Darkness, or the world will be plunged into a never-ending ice age.	553	\N	2019-10-18 02:40:20.635614	2020-07-02 13:58:26.776581	movie
9390	Jerry Maguire	1996-12-13	/2FJFChUeEgYpCvsLfAMXjcFtFOy.jpg	Jerry Maguire used to be a typical sports agent: willing to do just about anything he could to get the biggest possible contracts for his clients, plus a nice commission for himself. Then, one day, he suddenly has second thoughts about what he's really doing. When he voices these doubts, he ends up losing his job and all of his clients, save Rod Tidwell, an egomaniacal football player.	1720	\N	2019-10-18 02:40:28.103211	2020-07-02 13:58:27.958695	movie
1903	Vanilla Sky	2001-12-10	/cAh2pCiNPftsY3aSqJuIOde7uWr.jpg	David Aames has it all: wealth, good looks and gorgeous women on his arm. But just as he begins falling for the warmhearted Sofia, his face is horribly disfigured in a car accident. That's just the beginning of his troubles as the lines between illusion and reality, between life and death, are blurred.	2127	\N	2019-10-18 02:40:02.678729	2020-07-02 13:58:27.973538	movie
293	A River Runs Through It	1992-10-09	/aVP45oS2cBL4WtZ1kB7r8uarruB.jpg	A River Runs Through is a cinematographically stunning true story of Norman Maclean. The story follows Norman and his brother Paul through the experiences of life and growing up, and how their love of fly fishing keeps them together despite varying life circumstances in the untamed west of Montana in the 1920's.	481	\N	2019-10-18 02:43:59.67383	2020-07-02 13:58:28.019573	movie
2119	Days of Thunder	1990-06-27	/2xfP227oLToQjBCUg3FI18pWh3G.jpg	Talented but unproven stock car driver Cole Trickle gets a break and with the guidance of veteran Harry Hogge turns heads on the track. The young hotshot develops a rivalry with a fellow racer that threatens his career when the two smash their cars. But with the help of his doctor, Cole just might overcome his injuries-- and his fear.	656	\N	2019-10-18 02:40:14.175547	2020-07-02 13:58:28.520747	movie
227	The Outsiders	1983-03-25	/t0dy2Q1j9hlQ8kkt0TzGImYNt2C.jpg	When two poor greasers, Johnny, and Ponyboy are assaulted by a vicious gang, the socs, and Johnny kills one of the attackers, tension begins to mount between the two rival gangs, setting off a turbulent chain of events.	595	\N	2019-10-18 02:43:27.077407	2020-07-02 13:58:28.528471	movie
74387	Goon	2012-01-06	/hd4FNgbTp0GcCC0dyJybOgq5pH8.jpg	Doug Glatt, a slacker who discovers he has a talent for brawling is approached by a minor league hockey coach and invited to join the team as the "muscle." Despite the fact that Glatt can't skate his best friend, Pat, convinces him to give it a shot, and Glatt becomes a hero to the team and their fans, until the league's reigning goon becomes threatened by Glatt's success and decides to even the score.	590	\N	2020-07-21 22:58:28.741309	2020-07-21 22:58:28.741309	movie
246741	What We Do in the Shadows	2014-06-19	/pDKJFVofjfQj0cUa7z4NAXZavW.jpg	Vampire housemates try to cope with the complexities of modern life and show a newly turned hipster some of the perks of being undead.	2151	\N	2020-07-23 03:30:26.086054	2020-07-23 03:30:26.086054	movie
1	The Damned United	2009-03-27	/ftlbCma6QoRiZgiflVmLuPKHrkq.jpg	Taking over Leeds United, Brian Clough's abrasive approach and his clear dislike of the players' dirty style of play make it certain there is going to be friction. Glimpses of his earlier career help explain both his hostility to previous manager Don Revie and how much he is missing right-hand man Peter Taylor.	392	\N	2020-07-29 19:10:43.82085	2020-07-29 19:10:43.82085	movie
2	The Damned United	2009-03-27	/ftlbCma6QoRiZgiflVmLuPKHrkq.jpg	Taking over Leeds United, Brian Clough's abrasive approach and his clear dislike of the players' dirty style of play make it certain there is going to be friction. Glimpses of his earlier career help explain both his hostility to previous manager Don Revie and how much he is missing right-hand man Peter Taylor.	392	\N	2020-07-29 19:10:48.323923	2020-07-29 19:10:48.323923	movie
4912	Confessions of a Dangerous Mind	2002-12-30	/1jwCF3a1fP4zJGLLXXe6jkDZhGm.jpg	Television made him famous, but his biggest hits happened off screen. Television producer by day, CIA assassin by night, Chuck Barris was recruited by the CIA at the height of his TV career and trained to become a covert operative. Or so Barris said.	555	\N	2019-10-18 02:45:40.54639	2020-07-02 13:58:28.112421	movie
88794	J. Edgar	2011-11-09	/boy5SdnoMg8mi37AZKaNTG9sYJd.jpg	As the face of law enforcement in America for almost 50 years, J. Edgar Hoover was feared and admired, reviled and revered. But behind closed doors, he held secrets that would have destroyed his image, his career and his life.	1369	\N	2019-10-18 02:47:51.570456	2020-07-02 13:58:28.120858	movie
12113	Body of Lies	2008-10-10	/igVG6AP1mI4mpiUlKH5ulJGMrDD.jpg	The CIA’s hunt is on for the mastermind of a wave of terrorist attacks. Roger Ferris is the agency’s man on the ground, moving from place to place, scrambling to stay ahead of ever-shifting events. An eye in the sky – a satellite link – watches Ferris.  At the other end of that real-time link is the CIA’s Ed Hoffman, strategizing events from thousands of miles away. And as Ferris nears the target, he discovers trust can be just as dangerous as it is necessary for survival.	1597	\N	2019-10-18 02:47:34.397113	2020-07-02 13:58:28.140752	movie
319	True Romance	1993-09-09	/jBQtcaXXy6gtxHwOYmZ0Hpjnbpx.jpg	Clarence marries hooker Alabama, steals cocaine from her pimp, and tries to sell it in Hollywood, while the owners of the coke try to reclaim it.	1358	\N	2019-10-18 02:45:57.364474	2020-07-02 13:58:28.15168	movie
63	Twelve Monkeys	1995-12-29	/2F9KcDGZbEdaQN5jV9ziyRZYY7u.jpg	In the year 2035, convict James Cole reluctantly volunteers to be sent back in time to discover the origin of a deadly virus that wiped out nearly all of the earth's population and forced the survivors into underground communities. But when Cole is mistakenly sent to 1990 instead of 1996, he's arrested and locked up in a mental hospital. There he meets psychiatrist Dr. Kathryn Railly, and patient Jeffrey Goines, the son of a famous virus expert, who may hold the key to the mysterious rogue group, the Army of the 12 Monkeys, thought to be responsible for unleashing the killer disease.	4569	\N	2019-10-18 02:45:24.148829	2020-07-02 13:58:28.162859	movie
1535	Spy Game	2001-11-18	/6y8M1rxjKofQCRKKe6xeV91K2Fc.jpg	On the day of his retirement, a veteran CIA agent learns that his former protégé has been arrested in China, is sentenced to die the next morning in Beijing, and that the CIA is considering letting that happen to avoid an international scandal.	1058	\N	2019-10-18 02:45:09.579114	2020-07-02 13:58:28.172212	movie
10909	Kalifornia	1993-09-03	/4E39RrmgXspAqGro2poDEdjvAnh.jpg	A journalist duo go on a tour of serial killer murder sites with two companions, unaware that one of them is a serial killer himself.	382	\N	2019-10-18 02:44:31.939504	2020-07-02 13:58:28.195207	movie
298	Ocean's Thirteen	2007-06-07	/3so07ghzmtbyhpFfzTucEnlfYRO.jpg	Danny Ocean's team of criminals are back and composing a plan more personal than ever. When ruthless casino owner Willy Bank doublecrosses Reuben Tishkoff, causing a heart attack, Danny Ocean vows that he and his team will do anything to bring down Willy Bank along with everything he's got. Even if it means asking for help from an enemy.	3703	\N	2019-10-18 02:45:00.127929	2020-07-02 13:58:28.029526	movie
9313	The Man in the Iron Mask	1998-03-12	/tSLWIX3NzqFPWNMNX7FfeExHCRk.jpg	Years have passed since the Three Musketeers, Aramis, Athos and Porthos, have fought together with their friend, D'Artagnan. But with the tyrannical King Louis using his power to wreak havoc in the kingdom while his twin brother, Philippe, remains imprisoned, the Musketeers reunite to abduct Louis and replace him with Philippe.	2198	\N	2019-10-18 02:47:37.724839	2020-07-02 13:58:28.043958	movie
64956	Inception: The Cobol Job	2010-12-07	/yr6XX4c7BOvxVjV6cJePwZdUlLn.jpg	The Cobol Job is a fourteen-minute animated prequel to Christopher Nolan’s award-winning movie: Inception, detailing the heist on Mr. Kaneda's mind by Nash, Cobb, Arthur, and several Cobol Engineering thugs.	233	\N	2019-10-18 02:47:47.038183	2020-07-02 13:58:28.055124	movie
9819	Marvin's Room	1996-12-18	/lTHq1K5Y6EDRjxTBvReXHY6AKQ3.jpg	A leukemia patient attempts to end a 20-year feud with her sister to get her bone marrow.	283	\N	2019-10-18 02:48:20.772967	2020-07-02 13:58:28.063499	movie
60308	Moneyball	2011-09-22	/4yIQq1e6iOcaZ5rLDG3lZBP3j7a.jpg	The story of Oakland Athletics general manager Billy Beane's successful attempt to put together a baseball team on a budget, by employing computer-generated analysis to draft his players.	2392	\N	2019-10-18 02:44:36.748192	2020-07-02 13:58:28.071372	movie
492	Being John Malkovich	1999-10-29	/oS3zTDxqHtyKDidHHvG66P7Mcg.jpg	One day at work, unsuccessful puppeteer Craig finds a portal into the head of actor John Malkovich. The portal soon becomes a passion for anybody who enters it's mad and controlling world of overtaking another human body.	2216	\N	2019-10-18 02:46:25.373208	2020-07-02 13:58:28.08219	movie
4512	The Assassination of Jesse James by the Coward Robert Ford	2007-09-20	/2d1S6fJS80fvseg6mJE8eq5o7Kx.jpg	Outlaw Jesse James is rumored to be the 'fastest gun in the West'. An eager recruit into James' notorious gang, Robert Ford eventually grows jealous of the famed outlaw and, when Robert and his brother sense an opportunity to kill James, their murderous action elevates their target to near mythical status.	1367	\N	2019-10-18 02:44:19.736123	2020-07-02 13:58:28.091408	movie
64689	Killing Them Softly	2012-11-30	/heaz45kpFa4Oa7iLis0OBas68ls.jpg	Jackie Cogan is an enforcer hired to restore order after three dumb guys rob a Mob protected card game, causing the local criminal economy to collapse.	1163	\N	2019-10-18 02:44:39.129672	2020-07-02 13:58:28.100078	movie
10681	WALL·E	2008-06-22	/3g8vyePqVatTaUSnrNnrrwguhxM.jpg	WALL·E is the last robot left on an Earth that has been overrun with garbage and all humans have fled to outer space. For 700 years he has continued to try and clean up the mess, but has developed some rather interesting human-like qualities. When a ship arrives with a sleek new type of robot, WALL·E thinks he's finally found a friend and stows away on the ship when it leaves.	13106	\N	2020-07-22 00:36:14.474597	2020-07-22 00:36:14.474597	movie
99982104	The Order	\N	/yMPjmuSd5Fac8YMNOwofGALQWjR.jpg	Out to avenge his mother's death, a college student pledges a secret order and lands in a war between werewolves and practitioners of dark magic.	370	\N	2020-07-22 00:36:35.707857	2020-07-22 00:36:35.707857	tv
287689	7 Days in Hell	2015-07-11	/fyY19vwlKaJfPJHunvc7fjQczI1.jpg	A fictional documentary-style expose on the rivalry between two tennis stars who battled it out in a 1999 match that lasted seven days.	227	\N	2020-07-22 00:40:43.244699	2020-07-22 00:40:43.244699	movie
3	The Damned United	2009-03-27	/ftlbCma6QoRiZgiflVmLuPKHrkq.jpg	Taking over Leeds United, Brian Clough's abrasive approach and his clear dislike of the players' dirty style of play make it certain there is going to be friction. Glimpses of his earlier career help explain both his hostility to previous manager Don Revie and how much he is missing right-hand man Peter Taylor.	392	\N	2020-07-29 19:11:19.724302	2020-07-29 19:11:19.724302	movie
51540	Horrible Bosses	2011-07-08	/uQkUwgyFHAm0jGQERPG6Z9o9Zbj.jpg	For Nick, Kurt and Dale, the only thing that would make the daily grind more tolerable would be to grind their intolerable bosses into dust. Quitting is not an option, so, with the benefit of a few-too-many drinks and some dubious advice from a hustling ex-con, the three friends devise a convoluted and seemingly foolproof plan to rid themselves of their respective employers... permanently.	4032	\N	2019-10-18 05:39:56.737142	2020-06-21 21:34:45.416788	\N
6947	The Village	2004-07-30	/v7UvYtKfIVaHLaHwVgfalyrK7Ho.jpg	When a willful young man tries to venture beyond his sequestered Pennsylvania hamlet, his actions set off a chain of chilling incidents that will alter the community forever.	2210	\N	2019-10-18 02:50:09.389113	2020-07-02 13:58:28.218764	movie
49009	The Way Back	2010-09-03	/sCMRNzb3EITQqrHBmu9EhRBDMpo.jpg	Peter Weir's follow-up to Master &amp; Commander (2003) is the stark &amp; brilliant The Way Back, which takes on the theme of man's struggle for freedom. At the dawn of WWII, several men escape from a Russian gulag. The film details their perilous &amp; uncertain journey to freedom, as they cross deserts, mountains, &amp; several nations.	799	\N	2019-10-18 05:39:18.238576	2020-06-21 21:34:45.429609	\N
64635	Total Recall	2012-08-03	/fucmGeZYM4yzqJUnDTc4pKQNCej.jpg	Welcome to Rekall, the company that can turn your dreams into real memories. For a factory worker named Douglas Quaid, even though he's got a beautiful wife who he loves, the mind-trip sounds like the perfect vacation from his frustrating life - real memories of life as a super-spy might be just what he needs. But when the procedure goes horribly wrong, Quaid becomes a hunted man. Finding himself on the run from the police - controlled by Chancellor Cohaagen, the leader of the free world - Quaid teams up with a rebel fighter to find the head of the underground resistance and stop Cohaagen. The line between fantasy and reality gets blurred and the fate of his world hangs in the balance as Quaid discovers his true identity, his true love, and his true fate.	3630	\N	2019-10-18 05:39:07.673773	2020-06-21 21:34:47.101279	\N
19457	The Yards	2000-04-27	/AtwXtU8CDWvVADgOwRkOSRZFPWI.jpg	In the rail yards of Queens, contractors repair and rebuild the city's subway cars. These contracts are lucrative, so graft and corruption are rife. When Leo Handler gets out of prison, he finds his aunt married to Frank Olchin, one of the big contractors; he's battling with a minority-owned firm for contracts.	186	\N	2019-10-18 02:50:13.72322	2020-07-02 13:58:28.2293	movie
1647	The Recruit	2003-01-31	/zd9eNagUB7FEaqffnSw3n3Nii4p.jpg	A brilliant CIA trainee must prove his worth at the Farm, the agency's secret training grounds, where he learns to watch his back and trust no one.	924	\N	2019-10-18 05:39:28.832919	2020-07-02 13:58:27.644075	movie
1817	Phone Booth	2003-04-04	/7S8JqB4Q1oa1bgnHyN5ezMWUZhA.jpg	A slick New York publicist who picks up a ringing receiver in a phone booth is told that if he hangs up, he'll be killed... and the little red light from a laser rifle sight is proof that the caller isn't kidding.	1997	\N	2019-10-18 05:38:56.243055	2020-07-02 13:58:27.667911	movie
12723	Inventing the Abbotts	1997-04-04	/jeZcJcGTBrS7QYHA85OKAyT5r1O.jpg	In the 1950s, brothers Jacey and Doug Holt, who come from the poorer side of their sleepy Midwestern town, vie for the affections of the wealthy, lovely Abbott sisters. Lady-killer Jacey alternates between Eleanor and Alice, wanting simply to break the hearts of rich young women. But sensitive Doug has a real romance with Pamela, which Jacey and the Abbott patriarch, Lloyd, both frown upon.	74	\N	2019-10-18 02:49:49.834521	2020-07-02 13:58:28.204869	movie
205	Hotel Rwanda	2004-12-22	/p3pHw85UMZPegfMZBA6dZ06yarm.jpg	Inspired by true events, this film takes place in Rwanda in the 1990s when more than a million Tutsis were killed in a genocide that went mostly unnoticed by the rest of the world. Hotel owner Paul Rusesabagina houses over a thousand refuges in his hotel in attempt to save their lives.	1514	\N	2019-10-18 02:50:35.751184	2020-07-02 13:58:28.239703	movie
1552	Parenthood	1989-07-31	/e51tNNQBJpJi9xkyuj0QFhyBcz7.jpg	The story of the Buckman family and friends, attempting to bring up their children. They suffer/enjoy all the events that occur: estranged relatives, the "black sheep" of the family, the eccentrics, the skeletons in the closet, and the rebellious teenagers.	299	\N	2019-10-18 02:50:39.718394	2020-07-02 13:58:28.254452	movie
10592	Hart's War	2002-02-15	/yRUhSU7vzs5ePa72LNPcKKCCMZ5.jpg	Fourth-generation Army Col. William McNamara is imprisoned in a brutal German POW camp. Still, as the senior-ranking American officer, he commands his fellow inmates, keeping a sense of honor alive in a place where honor is easy to destroy, all under the dangerous eye of the Luftwafe vetran Col. Wilhelm Visser. Never giving up the fight to win the war, McNamara is silently planning, waiting for his moment to strike back at the enemy. A murder in the camp gives him the chance to set a risky plan in motion. With a court martial to keep Visser and the Germans distracted, McNamara orchestrates a cunning scheme to escape and destroy a nearby munitions plant, enlisting the unwitting help of young Lt. Tommy Hart. Together with his men, McNamara uses a hero's resolve to carry out his mission, ultimately forced to weigh the value of his life against the good of his country.	442	\N	2019-10-18 05:39:26.421367	2020-07-02 13:58:28.272147	movie
58151	Fright Night	2011-08-19	/ySQ3v4Fzpy3fePs86eoLiDzwLYM.jpg	A teenager suspects his new neighbour is a vampire. Unable to convince anyone, he tries to enlist the help of a self-proclaimed vampire hunter and magician in this remake of the 1985 comedy-horror classic.	1077	\N	2019-10-18 05:39:47.262346	2020-07-02 13:58:28.282998	movie
26618	Clay Pigeons	1998-09-25	/A6ebyxABDaLvOBaS6Q6MWCdOsY5.jpg	Clay is a young man in a small town who witnesses his friend, Earl kill himself because of the ongoing affair that Clay was having with the man's wife, Amanda. Feeling guilty, Clay now resists the widow when she presses him to continue with their sexual affairs. Clay inadvertently befriends a serial killer named Lester Long, who murders the widow in an attempt to "help" his "fishing buddy."	60	\N	2019-10-18 02:49:53.675781	2020-07-02 13:58:28.292422	movie
4	The Damned United	2009-03-27	/ftlbCma6QoRiZgiflVmLuPKHrkq.jpg	Taking over Leeds United, Brian Clough's abrasive approach and his clear dislike of the players' dirty style of play make it certain there is going to be friction. Glimpses of his earlier career help explain both his hostility to previous manager Don Revie and how much he is missing right-hand man Peter Taylor.	392	\N	2020-07-29 19:11:35.331226	2020-07-29 19:11:35.331226	movie
5	The Damned United	2009-03-27	/ftlbCma6QoRiZgiflVmLuPKHrkq.jpg	Taking over Leeds United, Brian Clough's abrasive approach and his clear dislike of the players' dirty style of play make it certain there is going to be friction. Glimpses of his earlier career help explain both his hostility to previous manager Don Revie and how much he is missing right-hand man Peter Taylor.	392	\N	2020-07-29 19:11:43.364285	2020-07-29 19:11:43.364285	movie
8838	Mercury Rising	1998-04-03	/fHzGz7agPCsLalL05xrwHbJmcvW.jpg	Renegade FBI agent Art Jeffries protects a nine-year-old autistic boy who has cracked the government's new "unbreakable" code.	704	\N	2019-10-19 21:32:03.535511	2020-07-02 13:58:26.330164	movie
602	Independence Day	1996-06-25	/hC5Q0RM2SimPJO963wBexpgeCdD.jpg	On July 2, a giant alien mothership enters orbit around Earth and deploys several dozen saucer-shaped 'destroyer' spacecraft that quickly lay waste to major cities around the planet. On July 3, the United States conducts a coordinated counterattack that fails. On July 4, a plan is devised to gain access to the interior of the alien mothership in space, in order to plant a nuclear missile.	5790	\N	2019-10-18 06:26:31.327202	2020-07-02 13:58:27.739843	movie
9798	Enemy of the State	1998-11-20	/x9pXrMKLsBGGOFyyZ0Gwt9YpVub.jpg	A hotshot Washington criminal lawyer becomes the target of a rogue security executive videotaped in the act of murdering a congressman when the incriminating tape is surreptitiously slipped into his shopping bag by the videographer, who is fleeing the executive's assassins.	2062	\N	2019-10-18 06:26:45.72946	2020-07-02 13:58:27.754756	movie
10153	Sphere	1998-02-13	/hPTq8pLcjg4w9sKaekBJVyTchUu.jpg	The OSSA discovers a spacecraft thought to be at least 300 years old at the bottom of the ocean. Immediately following the discovery, they decide to send a team down to the depths of the ocean to study the space craft. They are the best of best, smart and logical, and the perfect choice to learn more about the spacecraft.	836	\N	2019-10-18 06:25:15.829237	2020-07-02 13:58:27.763614	movie
10782	Basic	2003-04-18	/jtyF4NF9fQlyGP8cgU1mK3DLUTB.jpg	A DEA agent investigates the disappearance of a legendary Army ranger drill sergeant and several of his cadets during a training exercise gone severely awry.	525	\N	2019-10-18 06:25:12.881062	2020-07-02 13:58:27.771408	movie
9040	Serpico	1973-12-05	/yJCkj6kxetJ8x4vBRisonoZAHCi.jpg	The real-life struggle of an honest New York City cop against a corrupt system.	854	\N	2019-10-18 14:44:13.87615	2020-07-02 13:58:27.780918	movie
4958	The Legend of Bagger Vance	2000-11-02	/7jKjh9PZvHJYYtCycQmTbBoZVV4.jpg	World War I has left golfer Rannulph Junuh a poker-playing alcoholic, his perfect swing gone. Now, however, he needs to get it back to play in a tournament to save the financially ravaged golf course of a long-ago sweetheart. Help arrives in the form of mysterious caddy Bagger Vance.	485	\N	2019-10-18 06:27:15.407193	2020-07-02 13:58:27.789267	movie
1537	Changing Lanes	2002-04-07	/8wh9WzTKo5pJw3EgHYWA60W7Kbl.jpg	A rush-hour fender-bender on New York City's crowded FDR Drive, under most circumstances, wouldn't set off a chain reaction that could decimate two people's lives. But on this day, at this time, a minor collision will turn two complete strangers into vicious adversaries. Their means of destroying each other might be different, but their goals, ultimately, will be the same: Each will systematically try to dismantle the other's life in a reckless effort to reclaim something he has lost.	533	\N	2019-10-18 06:24:33.494639	2020-07-02 13:58:27.811438	movie
7874	Black Snake Moan	2006-12-08	/pT7sB08oyNda5zIjeQ8qnjmkPMe.jpg	A God-fearing bluesman takes to a wild young woman who, as a victim of childhood sexual abuse, is looking everywhere for love, but never quite finding it.	429	\N	2019-10-18 06:23:38.323584	2020-07-02 13:58:27.828614	movie
25208	The Caveman's Valentine	2001-01-19	/vQbcD7YjTVWie8lT4sGzk85LM9u.jpg	In this spine-tingling and visually stunning thriller, Academy AwardÂ®-nominee Samuel L. Jackson (Unbreakable, Shaft, Pulp Fiction delivers a "full-throttle performance" (People) as Romulus Ledbetter, a misunderstood musician turned recluse, hiding from personal demons in a New York City cave.  When Romulus finds the frozen body of a young drifter in a tree, the authorities - including his police officer daughter (Aunjanne Ellis) - claim the death is accidental. Romulus is convinced the man was murdered by prominent art photographer David Leppenraub (Colm Feore). But how can he prove he's right when everyone thinks he's insane?	53	\N	2019-10-18 06:23:38.043188	2020-07-02 13:58:27.849895	movie
12490	Ordinary Decent Criminal	2000-01-07	/8uE6na0CjOsLDsvxakS8mrEpLmi.jpg	Michael Lynch is a notorious criminal with two wives and a flair for showmanship. He's also a huge embarrassment to the local police, who are determined to bring him down once and for all.	131	\N	2019-10-18 05:40:04.387864	2020-07-02 13:58:27.861744	movie
8247	Jumper	2008-02-10	/3pPZ9JhNz3VMmASVir5SMHvTDUU.jpg	David Rice is a man who knows no boundaries, a Jumper, born with the uncanny ability to teleport instantly to anywhere on Earth. When he discovers others like himself, David is thrust into a dangerous and bloodthirsty war while being hunted by a sinister and determined group of zealots who have sworn to destroy all Jumpers. Now, David’s extraordinary gift may be his only hope for survival!	3372	\N	2019-10-18 06:25:10.274059	2020-07-02 13:58:27.677967	movie
13815	Fresh	1994-08-24	/uXRIIUzjDZZdWR2cUzPJ9eAqaHv.jpg	Michael is a 12-year-old drug pusher who lives in a crowded house with his cousins and aunt. His father has become a street bum,but still meets with Fresh on occasion to play chess. Fresh is rather quiet in a crazy world. Fresh's sister is a junkie who sleeps with the dealers that Fresh sells for. As the story progresses Fresh realizes that he doesn't want to sell drugs anymore - he wants revenge.	85	\N	2019-10-18 06:25:23.262097	2020-07-02 13:58:27.689353	movie
400106	Bright	2017-12-22	/whkT53Sv2vKAUiknQ13pqcWaPXB.jpg	In an alternate present-day where magical creatures live among us, two L.A. cops become embroiled in a prophesied turf battle.	3403	\N	2019-10-18 06:27:06.227947	2020-07-02 13:58:27.708377	movie
1645	A Time to Kill	1996-07-24	/apUSR9WE7lMATBGYhzZ8RnPDYsK.jpg	A young lawyer defends a black man accused of murdering two men who raped his 10-year-old daughter, sparking a rebirth of the KKK.	999	\N	2019-10-18 06:25:18.193871	2020-07-02 13:58:27.722789	movie
8960	Hancock	2008-07-01	/7DyuV2G0hLEqHeueDfOqhZ2DVut.jpg	Hancock is a down-and-out superhero who's forced to employ a PR expert to help repair his image when the public grows weary of all the damage he's inflicted during his lifesaving heroics. The agent's idea of imprisoning the antihero to make the world miss him proves successful, but will Hancock stick to his new sense of purpose or slip back into old habits?	5753	\N	2019-10-18 06:26:38.800904	2020-07-02 13:58:27.731713	movie
87516	Oldboy	2013-11-27	/gKMwbpr86DLV4Ov3UDfQgoCCH9k.jpg	An everyday man has only three and a half days and limited resources to discover why he was imprisoned in a nondescript room for 20 years without any explanation.	1098	\N	2019-10-18 06:25:39.158521	2020-07-02 13:58:27.798374	movie
524369	The Many Saints of Newark	2021-09-22	/1UkbPQspPbq1FPbFP4VV1ELCfSN.jpg	Young Anthony Soprano is growing up in one of the most tumultuous eras in Newark, N.J., history, becoming a man just as rival gangsters start to rise up and challenge the all-powerful DiMeo crime family. Caught up in the changing times is the uncle he idolizes, Dickie Moltisanti, whose influence over his nephew will help shape the impressionable teenager into the all-powerful mob boss, Tony Soprano.	383	\N	2022-05-02 04:45:42.113321	2022-05-02 04:45:42.113321	movie
957	Spaceballs	1987-06-24	/o624HTt93iIJIc1Sg5hNkDTnk5l.jpg	When the nefarious Dark Helmet hatches a plan to snatch Princess Vespa and steal her planet's air, space-bum-for-hire Lone Starr and his clueless sidekick fly to the rescue. Along the way, they meet Yogurt, who puts Lone Starr wise to the power of "The Schwartz." Can he master it in time to save the day?	1622	\N	2019-10-19 02:06:52.170334	2020-07-02 13:58:27.94837	movie
90	Beverly Hills Cop	1984-11-30	/2O0KSDef3gRuoOswd9HCv0HSfXL.jpg	Tough-talking Detroit cop Axel Foley heads to the rarified world of Beverly Hills in his beat-up Chevy Nova to investigate a friend's murder, but soon realizes he's stumbled onto something much more complicated. Bungling rookie detective, Billy Rosewood joins the fish-out-of-water Axel and shows him the West Los Angeles ropes.	1980	\N	2019-10-19 02:12:57.435718	2020-06-21 00:14:20.324263	\N
525	The Blues Brothers	1980-06-17	/3DiSrcYELCLkwnjl9EZp2pkKGep.jpg	Jake Blues is just out of jail, and teams up with his brother, Elwood on a 'mission from God' to raise funds for the orphanage in which they grew up. The only thing they can do is do what they do best: play music. So they get their old band together, and set out on their way—while getting in a bit of trouble here and there.	2158	\N	2019-10-19 02:13:28.258679	2020-07-02 13:58:27.257029	movie
137106	The Lego Movie	2014-02-07	/lbctonEnewCYZ4FYoTZhs8cidAl.jpg	An ordinary Lego mini-figure, mistakenly thought to be the extraordinary MasterBuilder, is recruited to join a quest to stop an evil Lego tyrant from gluing the universe together.	5077	\N	2019-10-19 02:13:20.436797	2020-07-02 13:58:27.273598	movie
1900	Traffic	2000-12-27	/jbccmnqE4oAPI67bApgt2JiRPz8.jpg	An exploration of the United States of America's war on drugs from multiple perspectives. For the new head of the Office of National Drug Control Policy, the war becomes personal when he discovers his well-educated daughter is abusing cocaine within their comfortable suburban home. In Mexico, a flawed, but noble policeman agrees to testify against a powerful general in league with a cartel, and in San Diego, a drug kingpin's sheltered trophy wife must learn her husband's ruthless business after he is arrested, endangering her luxurious lifestyle.	1047	\N	2019-10-19 01:45:58.407605	2020-07-02 13:58:27.283754	movie
81796	Lockout	2012-04-13	/i5QfNIcg6hc327IWUerea0EczP4.jpg	Set in the near future, Lockout follows a falsely convicted ex-government agent , whose one chance at obtaining freedom lies in the dangerous mission of rescuing the President's daughter from rioting convicts at an outer space maximum security prison.	1056	\N	2019-10-18 14:46:39.934767	2020-07-02 13:58:27.291496	movie
8393	The Gods Must Be Crazy	1984-07-13	/IgBfj5LfT7nwpodCZ34QCHp17x.jpg	Misery is brought to a small group of Sho in the Kalahari desert in the form of a cola bottle. In his quest to throw the evil object over the edge of the earth, Xixo encounters Western "civilization," a haphazard doctor and a tyranical despot.	478	\N	2019-10-19 02:04:53.378198	2020-07-02 13:58:27.308271	movie
8592	Dick Tracy	1990-06-15	/xY6D5Ti44xuwzCkmf6Ygbj86BkP.jpg	The comic strip detective finds his life vastly complicated when Breathless Mahoney makes advances towards him while he is trying to battle Big Boy Caprice's united mob.	453	\N	2019-10-18 14:45:32.340292	2020-07-02 13:58:27.317455	movie
320	Insomnia	2002-05-24	/6O3eA55DO3fHicwlAE3DaSrA5Uv.jpg	Two Los Angeles homicide detectives are dispatched to a northern town where the sun doesn't set to investigate the methodical murder of a local teen.	2391	\N	2019-10-18 14:44:28.731868	2020-07-02 13:58:27.328524	movie
6075	Carlito's Way	1993-11-10	/g6D7mjQtndu768cusGmoEQY9fTB.jpg	A Puerto-Rican ex-con, just released from prison, pledges to stay away from drugs and violence despite the pressure around him, and lead a better life outside NYC.	1566	\N	2019-10-18 14:44:23.869893	2020-07-02 13:58:27.339038	movie
9008	The Insider	1999-10-28	/w695X0FvTlBCS7GSLHNILnrfqPm.jpg	Tells the true story of a 60 Minutes television series exposé of the tobacco industry, as seen through the eyes of a real tobacco executive, Jeffrey Wigand.	897	\N	2019-10-18 14:44:15.250021	2020-07-02 13:58:27.357463	movie
9366	Donnie Brasco	1997-02-27	/xtKLvpOfARi1XVm8u2FTdhY5Piq.jpg	An FBI undercover agent infilitrates the mob and finds himself identifying more with the mafia life at the expense of his regular one.	2278	\N	2019-10-18 14:44:53.114147	2020-07-02 13:58:27.878872	movie
620	Ghostbusters	1984-06-08	/h5Qz8J4T8YQnbZzHXM73WVYYVPK.jpg	After losing their academic posts at a prestigious university, a team of parapsychologists goes into business as proton-pack-toting "ghostbusters" who exterminate ghouls, hobgoblins and supernatural pests of all stripes. An ad campaign pays off when a knockout cellist hires the squad to purge her swanky digs of demons that appear to be living in her refrigerator.	4925	\N	2019-10-19 02:05:37.923432	2020-07-02 13:58:27.234446	movie
2135	The Time Machine	2002-03-04	/3OzdAcb0ajibR4xvVTH6WkBTYWY.jpg	Hoping to alter the events of the past, a 19th century inventor instead travels 800,000 years into the future, where he finds mankind divided into two warring races.	1153	\N	2019-10-18 14:46:18.217248	2020-07-02 13:58:27.887527	movie
20766	The Road	2009-11-25	/qLaXnLzqleBWQtjvZ6JGVSaKoC3.jpg	A father and his son walk alone through burned America. Nothing moves in the ravaged landscape save the ash on the wind and water. It is cold enough to crack stones, and, when the snow falls it is gray. The sky is dark. Their destination is the warmer south, although they don't know what, if anything, awaits them there.	1978	\N	2019-10-18 14:47:30.681555	2020-07-02 13:58:27.896807	movie
9614	Happy Gilmore	1996-02-16	/4RnCeRzvI1xk5tuNWjpDKzSnJDk.jpg	Failed hockey player-turned-golf whiz Happy Gilmore -- whose unconventional approach and antics on the grass courts the ire of rival Shooter McGavin -- is determined to win a PGA tournament so he can save his granny's house with the prize money. Meanwhile, an attractive tour publicist tries to soften Happy's image.	1394	\N	2019-10-19 02:06:57.766305	2020-07-02 13:58:27.905838	movie
4964	Knocked Up	2007-06-01	/b4OaXw2MW97VvIiZE0Sbn1NfxSh.jpg	For fun loving party animal Ben Stone, the last thing he ever expected was for his one night stand to show up on his doorstep eight weeks later to tell him she's pregnant.	2312	\N	2019-10-19 02:07:14.17554	2020-07-02 13:58:27.918831	movie
530915	1917	2019-12-25	/AuGiPiGMYMkSosOJ3BQjDEAiwtO.jpg	At the height of the First World War, two young British soldiers must cross enemy territory and deliver a message that will stop a deadly attack on hundreds of soldiers.	4881	\N	2020-05-17 02:16:34.100274	2020-07-02 13:58:27.927874	movie
2898	As Good as It Gets	1997-12-19	/e4DQl8UobpJ0DqTEmQInbWH174A.jpg	New York City. Melvin Udall, a cranky, bigoted, obsessive-compulsive writer, finds his life turned upside down when neighboring gay artist Simon is hospitalized and his dog is entrusted to Melvin. In addition, Carol, the only waitress who will tolerate him, must leave work to care for her sick son, making it impossible for Melvin to eat breakfast.	1896	\N	2019-10-19 02:13:11.387113	2020-07-02 13:58:27.939618	movie
6	Frost/Nixon	2008-10-15	/nLrRrHZQ40tWqLTY3kxgS4x7GUw.jpg	For three years after being forced from office, Nixon remained silent. But in summer 1977, the steely, cunning former commander-in-chief agreed to sit for one all-inclusive interview to confront the questions of his time in office and the Watergate scandal that ended his presidency. Nixon surprised everyone in selecting Frost as his televised confessor, intending to easily outfox the breezy British showman and secure a place in the hearts and minds of Americans. Likewise, Frost's team harboured doubts about their boss's ability to hold his own. But as the cameras rolled, a charged battle of wits resulted.	730	\N	2020-07-29 19:12:43.805511	2020-07-29 19:12:43.805511	movie
228967	The Interview	2014-12-25	/xceBsRlxAfMep9RNYMW5iKGt4zN.jpg	Dave Skylark and his producer Aaron Rapaport run the celebrity tabloid show "Skylark Tonight". When they land an interview with a surprise fan, North Korean dictator Kim Jong-un, they are recruited by the CIA to turn their trip to Pyongyang into an assassination mission.	3744	\N	2019-10-19 02:13:44.136568	2020-07-02 13:58:27.406332	movie
9870	Forgetting Sarah Marshall	2008-04-17	/j2KXt3gObsAaRj9RKpCp8tiosTk.jpg	When Sarah Marshall dumps aspiring musician Peter Bretter for rock star Aldous Snow, Peter's world comes crashing down. His best friend suggests that Peter should get away from everything and to fly off to Hawaii to escape all his problems. After arriving in Hawaii and meeting the beautiful Rachel Jansen, Peter is shocked to see not only Aldous Snow in Hawaii, but also Sarah Marshall.	2065	\N	2019-10-19 02:13:57.918814	2020-07-02 13:58:27.417886	movie
15413	Don't Tell Mom the Babysitter's Dead	1991-06-07	/3tLGHYpdGkOGBescmZ7mhYh5K1a.jpg	Sue Ellen Crandell is a teenager eagerly awaiting her mother's summer-long absence. While the babysitter looks after her rambunctious younger siblings, Sue Ellen can party and have fun. But then the babysitter abruptly dies, leaving the Crandells short on cash. Sue Ellen finds a sweet job in fashion by lying about her age and experience on her résumé. But, while her siblings run wild, she discovers the downside of adulthood	195	\N	2019-10-19 02:14:01.296715	2020-07-02 13:58:27.43264	movie
11400	The New World	2005-12-25	/hB4kYmGx4XTShAKSB8XEoigS79M.jpg	A drama about explorer John Smith and the clash between Native Americans and English settlers in the 17th century.	596	\N	2019-10-18 05:38:56.376072	2020-07-02 13:58:27.450552	movie
1542	Office Space	1999-02-19	/gA49wTJMIr3TUM6fEDkjeGxkYgZ.jpg	Three office workers strike back at their evil employers by hatching a hapless attempt to embezzle money.	1640	\N	2019-10-19 02:16:38.913233	2020-07-02 13:58:27.497714	movie
6978	Big Trouble in Little China	1986-05-30	/gI2Qs1yTTj3NcESJyttCkbmJ4k9.jpg	When trucker Jack Burton agreed to take his friend, Wang Chi, to pick up his fiancee at the airport, he never expected to get involved in a supernatural battle between good and evil. Wang's fiancee has emerald green eyes, which make her a perfect target for immortal sorcerer Lo Pan and his three invincible cronies. Lo Pan must marry a girl with green eyes so he can regain his physical form.	1455	\N	2019-10-19 02:16:17.835973	2020-07-02 13:58:27.520045	movie
38055	Megamind	2010-11-04	/ozecjGWL47TQ9mKrPg2Y3WTh2UJ.jpg	Bumbling supervillain Megamind finally defeats his nemesis, the superhero Metro Man. But without a hero, he loses all purpose and must find new meaning to his life.	3897	\N	2019-10-19 02:15:06.329565	2020-07-02 13:58:27.535261	movie
7518	Over the Hedge	2006-05-19	/6qKM3Rl1tQgOFO1fMA7DAizWZ5n.jpg	A scheming raccoon fools a mismatched family of forest creatures into helping him repay a debt of food, by invading the new suburban sprawl that popped up while they were hibernating – and learns a lesson about family himself.	2528	\N	2019-10-19 02:14:57.818461	2020-07-02 13:58:27.545906	movie
4247	Scary Movie	2000-07-07	/lRQiJXETkCnVVurHmglNvMXrZOx.jpg	Following on the heels of popular teen-scream horror movies, with uproarious comedy and biting satire. Marlon and Shawn Wayans, Shannon Elizabeth and Carmen Electra pitch in to skewer some of Hollywood's biggest blockbusters, including Scream, I Know What You Did Last Summer, The Matrix, American Pie and The Blair Witch Project.	3591	\N	2019-10-19 02:14:53.462235	2020-07-02 13:58:27.556497	movie
942	Lethal Weapon 2	1989-07-07	/m7mJpEIpalRICM4p1Stq0YtCrgA.jpg	In the opening chase, Martin Riggs and Roger Murtaugh stumble across a trunk full of Krugerrands. They follow the trail to a South African diplomat who's using his immunity to conceal a smuggling operation. When he plants a bomb under Murtaugh's toilet, the action explodes!	1857	\N	2019-10-19 02:18:43.584058	2020-07-02 13:58:27.565543	movie
136400	2 Guns	2013-08-02	/ptURGAFktibhk7DEAbMazlmNqWa.jpg	A DEA agent and an undercover Naval Intelligence officer who have been tasked with investigating one another find they have been set up by the mob -- the very organization the two men believe they have been stealing money from.	2464	\N	2019-10-19 02:18:23.678523	2020-07-02 13:58:27.577682	movie
9384	Starsky & Hutch	2004-03-05	/i011DoAZF2krWvxhb7XAxl2lEcK.jpg	Join uptight David Starsky and laid-back Ken "Hutch" Hutchinson as they're paired for the first time as undercover cops. The new partners must overcome their differences to solve an important case with help from street informant Huggy Bear and persuasive criminal Reese Feldman.	1293	\N	2019-10-19 02:18:05.103771	2020-07-02 13:58:27.589981	movie
509	Notting Hill	1999-05-13	/cBpef6K40Su2CcBb3c18WdwRFCL.jpg	William Thacker is a London bookstore owner whose humdrum existence is thrown into romantic turmoil when famous American actress Anna Scott appears in his shop. A chance encounter over spilled orange juice leads to a kiss that blossoms into a full-blown affair. As the average bloke and glamorous movie star draw closer and closer together, they struggle to reconcile their radically different lifestyles in the name of love.	3101	\N	2019-10-19 02:16:32.584208	2020-07-02 13:58:27.601738	movie
114	Pretty Woman	1990-03-23	/hMVMMy1yDUvdufpTl8J8KKNYaZX.jpg	When a millionaire wheeler-dealer enters a business contract with a Hollywood hooker Vivian Ward, he loses his heart in the bargain.	4069	\N	2019-10-19 02:16:27.272485	2020-07-02 13:58:27.610487	movie
18785	The Hangover	2009-06-05	/uluhlXubGu1VxU63X9VHCLWDAYP.jpg	When three friends finally come to after a raucous night of bachelor-party revelry, they find a baby in the closet and a tiger in the bathroom. But they can't seem to locate their best friend, Doug – who's supposed to be tying the knot. Launching a frantic search for Doug, the trio perseveres through a nasty hangover to try to make it to the church on time.	10959	\N	2019-10-19 02:15:35.406223	2020-07-02 13:58:27.372736	movie
134374	Pain & Gain	2013-04-26	/nJ4TcIdY23Nm1a4005MWo9b8Ghp.jpg	Daniel Lugo, manager of the Sun Gym in 1990s Miami, decides that there is only one way to achieve his version of the American dream: extortion. To achieve his goal, he recruits musclemen Paul and Adrian as accomplices. After several failed attempts, they abduct rich businessman Victor Kershaw and convince him to sign over all his assets to them. But when Kershaw makes it out alive, authorities are reluctant to believe his story.	2644	\N	2019-10-19 02:14:16.619072	2020-07-02 13:58:27.390279	movie
10687	Tigerland	2000-09-22	/pnFdCvxxL44sPLkKEIJCUaIZa7M.jpg	A group of recruits go through Advanced Infantry Training at Fort Polk, Louisiana's infamous Tigerland, last stop before Vietnam for tens of thousands of young men in 1971	265	\N	2019-10-18 05:38:55.954787	2020-07-02 13:58:27.469012	movie
8363	Superbad	2007-08-17	/adNY5f4fio9g6UJ8WUlzSWIf7kR.jpg	Two co-dependent high school seniors are forced to deal with separation anxiety after their plan to stage a booze-soaked party goes awry.	3774	\N	2019-10-19 02:18:57.837687	2020-07-02 13:58:27.485663	movie
21641	The Damned United	2009-03-27	/ftlbCma6QoRiZgiflVmLuPKHrkq.jpg	Taking over Leeds United, Brian Clough's abrasive approach and his clear dislike of the players' dirty style of play make it certain there is going to be friction. Glimpses of his earlier career help explain both his hostility to previous manager Don Revie and how much he is missing right-hand man Peter Taylor.	392	\N	2020-07-30 23:04:18.796552	2020-07-30 23:04:18.796552	movie
7445	Brothers	2009-12-02	/hz0zV7n93DhXHaelu7s2cOAZAiR.jpg	When his helicopter goes down during his fourth tour of duty in Afghanistan, Marine Sam Cahill is presumed dead. Back home, brother Tommy  steps in to look over Sam’s wife, Grace, and two children. Sam’s surprise homecoming triggers domestic mayhem.	1242	\N	2019-10-19 21:08:12.760589	2020-06-21 21:34:45.341043	\N
9377	Ferris Bueller's Day Off	1986-06-11	/18tR0kWefGWpS0KIeQa4YHDON36.jpg	A high school slacker pretends to be sick to skip school and have an exciting day off alongside his girlfriend and his best buddy through Chicago, while trying to outwit his obsessive school principal and his unconformited sister along the way.	2605	\N	2019-10-19 02:18:59.973314	2020-07-02 13:58:26.95985	movie
9543	Prince of Persia: The Sands of Time	2010-05-27	/lkp1GFmWyf7k2WKvKIQuuGyichI.jpg	A rogue prince reluctantly joins forces with a mysterious princess and together, they race against dark forces to safeguard an ancient dagger capable of releasing the Sands of Time – gift from the gods that can reverse time and allow its possessor to rule the world.	4276	\N	2019-10-19 21:07:46.2181	2020-07-02 13:58:26.973188	movie
6415	Three Kings	1999-09-27	/fClJQW8xn8wHOFqoA4jUn0PZh1f.jpg	A group of American soldiers stationed in Iraq at the end of the Gulf War find a map they believe will take them to a huge cache of stolen Kuwaiti gold hidden near their base, and they embark on a secret mission that's destined to change everything.	1123	\N	2019-10-19 02:27:04.224487	2020-07-02 13:58:26.982598	movie
9340	The Goonies	1985-06-07	/c03kHoIsEVrsVBh7wRHNQ8JgvwP.jpg	A young teenager named Mikey Walsh finds an old treasure map in his father's attic. Hoping to save their homes from demolition, Mikey and his friends Data Wang, Chunk Cohen, and Mouth Devereaux run off on a big quest to find the secret stash of Pirate One-Eyed Willie.	3075	\N	2019-10-19 02:26:50.145319	2020-07-02 13:58:26.993228	movie
2493	The Princess Bride	1987-09-25	/2FC9L9MrjBoGHYjYZjdWQdopVYb.jpg	In this enchantingly cracked fairy tale, the beautiful Princess Buttercup and the dashing Westley must overcome staggering odds to find happiness amid six-fingered swordsmen, murderous princes, Sicilians and rodents of unusual size. But even death can't stop these true lovebirds from triumphing.	2576	\N	2019-10-19 02:26:45.175259	2020-07-02 13:58:27.002428	movie
1406	City Slickers	1991-06-07	/9DVZpm9pQNB3M17cRo752zqUYhL.jpg	New York meets the west in this comedy starring Billy Crystal. Three New York businessmen decide to take a "Wild West" vacation that turns out not to be the relaxing vacation they had envisioned.	394	\N	2019-10-19 02:26:42.93119	2020-07-02 13:58:27.012548	movie
45243	The Hangover Part II	2011-05-25	/cKZu0Fdkj7dmwbfMpgDqVVCkLJQ.jpg	The Hangover crew heads to Thailand for Stu's wedding. After the disaster of a bachelor party in Las Vegas last year, Stu is playing it safe with a mellow pre-wedding brunch. However, nothing goes as planned and Bangkok is the perfect setting for another adventure with the rowdy group.	6591	\N	2019-10-19 02:26:57.751452	2020-07-02 13:58:27.022618	movie
9522	Wedding Crashers	2005-07-15	/lFM3lk2zVzC1YFnKm0r6LbFPyRu.jpg	John and his buddy, Jeremy are emotional criminals who know how to use a woman's hopes and dreams for their own carnal gain. Their modus operandi: crashing weddings. Normally, they meet guests who want to toast the romantic day with a random hook-up. But when John meets Claire, he discovers what true love – and heartache – feels like.	2640	\N	2019-10-19 02:26:30.545724	2020-07-02 13:58:27.03183	movie
1597	Meet the Parents	2000-10-06	/jX9D6uVaYFZIwFMfD3pEPp4Lu6u.jpg	Greg Focker is ready to marry his girlfriend, Pam, but before he pops the question, he must win over her formidable father, humorless former CIA agent Jack Byrnes, at the wedding of Pam's sister. As Greg bends over backward to make a good impression, his visit to the Byrnes home turns into a hilarious series of disasters, and everything that can go wrong does, all under Jack's critical, hawklike gaze.	3509	\N	2019-10-19 02:26:22.3301	2020-07-02 13:58:27.042097	movie
7516	Smokin' Aces	2006-12-09	/nrdnN8WqvyOt8Bnl3hgWcZD6ZyM.jpg	When a Las Vegas performer-turned-snitch named Buddy Israel decides to turn state's evidence and testify against the mob, it seems that a whole lot of people would like to make sure he's no longer breathing.	883	\N	2019-10-19 02:25:41.823715	2020-07-02 13:58:27.054051	movie
34544	The A-Team	2010-06-11	/bkAWEx5g5tvRPjtDQyvIZ7LRxQm.jpg	A group of Iraq War veterans goes on the run from U.S. military forces while they try to clear their names after being framed for a crime they didn't commit. Along the way, Col. Hannibal Smith, Capt. H.M. ‘Howling Mad’ Murdock , Sgt. Bosco ‘B.A.’ Baracus, and Lt. Templeton ‘Faceman’ Peck help out various people they encounter.	2836	\N	2019-10-19 02:25:45.502172	2020-06-21 21:34:47.2154	\N
196	Back to the Future Part III	1990-05-25	/crzoVQnMzIrRfHtQw0tLBirNfVg.jpg	The final installment of the Back to the Future trilogy finds Marty digging the trusty DeLorean out of a mineshaft and looking for Doc in the Wild West of 1885. But when their time machine breaks down, the travelers are stranded in a land of spurs. More problems arise when Doc falls for pretty schoolteacher Clara Clayton, and Marty tangles with Buford Tannen.	5858	\N	2019-10-19 02:25:12.616964	2020-07-02 13:58:27.0663	movie
290250	The Nice Guys	2016-05-20	/clq4So9spa9cXk3MZy2iMdqkxP2.jpg	A private eye investigates the apparent suicide of a fading porn star in 1970s Los Angeles and uncovers a conspiracy.	4568	\N	2019-10-19 02:19:57.106544	2020-07-02 13:58:27.085912	movie
48988	Hall Pass	2011-02-25	/HqwUkeLOm6PUvcMntKvN0iSNR.jpg	When best buds Rick and Fred begin to show signs of restlessness at home, their wives take a bold approach to revitalize their marriages, they grant the guys a 'hall pass'—one week of freedom to do whatever they want. At first, it seems like a dream come true, but they quickly discover that their expectations of the single life—and themselves—are completely and hilariously out of sync with reality.	1072	\N	2019-10-19 02:19:14.27953	2020-07-02 13:58:27.095764	movie
460668	I Feel Pretty	2018-04-20	/iuPs45XIxfARKPLEkCGXWUrBrTR.jpg	A head injury causes a woman to develop an extraordinary amount of confidence and believe she's drop dead gorgeous.	1224	\N	2019-10-19 02:19:31.924049	2020-07-02 13:58:27.619839	movie
9962	The Good Girl	2002-01-12	/21AacCArwM5hQ8fYPRA0WKZviiN.jpg	A discount store clerk strikes up an affair with a stock boy who considers himself the incarnation of Holden Caulfield.	304	\N	2019-10-19 21:08:36.58704	2020-07-02 13:58:26.940104	movie
134	O Brother, Where Art Thou?	2000-12-21	/2YztYilviFCYcEtDAnrOstUWGie.jpg	In the deep south during the 1930s, three escaped convicts search for hidden treasure while a relentless lawman pursues them. On their journey they come across many comical characters and incredible situations. Based upon Homer's 'Odyssey'.	2112	\N	2019-10-19 02:19:04.421736	2020-07-02 13:58:26.950951	movie
437557	Blockers	2018-04-06	/uvlUQXg0AlpGzKukO11K7QtW3Yu.jpg	When three parents discover their daughters’ pact to lose their virginity at prom, they launch a covert one-night operation to stop the teens from sealing the deal.	1078	\N	2019-10-19 02:26:40.357648	2020-07-02 13:58:27.627534	movie
1089	Point Break	1991-07-12	/eGSfqknufcsXmM2Rb59H9SiNd4T.jpg	In Los Angeles, a gang of bank robbers call themselves The Ex-Presidents commit their crimes while wearing masks of Reagan, Carter, Nixon and Johnson. The F.B.I. believes that the members of the gang could be surfers and send young agent Johnny Utah undercover at the beach to mix with the surfers and gather information.	1729	\N	2019-10-19 21:09:10.894047	2019-10-19 21:09:10.894047	\N
10074	Hot Rod	2007-08-03	/jRkt03dXCVKnbvcQm3ygU1cjg9Y.jpg	For Rod Kimball, performing stunts is a way of life, even though he is rather accident-prone. Poor Rod cannot even get any respect from his stepfather, Frank, who beats him up in weekly sparring matches. When Frank falls ill, Rod devises his most outrageous stunt yet to raise money for Frank's operation -- and then Rod will kick Frank's butt.	612	\N	2020-09-12 21:35:41.380463	2020-09-12 21:35:41.380463	movie
672647	The Map of Tiny Perfect Things	2021-02-12	/foHto5PECzIaKT4ADV9x2nWY0jg.jpg	The story of two teenagers trapped in an endless time loop who set out to find all the tiny things that make that one day perfect.	523	\N	2022-05-13 02:40:37.837115	2022-05-13 02:40:37.837115	movie
1662	State of Grace	1990-09-14	/542ngEhaYPj1N07JvUoyCwN05ux.jpg	Terry Noonan returns home to New York's Hells Kitchen after a ten year absence. He soon hooks up with childhood pal Jackie who is involved in the Irish mob run by his brother Frankie. Terry also rekindles an old flame with Jackie's sister Kathleen. Soon, however, Terry is torn between his loyalty to his friends and his loyalties to others.	135	\N	2019-10-19 21:14:59.93183	2020-07-02 13:58:27.182121	movie
45317	The Fighter	2010-12-17	/jcQYWWi2y1vNsGlJJ2jNcFq0y1n.jpg	The Fighter, is a drama about boxer "Irish" Micky Ward's unlikely road to the world light welterweight title. His Rocky-like rise was shepherded by half-brother Dicky, a boxer-turned-trainer who rebounded in life after nearly being KO'd by drugs and crime.	2464	\N	2019-10-19 21:13:30.682464	2020-07-02 13:58:27.206294	movie
6278	Reign of Fire	2002-07-12	/vZVXCj3jXzIPJUHLaQohzt2uTM3.jpg	In post-apocalyptic England, an American volunteer and a British survivor team up to fight off a brood of fire-breathing dragons seeking to return to global dominance after centuries of rest underground. The Brit -- leading a clan of survivors to hunt down the King of the Dragons -- has much at stake: His mother was killed by a dragon, but his love is still alive.	1200	\N	2019-10-19 21:13:04.534533	2020-07-02 13:58:27.215057	movie
16995	State of Play	2009-04-17	/4f8nhHESDhAVKow2M1khmqDdatp.jpg	Handsome, unflappable U.S. Congressman Stephen Collins is the future of his political party: an honorable appointee who serves as the chairman of a committee overseeing defense spending. All eyes are upon the rising star to be his party's contender for the upcoming presidential race. Until his research assistant/mistress is brutally murdered and buried secrets come tumbling out.	900	\N	2019-10-19 21:12:28.551247	2020-07-02 13:58:26.563566	movie
7299	Equilibrium	2002-12-06	/kvUrWiJLGnvHNLuQsMuxDd1raSl.jpg	In a dystopian future, a totalitarian regime maintains peace by subduing the populace with a drug, and displays of emotion are punishable by death. A man in charge of enforcing the law rises to overthrow the system.	2603	\N	2019-10-19 21:12:58.134914	2020-07-02 13:58:27.225692	movie
36586	Blade II	2002-03-22	/vulF0iqX5z7AW1pdZ572zwsMRMB.jpg	A rare mutation has occurred within the vampire community - The Reaper. A vampire so consumed with an insatiable bloodlust that they prey on vampires as well as humans, transforming victims who are unlucky enough to survive into Reapers themselves. Blade is asked by the Vampire Nation for his help in preventing a nightmare plague that would wipe out both humans and vampires.	2711	\N	2019-10-19 21:12:19.377757	2020-07-02 13:58:26.575619	movie
578	Jaws	1975-06-19	/s2xcqSFfT6F7ZXHxowjxfG0yisT.jpg	When an insatiable great white shark terrorizes the townspeople of Amity Island, the police chief, an oceanographer and a grizzled shark hunter seek to destroy the blood-thirsty beast.	5428	\N	2019-10-19 21:12:16.545386	2020-07-02 13:58:26.593142	movie
49040	The Bourne Legacy	2012-08-10	/ucqtAussxYNRw4lGvRaSbRJLskV.jpg	New CIA operative Aaron Cross experiences life-or-death stakes that have been triggered by the previous actions of Jason Bourne.	3764	\N	2019-10-19 21:11:18.620912	2020-07-02 13:58:26.608857	movie
59961	Safe House	2012-02-10	/7SYBPjv5ywF6cI4BSFFtlDyChT2.jpg	A dangerous CIA renegade resurfaces after a decade on the run. When the safe house he's remanded to is attacked by mercenaries, a rookie operative escapes with him. Now, the unlikely allies must stay alive long enough to uncover who wants them dead.	2088	\N	2019-10-19 21:11:15.810939	2020-07-02 13:58:26.625268	movie
27418	Next of Kin	1989-10-20	/uCs7jWkPCu5813PDOveNBW9mRYu.jpg	Truman Gates, a Chicago cop, sets out to find his brother's killer. Meanwhile, another of his brothers, Briar (a hillbilly) decides to find the killer himself.	93	\N	2019-10-19 21:09:19.107586	2020-07-02 13:58:27.107566	movie
6114	Dracula	1992-11-13	/n39glC4GkBeCbwdenES8ZBodim8.jpg	When Dracula leaves the captive Jonathan Harker and Transylvania for London in search of Mina Harker—the reincarnation of Dracula's long-dead wife, Elisabeta—obsessed vampire hunter Dr. Van Helsing sets out to end the madness.	2459	\N	2019-10-19 21:14:24.146576	2020-07-02 13:58:25.531452	movie
47821	City of Joy	1992-04-15	/8aEfWFECThq5A1VnXsyzX8x2y72.jpg	Max Lowe is a Houston surgeon who has grown weary of the bureaucracy of American medicine. When he loses a patient on the operating table, Max impulsively decides to leave America and travel to India in the hope of finding himself. Not long after he arrives in Calcutta, Max is attacked by a group of thugs and left without money or a passport.	68	\N	2019-10-19 21:09:30.529859	2020-07-02 13:58:27.128072	movie
384680	Hostiles	2017-12-22	/rqoezyB51GfhiloOB5ZErg5HXas.jpg	A legendary Native American-hating Army captain nearing retirement in 1892 is given one last assignment: to escort a Cheyenne chief and his family through dangerous territory back to his Montana reservation.	1153	\N	2019-10-19 21:13:15.281303	2020-07-02 13:58:27.142278	movie
88	Dirty Dancing	1987-08-21	/dvEggyDTTIBDvrUNjTEa9depT0f.jpg	Expecting the usual tedium that accompanies a summer in the Catskills with her family, 17-year-old Frances 'Baby' Houseman is surprised to find herself stepping into the shoes of a professional hoofer—and unexpectedly falling in love.	3236	\N	2019-10-19 21:09:50.945233	2020-07-02 13:58:27.164094	movie
10135	Road House	1989-05-19	/eA2A3MkI1GYxozNXPeRV3PEdDB4.jpg	The Double Deuce is the meanest, loudest and rowdiest bar south of the Mason-Dixon Line, and Dalton (Patrick Swayze) has been hired to clean it up. He might not look like much, but the Ph.D.-educated bouncer proves he's more than capable -- busting the heads of troublemakers and turning the roadhouse into a jumping hot-spot. But Dalton's romance with the gorgeous Dr. Clay (Kelly Lynch) puts him on the bad side of cutthroat local big shot Brad Wesley (Ben Gazzara).	445	\N	2019-10-19 21:09:15.139336	2020-07-02 13:58:27.173775	movie
340102	The New Mutants	2020-08-26	/xrI4EnZWftpo1B7tTvlMUXVOikd.jpg	Five young mutants, just discovering their abilities while held in a secret facility against their will, fight to escape their past sins and save themselves.	1032	\N	2020-12-13 00:26:29.060513	2020-12-13 00:26:29.060513	movie
7	Lethal Weapon	1987-03-06	/fTq4ThIP3pQTYR9eDepsbDHqdcs.jpg	Veteran buttoned-down LAPD detective Roger Murtaugh is partnered with unhinged cop Martin Riggs, who -- distraught after his wife's death -- has a death wish and takes unnecessary risks with criminals at every turn. The odd couple embark on their first homicide investigation as partners, involving a young woman known to Murtaugh with ties to a drug and prostitution ring.	3001	\N	2020-12-13 23:06:21.846745	2020-12-13 23:06:21.846745	movie
31867	Repo Men	2010-03-19	/briDKf5nrLzox2zcI6pquKeqWz8.jpg	In the future, medical technology has advanced to the point where people can buy artificial organs to extend their lives. But if they default on payments, an organization known as the Union sends agents to repossess the organs. Remy is one of the best agents in the business, but when he becomes the recipient of an artificial heart, he finds himself in the same dire straits as his many victims.	1045	\N	2019-10-19 21:23:22.460253	2020-07-02 13:58:26.654137	movie
294254	Maze Runner: The Scorch Trials	2015-09-18	/mYw7ZyejqSCPFlrT2jHZOESZDU3.jpg	Thomas and his fellow Gladers face their greatest challenge yet: searching for clues about the mysterious and powerful organization known as WCKD. Their journey takes them to the Scorch, a desolate landscape filled with unimaginable obstacles. Teaming up with resistance fighters, the Gladers take on WCKD’s vastly superior forces and uncover its shocking plans for them all.	6692	\N	2019-10-19 21:21:44.223109	2020-07-02 13:58:26.685396	movie
27576	Salt	2010-07-23	/ppXyhOe8UCEOrBRSYqE3SkHwrcR.jpg	As a CIA officer, Evelyn Salt swore an oath to duty, honor and country. Her loyalty will be tested when a defector accuses her of being a Russian spy. Salt goes on the run, using all her skills and years of experience as a covert operative to elude capture. Salt's efforts to prove her innocence only serve to cast doubt on her motives, as the hunt to uncover the truth behind her identity continues and the question remains: "Who is Salt?"	3403	\N	2019-10-19 21:21:39.354011	2020-07-02 13:58:26.694464	movie
9802	The Rock	1996-06-06	/eBcoxveWzzXQrCrwWMGAROcqgpP.jpg	FBI chemical warfare expert Stanley Goodspeed is sent on an urgent mission with a former British spy, John Patrick Mason, to stop Gen. Francis X. Hummel from launching chemical weapons on Alcatraz Island into San Francisco. Gen. Hummel demands $100 million in war reparations to be paid to the families of slain servicemen who died on covert operations. After their SEAL team is wiped out, Stanley and John deal with the soldiers on their own.	2462	\N	2019-10-19 21:21:35.348074	2020-07-02 13:58:26.707789	movie
3595	Ransom	1996-11-08	/psTGc4mOQ60AHlqP7sxxyqzHVLy.jpg	When a rich man's son is kidnapped, he cooperates with the police at first but then tries a unique tactic against the criminals.	896	\N	2019-10-19 21:21:30.926321	2020-07-02 13:58:26.718059	movie
36955	True Lies	1994-07-15	/8cusvjQ8Ph7SPwW3CGvyjSCk9VP.jpg	A fearless, globe-trotting, terrorist-battling secret agent has his life turned upside down when he discovers his wife might be having an affair with a used car salesman while terrorists smuggle nuclear war heads into the United States.	2092	\N	2019-10-19 21:20:55.616108	2020-07-02 13:58:26.728475	movie
13252	Cleaner	2007-09-11	/tsFKQu5HXWfbZX64m3BTNaRpXGp.jpg	Single father and former cop Tom Cutler has an unusual occupation: he cleans up death scenes. But when he's called in to sterilize a wealthy suburban residence after a brutal shooting, Cutler is shocked to learn he may have unknowingly erased crucial evidence, entangling himself in a dirty criminal cover-up.	374	\N	2019-10-19 21:19:38.649166	2020-07-02 13:58:26.744435	movie
855	Black Hawk Down	2001-12-28	/8F31N59QzpuwOqva8jC8XbG9PA7.jpg	When U.S. Rangers and an elite Delta Force team attempt to kidnap two underlings of a Somali warlord, their Black Hawk helicopters are shot down, and the Americans suffer heavy casualties, facing intense fighting from the militia on the ground.	3127	\N	2019-10-19 21:18:09.487922	2020-07-02 13:58:26.757667	movie
13809	RockNRolla	2008-10-30	/i7eyngqjdvKB7NvrWtCjjTNNq8N.jpg	When a Russian mobster sets up a real estate scam that generates millions of pounds, various members of London's criminal underworld pursue their share of the fortune. Various shady characters, including Mr One-Two, Stella the accountant, and Johnny Quid, a druggie rock-star, try to claim their slice.	1494	\N	2019-10-19 21:17:54.195151	2020-07-02 13:58:26.766218	movie
8438	Murder in the First	1995-01-20	/9TS3AQnh3s0dzyGQTCIGniJLcv5.jpg	Inspired by a true story. A petty criminal sent to Alcatraz in the 1930s is caught attempting to make an escape. As punishment he is put in solitary confinement. The maximum stay is supposed to be 19 days, but Henri spends years alone, cold and in complete darkness, only to emerge a madman and soon to be a murderer. The story follows a rookie lawyer attempting to prove that Alcatraz was to blame.	256	\N	2019-10-19 21:15:25.041479	2020-07-02 13:58:26.799799	movie
97020	RoboCop	2014-02-12	/gM5ql3BKYmHG3WtZ0buKXN7xY8O.jpg	In RoboCop, the year is 2028 and multinational conglomerate OmniCorp is at the center of robot technology.  Overseas, their drones have been used by the military for years, but have been forbidden for law enforcement in America.  Now OmniCorp wants to bring their controversial technology to the home front, and they see a golden opportunity to do it.  When Alex Murphy – a loving husband, father and good cop doing his best to stem the tide of crime and corruption in Detroit – is critically injured, OmniCorp sees their chance to build a part-man, part-robot police officer.  OmniCorp envisions a RoboCop in every city and even more billions for their shareholders, but they never counted on one thing: there is still a man inside the machine.	3539	\N	2019-10-19 21:15:13.444557	2020-07-02 13:58:26.808967	movie
276907	Legend	2015-11-20	/5wyUnMWPqsK3J2dGl6JrjYUrtSO.jpg	Suave, charming and volatile, Reggie Kray and his unstable twin brother Ronnie start to leave their mark on the London underworld in the 1960s. Using violence to get what they want, the siblings orchestrate robberies and murders while running nightclubs and protection rackets. With police Detective Leonard "Nipper" Read hot on their heels, the brothers continue their rapid rise to power and achieve tabloid notoriety.	1836	\N	2019-10-19 21:17:26.293536	2020-06-21 21:34:50.189802	\N
526896	Morbius	2022-03-30	/h4WLN3cmEjCsH1fNGRfvGV6IPBX.jpg	Dangerously ill with a rare blood disorder, and determined to save others suffering his same fate, Dr. Michael Morbius attempts a desperate gamble. What at first appears to be a radical success soon reveals itself to be a remedy potentially worse than the disease.	902	\N	2022-05-21 17:20:37.635863	2022-05-21 17:20:37.635863	movie
402	Basic Instinct	1992-03-20	/76Ts0yoHk8kVQj9MMnoMixhRWoh.jpg	A police detective is in charge of the investigation of a brutal murder, in which a beautiful and seductive woman could be involved.	1676	\N	2019-10-19 21:22:17.38494	2020-07-02 13:58:25.443061	movie
95	Armageddon	1998-07-01	/fMtOCd0EAdAzKtGLQiHjSUvbdNc.jpg	When an asteroid threatens to collide with Earth, NASA honcho Dan Truman determines the only way to stop it is to drill into its surface and detonate a nuclear bomb. This leads him to renowned driller Harry Stamper, who agrees to helm the dangerous space mission provided he can bring along his own hotshot crew. Among them is the cocksure A.J. who Harry thinks isn't good enough for his daughter, until the mission proves otherwise.	4534	\N	2019-10-19 21:31:20.835672	2020-07-02 13:58:26.643571	movie
8	Lethal Weapon	1987-03-06	/fTq4ThIP3pQTYR9eDepsbDHqdcs.jpg	Veteran buttoned-down LAPD detective Roger Murtaugh is partnered with unhinged cop Martin Riggs, who -- distraught after his wife's death -- has a death wish and takes unnecessary risks with criminals at every turn. The odd couple embark on their first homicide investigation as partners, involving a young woman known to Murtaugh with ties to a drug and prostitution ring.	3001	\N	2020-12-13 23:06:33.057013	2020-12-13 23:06:33.057013	movie
15801	What Doesn't Kill You	2008-12-12	/sc4iraX1xfLThpME67vLJzs61Xh.jpg	Two childhood friends from South Boston turn to crime as a way to get by, ultimately causing a strain in their personal lives and their friendship.	82	\N	2019-10-24 21:20:19.672849	2020-07-02 13:58:26.91811	movie
9804	Waterworld	1995-07-28	/f4Q6BKm1lv9u5xoffbIIwrOYf6z.jpg	In a futuristic world where the polar ice caps have melted and made Earth a liquid planet, a beautiful barmaid rescues a mutant seafarer from a floating island prison. They escape, along with her young charge, Enola, and sail off aboard his ship.	1981	\N	2019-10-20 01:10:44.620473	2020-07-02 13:58:26.927167	movie
188927	Star Trek Beyond	2016-07-22	/yOnd3XQIg7JBmu0UuBjZyLdsxQD.jpg	The USS Enterprise crew explores the furthest reaches of uncharted space, where they encounter a mysterious new enemy who puts them and everything the Federation stands for to the test.	4469	\N	2019-10-20 01:10:11.679564	2020-07-02 13:58:26.296901	movie
9620	Paycheck	2003-12-25	/sngSFxlEuizdoSG0ALLCKT7cWPj.jpg	Michael Jennings is a genius who's hired – and paid handsomely – by high-tech firms to work on highly sensitive projects, after which his short-term memory is erased so he's incapable of breaching security. But at the end of a three-year job, he's told he isn't getting a paycheck and instead receives a mysterious envelope. In it are clues he must piece together to find out why he wasn't paid – and why he's now in hot water.	980	\N	2019-10-20 01:09:48.109714	2020-07-02 13:58:26.304974	movie
861	Total Recall	1990-06-01	/wVbeL6fkbTKSmNfalj4VoAUUqJv.jpg	Construction worker Douglas Quaid discovers a memory chip in his brain during a virtual-reality trip. He also finds that his past has been invented to conceal a plot of planetary domination. Soon, he's off to Mars to find out who he is and who planted the chip.	3050	\N	2019-10-20 01:09:43.132773	2020-07-02 13:58:26.316286	movie
415	Batman & Robin	1997-06-20	/bsg0mrxUKyJoL4oSGP5mlhEsqp.jpg	Along with crime-fighting partner Robin and new recruit Batgirl, Batman battles the dual threat of frosty genius Mr. Freeze and homicidal horticulturalist Poison Ivy. Freeze plans to put Gotham City on ice, while Ivy tries to drive a wedge between the dynamic duo.	2860	\N	2019-10-20 01:10:38.608671	2020-07-02 13:58:26.285243	movie
4824	The Jackal	1997-11-14	/wkLF73oenC1n1DDKKU7oyLKVcMa.jpg	Hired by a powerful member of the Russian mafia to avenge an FBI sting that left his brother dead, a psychopathic hitman known only as The Jackal proves an elusive target for the people charged with the task of bringing him down: a deputy FBI director, a Russian MVK Major,  and a jailed IRA terrorist who can recognize him.	959	\N	2019-10-19 21:31:59.175721	2020-07-02 13:58:26.34117	movie
7457	Alpha Dog	2006-01-27	/t9pirEsDxe102mSQGoDZWBbdcCD.jpg	Johnny Truelove likes to see himself as tough. He's the son of an underworld figure and a drug dealer. Johnny also likes to get tough when things don't go his way. When Jake Mazursky fails to pay up for Johnny, things get worse for the Mazursky family, as Johnny and his 'gang' kidnap Jake's 15 year old brother and holds him hostage. Problem now is what to do with 'stolen boy?'	775	\N	2019-10-19 21:32:07.680471	2020-07-02 13:58:26.817799	movie
4244	The Kid	2000-07-07	/3liZLuVVg86giK8vkzzrit8Crdj.jpg	Powerful businessman Russ Duritz is self-absorbed and immersed in his work. But by the magic of the moon, he meets Rusty, a chubby, charming 8-year-old version of himself who can't believe he could turn out so badly -- with no life and no dog. With Rusty's help, Russ is able to reconcile the person he used to dream of being with the man he's actually become.	473	\N	2019-10-19 21:31:51.639506	2020-06-21 03:15:21.33675	\N
11549	Invasion of the Body Snatchers	1956-02-05	/8BrMQmgwGzIHSyBjCDOLOdi79fJ.jpg	A small-town doctor learns that the population of his community is being replaced by emotionless alien duplicates.	447	\N	2019-10-20 00:45:12.402646	2020-07-02 13:58:25.862943	movie
59967	Looper	2012-09-28	/sNjL6SqErDBE8OUZlrDLkexfsCj.jpg	In the futuristic action thriller Looper, time travel will be invented but it will be illegal and only available on the black market. When the mob wants to get rid of someone, they will send their target 30 years into the past where a looper, a hired gun, like Joe is waiting to mop up. Joe is getting rich and life is good until the day the mob decides to close the loop, sending back Joe's future self for assassination.	6981	\N	2019-10-20 01:01:43.17349	2020-07-02 13:58:26.828594	movie
475557	Joker	2019-10-02	/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg	During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.	3411	\N	2019-10-20 02:01:50.674546	2020-07-02 13:58:26.838107	movie
458156	John Wick: Chapter 3 - Parabellum	2019-05-15	/ziEuG1essDuWuC5lpWUaw1uXY2O.jpg	Super-assassin John Wick returns with a $14 million price tag on his head and an army of bounty-hunting killers on his trail. After killing a member of the shadowy international assassin’s guild, the High Table, John Wick is excommunicado, but the world’s most ruthless hit men and women await his every turn.	2974	\N	2019-10-20 02:01:59.478253	2020-07-02 13:58:26.855098	movie
271715	Basmati Blues	2018-02-09	/8MR9Qiwfpi4ztGXe3MrIQOnX65r.jpg	Linda Watt is a sheltered but brilliant young scientist who is plucked out of her company's lab and sent to India by her CEO to sell "Rice 9," a genetically modified rice she's created. However, unbeknownst to her, the rice will destroy the Indian farmers she thinks she's helping.	14	\N	2019-10-20 02:03:42.635155	2020-07-02 13:58:26.878701	movie
356305	Why Him?	2016-12-23	/eezFoKz7bXgdbjeieeCYJFXPKSu.jpg	A dad forms a bitter rivalry with his daughter's young rich boyfriend.	2638	\N	2019-10-20 05:54:46.49434	2020-07-02 13:58:26.886453	movie
50348	The Lincoln Lawyer	2011-03-18	/gOn8Ve9Yi8fxjRkmLr5BZoOc7KV.jpg	A lawyer conducts business from the back of his Lincoln town car while representing a high-profile client in Beverly Hills.	1619	\N	2019-10-20 05:55:16.979707	2020-07-02 13:58:26.894015	movie
21755	The Brothers Bloom	2008-09-09	/xIz8iwzyjgWGzcIwHKpqhBs77ML.jpg	The Brothers Bloom are the best con men in the world, swindling millionaires with complex scenarios of lust and intrigue. Now they've decided to take on one last job – showing a beautiful and eccentric heiress the time of her life with a romantic adventure that takes them around the world.	338	\N	2019-10-24 21:20:32.566894	2020-07-02 13:58:26.901064	movie
35056	Date Night	2010-04-08	/oXwpl4mdd8MYPkUMggREzSf9c5R.jpg	Phil and Claire Foster fear that their mild-mannered relationship may be falling into a stale rut. During their weekly date night, their dinner reservation leads to their being mistaken for a couple of thieves—and now a number of unsavoury characters want Phil and Claire killed.	1828	\N	2019-10-24 21:21:07.9531	2020-07-02 13:58:26.908375	movie
99981532	Living with Yourself	\N	/fLo2TqZ4UHHZU0UJbhi3lraCJNu.jpg	Burned out on life, Miles undergoes a strange procedure at a strip mall spa -- and wakes to find he's been replaced by a better version of himself.	10	\N	2019-10-25 04:55:14.560212	2020-07-09 00:17:13.07342	tv
600030	2007-2008 NBA Champions: Boston Celtics	\N	/jfveLm2R6cgHKKS1IHEI6GqyzpS.jpg	Relive the memorable Boston Celtics season with this 2008 NBA Champions DVD. This DVD is sure to commemorate your love for the Boston Celtics.	0	\N	2019-10-25 14:06:13.651863	2019-10-25 14:06:13.651863	\N
99989247	Batwoman	\N	/jnaimWkIVSD9IInmZPyLYarSvvc.jpg	Armed with a great passion for social justice and with a great facility to always say what she thinks, Kate Kane is known in the streets of Gotham as Batwoman, a lesbian highly trained to fight crime that resurfaces in the city. However, before becoming a savior, she must fight the demons that prevent her from being the symbol of the hope of a corrupt city.	89	\N	2019-10-25 14:58:30.61633	2020-07-09 00:17:13.080037	tv
10057	The Three Musketeers	1993-11-11	/mk8UH7JRmK8adcqJJpB1ygP7B1C.jpg	D'Artagnan travels to Paris hoping to become a musketeer, one of the French king's elite bodyguards, only to discover that the corps has been disbanded by conniving Cardinal Richelieu, who secretly hopes to usurp the throne. Fortunately, Athos, Porthos and Aramis have refused to lay down their weapons and continue to protect their king. D'Artagnan joins with the rogues to expose Richelieu's plot against the crown.	440	\N	2019-10-31 13:53:38.283162	2019-10-31 13:53:38.283162	\N
41263	The Brotherhood of Justice	1986-05-18	/xsc4Fs4tsElUqp1tc0DlGzsCZOp.jpg	A group of high school students, led by a rich boy Derek, is sick of school violence and decides to become underground vigilantes named "Brotherhood of Justice". It starts with the idea "watching people", but things quickly get out of control. "Brotherhood of Justice" turns out another gang of violence. Derek wants to stop it but it is too late, so he takes responsibility for it and gives himself to the law.	13	\N	2019-10-31 13:53:26.832661	2020-07-02 13:58:26.504157	movie
9	Lethal Weapon	1987-03-06	/fTq4ThIP3pQTYR9eDepsbDHqdcs.jpg	Veteran buttoned-down LAPD detective Roger Murtaugh is partnered with unhinged cop Martin Riggs, who -- distraught after his wife's death -- has a death wish and takes unnecessary risks with criminals at every turn. The odd couple embark on their first homicide investigation as partners, involving a young woman known to Murtaugh with ties to a drug and prostitution ring.	3001	\N	2020-12-13 23:06:37.266876	2020-12-13 23:06:37.266876	movie
859	Dangerous Liaisons	1988-12-16	/5MEl1xrbM93zjpFgS3sHJ2SlIFm.jpg	In 18th century France, Marquise de Merteuil asks her ex-lover Vicomte de Valmont to seduce the future wife of another ex-lover of hers in return for one last night with her. Yet things don’t go as planned.	584	\N	2019-12-05 16:46:20.026377	2020-07-02 13:58:26.233889	movie
1551	Flatliners	1990-08-10	/wda3j7p7YHXKpFIlSzoTCtP7myF.jpg	Five medical students want to find out if there is life after death. They plan to stop one of their hearts for a few seconds, thus simulating death, and then bring the person back to life. A science fiction thriller from the early 1990's with a star studded cast.	803	\N	2019-10-31 13:53:12.883712	2020-06-21 03:15:21.257463	\N
22267	Ride with the Devil	1999-11-24	/pH3J5IUzho4ZVaRuTuErzqHHovb.jpg	Ride with the Devil follows four people who are fighting for truth and justice amidst the turmoil of the American Civil War. Director Ang Lee takes us to a no man's land on the Missouri/Kansas border where a staunch loyalist, an immigrant's son, a freed slave, and a young widow form an unlikely friendship as they learn how to survive in an uncertain time. In a place without rules and redefine the meaning of bravery and honor.	89	\N	2019-10-24 21:21:18.579762	2020-07-02 13:58:26.357681	movie
602211	Fatman	2020-11-13	/4n8QNNdk4BOX9Dslfbz5Dy6j1HK.jpg	A rowdy, unorthodox Santa Claus is fighting to save his declining business. Meanwhile, Billy, a neglected and precocious 12 year old, hires a hit man to kill Santa after receiving a lump of coal in his stocking.	152	\N	2020-12-13 23:08:33.731733	2020-12-13 23:08:33.731733	movie
181812	Star Wars: The Rise of Skywalker	2019-12-18	/db32LaOibwEliAmSL2jjDF6oDdj.jpg	The next installment in the franchise and the conclusion of the “Star Wars“ sequel trilogy as well as the “Skywalker Saga.“	0	\N	2019-10-25 13:29:38.147968	2020-07-02 13:58:26.375921	movie
635324	2019 NBA Champions: Toronto Raptors	2019-10-22	/tXAM5lDgS3quat2s4DXc1a81Bb4.jpg	Relive the Toronto Raptors' championship run from the first day of training camp through the scintillating six games of the 2019 NBA Finals. Go behind the scenes with exclusive access and go back in time with rare historical footage.	0	\N	2019-10-25 14:05:29.299674	2020-07-02 13:58:26.384303	movie
197353	2008 Boston Celtics: Official NBA Finals Film	2008-07-14	/SVBQbHOuoctRXva310gvqOiW3L.jpg	Get an inside look at the Boston Celtics regular season, triumphant playoff run and NBA Finals victory. Provides an all-access pass to exclusive interviews, behind-the-scenes action and an unforgettable courtside view of the NBA Finals.	0	\N	2019-10-25 14:05:56.467675	2020-07-02 13:58:26.392275	movie
158600	Boston Celtics: 1985-1986 NBA Champions - Sweet Sixteen	2008-04-15	/1wmAeiUM9ilzRKn9GeZOZXFh40K.jpg	Relive the Boston Celtics' sixteenth NBA Championship. Experience the historic 1986 NBA Finals showdown where the Celtics, led by Larry Bird, Robert Parrish and Kevin McHale, battled the upstart Houston Rockets led by Hakeem Olajuwon and Ralph Sampson.	0	\N	2019-10-25 14:06:08.062277	2020-07-02 13:58:26.402089	movie
456788	Celtics/Lakers: Best of Enemies	2017-06-13	/mF2ccs6AuGUvEIY9lfj8chFu6pW.jpg	A two-part series exploring the Celtics–Lakers rivalry, focusing mainly on the 1980s era of Larry Bird and Magic Johnson but also examining the entire history of the NBA through the rivalry.	8	\N	2019-10-25 14:06:19.917223	2020-07-02 13:58:26.416304	movie
639933	The Northman	2022-04-07	/zhLKlUaF1SEpO58ppHIAyENkwgw.jpg	Prince Amleth is on the verge of becoming a man when his father is brutally murdered by his uncle, who kidnaps the boy's mother. Two decades later, Amleth is now a Viking who's on a mission to save his mother, kill his uncle and avenge his father.	942	\N	2022-05-21 17:20:44.001606	2022-05-21 17:20:44.001606	movie
320703	The Dramatics: A Comedy	2015-02-10	/h5JNj5MyGNkkG2zG8OMTNGREu6K.jpg	When an out of work actress unexpectedly lands a starring role in the sexually explicit mini-series adaptation of a best selling erotic novel, her aimless, stoner boyfriend does his best to be supportive. But when her volatile, Oscar winning co-lead takes "rehearsals" too far, her dream job becomes her boyfriend’s worst nightmare and the couple is forced to decide whether or not their relationship is worth fighting for.	8	\N	2019-10-27 21:19:17.632071	2020-07-02 13:58:26.442646	movie
487680	The Kitchen	2019-08-08	/l3smhHvnczXg8E2WzysRVKIXSYJ.jpg	An Irish mob story set in 1970s Hell's Kitchen. After the mobsters are sentenced to jail, their wives take their place — and do as good of a job, if not better.	79	\N	2019-10-28 23:38:05.715537	2020-07-02 13:58:26.450631	movie
517909	The Laundromat	2019-09-05	/hwNMJgbiUUvPCxsnADjbV9ysM5j.jpg	When her idyllic vacation takes an unthinkable turn, Ellen Martin begins investigating a fake insurance policy, only to find herself down a rabbit hole of questionable dealings that can be linked to a Panama City law firm and its vested interest in helping the world's wealthiest citizens amass larger fortunes.	159	\N	2019-10-28 23:48:39.89793	2020-07-02 13:58:26.460505	movie
9086	Young Guns II	1990-08-01	/edCvASPoE4VXCzzVx0U0J1BuAIP.jpg	Three of the original five "young guns" — Billy the Kid (Emilio Estevez), Jose Chavez y Chavez (Lou Diamond Phillips), and Doc Scurlock (Kiefer Sutherland) — return in Young Guns, Part 2, which is the story of Billy the Kid and his race to safety in Old Mexico while being trailed by a group of government agents led by Pat Garrett.	266	\N	2019-10-31 13:53:51.280251	2020-07-02 13:58:26.479202	movie
99960381	Mountain Men	\N	/7r8AepolaDkK8G6LyzyivkaOA60.jpg	Profiles of some of the men who choose to live off the grid in the unspoiled wilderness, where dangers like mudslides, falling trees and bears are all part of everyday life.	13	\N	2019-11-01 00:09:52.216089	2020-07-09 00:17:13.086202	tv
612460	Peter's To-Do List	2019-09-17	/5gtr7et1GAnx3VLvqs6QedMptPP.jpg	Before going to Europe with his class, Peter Parker has a lot to do both as himself and as Spider-Man, from buying the necessary equipment at Delmar's to taking down a giant criminal syndicate.	3	\N	2019-11-13 06:57:09.192061	2019-11-13 06:57:09.192061	\N
99975450	Titans	\N	/eeHI5iBSCOxj4HGSOmFM6azBmwb.jpg	A team of young superheroes led by Nightwing (formerly Batman's first Robin) form to combat evil and other perils.	331	\N	2019-11-14 03:08:05.529466	2020-07-09 00:17:13.092443	tv
99968507	His Dark Materials	\N	/xOjRNnQw5hqR1EULJ2iHkGwJVA4.jpg	Lyra is an orphan who lives in a parallel universe in which science, theology and magic are entwined. Lyra's search for a kidnapped friend uncovers a sinister plot involving stolen children, and turns into a quest to understand a mysterious phenomenon called Dust. She is later joined on her journey by Will, a boy who possesses a knife that can cut windows between worlds. As Lyra learns the truth about her parents and her prophesied destiny, the two young people are caught up in a war against celestial powers that ranges across many worlds.	61	\N	2019-11-23 02:35:35.268633	2020-07-09 00:17:13.098121	tv
99982856	The Mandalorian	\N	/BbNvKCuEF4SRzFXR16aK6ISFtR.jpg	Set after the fall of the Empire and before the emergence of the First Order, we follow the travails of a lone gunfighter in the outer reaches of the galaxy far from the authority of the New Republic.	109	\N	2019-11-25 03:04:41.218514	2020-07-09 00:17:13.103269	tv
11780	Rob Roy	1995-04-13	/oyOR8EygIDY7s2ubQyajulWsj9D.jpg	In the highlands of Scotland in the 1700s, Rob Roy tries to lead his small town to a better future, by borrowing money from the local nobility to buy cattle to herd to market. When the money is stolen, Rob is forced into a Robin Hood lifestyle to defend his family and honour.	398	\N	2020-12-13 23:34:43.711481	2020-12-13 23:34:43.711481	movie
8681	Taken	2008-02-18	/wrJjDB8SSJJKcpXVf4KAxZIHvBZ.jpg	While vacationing with a friend in Paris, an American girl is kidnapped by a gang of human traffickers intent on selling her into forced prostitution. Working against the clock, her ex-spy father must pull out all the stops to save her. But with his best years possibly behind him, the job may be more than he can handle.	8247	\N	2020-12-13 23:34:46.897916	2020-12-13 23:34:46.897916	movie
10377	My Cousin Vinny	1992-03-13	/iwSURa8nS2ujwrU3s1lfxxX7voH.jpg	Two carefree pals traveling through Alabama are mistakenly arrested, and charged with murder. Fortunately, one of them has a cousin who's a lawyer - Vincent Gambini, a former auto mechanic from Brooklyn who just passed his bar exam after his sixth try. When he arrives with his leather-clad girlfriend , to try his first case, it's a real shock - for him and the Deep South!	701	\N	2019-10-31 15:41:57.804097	2020-07-02 13:58:26.083512	movie
9941	Down and Out in Beverly Hills	1986-01-31	/8ms9Ig9L5MTl8VA2QJQ4STZdNIX.jpg	Beverly Hills couple Barbara and Dave Whiteman are very rich but not happy Dave is a hard working business man, his wife is only interested in yoga, aerobics and other meditation classes, and he sleeps with the house maid. Their teenage son is confused about his sexuality and their daughter is suffering from eating disorders. While they are celebrating thanksgiving having plenty of food, street tramp Jerry is hungry, homeless, sleeping rough and has lost his dog. Jerry decides to end his life by drowning himself in their swimming pool. Dave rescues him and invites him to stay for a while. How does this stranger change the life style of this family?	127	\N	2019-11-25 19:02:32.169816	2020-07-02 13:58:26.051839	movie
72976	Lincoln	2012-11-09	/oosQMP9sh9LF2xR2eKcQ1iSscWM.jpg	The revealing story of the 16th US President's tumultuous final months in office. In a nation divided by war and the strong winds of change, Lincoln pursues a course of action designed to end the war, unite the country and abolish slavery. With the moral courage and fierce determination to succeed, his choices during this critical moment will change the fate of generations to come.	2386	\N	2019-11-16 23:49:11.219531	2020-07-02 13:58:26.059209	movie
69	Walk the Line	2005-11-18	/j65XLrHEAqXk10pk5BcISCim3L7.jpg	A chronicle of country music legend Johnny Cash's life, from his early days on an Arkansas cotton farm to his rise to fame with Sun Records in Memphis, where he recorded alongside Elvis Presley, Jerry Lee Lewis and Carl Perkins.	1457	\N	2019-11-04 18:28:34.114318	2020-07-02 13:58:26.068418	movie
13715	At Close Range	1986-04-18	/psovrxpKpIc7WRZw2hfvVBrJLOa.jpg	Based upon the true story of Bruce Johnston Sr., his son, and his brothers; together, they constituted one of suburban Philadelphia's most notorious crime families during the 1970's. Their criminal activities ranged from burglary, theft... and ultimately, murder.	116	\N	2019-10-31 13:56:47.035599	2020-07-02 13:58:26.076052	movie
16992	The Boxer	1997-12-31	/7DO6VWE6RITEkK33FTvDinDdfno.jpg	Nineteen-year-old Danny Flynn is imprisoned for his involvement with the I.R.A. in Belfast. He leaves behind his family and his sixteen-year-old girlfriend, Maggie Hamill. Fourteen years later, Danny is released from prison and returns to his old working class neighborhood to resume his life as a boxer.	106	\N	2019-11-16 23:50:38.118723	2020-07-02 13:58:26.542181	movie
2669	The Bounty	1984-05-04	/hXFXIc6F4NXI5emWCKcUwqEPjIZ.jpg	The familiar story of Lieutenant Bligh, whose cruelty leads to a mutiny on his ship. This version follows both the efforts of Fletcher Christian to get his men beyond the reach of British retribution, and the epic voyage of Lieutenant Bligh to get his loyalists safely to East Timor in a tiny lifeboat.	228	\N	2019-11-16 23:51:00.762198	2020-07-02 13:58:26.554418	movie
9556	Darkman	1990-08-24	/mlVu8rQbnZmeBaDpeffoW9xelkL.jpg	Dr. Peyton Westlake is on the verge of realizing a major breakthrough in synthetic skin when his laboratory is destroyed by gangsters. Having been burned beyond recognition and forever altered by an experimental medical procedure, Westlake becomes known as Darkman, assuming alternate identities in his quest for revenge and a new life with a former love.	795	\N	2020-12-13 23:35:03.057713	2020-12-13 23:35:03.057713	movie
82675	Taken 2	2012-09-27	/hMdDaEYrOQ59OC8dVH7fosUeZEP.jpg	In Istanbul, retired CIA operative Bryan Mills and his wife are taken hostage by the father of a kidnapper Mills killed while rescuing his daughter.	4896	\N	2020-12-13 23:35:19.57859	2020-12-13 23:35:19.57859	movie
18823	Clash of the Titans	2010-04-01	/nzaolaRSo8ZIGjxnX89PEnpROae.jpg	Born of a god but raised as a man, Perseus is helpless to save his family from Hades, vengeful god of the underworld. With nothing to lose, Perseus volunteers to lead a dangerous mission to defeat Hades before he can seize power from Zeus and unleash hell on earth. Battling unholy demons and fearsome beasts, Perseus and his warriors will only survive if Perseus accepts his power as a god, defies fate and creates his own destiny.	4622	\N	2020-12-13 23:35:43.170912	2020-12-13 23:35:43.170912	movie
57165	Wrath of the Titans	2012-03-27	/b9n2R3xZWQ8MVZgndQoV34stS0h.jpg	A decade after his heroic defeat of the monstrous Kraken, Perseus-the demigod son of Zeus-is attempting to live a quieter life as a village fisherman and the sole parent to his 10-year old son, Helius. Meanwhile, a struggle for supremacy rages between the gods and the Titans. Dangerously weakened by humanity's lack of devotion, the gods are losing control of the imprisoned Titans and their ferocious leader, Kronos, father of the long-ruling brothers Zeus, Hades and Poseidon.	3083	\N	2020-12-13 23:35:46.19516	2020-12-13 23:35:46.19516	movie
752623	The Lost City	2022-03-24	/neMZH82Stu91d3iqvLdNQfqPPyl.jpg	A reclusive romance novelist who was sure nothing could be worse than getting stuck on a book tour with her cover model, until a kidnapping attempt sweeps them both into a cutthroat jungle adventure, proving life can be so much stranger, and more romantic, than any of her paperback fictions.	648	\N	2022-05-22 01:02:56.031262	2022-05-22 01:02:56.031262	movie
9506	Anger Management	2003-04-11	/mR2R8VANmT3fT43tXTOpmmMzjQE.jpg	After a small misunderstanding aboard an airplane escalates out of control, timid businessman Dave Buznik is ordered by the court to undergo anger management therapy at the hands of specialist Dr. Buddy Rydell. But when Buddy steps up his aggressive treatment by moving in, Dave goes from mild to wild as the unorthodox treatment wreaks havoc with his life.	1783	\N	2019-12-04 03:39:44.491536	2020-06-21 00:15:10.513339	\N
335988	Transformers: The Last Knight	2017-06-16	/s5HQf2Gb3lIO2cRcFwNL9sn1o1o.jpg	Autobots and Decepticons are at war, with humans on the sidelines. Optimus Prime is gone. The key to saving our future lies buried in the secrets of the past, in the hidden history of Transformers on Earth.	3464	\N	2019-12-04 03:32:47.459347	2020-07-02 13:58:26.09238	movie
10158	White Men Can't Jump	1992-03-26	/1wEHR5yxIya9HUCFHVcntTx6q91.jpg	Billy Hoyle and Sidney Deane are an unlikely pair of basketball hustlers. They team up to con their way across the courts of Los Angeles, playing a game that's fast dangerous - and funny.	603	\N	2019-12-04 03:38:13.504394	2020-07-02 13:58:26.100291	movie
3509	A Scanner Darkly	2006-05-25	/72kQ9tlP0fweBmbTqzkfUCTUUS.jpg	An undercover cop in a not-too-distant future becomes involved with a dangerous new drug and begins to lose his own identity as a result.	988	\N	2019-12-04 03:38:37.462029	2020-07-02 13:58:26.113902	movie
14905	Welcome to Sarajevo	1997-05-09	/pF5ZwQV50o7JfjYgeKxbw3pYl0Z.jpg	Follow a group of international journalists into the heart of the once cosmopolitan city of Sarajevo—now a danger zone of sniper and mortar attacks where residents still live. While reporting on an American aid worker who’s trying to get children out of the country, a British correspondent decides to take an orphaned girl home to London.	42	\N	2019-12-04 03:38:20.373334	2020-07-02 13:58:26.121094	movie
8373	Transformers: Revenge of the Fallen	2009-06-19	/lU6u7gNbUEkclmQpFH3Gqp3J2a1.jpg	Sam Witwicky leaves the Autobots behind for a normal life. But when his mind is filled with cryptic symbols, the Decepticons target him and he is dragged back into the Transformers' war.	5290	\N	2019-12-04 03:31:26.778949	2020-07-02 13:58:26.12975	movie
8194	A Guide to Recognizing Your Saints	2006-09-29	/RLAPuTedpMDodCz3OQuoiuscnG.jpg	Dito Montiel, a successful author, receives a call from his long-suffering mother, asking him to return home and visit his ailing father. Dito recalls his childhood growing up in a violent neighborhood in Queens, N.Y., with friends Antonio, Giuseppe, Nerf and Mike.	173	\N	2019-12-04 03:31:22.364824	2020-07-02 13:58:26.137072	movie
1883	Malcolm X	1992-11-18	/vYiJDgJIWjuUXMGzovtOIgLqvZV.jpg	A tribute to the controversial black activist and leader of the struggle for black liberation. He hit bottom during his imprisonment in the '50s, he became a Black Muslim and then a leader in the Nation of Islam. His assassination in 1965 left a legacy of self-determination and racial pride.	752	\N	2019-12-11 14:12:24.700902	2020-07-02 13:58:26.144132	movie
99980968	Narcos: Mexico	\N	/aXwMx8OvRFMfI1RmkbJm6Bq1jVg.jpg	See the rise of the Guadalajara Cartel as an American DEA agent learns the danger of targeting narcos in 1980s Mexico.	59	\N	2019-12-11 14:11:56.045924	2020-07-09 00:17:13.109008	tv
99963351	Narcos	\N	/rTmal9fDbwh5F0waol2hq35U4ah.jpg	A gritty chronicle of the war against Colombia's infamously violent and powerful drug cartels.	874	\N	2019-12-11 14:12:01.670396	2020-07-09 00:17:13.114996	tv
34851	Predators	2010-07-03	/gsnUhWMYLSD8VZS7nrMT9mj9BYr.jpg	A mercenary reluctantly leads a motley crew of warriors who soon come to realize they've been captured and deposited on an alien planet by an unknown nemesis. With the exception of a peculiar physician, they are all cold-blooded killers, convicts, death squad members... hunters who have now become the hunted.	2614	\N	2020-12-16 05:43:24.58293	2020-12-16 05:43:24.58293	movie
625568	Unhinged	2020-07-16	/6WC3cIhuaLZSq3SbtdOp2ZTSTe.jpg	A divorced mother honks impatiently at a deranged middle-aged stranger at a red light while running late on her way to work. His road rage escalates to horrifyingly psychotic proportions as he becomes single-mindedly determined to teach her a deadly lesson for provoking him.	541	\N	2021-01-09 19:08:27.722585	2021-01-09 19:08:27.722585	movie
9451	Election	1999-04-23	/845AubBSikExc8yqTJsu4bGI01A.jpg	A high school teacher's personal life becomes complicated as he works with students during the school elections.	646	\N	2021-01-15 05:09:08.719765	2021-01-15 05:09:08.719765	movie
10264	Hamlet	1990-12-19	/ycM8gwwyOLXW4qxkcu6nhLlfgcA.jpg	Hamlet, Prince of Denmark, finds out that his uncle Claudius killed his father to obtain the throne, and plans revenge.	224	\N	2020-01-15 00:22:29.129949	2020-07-02 13:58:26.215899	movie
10950	I Am Sam	2001-12-28	/8Ukn0K7ybku3JpMkkUOfpZW39f3.jpg	Although Sam has the mental capacity of a 7-year-old, he has a daughter with a homeless woman who abandons them when they leave the hospital, leaving Sam to raise Lucy on his own. But as Lucy grows up, Sam's limitations start to become a problem and the authorities take her away. Sam shames high-priced lawyer, Rita into taking his case pro bono and in turn teaches her the value of love and family.	1132	\N	2019-12-05 16:46:00.537331	2020-07-02 13:58:26.255838	movie
13536	City By The Sea	2002-09-06	/xttd15J9HEak8vX53z55OKnfD2E.jpg	A man struggling to come to terms with the sins of his father makes the terrible discovery that his own son has fallen into a life of crime in a drama based on a true story. Vincent LaMarca is a dedicated and well-respected New York City police detective who has gone to great lengths to distance himself from his past.	176	\N	2019-12-05 16:44:52.273113	2020-07-02 13:58:26.267452	movie
10395	Wolf	1994-06-17	/8ocZb9x6rN82i8ZzZ05j1vWKVOC.jpg	Publisher Will Randall becomes a werewolf and has to fight to keep his job.	471	\N	2019-12-05 16:46:27.118424	2020-06-21 03:15:21.188743	\N
9993322	Oz	\N	/CwqqwYWnMOLUwsqAqveHNnwTGC.jpg	The daily lives of prisoners in Emerald City, an experimental unit of the Oswald Maximum Security Prison where ingroups - Muslims, Latinos, Italians, Aryans - stick close to their mutual friends and terrorizes their mutual enemies.	361	\N	2021-01-15 05:11:48.766483	2021-01-15 05:11:48.766483	tv
464052	Wonder Woman 1984	2020-12-16	/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg	Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.	2641	\N	2021-01-16 00:01:25.317184	2021-01-16 00:01:25.317184	movie
11416	The Mission	1986-09-29	/oTU13XXz4WHisDWKX3X6dFWEjC0.jpg	When a Spanish Jesuit goes into the South American wilderness to build a mission in the hope of converting the Indians of the region, a slave hunter is converted and joins his mission. When Spain sells the colony to Portugal, they are forced to defend all they have built against the Portugese aggressors.	659	\N	2019-12-05 16:44:34.355613	2020-07-02 13:58:26.159811	movie
8195	Ronin	1998-09-25	/oVolaz0eIANKuPXhRuX4H5dz0HB.jpg	A briefcase with undisclosed contents – sought by Irish terrorists and the Russian mob – makes its way into criminals' hands. An Irish liaison assembles a squad of mercenaries, or 'ronin', and gives them the thorny task of recovering the case.	1194	\N	2019-12-05 16:44:39.665379	2020-07-02 13:58:25.71605	movie
1607	A Bronx Tale	1993-09-14	/sDbO6LmLYtyqAoFTPpRcMgPSCEO.jpg	Set in the Bronx during the tumultuous 1960s, an adolescent boy is torn between his honest, working-class father and a violent yet charismatic crime boss. Complicating matters is the youngster's growing attraction - forbidden in his neighborhood - for a beautiful black girl.	890	\N	2019-12-05 16:43:51.230531	2020-07-02 13:58:26.15199	movie
11978	Men of Honor	2000-09-13	/wNUAnXV1mzOOfvnVBIYsalkk078.jpg	Against formidable odds -- and an old-school diving instructor embittered by the U.S. Navy's new, less prejudicial policies -- Carl Brashear sets his sights on becoming the Navy's first African-American master diver in this uplifting true story. Their relationship starts out on the rocks, but fate ultimately conspires to bring the men together into a setting of mutual respect, triumph and honor.	1051	\N	2019-12-05 16:44:38.036004	2020-07-02 13:58:26.167002	movie
9535	Analyze This	1999-03-05	/eqa4TEgkx63WRhqyD8eTwmL7bUi.jpg	Countless wiseguy films are spoofed in this film that centers on the neuroses and angst of a powerful Mafia racketeer who suffers from panic attacks. When Paul Vitti needs help dealing with his role in the "family," unlucky shrink Dr. Ben Sobel is given just days to resolve Vitti's emotional crisis and turn him into a happy, well-adjusted gangster.	943	\N	2019-12-05 16:44:47.631497	2020-07-02 13:58:26.17386	movie
343668	Kingsman: The Golden Circle	2017-09-20	/34xBL6BXNYFqtHO9zhcgoakS4aP.jpg	When an attack on the Kingsman headquarters takes place and a new villain rises, Eggsy and Merlin are forced to work together with the American agency known as the Statesman to save the world.	6040	\N	2019-12-11 14:10:54.14804	2020-07-02 13:58:26.181079	movie
11005	Awakenings	1990-12-04	/itO7cUSzeTCgXjO9zjkXBUjxwub.jpg	Dr. Malcolm Sayer, a shy research physician, uses an experimental drug to "awaken" the catatonic victims of a rare disease. Leonard is the first patient to receive the controversial treatment. His awakening, filled with awe and enthusiasm, proves a rebirth for Sayer too, as the exuberant patient reveals life's simple but unutterably sweet pleasures to the introverted doctor.	1233	\N	2019-12-05 16:43:57.649076	2020-07-02 13:58:26.205944	movie
38050	The Adjustment Bureau	2011-03-03	/A4wKf04g4DCVAWC67uPGozIJPGw.jpg	A man glimpses the future Fate has planned for him – and chooses to fight for his own destiny. Battling the powerful Adjustment Bureau across, under and through the streets of New York, he risks his destined greatness to be with the only woman he's ever loved.	2803	\N	2019-12-11 14:10:59.437804	2020-07-02 13:58:26.224208	movie
526	Ladyhawke	1985-03-27	/vJA2Fhw2uBMiVFdBde2kH7kZ2gw.jpg	Captain Etienne Navarre is a man on whose shoulders lies a cruel curse. Punished for loving each other, Navarre must become a wolf by night whilst his lover, Lady Isabeau, takes the form of a hawk by day. Together, with the thief Philippe Gaston, they must try to overthrow the corrupt Bishop and in doing so break the spell.	617	\N	2019-12-05 16:46:15.074108	2020-07-02 13:58:26.245108	movie
99971912	The Witcher	\N	/zrPpUlehQaBf8YX2NrVrKK8IEpf.jpg	Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.	39	\N	2019-12-22 02:31:36.975142	2020-07-09 00:17:13.1203	tv
399566	Godzilla vs. Kong	2021-03-25	/3Iso4hatk3N0RTkQFAk7YFO4GGy.jpg	In a time when monsters walk the Earth, humanity’s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.	0	\N	2021-02-07 18:02:11.862377	2021-02-07 18:02:11.862377	movie
333484	The Magnificent Seven	2016-09-14	/ezcS78TIjgr85pVdaPDd2rSPVNs.jpg	Looking to mine for gold, greedy industrialist Bartholomew Bogue seizes control of the Old West town of Rose Creek. With their lives in jeopardy, Emma Cullen and other desperate residents turn to bounty hunter Sam Chisolm for help. Chisolm recruits an eclectic group of gunslingers to take on Bogue and his ruthless henchmen. With a deadly showdown on the horizon, the seven mercenaries soon find themselves fighting for more than just money once the bullets start to fly.	3833	\N	2019-12-11 14:13:36.662255	2020-07-02 13:58:25.79317	movie
9665	Glory	1989-12-15	/pGDzBjZvzmSCIEduQBfESLMiwtp.jpg	Robert Gould Shaw leads the US Civil War's first all-black volunteer company, fighting prejudices of both his own Union army and the Confederates.	688	\N	2019-12-11 14:13:32.430684	2020-07-02 13:58:25.802673	movie
9481	The Bone Collector	1999-11-04	/4HiIegmRMV147NDLAEhXI8duho.jpg	Rookie cop, Amelia Donaghy reluctantly teams with Lincoln Rhyme – formerly the department's top homicide detective but now paralyzed as a result of a spinal injury – to catch a grisly serial killer dubbed 'The Bone Collector'. The murderer's special signature is to leave tantalizing clues based on the grim remains of his crimes.	1780	\N	2019-12-11 14:12:56.342505	2020-07-02 13:58:25.812845	movie
14462	The Manchurian Candidate	2004-07-30	/7xlG6nKktCUV0dtpyoGSIJmJBh5.jpg	Years after his squad was ambushed during the Gulf War, Major Ben Marco finds himself having terrible nightmares. He begins to doubt that his fellow squad-mate Sergeant Raymond Shaw, now a vice-presidential candidate, is the hero he remembers him being. As Marco's doubts deepen, Shaw's political power grows, and, when Marco finds a mysterious implant embedded in his back, the memory of what really happened begins to return.	783	\N	2019-12-11 14:13:13.429811	2020-06-21 03:13:08.446144	\N
8470	John Q	2002-02-15	/xEE91LvXiqgs7Hmdl44LCzHtFf6.jpg	John Quincy Archibald is a father and husband whose son is diagnosed with an enlarged heart and then finds out he cannot receive a transplant because HMO insurance will not cover it. Therefore, he decides to take a hospital full of patients hostage until the hospital puts his son's name on the donor's list.	1164	\N	2019-12-11 14:12:48.294244	2020-07-02 13:58:25.822448	movie
8963	Crimson Tide	1995-05-12	/21nqRJ6ofEgVvEl68J4O9V26Xzy.jpg	On a US nuclear missile sub, a young first officer stages a mutiny to prevent his trigger happy captain from launching his missiles before confirming his orders to do so.	868	\N	2019-12-11 14:12:46.137466	2020-07-02 13:58:25.830314	movie
10684	Courage Under Fire	1996-07-04	/8IMkM5JHzl5HttfuxmJAs3UuZGB.jpg	A US Army officer had made a "friendly fire" mistake that was covered up and he was reassigned to a desk job. Later he was tasked to investigate a female chopper commander's worthiness to be awarded the Medal of Honor posthumously. At first all seemed in order. But then he begins to notice inconsistencies between the testimonies of the witnesses....	420	\N	2019-12-11 14:12:40.614737	2020-07-02 13:58:25.838257	movie
7551	Déjà Vu	2006-11-22	/eTX6hklzFOiEVqVukNCEedZKhix.jpg	Called in to recover evidence in the aftermath of a horrific explosion on a New Orleans ferry, Federal agent Doug Carlin gets pulled away from the scene and taken to a top-secret government lab that uses a time-shifting surveillance device to help prevent crime.	2713	\N	2019-12-11 14:12:35.081054	2020-07-02 13:58:25.846169	movie
9882	The Siege	1998-11-06	/gbeeWu8rYaIYMyq9ayN1AepjNxP.jpg	The secret US abduction of a suspected terrorist from his Middle East homeland leads to a wave of terrorist attacks in New York.  An FBI senior agent and his team attempt to locate and decommission the enemy cells, but must also deal with an Army General gone rogue and a female CIA agent of uncertain loyalties.	664	\N	2019-12-11 14:13:07.089594	2020-07-02 13:58:25.854972	movie
10400	The Hurricane	1999-09-17	/eOzbt7KsqTC8gcjJMxcQnr89cxJ.jpg	The story of Rubin "Hurricane" Carter, a boxer wrongly imprisoned for murder, and the people who aided in his fight to prove his innocence.	723	\N	2019-12-11 14:12:30.096577	2020-06-21 03:13:08.506293	\N
99992830	Obi-Wan Kenobi	\N	/qJRB789ceLryrLvOKrZqLKr2CGf.jpg	During the reign of the Galactic Empire, former Jedi Master, Obi-Wan Kenobi, embarks on a crucial mission to confront allies turned enemies and face the wrath of the Empire.	6	\N	2022-05-28 00:04:31.08322	2022-05-28 00:04:31.08322	tv
2116	Out of Time	2003-10-03	/wdniUkm0hwXv2RqzvwWy5XtRNvB.jpg	Matt Lee Whitlock, respected chief of police in small Banyan Key, Florida, must solve a vicious double homicide before he himself falls under suspicion. Matt Lee has to stay a few steps ahead of his own police force and everyone he's trusted in order to find out the truth.	576	\N	2019-12-11 14:12:28.146999	2020-07-02 13:58:25.728582	movie
9271	Virtuosity	1995-08-04	/5emgnXYrXjqyiup2JsvtuENseiV.jpg	The Law Enforcement Technology Advancement Centre (LETAC) has developed SID version 6.7: a Sadistic, Intelligent, and Dangerous virtual reality entity which is synthesized from the personalities of more than 150 serial killers, and only one man can stop him.	277	\N	2019-12-11 14:12:51.506063	2020-07-02 13:58:25.739724	movie
9546	Ricochet	1991-10-04	/5isHYEcUY0nE90uMhkGrs1nnal.jpg	An attorney is terrorized by the criminal he put away years ago when he was a cop.	139	\N	2019-12-11 14:12:59.00942	2020-07-02 13:58:25.747037	movie
551332	The Two Popes	2019-11-28	/4d4mTSfDIFIbUbMLUfaKodvxYXA.jpg	Frustrated with the direction of the church, Cardinal Bergoglio (Jonathan Pryce) requests permission to retire in 2012 from Pope Benedict (Anthony Hopkins). Instead, facing scandal and self-doubt, the introspective Pope Benedict summons his harshest critic and future successor to Rome to reveal a secret that would shake the foundations of the Catholic Church. Behind Vatican walls, a struggle commences between both tradition and progress, guilt and forgiveness, as these two very different men confront their pasts in order to find common ground and forge a future for a billion followers around the world.	63	\N	2019-12-22 02:30:04.269948	2020-07-02 13:58:25.754585	movie
398978	The Irishman	2019-11-01	/mbm8k3GFhXS0ROd9AD1gqYbIFbM.jpg	Pennsylvania, 1956. Frank Sheeran, a war veteran of Irish origin who works as a truck driver, accidentally meets mobster Russell Bufalino. Once Frank becomes his trusted man, Bufalino sends him to Chicago with the task of helping Jimmy Hoffa, a powerful union leader related to organized crime, with whom Frank will maintain a close friendship for nearly twenty years.	1507	\N	2019-12-22 02:31:52.699563	2020-07-02 13:58:25.774615	movie
9800	Philadelphia	1993-12-22	/tFe5Yoo5zT495okA49bq1vPPkiV.jpg	Two competing lawyers join forces to sue a prestigious law firm for AIDS discrimination. As their unlikely friendship develops their courage overcomes the prejudice and corruption of their powerful adversaries.	2241	\N	2019-12-11 14:13:46.570168	2020-07-02 13:58:25.785224	movie
11850	Invasion of the Body Snatchers	1978-12-19	/skS02wdeH2C0nrbCQP3qKwJdZtZ.jpg	The first remake of the paranoid infiltration classic moves the setting for the invasion, from a small town to the city of San Francisco and starts as Matthew Bennell notices that several of his friends are complaining that their close relatives are in some way different. When questioned later they themselves seem changed, as they deny everything or make lame excuses. As the invaders increase in number they become more open and Bennell, who has by now witnessed an attempted "replacement", realises that he and his friends must escape or suffer the same fate. But who can he trust to help him and who has already been snatched?	451	\N	2019-12-22 04:34:32.914981	2019-12-22 04:34:32.914981	\N
99963639	The Expanse	\N	/wikmaI7OVqmq2O9HfknkzxX6Ygu.jpg	A thriller set two hundred years in the future following the case of a missing young woman who brings a hardened detective and a rogue ship's captain together in a race across the solar system to expose the greatest conspiracy in human history.	804	\N	2019-12-31 02:37:52.975822	2020-07-09 00:17:13.126463	tv
259695	Live by Night	2016-12-25	/7kxSjMrjJIXqgFMAT4CvKF5nnF6.jpg	A story set in the Prohibition Era and centered on a group of individuals and their dealings in the world of organized crime.	1006	\N	2021-05-02 01:56:53.606155	2021-05-02 01:56:53.606155	movie
486947	The Guilty	2018-06-14	/42QPG6p7oLcLd4LQOPeSTLhqfMx.jpg	Police officer Asger Holm, demoted to desk work as an alarm dispatcher, answers a call from a panicked woman who claims to have been kidnapped. Confined to the police station and with the phone as his only tool, Asger races against time to get help and find her.	577	\N	2019-12-24 15:50:58.275005	2019-12-24 15:50:58.275005	\N
254578	Phoenix	2014-09-25	/k9urjjKcwBYKoRnls3Pxxst6yL9.jpg	A disfigured concentration-camp survivor, unrecognizable after facial reconstruction surgery, searches ravaged postwar Berlin for the husband who might have betrayed her to the Nazis.	227	\N	2019-12-24 16:25:54.019704	2019-12-24 16:25:54.019704	\N
335778	Risen	2016-02-18	/bJfls3xZqEyPyXWONQLcMX6KxIC.jpg	Clavius, a powerful Roman military tribune, and his aide, Lucius, are tasked with solving the mystery of what happened to Jesus in the weeks following the crucifixion, in order to disprove the rumors of a risen Messiah and prevent an uprising in Jerusalem.	603	\N	2021-05-23 03:30:27.235521	2021-05-23 03:30:27.235521	movie
23759	Centurion	2010-02-15	/ePiabUJVmHSwXtW5t98bn7G2wxo.jpg	Britain, A.D. 117. Quintus Dias, the sole survivor of a Pictish raid on a Roman frontier fort, marches north with General Virilus' legendary Ninth Legion, under orders to wipe the Picts from the face of the Earth and destroy their leader, Gorlacon.	999	\N	2021-05-23 03:31:22.560017	2021-05-23 03:31:22.560017	movie
8676	Fool's Gold	2008-02-07	/5pIqVNmWJ87K5dk9tE01o6gknZJ.jpg	Treasure hunter Ben 'Finn' Finnegan has sunk both his trusty boat and his marriage to Tess in his obsessive quest to find the legendary 'Queen's Dowry' treasure. When he finds a vital clue that may finally pinpoint the treasure's whereabouts, he drags Tess and her boss along on the hunt. But Finn is not the only one interested in the gold—his former mentor-turned-enemy will stop at nothing to beat him to it.	842	\N	2019-12-22 04:36:15.243459	2020-07-02 13:58:25.432588	movie
12554	Citizen X	1995-02-25	/7J2WRnqJJpUzwcFoJZX2JA4T9Xg.jpg	Based on the true story of a Russian serial killer who, over many years, claimed victim to over 50 people. His victims were mostly under the age of 17. In what was then a communists state, the police investigations were hampered by bureaucracy, incompetence and those in power. The story is told from the viewpoint of the detective in charge of the case.	106	\N	2019-12-22 04:35:11.256572	2020-07-02 13:58:25.458156	movie
12117	Instinct	1999-06-04	/8EKmzia6awjsqFxgBk5a82aTmb6.jpg	In a prison for the criminally insane, deranged anthropologist Ethan Powell is set to be examined by a bright young psychiatrist, Theo Caulder. Driven by ambition and a hunger for the truth, Caulder will eventually risk everything -- even put his very life on the line -- in a harrowing attempt to understand the bizarre actions of this madman.	310	\N	2019-12-22 04:36:10.010194	2020-06-21 03:13:08.376619	\N
16619	Ordinary People	1980-09-19	/fxXvhczta3Pqy04JoHRfyhXuyo6.jpg	Beth, Calvin, and their son Conrad are living in the aftermath of the death of the other son. Conrad is overcome by grief and misplaced guilt to the extent of a suicide attempt. He is in therapy. Beth had always preferred his brother and is having difficulty being supportive to Conrad. Calvin is trapped between the two trying to hold the family together.	279	\N	2019-12-22 04:34:37.30922	2020-07-02 13:58:25.870855	movie
27582	The Mechanic	2011-01-13	/fDAEJr4WLZLJQmckA2JZNICt0u3.jpg	Arthur Bishop is a 'mechanic' - an elite assassin with a strict code and unique talent for cleanly eliminating targets. It's a job that requires professional perfection and total detachment, and Bishop is the best in the business. But when he is ordered to take out his mentor and close friend Harry, Bishop is anything but detached.	1824	\N	2019-12-22 04:36:23.628679	2020-07-02 13:58:25.422554	movie
6950	Outbreak	1995-03-10	/4KymNvlWR0XF0sqX2BWRd9Z3yXR.jpg	A deadly airborne virus finds its way into the USA and starts killing off people at an epidemic rate. Col Sam Daniels' job is to stop the virus spreading from a small town, which must be quarantined, and to prevent an over reaction by the White House.	985	\N	2019-12-22 04:36:54.095126	2020-07-02 13:58:25.878301	movie
443463	Leave No Trace	2018-06-29	/w69iId8e80xBpyF0r2rfZoqRwQj.jpg	A father and daughter live a perfect but mysterious existence in Forest Park, a beautiful nature reserve near Portland, Oregon, rarely making contact with the world. But when a small mistake tips them off to authorities, they are sent on an increasingly erratic journey in search of a place to call their own.	509	\N	2019-12-24 16:22:16.419786	2020-07-02 13:58:25.889636	movie
620725	Jexi	2019-10-10	/pdYhXJPoV0Kvwdih74lejHPTyWL.jpg	Phil's new phone comes with an unexpected feature, Jexi...an A.I. determined to keep him all to herself in a comedy about what can happen when you love your phone more than all else.	24	\N	2019-12-25 03:45:25.407328	2020-07-02 13:58:25.925184	movie
466272	Once Upon a Time… in Hollywood	2019-07-25	/8j58iEBw9pOXFD2L0nt0ZXeHviB.jpg	Los Angeles, 1969. TV star Rick Dalton, a struggling actor specializing in westerns, and stuntman Cliff Booth, his best friend, try to survive in a constantly changing movie industry. Dalton is the neighbor of the young and promising actress and model Sharon Tate, who has just married the prestigious Polish director Roman Polanski…	3612	\N	2020-01-02 19:04:56.00852	2020-07-02 13:58:25.970117	movie
429203	The Old Man & the Gun	2018-09-27	/a4BfxRK8dBgbQqbRxPs8kmLd8LG.jpg	The true story of Forrest Tucker, from his audacious escape from San Quentin at the age of 70 to an unprecedented string of heists that confounded authorities and enchanted the public. Wrapped up in the pursuit are a detective, who becomes captivated with Forrest’s commitment to his craft, and a woman, who loves him in spite of his chosen profession.	701	\N	2020-01-03 16:25:35.41418	2020-07-02 13:58:25.993792	movie
999136738	Wolf Like Me	\N	/8eZerQDLDkdvQ7vrv6Slkr36sHX.jpg	Gary is an emotional wreck and struggles to provide for his daughter since the death of his wife. Mary has a secret she can't bring herself to share with anyone. The universe brought these two together for a reason.	17	\N	2022-03-05 19:02:31.250893	2022-03-05 19:02:31.250893	tv
9654	The Italian Job	2003-05-30	/eSkjK4kctyrWpFhxl35GPvSs6tI.jpg	Charlie Croker pulled off the crime of a lifetime. The one thing that he didn't plan on was being double-crossed. Along with a drop-dead gorgeous safecracker, Croker and his team take off to re-steal the loot and end up in a pulse-pounding, pedal-to-the-metal chase that careens up, down, above and below the streets of Los Angeles.	3345	\N	2019-12-22 04:37:01.818317	2020-07-02 13:58:26.008975	movie
86850	Dracula	\N	/34gkyMEtfHlEhX1y0O09ZFnJyPn.jpg	Transylvania, 1897. The blood-drinking Count Dracula is drawing his plans against Victorian London. And be warned: the dead travel fast.	62	\N	2020-01-13 23:04:25.49168	2020-01-13 23:04:25.49168	\N
99940008	Hannibal	\N	/pDmSd9ahrWEf3MyhsfVEWsT7qH6.jpg	Both a gift and a curse, Graham has the extraordinary ability to think like his prey—he sees what they see, feels what they feel. But while Graham is pursuing an especially troubling, cannibalistic murderer, Special Agent Jack Crawford teams him with a highly respected psychiatrist – a man with a taste for the criminal minded – Dr. Hannibal Lecter.	721	\N	2020-01-08 19:33:14.849029	2020-07-09 00:17:13.132075	tv
9991398	The Sopranos	\N	/lUE0Bp7wH0EterJ44qMRsqtKFnp.jpg	The story of New Jersey-based Italian-American mobster Tony Soprano and the difficulties he faces as he tries to balance the conflicting requirements of his home life and the criminal organization he heads. Those difficulties are often highlighted through his ongoing professional relationship with psychiatrist Jennifer Melfi. The show features Tony's family members and Mafia associates in prominent roles and story arcs, most notably his wife Carmela and his cousin and protégé Christopher Moltisanti.	878	\N	2020-01-08 19:34:48.366949	2020-07-09 00:17:13.138316	tv
9270	Brick	2006-03-31	/zaOozUSc9yUGVm46j4YzFx4yNKR.jpg	A teenage loner pushes his way into the underworld of a high school crime ring to investigate the disappearance of his ex-girlfriend.	651	\N	2020-01-07 08:13:58.142145	2020-07-02 13:58:25.587047	movie
13996	Bottle Shock	2008-08-06	/3Y6E1iHlfS588TASj3cfi2BoApm.jpg	Paris-based wine expert Steven Spurrier heads to California in search of cheap wine that he can use for a blind taste test in the French capital. Stumbling upon the Napa Valley, the stuck-up Englishman is shocked to discover a winery turning out top-notch chardonnay. Determined to make a name for himself, he sets about getting the booze back to Paris.	103	\N	2020-01-04 05:13:13.603727	2020-07-02 13:58:25.596075	movie
20544	Something the Lord Made	2004-05-30	/5cbeG0f82NpamRjT0zUc7JbGMFn.jpg	A dramatization of the relationship between heart surgery pioneers Alfred Blalock and Vivien Thomas.	76	\N	2020-01-04 05:13:06.385899	2020-07-02 13:58:25.605696	movie
2207	16 Blocks	2006-03-01	/vh48M3ZMN2M7B1IIX3hRnyER6zT.jpg	An aging cop is assigned the ordinary task of escorting a fast-talking witness from police custody to a courthouse, but they find themselves running the gauntlet as other forces try to prevent them from getting there.	1158	\N	2020-01-04 05:12:59.072645	2020-07-02 13:58:25.617014	movie
99969740	Ozark	\N	/pCGyPVrI9Fzw6rE1Pvi4BIXF6ET.jpg	A financial adviser drags his family from Chicago to the Missouri Ozarks, where he must launder $500 million in five years to appease a drug boss.	431	\N	2020-01-06 20:11:54.27641	2020-07-09 00:17:13.143649	tv
99960059	Better Call Saul	\N	/zjg4jpK1Wp2kiRvtt5ND0kznako.jpg	Six years before Saul Goodman meets Walter White. We meet him when the man who will become Saul Goodman is known as Jimmy McGill, a small-time lawyer searching for his destiny, and, more immediately, hustling to make ends meet. Working alongside, and, often, against Jimmy, is “fixer” Mike Erhmantraut. The series will track Jimmy's transformation into Saul Goodman, the man who puts “criminal” in “criminal lawyer".	1237	\N	2020-01-06 20:14:08.592551	2020-07-09 00:17:13.149433	tv
9991423	Ray Donovan	\N	/zxftW7ZGVrOCqH2ifuruieCTb5X.jpg	Set in the sprawling mecca of the rich and famous, Ray Donovan does the dirty work for LA's top power players, and makes their problems disappear. His father's unexpected release from prison sets off a chain of events that shakes the Donovan family to its core.	414	\N	2020-01-06 20:15:40.542188	2020-07-09 00:17:13.155386	tv
1770	Michael Collins	1996-10-25	/brIBbU6t9glEGAKRTJ4PMj9OiDC.jpg	Michael Collins plays a crucial role in the establishment of the Irish Free State in the 1920s, but becomes vilified by those hoping to create a completely independent Irish republic.	222	\N	2020-01-04 05:13:44.341629	2020-07-02 13:58:25.46883	movie
99919885	Sherlock	\N	/f9zGxLHGyQB10cMDZNY5ZcGKhZi.jpg	A modern update finds the famous sleuth and his doctor partner solving crime in 21st century London.	1987	\N	2020-01-06 20:17:51.798006	2020-07-09 00:17:13.161323	tv
99963174	Lucifer	\N	/1sBx2Ew4WFsa1YY32vlHt079O03.jpg	Bored and unhappy as the Lord of Hell, Lucifer Morningstar abandoned his throne and retired to Los Angeles, where he has teamed up with LAPD detective Chloe Decker to take down criminals. But the longer he's away from the underworld, the greater the threat that the worst of humanity could escape.	1179	\N	2020-01-06 20:20:37.613953	2020-07-09 00:17:13.167463	tv
99967683	Travelers	\N	/aUVeyeyTrQrSFuUkqLCT8FtV7pp.jpg	Hundreds of years from now, the last surviving humans discover the means of sending consciousness back through time, directly into people in the 21st century. These "travelers" assume the lives of seemingly random people, while secretly working as teams to perform missions in order to save humanity from a terrible future.	249	\N	2020-01-08 19:34:12.210963	2020-07-09 00:17:13.172919	tv
11120	The Mosquito Coast	1986-11-26	/8A1iDYSp8H5WORWZVCV3E3SpkGD.jpg	Allie Fox, an American inventor exhausted by the perceived danger and degradation of modern society, decides to escape with his wife and children to Belize. In the jungle, he tries with mad determination to create a utopian community with disastrous results.	298	\N	2021-05-02 04:28:41.380378	2021-05-02 04:28:41.380378	movie
10360	Hunger	2008-05-15	/gXSZaacDkHTmvJJvq0VwsbqlHXI.jpg	The story of Bobby Sands, the IRA member who led the 1981 hunger strike during The Troubles in which Irish Republican prisoners tried to win political status.	826	\N	2021-05-23 03:31:29.654503	2021-05-23 03:31:29.654503	movie
9433	The Edge	1997-09-06	/fvokkKZuhMosdpABHduMdOdIDkp.jpg	The plane carrying wealthy Charles Morse crashes down in the Alaskan wilderness. Together with the two other passengers, photographer Robert and assistant Stephen, Charles devises a plan to help them reach civilization. However, his biggest obstacle might not be the elements, or even the Kodiak bear stalking them -- it could be Robert, whom Charles suspects is having an affair with his wife and would not mind seeing him dead.	619	\N	2020-01-15 00:21:51.476641	2020-07-02 13:58:25.543492	movie
12201	Edge of Darkness	2010-01-28	/pvHjp1vEFmp5FquSCPQ2O95tIZJ.jpg	As a seasoned homicide detective, Thomas Craven has seen the bleakest side of humanity. But nothing prepares him for the toughest investigation of his life: the search for his only daughter Emma's killer. Now, he is on a personal mission to uncover the disturbing secrets surrounding her murder, including corporate corruption, government collusion and Emma's own mysterious life.	880	\N	2020-01-15 00:22:04.515285	2020-07-02 13:58:25.552081	movie
2112	Payback	1999-02-05	/6wvtqAKsMso4oKTCmAlKtV2W0Zy.jpg	With friends like these, who needs enemies? That's the question bad guy Porter is left asking after his wife and partner steal his heist money and leave him for dead -- or so they think. Five months and an endless reservoir of bitterness later, Porter's partners and the crooked cops on his tail learn how bad payback can be.	962	\N	2020-01-15 00:22:26.21251	2020-07-02 13:58:25.560607	movie
944	Lethal Weapon 4	1998-07-10	/4ebq3ykzEy2rmsxMhN9pEfm4sul.jpg	In the combustible action franchise's final installment, maverick detectives Martin Riggs and Roger Murtaugh square off against Asian mobster Wah Sing Ku, who's up to his neck in slave trading and counterfeit currency. With help from gumshoe Leo Getz and smart-aleck rookie cop Lee Butters, Riggs and Murtaugh aim to take down Ku and his gang.	1451	\N	2020-01-15 00:22:16.522469	2020-07-02 13:58:25.571926	movie
99961662	Schitt's Creek	\N	/iRfSzrPS5VYWQv7KVSEg2BZZL6C.jpg	Formerly filthy rich video store magnate Johnny Rose, his soap star wife Moira, and their two kids, über-hipster son David and socialite daughter Alexis, suddenly find themselves broke and forced to live in Schitt's Creek, a small depressing town they once bought as a joke.	87	\N	2020-01-15 00:25:27.351905	2020-07-09 00:17:13.178275	tv
99995215	Reservation Dogs	\N	/22nDkAmXKK9OnNKBtBiGCXiEBQT.jpg	This comedy follows the exploits of four Indigenous teenagers in rural Oklahoma who steal, rob and save in order to get to the exotic, mysterious and faraway land of California.	37	\N	2021-08-30 21:50:59.52551	2021-08-30 21:50:59.52551	tv
99997546	Ted Lasso	\N	/39rtdG2QoPIOISmS6KNdJDes8vy.jpg	Ted Lasso, an American football coach, moves to England when he’s hired to manage a soccer team—despite having no experience. With cynical players and a doubtful town, will he get them to see the Ted Lasso Way?	260	\N	2021-08-30 21:51:09.338596	2021-08-30 21:51:09.338596	tv
99980475	Wellington Paranormal	\N	/eaGpAP4bKMjVlMIoGqKzMRJ2OIG.jpg	New Zealand's capital is a hotbed of supernatural activity... so Officers Minogue and O'Leary, who featured in the vampire documentary What We Do In The Shadows, take to the streets to investigate all manner of paranormal phenomena.	15	\N	2021-08-30 21:51:29.417341	2021-08-30 21:51:29.417341	tv
9659	Mad Max	1979-04-12	/5LrI4GiCSrChgkdskVZiwv643Kg.jpg	In a postapocalyptic future, jaded cop Max Rockatansky (Mel Gibson) is ready to retire. But his world is shattered when a malicious gang murders his family as an act of retaliation, forcing a devastated Max to hit the open road seeking vengeance. As he travels the Australian outback's empty stretches of highway, he tours the bloodstained battlegrounds ruled by marauding bikers who feed on violence.	2349	\N	2020-01-15 00:23:04.489531	2020-01-15 00:23:04.489531	\N
438631	Dune	2021-09-15	/d5NXSklXo0qyIYkgV94XAgMIckC.jpg	Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet's exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity's greatest potential-only those who can conquer their fear will survive.	3361	\N	2021-11-06 19:43:25.896617	2021-11-06 19:43:25.896617	movie
1571	Live Free or Die Hard	2007-06-20	/31TT47YjBl7a7uvJ3ff1nrirXhP.jpg	John McClane is back and badder than ever, and this time he's working for Homeland Security. He calls on the services of a young hacker in his bid to stop a ring of Internet terrorists intent on taking control of America's computer infrastructure.	4574	\N	2021-11-06 19:44:15.873897	2021-11-06 19:44:15.873897	movie
3172	Bandits	2001-10-12	/67AUAkiT4rbgqN7SNlIJn0zWZqU.jpg	Two bank robbers fall in love with the girl they've kidnapped.	754	\N	2021-11-06 19:44:44.318755	2021-11-06 19:44:44.318755	movie
9292	Hudson Hawk	1991-05-23	/g1FJLGg9TaCzgjCmTJmONGIhTar.jpg	Eddie Hawkins, called Hudson Hawk has just been released from ten years of prison and is planning to spend the rest of his life honestly. But then the crazy Mayflower couple blackmail him to steal some of the works of Leonardo da Vinci. If he refuses, they threaten to kill his friend Tommy.	721	\N	2021-11-06 19:44:54.28647	2021-11-06 19:44:54.28647	movie
497698	Black Widow	2021-07-07	/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg	Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.	5765	\N	2021-11-06 19:47:50.530762	2021-11-06 19:47:50.530762	\N
637649	Wrath of Man	2021-04-22	/M7SUK85sKjaStg4TKhlAVyGlz3.jpg	A cold and mysterious new security guard for a Los Angeles cash truck company surprises his co-workers when he unleashes precision skills during a heist. The crew is left wondering who he is and where he came from. Soon, the marksman's ultimate motive becomes clear as he takes dramatic and irrevocable steps to settle a score.	2565	\N	2021-11-06 19:48:05.12115	2021-11-06 19:48:05.12115	\N
588228	The Tomorrow War	2021-07-02	/34nDCQZwaEvsy4CFO5hkGRFDCVU.jpg	The world is stunned when a group of time travelers arrive from the year 2051 to deliver an urgent message: Thirty years in the future, mankind is losing a global war against a deadly alien species. The only hope for survival is for soldiers and civilians from the present to be transported to the future and join the fight. Among those recruited is high school teacher and family man Dan Forester. Determined to save the world for his young daughter, Dan teams up with a brilliant scientist and his estranged father in a desperate quest to rewrite the fate of the planet.	4488	\N	2021-11-06 19:48:08.805467	2021-11-06 19:48:08.805467	\N
791373	Zack Snyder's Justice League	2021-03-18	/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg	Determined to ensure Superman's ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince with plans to recruit a team of metahumans to protect the world from an approaching threat of catastrophic proportions.	6774	\N	2021-11-06 19:48:16.016706	2021-11-06 19:48:16.016706	\N
800497	Werewolves Within	2021-06-25	/WoG2tvwanOMlU0qsbxpf9Qd3y.jpg	When a proposed pipeline creates hostilities between residents of a small town, a newly-arrived forest ranger must keep the peace after a snowstorm confines the townspeople to an old lodge. But when a mysterious creature begins terrorizing the group, their worst tendencies and prejudices rise to the surface, and it is up to the ranger to keep the residents alive, both from each other and the monster which plagues them.	172	\N	2021-11-06 19:49:43.970055	2021-11-06 19:49:43.970055	\N
999131927	Dexter: New Blood	\N	/9EBKgrFIsCFSV1RZKWhYUdbtGiv.jpg	10 years after Dexter went missing in the eye of Hurricane Laura, we find him living under an assumed name in the small town of Iron Lake, New York.  Dexter may be embracing his new life, but in the wake of unexpected events in this close-knit community, his Dark Passenger beckons.	223	\N	2021-11-28 20:24:28.767523	2021-11-28 20:24:28.767523	tv
99988329	Hawkeye	\N	/5BxY6UN0e7wAE5LUQVVj39JAItM.jpg	Former Avenger Clint Barton has a seemingly simple mission: get back to his family for Christmas. Possible? Maybe with the help of Kate Bishop, a 22-year-old archer with dreams of becoming a superhero. The two are forced to work together when a presence from Barton’s past threatens to derail far more than the festive spirit.	322	\N	2021-11-28 20:27:22.283665	2021-11-28 20:27:22.283665	tv
10502	The Man Without a Face	1993-08-25	/9dmH2jc6jwlZo90JQTFOx4XaBWt.jpg	Justin McLeod is a former teacher who lives as a recluse on the edge of town after his face is disfigured from an automobile accident ten years earlier, in which a boy was incinerated—and for which he was convicted of involuntary manslaughter. Also suspected of being a paedophile, he is befriended by Chuck, causing the town's suspicions and hostility to be ignited.	271	\N	2020-01-15 00:22:41.532393	2020-07-02 13:58:25.647763	movie
11646	Gallipoli	1981-08-13	/un7VCqTmjrq3u75mQ204a8tofD4.jpg	As World War I rages, brave and youthful Australians Archy and Frank—both agile runners—become friends and enlist in the Australian and New Zealand Army Corps together. They later find themselves part of the Dardanelles Campaign on the Gallipoli peninsula, a brutal eight-month conflict which pit the British and their allies against the Ottoman Empire and left over 500,000 men dead.	226	\N	2020-01-15 00:22:53.329844	2020-07-02 13:58:25.656855	movie
381663	Becoming Mayan: Creating Apocalypto	2007-05-22	\N	An overview of the making of Mel Gibson's 'Apocalypto'.	20	\N	2020-01-15 00:23:38.699106	2020-07-02 13:58:25.682004	movie
550988	Free Guy	2021-08-11	/xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg	A bank teller called Guy realizes he is a background character in an open world video game called Free City that will soon go offline.	3847	\N	2021-11-28 20:27:42.10107	2021-11-28 20:27:42.10107	movie
436969	The Suicide Squad	2021-07-28	/kb4s0ML0iVZlG6wAKbbs9NAm6X.jpg	Supervillains Harley Quinn, Bloodsport, Peacemaker and a collection of nutty cons at Belle Reve prison join the super-secret, super-shady Task Force X as they are dropped off at the remote, enemy-infused island of Corto Maltese.	4854	\N	2021-11-28 20:27:53.608275	2021-11-28 20:27:53.608275	movie
9991405	Dexter	\N	/58H6Ctze1nnpS0s9vPmAAzPcipR.jpg	Dexter Morgan, a blood spatter pattern analyst for the Miami Metro Police also leads a secret life as a serial killer, hunting down criminals who have slipped through the cracks of justice.	2679	\N	2021-11-28 20:28:21.688391	2021-11-28 20:28:21.688391	tv
973164	Ricky Gervais: SuperNature	2022-05-24	/ry2HDP5KyEV3R7htXlFAeQbbXgf.jpg	With his signature pitch-black sense of humor, Ricky Gervais takes the stage at the London Palladium in this provocative stand-up comedy special.	57	\N	2022-06-01 02:21:21.192218	2022-06-01 02:21:21.192218	movie
39514	RED	2010-10-13	/adHKzS0v29apMxJlKuvAf1ykNnS.jpg	When his peaceful life is threatened by a high-tech assassin, former black-ops agent, Frank Moses reassembles his old team in a last ditch effort to survive and uncover his assailants.	4484	\N	2020-01-24 03:01:57.376723	2020-07-02 13:58:25.067612	movie
19959	Surrogates	2009-09-24	/v3Z0Hbl0oe57njrrIPh0fJPFoo.jpg	Set in a futuristic world where humans live in isolation and interact through surrogate robots, a cop is forced to leave his home for the first time in years in order to investigate the murders of others' surrogates.	2005	\N	2020-01-24 03:01:48.892244	2020-07-02 13:58:25.079332	movie
231	Syriana	2005-11-23	/mO3hWUTOxmLJxihvDU0YFkb0Mb5.jpg	The Middle Eastern oil industry is the backdrop of this tense drama, which weaves together numerous story lines. Bennett Holiday is an American lawyer in charge of facilitating a dubious merger of oil companies, while Bryan Woodman, a Switzerland-based energy analyst, experiences both personal tragedy and opportunity during a visit with Arabian royalty. Meanwhile, veteran CIA agent Bob Barnes uncovers an assassination plot with unsettling origins.	774	\N	2020-01-24 02:58:08.342577	2020-07-02 13:58:25.087919	movie
1792	Stuck on You	2003-12-10	/gUbNzcIdKCoqp9amNFpFQfpBzrB.jpg	In Martha's Vineyard, Mass., conjoined twins Walt (Greg Kinnear) and Bob Tenor (Matt Damon) make the best of their handicap by being the fastest grill cooks in town. While outgoing Walt hopes to one day become a famous actor, shy Bob prefers to stay out of the spotlight. When a fading Hollywood actress, Cher (Cher), decides to get her show "Honey and the Beaze" cancelled, she hires Walt -- and his brotherly appendage -- as her costars. But their addition surprisingly achieves the opposite.	380	\N	2020-01-24 02:57:15.484102	2020-07-02 13:58:25.690071	movie
11323	The Informant!	2009-09-18	/qqcmJrzVx3Yx3IcBpqrgb2SK1Rx.jpg	A rising star at agri-industry giant Archer Daniels Midland (ADM), Mark Whitacre suddenly turns whistleblower. Even as he exposes his company’s multi-national price-fixing conspiracy to the FBI, Whitacre envisions himself being hailed as a hero of the common man and handed a promotion.	513	\N	2020-01-24 02:57:36.158669	2020-07-02 13:58:25.697919	movie
12647	Billy Bathgate	1991-11-01	/6dWFktWZlCJw5PYutbqM9MW8X2T.jpg	In the year 1935, a teen named Billy Bathgate finds first love while becoming the protégé of fledgling gangster Dutch Schultz.	102	\N	2020-01-24 03:02:33.345788	2020-07-02 13:58:25.705986	movie
395834	Wind River	2017-08-03	/pySivdR845Hom4u4T2WNkJxe6Ad.jpg	An FBI agent teams with the town's veteran game tracker to investigate a murder that occurred on a Native American reservation.	3819	\N	2021-12-04 20:44:44.397461	2021-12-04 20:44:44.397461	movie
99984958	Loki	\N	/kEl2t3OhXc3Zb9FBh1AuYzRTgZp.jpg	After stealing the Tesseract during the events of “Avengers: Endgame,” an alternate version of Loki is brought to the mysterious Time Variance Authority, a bureaucratic organization that exists outside of time and space and monitors the timeline. They give Loki a choice: face being erased from existence due to being a “time variant” or help fix the timeline and stop a greater threat.	8163	\N	2021-12-04 20:45:57.212058	2021-12-04 20:45:57.212058	tv
615457	Nobody	2021-03-18	/oBgWY00bEFeZ9N25wWVyuQddbAo.jpg	Hutch Mansell, a suburban dad, overlooked husband, nothing neighbor — a "nobody." When two thieves break into his home one night, Hutch's unknown long-simmering rage is ignited and propels him on a brutal path that will uncover dark secrets he fought to leave behind.	3710	\N	2021-12-04 20:47:25.493826	2021-12-04 20:47:25.493826	movie
617653	The Last Duel	2021-10-13	/zjrJE0fpzPvX8saJXj8VNfcjBoU.jpg	King Charles VI declares that Knight Jean de Carrouges settle his dispute with his squire, Jacques Le Gris, by challenging him to a duel.	708	\N	2021-12-07 07:31:58.804569	2021-12-07 07:31:58.804569	movie
566525	Shang-Chi and the Legend of the Ten Rings	2021-09-01	/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg	Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.	4312	\N	2021-12-18 07:32:00.204189	2021-12-18 07:32:00.204189	movie
600583	The Power of the Dog	2021-09-13	/kEy48iCzGnp0ao1cZbNeWR6yIhC.jpg	A domineering but charismatic rancher wages a war  of intimidation on his brother's new wife and her teen son, until long-hidden secrets come to light.	362	\N	2021-12-18 07:32:15.326783	2021-12-18 07:32:15.326783	movie
999110492	Peacemaker	\N	/hE3LRZAY84fG19a18pzpkZERjTE.jpg	The continuing story of Peacemaker – a compellingly vainglorious man who believes in peace at any cost, no matter how many people he has to kill to get it – in the aftermath of the events of “The Suicide Squad.”	1222	\N	2022-02-27 03:07:12.386353	2022-02-27 03:07:12.386353	tv
624860	The Matrix Resurrections	2021-12-16	/8c4a8kE7PizaGQQnditMmI1xbRp.jpg	Plagued by strange memories, Neo's life takes an unexpected turn when he finds himself back inside the Matrix.	3063	\N	2022-02-27 03:07:21.612248	2022-02-27 03:07:21.612248	movie
646380	Don't Look Up	2021-12-07	/th4E1yqsE8DGpAseLiUrI60Hf8V.jpg	Two low-level astronomers must go on a giant media tour to warn humankind of an approaching comet that will destroy planet Earth.	4705	\N	2022-02-27 03:07:52.516042	2022-02-27 03:07:52.516042	movie
370172	No Time to Die	2021-09-29	/iUgygt3fscRoKWCV1d0C7FbM9TP.jpg	Bond has left active service and is enjoying a tranquil life in Jamaica. His peace is short-lived when his old friend Felix Leiter from the CIA turns up asking for help. The mission to rescue a kidnapped scientist turns out to be far more treacherous than expected, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.	3578	\N	2022-03-05 19:01:48.992384	2022-03-05 19:01:48.992384	movie
999120909	The Tourist	\N	/sxZHAk74Oq0Uxh5KLJGo1u133SU.jpg	When a man wakes up in the Australian outback with no memory, he must use the few clues he has to discover his identity before his past catches up with him.	33	\N	2022-03-10 23:38:53.759102	2022-03-10 23:38:53.759102	tv
37710	The Tourist	2010-12-08	/54TV2S0BN3kyxqhPZgOsYGngPrf.jpg	American tourist Frank meets mysterious British woman Elsie on the train to Venice. Romance seems to bud, but there's more to her than meets the eye. Remake of the 2005 French film "Anthony Zimmer", written and directed by Jérôme Salle.	4605	\N	2022-03-10 23:38:57.717149	2022-03-10 23:38:57.717149	movie
545609	Extraction	2020-04-24	/wlfDxbGEsW58vGhFljKkcR5IxDj.jpg	Tyler Rake, a fearless mercenary who offers his services on the black market, embarks on a dangerous mission when he is hired to rescue the kidnapped son of a Mumbai crime lord…	1931	\N	2020-05-17 02:16:14.812218	2020-07-02 13:58:25.096582	movie
6951	Turner & Hooch	1989-07-28	/g3LC4mc17fQIFnPsMi81zzKC5gF.jpg	Scott Turner has 3 days left in the local police department before he moves to a bigger city to get some "real" cases, not just misdemeanors. Then Amos Reed is murdered, and Scott Turner sets himself on the case. The closest thing to a witness in the case is Amos Reed's dog, Hooch, which Scott Turner has to take care of if it's going to avoid being "put to sleep".	652	\N	2020-01-29 04:02:36.954685	2020-07-02 13:58:25.103964	movie
2619	Splash	1984-03-09	/7FutTsMWBwVhjk1Ujf1wtndUVZh.jpg	A successful businessman falls in love with the girl of his dreams. There's one big complication though; he's fallen hook, line and sinker for a mermaid.	692	\N	2020-01-29 04:02:24.551089	2020-07-02 13:58:25.110855	movie
10466	The Money Pit	1986-03-15	/2JgulKePt7LkQGQnYkOLOljwUCs.jpg	After being evicted from their Manhattan apartment, a couple buy what looks like the home of their dreams—only to find themselves saddled with a bank-account-draining nightmare. Struggling to keep their relationship together as their rambling mansion falls to pieces around them, the two watch in hilarious horror as everything—including the kitchen sink—disappears into the Money Pit.	562	\N	2020-01-29 04:01:49.684538	2020-07-02 13:58:25.119942	movie
109414	This Is the End	2013-06-12	/7Wdc3etyBJA4432TYtz6n9GQd1c.jpg	While attending a party at James Franco's house, Seth Rogen, Jay Baruchel and many other celebrities are faced with the apocalypse.	4142	\N	2020-01-25 04:33:41.82988	2020-07-02 13:58:25.127582	movie
187017	22 Jump Street	2014-06-05	/ajB6cGvoy04438RzvfO6Sz28yMK.jpg	After making their way through high school (twice), big changes are in store for officers Schmidt and Jenko when they go deep undercover at a local college. But when Jenko meets a kindred spirit on the football team, and Schmidt infiltrates the bohemian art major scene, they begin to question their partnership. Now they don't have to just crack the case - they have to figure out if they can have a mature relationship. If these two overgrown adolescents can grow from freshmen into real men, college might be the best thing that ever happened to them.	5559	\N	2020-01-25 04:33:02.456011	2020-07-02 13:58:25.134446	movie
9296	S1m0ne	2002-08-23	/mdHEOCSGPvwa9pYiV1ZDZ1ihj42.jpg	The career of a disillusioned producer, who is desperate for a hit, is endangered when his star walks off the film set. Forced to think fast, the producer decides to digitally create an actress "Simone" to sub for the star — the first totally believable synthetic actress.	512	\N	2020-01-25 04:32:22.735026	2020-07-02 13:58:25.14506	movie
11062	City Hall	1996-02-16	/8Xd2EQlQ4a6ABycfQbeDucMKDB3.jpg	The accidental shooting of a boy in New York leads to an investigation by the Deputy Mayor, and unexpectedly far-reaching consequences.	123	\N	2020-01-25 04:31:51.563162	2020-07-02 13:58:25.161843	movie
9494	Look Who's Talking	1989-10-12	/k60x5YEOox9P9vWITSHFSkLGecN.jpg	Mollie is a single working mother who's out to find the perfect father for her child. Her baby, Mikey, prefers James, a cab driver turned babysitter who has what it takes to make them both happy. But Mollie won't even consider James. It's going to take all the tricks a baby can think of to bring them together before it's too late	1261	\N	2020-01-24 03:02:51.025593	2020-07-02 13:58:25.170894	movie
99972750	Killing Eve	\N	/cmLJFWOklp4PpUkUfeCFIKntbTH.jpg	A security consultant hunts for a ruthless assassin. Equally obsessed with each other, they go head to head in an epic game of cat-and-mouse.	216	\N	2020-03-21 02:17:38.604023	2020-07-09 00:17:13.18425	tv
10029	Very Bad Things	1998-09-11	/rYmyRxF5e9fBdgcQScKu0CUtMy5.jpg	Kyle Fisher has one last night to celebrate life as a single man before marrying Laura, so he sets out to Vegas with four of his best buddies. But a drug and alcohol filled night on the town with a stripper who goes all the way, turns into a cold night in the desert with shovels when the stripper goes all the way into a body bag after dying in their bathroom. And that's just the first of the bodies to pile up before Kyle can walk down the aisle...	482	\N	2022-03-17 21:06:13.089778	2022-03-17 21:06:13.089778	movie
99986248	Upload	\N	/6SIDIB59JYsQ8EfUgM0IaFfwXtS.jpg	In 2033, people who are near death can be “uploaded” into virtual reality hotels run by 6 tech firms. Cash-strapped Nora lives in Brooklyn and works customer service for the luxurious “Lakeview” digital afterlife. When L.A. party-boy/coder Nathan’s self-driving car crashes, his high-maintenance girlfriend uploads him permanently into Nora’s VR world.	732	\N	2022-03-17 21:09:17.199876	2022-03-17 21:09:17.199876	tv
999125949	We Own This City	\N	/qNOYmU6JYMeu2I0xOX9pgCBOBXi.jpg	The story of the rise and fall of the Baltimore Police Department's Gun Trace Task Force — and the corruption and moral collapse that befell an American city in which the policies of drug prohibition and mass arrest were championed at the expense of actual police work.	26	\N	2022-06-01 23:35:41.175499	2022-06-01 23:35:41.175499	tv
531876	The Outpost	2020-06-24	/hPkqY2EMqWUnFEoedukilIUieVG.jpg	A small unit of U.S. soldiers, alone at the remote Combat Outpost Keating, located deep in the valley of three mountains in Afghanistan, battles to defend against an overwhelming force of Taliban fighters in a coordinated attack. The Battle of Kamdesh, as it was known, was the bloodiest American engagement of the Afghan War in 2009 and Bravo Troop 3-61 CAV became one of the most decorated units of the 19-year conflict.	750	\N	2022-06-01 23:36:13.810199	2022-06-01 23:36:13.810199	movie
13813	Defiance	2008-12-31	/gVGj4Ixtijb77kDzZmZCIlxCywL.jpg	Based on a true story, during World War II, four Jewish brothers escape their Nazi-occupied homeland of West Belarus in Poland and join the Soviet partisans to combat the Nazis. The brothers begin the rescue of roughly 1,200 Jews still trapped in the ghettos of Poland.	1073	\N	2020-03-21 21:06:13.591396	2020-06-21 00:14:20.076171	\N
7972	Before the Devil Knows You're Dead	2007-09-26	/egIP0s1ws6fGHqTsVqVNcaEa5i2.jpg	When two brothers organize the robbery of their parents' jewelry store, the job goes horribly wrong, triggering a series of events that send them and their family hurtling towards a shattering climax.	779	\N	2020-03-21 03:32:30.208602	2020-07-02 13:58:25.369129	movie
290859	Terminator: Dark Fate	2019-10-23	/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg	Decades after Sarah Connor prevented Judgment Day, a lethal new Terminator is sent to eliminate the future leader of the resistance. In a fight to save mankind, battle-hardened Sarah Connor teams up with an unexpected ally and an enhanced super soldier to stop the deadliest Terminator yet.	1251	\N	2020-02-02 22:38:18.498652	2020-07-02 13:58:25.180742	movie
515001	Jojo Rabbit	2019-10-18	/7GsM4mtM0worCtIVeiQt28HieeN.jpg	A World War II satire that follows a lonely German boy whose world view is turned upside down when he discovers his single mother is hiding a young Jewish girl in their attic. Aided only by his idiotic imaginary friend, Adolf Hitler, Jojo must confront his blind nationalism.	2367	\N	2020-03-14 05:08:43.706244	2020-07-02 13:58:25.189552	movie
627	Trainspotting	1996-07-19	/6UTzw3kipgTYAJCX8GExoXzcVOx.jpg	\N	5221	\N	2019-05-06 16:36:56.60453	2020-07-02 13:58:24.914794	movie
12227	White Fang	1991-01-18	/27wg0rVZW8hX7nWeHCwTf9DygGc.jpg	Jack London's classic adventure story about the friendship developed between a Yukon gold hunter and the mixed dog-wolf he rescues from the hands of a man who mistreats him.	310	\N	2020-03-21 03:34:11.991967	2020-07-02 13:58:25.205349	movie
145066	Waterland	1992-08-21	/wTgDzq2qjjr3t7TRnnlQYv8PXSI.jpg	The story of a mentally anguished high school history teacher going through a complete reassessment of his life. His method for reassessing his life is to narrate it to his class and interweave in it three generations of his family's history.	13	\N	2020-03-21 03:34:51.877399	2020-07-02 13:58:25.213807	movie
11450	Quiz Show	1994-08-25	/yoGJo1h3Hl2exXPVcG9UXWDENtX.jpg	Quiz Show is a 1994 American historical drama film which tells the true story of the Twenty One quiz show scandal of the 1950s.	484	\N	2020-03-21 03:34:58.982417	2020-07-02 13:58:25.222992	movie
10544	Ned Kelly	2003-03-22	/xmGQsMbXKELzD4n78uMoCsgJPi4.jpg	After getting threatened by Kelly's friends and family, Constable Fitzpatrick places the blame on Ned Kelly and exaggerates what happened. With the biggest ever award available, Kelly and his gang set into the wild, to remain hidden from everyone who seeks them. Even if it means having his family arrested, the members of the Kelly Gang stay hidden and plan a way to get their names cleared.	212	\N	2020-03-21 03:47:23.215921	2020-07-02 13:58:25.240578	movie
49849	Cowboys & Aliens	2011-07-29	/9uZsGCP4rvOHVGCpMpYq5gNCuNI.jpg	A stranger stumbles into the desert town of Absolution with no memory of his past and a futuristic shackle around his wrist. With the help of mysterious beauty Ella and the iron-fisted Colonel Dolarhyde, he finds himself leading an unlikely posse of cowboys, outlaws, and Apache warriors against a common enemy from beyond this world in an epic showdown for survival.	3434	\N	2020-03-21 21:07:02.691427	2020-07-02 13:58:25.254932	movie
2788	Reality Bites	1994-02-18	/qGDhodtpkpxkrFqokenGNJlzt6w.jpg	A small circle of friends suffering from post-collegiate blues must confront the hard truth about life, love and the pursuit of gainful employment. As they struggle to map out survival guides for the future, the Gen-X quartet soon begins to realize that reality isn't all it's cracked up to be.	395	\N	2020-03-21 03:34:40.463665	2020-07-02 13:58:25.270364	movie
8978	Assault on Precinct 13	2005-01-19	/cqdH1UH0RXKOjeRAwKc8MGMVOfy.jpg	On New Year's Eve, inside a police station that's about to be closed for good, officer Jake Roenick must cobble together a force made up cops and criminals to save themselves from a mob looking to kill mobster Marion Bishop.	586	\N	2020-03-21 03:33:05.182572	2020-07-02 13:58:25.282381	movie
7305	Alive	1993-01-15	/uQACcCZqd7WCTRin9xRIW5gr1bd.jpg	The amazing, true story of a Uruguayan rugby team's plane that crashed in the middle of the Andes mountains, and their immense will to survive and pull through alive, forced to do anything and everything they could to stay alive on meager rations and through the freezing cold.	800	\N	2020-03-21 03:32:56.824212	2020-07-02 13:58:25.29237	movie
10219	Snow Falling on Cedars	1999-12-22	/jLBvJ5IPqjUvBRo5R4wsGdsSdQk.jpg	In the 1950s, a Japanese-American fisherman is suspected of killing his neighbour at sea—and race is a factor in the trial. So is reporter, Ishmael.	72	\N	2020-03-21 03:32:45.697686	2020-07-02 13:58:25.307928	movie
22954	Invictus	2009-12-10	/cNUoXM8dtg5mRt90GLrAHBP9IGE.jpg	Newly elected President Nelson Mandela knows his nation remains racially and economically divided in the wake of apartheid. Believing he can bring his people together through the universal language of sport, Mandela rallies South Africa's rugby team as they make their historic run to the 1995 Rugby World Cup Championship match.	2441	\N	2020-03-21 02:20:41.977726	2020-07-02 13:58:25.335678	movie
99994951	Mythic Quest: Raven's Banquet	\N	/lEPXDqTntfWGWoU4E0xtxhFn2Wj.jpg	Meet the team behind the biggest multiplayer video game of all time. But in a workplace focused on building worlds, molding heroes, and creating legends, the most hard-fought battles don’t occur in the game—they happen in the office.	23	\N	2020-04-11 02:12:04.858584	2020-07-09 00:17:13.189826	tv
9991408	House	\N	/lkvhReTBZ2Ksl0Dl5Oplsf6UYkF.jpg	Dr. Gregory House, a drug-addicted, unconventional, misanthropic medical genius, leads a team of diagnosticians at the fictional Princeton–Plainsboro Teaching Hospital in New Jersey.	1529	\N	2020-04-11 02:12:56.500045	2020-07-09 00:17:13.19532	tv
2149	Body of Evidence	1993-01-15	/cwClvEmE9TbHpip2T1g3pMxF9QX.jpg	Sizzingly sexy Madonna leads a star-filled cast in this erotic thriller as a woman accused of killing a wealthy, elderly man through her insatiable sexual prowess.	137	\N	2020-03-28 02:52:18.412731	2020-07-02 13:58:24.837812	movie
424694	Bohemian Rhapsody	2018-10-24	/lHu1wtNaczFPGFDTrjCSzeLPTKN.jpg	Singer Freddie Mercury, guitarist Brian May, drummer Roger Taylor and bass guitarist John Deacon take the music world by storm when they form the rock 'n' roll band Queen in 1970. Hit songs become instant classics. When Mercury's increasingly wild lifestyle starts to spiral out of control, Queen soon faces its greatest challenge yet – finding a way to keep the band together amid the success and excess.	10406	\N	2020-04-04 03:25:00.926758	2020-07-02 13:58:25.388	movie
3536	U-571	2000-04-20	/3CBXRPpv5tSxHbO7RMkCezKQw66.jpg	In the midst of World War II, the battle under the sea rages and the Nazis have the upper hand as the Allies are unable to crack their war codes. However, after a wrecked U-boat sends out an SOS signal, the Allies realise this is their chance to seize the 'enigma coding machine'.	632	\N	2020-04-10 23:42:02.121643	2020-07-02 13:58:25.400351	movie
12149	Frailty	2001-11-17	/hER3sVCZ9cZRBO0KNI7NbtiLacn.jpg	A man confesses to an FBI agent his family's story of how his religious fanatic father's visions lead to a series of murders to destroy supposed 'demons'.	651	\N	2020-04-10 23:42:40.1179	2020-07-02 13:58:24.625548	movie
9910	Two for the Money	2005-10-07	/5SedPYdGLrp6LX9C2cWXLx38w1D.jpg	A former college athlete joins forces with a sports consultant to handicap football games for high-rolling gamblers.	341	\N	2020-04-10 23:43:00.372148	2020-07-02 13:58:24.638295	movie
11831	Amistad	1997-12-03	/vhOZNKsyShoNLNBBKeXNWBPAta1.jpg	In 1839, the slave ship Amistad set sail from Cuba to America. During the long trip, Cinque leads the slaves in an unprecedented uprising. They are then held prisoner in Connecticut, and their release becomes the subject of heated debate. Freed slave Theodore Joadson wants Cinque and the others exonerated and recruits property lawyer Roger Baldwin to help his case. Eventually, John Quincy Adams also becomes an ally.	749	\N	2020-04-10 23:43:08.196938	2020-07-02 13:58:24.652746	movie
9571	Dazed and Confused	1993-09-24	/iyHxeLedlNyDf5qs8naGnzECK5b.jpg	The adventures of a group of Texas teens on their last day of school in 1976, centering on student Randall Floyd, who moves easily among stoners, jocks and geeks. Floyd is a star athlete, but he also likes smoking weed, which presents a conundrum when his football coach demands he sign a "no drugs" pledge.	1165	\N	2020-04-10 23:43:31.434652	2020-07-02 13:58:24.671677	movie
634649	Spider-Man: No Way Home	2021-12-15	/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg	Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.	10259	\N	2022-03-23 21:42:35.899228	2022-03-23 21:42:35.899228	movie
857	Saving Private Ryan	1998-07-24	/JC8KQ2BXaAIFEU8zEuakiwUQSr.jpg	\N	8088	\N	2019-03-29 20:23:06.446599	2020-07-02 13:58:24.93195	movie
106646	The Wolf of Wall Street	2013-12-25	/sOxr33wnRuKazR9ClHek73T8qnK.jpg	\N	12197	\N	2019-05-14 16:07:13.401079	2020-07-02 13:58:24.943577	movie
680860	I Want You Back	2022-02-10	/mljQydSPAmyshvq1WHKveNfDLeC.jpg	Peter and Emma thought they were on the precipice of life’s biggest moments – marriage, kids, and houses in the suburbs – until their respective partners dumped them. Horrified to learn that the loves of their lives have already moved on, Peter and Emma hatch a hilarious plan to win back their exes with unexpected results.	101	\N	2022-03-23 21:46:37.119924	2022-03-23 21:46:37.119924	movie
11060	Internal Affairs	1990-01-12	/3c2Q8Y0iCVEAqLuZEyziwiIt63j.jpg	Keen young Raymold Avila joins the Internal Affairs Department of the Los Angeles police. He and partner Amy Wallace are soon looking closely at the activities of cop Dennis Peck whose financial holdings start to suggest something shady. Indeed Peck is involved in any number of dubious or downright criminal activities. He is also devious, a womaniser, and a clever manipulator, and he starts to turn his attention on Avila.	178	\N	2020-04-11 02:51:10.980133	2020-07-02 13:58:24.746538	movie
4349	The Kingdom	2007-08-22	/AgtEL99178EEEKfd44mvvoPRZt1.jpg	A team of U.S. government agents is sent to investigate the bombing of an American facility in the Middle East.	920	\N	2020-04-19 02:54:31.009497	2020-07-02 13:58:24.765086	movie
11365	Wilde	1997-09-01	/66ieZHIIOkeQAjAi4ekFpcCLozA.jpg	The story of Oscar Wilde, genius, poet, playwright and the First Modern Man. The self-realisation of his homosexuality caused Wilde enormous torment as he juggled marriage, fatherhood and responsibility with his obsessive love for Lord Alfred Douglas.	147	\N	2020-04-19 02:56:01.266646	2020-07-02 13:58:24.778004	movie
359724	Ford v Ferrari	2019-11-13	/6ApDtO7xaWAfPqfi2IARXIzj8QS.jpg	American car designer Carroll Shelby and the British-born driver Ken Miles work together to battle corporate interference, the laws of physics, and their own personal demons to build a revolutionary race car for Ford Motor Company and take on the dominating race cars of Enzo Ferrari at the 24 Hours of Le Mans in France in 1966.	2367	\N	2020-04-19 21:20:44.049217	2020-07-02 13:58:24.790796	movie
1722	Captain Corelli's Mandolin	2001-04-18	/h66HtgcL1fNa4LePZPHr7gh2JWX.jpg	When a Greek fisherman leaves to fight with the Greek army during WWII, his fiancee falls in love with the local Italian commander. The film is based on a novel about an Italian soldier's experiences during the Italian occupation of the Greek island of Cephalonia (Kefalonia), but Hollywood made it into a pure love story by removing much of the "unpleasant" stuff.	302	\N	2020-04-19 21:22:09.964831	2020-07-02 13:58:24.801573	movie
530723	Bad Education	2019-09-08	/gizz5FphOtfSnLaGpRALOZgILd5.jpg	A superintendent of a school district works for the betterment of the student’s education while embezzling public funds to live the life he wants.	4	\N	2020-04-25 02:18:32.226193	2020-07-02 13:58:24.812082	movie
9331	Clear and Present Danger	1994-08-03	/6xTM8FPxrLRYwz6I3fqtwh7xybs.jpg	CIA Analyst Jack Ryan is drawn into an illegal war fought by the US government against a Colombian drug cartel.	759	\N	2020-03-28 02:52:29.784195	2020-07-02 13:58:24.827825	movie
1632	Mississippi Burning	1988-12-08	/hTv8Bkq3W1vwKi1IWCLWQW9PNU4.jpg	Two FBI agents investigating the murder of civil rights workers during the 60s seek to breach the conspiracy of silence in a small Southern town where segregation divides black and white. The younger agent trained in FBI school runs up against the small town ways of his partner, a former sheriff.	811	\N	2020-03-28 02:52:12.38965	2020-07-02 13:58:24.847476	movie
7364	Sahara	2005-04-06	/cqQMx3FTtfUdoqGHQcpII2uqbun.jpg	Scouring the ocean depths for treasure-laden shipwrecks is business as usual for a thrill-seeking underwater adventurer and his wisecracking buddy. But when these two cross paths with a beautiful doctor, they find themselves on the ultimate treasure hunt.	835	\N	2020-04-10 23:42:24.571639	2020-07-02 13:58:25.410346	movie
522241	The Courier	2021-03-18	/zFIjKtZrzhmc7HecdFXXjsLR2Ig.jpg	Cold War spy Greville Wynne and his Russian source try to put an end to the Cuban Missile Crisis.	655	\N	2022-03-23 21:47:55.670237	2022-03-23 21:47:55.670237	movie
453395	Doctor Strange in the Multiverse of Madness	2022-05-04	/wRnbWt44nKjsFPrqSmwYki5vZtF.jpg	Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.	0	\N	2022-03-23 21:48:44.736859	2022-03-23 21:48:44.736859	movie
379170	Sherlock: The Abominable Bride	2016-01-01	/hibE8cyZs2Bm0o4WaWd1pppvjO2.jpg	Sherlock Holmes and Dr. Watson find themselves in 1890s London in this holiday special.	1980	\N	2022-03-23 21:48:48.798706	2022-03-23 21:48:48.798706	movie
179	The Interpreter	2005-04-08	/6Z5zcXO8yz0CObeqpfrDSnvBJYT.jpg	After Silvia Broome, an interpreter at United Nations headquarters, overhears plans of an assassination, an American Secret Service agent is sent to investigate.	764	\N	2019-12-05 16:43:17.522492	2020-07-02 13:58:24.317917	movie
5851	Showtime	2002-03-14	/5zVuAf6yed4qt5TuMn5l9C6rZLz.jpg	A spoof of buddy cop movies where two very different cops are forced to team up on a new reality based T.V. cop show.	514	\N	2019-12-05 16:44:22.425161	2020-07-02 13:58:24.326237	movie
11371	The Score	2001-07-13	/fsb4m9XW59mei8GKznvI3lLzcfp.jpg	An aging thief hopes to retire and live off his ill-gotten wealth when a young kid convinces him into doing one last heist.	825	\N	2019-12-05 16:44:19.242356	2020-07-02 13:58:24.335183	movie
11821	Doc Hollywood	1991-08-02	/dU6go0qc4v423g2eoo63Mvml8JX.jpg	After leaving Washington D.C. hospital, plastic surgeon Ben Stone heads for California, where a lucrative practice in Beverly Hills awaits. After a car accident, he's sentenced to perform as the community's general practitioner.	276	\N	2019-12-04 03:39:14.391108	2020-07-02 13:58:24.345489	movie
586	Wag the Dog	1997-12-25	/ziqhMmj0Flz5AGCsSq2ZVoXhb4z.jpg	During the final weeks of a presidential race, the President is accused of sexual misconduct. To distract the public until the election, the President's adviser hires a Hollywood producer to help him stage a fake war.	478	\N	2019-12-04 03:39:11.416607	2020-07-02 13:58:24.376809	movie
10278	Return to Paradise	1998-08-10	/i3bSXP5IIIBcXmI8Csp66uuH2kP.jpg	Lewis, Sheriff and Tony are three friends vacationing in Malaysia. Sheriff and Tony eventually leave to pursue careers in New York, but Lewis stays behind to work with orangutans. Two years later, Sheriff and Tony learn that, because of their past actions, Lewis has been arrested for drug possession. With Lewis facing a death sentence, the friends are left with a difficult decision: return to Malaysia and split Lewis' sentence, or let him die.	67	\N	2019-10-18 02:50:20.133901	2020-07-02 13:58:24.397593	movie
522627	The Gentlemen	2020-01-01	/jtrhTYB7xSrJxR1vusu99nvnZ1g.jpg	American expat Mickey Pearson has built a highly profitable marijuana empire in London. When word gets out that he’s looking to cash out of the business forever it triggers plots, schemes, bribery and blackmail in an attempt to steal his domain out from under him.	1175	\N	2020-05-17 02:16:56.704578	2020-07-02 13:58:24.866582	movie
13	Forrest Gump	\N	/clolk7rB5lAjs41SD0Vt6IXYLMm.jpg	A man with a low IQ has accomplished great things in his life and been present during significant historic events—in each case, far exceeding what anyone imagined he could do. But despite all he has achieved, his one true love eludes him.	14061	\N	2019-03-20 15:30:07.270964	2020-07-02 13:58:24.884952	movie
101	Léon: The Professional	\N	/wHqGb8J6tXBVwjqWooGMtNEjs2A.jpg	Léon, the top hit man in New York, has earned a rep as an effective "cleaner". But when his next-door neighbors are wiped out by a loose-cannon DEA agent, he becomes the unwilling custodian of 12-year-old Mathilda. Before long, Mathilda's thoughts turn to revenge, and she considers following in Léon's footsteps.	7272	\N	2019-03-20 15:30:08.808691	2020-07-02 13:58:24.897095	movie
1266	Street Kings	2008-04-10	/csXyZ1BsDBlH0PXkOFWxggEf9WF.jpg	Tom Ludlow is a disillusioned L.A. Police Officer, rarely playing by the rules and haunted by the death of his wife. When evidence implicates him in the execution of a fellow officer, he is forced to go up against the cop culture he's been a part of his entire career, ultimately leading him to question the loyalties of everyone around him.	760	\N	2020-04-11 02:13:13.505871	2020-07-02 13:58:24.951951	movie
612	Munich	2005-12-23	/3aU825BI4IsdCPGXANqH2tqePde.jpg	During the 1972 Olympic Games in Munich, eleven Israeli athletes are taken hostage and murdered by a Palestinian terrorist group known as Black September. In retaliation, the Israeli government recruits a group of Mossad agents to track down and execute those responsible for the attack.	1435	\N	2020-03-21 21:06:29.306541	2020-07-02 13:58:24.960379	movie
2978	Ghostbusters II	1989-06-16	/yObYPMA58DnTMvJooFW7GG6jWAt.jpg	Five years after they defeated Gozer, the Ghostbusters are out of business. When Dana begins to have ghost problems again, the boys come out of retirement to aid her and hopefully save New York City from a new paranormal threat.	2263	\N	2019-10-19 02:14:32.261716	2020-07-02 13:58:24.968882	movie
1593	Night at the Museum	2006-12-21	/uY9k8t2FQkMj60obnAnsPKLxHCE.jpg	Chaos reigns at the natural history museum when night watchman Larry Daley accidentally stirs up an ancient curse, awakening Attila the Hun, an army of gladiators, a Tyrannosaurus rex and other exhibits.	6326	\N	2019-10-19 02:13:34.68197	2020-07-02 13:58:24.994293	movie
203801	The Man from U.N.C.L.E.	2015-08-14	/7DsYsX6TGROhMwEcwVxgjPlLuov.jpg	At the height of the Cold War, a mysterious criminal organization plans to use nuclear weapons and technology to upset the fragile balance of power between the United States and Soviet Union. CIA agent Napoleon Solo and KGB agent Illya Kuryakin are forced to put aside their hostilities and work together to stop the evildoers in their tracks. The duo's only lead is the daughter of a missing German scientist, whom they must find soon to prevent a global catastrophe.	3725	\N	2019-10-19 02:13:36.980322	2020-07-02 13:58:25.010937	movie
109443	Anchorman 2: The Legend Continues	2013-12-18	/55volAzeebtFzyrx7DJkegvw8Ta.jpg	With the 70s behind him, San Diego's top rated newsman, Ron Burgundy, returns to take New York's first 24-hour news channel by storm.	1499	\N	2019-10-18 06:27:31.851608	2020-07-02 13:58:25.020964	movie
8488	Hitch	2005-02-11	/3ESvmnm6L01vE1mjZOK93LIj3vG.jpg	Dating coach Alex 'Hitch' Hitchens mentors a bumbling client, Albert, who hopes to win the heart of the glamorous Allegra Cole. While Albert makes progress, Hitch faces his own romantic setbacks when proven techniques fail to work on Sara Melas, a tabloid reporter digging for dirt on Allegra Cole's love life. When Sara discovers Hitch's connection to Albert – now Allegra's boyfriend – it threatens to destroy both relationships.	3308	\N	2019-10-18 06:26:36.697925	2020-07-02 13:58:25.034088	movie
321741	Concussion	2015-12-25	/gAEWE1toUskXS76yNlKFQkdTnZt.jpg	A dramatic thriller based on the incredible true David vs. Goliath story of American immigrant Dr. Bennet Omalu, the brilliant forensic neuropathologist who made the first discovery of CTE, a football-related brain trauma, in a pro player and fought for the truth to be known. Omalu's emotional quest puts him at dangerous odds with one of the most powerful institutions in the world.	1529	\N	2019-10-18 06:26:55.407048	2020-07-02 13:58:25.053276	movie
4347	Atonement	2007-09-07	/hMRIyBjPzxaSXWM06se3OcNjIQa.jpg	As a 13-year-old, fledgling writer Briony Tallis irrevocably changes the course of several lives when she accuses her older sister's lover of a crime he did not commit.	3301	\N	2022-03-23 21:49:09.067025	2022-03-23 21:49:09.067025	movie
9676	The Black Dahlia	2006-09-15	/xGrKS601NXswR0P5MpJ0EWplOEl.jpg	Lee Blanchard and Bucky Bleichert are former boxers-turned-cops in 1940s Los Angeles and, when an aspiring young actress turns up dead, Blanchard and Bleichert must grapple with corruption, narcissism, stag films and family madness as they pursue the killer.	585	\N	2019-12-04 03:36:35.23712	2020-07-02 13:58:24.432176	movie
13260	Semi-Pro	2008-02-28	/7KJrvJf96UpkXsWVOjzCo1IbnW6.jpg	Jackie Moon is the owner, promoter, coach, and star player of the Flint Michigan Tropics of the American Basketball Association (ABA). In 1976 before the ABA collapses, the National Basketball Association (NBA) plans to merge with the best teams of the ABA at the end of the season. Only the top four teams will make the move and the worst teams will fold. The Tropics are the worst team in the league and if they want to make it to the NBA, Jackie Moon must rally his team and start winning. The only problem is the fact that Jackie Moon is not really the coach and star basketball player he thinks he is. To keep his team from oblivion and leave his mark in the city, Jackie Moon must inspire his team to win fourth place in the playoffs.	454	\N	2019-12-04 03:38:24.179028	2020-07-02 13:58:24.439719	movie
11543	Kingpin	1996-07-04	/o3yoL3dcPzAE2QpwG7iJlvEeiG7.jpg	After bowler Roy Munson swindles the wrong crowd and is left with a hook for a hand, he settles into impoverished obscurity. That is, until he uncovers the next big thing: an Amish kid named Ishmael. So, the corrupt and the hopelessly naïve hit the circuit intent on settling an old score with Big Ern.	429	\N	2019-12-04 03:37:51.253168	2020-07-02 13:58:24.454204	movie
11184	Kinsey	2004-09-04	/cODCjWNRcZkwe4ONQs1GzRqYtRb.jpg	Kinsey is a portrait of researcher Alfred Kinsey, driven to uncover the most private secrets of a nation. What begins for Kinsey as a scientific endeavor soon takes on an intensely personal relevance, ultimately becoming an unexpected journey into the mystery of human behavior.	238	\N	2019-12-04 03:34:50.018916	2020-07-02 13:58:24.461953	movie
4513	30 Days of Night	2007-10-17	/4t1BG7EgoUuCWWMEnfvOsEtymi7.jpg	This is the story of an isolated Alaskan town that is plunged into darkness for a month each year when the sun sinks below the horizon. As the last rays of light fade, the town is attacked by a bloodthirsty gang of vampires bent on an uninterrupted orgy of destruction. Only the small town's husband-and-wife Sheriff team stand between the survivors and certain destruction.	1515	\N	2019-12-04 03:36:28.308074	2020-07-02 13:58:24.471759	movie
217	Indiana Jones and the Kingdom of the Crystal Skull	2008-05-21	/56As6XEM1flWvprX4LgkPl8ii4K.jpg	Set during the Cold War, the Soviets – led by sword-wielding Irina Spalko – are in search of a crystal skull which has supernatural powers related to a mystical Lost City of Gold. After being captured and then escaping from them, Indy is coerced to head to Peru at the behest of a young man whose friend – and Indy's colleague – Professor Oxley has been captured for his knowledge of the skull's whereabouts.	4847	\N	2019-12-04 03:32:28.235866	2020-07-02 13:58:24.480891	movie
676	Pearl Harbor	2001-05-21	/8YEAyz87KA4G9QWit9uEV20Phdr.jpg	The lifelong friendship between Rafe McCawley and Danny Walker is put to the ultimate test when the two ace fighter pilots become entangled in a love triangle with beautiful Naval nurse Evelyn Johnson. But the rivalry between the friends-turned-foes is immediately put on hold when they find themselves at the center of Japan's devastating attack on Pearl Harbor on Dec. 7, 1941.	3706	\N	2019-12-04 03:36:44.223612	2020-07-02 13:58:24.488696	movie
38356	Transformers: Dark of the Moon	2011-06-28	/kO0TvxkDWtOyWZzBoEuaKxJElhq.jpg	Sam Witwicky takes his first tenuous steps into adulthood while remaining a reluctant human ally of Autobot-leader Optimus Prime. The film centers around the space race between the USSR and the USA, suggesting there was a hidden Transformers role in it all that remains one of the planet's most dangerous secrets.	5268	\N	2019-12-04 03:31:53.048074	2020-07-02 13:58:24.49664	movie
76493	The Dictator	2012-05-15	/7NkfBiQWyCL3HPOskZNgcFslyCr.jpg	The heroic story of a dictator who risks his life to ensure that democracy would never come to the country he so lovingly oppressed.	3308	\N	2019-11-25 19:08:36.367892	2020-07-02 13:58:24.504275	movie
1452	Superman Returns	2006-06-28	/6ZYOpyhFZrAQIe1BuhqVgzfAdGZ.jpg	Superman returns to discover his 5-year absence has allowed Lex Luthor to walk free, and that those he was closest to felt abandoned and have moved on. Luthor plots his ultimate revenge that could see millions killed and change the face of the planet forever, as well as ridding himself of the Man of Steel.	2532	\N	2019-11-25 19:06:53.297182	2020-07-02 13:58:24.515027	movie
239571	The Best of Me	2014-10-16	/8QBWh2Iwf1iUfsu2NfCue2V1hpV.jpg	A pair of former high school sweethearts reunite after many years when they return to visit their small hometown.	1630	\N	2019-11-25 19:06:33.71587	2020-07-02 13:58:24.523394	movie
68730	Silence	2016-12-22	/wO8XKAt3JUpdij27gIq6Maq4JMp.jpg	Two Jesuit priests travel to seventeenth century Japan which has, under the Tokugawa shogunate, banned Catholicism and almost all foreign contact.	1699	\N	2019-11-16 23:49:37.45224	2020-07-02 13:58:24.531509	movie
177677	Mission: Impossible - Rogue Nation	2015-07-31	/oUDKymEL932AeHyl4A4ee8zuBLF.jpg	Ethan and team take on their most impossible mission yet—eradicating 'The Syndicate', an International and highly-skilled rogue organisation committed to destroying the IMF.	5523	\N	2019-11-04 18:30:06.808848	2020-07-02 13:58:24.538504	movie
7984	In the Name of the Father	1993-12-12	/nYlxzsPVTn4rdzOjJC4Jf3x9MjU.jpg	A small time thief from Belfast, Gerry Conlon, is falsely implicated in the IRA bombing of a pub that kills several people while he is in London. He and his four friends are coerced by British police into confessing their guilt. Gerry's father and other relatives in London are also implicated in the crime. He spends fifteen years in prison with his father trying to prove his innocence.	811	\N	2019-11-16 23:50:30.84104	2020-07-02 13:58:24.54551	movie
20539	The Crucible	1996-11-27	/cstxxTZ8GBLqjyaoj0DipdWiSBv.jpg	Based upon the play "The Crucible" by Arthur Miller (who wrote the screen adaptation), the Salem witch trials in 1692 plunge the Massachusetts Bay colony into chaos.	256	\N	2019-11-16 23:50:23.777476	2020-07-02 13:58:24.552917	movie
783	Gandhi	1982-11-30	/mGIDXmuCeLu1nzOxLbN8fWwn1fN.jpg	In the early years of the 20th century, Mohandas K. Gandhi, a British-trained lawyer, forsakes all worldly possessions to take up the cause of Indian independence. Faced with armed resistance from the British government, Gandhi adopts a policy of 'passive resistance', endeavouring to win freedom for his people without resorting to bloodshed.	1261	\N	2019-11-16 23:50:13.274641	2020-07-02 13:58:24.562048	movie
1966	Alexander	2004-11-24	/faVET7EulRCnYRwi65jnHqR2di8.jpg	Alexander, the King of Macedonia, leads his legions against the giant Persian Empire. After defeating the Persians, he leads his army across the then known world, venturing farther than any westerner had ever gone, all the way to India.	1889	\N	2019-10-18 05:38:55.857654	2020-07-02 13:58:24.575422	movie
999100052	The English Game	\N	/vvOccQ5Mcn665KXS2KSnldhpvva.jpg	Two 19th-century footballers on opposite sides of a class divide navigate professional and personal turmoil to change the game — and England — forever.	123	\N	2022-06-01 23:37:10.60975	2022-06-01 23:37:10.60975	tv
999114925	Pam & Tommy	\N	/u6Hfb3EsnvlPChr01jErXDTsdan.jpg	This comedic series takes on the true story behind the release of the first ever viral video in history — the sex tape of Pamela Anderson and Tommy Lee.	58	\N	2022-03-24 02:18:55.450254	2022-03-24 02:18:55.450254	tv
836009	Against the Ice	2022-02-10	/6FSGYvPEhIx3ThOikGqHmKxeyNN.jpg	In 1909, two explorers fight to survive after they're left behind while on a Denmark expedition in ice-covered Greenland.	183	\N	2022-03-24 02:19:34.696554	2022-03-24 02:19:34.696554	movie
4476	Legends of the Fall	1994-12-16	/t1KPGlW0UGd0m515LPQmk2F4nu1.jpg	An epic tale of three brothers and their father living in the remote wilderness of 1900s USA and how their lives are affected by nature, history, war, and love.	1211	\N	2019-10-18 02:44:16.521852	2020-07-02 13:58:23.949456	movie
297	Meet Joe Black	1998-11-12	/fDPAjvfPMomkKF7cMRmL5Anak61.jpg	When the grim reaper comes to collect the soul of megamogul Bill Parrish, he arrives with a proposition: Host him for a "vacation" among the living in trade for a few more days of existence. Parrish agrees, and using the pseudonym Joe Black, Death begins taking part in Parrish's daily agenda and falls in love with the man's daughter. Yet when Black's holiday is over, so is Parrish's life.	2414	\N	2019-10-18 02:44:01.787258	2020-07-02 13:58:23.957647	movie
1164	Babel	2006-10-27	/ocV89hUekPRPIjPxivNBZJXx7AN.jpg	Tragedy strikes a married couple on vacation in the Moroccan desert, touching off an interlocking story involving four different families.	2019	\N	2019-10-18 02:44:10.362824	2020-07-02 13:58:23.96527	movie
37233	The Firm	1993-06-30	/kFexXCzidkm4LwlgZqxsJsDQB5v.jpg	Mitch McDeere is a young man with a promising future in Law. About to sit his Bar exam, he is approached by 'The Firm' and made an offer he doesn't refuse. Seduced by the money and gifts showered on him, he is totally oblivious to the more sinister side of his company. Then, two Associates are murdered. The FBI contact him, asking him for information and suddenly his life is ruined. He has a choice - work with the FBI, or stay with the Firm. Either way he will lose his life as he knows it. Mitch figures the only way out is to follow his own plan...	939	\N	2019-10-18 02:40:31.38972	2020-07-02 13:58:23.974142	movie
334	Magnolia	1999-12-17	/uq2u8HgtLFJkjNq2kHb2jvipIPT.jpg	An epic mosaic of many interrelated characters in search of happiness, forgiveness, and meaning in the San Fernando Valley.	1720	\N	2019-10-18 02:43:20.051968	2020-07-02 13:58:23.982178	movie
75612	Oblivion	2013-04-18	/2ncs7hqBsEjFMqt6Y7ShBCO9tWs.jpg	Jack Harper is one of the last few drone repairmen stationed on Earth.  Part of a massive operation to extract vital resources after decades of war with a terrifying threat known as the Scavs, Jack’s mission is nearly complete.  His existence is brought crashing down when he rescues a beautiful  stranger from a downed spacecraft.  Her arrival triggers a chain of events that  forces him to question everything he knows and puts the fate of humanity in his hands.	7164	\N	2019-10-18 02:40:46.971063	2020-07-02 13:58:23.989421	movie
7446	Tropic Thunder	2008-08-13	/zAurB9mNxfYRoVrVjAJJwGV3sPg.jpg	Vietnam veteran 'Four Leaf' Tayback's memoir, Tropic Thunder, is being made into a film, but Director Damien Cockburn can’t control the cast of prima donnas. Behind schedule and over budget, Cockburn is ordered by a studio executive to get filming back on track, or risk its cancellation. On Tayback's advice, Cockburn drops the actors into the middle of the jungle to film the remaining scenes but, unbeknownst to the actors and production, the group have been dropped in the middle of the Golden Triangle, the home of heroin-producing gangs.	3304	\N	2019-10-18 02:43:04.600236	2020-07-02 13:58:23.998311	movie
100	Lock, Stock and Two Smoking Barrels	1999-03-05	/8kSerJrhrJWKLk1LViesGcnrUPE.jpg	A card shark and his unwillingly-enlisted friends need to make a lot of cash quick after losing a sketchy poker match. To do this they decide to pull a heist on a small-time gang who happen to be operating out of the flat next door.	3335	\N	2019-09-28 21:51:20.375112	2020-07-02 13:58:24.007091	movie
343611	Jack Reacher: Never Go Back	2016-10-21	/bvCEEs5l3ylNIgH4foqOmQk0qdi.jpg	Jack Reacher must uncover the truth behind a major government conspiracy in order to clear his name. On the run as a fugitive from the law, Reacher uncovers a potential secret from his past that could change his life forever.	2935	\N	2019-10-03 07:26:48.825157	2020-07-02 13:58:24.018691	movie
45269	The King's Speech	2010-09-06	/uQ538BfYLDJh3GXlzRZLo0j7PFj.jpg	The King's Speech tells the story of the man who became King George VI, the father of Queen Elizabeth II. After his brother abdicates, George ('Bertie') reluctantly assumes the throne. Plagued by a dreaded stutter and considered unfit to be king, Bertie engages the help of an unorthodox speech therapist named Lionel Logue. Through a set of unexpected techniques, and as a result of an unlikely friendship, Bertie is able to find his voice and boldly lead the country into war.	5283	\N	2019-10-11 16:26:58.792726	2020-07-02 13:58:24.044552	movie
8051	Punch-Drunk Love	2002-10-25	/lLVxmhTPlkSFmUhtURz55nGl1su.jpg	A socially awkward and volatile small business owner meets the love of his life after being threatened by a gang of scammers.	1033	\N	2019-09-07 00:43:27.619644	2020-07-02 13:58:24.054223	movie
813	Airplane!	1980-07-02	/hiURvJjCgk0s10urHVCg80TFF11.jpg	Alcoholic pilot, Ted Striker has developed a fear of flying due to wartime trauma, but nevertheless boards a passenger jet in an attempt to woo back his stewardess girlfriend. Food poisoning decimates the passengers and crew, leaving it up to Striker to land the plane with the help of a glue-sniffing air traffic controller and Striker's vengeful former Air Force captain, who must both talk him down.	2189	\N	2019-09-12 16:40:36.109355	2020-07-02 13:58:24.070829	movie
6073	The Mexican	2001-03-01	/5GqF6rVjUW6CVTuj7w1A2JE49AF.jpg	Jerry Welbach, a reluctant bagman, has been given two ultimatums: The first is from his mob boss to travel to Mexico and retrieve a priceless antique pistol, known as "the Mexican"... or suffer the consequences. The second is from his girlfriend Samantha to end his association with the mob. Jerry figures alive and in trouble with Samantha is better than the more permanent alternative, so he heads south of the border.	791	\N	2019-10-18 02:44:33.870626	2020-07-02 13:58:24.58372	movie
8092	This Boy’s Life	1993-04-09	/xX8cM4qhQYpv3vI6hXr9UInq2s.jpg	In 1957, a son and mother flee the East and an abusive boyfriend to find a new life, and end up in Seattle, where the mother meets a polite garage mechanic. The boy continually gets into trouble by hanging out with the wrong crowd. The mom marries the mechanic, but they soon find out that he's an abusive and unreasoning alcoholic, and they struggle to maintain hope in an impossible situation as the boy grows up with plans to escape the small town by any means possible. Based on a true story by Tobias Wolff.	431	\N	2019-10-18 02:48:03.512572	2020-07-02 13:58:24.594342	movie
1907	The Beach	2000-02-11	/4y7LxD8TSi6AtsM2xSYqUm1gu7u.jpg	Twenty-something Richard travels to Thailand and finds himself in possession of a strange map. Rumours state that it leads to a solitary beach paradise, a tropical bliss - excited and intrigued, he sets out to find it.	2506	\N	2019-10-18 02:47:25.6463	2020-07-02 13:58:24.612723	movie
513576	Always Be My Maybe	2019-05-31	/3BO6pPa7qDcpPYct061Luh9fvst.jpg	Reunited after 15 years, famous chef Sasha and hometown musician Marcus feel the old sparks of attraction but struggle to adapt to each other's worlds.	1120	\N	2022-06-01 23:38:32.695673	2022-06-01 23:38:32.695673	movie
99952814	Halo	\N	/eO0QV5qJaEngP1Ax9w3eV6bJG2f.jpg	Depicting an epic 26th-century conflict between humanity and an alien threat known as the Covenant, the series weaves deeply drawn personal stories with action, adventure and a richly imagined vision of the future.	1	\N	2022-03-24 17:10:17.903143	2022-03-24 17:10:17.903143	tv
2280	Big	1988-06-03	/nTY8Zmv7mpumDfzide6GSrekAgQ.jpg	When a young boy makes a wish at a carnival machine to be big—he wakes up the following morning to find that it has been granted and his body has grown older overnight. But he is still the same 13-year-old boy inside. Now he must learn how to cope with the unfamiliar world of grown-ups including getting a job and having his first romantic encounter with a woman.	2046	\N	2020-01-29 04:02:07.717939	2020-06-21 00:26:14.670894	\N
38321	Priest	2011-05-05	/fYHiA7LPGl9DG7m3DUs0Td1VMcO.jpg	In an alternate world, humanity and vampires have warred for centuries. After the last Vampire War, the veteran Warrior Priest lives in obscurity with other humans inside one of the Church's walled cities. When the Priest's niece is kidnapped by vampires, the Priest breaks his vows to hunt them down. He is accompanied by the niece's boyfriend, who is a wasteland sheriff, and a former Warrior Priestess.	1817	\N	2022-03-24 17:11:51.932921	2022-03-24 17:11:51.932921	movie
72559	G.I. Joe: Retaliation	2013-03-26	/3rWIZMzTKcCtV0eHJ70Z4Ru659f.jpg	Framed for crimes against the country, the G.I. Joe team is terminated by Presidential order. This forces the G.I. Joes into not only fighting their mortal enemy Cobra; they are forced to contend with threats from within the government that jeopardize their very existence.	4095	\N	2020-01-24 03:02:38.407185	2020-07-02 13:58:23.67235	movie
1892	Return of the Jedi	1983-05-23	/mDCBQNhR6R0PVFucJl0O4Hp5klZ.jpg	Luke Skywalker leads a mission to rescue his friend Han Solo from the clutches of Jabba the Hutt, while the Emperor seeks to destroy the Rebellion once and for all with a second dreaded Death Star.	8281	\N	2019-08-21 07:38:39.821032	2020-07-02 13:58:24.090073	movie
1547	The Lost Boys	1987-07-31	/nH1lvyQvfbL5GKScTtT6zkIvDEn.jpg	A mother and her two teenage sons move to a seemingly nice and quiet small coastal California town yet soon find out that it's overrun by bike gangs and vampires. A couple of teenage friends take it upon themselves to hunt down the vampires that they suspect of a few mysterious murders and restore peace and calm to their town.	917	\N	2019-08-31 23:11:59.339451	2020-07-02 13:58:24.099185	movie
11983	Proof of Life	2000-12-08	/87rc1kf1t1oiOTGhjBLNYcAFA6c.jpg	\N	349	\N	2019-05-18 00:20:16.839274	2020-07-02 13:58:24.117876	movie
23908	A Midnight Clear	1992-04-24	/jgpQEZlXdZJRKgye2fO8HtajFZe.jpg	Set in 1944 France, an American Intelligence Squad locates a German Platoon wishing to surrender rather than die in Germany's final war offensive. The two groups of men, isolated from the war at present, put aside their differences and spend Christmas together before the surrender plan turns bad and both sides are forced to fight the other.	51	\N	2020-03-21 03:34:36.185567	2020-07-02 13:58:24.135214	movie
206487	Predestination	2014-08-28	/sYjpJZEdwELjdHy4OVzazeJVT0z.jpg	Predestination chronicles the life of a Temporal Agent sent on an intricate series of time-travel journeys designed to prevent future killers from committing their crimes. Now, on his final assignment, the Agent must stop the one criminal that has eluded him throughout time and prevent a devastating attack in which thousands of lives will be lost.	3829	\N	2020-03-21 03:33:13.983394	2020-07-02 13:58:24.154372	movie
19901	Daybreakers	2009-09-11	/fFnquVw5gox0DSwqFtdc7hsbr8q.jpg	In the year 2019, a plague has transformed almost every human into vampires. Faced with a dwindling blood supply, the fractured dominant race plots their survival; meanwhile, a researcher works with a covert band of vampires on a way to save humankind.	1129	\N	2020-03-21 03:33:01.898122	2020-07-02 13:58:24.164111	movie
9952	Rescue Dawn	2006-09-09	/7a99nU5k9e3FhBNWfPzR3yRMArl.jpg	A US Fighter pilot's epic struggle of survival after being shot down on a mission over Laos during the Vietnam War.	620	\N	2020-02-02 19:45:42.707072	2020-07-02 13:58:24.185134	movie
10023	Dragnet	1987-06-25	/2AqQGyY5yM8PCOGxWsMNlegTnDp.jpg	LAPD Sgt. Joe Friday -- the equally straight-laced nephew of the famous police sergeant of the same name -- is paired up with a young, freewheeling detective named Pep Streebeck. After investigating some strange robberies at the local zoo and the theft of a stockpile of pornographic magazines, they uncover cult activity in the heart of the city and are hot on the case to figure out who's behind it all.	243	\N	2020-01-29 04:05:06.409865	2020-07-02 13:58:24.201706	movie
9586	The Bonfire of the Vanities	1990-12-21	/8pUZknlAD3hZlw69EaAgqBD2Dxc.jpg	After his mistress runs over a young teen, a Wall Street hotshot sees his life unravel in the spotlight, and attracting the interest of a down and out reporter.	244	\N	2020-01-29 04:02:51.083784	2020-07-02 13:58:24.210549	movie
9489	You've Got Mail	1998-12-17	/e2uVtH6TpMfUl7WeOM70ezkcjsU.jpg	Book superstore magnate, Joe Fox and independent book shop owner, Kathleen Kelly fall in love in the anonymity of the Internet—both blissfully unaware that he's trying to put her out of business.	1864	\N	2020-01-29 04:02:43.951386	2020-07-02 13:58:24.219368	movie
6538	Charlie Wilson's War	2007-12-19	/45FghqcdSYRWK7PsHUInaFPNd8l.jpg	The true story of Texas congressman Charlie Wilson's covert dealings in Afghanistan, where his efforts to assist rebels in their war with the Soviets had some unforeseen and long-reaching effects.	721	\N	2020-01-29 04:02:39.912307	2020-07-02 13:58:24.227627	movie
11974	The 'Burbs	1989-02-17	/1oyRR8D5WiVHwunIkOMjl30Jdg5.jpg	When secretive new neighbors move in next door, suburbanite Ray Peterson and his friends let their paranoia get the best of them as they start to suspect the newcomers of evildoings and commence an investigation. But it's hardly how Ray, who much prefers drinking beer, reading his newspaper and watching a ball game on the tube expected to spend his vacation.	615	\N	2020-01-29 04:02:32.753155	2020-07-02 13:58:24.235975	movie
11287	A League of Their Own	1992-07-01	/7xpFXAOjgzFPE3vyVerFGfrXhFK.jpg	As America's stock of athletic young men is depleted during World War II, a professional all-female baseball league springs up in the Midwest, funded by publicity-hungry candy maker Walter Harvey (Garry Marshall). Competitive sisters Dottie Hinson (Geena Davis) and Kit Keller (Lori Petty) spar with each other, scout Ernie Capadino (Jon Lovitz) and grumpy has-been coach Jimmy Dugan (Tom Hanks) on their way to fame. Madonna and Rosie O'Donnell co-star as two of the sisters' teammates.	727	\N	2020-01-29 04:02:30.548833	2020-07-02 13:58:24.24998	movie
4147	Road to Perdition	2002-07-12	/8wmMgwra2eKgEdpNz1HYQlGWKdl.jpg	Mike Sullivan works as a hit man for crime boss John Rooney. Sullivan views Rooney as a father figure, however after his son is witness to a killing, Mike Sullivan finds himself on the run in attempt to save the life of his son and at the same time looking for revenge on those who wronged him.	2038	\N	2020-01-29 04:02:20.787093	2020-07-02 13:58:24.262222	movie
2565	Joe Versus the Volcano	1990-03-09	/dP1KjMbZEBLO76Sg4W5Klyol3jk.jpg	Hypochondriac Joe Banks finds out he has six months to live, quits his dead end job, musters the courage to ask his co-worker out on a date, and is then hired to jump into a volcano by a mysterious visitor.	268	\N	2020-01-29 04:02:14.089026	2020-07-02 13:58:24.275051	movie
369481	Jason Segel & Paul Rudd Meet Rush	2011-01-31	/ng10Tq0vxgYfyLl3yrbEidfE0KO.jpg	Two Rush fans go backstage to meet the band in their dressing room. Once there, they start helping themselves to the refreshments for the band.  Short film based on characters from the movie "I Love You, Man (2009)"	5	\N	2022-03-24 17:12:47.310682	2022-03-24 17:12:47.310682	movie
52449	Bad Teacher	2011-05-16	/zpIY4qUSX91J9XpPgr0hFrk1eKr.jpg	A lazy, incompetent middle school teacher who hates her job and her students is forced to return to her job to make enough money for a boob job after her rich fiancé dumps her.	3997	\N	2022-03-24 17:12:56.389748	2022-03-24 17:12:56.389748	movie
951	Kindergarten Cop	1990-12-21	/nKnHWwkXyvhzCYWm3FyRAv3qBrl.jpg	Hard-edged cop John Kimble gets more than he bargained for when he goes undercover as a kindergarten teacher to get the goods on a brutal drug lord while at the same time protecting the man's young son. Pitted against a class of boisterous moppets whose antics try his patience and test his mettle, Kimble may have met his match … in more ways than one.	1366	\N	2020-01-17 14:19:47.641784	2020-06-21 03:12:07.799211	\N
14557	Dead Man on Campus	1998-08-21	/mTr7ARy7lj8ggvg6snLWDo3CnEu.jpg	College freshmen Josh and Cooper are more interested in hitting the bottle than in hitting the books -- and their poor grades are set to get them kicked out of school. Their only hope of passing is to find a roommate who will kill himself. That's because an oddball college code states that a suicide victim's roommates automatically get straight A's. But sharing space with a lineup of lunatics proves enough to drive both boys crazy.	106	\N	2022-03-24 17:13:06.658362	2022-03-24 17:13:06.658362	movie
9319	The Last Boy Scout	1991-12-11	/hAejapki8nDEHsdsoffsxETQpjZ.jpg	When the girl that detective Joe Hallenback is protecting gets murdered, the boyfriend of the murdered girl attempts to investigate and solve the case. What they discover is that there is deep seated corruption going on between a crooked politician and the owner of a pro football team.	938	\N	2020-01-24 03:01:38.096926	2020-07-02 13:58:23.689061	movie
8880	Che: Part Two	2009-01-24	/t9nH3bZf0Ezs2jwk0bTkvRr89Ao.jpg	After the Cuban Revolution, Che is at the height of his fame and power. Then he disappears, re-emerging incognito in Bolivia, where he organizes a small group of Cuban comrades and Bolivian recruits to start the great Latin American Revolution. Through this story, we come to understand how Che remains a symbol of idealism and heroism that lives in the hearts of people around the world.	298	\N	2020-01-24 02:59:20.079953	2020-07-02 13:58:23.701985	movie
14684	School Ties	1992-09-18	/qJPVtysv9IyR28OiccwkqjoRJX1.jpg	When David Greene receives a football scholarship to a prestigious prep school in the 1950s, he feels pressure to hide the fact that he is Jewish from his classmates and teachers, fearing that they may be anti-Semitic. He quickly becomes the big man on campus thanks to his football skills, but when his Jewish background is discovered, his worst fears are realized and his friends turn on him with violent threats and public ridicule.	172	\N	2020-01-24 02:58:13.894565	2020-07-02 13:58:23.7127	movie
44603	Hereafter	2010-10-22	/nOy0X8XSmSDOuwV8pqT70WoWHwT.jpg	Three people — a blue-collar American, a French journalist and a London school boy — are touched by death in different ways.	945	\N	2020-01-24 02:57:49.696362	2020-07-02 13:58:23.730611	movie
21355	All the Pretty Horses	2000-12-11	/6E4E7wYXw1DE2321F2hVNryLSk7.jpg	The year is 1949. A young Texan named John Grady finds himself without a home after his mother sells the ranch where he has spent his entire life. Lured south of the border by the romance of cowboy life and the promise of a fresh start, Cole and his pal embark on an adventure that will test their resilience, define their maturity, and change their lives forever.	101	\N	2020-01-24 02:57:25.763522	2020-07-02 13:58:23.742438	movie
10220	Rounders	1998-09-11	/lJKUJT4ssX8unQh4HGuQK38e7Ov.jpg	A young man is a reformed gambler who must return to playing big stakes poker to help a friend pay off loan sharks.	932	\N	2020-01-24 02:57:17.626257	2020-07-02 13:58:23.751374	movie
1247	The Good Shepherd	2006-12-11	/frPAFd718R042GbMVWelLrk1h0D.jpg	Edward Wilson, the only witness to his father's suicide and member of the Skull and Bones Society while a student at Yale, is a morally upright young man who values honor and discretion, qualities that help him to be recruited for a career in the newly founded OSS. His dedication to his work does not come without a price though, leading him to sacrifice his ideals and eventually his family.	597	\N	2020-01-24 02:57:12.985395	2020-07-02 13:58:23.75964	movie
10419	Swing Kids	1993-03-05	/o85xTgX5ByDewuYo5yOLIsP02CX.jpg	The story of a close-knit group of young kids in Nazi Germany who listen to banned swing music from the US. Soon dancing and fun leads to more difficult choices as the Nazi's begin tightening the grip on Germany. Each member of the group is forced to face some tough choices about right, wrong, and survival.	112	\N	2019-10-19 21:13:22.689624	2020-07-02 13:58:23.458616	movie
1213	The Talented Mr. Ripley	1999-12-25	/erGOHMI4wpoHQRLUGt3Qjx3fhCd.jpg	Tom Ripley is a calculating young man who believes it's better to be a fake somebody than a real nobody. Opportunity knocks in the form of a wealthy U.S. shipbuilder who hires Tom to travel to Italy to bring back his playboy son, Dickie. Ripley worms his way into the idyllic lives of Dickie and his girlfriend, plunging into a daring scheme of duplicity, lies and murder.	1615	\N	2020-01-24 02:57:10.740147	2020-07-02 13:58:23.769971	movie
11381	Tommy Boy	1995-03-31	/cUvdzCbhLyYUAwbIkBjT3tC28cK.jpg	Party animal Tommy Callahan is a few cans short of a six-pack. But when the family business starts tanking, it's up to Tommy and number-cruncher Richard Hayden to save the day.	538	\N	2020-01-24 02:56:49.31299	2020-07-02 13:58:23.783319	movie
9884	Collateral Damage	2002-02-06	/bm5vsuAzkinh4kSXov5xHAoCojp.jpg	Firefighter Gordon Brewer is plunged into the complex and dangerous world of international terrorism after he loses his wife and child in a bombing credited to Claudio 'The Wolf' Perrini.	745	\N	2020-01-17 14:19:19.301102	2020-07-02 13:58:23.79439	movie
9593	Last Action Hero	1993-06-18	/yTfjHPqh7C7bkfMtEKx2mPdorQw.jpg	Danny is obsessed with a fictional movie character action hero Jack Slater. When a magical ticket transports him into Jack's latest adventure, Danny finds himself in a world where movie magic and reality collide. Now it's up to Danny to save the life of his hero and new friend.	1411	\N	2020-01-17 14:19:13.408129	2020-07-02 13:58:23.802665	movie
9493	Twins	1988-12-09	/stJx9BQZbXrZnTGf9Erc7d2UMVc.jpg	Julius and Vincent Benedict are the results of an experiment that would allow for the perfect child. Julius was planned and grows to athletic proportions. Vincent is an accident and is somewhat smaller in stature. Vincent is placed in an orphanage while Julius is taken to a south seas island and raised by philosophers. Vincent becomes the ultimate low life and is about to be killed by loan sharks.	1175	\N	2020-01-17 14:19:09.669309	2020-07-02 13:58:23.811302	movie
8452	The 6th Day	2000-11-17	/2iIQcICw4zxsm8qujCbsjVDxZyd.jpg	Futuristic action about a man who meets a clone of himself and stumbles into a grand conspiracy about clones taking over the world.	1111	\N	2020-01-17 14:19:06.063765	2020-07-02 13:58:23.829919	movie
2099	Raw Deal	1986-06-06	/e27G0o01y6aPYn6OScB2G6NbqVz.jpg	Mark Kaminsky is kicked out of the FBI for his rough treatment of a suspect. He winds up as the sheriff of a small town in North Carolina. FBI Chief Harry Shannon, whose son has been killed by a mobster named Patrovina, enlists Kaminsky in a personal vendetta with a promise of reinstatement into the FBI if Patrovina is taken down. To accomplish this, he must go undercover and join Patrovina's gang.	345	\N	2020-01-17 14:19:02.918573	2020-07-02 13:58:23.839481	movie
187	Sin City	2005-04-01	/8qGW691AOyqbKsEhpe7nHwMEbRe.jpg	Welcome to Sin City. This town beckons to the tough, the corrupt, the brokenhearted. Some call it dark… Hard-boiled. Then there are those who call it home — Crooked cops, sexy dames, desperate vigilantes. Some are seeking revenge, others lust after redemption, and then there are those hoping for a little of both. A universe of unlikely and reluctant heroes still trying to do the right thing in a city that refuses to care.	4851	\N	2019-10-19 21:31:23.91008	2020-07-02 13:58:23.857882	movie
16991	Observe and Report	2009-04-10	/z2wcS9UbUfJIn6xAzs1ZdGCGCnQ.jpg	Mall security guard Ronnie Barnhardt is called into action to stop a flasher from turning shopper's paradise into his personal peep show. But when Barnhardt can't bring the culprit to justice, a surly police detective is recruited to close the case.	518	\N	2022-03-24 17:13:51.650459	2022-03-24 17:13:51.650459	movie
2310	Beowulf	2007-11-05	/7QsWYyJAV97N9jOh21pdRIqJeJq.jpg	6th-century Scandinavian warrior, Beowulf embarks on a mission to slay the a man-like ogre, Grendel.	1656	\N	2020-01-15 00:24:10.667271	2020-06-21 03:12:07.864684	\N
9359	Maverick	1994-05-20	/f4quUawXzMMRQ11uoxPjddAftcv.jpg	Maverick is a gambler who would rather con someone than fight them. He needs an additional three thousand dollars in order to enter a Winner Take All poker game that begins in a few days. He tries to win some, tries to collect a few debts, and recover a little loot for the reward. He joins forces with a woman gambler with a marvelous southern accent as the two both try and enter the game.	846	\N	2020-01-15 00:22:58.824906	2020-06-21 03:12:07.883479	\N
941	Lethal Weapon	1987-03-06	/fTq4ThIP3pQTYR9eDepsbDHqdcs.jpg	Veteran buttoned-down LAPD detective Roger Murtaugh is partnered with unhinged cop Martin Riggs, who -- distraught after his wife's death -- has a death wish and takes unnecessary risks with criminals at every turn. The odd couple embark on their first homicide investigation as partners, involving a young woman known to Murtaugh with ties to a drug and prostitution ring.	2537	\N	2020-01-15 00:22:12.241818	2020-06-21 03:13:08.311965	\N
734265	Love Hard	2021-11-05	/oTkAFDZRLnqrXOrOwuy3Tvul0v5.jpg	An LA girl, unlucky in love, falls for an East Coast guy on a dating app and decides to surprise him for Christmas, only to discover that she's been catfished. But the object of her affection actually lives in the same town, and the guy who duped her offers to set them up if she pretends to be his own girlfriend for the holidays.	1072	\N	2022-06-01 23:40:40.468541	2022-06-01 23:40:40.468541	movie
2289	Cold Mountain	2003-12-24	/32MsALfK6shuSopCrFjSNoxDc5p.jpg	In this classic story of love and devotion set against the backdrop of the American Civil War, a wounded Confederate soldier named W.P. Inman deserts his unit and travels across the South, aiming to return to his young wife, Ada, who he left behind to tend their farm. As Inman makes his perilous journey home, Ada struggles to keep their home intact with the assistance of Ruby, a mysterious drifter sent to help her by a kindly neighbor.	990	\N	2019-12-22 04:37:11.837391	2020-07-02 13:58:23.42154	movie
13435	Antwone Fisher	2002-12-19	/qnA1FeR3XpuBzL8czF47rxjtdgQ.jpg	A sailor prone to violent outbursts is sent to a naval psychiatrist for help. Refusing at first to open up, the young man eventually breaks down and reveals a horrific childhood. Through the guidance of his doctor, he confronts his painful past and begins a quest to find the family he never knew.	237	\N	2019-12-11 14:13:56.258698	2020-07-02 13:58:23.429477	movie
87502	Flight	2012-11-02	/1AjXgBM2lkpG3FLQO0f6AK3Bi1e.jpg	Commercial airline pilot Whip Whitaker has a problem with drugs and alcohol, though so far he's managed to complete his flights safely. His luck runs out when a disastrous mechanical malfunction sends his plane hurtling toward the ground. Whip pulls off a miraculous crash-landing that results in only six lives lost. Shaken to the core, Whip vows to get sober -- but when the crash investigation exposes his addiction, he finds himself in an even worse situation.	3790	\N	2019-12-11 14:13:40.524714	2020-07-02 13:58:23.436392	movie
11081	Taking Lives	2004-03-19	/zeFGOS1kj0CxuZjGhtK3WlMCYsa.jpg	Recruited to assist Montreal police in their desperate search for a serial killer who assumes the identities of his victims, FBI profiler Illeana Scott knows it's only a matter of time before the killer strikes again. Her most promising lead is a museum employee who might be the killer's only eyewitness.	724	\N	2019-10-31 13:56:00.11135	2020-07-02 13:58:23.44341	movie
17622	Fifty Dead Men Walking	2009-08-21	/5ZGJ0B0UwZEn9OLHH631BU6lAXh.jpg	It's 1989, and in a Belfast torn apart by conflict and terrorism, petty criminal Marty McGartland is recruited by the British police to infiltrate the IRA. Guided by Special Forces officer 'Fergus', McGartland gains unparalleled insight into the organisation's dealings, providing his British handler with priceless, life-saving information. Based on a true story.	69	\N	2019-10-20 05:54:08.5648	2020-07-02 13:58:23.450806	movie
37136	The Naked Gun: From the Files of Police Squad!	1988-12-02	/wQHTHJ3jBKtz2c6VT9JZ8TD73yl.jpg	When the incompetent Officer Frank Drebin seeks the ruthless killer of his partner, he stumbles upon an attempt to assassinate Queen Elizabeth.	1899	\N	2019-10-19 02:16:07.742152	2020-07-02 13:58:23.46588	movie
51209	Kill the Irishman	2011-03-11	/fER3nwpve3CX2KqKOuR959Lc1ss.jpg	\N	270	\N	2019-05-18 00:22:00.582129	2020-07-02 13:58:23.472963	movie
11826	Sexy Beast	2001-01-12	/xKI8PYL75qlK0F1rUNojEdiK80J.jpg	The idyllic life of retired safecracker Gal is put at risk when a psychotic gangster from his past arrives at his villa in southern Spain, intent on bringing him out of retirement for one last job.	390	\N	2020-01-15 00:24:12.62693	2020-07-02 13:58:23.873866	movie
50780	The Beaver	2011-02-11	/nlaWgS7iIb6MG3t0FitV1xdPqIV.jpg	Suffering from a severe case of depression, toy company CEO Walter Black (Mel Gibson) begins using a beaver hand puppet to help him open up to his family. With his father seemingly going insane, adolescent son Porter (Anton Yelchin) pushes for his parents to get a divorce. Jodie Foster directs and co-stars as Walter's wife in this dark comedy that also features Riley Thomas Stewart and Jennifer Lawrence.	526	\N	2020-01-15 00:23:17.14963	2020-07-02 13:58:23.885633	movie
8834	Conspiracy Theory	1997-08-08	/wj0n6gci4EMWRhV9ozCKTgESGdB.jpg	A man obsessed with conspiracy theories becomes a target after one of his theories turns out to be true. Unfortunately, in order to save himself, he has to figure out which theory it is.	782	\N	2020-01-15 00:22:56.026653	2020-07-02 13:58:23.899	movie
11856	Air America	1990-08-10	/yMRDHjFPVSf3BbVpVe8KNMb7sPM.jpg	Air America was the CIA's private airline operating in Laos during the Vietnam War, running anything and everything from soldiers to foodstuffs for local villagers. After losing his pilot's license, Billy Covington is recruited into it, and ends up in the middle of a bunch of lunatic pilots, gun-running by his friend Gene Ryack, and opium smuggling by his own superiors.	290	\N	2020-01-15 00:22:51.619888	2020-07-02 13:58:23.908144	movie
10590	We Were Soldiers	2002-03-01	/5yGTntK7vqhidDBjwqM8uLZJgKq.jpg	The story of the first major battle of the American phase of the Vietnam War and the soldiers on both sides that fought it.	977	\N	2020-01-15 00:22:46.704639	2020-07-02 13:58:23.920799	movie
943	Lethal Weapon 3	1992-05-15	/1UkG3G4jhM9XMbbYyqWQ7NUnUTT.jpg	Archetypal buddy cops Riggs and Murtaugh are back for another round of high-stakes action, this time setting their collective sights on bringing down a former Los Angeles police lieutenant turned black market weapons dealer. Lorna Cole joins as the beautiful yet hardnosed internal affairs sergeant who catches Riggs's eye.	1547	\N	2020-01-15 00:22:19.444809	2020-07-02 13:58:23.9299	movie
414906	The Batman	2022-03-01	/74xTEgt7R36Fpooo50r9T25onhq.jpg	In his second year of fighting crime, Batman uncovers corruption in Gotham City that connects to his own family while facing a serial killer known as the Riddler.	3405	\N	2022-04-22 15:27:54.589877	2022-04-22 15:27:54.589877	movie
59440	Warrior	2011-09-09	/di8jDHn7N4JgZQzchgxkSILWF6h.jpg	The youngest son of an alcoholic former boxer returns home, where he's trained by his father for competition in a mixed martial arts tournament - a path that puts the fighter on a collision course with his estranged, older brother, an ex-marine with a tragic past.	2246	\N	2019-08-17 19:58:48.426858	2020-06-21 21:34:45.296805	\N
99992749	Moon Knight	\N	/9rJoulDnFeVGXcUsN7CjllUWADA.jpg	When Steven Grant, a mild-mannered gift-shop employee, becomes plagued with blackouts and memories of another life, he discovers he has dissociative identity disorder and shares a body with mercenary Marc Spector. As Steven/Marc’s enemies converge upon them, they must navigate their complex identities while thrust into a deadly mystery among the powerful gods of Egypt.	346	\N	2022-04-22 15:29:42.420396	2022-04-22 15:29:42.420396	tv
251	Ghost	1990-07-12	/w9RaPHov8oM5cnzeE27isnFMsvS.jpg	Sam Wheat is a banker, Molly Jensen is an artist, and the two are madly in love. However, when Sam is murdered by his friend and corrupt business partner Carl Bruner over a shady business deal, he is left to roam the earth as a powerless spirit. When he learns of Carl's betrayal, Sam must seek the help of psychic Oda Mae Brown to set things right and protect Molly from Carl and his goons.	3005	\N	2019-10-19 21:09:09.138454	2020-06-21 21:34:45.334835	\N
74	War of the Worlds	2005-06-29	/6Biy7R9LfumYshur3YKhpj56MpB.jpg	Ray Ferrier is a divorced dockworker and less-than-perfect father. Soon after his ex-wife and her new husband drop of his teenage son and young daughter for a rare weekend visit, a strange and powerful lightning storm touches down.	4573	\N	2019-08-19 09:18:17.544839	2020-07-02 13:58:23.48976	movie
102382	The Amazing Spider-Man 2	2014-04-16	/c3e9e18SSlvFd1cQaGmUj5tqL5P.jpg	For Peter Parker, life is busy. Between taking out the bad guys as Spider-Man and spending time with the person he loves, Gwen Stacy, high school graduation cannot come quickly enough. Peter has not forgotten about the promise he made to Gwen’s father to protect her by staying away, but that is a promise he cannot keep. Things will change for Peter when a new villain, Electro, emerges, an old friend, Harry Osborn, returns, and Peter uncovers new clues about his past.	7529	\N	2019-08-31 23:07:28.553922	2020-07-02 13:58:23.507234	movie
37724	Skyfall	2012-11-09	/i3pzXFFLePz5hro9uaVk0E4ZPAO.jpg	When Bond's latest assignment goes gravely wrong and agents around the world are exposed, MI6 is attacked forcing M to relocate the agency. These events cause her authority and position to be challenged by Gareth Mallory, the new Chairman of the Intelligence and Security Committee. With MI6 now compromised from both inside and out, M is left with one ally she can trust: Bond. 007 takes to the shadows - aided only by field agent, Eve - following a trail to the mysterious Silva, whose lethal and hidden motives have yet to reveal themselves.	10638	\N	2019-08-19 09:19:05.173452	2020-07-02 13:58:23.515162	movie
9361	The Last of the Mohicans	1992-09-25	/fYVQRcgnOv998bKEplzrD3faGgt.jpg	As the British and French soldiers battle for control of the American colonies in the 18th century, the settlers and native Americans are forced to take sides. Cora and her sister Alice unwittingly walk into trouble but are reluctantly saved by Hawkeye, an orphaned settler adopted by the last of the Mohicans.	1413	\N	2019-08-03 22:47:21.920727	2020-07-02 13:58:23.522973	movie
2034	Training Day	2001-10-05	/nfYei5xcbzLna0QjwDZkb8z7Bxs.jpg	On his first day on the job as a narcotics officer, a rookie cop works with a rogue detective who isn't what he appears.	2881	\N	2019-07-31 15:59:11.712922	2020-07-02 13:58:23.530331	movie
136795	The Heat	\N	/7LRtjM4ENyeu4C1c2D78E4HtarP.jpg	Uptight and straight-laced, FBI Special Agent Sarah Ashburn is a methodical investigator with a reputation for excellence--and hyper-arrogance. Shannon Mullins, one of Boston P.D.'s "finest," is foul-mouthed and has a very short fuse, and uses her gut instinct and street smarts to catch the most elusive criminals. Neither has ever had a partner, or a friend for that matter. When these two wildly incompatible law officers join forces to bring down a ruthless drug lord, they become the last thing anyone expected: Buddies.	2460	\N	2019-07-04 02:35:55.259925	2020-07-02 13:58:23.53956	movie
1893	Star Wars: Episode I - The Phantom Menace	1999-05-19	/6wkfovpn7Eq8dYNKaG5PY3q2oq6.jpg	\N	8024	\N	2019-06-28 02:10:59.163664	2020-07-02 13:58:23.547501	movie
65754	The Girl with the Dragon Tattoo	2011-12-14	/vbLedKc1BUF4FOH1GyHW62FulCc.jpg	\N	3947	\N	2019-05-27 01:27:47.693867	2020-07-02 13:58:23.555334	movie
497582	Enola Holmes	2020-09-23	/riYInlsq2kf1AWoGm80JQW5dLKp.jpg	While searching for her missing mother, intrepid teen Enola Holmes uses her sleuthing skills to outsmart big brother Sherlock and help a runaway lord.	4679	\N	2022-10-28 22:08:33.448106	2022-10-28 22:08:33.448106	movie
1573	Die Hard 2	1990-07-02	/ybki0UWO3OPhaM6MSniuKC7sy1R.jpg	Off-duty cop John McClane is gripped with a feeling of déjà vu when, on a snowy Christmas Eve in the nation’s capital, terrorists seize a major international airport, holding thousands of holiday travelers hostage. Renegade military commandos led by a murderous rogue officer plot to rescue a drug lord from justice and are prepared for every contingency except one: McClane’s smart-mouthed heroics.	3076	\N	2019-08-19 09:22:00.238708	2020-07-02 13:58:23.564565	movie
38199	Unthinkable	2010-06-15	/qjyFEmxC3LdF4EKdCUEnMbhHOha.jpg	A convert to Islam sends the U.S. government a tape showing him in three nondescript storage rooms, each of which may contain a nuclear bomb set to detonate in less than a week. Helen Brody, an FBI agent in L.A., is tasked with finding the bombs while a CIA "consultant", known as H, interrogates the suspect who has allowed himself to be caught. The suspect, whose wife and children have left him and disappeared, seems to know exactly what the interrogation will entail. Even as H ratchets up the pressure, using torture over Brody's objection, the suspect doesn't crack. Should H do the unthinkable, and will Brody acquiesce? Is any Constitutional principle worth possible loss of life?	656	\N	2019-10-19 21:19:33.633316	2020-07-02 13:58:23.572923	movie
2255	Chasing Amy	1997-04-04	/eFhPqkNmRDfRHyQiUzUdoQjpwgh.jpg	Holden and Banky are comic book artists. Everything is going good for them until they meet Alyssa, also a comic book artist. Holden falls for her, but his hopes are crushed when he finds out she's a lesbian.	716	\N	2019-07-31 16:03:57.309668	2020-07-02 13:58:23.582129	movie
1523	The Last King of Scotland	\N	/quckyadj0bYCzIXMDIi4lrwJfth.jpg	Young Scottish doctor, Nicholas Garrigan decides it's time for an adventure after he finishes his formal education, so he decides to try his luck in Uganda, and arrives during the downfall of President Obote. General Idi Amin comes to power and asks Garrigan to become his personal doctor.	1000	\N	2019-05-26 02:14:59.574327	2020-07-02 13:58:23.602473	movie
10337	Bugsy	\N	/50k4OfyxUDo2M4TSGwNJ9KaTYUL.jpg	New York gangster Ben 'Bugsy' Siegel takes a brief business trip to Los Angeles. A sharp-dressing womanizer with a foul temper, Siegel doesn't hesitate to kill or maim anyone crossing him. In L.A. the life, the movies, and most of all strong-willed Virginia Hill detain him while his family wait back home. Then a trip to a run-down gambling joint at a spot in the desert known as Las Vegas gives him his big idea.	144	\N	2019-05-14 16:00:22.878898	2020-07-02 13:58:23.611526	movie
4477	The Devil's Own	1997-03-12	/7XIxdjhaoDIiv7slEiOhBEzMtqu.jpg	\N	503	\N	2019-05-18 00:20:36.194789	2020-07-02 13:58:23.620945	movie
13291	Traitor	2008-08-27	/va4Uo7L2b4d96JTdRMclO9L2hY0.jpg	\N	321	\N	2019-05-18 00:20:11.240431	2020-07-02 13:58:23.638468	movie
38	Eternal Sunshine of the Spotless Mind	2004-03-19	/5MwkWH9tYHv3mV9OdYTMR5qreIz.jpg	\N	7095	\N	2019-03-29 20:22:54.166708	2020-07-02 13:58:23.339891	movie
77016	End of Watch	\N	/9KwWrsemXerJFKChm0OXyVjkynh.jpg	Two young officers are marked for death after confiscating a small cache of money and firearms from the members of a notorious cartel during a routine traffic stop.	1777	\N	2019-06-22 01:21:12.336453	2020-07-02 13:58:23.349831	movie
291328	Rules Don't Apply	\N	/a7Gtn4CNsNYKVlkCBspfETd6z7r.jpg	It's Hollywood, 1958. Small town beauty queen and devout Baptist virgin Marla Mabrey, under contract to the infamous Howard Hughes, arrives in Los Angeles. At the airport, she meets her driver Frank Forbes, who is engaged to be married to his seventh grade sweetheart and is a deeply religious Methodist. Their instant attraction not only puts their religious convictions to the test, but also defies Hughes' number one rule: No employee is allowed to have any relationship whatsoever with a contract actress. Hughes' behavior intersects with Marla and Frank in very separate and unexpected ways, and as they are drawn deeper into his bizarre world, their values are challenged and their lives are changed.	242	\N	2019-05-27 19:14:28.968774	2020-07-02 13:58:23.357164	movie
10212	Ravenous	\N	/6tJc9vIVYctNCajC1dU1oVcmIsD.jpg	Upon receiving reports of missing persons at Fort Spencer, a remote Army outpost on the Western frontier, Capt. John Boyd investigates. After arriving at his new post, Boyd and his regiment aid a wounded frontiersman who recounts a horrifying tale of a wagon train murdered by its supposed guide -- a vicious U.S. Army colonel gone rogue. Fearing the worst, the regiment heads out into the wilderness to verify the gruesome claims.	234	\N	2019-05-25 05:24:37.558022	2020-07-02 13:58:23.367976	movie
6463	Other People's Money	\N	/obnOuFa2yJRorRM3rab3rXZFfEh.jpg	A corporate raider threatens a hostile take-over of a "mom and pop" company. The patriarch of the company enlists the help of his wife's daughter, who is a lawyer, to try and protect the company. The raider is enamoured of her, and enjoys the thrust and parry of legal manoeuvring as he tries to win her heart. Written by Ed Sutton.	62	\N	2019-05-16 01:02:26.582081	2020-07-02 13:58:23.377374	movie
10162	Waking Ned	1998-09-15	/tnKK6xySObS3ogR8239gtT7Kkng.jpg	\N	121	\N	2019-04-07 01:38:44.703429	2020-07-02 13:58:23.385742	movie
9414	The Man Who Knew Too Little	1997-11-14	/bVmIpbKjmYxCbTEs6DuXHdJ4ol0.jpg	\N	200	\N	2019-04-07 02:38:19.511183	2020-07-02 13:58:23.393854	movie
414425	Mudbound	2017-11-16	/7cL7UgVMeP9xDSxU2NyAqeAQAbt.jpg	In the post–World War II South, two families are pitted against a barbaric social hierarchy and an unrelenting landscape as they simultaneously fight the battle at home and the battle abroad.	784	\N	2020-06-24 01:55:30.134539	2020-07-02 13:58:23.40196	movie
3682	54	1998-08-28	/gLjt54vow8CEOHdgRkQCyXwbq52.jpg	Shane, a Jersey boy with big dreams, crosses the river in hopes of finding a more exciting life at Studio 54. When Steve Rubell, the mastermind behind the infamous disco, plucks Shane from the sea of faces clamoring to get inside his club, Shane not only gets his foot in the door, but lands a coveted job behind the bar – and a front-row seat at the most legendary party on the planet.	240	\N	2019-10-24 21:21:11.65148	2020-07-02 13:58:23.411855	movie
8012	Get Shorty	1995-10-20	/5XSVAyHmTCFOWaqEQ0LUHh3yssB.jpg	Chili Palmer is a Miami mobster who gets sent by his boss, the psychopathic "Bones" Barboni, to collect a bad debt from Harry Zimm, a Hollywood producer who specializes in cheesy horror films. When Chili meets Harry's leading lady, the romantic sparks fly. After pitching his own life story as a movie idea, Chili learns that being a mobster and being a Hollywood producer really aren't all that different.	516	\N	2019-10-19 02:15:15.125636	2020-07-02 13:58:23.481521	movie
13223	Gran Torino	2008-12-09	/w3zz8djZKknVpkpHi0I7kqibzbC.jpg	Widower Walt Kowalski is a grumpy, prejudiced, tough-minded, unhappy, old, Korean War veteran who can't get along with either his kids or his neighbours. His prize possession is a 1972 Gran Torino he keeps in mint condition. When his neighbour, Thao—a young Hmong teenager under pressure from his gang member cousin—tries to steal his Gran Torino, Walt sets out to reform the youth and takes steps to protect Thao and his family from the gangs that infest their neighborhood.	5987	\N	2019-08-17 19:58:44.769421	2020-07-02 13:58:23.498947	movie
4922	The Curious Case of Benjamin Button	\N	/9H2awZmNisMVJGp362Stv0bfUTs.jpg	Born under unusual circumstances, Benjamin Button springs into being as an elderly man in a New Orleans nursing home and ages in reverse. Twelve years after his birth, he meets Daisy, a child who flits in and out of his life as she grows up to be a dancer. Though he has all sorts of unusual adventures over the course of his life, it is his relationship with Daisy, and the hope that they will come together at the right time, that drives Benjamin forward.	6370	\N	2019-04-22 16:21:50.011753	2020-07-02 13:58:23.647656	movie
591	The Da Vinci Code	2006-05-17	/6jexEWBXepwB1ZLpCEllI04Agrb.jpg	A murder in Paris’ Louvre Museum and cryptic clues in some of Leonardo da Vinci’s most famous paintings lead to the discovery of a religious mystery. For 2,000 years a secret society closely guards information that — should it come to light — could rock the very foundations of Christianity.	5741	\N	2020-01-29 04:02:00.439357	2020-07-02 13:58:23.663979	movie
9567	Tears of the Sun	2003-03-07	/8rN7hvGDmje6CDAYuIuVB4UhT0c.jpg	Navy SEAL Lieutenant A.K. Waters and his elite squadron of tactical specialists are forced to choose between their duty and their humanity, between following orders by ignoring the conflict that surrounds them, or finding the courage to follow their conscience and protect a group of innocent refugees. When the democratic government of Nigeria collapses and the country is taken over by a ruthless military dictator, Waters, a fiercely loyal and hardened veteran is dispatched on a routine mission to retrieve a Doctors Without Borders physician.	1089	\N	2020-01-24 03:01:44.474066	2020-07-02 13:58:23.6802	movie
865	The Running Man	1987-11-13	/bzkFlFPROQGWxKcq2ngoEodEZ6R.jpg	By 2017, the global economy has collapsed and American society has become a totalitarian police state, censoring all cultural activity. The government pacifies the populace by broadcasting a number of game shows in which convicted criminals fight for their lives, including the gladiator-style The Running Man, hosted by the ruthless Damon Killian, where “runners” attempt to evade “stalkers” and certain death for a chance to be pardoned and set free.	1243	\N	2020-01-17 14:19:02.917129	2020-07-02 13:58:23.850081	movie
10999	Commando	1985-10-03	/ggVVcXvlLqFOK6lEkD8G2aDarDb.jpg	John Matrix, the former leader of a special commando strike force that always got the toughest jobs done, is forced back into action when his young daughter is kidnapped. To find her, Matrix has to fight his way through an array of punks, killers, one of his former commandos, and a fully equipped private army. With the help of a feisty stewardess and an old friend, Matrix has only a few hours to overcome his greatest challenge: finding his daughter before she's killed.	1436	\N	2020-01-17 14:19:02.919338	2020-07-02 13:58:23.865748	movie
99985922	Space Force	\N	/zgu3p4NvisS8CI68cUfBKbvAvu8.jpg	A four-star general begrudgingly teams up with an eccentric scientist to get the U.S. military's newest agency — Space Force — ready for lift-off.	351	\N	2022-04-22 15:29:50.848979	2022-04-22 15:29:50.848979	tv
147441	Exodus: Gods and Kings	2014-12-03	/uaDj37JtvLan9tihxZ18e6qL33b.jpg	The defiant leader Moses rises up against the Egyptian Pharaoh Ramses, setting 400,000 slaves on a monumental journey of escape from Egypt and its terrifying cycle of deadly plagues.	3947	\N	2022-06-25 20:10:58.009991	2022-06-25 20:10:58.009991	movie
978	Seven Years in Tibet	1997-10-10	/5euQXAgJ34TdUFl1t3O6Jw2lJAs.jpg	Austrian mountaineer, Heinrich Harrer journeys to the Himalayas without his family to head an expedition in 1939. But when World War II breaks out, the arrogant Harrer falls into Allied forces' hands as a prisoner of war. He escapes with a fellow detainee and makes his way to Llaso, Tibet, where he meets the 14-year-old Dalai Lama, whose friendship ultimately transforms his outlook on life.	1302	\N	2019-10-18 02:44:08.312275	2020-07-02 13:58:23.939332	movie
7555	Rambo	2008-01-25	/3mInub5c8o00H7EJ1TrjAqOzIuc.jpg	When governments fail to act on behalf of captive missionaries, ex-Green Beret John James Rambo sets aside his peaceful existence along the Salween River in a war-torn region of Thailand to take action.  Although he's still haunted by violent memories of his time as a U.S. soldier during the Vietnam War, Rambo can hardly turn his back on the aid workers who so desperately need his help.	1880	\N	2019-10-03 07:25:55.18291	2020-07-02 13:58:24.032397	movie
43539	The Next Three Days	2010-11-18	/wBaRZ3aHa7qoYTSY0ONbXrXYk4B.jpg	A married couple's life is turned upside down when the wife is accused of a murder. Lara Brennan is arrested for murdering her boss with whom she had an argument. It seems she was seen leaving the scene of the crime and her fingerprints were on the murder weapon. Her husband, John would spend the next few years trying to get her released, but there's no evidence that negates the evidence against her. And when the strain of being separated from her family, especially her son, gets to her, John decides to break her out. So he does a lot of research to find a way.	1655	\N	2020-02-02 19:47:07.708256	2020-07-02 13:58:24.176012	movie
48838	London Boulevard	2010-11-12	/nZGL1cLtWXptk0W1jFE7MhAVtZc.jpg	A parolee battles a gangster for the affections of a reclusive movie star.	423	\N	2019-10-18 05:39:14.57591	2020-07-02 13:58:24.288938	movie
4478	Indecent Proposal	1993-04-07	/aKWx2VUyiyY1v0Fja9gfvNfKi9j.jpg	John Gage offers a down-on-his-luck yuppie husband $1 million for the opportunity to spend the night with the man's wife.	649	\N	2019-12-04 03:38:41.517155	2020-07-02 13:58:24.305437	movie
6957	The 40 Year Old Virgin	2005-08-11	/og0K9l7xks07EvBqCGpUomGEqVe.jpg	Andy Stitzer has a pleasant life with a nice apartment and a job stamping invoices at an electronics store. But at age 40, there's one thing Andy hasn't done, and it's really bothering his sex-obsessed male co-workers: Andy is still a virgin. Determined to help Andy get laid, the guys make it their mission to de-virginize him. But it all seems hopeless until Andy meets small business owner Trish, a single mom.	4003	\N	2019-12-05 16:42:45.126419	2020-07-02 13:58:24.388123	movie
2749	15 Minutes	2001-03-01	/8AU4LjWbcFfKKdJcGrUMjEbIyt0.jpg	When Eastern European criminals Oleg and Emil come to New York City to pick up their share of a heist score, Oleg steals a video camera and starts filming their activities, both legal and illegal. When they learn how the American media circus can make a remorseless killer look like the victim and make them rich, they target media-savvy NYPD Homicide Detective Eddie Flemming and media-naive FDNY Fire Marshal Jordy Warsaw, the cops investigating their murder and torching of their former criminal partner, filming everything to sell to the local tabloid TV show "Top Story."	361	\N	2019-12-05 16:43:54.872836	2020-07-02 13:58:24.420581	movie
8923	Green Street Hooligans	2005-09-09	/zqg5SCkN0mu8p4w7dWI1sdDKgEW.jpg	After being wrongfully expelled from Harvard University, American Matt Buckner flees to his sister's home in England. Once there, he is befriended by her charming and dangerous brother-in-law, Pete Dunham, and introduced to the underworld of British football hooliganism. Matt learns to stand his ground through a friendship that develops against the backdrop of this secret and often violent world. 'Green Street Hooligans' is a story of loyalty, trust and the sometimes brutal consequences of living close to the edge.	1429	\N	2020-04-11 02:50:56.22444	2020-07-02 13:58:24.729001	movie
49494	The Eagle	2011-02-08	/mbsdwO4lfIARqt35VVTM0UlYkhZ.jpg	In 140 AD, twenty years after the unexplained disappearance of the entire Ninth Legion in the mountains of Scotland, young centurion Marcus Aquila (Tatum) arrives from Rome to solve the mystery and restore the reputation of his father, the commander of the Ninth. Accompanied only by his British slave Esca (Bell), Marcus sets out across Hadrian's Wall into the uncharted highlands of Caledonia - to confront its savage tribes, make peace with his father's memory, and retrieve the lost legion's golden emblem, the Eagle of the Ninth.	760	\N	2019-12-22 04:36:39.033252	2020-07-02 13:58:26.017426	movie
399404	Darkest Hour	2017-11-22	/z0K8uoNbrYKkbaP7wIeadJ4BmSL.jpg	A thrilling and inspiring true story begins on the eve of World War II as, within days of becoming Prime Minister of Great Britain, Winston Churchill must face one of his most turbulent and defining trials: exploring a negotiated peace treaty with Nazi Germany, or standing firm to fight for the ideals, liberty and freedom of a nation. As the unstoppable Nazi forces roll across Western Europe and the threat of invasion is imminent, and with an unprepared public, a skeptical King, and his own party plotting against him, Churchill must withstand his darkest hour, rally a nation, and attempt to change the course of world history.	2895	\N	2019-10-19 21:14:56.14553	2020-07-02 13:58:27.154404	movie
318121	The Fundamentals of Caring	\N	/zZ0eda1GyHILNSoq9KF5u0hcq6O.jpg	Having suffered a tragedy, Ben becomes a caregiver to earn money. His first client, Trevor, is a hilarious 18-year-old with muscular dystrophy. One paralyzed emotionally, one paralyzed physically, Ben and Trevor hit the road on a trip into the western states. The folks they collect along the way will help them test their skills for surviving outside their calculated existence. Together, they come to understand the importance of hope and the necessity of true friendship.	1222	\N	2019-06-28 20:43:30.851541	2020-07-02 13:58:29.668475	movie
24021	The Twilight Saga: Eclipse	2010-06-23	/4IIFFKd9vxrlicNbAPS8ONEgIFp.jpg	Bella once again finds herself surrounded by danger as Seattle is ravaged by a string of mysterious killings and a malicious vampire continues her quest for revenge. In the midst of it all, she is forced to choose between her love for Edward and her friendship with Jacob, knowing that her decision has the potential to ignite the ageless struggle between vampire and werewolf. With her graduation quickly approaching, Bella is confronted with the most important decision of her life.	5044	\N	2019-07-31 16:00:11.675182	2020-07-02 13:58:29.723437	movie
505026	Death on the Nile	2022-02-09	/kVr5zIAFSPRQ57Y1zE7KzmhzdMQ.jpg	Belgian sleuth Hercule Poirot boards a glamorous river steamer with enough champagne to fill the Nile. But his Egyptian vacation turns into a thrilling search for a murderer when a picture-perfect couple’s idyllic honeymoon is tragically cut short.	1396	\N	2022-04-22 15:30:24.55451	2022-04-22 15:30:24.55451	movie
99993716	The Mosquito Coast	\N	/yVtwJQN2uBbGF9rryXPIvuJHWzH.jpg	Allie Fox—a brilliant inventor and stubborn idealist—uproots his family for a dangerous quest through Mexico to flee the U.S. government and find safety.	155	\N	2022-04-22 15:30:38.183279	2022-04-22 15:30:38.183279	tv
398175	Brawl in Cell Block 99	2017-09-23	/bfB1J6jsjdGWKjXxKQ5hNd1OyAs.jpg	After working as a drug courier and getting into a brutal shootout with police, a former boxer finds himself at the mercy of his enemies as they force him to instigate violent acts that turn the prison he resides in into a battleground.	1037	\N	2022-04-22 15:33:14.445295	2022-04-22 15:33:14.445295	movie
106	Predator	1987-06-12	/vCa7uRFeoIdKWpoOrZY6OUW9vk6.jpg	Dutch and his group of commandos are hired by the CIA to rescue downed airmen from guerillas in a Central American jungle. The mission goes well but as they return they find that something is hunting them. Nearly invisible, it blends in with the forest, taking trophies from the bodies of its victims as it goes along. Occasionally seeing through its eyes, the audience sees it is an intelligent alien hunter, hunting them for sport, killing them off one at a time.	3803	\N	2019-07-31 17:47:49.565838	2020-07-02 13:58:29.844503	movie
339877	Loving Vincent	\N	/56sq57kDm7XgyXBYrgJLumo0Jac.jpg	The film brings the paintings of Vincent van Gogh to life to tell his remarkable story. Every one of the 65,000 frames of the film is an oil-painting hand-painted by 125 professional oil-painters who travelled from all across the world to the Loving Vincent studios in Poland and Greece to be a part of the production. As remarkable as Vincent’s brilliant paintings are his passionate and ill-fated life and mysterious death.	1178	\N	2019-05-10 17:49:47.359233	2020-07-02 13:58:31.437761	movie
70	Million Dollar Baby	2004-12-15	/jcfEqKdWF1zeyvECPqp3mkWLct2.jpg	\N	4674	\N	2019-04-06 04:18:08.991016	2020-07-02 13:58:32.478284	movie
644	A.I. Artificial Intelligence	2001-06-29	/wnUAcUrMRGPPZUDroLeZhSjLkuu.jpg	\N	3394	\N	2019-04-06 04:17:24.973541	2020-07-02 13:58:32.824354	movie
641	Requiem for a Dream	2000-10-06	/a1BrBoErndBAYEZZEJaotIJ6CE1.jpg	The hopes and dreams of four ambitious people are shattered when their drug addictions begin spiraling out of control. A look into addiction and how it overcomes the mind and body.	8025	\N	2022-04-23 02:54:41.12858	2022-04-23 02:54:41.12858	movie
10871	Switchback	1997-10-31	/elEHm8d9yHYv1ua3hyukPZQjpGi.jpg	FBI agent Dennis Quaid tries to catch a serial killer who kidnapped his son.	167	\N	2022-04-23 02:55:21.138964	2022-04-23 02:55:21.138964	movie
616651	Stillwater	2021-07-29	/cPdmPwcIcmu0ugfKcdFtI3vmOJq.jpg	Bill Baker, an American oil-rig roughneck from Oklahoma, travels to Marseille to visit his estranged daughter, Allison, who is in prison for a murder she claims she did not commit. Confronted with language barriers, cultural differences, and a complicated legal system, Bill builds a new life for himself in France as he makes it his personal mission to exonerate his daughter.	643	\N	2022-06-12 23:54:29.184564	2022-06-12 23:54:29.184564	movie
9477	King Arthur	2004-07-07	/5Mqmke8JKE7s8JeYNp7XtzxQXbL.jpg	The story of the Arthurian legend, based on the 'Sarmatian hypothesis' which contends that the legend has a historical nucleus in the Sarmatian heavy cavalry troops stationed in Britain, and that the Roman-British military commander, Lucius Artorius Castus is the historical person behind the legend.	2254	\N	2022-06-25 20:12:13.662223	2022-06-25 20:12:13.662223	movie
64688	21 Jump Street	2012-03-14	/8v3Sqv9UcIUC4ebmpKWROqPBINZ.jpg	In high school, Schmidt was a dork and Jenko was the popular jock. After graduation, both of them joined the police force and ended up as partners riding bicycles in the city park. Since they are young and look like high school students, they are assigned to an undercover unit to infiltrate a drug ring that is supplying high school students synthetic drugs.	8898	\N	2022-06-25 20:15:38.65506	2022-06-25 20:15:38.65506	movie
725201	The Gray Man	2022-07-13	/13r1DFhfL0qufFjXnrvWuh6qKqH.jpg	When the CIA's most skilled mercenary known as Court Gentry, aka Sierra Six, accidentally uncovers dark agency secrets, he becomes a primary target and is hunted around the world by psychopathic former colleague Lloyd Hansen and international assassins.	251	\N	2022-07-24 00:38:54.629902	2022-07-24 00:38:54.629902	movie
799876	The Outfit	2022-03-03	/lZa5EB6PVJBT5mxhgZS5ftqdAm6.jpg	Leonard is an English tailor who used to craft suits on London’s world-famous Savile Row. After a personal tragedy, he’s ended up in Chicago, operating a small tailor shop in a rough part of town where he makes beautiful clothes for the only people around who can afford them: a family of vicious gangsters.	340	\N	2022-08-05 03:22:40.203192	2022-08-05 03:22:40.203192	movie
766507	Prey	2022-08-02	/ujr5pztc1oitbe7ViMUOilFaJ7s.jpg	In the Comanche Nation in 1717, a fierce and highly skilled warrior named Naru learns the prey she is stalking is a highly evolved alien with a technologically advanced arsenal.	1096	\N	2022-08-08 03:10:11.776903	2022-08-08 03:10:11.776903	movie
49046	All Quiet on the Western Front	2022-10-07	/hYqOjJ7Gh1fbqXrxlIao1g8ZehF.jpg	Paul Baumer and his friends Albert and Muller, egged on by romantic dreams of heroism, voluntarily enlist in the German army. Full of excitement and patriotic fervour, the boys enthusiastically march into a war they believe in. But once on the Western Front, they discover the soul-destroying horror of World War I.	7	\N	2022-10-28 22:21:09.320224	2022-10-28 22:21:09.320224	movie
50646	Crazy, Stupid, Love.	2011-07-29	/p4RafgAPk558muOjnBMHhMArjS2.jpg	Cal Weaver is living the American dream. He has a good job, a beautiful house, great children and a beautiful wife, named Emily. Cal's seemingly perfect life unravels, however, when he learns that Emily has been unfaithful and wants a divorce. Over 40 and suddenly single, Cal is adrift in the fickle world of dating. Enter, Jacob Palmer, a self-styled player who takes Cal under his wing and teaches him how to be a hit with the ladies.	7060	\N	2022-08-09 05:21:06.877785	2022-08-09 05:21:06.877785	movie
99990802	The Sandman	\N	/q54qEgagGOYCq5D1903eBVMNkbo.jpg	After years of imprisonment, Morpheus — the King of Dreams — embarks on a journey across worlds to find what was stolen from him and restore his power.	593	\N	2022-08-29 05:31:59.03103	2022-08-29 05:31:59.03103	tv
13015	George Carlin: Life Is Worth Losing	2005-11-05	/xqkSO5Kd1XPVaZsq9ao1X1E24aC.jpg	Carlin returns to the stage in his 13th live comedy stand-up special, performed at the Beacon Theatre in New York City for HBO®. His spot-on observations on the deterioration of human behavior include Americans’ obsession with their two favorite addictions - shopping and eating; his creative idea for The All-Suicide Channel, a new reality TV network; and the glorious rebirth of the planet to its original pristine condition - once the fires and floods destroy life as we know it.	69	\N	2022-09-01 21:41:45.078052	2022-09-01 21:41:45.078052	movie
99981357	Dead to Me	\N	/dU4K5KGQVqSae8IMd55XAExmxoE.jpg	A hotheaded widow searching for the hit-and-run driver who mowed down her husband befriends an eccentric optimist who isn't quite what she seems.	287	\N	2022-09-05 02:54:34.606031	2022-09-05 02:54:34.606031	tv
913	The Thomas Crown Affair	1999-08-06	/5yqs1MVlqdIg1DY5adC5jFx3d7j.jpg	A very rich and successful playboy amuses himself by stealing artwork, but may have met his match in a seductive detective.	948	\N	2022-09-06 02:24:28.840296	2022-09-06 02:24:28.840296	movie
616037	Thor: Love and Thunder	2022-07-06	/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg	After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor Odinson enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Relatively Mighty Girl Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher’s vengeance and stop him before it’s too late.	2244	\N	2022-09-06 02:24:50.014564	2022-09-06 02:24:50.014564	movie
999135868	The Patient	\N	/fB1848j0pvNnYilXB0ho5OCfiIz.jpg	A psychotherapist finds himself held prisoner by a serial killer with an unusual request: curb his homicidal urges.	10	\N	2022-09-06 02:25:35.547526	2022-09-06 02:25:35.547526	tv
999155537	Black Bird	\N	/79M2yNSmkh4CCMrWNV6b2xvIeNn.jpg	As Jimmy Keene begins a 10-year prison sentence, he gets an incredible offer: If he can elicit a confession from suspected killer Larry Hall, Jimmy will be freed. Completing this mission becomes the challenge of a lifetime.	129	\N	2022-09-06 04:47:41.278575	2022-09-06 04:47:41.278575	tv
209403	Bad Words	2013-09-06	/9ZOz1GTFsrfGZNziZHupOvqUdub.jpg	A misanthropic man sets out to exact revenge on his estranged father, by finding a loophole and attempting to win the National Spelling Bee as an adult. Figuring it would destroy his father, and everything he's worked so hard for as head of the Spelling Bee Championship Organization, Guy Trilby eventually discovers winning isn't necessary for revenge, and that friendship is a blessing not a curse.	669	\N	2022-09-06 11:27:02.263464	2022-09-06 11:27:02.263464	movie
9894	The Cable Guy	1996-06-10	/5cZySBvy41eHTD5LyQn48aP444k.jpg	When recently single Steven moves into his new apartment, cable guy Chip comes to hook him up—and doesn't let go. Initially, Chip is just overzealous in his desire to be Steven's pal, but when Steven tries to end the 'friendship', Chip shows his dark side. He begins stalking Steven, who's left to fend for himself because no one else can believe Chip's capable of such behaviour.	1963	\N	2022-09-06 11:31:32.57584	2022-09-06 11:31:32.57584	movie
532639	Pinocchio	2022-09-07	/h32gl4a3QxQWNiNaR4Fc1uvLBkV.jpg	A wooden puppet embarks on a thrilling adventure to become a real boy.	563	\N	2022-09-19 22:04:39.048287	2022-09-19 22:04:39.048287	movie
698948	Thirteen Lives	2022-07-18	/yi5KcJqFxy0D6yP8nCfcF8gJGg5.jpg	Based on the true nail-biting mission that captivated the world. Twelve boys and the coach of a Thai soccer team explore the Tham Luang cave when an unexpected rainstorm traps them in a chamber inside the mountain. Entombed behind a maze of flooded cave tunnels, they face impossible odds. A team of world-class divers navigate through miles of dangerous cave networks to discover that finding the boys is only the beginning.	658	\N	2022-09-21 21:13:43.280066	2022-09-21 21:13:43.280066	movie
674324	The Banshees of Inisherin	2022-10-21	/4QyraSWF1EQYKGnN5rAVnnNQIrR.jpg	Two lifelong friends find themselves at an impasse when one abruptly ends their relationship, with alarming consequences for both of them.	4	\N	2022-10-18 17:15:29.139152	2022-10-18 17:15:29.139152	movie
99992783	She-Hulk: Attorney at Law	\N	/hJfI6AGrmr4uSHRccfJuSsapvOb.jpg	Jennifer Walters navigates the complicated life of a single, 30-something attorney who also happens to be a green 6-foot-7-inch superpowered hulk.	1108	\N	2022-10-19 23:01:30.129627	2022-10-19 23:01:30.129627	tv
614934	Elvis	2022-06-22	/qBOKWqAFbveZ4ryjJJwbie6tXkQ.jpg	The life story of Elvis Presley as seen through the complicated relationship with his enigmatic manager, Colonel Tom Parker.	1677	\N	2022-10-19 23:02:31.357864	2022-10-19 23:02:31.357864	movie
763285	Ambulance	2022-03-16	/kuxjMVuc3VTD7p42TZpJNsSrM1V.jpg	Decorated veteran Will Sharp, desperate for money to cover his wife's medical bills, asks for help from his adoptive brother Danny. A charismatic career criminal, Danny instead offers him a score: the biggest bank heist in Los Angeles history: $32 million.	1171	\N	2022-10-19 23:11:24.113725	2022-10-19 23:11:24.113725	movie
99994997	House of the Dragon	\N	/z2yahl2uefxDCl0nogcRBstwruJ.jpg	The Targaryen dynasty is at the absolute apex of its power, with more than 15 dragons under their yoke. Most empires crumble from such heights. In the case of the Targaryens, their slow fall begins when King Viserys breaks with a century of tradition by naming his daughter Rhaenyra heir to the Iron Throne. But when Viserys later fathers a son, the court is shocked when Rhaenyra retains her status as his heir, and seeds of division sow friction across the realm.	2113	\N	2022-10-28 03:52:28.790599	2022-10-28 03:52:28.790599	tv
718930	Bullet Train	2022-07-03	/tVxDe01Zy3kZqaZRNiXFGDICdZk.jpg	Unlucky assassin Ladybug is determined to do his job peacefully after one too many gigs gone off the rails. Fate, however, may have other plans, as Ladybug's latest mission puts him on a collision course with lethal adversaries from around the globe—all with connected, yet conflicting, objectives—on the world's fastest train.	2022	\N	2022-10-28 03:52:40.542964	2022-10-28 03:52:40.542964	movie
756999	The Black Phone	2022-06-22	/lr11mCT85T1JanlgjMuhs9nMht4.jpg	Finney Blake, a shy but clever 13-year-old boy, is abducted by a sadistic killer and trapped in a soundproof basement where screaming is of little use. When a disconnected phone on the wall begins to ring, Finney discovers that he can hear the voices of the killer’s previous victims. And they are dead set on making sure that what happened to them doesn’t happen to Finney.	2927	\N	2022-10-28 22:07:05.473797	2022-10-28 22:07:05.473797	movie
99987739	The Queen's Gambit	\N	/zU0htwkhNvBQdVSIKB9s6hgVeFK.jpg	In a Kentucky orphanage in the 1950s, a young girl discovers an astonishing talent for chess while struggling with addiction.	3052	\N	2022-10-28 22:08:21.416594	2022-10-28 22:08:21.416594	tv
1669	The Hunt for Red October	1990-03-02	/yVl7zidse4KiWtGMqHFtZCx4X3N.jpg	A new technologically-superior Soviet nuclear sub, the Red October, is heading for the U.S. coast under the command of Captain Marko Ramius. The American government thinks Ramius is planning to attack. A lone CIA analyst has a different idea: he thinks Ramius is planning to defect, but he has only a few hours to find him and prove it - because the entire Russian naval and air commands are trying to find him, too. The hunt is on!	2703	\N	2022-10-28 22:25:54.911286	2022-10-28 22:25:54.911286	movie
2246	Malice	1993-09-29	/oQoe4eIzDjQSSqGvLgJFjXtEkNv.jpg	A tale about a happily married couple who would like to have children. Tracy teaches infants, Andy's a college professor. Things are never the same after she is taken to hospital and operated upon by Jed, a "know all" doctor.	361	\N	2022-10-28 22:26:26.908034	2022-10-28 22:26:26.908034	movie
2087	The Getaway	1994-02-11	/4tWvZ4BQu3ICmtUL8lXHa9OgkoF.jpg	Doc McCoy is put in prison because his partners chickened out and flew off without him after exchanging a prisoner with a lot of money. Doc knows Jack Benyon, a rich "business"-man, is up to something big, so he tells his wife (Carol McCoy) to tell him that he's for sale if Benyon can get him out of prison. Benyon pulls some strings and Doc McCoy is released again. Unfortunately he has to cooperate with the same person that got him to prison.	263	\N	2022-10-28 22:26:30.401293	2022-10-28 22:26:30.401293	movie
7552	Fun with Dick and Jane	2005-12-21	/1NBVGBi8Z6MhJBAJ5SuRMqP7o3T.jpg	After Dick Harper loses his job at Globodyne in an Enron-esque collapse, he and his wife, Jane, turn to crime in order to handle the massive debt they now face. Two intelligent people, Dick and Jane actually get pretty good at robbing people and even enjoy it -- but they have second thoughts when they're reminded that crime can hurt innocent people. When the couple hears that Globodyne boss Jack McCallister actually swindled the company, they plot revenge.	2033	\N	2022-10-28 22:27:03.003948	2022-10-28 22:27:03.003948	movie
551271	Medieval	2022-09-08	/4njdAkiBdC5LnFApeXSkFQ78GdT.jpg	The story of 14th century Czech icon and warlord Jan Zizka who defeated armies of the Teutonic Order and the Holy Roman Empire.	39	\N	2022-11-06 03:15:16.563492	2022-11-06 03:15:16.563492	movie
\.


--
-- Data for Name: movies_playlists; Type: TABLE DATA; Schema: public; Owner: hmbsjvszjwjnui
--

COPY "public"."movies_playlists" ("playlist_id", "movie_id") FROM stdin;
1	345887
1	353081
3	395834
3	10029
1	399361
1	411728
13	99994951
6	278
13	99997546
4	9414
4	4415
13	99944217
13	99985922
13	99972750
13	999118357
13	99983631
4	13701
4	4942
4	10162
1	339877
1	491472
24	164457
4	6463
4	92591
4	2322
1	49026
24	75174
24	10212
4	300673
4	13537
3	291328
4	711
3	152603
13	99934307
24	77
4	500860
4	2323
4	318121
82	99960059
4	65034
4	9631
28	13
27	106646
13	62668
13	1420
13	2710
13	4546
24	54344
13	79618
4	15487
24	9093
4	11973
4	459992
13	34307
4	275
29	429617
29	515195
29	60574
1	401981
25	379
30	107
25	263115
13	60574
3	65708
4	13466
3	60573
30	8321
25	16608
64	559969
64	475557
64	458156
64	450465
64	299537
64	1771
65	559969
65	429617
65	475557
66	299534
66	458156
66	479455
13	81532
68	299534
68	412117
68	181812
68	299537
68	299536
68	297802
68	287947
68	287947
68	287947
69	429617
69	181812
69	299534
69	299537
69	284054
69	287947
69	363088
69	297762
69	284052
69	36657
69	10195
69	76338
69	635324
69	197353
69	158600
69	600030
69	456788
69	420818
69	60735
70	429617
70	299534
70	60735
70	24428
70	99861
70	181812
70	299536
70	299537
70	297802
70	287947
70	181808
70	284054
71	487680
72	487680
72	517909
67	1817
4	10377
25	82633
30	82633
25	504949
25	35588
3	75450
3	68507
13	60573
3	71912
3	486947
3	443463
3	254578
4	293
4	9587
4	9882
67	459992
74	69740
74	63639
74	60574
74	63247
74	71912
74	60059
74	82856
74	44217
74	34307
74	1423
73	19885
74	63174
74	40008
73	67683
73	1438
73	1398
74	61662
3	7972
3	94951
13	94951
4	530723
30	399170
13	70523
75	9998592
75	587792
76	587792
76	399170
76	287689
76	246741
76	416477
76	9998592
76	205596
13	9992710
76	20544
76	8321
78	205596
78	629
78	11321
78	10074
78	20544
78	277
25	164457
25	77
25	9093
25	10212
78	254320
78	625568
3	9451
78	464052
81	1495
81	335778
81	23759
3	99995215
3	99997546
3	99994951
3	99980475
13	752623
13	152603
13	999125949
82	99992830
82	99952814
25	545609
82	99993716
82	99976479
82	99966732
13	99965708
13	99981357
83	186
83	77
83	10212
83	913
13	999135868
83	99919885
83	2493
83	504949
83	9870
83	209403
83	1542
83	246741
83	629
83	921
83	9665
82	99963247
82	99973107
82	99988329
82	99992783
13	614934
13	763285
13	616037
13	99960574
13	718930
13	8321
13	756999
13	99987739
13	497582
83	12149
83	8321
13	49046
13	551271
83	1262
83	3131
83	395834
83	399170
83	436969
83	515001
83	799876
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: public; Owner: hmbsjvszjwjnui
--

COPY "public"."playlists" ("id", "user_id", "name", "active", "created_at", "updated_at") FROM stdin;
19	6	Watchlist	\N	2019-05-15 08:11:53.106604	2019-05-15 08:11:53.106604
20	6	Watchlist I	t	2019-05-15 08:12:00.935359	2019-05-15 08:12:00.935359
5	4	Test	t	2019-03-20 15:40:07.110856	2019-03-20 15:40:07.110856
75	24	Eanny & Ben	t	2020-07-04 03:20:45.502505	2020-07-04 03:20:45.502505
6	3	Watchlist	t	2019-03-30 03:04:11.096262	2019-03-30 03:04:11.096262
1	1	Ben	t	2019-03-08 21:00:51.504165	2019-05-20 19:58:11.635608
30	2	Smithwicks	f	2019-09-25 23:00:54.430496	2020-07-29 19:01:57.200219
8	5	Joan and Ben	f	2019-05-10 17:35:14.675444	2019-05-10 17:35:14.675444
9	5	Joan's List	t	2019-05-10 17:36:00.442312	2019-05-10 17:36:14.177949
11	1	mom	f	2019-05-10 17:44:45.804419	2019-05-10 17:45:19.879188
12	4	Test I	t	2019-05-10 17:56:04.127845	2019-05-10 17:56:04.127845
28	8	Watch List	f	2019-07-19 19:54:31.22099	2019-07-19 19:55:14.577154
27	8	Parents	t	2019-07-19 19:54:14.895712	2019-07-19 19:55:14.587569
64	12	watchlist	t	2019-10-20 02:00:32.970202	2019-10-20 02:01:08.094639
81	2	Historical	f	2021-05-23 03:29:47.072612	2021-08-30 21:50:57.044471
66	15	watchlist II	f	2019-10-21 05:40:38.742195	2019-10-21 05:41:08.707614
65	15	watchlist	t	2019-10-21 05:39:55.349351	2019-10-21 05:41:08.719761
68	17	Max	t	2019-10-25 13:28:04.108409	2019-10-25 13:28:47.931821
69	18	Celtics	f	2019-10-25 13:57:06.284049	2019-10-25 15:06:04.246891
70	19	Jennifer 	t	2019-10-25 15:06:04.256677	2019-10-25 15:06:04.256677
72	21	Peggy's Playlist	t	2019-10-28 23:47:56.230403	2019-10-28 23:47:56.230403
29	10	Weekend	t	2019-09-19 22:15:21.248759	2019-09-19 22:15:42.612823
4	2	ParentsMovies	f	2019-03-08 21:56:12.551554	2020-04-25 02:18:45.567236
13	2	Wknd	f	2019-05-14 15:59:54.147981	2022-11-08 21:57:07.30939
83	2	Amy	t	2022-09-05 01:05:18.720429	2022-11-08 21:57:07.315133
3	2	Watchlist	f	2019-03-08 21:27:52.374406	2022-08-29 05:31:34.433026
82	2	TV	f	2022-06-26 23:06:02.874475	2022-10-19 23:02:27.491511
25	2	G. Cooper	f	2019-05-25 02:36:26.915116	2022-10-26 22:04:29.564918
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: hmbsjvszjwjnui
--

COPY "public"."ratings" ("id", "user_id", "movie_id", "score", "created_at", "updated_at", "stars") FROM stdin;
1178	2	438631	3	2021-11-06 19:43:25.907435	2021-11-06 19:43:25.907435	{yellow,yellow,yellow,white,white}
2	2	155	5	2019-03-29 20:15:49.064557	2019-03-29 20:15:49.064557	{yellow,yellow,yellow,yellow,yellow}
3	2	238	3	2019-03-29 20:15:52.146691	2019-03-29 20:15:52.146691	{yellow,yellow,yellow,white,white}
4	2	272	4	2019-03-29 20:16:04.565831	2019-03-29 20:16:04.565831	{yellow,yellow,yellow,yellow,white}
5	2	278	5	2019-03-29 20:16:11.435965	2019-03-29 20:16:11.435965	{yellow,yellow,yellow,yellow,yellow}
6	2	350	3	2019-03-29 20:16:13.20259	2019-03-29 20:16:13.20259	{yellow,yellow,yellow,white,white}
7	2	550	4	2019-03-29 20:16:15.074068	2019-03-29 20:16:15.074068	{yellow,yellow,yellow,yellow,white}
8	2	597	3	2019-03-29 20:16:19.703926	2019-03-29 20:16:19.703926	{yellow,yellow,yellow,white,white}
9	2	263115	5	2019-03-29 20:16:25.378157	2019-03-29 20:16:25.378157	{yellow,yellow,yellow,yellow,yellow}
11	2	400535	3	2019-03-29 20:16:37.204183	2019-03-29 20:16:37.204183	{yellow,yellow,yellow,white,white}
12	2	497	4	2019-03-29 20:18:51.48751	2019-03-29 20:18:51.48751	{yellow,yellow,yellow,yellow,white}
13	2	424	5	2019-03-29 20:18:53.381073	2019-03-29 20:18:53.381073	{yellow,yellow,yellow,yellow,yellow}
15	2	240	3	2019-03-29 20:19:09.139042	2019-03-29 20:19:09.139042	{yellow,yellow,yellow,white,white}
1179	2	1571	3	2021-11-06 19:44:15.880661	2021-11-06 19:44:15.880661	{yellow,yellow,yellow,white,white}
17	2	122	3	2019-03-29 20:19:22.775689	2019-03-29 20:19:22.775689	{yellow,yellow,yellow,white,white}
18	2	510	3	2019-03-29 20:19:24.622154	2019-03-29 20:19:24.622154	{yellow,yellow,yellow,white,white}
19	2	769	5	2019-03-29 20:19:27.251036	2019-03-29 20:19:27.251036	{yellow,yellow,yellow,yellow,yellow}
20	2	73	4	2019-03-29 20:19:49.696331	2019-03-29 20:19:49.696331	{yellow,yellow,yellow,yellow,white}
21	2	598	5	2019-03-29 20:19:51.297177	2019-03-29 20:19:51.297177	{yellow,yellow,yellow,yellow,yellow}
1180	2	3172	2	2021-11-06 19:44:44.325536	2021-11-06 19:44:44.325536	{yellow,yellow,white,white,white}
1181	2	9292	2	2021-11-06 19:44:54.293987	2021-11-06 19:44:54.293987	{yellow,yellow,white,white,white}
23	2	567	3	2019-03-29 20:20:10.229846	2019-03-29 20:20:10.229846	{yellow,yellow,yellow,white,white}
25	2	807	5	2019-03-29 20:20:26.249719	2019-03-29 20:20:26.249719	{yellow,yellow,yellow,yellow,yellow}
26	2	423	2	2019-03-29 20:20:27.499755	2019-03-29 20:20:27.499755	{yellow,yellow,white,white,white}
27	2	490132	4	2019-03-29 20:20:29.127185	2019-03-29 20:20:29.127185	{yellow,yellow,yellow,yellow,white}
28	2	120	4	2019-03-29 20:20:36.111406	2019-03-29 20:20:36.111406	{yellow,yellow,yellow,yellow,white}
29	2	27205	4	2019-03-29 20:20:38.90787	2019-03-29 20:20:38.90787	{yellow,yellow,yellow,yellow,white}
30	2	274	4	2019-03-29 20:20:40.696969	2019-03-29 20:20:40.696969	{yellow,yellow,yellow,yellow,white}
32	2	157336	3	2019-03-29 20:20:54.357718	2019-03-29 20:20:54.357718	{yellow,yellow,yellow,white,white}
33	2	121	3	2019-03-29 20:20:58.748129	2019-03-29 20:20:58.748129	{yellow,yellow,yellow,white,white}
34	2	629	5	2019-03-29 20:21:09.394286	2019-03-29 20:21:09.394286	{yellow,yellow,yellow,yellow,yellow}
35	2	28	4	2019-03-29 20:21:11.237269	2019-03-29 20:21:11.237269	{yellow,yellow,yellow,yellow,white}
36	2	548	4	2019-03-29 20:21:20.786811	2019-03-29 20:21:20.786811	{yellow,yellow,yellow,yellow,white}
37	2	77	5	2019-03-29 20:21:22.505473	2019-03-29 20:21:22.505473	{yellow,yellow,yellow,yellow,yellow}
38	2	185	1	2019-03-29 20:21:32.250466	2019-03-29 20:21:32.250466	{yellow,white,white,white,white}
39	2	11	5	2019-03-29 20:21:34.44968	2019-03-29 20:21:34.44968	{yellow,yellow,yellow,yellow,yellow}
40	2	359940	3	2019-03-29 20:21:47.988947	2019-03-29 20:21:47.988947	{yellow,yellow,yellow,white,white}
1182	2	497698	4	2021-11-06 19:47:50.53719	2021-11-06 19:47:53.723285	{yellow,yellow,yellow,yellow,white}
42	2	1124	4	2019-03-29 20:21:58.439866	2019-03-29 20:21:58.439866	{yellow,yellow,yellow,yellow,white}
1183	2	637649	3	2021-11-06 19:48:05.130564	2021-11-06 19:48:05.130564	{yellow,yellow,yellow,white,white}
44	2	1422	5	2019-03-29 20:22:11.339423	2019-03-29 20:22:11.339423	{yellow,yellow,yellow,yellow,yellow}
1184	2	588228	2	2021-11-06 19:48:08.821136	2021-11-06 19:48:08.821136	{yellow,yellow,white,white,white}
31	2	299536	4	2019-03-29 20:20:47.860433	2019-08-26 20:05:39.728498	{yellow,yellow,yellow,yellow,white}
46	2	16869	3	2019-03-29 20:22:26.198687	2019-03-29 20:22:26.198687	{yellow,yellow,yellow,white,white}
47	2	111	3	2019-03-29 20:22:28.165928	2019-03-29 20:22:28.165928	{yellow,yellow,yellow,white,white}
10	2	286217	4	2019-03-29 20:16:26.794712	2019-09-05 20:25:32.803823	{yellow,yellow,yellow,yellow,white}
1185	2	791373	4	2021-11-06 19:48:16.023822	2021-11-06 19:48:16.023822	{yellow,yellow,yellow,yellow,white}
14	2	680	5	2019-03-29 20:18:55.913935	2022-04-23 20:47:36.155528	{yellow,yellow,yellow,yellow,yellow}
50	2	582	4	2019-03-29 20:22:52.561099	2019-03-29 20:22:52.561099	{yellow,yellow,yellow,yellow,white}
52	2	205596	5	2019-03-29 20:22:55.485927	2019-03-29 20:22:55.485927	{yellow,yellow,yellow,yellow,yellow}
54	2	7345	3	2019-03-29 20:23:00.711583	2019-03-29 20:23:00.711583	{yellow,yellow,yellow,white,white}
56	2	324786	3	2019-03-29 20:23:12.358214	2019-03-29 20:23:12.358214	{yellow,yellow,yellow,white,white}
1186	2	399566	3	2021-11-06 19:48:28.603256	2021-11-06 19:48:28.603256	{yellow,yellow,yellow,white,white}
1187	2	800497	3	2021-11-06 19:49:43.979816	2021-11-06 19:49:43.979816	{yellow,yellow,yellow,white,white}
48	2	98	5	2019-03-29 20:22:30.177968	2019-07-19 20:06:05.039483	{yellow,yellow,yellow,yellow,yellow}
58	2	348	3	2019-03-29 20:23:22.362637	2019-10-07 17:36:50.928581	{yellow,yellow,yellow,white,white}
49	2	603	5	2019-03-29 20:22:42.31582	2019-03-29 20:22:42.31582	{yellow,yellow,yellow,yellow,yellow}
51	2	38	3	2019-03-29 20:22:54.172535	2019-03-29 20:22:54.172535	{yellow,yellow,yellow,white,white}
53	2	11324	3	2019-03-29 20:22:57.083953	2019-03-29 20:22:57.083953	{yellow,yellow,yellow,white,white}
55	2	857	5	2019-03-29 20:23:06.463923	2019-03-29 20:23:06.463923	{yellow,yellow,yellow,yellow,yellow}
57	2	489	5	2019-03-29 20:23:14.029661	2019-03-29 20:23:14.029661	{yellow,yellow,yellow,yellow,yellow}
59	2	1955	3	2019-03-29 20:23:42.726022	2019-03-29 20:23:42.726022	{yellow,yellow,yellow,white,white}
60	3	278	5	2019-03-30 02:41:42.277587	2019-03-30 02:41:42.277587	{yellow,yellow,yellow,yellow,yellow}
61	3	424	5	2019-03-30 02:41:47.667337	2019-03-30 02:41:47.667337	{yellow,yellow,yellow,yellow,yellow}
62	3	769	5	2019-03-30 02:41:52.704437	2019-03-30 02:41:52.704437	{yellow,yellow,yellow,yellow,yellow}
63	3	13	5	2019-03-30 02:41:55.385769	2019-03-30 02:41:55.385769	{yellow,yellow,yellow,yellow,yellow}
64	3	73	4	2019-03-30 02:42:01.130119	2019-03-30 02:42:01.130119	{yellow,yellow,yellow,yellow,white}
65	3	207	4	2019-03-30 02:42:04.007972	2019-03-30 02:42:04.007972	{yellow,yellow,yellow,yellow,white}
66	3	101	5	2019-03-30 02:42:09.054962	2019-03-30 02:42:09.054962	{yellow,yellow,yellow,yellow,yellow}
67	2	745	5	2019-04-06 04:14:57.539874	2019-04-06 04:14:57.539874	{yellow,yellow,yellow,yellow,yellow}
68	2	68718	4	2019-04-06 04:15:03.417933	2019-04-06 04:15:03.417933	{yellow,yellow,yellow,yellow,white}
1188	2	550988	4	2021-11-28 20:27:42.122232	2021-11-28 20:27:42.122232	{yellow,yellow,yellow,yellow,white}
92	2	453	3	2019-04-06 04:18:04.765436	2019-06-28 20:40:31.210497	{yellow,yellow,yellow,white,white}
70	2	197	5	2019-04-06 04:15:18.633302	2019-04-06 04:15:18.633302	{yellow,yellow,yellow,yellow,yellow}
72	2	162	4	2019-04-06 04:15:25.092121	2019-04-06 04:15:27.67748	{yellow,yellow,yellow,yellow,white}
73	2	9475	5	2019-04-06 04:15:35.240963	2019-04-06 04:15:35.240963	{yellow,yellow,yellow,yellow,yellow}
74	2	6977	3	2019-04-06 04:16:02.828753	2019-04-06 04:16:02.828753	{yellow,yellow,yellow,white,white}
75	2	7485	2	2019-04-06 04:16:05.03729	2019-04-06 04:16:06.90448	{yellow,yellow,white,white,white}
76	2	64690	3	2019-04-06 04:16:12.019039	2019-04-06 04:16:12.019039	{yellow,yellow,yellow,white,white}
77	2	1949	3	2019-04-06 04:16:21.303649	2019-04-06 04:16:21.303649	{yellow,yellow,yellow,white,white}
1189	2	436969	4	2021-11-28 20:27:53.614374	2021-11-28 20:27:53.614374	{yellow,yellow,yellow,yellow,white}
79	2	103	3	2019-04-06 04:16:58.165339	2019-04-06 04:16:58.165339	{yellow,yellow,yellow,white,white}
80	2	53182	2	2019-04-06 04:17:01.693373	2019-04-06 04:17:01.693373	{yellow,yellow,white,white,white}
81	2	58595	3	2019-04-06 04:17:09.875929	2019-04-06 04:17:09.875929	{yellow,yellow,yellow,white,white}
83	2	154400	3	2019-04-06 04:17:15.573728	2019-04-06 04:17:15.573728	{yellow,yellow,yellow,white,white}
84	2	314365	3	2019-04-06 04:17:18.946648	2019-04-06 04:17:18.946648	{yellow,yellow,yellow,white,white}
85	2	644	2	2019-04-06 04:17:24.978962	2019-04-06 04:17:24.978962	{yellow,yellow,white,white,white}
1190	2	9991405	5	2021-11-28 20:28:21.697967	2021-11-28 20:28:21.697967	{yellow,yellow,yellow,yellow,yellow}
86	2	296098	3	2019-04-06 04:17:43.432041	2019-04-06 04:17:43.432041	{yellow,yellow,yellow,white,white}
1191	2	99984958	3	2021-12-04 20:45:57.22778	2021-12-04 20:45:57.22778	{yellow,yellow,yellow,white,white}
88	2	22803	3	2019-04-06 04:17:54.953902	2019-04-06 04:17:54.953902	{yellow,yellow,yellow,white,white}
89	2	23168	4	2019-04-06 04:17:56.480113	2019-04-06 04:17:56.480113	{yellow,yellow,yellow,yellow,white}
90	2	640	5	2019-04-06 04:18:01.198737	2019-04-06 04:18:01.198737	{yellow,yellow,yellow,yellow,yellow}
91	2	628	5	2019-04-06 04:18:02.832933	2019-04-06 04:18:02.832933	{yellow,yellow,yellow,yellow,yellow}
93	2	70	3	2019-04-06 04:18:09.007916	2019-04-06 04:18:09.007916	{yellow,yellow,yellow,white,white}
94	2	2253	3	2019-04-06 04:18:11.912546	2019-04-06 04:18:11.912546	{yellow,yellow,yellow,white,white}
95	2	5915	3	2019-04-06 04:18:13.401564	2019-04-06 04:18:13.401564	{yellow,yellow,yellow,white,white}
96	2	75780	3	2019-04-06 04:18:15.818105	2019-04-06 04:18:15.818105	{yellow,yellow,yellow,white,white}
97	2	12162	5	2019-04-06 04:18:17.709443	2019-04-06 04:18:17.709443	{yellow,yellow,yellow,yellow,yellow}
82	2	64682	2	2019-04-06 04:17:12.339021	2019-12-22 04:37:46.630826	{yellow,yellow,white,white,white}
22	2	207	5	2019-03-29 20:20:01.4048	2020-03-21 03:33:53.066245	{yellow,yellow,yellow,yellow,yellow}
1192	2	615457	3	2021-12-04 20:47:25.501476	2021-12-04 20:47:25.501476	{yellow,yellow,yellow,white,white}
1193	2	566525	3	2021-12-18 07:32:00.217354	2021-12-18 07:32:01.28727	{yellow,yellow,yellow,white,white}
98	2	338766	3	2019-04-06 04:18:24.456216	2019-04-06 04:18:24.456216	{yellow,yellow,yellow,white,white}
99	2	8358	3	2019-04-06 04:18:28.32259	2019-04-06 04:18:28.32259	{yellow,yellow,yellow,white,white}
101	2	12405	3	2019-04-06 04:18:47.299319	2019-04-06 04:18:47.299319	{yellow,yellow,yellow,white,white}
102	2	2503	5	2019-04-06 04:19:03.174069	2019-04-06 04:19:03.174069	{yellow,yellow,yellow,yellow,yellow}
103	2	949	4	2019-04-06 04:19:09.788117	2019-04-06 04:19:09.788117	{yellow,yellow,yellow,yellow,white}
104	2	10162	3	2019-04-07 01:38:44.739306	2019-04-07 01:38:44.739306	{yellow,yellow,yellow,white,white}
1194	2	600583	3	2021-12-18 07:32:15.332237	2021-12-18 07:32:15.332237	{yellow,yellow,yellow,white,white}
106	2	9741	4	2019-04-07 02:36:01.721106	2019-04-07 02:36:01.721106	{yellow,yellow,yellow,yellow,white}
107	2	150540	3	2019-04-07 02:36:03.471593	2019-04-07 02:36:03.471593	{yellow,yellow,yellow,white,white}
108	2	315635	4	2019-04-07 02:36:11.354661	2019-04-07 02:36:11.354661	{yellow,yellow,yellow,yellow,white}
109	2	6479	4	2019-04-07 02:36:42.426611	2019-04-07 02:36:42.426611	{yellow,yellow,yellow,yellow,white}
110	2	374720	2	2019-04-07 02:36:49.212199	2019-04-07 02:36:49.212199	{yellow,yellow,white,white,white}
111	2	568	4	2019-04-07 02:36:58.398801	2019-04-07 02:36:58.398801	{yellow,yellow,yellow,yellow,white}
112	2	228150	4	2019-04-07 02:37:00.759544	2019-04-07 02:37:00.759544	{yellow,yellow,yellow,yellow,white}
114	2	254	3	2019-04-07 02:37:16.187386	2019-04-07 02:37:16.187386	{yellow,yellow,yellow,white,white}
100	2	1262	4	2019-04-06 04:18:30.737457	2019-09-15 01:25:48.643286	{yellow,yellow,yellow,yellow,white}
116	2	8619	3	2019-04-07 02:37:40.823233	2019-04-07 02:37:40.823233	{yellow,yellow,yellow,white,white}
117	2	307081	3	2019-04-07 02:37:42.253647	2019-04-07 02:37:42.253647	{yellow,yellow,yellow,white,white}
119	2	49047	3	2019-04-07 02:37:49.049661	2019-04-07 02:37:49.049661	{yellow,yellow,yellow,white,white}
120	2	61791	3	2019-04-07 02:37:51.665054	2019-04-07 02:37:51.665054	{yellow,yellow,yellow,white,white}
121	2	9414	3	2019-04-07 02:38:19.517024	2019-04-07 02:38:19.517024	{yellow,yellow,yellow,white,white}
122	2	363676	3	2019-04-13 22:37:25.83958	2019-04-13 22:37:25.83958	{yellow,yellow,yellow,white,white}
123	2	500682	3	2019-04-13 22:37:38.824358	2019-04-13 22:37:38.824358	{yellow,yellow,yellow,white,white}
124	2	483906	3	2019-04-13 22:38:04.309516	2019-04-13 22:38:04.309516	{yellow,yellow,yellow,white,white}
126	2	10479	3	2019-05-06 16:36:41.390472	2019-05-06 16:36:41.390472	{yellow,yellow,yellow,white,white}
127	2	627	4	2019-05-06 16:36:56.615049	2019-05-06 16:36:57.871729	{yellow,yellow,yellow,yellow,white}
128	2	1116	3	2019-05-06 16:37:00.18737	2019-05-06 16:37:00.18737	{yellow,yellow,yellow,white,white}
129	2	8966	2	2019-05-06 16:37:06.645008	2019-05-06 16:37:06.645008	{yellow,yellow,white,white,white}
130	2	454227	5	2019-05-06 16:37:26.613229	2019-05-06 16:37:26.613229	{yellow,yellow,yellow,yellow,yellow}
131	2	24428	5	2019-05-06 16:40:26.291004	2019-05-06 16:40:26.291004	{yellow,yellow,yellow,yellow,yellow}
132	2	271110	5	2019-05-06 16:40:28.680119	2019-05-06 16:40:28.680119	{yellow,yellow,yellow,yellow,yellow}
134	2	1726	4	2019-05-06 16:40:42.898837	2019-05-06 16:40:42.898837	{yellow,yellow,yellow,yellow,white}
135	2	1771	4	2019-05-06 16:40:45.07163	2019-05-06 16:40:45.07163	{yellow,yellow,yellow,yellow,white}
136	2	99861	4	2019-05-06 16:40:51.716846	2019-05-06 16:40:51.716846	{yellow,yellow,yellow,yellow,white}
1195	2	395834	4	2021-12-18 07:33:03.534499	2022-04-22 15:34:12.981698	{yellow,yellow,yellow,yellow,white}
118	2	194662	3	2019-04-07 02:37:43.471918	2019-08-26 18:58:24.941655	{yellow,yellow,yellow,white,white}
139	2	284053	5	2019-05-06 16:41:55.825209	2019-05-06 16:41:55.825209	{yellow,yellow,yellow,yellow,yellow}
142	2	10195	4	2019-05-06 16:42:14.492896	2019-05-06 16:42:14.492896	{yellow,yellow,yellow,yellow,white}
113	2	49017	3	2019-04-07 02:37:10.594098	2019-08-26 18:58:34.71812	{yellow,yellow,yellow,white,white}
138	2	100402	4	2019-05-06 16:41:53.686419	2019-08-31 23:01:58.403395	{yellow,yellow,yellow,yellow,white}
143	2	283995	3	2019-05-06 16:42:20.464555	2019-05-06 16:42:24.21149	{yellow,yellow,yellow,white,white}
145	2	76338	3	2019-05-06 16:42:36.735815	2019-05-06 16:42:36.735815	{yellow,yellow,yellow,white,white}
1196	2	999110492	5	2022-02-27 03:07:12.396036	2022-02-27 03:07:12.396036	{yellow,yellow,yellow,yellow,yellow}
150	2	353081	3	2019-05-06 16:43:20.566937	2019-05-06 16:43:20.566937	{yellow,yellow,yellow,white,white}
151	2	297762	4	2019-05-06 16:43:46.571723	2019-05-06 16:43:46.571723	{yellow,yellow,yellow,yellow,white}
149	2	181808	3	2019-05-06 16:43:07.848695	2019-05-15 21:33:09.027456	{yellow,yellow,yellow,white,white}
147	2	383498	4	2019-05-06 16:42:46.569739	2019-05-15 21:33:56.727008	{yellow,yellow,yellow,yellow,white}
152	2	330459	3	2019-05-06 16:44:10.005362	2019-08-21 07:39:32.701011	{yellow,yellow,yellow,white,white}
1197	2	624860	4	2022-02-27 03:07:21.61839	2022-02-27 03:07:21.61839	{yellow,yellow,yellow,yellow,white}
1198	2	646380	3	2022-02-27 03:07:52.52191	2022-02-27 03:07:52.52191	{yellow,yellow,yellow,white,white}
1199	2	617653	4	2022-02-27 03:08:42.13877	2022-02-27 03:08:42.13877	{yellow,yellow,yellow,yellow,white}
1200	2	999131927	4	2022-02-27 06:25:51.516998	2022-02-27 06:25:51.516998	{yellow,yellow,yellow,yellow,white}
1201	2	370172	4	2022-03-05 19:01:49.014446	2022-03-05 19:01:49.014446	{yellow,yellow,yellow,yellow,white}
1202	2	999136738	4	2022-03-05 19:02:31.256982	2022-03-05 19:02:31.256982	{yellow,yellow,yellow,yellow,white}
1203	2	37710	2	2022-03-10 23:38:57.723913	2022-03-10 23:38:57.723913	{yellow,yellow,white,white,white}
1236	2	10029	4	2022-03-17 21:06:17.386933	2022-03-17 21:06:17.386933	{yellow,yellow,yellow,yellow,white}
1237	2	99986248	4	2022-03-17 21:09:17.206679	2022-03-17 21:09:17.206679	{yellow,yellow,yellow,yellow,white}
1238	2	634649	5	2022-03-23 21:42:35.908246	2022-03-23 21:42:35.908246	{yellow,yellow,yellow,yellow,yellow}
1240	2	379170	3	2022-03-23 21:48:48.805071	2022-03-23 21:48:48.805071	{yellow,yellow,yellow,white,white}
1241	2	4347	3	2022-03-23 21:49:09.0737	2022-03-23 21:49:09.0737	{yellow,yellow,yellow,white,white}
1242	2	38321	2	2022-03-24 17:11:51.963239	2022-03-24 17:11:51.963239	{yellow,yellow,white,white,white}
1243	2	369481	3	2022-03-24 17:12:47.318211	2022-03-24 17:12:47.318211	{yellow,yellow,yellow,white,white}
1244	2	52449	3	2022-03-24 17:12:56.398741	2022-03-24 17:12:56.398741	{yellow,yellow,yellow,white,white}
1245	2	14557	4	2022-03-24 17:13:06.664578	2022-03-24 17:13:06.664578	{yellow,yellow,yellow,yellow,white}
1246	2	16991	3	2022-03-24 17:13:51.664932	2022-03-24 17:13:51.664932	{yellow,yellow,yellow,white,white}
1247	2	836009	3	2022-04-03 02:25:02.940722	2022-04-03 02:25:02.940722	{yellow,yellow,yellow,white,white}
1248	2	999114925	3	2022-04-03 02:25:13.316435	2022-04-03 02:25:13.316435	{yellow,yellow,yellow,white,white}
1249	2	99994951	4	2022-04-03 02:25:25.963591	2022-04-03 02:25:25.963591	{yellow,yellow,yellow,yellow,white}
1250	2	99997546	4	2022-04-03 02:25:28.77008	2022-04-03 02:25:28.77008	{yellow,yellow,yellow,yellow,white}
1251	2	414906	4	2022-04-22 15:27:54.599134	2022-04-22 15:27:55.737463	{yellow,yellow,yellow,yellow,white}
1252	2	398175	5	2022-04-22 15:33:14.45124	2022-04-22 15:33:14.45124	{yellow,yellow,yellow,yellow,yellow}
146	2	335984	3	2019-05-06 16:42:42.159611	2019-05-06 16:42:42.159611	{yellow,yellow,yellow,white,white}
153	4	155	5	2019-05-10 03:11:09.184035	2019-05-10 03:11:09.184035	{yellow,yellow,yellow,yellow,yellow}
154	4	627	4	2019-05-10 03:11:13.6201	2019-05-10 03:11:13.6201	{yellow,yellow,yellow,yellow,white}
155	5	490132	4	2019-05-10 17:40:29.273793	2019-05-10 17:40:29.273793	{yellow,yellow,yellow,yellow,white}
182	2	127585	4	2019-05-15 21:32:55.285553	2019-08-31 23:04:43.964718	{yellow,yellow,yellow,yellow,white}
183	2	137113	4	2019-05-15 21:32:57.283068	2019-10-18 02:41:00.764232	{yellow,yellow,yellow,yellow,white}
148	2	381288	4	2019-05-06 16:42:49.314643	2019-10-19 01:28:49.374901	{yellow,yellow,yellow,yellow,white}
179	2	19995	2	2019-05-15 21:32:29.549408	2022-03-17 21:09:58.177726	{yellow,yellow,white,white,white}
24	2	101	5	2019-03-29 20:20:17.113063	2019-05-13 04:05:43.455002	{yellow,yellow,yellow,yellow,yellow}
156	2	78	3	2019-05-14 16:04:23.618291	2019-05-14 16:04:23.618291	{yellow,yellow,yellow,white,white}
157	2	574	3	2019-05-14 16:04:29.758621	2019-05-14 16:04:29.758621	{yellow,yellow,yellow,white,white}
158	2	10675	3	2019-05-14 16:04:59.155285	2019-05-14 16:04:59.155285	{yellow,yellow,yellow,white,white}
159	2	487558	3	2019-05-14 16:05:55.526604	2019-05-14 16:05:55.526604	{yellow,yellow,yellow,white,white}
160	2	2320	3	2019-05-14 16:06:05.755507	2019-05-14 16:06:05.755507	{yellow,yellow,yellow,white,white}
161	2	8984	4	2019-05-14 16:06:16.731216	2019-05-14 16:06:16.731216	{yellow,yellow,yellow,yellow,white}
162	2	16608	4	2019-05-14 16:06:35.988021	2019-05-14 16:06:35.988021	{yellow,yellow,yellow,yellow,white}
163	2	12123	3	2019-05-14 16:06:39.30242	2019-05-14 16:06:39.30242	{yellow,yellow,yellow,white,white}
164	2	49026	4	2019-05-14 16:06:50.797176	2019-05-14 16:06:50.797176	{yellow,yellow,yellow,yellow,white}
166	2	38363	2	2019-05-14 16:07:06.345209	2019-05-14 16:07:06.345209	{yellow,yellow,white,white,white}
167	2	106646	4	2019-05-14 16:07:13.411963	2019-05-14 16:07:13.411963	{yellow,yellow,yellow,yellow,white}
168	2	11967	5	2019-05-14 16:07:28.408772	2019-05-14 16:07:28.408772	{yellow,yellow,yellow,yellow,yellow}
169	2	18239	2	2019-05-14 16:07:51.588526	2019-05-14 16:07:51.588526	{yellow,yellow,white,white,white}
170	2	4415	5	2019-05-15 07:36:34.517502	2019-05-15 07:36:34.517502	{yellow,yellow,yellow,yellow,yellow}
171	2	4942	3	2019-05-15 07:37:33.467635	2019-05-15 07:37:33.467635	{yellow,yellow,yellow,white,white}
78	2	470	2	2019-04-06 04:16:31.361476	2019-05-15 21:11:20.448615	{yellow,yellow,white,white,white}
172	2	10052	3	2019-05-15 21:30:27.011827	2019-05-15 21:30:27.011827	{yellow,yellow,yellow,white,white}
173	2	11128	2	2019-05-15 21:30:29.959998	2019-05-15 21:30:29.959998	{yellow,yellow,white,white,white}
174	2	119450	3	2019-05-15 21:30:41.392377	2019-05-15 21:30:41.392377	{yellow,yellow,yellow,white,white}
105	2	210577	3	2019-04-07 02:36:01.545401	2019-05-15 21:30:53.8465	{yellow,yellow,yellow,white,white}
175	2	429351	3	2019-05-15 21:31:07.340049	2019-05-15 21:31:07.340049	{yellow,yellow,yellow,white,white}
176	2	315837	3	2019-05-15 21:31:49.685872	2019-05-15 21:31:49.685872	{yellow,yellow,yellow,white,white}
177	2	22	5	2019-05-15 21:32:12.159339	2019-05-15 21:32:12.159339	{yellow,yellow,yellow,yellow,yellow}
178	2	607	3	2019-05-15 21:32:20.375784	2019-05-15 21:32:20.375784	{yellow,yellow,yellow,white,white}
180	2	10138	3	2019-05-15 21:32:33.410163	2019-05-15 21:32:33.410163	{yellow,yellow,yellow,white,white}
181	2	68721	3	2019-05-15 21:32:37.947277	2019-05-15 21:32:37.947277	{yellow,yellow,yellow,white,white}
144	2	102899	3	2019-05-06 16:42:30.78913	2019-05-15 21:32:46.677931	{yellow,yellow,yellow,white,white}
184	2	140607	3	2019-05-15 21:33:02.338291	2019-05-15 21:33:02.338291	{yellow,yellow,yellow,white,white}
185	2	198663	3	2019-05-15 21:33:11.442385	2019-05-15 21:33:11.442385	{yellow,yellow,yellow,white,white}
186	2	141052	4	2019-05-15 21:33:13.431981	2019-05-15 21:33:13.431981	{yellow,yellow,yellow,yellow,white}
187	2	209112	4	2019-05-15 21:33:18.646107	2019-05-15 21:33:18.646107	{yellow,yellow,yellow,yellow,white}
188	2	284052	3	2019-05-15 21:33:28.10882	2019-05-15 21:33:28.10882	{yellow,yellow,yellow,white,white}
165	2	2019	1	2019-05-14 16:07:00.993979	2019-10-25 13:17:01.271169	{yellow,white,white,white,white}
1253	2	641	5	2022-04-23 02:54:41.160151	2022-04-23 02:54:41.160151	{yellow,yellow,yellow,yellow,yellow}
1254	2	10871	3	2022-04-23 02:55:21.149689	2022-04-23 02:55:27.667683	{yellow,yellow,yellow,white,white}
189	2	293660	5	2019-05-15 21:33:31.904243	2019-05-15 21:33:31.904243	{yellow,yellow,yellow,yellow,yellow}
190	2	348350	3	2019-05-15 21:33:42.774712	2019-05-15 21:33:42.774712	{yellow,yellow,yellow,white,white}
191	2	351286	3	2019-05-15 21:33:49.476847	2019-05-15 21:33:49.476847	{yellow,yellow,yellow,white,white}
192	2	218	4	2019-05-15 21:34:14.420093	2019-05-15 21:34:14.420093	{yellow,yellow,yellow,yellow,white}
193	2	608	3	2019-05-15 21:34:17.751184	2019-05-15 21:34:17.751184	{yellow,yellow,yellow,white,white}
219	2	2105	4	2019-05-15 21:38:23.71975	2019-10-04 20:45:14.037094	{yellow,yellow,yellow,yellow,white}
196	2	156022	3	2019-05-15 21:34:33.848018	2019-05-15 21:34:33.848018	{yellow,yellow,yellow,white,white}
197	2	135397	3	2019-05-15 21:34:36.513059	2019-05-15 21:34:36.513059	{yellow,yellow,yellow,white,white}
198	2	177572	3	2019-05-15 21:34:49.047397	2019-05-15 21:34:49.047397	{yellow,yellow,yellow,white,white}
199	2	246655	4	2019-05-15 21:34:53.561949	2019-05-15 21:34:53.561949	{yellow,yellow,yellow,yellow,white}
200	2	58	3	2019-05-15 21:35:04.514505	2019-05-15 21:35:04.514505	{yellow,yellow,yellow,white,white}
202	2	76341	3	2019-05-15 21:35:29.567064	2019-05-15 21:35:29.567064	{yellow,yellow,yellow,white,white}
203	2	854	3	2019-05-15 21:36:00.893333	2019-05-15 21:36:00.893333	{yellow,yellow,yellow,white,white}
204	2	862	3	2019-05-15 21:36:04.461946	2019-05-15 21:36:04.461946	{yellow,yellow,yellow,white,white}
206	2	585	3	2019-05-15 21:37:22.189509	2019-05-15 21:37:22.189509	{yellow,yellow,yellow,white,white}
208	2	2614	3	2019-05-15 21:37:31.051927	2019-05-15 21:37:31.051927	{yellow,yellow,yellow,white,white}
209	2	10328	3	2019-05-15 21:37:33.997844	2019-05-15 21:37:33.997844	{yellow,yellow,yellow,white,white}
210	2	11418	4	2019-05-15 21:37:36.461973	2019-05-15 21:37:36.461973	{yellow,yellow,yellow,yellow,white}
211	2	207703	3	2019-05-15 21:37:43.831349	2019-05-15 21:37:43.831349	{yellow,yellow,yellow,white,white}
212	2	310	3	2019-05-15 21:37:50.184565	2019-05-15 21:37:50.184565	{yellow,yellow,yellow,white,white}
213	2	808	3	2019-05-15 21:37:56.620112	2019-05-15 21:37:56.620112	{yellow,yellow,yellow,white,white}
214	2	762	4	2019-05-15 21:37:59.839855	2019-05-15 21:37:59.839855	{yellow,yellow,yellow,yellow,white}
216	2	20352	4	2019-05-15 21:38:10.080774	2019-05-15 21:38:10.080774	{yellow,yellow,yellow,yellow,white}
1255	2	37958	5	2022-04-23 03:21:23.872208	2022-04-23 03:21:23.872208	{yellow,yellow,yellow,yellow,yellow}
218	2	8764	3	2019-05-15 21:38:22.057792	2019-05-15 21:38:22.057792	{yellow,yellow,yellow,white,white}
220	2	9611	3	2019-05-15 21:38:26.955974	2019-05-15 21:38:26.955974	{yellow,yellow,yellow,white,white}
221	2	9644	3	2019-05-15 21:38:35.294436	2019-05-15 21:38:35.294436	{yellow,yellow,yellow,white,white}
222	2	118340	3	2019-05-15 21:39:46.225575	2019-05-15 21:39:46.225575	{yellow,yellow,yellow,white,white}
223	2	1891	5	2019-05-15 21:41:07.402383	2019-05-15 21:41:07.402383	{yellow,yellow,yellow,yellow,yellow}
224	2	105	5	2019-05-15 21:41:48.837213	2019-05-15 21:41:48.837213	{yellow,yellow,yellow,yellow,yellow}
225	2	426	3	2019-05-15 21:41:53.703697	2019-05-15 21:41:53.703697	{yellow,yellow,yellow,white,white}
226	2	6463	4	2019-05-16 01:02:28.995189	2019-05-16 01:02:31.236493	{yellow,yellow,yellow,yellow,white}
215	2	9942	4	2019-05-15 21:38:07.783407	2019-08-26 12:53:15.326894	{yellow,yellow,yellow,yellow,white}
227	2	4836	3	2019-05-16 18:00:10.334244	2019-05-16 18:00:13.625367	{yellow,yellow,yellow,white,white}
228	2	10648	3	2019-05-16 18:01:13.65488	2019-05-16 18:01:13.65488	{yellow,yellow,yellow,white,white}
229	2	4133	4	2019-05-18 00:14:30.960649	2019-05-18 00:14:30.960649	{yellow,yellow,yellow,yellow,white}
230	2	11866	3	2019-05-18 00:17:45.153962	2019-05-18 00:17:45.153962	{yellow,yellow,yellow,white,white}
231	2	2322	4	2019-05-18 00:19:16.459108	2019-05-18 00:19:16.459108	{yellow,yellow,yellow,yellow,white}
233	2	11983	3	2019-05-18 00:20:16.848219	2019-05-18 00:20:16.848219	{yellow,yellow,yellow,white,white}
207	2	4011	4	2019-05-15 21:37:27.845265	2019-09-12 16:39:58.268295	{yellow,yellow,yellow,yellow,white}
195	2	49521	4	2019-05-15 21:34:22.781391	2019-10-03 07:23:51.890372	{yellow,yellow,yellow,yellow,white}
201	2	1930	3	2019-05-15 21:35:22.138777	2019-09-16 02:36:35.696816	{yellow,yellow,yellow,white,white}
194	2	559	3	2019-05-15 21:34:20.030411	2019-09-16 07:08:48.641821	{yellow,yellow,yellow,white,white}
232	2	13291	3	2019-05-18 00:20:11.246678	2019-10-18 14:46:59.329024	{yellow,yellow,yellow,white,white}
205	2	82693	4	2019-05-15 21:36:27.257359	2019-10-19 02:19:18.420868	{yellow,yellow,yellow,yellow,white}
238	2	9587	4	2019-05-18 00:20:58.103334	2019-05-18 00:21:02.480695	{yellow,yellow,yellow,yellow,white}
239	2	9909	2	2019-05-18 00:21:22.967265	2019-05-18 00:21:22.967265	{yellow,yellow,white,white,white}
241	2	9566	3	2019-05-18 00:21:36.641548	2019-05-18 00:21:36.641548	{yellow,yellow,yellow,white,white}
243	2	9093	5	2019-05-18 00:21:43.942603	2019-05-18 00:21:43.942603	{yellow,yellow,yellow,yellow,yellow}
245	2	51209	3	2019-05-18 00:22:00.599642	2019-05-18 00:22:00.599642	{yellow,yellow,yellow,white,white}
248	2	10876	3	2019-05-18 00:23:17.796212	2019-05-18 00:23:17.796212	{yellow,yellow,yellow,white,white}
236	2	9594	4	2019-05-18 00:20:29.276176	2019-08-26 12:53:05.962242	{yellow,yellow,yellow,yellow,white}
234	2	12690	3	2019-05-18 00:20:18.430801	2020-03-21 22:05:36.130198	{yellow,yellow,yellow,white,white}
1256	2	752	5	2022-04-23 06:15:37.450667	2022-04-23 06:15:37.450667	{yellow,yellow,yellow,yellow,yellow}
1257	2	44835	3	2022-04-23 06:15:58.412925	2022-04-23 06:15:58.412925	{yellow,yellow,yellow,white,white}
235	2	11386	3	2019-05-18 00:20:25.345752	2019-05-18 00:20:25.345752	{yellow,yellow,yellow,white,white}
237	2	4477	3	2019-05-18 00:20:36.20466	2019-05-18 00:20:36.20466	{yellow,yellow,yellow,white,white}
240	2	14292	3	2019-05-18 00:21:29.424197	2019-05-18 00:21:29.424197	{yellow,yellow,yellow,white,white}
242	2	10632	2	2019-05-18 00:21:39.642656	2019-05-18 00:21:39.642656	{yellow,yellow,white,white,white}
244	2	625	3	2019-05-18 00:21:46.668041	2019-05-18 00:21:46.668041	{yellow,yellow,yellow,white,white}
246	2	92591	3	2019-05-18 00:22:13.849491	2019-05-18 00:22:13.849491	{yellow,yellow,yellow,white,white}
247	2	9333	4	2019-05-18 00:23:02.812503	2019-05-18 00:23:02.812503	{yellow,yellow,yellow,yellow,white}
249	2	388	4	2019-05-19 08:41:09.930554	2019-05-19 08:41:09.930554	{yellow,yellow,yellow,yellow,white}
133	2	363088	3	2019-05-06 16:40:39.423863	2019-05-19 11:52:16.371284	{yellow,yellow,yellow,white,white}
137	2	284054	3	2019-05-06 16:41:00.302339	2019-05-19 11:52:18.881983	{yellow,yellow,yellow,white,white}
141	2	335983	3	2019-05-06 16:42:07.469786	2019-05-19 11:52:37.734579	{yellow,yellow,yellow,white,white}
140	2	1724	3	2019-05-06 16:42:04.865838	2019-05-19 11:52:44.898173	{yellow,yellow,yellow,white,white}
250	2	260513	3	2019-05-19 11:53:41.223019	2019-05-19 11:53:41.223019	{yellow,yellow,yellow,white,white}
1258	2	577922	4	2022-04-23 20:47:13.490498	2022-04-23 20:47:13.490498	{yellow,yellow,yellow,yellow,white}
253	2	96721	3	2019-05-25 03:00:39.323289	2019-05-25 03:00:39.323289	{yellow,yellow,yellow,white,white}
254	2	274870	4	2019-05-25 03:01:01.062281	2019-05-25 03:01:01.062281	{yellow,yellow,yellow,yellow,white}
69	2	281957	5	2019-04-06 04:15:11.95018	2019-05-25 03:02:15.685599	{yellow,yellow,yellow,yellow,yellow}
255	2	273248	3	2019-05-25 03:02:21.712548	2019-05-25 03:02:21.712548	{yellow,yellow,yellow,white,white}
256	2	1927	3	2019-05-25 03:02:34.291231	2019-05-25 03:02:34.291231	{yellow,yellow,yellow,white,white}
257	2	281338	3	2019-05-25 03:02:49.84577	2019-05-25 03:02:49.84577	{yellow,yellow,yellow,white,white}
258	2	399360	3	2019-05-25 03:02:55.831417	2019-05-25 03:02:55.831417	{yellow,yellow,yellow,white,white}
260	2	11036	3	2019-05-25 03:03:39.779004	2019-05-25 03:03:39.779004	{yellow,yellow,yellow,white,white}
261	2	1538	4	2019-05-25 05:25:51.345126	2019-05-25 05:25:51.345126	{yellow,yellow,yellow,yellow,white}
262	2	2501	5	2019-05-25 05:25:54.757637	2019-05-25 05:25:54.757637	{yellow,yellow,yellow,yellow,yellow}
263	2	2502	5	2019-05-25 05:25:57.04654	2019-05-25 05:25:57.04654	{yellow,yellow,yellow,yellow,yellow}
264	2	205587	3	2019-05-25 05:26:06.117339	2019-05-25 05:26:06.117339	{yellow,yellow,yellow,white,white}
265	2	264660	4	2019-05-25 05:26:28.910215	2019-05-25 05:26:28.910215	{yellow,yellow,yellow,yellow,white}
266	2	14	3	2019-05-25 05:26:41.962731	2019-05-25 05:26:41.962731	{yellow,yellow,yellow,white,white}
267	2	37799	4	2019-05-25 05:26:44.165945	2019-05-25 05:26:44.165945	{yellow,yellow,yellow,yellow,white}
268	2	76203	3	2019-05-25 05:26:49.023784	2019-05-25 05:26:49.023784	{yellow,yellow,yellow,white,white}
269	2	300671	4	2019-05-25 05:26:54.292653	2019-05-25 05:26:57.534267	{yellow,yellow,yellow,yellow,white}
270	2	10200	3	2019-05-25 05:27:05.000961	2019-05-25 05:27:05.000961	{yellow,yellow,yellow,white,white}
16	2	637	1	2019-03-29 20:19:15.700419	2019-05-25 05:27:14.333149	{yellow,white,white,white,white}
271	2	193756	4	2019-05-25 05:27:22.350191	2019-05-25 05:27:28.25777	{yellow,yellow,yellow,yellow,white}
272	2	4553	3	2019-05-25 05:27:31.143575	2019-05-25 05:27:31.143575	{yellow,yellow,yellow,white,white}
273	2	616	5	2019-05-25 05:27:41.617497	2019-05-25 05:27:41.617497	{yellow,yellow,yellow,yellow,yellow}
274	2	146	3	2019-05-25 05:27:47.705343	2019-05-25 05:27:47.705343	{yellow,yellow,yellow,white,white}
275	2	141	3	2019-05-25 05:27:50.789471	2019-05-25 05:27:50.789471	{yellow,yellow,yellow,white,white}
276	2	664	3	2019-05-25 05:28:03.290972	2019-05-25 05:28:03.290972	{yellow,yellow,yellow,white,white}
277	2	594	3	2019-05-25 05:28:06.662532	2019-05-25 05:28:06.662532	{yellow,yellow,yellow,white,white}
278	2	186	5	2019-05-25 05:28:08.717423	2019-05-25 05:28:08.717423	{yellow,yellow,yellow,yellow,yellow}
279	2	7840	3	2019-05-25 05:28:18.096225	2019-05-25 05:28:18.096225	{yellow,yellow,yellow,white,white}
280	2	1640	4	2019-05-25 05:28:22.259814	2019-05-25 05:28:22.259814	{yellow,yellow,yellow,yellow,white}
281	2	72190	3	2019-05-25 05:28:26.246941	2019-05-25 05:28:26.246941	{yellow,yellow,yellow,white,white}
282	2	1844	3	2019-05-25 05:28:44.904025	2019-05-25 05:28:44.904025	{yellow,yellow,yellow,white,white}
252	2	1402	3	2019-05-25 03:00:30.882641	2020-01-06 20:14:31.197555	{yellow,yellow,yellow,white,white}
283	2	300673	3	2019-05-25 05:28:50.25874	2019-05-25 05:28:50.25874	{yellow,yellow,yellow,white,white}
285	2	450465	4	2019-05-26 02:16:08.637599	2019-05-26 02:16:08.637599	{yellow,yellow,yellow,yellow,white}
286	2	13537	3	2019-05-26 02:16:14.758847	2019-05-26 02:16:14.758847	{yellow,yellow,yellow,white,white}
287	2	10337	5	2019-05-27 00:54:05.596309	2019-05-27 00:54:05.596309	{yellow,yellow,yellow,yellow,yellow}
288	2	561	3	2019-05-27 01:24:18.464528	2019-05-27 01:24:18.464528	{yellow,yellow,yellow,white,white}
115	2	329865	3	2019-04-07 02:37:22.643448	2019-05-27 01:24:34.965245	{yellow,yellow,yellow,white,white}
87	2	1366	5	2019-04-06 04:17:47.043757	2019-05-27 01:24:48.213128	{yellow,yellow,yellow,yellow,yellow}
289	2	840	1	2019-05-27 01:25:28.908822	2019-05-27 01:25:28.908822	{yellow,white,white,white,white}
290	2	2924	5	2019-05-27 01:25:36.55185	2019-05-27 01:25:36.55185	{yellow,yellow,yellow,yellow,yellow}
291	2	1885	5	2019-05-27 01:25:38.71588	2019-05-27 01:25:38.71588	{yellow,yellow,yellow,yellow,yellow}
292	2	1018	2	2019-05-27 01:25:51.754775	2019-05-27 01:25:51.754775	{yellow,yellow,white,white,white}
293	2	508	3	2019-05-27 01:26:00.003854	2019-05-27 01:26:00.003854	{yellow,yellow,yellow,white,white}
294	2	4982	3	2019-05-27 01:26:17.837074	2019-05-27 01:26:17.837074	{yellow,yellow,yellow,white,white}
295	2	446354	3	2019-05-27 01:26:26.754862	2019-05-27 01:26:26.754862	{yellow,yellow,yellow,white,white}
296	2	369885	3	2019-05-27 01:26:31.500183	2019-05-27 01:26:31.500183	{yellow,yellow,yellow,white,white}
297	2	1813	3	2019-05-27 01:26:36.832885	2019-05-27 01:26:36.832885	{yellow,yellow,yellow,white,white}
298	2	2668	3	2019-05-27 01:26:38.51377	2019-05-27 01:26:38.51377	{yellow,yellow,yellow,white,white}
299	2	68734	3	2019-05-27 01:26:46.717931	2019-05-27 01:26:46.717931	{yellow,yellow,yellow,white,white}
301	2	819	4	2019-05-27 01:27:08.465275	2019-05-27 01:27:08.465275	{yellow,yellow,yellow,yellow,white}
302	2	11322	3	2019-05-27 01:27:10.581462	2019-05-27 01:27:10.581462	{yellow,yellow,yellow,white,white}
303	2	168672	3	2019-05-27 01:27:17.239263	2019-05-27 01:27:17.239263	{yellow,yellow,yellow,white,white}
304	2	68724	3	2019-05-27 01:27:18.609514	2019-05-27 01:27:18.609514	{yellow,yellow,yellow,white,white}
305	2	20662	3	2019-05-27 01:27:20.125698	2019-05-27 01:27:20.125698	{yellow,yellow,yellow,white,white}
306	2	275	4	2019-05-27 01:27:30.794998	2019-05-27 01:27:30.794998	{yellow,yellow,yellow,yellow,white}
307	2	2675	3	2019-05-27 01:27:39.418269	2019-05-27 01:27:39.418269	{yellow,yellow,yellow,white,white}
308	2	1579	3	2019-05-27 01:27:40.776494	2019-05-27 01:27:40.776494	{yellow,yellow,yellow,white,white}
309	2	65754	3	2019-05-27 01:27:47.701245	2019-05-27 01:27:47.701245	{yellow,yellow,yellow,white,white}
310	2	110415	3	2019-05-27 01:27:53.235492	2019-05-27 01:27:53.235492	{yellow,yellow,yellow,white,white}
312	2	1372	5	2019-05-27 01:28:09.665319	2019-05-27 01:28:09.665319	{yellow,yellow,yellow,yellow,yellow}
313	2	524	3	2019-05-27 01:28:11.515169	2019-05-27 01:28:11.515169	{yellow,yellow,yellow,white,white}
314	2	9693	3	2019-05-27 01:28:16.620571	2019-05-27 01:28:16.620571	{yellow,yellow,yellow,white,white}
315	2	2567	5	2019-05-27 01:28:18.321871	2019-05-27 01:28:18.321871	{yellow,yellow,yellow,yellow,yellow}
316	2	97630	3	2019-05-27 01:28:26.073362	2019-05-27 01:28:26.073362	{yellow,yellow,yellow,white,white}
317	2	2649	3	2019-05-27 01:28:34.115888	2019-05-27 01:28:34.115888	{yellow,yellow,yellow,white,white}
318	2	9437	3	2019-05-27 01:28:39.413745	2019-05-27 01:28:39.413745	{yellow,yellow,yellow,white,white}
45	2	289	3	2019-03-29 20:22:16.079329	2019-05-27 01:28:44.596838	{yellow,yellow,yellow,white,white}
319	2	581	5	2019-05-27 01:28:47.394359	2019-05-27 01:28:47.394359	{yellow,yellow,yellow,yellow,yellow}
321	2	274857	3	2019-05-27 02:39:56.138046	2019-05-27 02:39:56.138046	{yellow,yellow,yellow,white,white}
1259	2	99992749	4	2022-05-09 22:11:57.962478	2022-05-09 22:11:57.962478	{yellow,yellow,yellow,yellow,white}
323	2	9411	5	2019-06-01 01:26:57.761238	2019-06-01 01:26:57.761238	{yellow,yellow,yellow,yellow,yellow}
324	2	75174	5	2019-06-02 01:13:48.290758	2019-06-02 01:13:48.290758	{yellow,yellow,yellow,yellow,yellow}
325	2	411728	3	2019-06-07 08:35:49.742669	2019-06-07 08:35:49.742669	{yellow,yellow,yellow,white,white}
326	2	921	5	2019-06-11 04:09:49.827279	2019-06-11 04:09:49.827279	{yellow,yellow,yellow,yellow,yellow}
327	2	164457	4	2019-06-14 13:44:20.19671	2019-06-14 13:44:20.19671	{yellow,yellow,yellow,yellow,white}
328	2	10212	5	2019-06-14 13:44:23.703902	2019-06-14 13:44:23.703902	{yellow,yellow,yellow,yellow,yellow}
284	2	1523	3	2019-05-26 02:15:20.960644	2019-08-03 22:47:55.864642	{yellow,yellow,yellow,white,white}
320	2	241	3	2019-05-27 01:28:52.849279	2020-05-22 23:49:49.604244	{yellow,yellow,yellow,white,white}
311	2	1495	4	2019-05-27 01:28:07.253256	2020-07-26 23:59:03.611337	{yellow,yellow,yellow,yellow,white}
329	2	2026	3	2019-06-14 20:18:04.313256	2019-06-14 20:18:04.313256	{yellow,yellow,yellow,white,white}
330	2	8587	3	2019-06-14 20:18:04.574567	2019-06-14 20:18:04.574567	{yellow,yellow,yellow,white,white}
331	2	64686	3	2019-06-14 20:18:07.086929	2019-06-14 20:18:07.086929	{yellow,yellow,yellow,white,white}
332	2	11778	3	2019-06-14 20:19:49.227047	2019-06-14 20:19:49.227047	{yellow,yellow,yellow,white,white}
333	2	1491	3	2019-06-15 04:46:03.765466	2019-06-15 04:46:03.765466	{yellow,yellow,yellow,white,white}
1260	2	524369	3	2022-05-14 04:27:48.360868	2022-05-14 04:27:48.360868	{yellow,yellow,yellow,white,white}
336	2	22881	3	2019-06-22 01:22:01.951049	2019-06-22 01:22:01.951049	{yellow,yellow,yellow,white,white}
337	2	15	4	2019-06-22 01:38:46.570088	2019-06-22 01:38:46.570088	{yellow,yellow,yellow,yellow,white}
339	2	333339	3	2019-06-28 02:08:28.994365	2019-06-28 02:08:28.994365	{yellow,yellow,yellow,white,white}
340	2	109445	3	2019-06-28 02:08:34.711073	2019-06-28 02:08:34.711073	{yellow,yellow,yellow,white,white}
341	2	500664	4	2019-06-28 02:08:49.319267	2019-06-28 02:08:49.319267	{yellow,yellow,yellow,yellow,white}
342	2	36657	5	2019-06-28 02:08:59.118524	2019-06-28 02:08:59.118524	{yellow,yellow,yellow,yellow,yellow}
343	2	557	4	2019-06-28 02:09:24.748528	2019-06-28 02:09:24.748528	{yellow,yellow,yellow,yellow,white}
344	2	41154	3	2019-06-28 02:09:39.299035	2019-06-28 02:09:39.299035	{yellow,yellow,yellow,white,white}
345	2	280	5	2019-06-28 02:09:46.163626	2019-06-28 02:09:46.163626	{yellow,yellow,yellow,yellow,yellow}
346	2	364	3	2019-06-28 02:09:49.877594	2019-06-28 02:09:49.877594	{yellow,yellow,yellow,white,white}
347	2	126889	3	2019-06-28 02:09:53.105755	2019-06-28 02:09:53.105755	{yellow,yellow,yellow,white,white}
348	2	329	4	2019-06-28 02:09:58.000863	2019-06-28 02:09:58.000863	{yellow,yellow,yellow,yellow,white}
349	2	282035	3	2019-06-28 02:10:20.469164	2019-06-28 02:10:20.469164	{yellow,yellow,yellow,white,white}
350	2	353486	3	2019-06-28 02:10:48.85106	2019-06-28 02:10:48.85106	{yellow,yellow,yellow,white,white}
351	2	1893	2	2019-06-28 02:10:59.173477	2019-06-28 02:10:59.173477	{yellow,yellow,white,white,white}
352	2	345887	3	2019-06-28 02:11:03.746878	2019-06-28 02:11:03.746878	{yellow,yellow,yellow,white,white}
353	2	9806	3	2019-06-28 02:11:15.417339	2019-06-28 02:11:15.417339	{yellow,yellow,yellow,white,white}
354	2	36658	5	2019-06-28 02:11:24.232341	2019-06-28 02:11:24.232341	{yellow,yellow,yellow,yellow,yellow}
356	2	70981	2	2019-06-28 02:11:38.468154	2019-06-28 02:11:38.468154	{yellow,yellow,white,white,white}
358	2	9799	3	2019-06-28 02:11:52.786847	2019-06-28 02:11:52.786847	{yellow,yellow,yellow,white,white}
360	2	419430	4	2019-06-28 02:12:07.136219	2019-06-28 02:12:07.136219	{yellow,yellow,yellow,yellow,white}
361	2	85	5	2019-06-28 02:12:20.565738	2019-06-28 02:12:20.565738	{yellow,yellow,yellow,yellow,yellow}
362	2	269149	3	2019-06-28 02:12:27.040816	2019-06-28 02:12:27.040816	{yellow,yellow,yellow,white,white}
363	2	49538	5	2019-06-28 02:12:31.223687	2019-06-28 02:12:31.223687	{yellow,yellow,yellow,yellow,yellow}
364	2	14160	3	2019-06-28 02:12:33.177574	2019-06-28 02:12:33.177574	{yellow,yellow,yellow,white,white}
365	2	76170	4	2019-06-28 02:12:46.076317	2019-06-28 02:12:46.076317	{yellow,yellow,yellow,yellow,white}
366	2	2080	5	2019-06-28 02:12:50.703331	2019-06-28 02:12:50.703331	{yellow,yellow,yellow,yellow,yellow}
368	2	604	5	2019-06-28 02:12:55.973512	2019-06-28 02:12:55.973512	{yellow,yellow,yellow,yellow,yellow}
369	2	427641	3	2019-06-28 02:13:00.535805	2019-06-28 02:13:00.535805	{yellow,yellow,yellow,white,white}
370	2	414	1	2019-06-28 02:13:03.905234	2019-06-28 02:13:03.905234	{yellow,white,white,white,white}
371	2	564	3	2019-06-28 02:13:07.974765	2019-06-28 02:13:07.974765	{yellow,yellow,yellow,white,white}
372	2	558	3	2019-06-28 02:13:17.194551	2019-06-28 02:13:17.194551	{yellow,yellow,yellow,white,white}
373	2	36557	5	2019-06-28 02:13:30.929511	2019-06-28 02:13:30.929511	{yellow,yellow,yellow,yellow,yellow}
338	2	299537	4	2019-06-28 02:06:02.265805	2019-06-28 02:14:08.375099	{yellow,yellow,yellow,yellow,white}
374	2	652	4	2019-06-28 17:01:52.251144	2019-06-28 17:01:52.251144	{yellow,yellow,yellow,yellow,white}
375	2	2323	5	2019-06-28 20:35:33.104869	2019-06-28 20:35:33.104869	{yellow,yellow,yellow,yellow,yellow}
376	2	403	3	2019-06-28 20:36:45.155708	2019-06-28 20:36:45.155708	{yellow,yellow,yellow,white,white}
377	2	1830	5	2019-06-28 20:38:52.109464	2019-06-28 20:38:52.109464	{yellow,yellow,yellow,yellow,yellow}
367	2	13183	3	2019-06-28 02:12:52.235917	2019-10-03 07:25:37.468817	{yellow,yellow,yellow,white,white}
355	2	954	4	2019-06-28 02:11:34.306651	2019-10-18 02:39:56.211484	{yellow,yellow,yellow,yellow,white}
335	2	25196	3	2019-06-22 01:21:36.132979	2019-10-18 05:39:42.704551	{yellow,yellow,yellow,white,white}
359	2	70160	3	2019-06-28 02:11:57.474219	2019-12-04 03:39:34.105875	{yellow,yellow,yellow,white,white}
357	2	679	3	2019-06-28 02:11:43.666555	2020-07-23 00:19:35.295147	{yellow,yellow,yellow,white,white}
378	2	137	5	2019-06-28 20:39:01.637698	2019-06-28 20:39:01.637698	{yellow,yellow,yellow,yellow,yellow}
381	2	1587	3	2019-06-28 20:39:33.591859	2019-06-28 20:39:33.591859	{yellow,yellow,yellow,white,white}
383	2	7007	3	2019-06-28 20:39:57.822501	2019-06-28 20:39:57.822501	{yellow,yellow,yellow,white,white}
385	2	153	2	2019-06-28 20:40:11.791095	2019-06-28 20:40:11.791095	{yellow,yellow,white,white,white}
387	2	1620	3	2019-06-28 20:40:18.13245	2019-06-28 20:40:18.13245	{yellow,yellow,yellow,white,white}
390	2	10474	4	2019-06-28 20:40:50.752644	2019-06-28 20:40:50.752644	{yellow,yellow,yellow,yellow,white}
392	2	192	3	2019-06-28 20:41:06.224402	2019-06-28 20:41:06.224402	{yellow,yellow,yellow,white,white}
394	2	44264	3	2019-06-28 20:41:42.274908	2019-06-28 20:41:42.274908	{yellow,yellow,yellow,white,white}
396	2	1359	3	2019-06-28 20:42:00.477879	2019-06-28 20:42:00.477879	{yellow,yellow,yellow,white,white}
398	2	9944	3	2019-06-28 20:42:21.286651	2019-06-28 20:42:21.286651	{yellow,yellow,yellow,white,white}
400	2	184	3	2019-06-28 20:42:40.334505	2019-06-28 20:42:40.334505	{yellow,yellow,yellow,white,white}
1261	2	653349	3	2022-05-15 00:44:09.631966	2022-05-15 00:44:09.631966	{yellow,yellow,yellow,white,white}
379	2	8741	1	2019-06-28 20:39:12.329494	2019-06-28 20:39:15.328302	{yellow,white,white,white,white}
380	2	792	3	2019-06-28 20:39:23.999824	2019-06-28 20:39:23.999824	{yellow,yellow,yellow,white,white}
382	2	1578	3	2019-06-28 20:39:39.782561	2019-06-28 20:39:39.782561	{yellow,yellow,yellow,white,white}
384	2	39254	3	2019-06-28 20:40:05.669028	2019-06-28 20:40:05.669028	{yellow,yellow,yellow,white,white}
386	2	853	5	2019-06-28 20:40:15.035086	2019-06-28 20:40:15.035086	{yellow,yellow,yellow,yellow,yellow}
388	2	2108	4	2019-06-28 20:40:20.375085	2019-06-28 20:40:20.375085	{yellow,yellow,yellow,yellow,white}
389	2	3131	5	2019-06-28 20:40:42.413851	2019-06-28 20:40:42.413851	{yellow,yellow,yellow,yellow,yellow}
391	2	11321	5	2019-06-28 20:40:52.009743	2019-06-28 20:40:52.009743	{yellow,yellow,yellow,yellow,yellow}
393	2	380	4	2019-06-28 20:41:09.1423	2019-06-28 20:41:09.1423	{yellow,yellow,yellow,yellow,white}
395	2	10637	3	2019-06-28 20:41:56.102613	2019-06-28 20:41:56.102613	{yellow,yellow,yellow,white,white}
397	2	744	5	2019-06-28 20:42:14.122975	2019-06-28 20:42:14.122975	{yellow,yellow,yellow,yellow,yellow}
399	2	34584	4	2019-06-28 20:42:35.126987	2019-06-28 20:42:35.126987	{yellow,yellow,yellow,yellow,white}
401	2	136795	3	2019-07-04 02:36:00.047996	2019-07-04 02:36:00.047996	{yellow,yellow,yellow,white,white}
402	2	9604	3	2019-07-04 02:36:07.512711	2019-07-04 02:36:07.512711	{yellow,yellow,yellow,white,white}
403	2	9631	4	2019-07-13 03:08:07.433066	2019-07-13 03:08:07.433066	{yellow,yellow,yellow,yellow,white}
1262	2	522241	4	2022-05-21 22:31:47.458999	2022-05-21 22:31:47.458999	{yellow,yellow,yellow,yellow,white}
405	8	13	5	2019-07-19 19:51:21.506971	2019-07-19 19:51:21.506971	{yellow,yellow,yellow,yellow,yellow}
406	8	98	5	2019-07-19 19:51:30.279485	2019-07-19 19:51:30.279485	{yellow,yellow,yellow,yellow,yellow}
407	8	101	5	2019-07-19 19:51:32.054343	2019-07-19 19:51:32.054343	{yellow,yellow,yellow,yellow,yellow}
408	8	238	5	2019-07-19 19:51:33.847884	2019-07-19 19:51:33.847884	{yellow,yellow,yellow,yellow,yellow}
409	8	550	4	2019-07-19 19:51:38.709066	2019-07-19 19:51:38.709066	{yellow,yellow,yellow,yellow,white}
410	8	568	5	2019-07-19 19:53:15.824621	2019-07-19 19:53:15.824621	{yellow,yellow,yellow,yellow,yellow}
413	2	2666	4	2019-07-21 17:01:03.208693	2019-07-21 17:01:03.208693	{yellow,yellow,yellow,yellow,white}
416	2	297802	2	2019-07-31 15:56:46.817324	2019-07-31 15:56:46.817324	{yellow,yellow,white,white,white}
417	2	2034	4	2019-07-31 15:59:11.720042	2019-07-31 15:59:11.720042	{yellow,yellow,yellow,yellow,white}
418	2	334541	3	2019-07-31 15:59:47.785044	2019-07-31 15:59:47.785044	{yellow,yellow,yellow,white,white}
419	2	446791	3	2019-07-31 15:59:57.589497	2019-07-31 15:59:57.589497	{yellow,yellow,yellow,white,white}
420	2	24021	2	2019-07-31 16:00:11.692554	2019-07-31 16:00:11.692554	{yellow,yellow,white,white,white}
421	2	146233	3	2019-07-31 16:00:47.652882	2019-07-31 16:00:47.652882	{yellow,yellow,yellow,white,white}
422	2	395991	3	2019-07-31 16:00:56.606118	2019-07-31 16:00:56.606118	{yellow,yellow,yellow,white,white}
423	2	235	5	2019-07-31 16:01:05.286697	2019-07-31 16:01:05.286697	{yellow,yellow,yellow,yellow,yellow}
424	2	4944	3	2019-07-31 16:02:03.028241	2019-07-31 16:02:03.028241	{yellow,yellow,yellow,white,white}
425	2	346672	3	2019-07-31 16:02:32.166287	2019-07-31 16:02:32.166287	{yellow,yellow,yellow,white,white}
426	2	4614	2	2019-07-31 16:03:07.32134	2019-07-31 16:03:07.32134	{yellow,yellow,white,white,white}
427	2	8321	4	2019-07-31 16:03:10.48333	2019-07-31 16:03:10.48333	{yellow,yellow,yellow,yellow,white}
428	2	416477	4	2019-07-31 16:03:21.724958	2019-07-31 16:03:21.724958	{yellow,yellow,yellow,yellow,white}
429	2	624	1	2019-07-31 16:03:33.433809	2019-07-31 16:03:33.433809	{yellow,white,white,white,white}
430	2	9208	1	2019-07-31 16:03:40.915252	2019-07-31 16:03:40.915252	{yellow,white,white,white,white}
431	2	2255	3	2019-07-31 16:03:57.315756	2019-07-31 16:03:57.315756	{yellow,yellow,yellow,white,white}
432	2	8007	3	2019-07-31 16:04:09.930383	2019-07-31 16:04:09.930383	{yellow,yellow,yellow,white,white}
434	2	318846	4	2019-07-31 16:04:38.048959	2019-07-31 16:04:38.048959	{yellow,yellow,yellow,yellow,white}
436	2	18	3	2019-07-31 17:46:52.486129	2019-07-31 17:46:52.486129	{yellow,yellow,yellow,white,white}
414	2	369972	3	2019-07-27 16:31:24.974171	2019-08-21 07:42:00.576488	{yellow,yellow,yellow,white,white}
433	2	881	4	2019-07-31 16:04:27.189747	2019-10-31 13:56:38.878371	{yellow,yellow,yellow,yellow,white}
404	2	99966732	5	2019-07-18 19:15:44.635181	2020-07-26 23:25:55.107965	{yellow,yellow,yellow,yellow,yellow}
415	2	99970523	4	2019-07-29 14:32:15.743126	2020-07-26 23:30:00.99552	{yellow,yellow,yellow,yellow,white}
437	2	206647	3	2019-07-31 17:47:23.35406	2019-07-31 17:47:23.35406	{yellow,yellow,yellow,white,white}
438	2	562	5	2019-07-31 17:47:31.160321	2019-07-31 17:47:31.160321	{yellow,yellow,yellow,yellow,yellow}
439	2	106	5	2019-07-31 17:47:49.573373	2019-07-31 17:47:49.573373	{yellow,yellow,yellow,yellow,yellow}
440	2	339403	3	2019-07-31 17:47:52.630582	2019-07-31 17:47:52.630582	{yellow,yellow,yellow,white,white}
441	2	346910	3	2019-07-31 17:48:46.563187	2019-07-31 17:48:46.563187	{yellow,yellow,yellow,white,white}
442	2	296	3	2019-07-31 17:51:02.305912	2019-07-31 17:51:02.305912	{yellow,yellow,yellow,white,white}
443	2	5176	4	2019-08-03 17:27:21.976364	2019-08-03 17:27:21.976364	{yellow,yellow,yellow,yellow,white}
444	2	9991399	4	2019-08-03 20:49:56.648048	2022-02-27 03:07:42.459852	{yellow,yellow,yellow,yellow,white}
1263	2	526896	3	2022-05-22 00:46:19.598985	2022-05-22 00:46:19.598985	{yellow,yellow,yellow,white,white}
1264	2	680860	3	2022-05-22 00:46:35.963589	2022-05-22 00:46:35.963589	{yellow,yellow,yellow,white,white}
1265	2	99985922	3	2022-05-22 00:46:56.29946	2022-05-22 00:46:56.29946	{yellow,yellow,yellow,white,white}
448	2	9361	5	2019-08-03 22:47:21.927571	2019-08-03 22:47:21.927571	{yellow,yellow,yellow,yellow,yellow}
449	2	336890	3	2019-08-03 22:47:33.49582	2019-08-03 22:47:33.49582	{yellow,yellow,yellow,white,white}
453	2	332562	4	2019-08-16 20:17:19.843401	2019-08-16 20:17:19.843401	{yellow,yellow,yellow,yellow,white}
455	2	337170	3	2019-08-17 01:39:05.580465	2019-08-17 01:39:05.580465	{yellow,yellow,yellow,white,white}
457	2	11329	3	2019-08-17 19:56:57.045546	2019-08-17 19:56:57.045546	{yellow,yellow,yellow,white,white}
458	2	2118	4	2019-08-17 19:57:41.961626	2019-08-17 19:57:41.961626	{yellow,yellow,yellow,yellow,white}
459	2	13223	4	2019-08-17 19:58:44.776254	2019-08-17 19:58:44.776254	{yellow,yellow,yellow,yellow,white}
460	2	59440	3	2019-08-17 19:58:48.4328	2019-08-17 19:58:48.4328	{yellow,yellow,yellow,white,white}
461	2	254320	4	2019-08-17 19:58:57.690844	2019-08-17 19:58:57.690844	{yellow,yellow,yellow,yellow,white}
462	2	947	4	2019-08-17 19:59:39.431143	2019-08-17 19:59:39.431143	{yellow,yellow,yellow,yellow,white}
463	2	41733	3	2019-08-17 20:00:32.195905	2019-08-17 20:00:32.195905	{yellow,yellow,yellow,white,white}
464	2	33909	2	2019-08-17 20:00:52.927073	2019-08-17 20:00:52.927073	{yellow,yellow,white,white,white}
465	2	9509	5	2019-08-17 20:01:12.411843	2019-08-17 20:01:12.411843	{yellow,yellow,yellow,yellow,yellow}
466	2	82633	4	2019-08-17 20:01:15.553903	2019-08-17 20:01:15.553903	{yellow,yellow,yellow,yellow,white}
467	2	409	3	2019-08-17 20:01:31.751299	2019-08-17 20:01:31.751299	{yellow,yellow,yellow,white,white}
468	2	858	3	2019-08-17 20:01:43.851266	2019-08-17 20:01:43.851266	{yellow,yellow,yellow,white,white}
469	2	117	4	2019-08-17 20:02:43.971655	2019-08-17 20:02:43.971655	{yellow,yellow,yellow,yellow,white}
470	2	109424	3	2019-08-17 20:02:49.093543	2019-08-17 20:02:49.093543	{yellow,yellow,yellow,white,white}
471	2	205775	3	2019-08-17 20:02:57.69268	2019-08-17 20:02:57.69268	{yellow,yellow,yellow,white,white}
472	2	261023	3	2019-08-17 20:03:22.426136	2019-08-17 20:03:22.426136	{yellow,yellow,yellow,white,white}
473	2	25	3	2019-08-17 20:03:38.314264	2019-08-17 20:03:38.314264	{yellow,yellow,yellow,white,white}
475	2	4995	4	2019-08-17 20:03:50.65208	2019-08-17 20:03:50.65208	{yellow,yellow,yellow,yellow,white}
476	2	388399	3	2019-08-17 20:04:28.195088	2019-08-17 20:04:28.195088	{yellow,yellow,yellow,white,white}
477	2	454	3	2019-08-17 20:04:37.913515	2019-08-17 20:04:37.913515	{yellow,yellow,yellow,white,white}
478	2	587	3	2019-08-17 20:04:43.327778	2019-08-17 20:04:43.327778	{yellow,yellow,yellow,white,white}
479	2	686	3	2019-08-17 20:04:45.927025	2019-08-17 20:04:45.927025	{yellow,yellow,yellow,white,white}
481	2	74	2	2019-08-19 09:18:17.565568	2019-08-19 09:18:17.565568	{yellow,yellow,white,white,white}
482	2	10764	3	2019-08-19 09:18:39.082061	2019-08-19 09:18:39.082061	{yellow,yellow,yellow,white,white}
483	2	37724	3	2019-08-19 09:19:05.27856	2019-08-19 09:19:05.27856	{yellow,yellow,yellow,white,white}
484	2	180	4	2019-08-19 09:20:21.689249	2019-08-19 09:20:21.689249	{yellow,yellow,yellow,yellow,white}
485	2	782	5	2019-08-19 09:20:43.260001	2019-08-19 09:20:43.260001	{yellow,yellow,yellow,yellow,yellow}
447	2	9991438	5	2019-08-03 22:46:27.50948	2020-07-26 23:25:55.167711	{yellow,yellow,yellow,yellow,yellow}
456	2	9991420	4	2019-08-17 19:55:54.819321	2020-07-26 23:25:55.25343	{yellow,yellow,yellow,yellow,white}
445	2	99954344	5	2019-08-03 22:46:04.857602	2020-07-26 23:25:55.408605	{yellow,yellow,yellow,yellow,yellow}
451	2	99967744	4	2019-08-16 20:11:44.147156	2020-07-26 23:25:55.479754	{yellow,yellow,yellow,yellow,white}
454	2	99973107	4	2019-08-17 01:38:54.137048	2020-07-26 23:25:55.736907	{yellow,yellow,yellow,yellow,white}
452	2	99967195	2	2019-08-16 20:12:05.51279	2020-07-26 23:25:55.7619	{yellow,yellow,white,white,white}
486	2	1368	3	2019-08-19 09:20:45.770777	2019-08-19 09:20:45.770777	{yellow,yellow,yellow,white,white}
488	2	161	5	2019-08-19 09:21:13.186027	2019-08-19 09:21:13.186027	{yellow,yellow,yellow,yellow,yellow}
490	2	56292	3	2019-08-19 09:21:19.640034	2019-08-19 09:21:19.640034	{yellow,yellow,yellow,white,white}
492	2	324668	3	2019-08-19 09:21:34.024411	2019-08-19 09:21:34.024411	{yellow,yellow,yellow,white,white}
494	2	534	3	2019-08-19 09:21:53.319533	2019-08-19 09:21:53.319533	{yellow,yellow,yellow,white,white}
496	2	956	2	2019-08-19 09:22:24.348792	2019-08-19 09:22:24.348792	{yellow,yellow,white,white,white}
501	2	5548	3	2019-08-19 09:23:22.899627	2019-08-19 09:23:22.899627	{yellow,yellow,yellow,white,white}
498	2	163	2	2019-08-19 09:22:32.332132	2019-12-22 06:07:18.429279	{yellow,yellow,white,white,white}
1266	2	99983631	3	2022-05-22 00:47:00.628885	2022-05-22 00:47:00.628885	{yellow,yellow,yellow,white,white}
487	2	393	3	2019-08-19 09:20:50.995264	2019-08-19 09:20:50.995264	{yellow,yellow,yellow,white,white}
489	2	955	1	2019-08-19 09:21:16.552356	2019-08-19 09:21:16.552356	{yellow,white,white,white,white}
491	2	273481	3	2019-08-19 09:21:22.811109	2019-08-19 09:21:22.811109	{yellow,yellow,yellow,white,white}
493	2	605	5	2019-08-19 09:21:47.293807	2019-08-19 09:21:47.293807	{yellow,yellow,yellow,yellow,yellow}
497	2	1572	4	2019-08-19 09:22:29.184111	2019-08-19 09:22:29.184111	{yellow,yellow,yellow,yellow,white}
499	2	45612	3	2019-08-19 09:22:55.60345	2019-08-19 09:22:55.60345	{yellow,yellow,yellow,white,white}
500	2	9869	4	2019-08-19 09:23:06.702462	2019-08-19 09:23:06.702462	{yellow,yellow,yellow,yellow,white}
502	2	16320	4	2019-08-19 09:23:27.166012	2019-08-19 09:23:29.604834	{yellow,yellow,yellow,yellow,white}
503	2	87421	3	2019-08-19 09:24:09.779651	2019-08-19 09:24:09.779651	{yellow,yellow,yellow,white,white}
504	2	76726	4	2019-08-21 07:30:55.39066	2019-08-21 07:30:55.39066	{yellow,yellow,yellow,yellow,white}
505	2	379	5	2019-08-21 07:35:10.526853	2019-08-21 07:35:10.526853	{yellow,yellow,yellow,yellow,yellow}
1267	2	639933	3	2022-05-31 20:14:44.991373	2022-05-31 20:14:44.991373	{yellow,yellow,yellow,white,white}
510	2	1892	5	2019-08-21 07:38:39.82902	2019-08-21 07:38:39.82902	{yellow,yellow,yellow,yellow,yellow}
511	2	1858	3	2019-08-21 07:39:18.946551	2019-08-21 07:39:18.946551	{yellow,yellow,yellow,white,white}
512	2	1487	3	2019-08-21 07:41:40.764385	2019-08-21 07:41:40.764385	{yellow,yellow,yellow,white,white}
513	2	36668	5	2019-08-21 07:42:20.075378	2019-08-21 07:42:20.075378	{yellow,yellow,yellow,yellow,yellow}
515	10	13	5	2019-08-24 22:22:05.63851	2019-08-24 22:22:05.63851	{yellow,yellow,yellow,yellow,yellow}
516	10	101	5	2019-08-24 22:22:07.226039	2019-08-24 22:22:07.226039	{yellow,yellow,yellow,yellow,yellow}
517	10	155	5	2019-08-24 22:22:10.865676	2019-08-24 22:22:10.865676	{yellow,yellow,yellow,yellow,yellow}
518	10	238	3	2019-08-24 22:22:12.817835	2019-08-24 22:22:12.817835	{yellow,yellow,yellow,white,white}
519	10	278	5	2019-08-24 22:22:15.028418	2019-08-24 22:22:15.028418	{yellow,yellow,yellow,yellow,yellow}
520	10	350	3	2019-08-24 22:22:16.578347	2019-08-24 22:22:16.578347	{yellow,yellow,yellow,white,white}
521	10	424	5	2019-08-24 22:22:19.411534	2019-08-24 22:22:19.411534	{yellow,yellow,yellow,yellow,yellow}
522	10	550	4	2019-08-24 22:22:23.56868	2019-08-24 22:22:23.56868	{yellow,yellow,yellow,yellow,white}
523	10	568	4	2019-08-24 22:22:24.922838	2019-08-24 22:22:24.922838	{yellow,yellow,yellow,yellow,white}
524	10	597	3	2019-08-24 22:22:26.504188	2019-08-24 22:22:26.504188	{yellow,yellow,yellow,white,white}
525	10	627	4	2019-08-24 22:22:28.352386	2019-08-24 22:22:28.352386	{yellow,yellow,yellow,yellow,white}
526	10	857	5	2019-08-24 22:22:32.44795	2019-08-24 22:22:32.44795	{yellow,yellow,yellow,yellow,yellow}
527	10	8966	2	2019-08-24 22:22:34.211153	2019-08-24 22:22:34.211153	{yellow,yellow,white,white,white}
528	10	16869	3	2019-08-24 22:22:36.287746	2019-08-24 22:22:36.287746	{yellow,yellow,yellow,white,white}
529	10	49026	4	2019-08-24 22:22:39.831859	2019-08-24 22:22:39.831859	{yellow,yellow,yellow,yellow,white}
530	10	106646	4	2019-08-24 22:22:43.628627	2019-08-24 22:22:43.628627	{yellow,yellow,yellow,yellow,white}
532	2	299534	5	2019-08-26 08:57:24.354981	2019-08-26 08:57:24.354981	{yellow,yellow,yellow,yellow,yellow}
534	2	479455	3	2019-08-26 20:05:17.257168	2019-08-26 20:05:17.257168	{yellow,yellow,yellow,white,white}
531	2	397538	5	2019-08-26 04:28:32.205861	2019-12-04 03:32:23.88506	{yellow,yellow,yellow,yellow,yellow}
535	2	531309	3	2019-08-31 22:21:09.93419	2019-08-31 22:21:09.93419	{yellow,yellow,yellow,white,white}
536	2	2055	4	2019-08-31 22:58:00.265266	2019-08-31 22:58:00.265266	{yellow,yellow,yellow,yellow,white}
537	2	11468	4	2019-08-31 22:58:01.831116	2019-08-31 22:58:01.831116	{yellow,yellow,yellow,yellow,white}
538	2	13701	5	2019-08-31 22:58:19.25329	2019-08-31 22:58:19.25329	{yellow,yellow,yellow,yellow,yellow}
539	2	65034	3	2019-08-31 22:59:42.08059	2019-08-31 22:59:43.224761	{yellow,yellow,yellow,white,white}
540	2	43074	3	2019-08-31 23:03:11.18325	2019-08-31 23:03:11.18325	{yellow,yellow,yellow,white,white}
541	2	297761	3	2019-08-31 23:03:17.212792	2019-08-31 23:03:17.212792	{yellow,yellow,yellow,white,white}
542	2	1894	2	2019-08-31 23:03:54.228453	2019-08-31 23:03:54.228453	{yellow,yellow,white,white,white}
514	2	9992710	5	2019-08-23 06:37:25.950946	2020-07-26 23:25:55.320066	{yellow,yellow,yellow,yellow,yellow}
495	2	1573	4	2019-08-19 09:22:00.248059	2019-10-19 21:31:41.793467	{yellow,yellow,yellow,yellow,white}
507	2	99942009	4	2019-08-21 07:38:11.758982	2020-07-26 23:25:55.517413	{yellow,yellow,yellow,yellow,white}
508	2	99944217	4	2019-08-21 07:38:32.305374	2020-07-26 23:25:55.548233	{yellow,yellow,yellow,yellow,white}
509	2	99963247	4	2019-08-21 07:38:35.982299	2020-07-26 23:25:55.790742	{yellow,yellow,yellow,yellow,white}
1268	2	531876	3	2022-06-01 23:36:13.818322	2022-06-01 23:36:13.818322	{yellow,yellow,yellow,white,white}
544	2	11253	3	2019-08-31 23:06:35.839761	2019-08-31 23:06:35.839761	{yellow,yellow,yellow,white,white}
545	2	165	3	2019-08-31 23:06:40.744134	2019-08-31 23:06:40.744134	{yellow,yellow,yellow,white,white}
546	2	268	5	2019-08-31 23:06:56.709313	2019-08-31 23:06:56.709313	{yellow,yellow,yellow,yellow,yellow}
548	2	101299	4	2019-08-31 23:07:18.883536	2019-08-31 23:07:18.883536	{yellow,yellow,yellow,yellow,white}
550	2	102382	3	2019-08-31 23:07:28.564917	2019-08-31 23:07:28.564917	{yellow,yellow,yellow,white,white}
552	2	1271	5	2019-08-31 23:07:55.633963	2019-08-31 23:07:55.633963	{yellow,yellow,yellow,yellow,yellow}
554	2	1547	5	2019-08-31 23:11:59.347209	2019-08-31 23:11:59.347209	{yellow,yellow,yellow,yellow,yellow}
555	2	277	5	2019-08-31 23:12:51.433287	2019-08-31 23:12:51.433287	{yellow,yellow,yellow,yellow,yellow}
556	2	12437	5	2019-08-31 23:12:56.736919	2019-08-31 23:12:56.736919	{yellow,yellow,yellow,yellow,yellow}
557	2	52520	3	2019-08-31 23:13:23.458818	2019-08-31 23:13:23.458818	{yellow,yellow,yellow,white,white}
558	2	834	5	2019-08-31 23:13:36.333448	2019-08-31 23:13:36.333448	{yellow,yellow,yellow,yellow,yellow}
559	2	10668	4	2019-09-02 09:23:13.411932	2019-09-02 09:23:13.411932	{yellow,yellow,yellow,yellow,white}
334	2	77016	4	2019-06-22 01:21:26.947553	2019-09-04 11:52:35.940989	{yellow,yellow,yellow,yellow,white}
561	2	66	3	2019-09-05 20:25:12.1006	2019-09-05 20:25:12.1006	{yellow,yellow,yellow,white,white}
562	2	8051	4	2019-09-07 00:43:27.631433	2019-09-07 00:43:27.631433	{yellow,yellow,yellow,yellow,white}
564	2	493551	3	2019-09-09 17:53:44.049915	2019-09-09 17:53:44.049915	{yellow,yellow,yellow,white,white}
565	2	2062	3	2019-09-12 16:39:53.707927	2019-09-12 16:39:53.707927	{yellow,yellow,yellow,white,white}
566	2	813	4	2019-09-12 16:40:36.117166	2019-09-12 16:40:36.117166	{yellow,yellow,yellow,yellow,white}
567	2	687	5	2019-09-13 20:50:54.637387	2019-09-13 20:50:54.637387	{yellow,yellow,yellow,yellow,yellow}
568	2	318121	3	2019-09-14 21:10:09.323197	2019-09-14 21:10:09.323197	{yellow,yellow,yellow,white,white}
569	2	11973	3	2019-09-14 21:10:16.447358	2019-09-14 21:10:16.447358	{yellow,yellow,yellow,white,white}
570	2	711	4	2019-09-14 21:10:28.784204	2019-09-14 21:10:28.784204	{yellow,yellow,yellow,yellow,white}
571	2	223485	3	2019-09-15 22:04:26.132304	2019-09-15 22:04:26.132304	{yellow,yellow,yellow,white,white}
572	2	320288	5	2019-09-22 01:20:18.473484	2019-09-22 01:20:18.473484	{yellow,yellow,yellow,yellow,yellow}
573	2	287947	3	2019-09-22 01:20:30.898225	2019-09-22 01:20:30.898225	{yellow,yellow,yellow,white,white}
574	1	491472	4	2019-09-25 22:02:02.133704	2019-09-25 22:02:02.133704	{yellow,yellow,yellow,yellow,white}
575	1	419704	3	2019-09-25 22:03:02.42379	2019-09-25 22:03:02.42379	{yellow,yellow,yellow,white,white}
576	1	412117	5	2019-09-25 22:03:08.049711	2019-09-25 22:03:08.049711	{yellow,yellow,yellow,yellow,yellow}
608	2	107	5	2019-09-28 02:43:40.574945	2019-09-28 02:43:40.574945	{yellow,yellow,yellow,yellow,yellow}
609	2	58102	4	2019-09-28 07:07:03.983327	2019-09-28 07:07:03.983327	{yellow,yellow,yellow,yellow,white}
610	2	100	5	2019-09-28 21:51:20.401674	2019-09-28 21:51:20.401674	{yellow,yellow,yellow,yellow,yellow}
611	2	9495	5	2019-10-02 14:22:57.43895	2019-10-02 14:22:57.43895	{yellow,yellow,yellow,yellow,yellow}
612	2	8224	3	2019-10-03 07:22:55.818587	2019-10-03 07:22:55.818587	{yellow,yellow,yellow,white,white}
613	2	2048	4	2019-10-03 07:23:11.779872	2019-10-03 07:23:11.779872	{yellow,yellow,yellow,yellow,white}
614	2	9738	3	2019-10-03 07:24:32.203901	2019-10-03 07:24:32.203901	{yellow,yellow,yellow,white,white}
615	2	7555	3	2019-10-03 07:25:55.189769	2019-10-03 07:25:55.189769	{yellow,yellow,yellow,white,white}
616	2	445571	3	2019-10-03 07:26:02.324909	2019-10-03 07:26:02.324909	{yellow,yellow,yellow,white,white}
617	2	343611	3	2019-10-03 07:26:48.833308	2019-10-03 07:26:48.833308	{yellow,yellow,yellow,white,white}
618	2	927	3	2019-10-03 07:28:17.492458	2019-10-03 07:28:17.492458	{yellow,yellow,yellow,white,white}
620	2	188222	3	2019-10-07 15:11:42.560545	2019-10-07 15:11:42.560545	{yellow,yellow,yellow,white,white}
621	2	1940	4	2019-10-07 15:11:45.448643	2019-10-07 15:11:45.448643	{yellow,yellow,yellow,yellow,white}
607	2	99962668	4	2019-09-28 02:41:11.927604	2020-07-26 23:25:55.186886	{yellow,yellow,yellow,yellow,white}
551	2	9992316	5	2019-08-31 23:07:33.585986	2020-07-26 23:25:55.577091	{yellow,yellow,yellow,yellow,yellow}
619	2	99946533	4	2019-10-07 15:10:21.215662	2020-07-26 23:25:55.620199	{yellow,yellow,yellow,yellow,white}
547	2	9994613	5	2019-08-31 23:07:11.846702	2020-07-26 23:25:55.820316	{yellow,yellow,yellow,yellow,yellow}
549	2	9994607	4	2019-08-31 23:07:22.398056	2020-07-26 23:25:55.839284	{yellow,yellow,yellow,yellow,white}
563	2	99987108	4	2019-09-09 13:55:05.367737	2020-07-26 23:25:55.861663	{yellow,yellow,yellow,yellow,white}
622	2	99948891	5	2019-10-07 15:12:20.794505	2020-07-26 23:25:55.884071	{yellow,yellow,yellow,yellow,yellow}
623	2	429617	4	2019-10-07 17:33:00.086518	2019-10-07 17:33:00.086518	{yellow,yellow,yellow,yellow,white}
624	2	539	4	2019-10-07 17:33:47.702695	2019-10-07 17:34:11.726119	{yellow,yellow,yellow,yellow,white}
627	2	13466	4	2019-10-09 12:43:08.806987	2019-10-09 12:43:08.806987	{yellow,yellow,yellow,yellow,white}
628	2	45269	3	2019-10-11 16:26:58.801719	2019-10-11 16:26:58.801719	{yellow,yellow,yellow,white,white}
629	2	476669	3	2019-10-11 16:27:04.987191	2019-10-11 16:27:04.987191	{yellow,yellow,yellow,white,white}
630	1	420818	5	2019-10-11 20:39:35.274226	2019-10-11 20:39:35.274226	{yellow,yellow,yellow,yellow,yellow}
631	2	530382	3	2019-10-12 22:35:55.517821	2019-10-12 22:35:55.517821	{yellow,yellow,yellow,white,white}
635	2	1903	3	2019-10-18 02:40:02.68781	2019-10-18 02:40:02.68781	{yellow,yellow,yellow,white,white}
636	2	11259	5	2019-10-18 02:40:06.659154	2019-10-18 02:40:06.659154	{yellow,yellow,yellow,yellow,yellow}
637	2	2604	3	2019-10-18 02:40:10.865912	2019-10-18 02:40:10.865912	{yellow,yellow,yellow,white,white}
638	2	2119	4	2019-10-18 02:40:14.182891	2019-10-18 02:40:14.182891	{yellow,yellow,yellow,yellow,white}
639	2	11976	3	2019-10-18 02:40:20.642193	2019-10-18 02:40:20.642193	{yellow,yellow,yellow,white,white}
640	2	9346	3	2019-10-18 02:40:25.991427	2019-10-18 02:40:25.991427	{yellow,yellow,yellow,white,white}
641	2	9390	5	2019-10-18 02:40:28.115152	2019-10-18 02:40:28.115152	{yellow,yellow,yellow,yellow,yellow}
642	2	37233	3	2019-10-18 02:40:31.402909	2019-10-18 02:40:31.402909	{yellow,yellow,yellow,white,white}
643	2	37834	3	2019-10-18 02:40:35.210207	2019-10-18 02:40:35.210207	{yellow,yellow,yellow,white,white}
644	2	75612	3	2019-10-18 02:40:46.977853	2019-10-18 02:40:46.977853	{yellow,yellow,yellow,white,white}
645	2	7446	3	2019-10-18 02:43:04.61429	2019-10-18 02:43:04.61429	{yellow,yellow,yellow,white,white}
646	2	334	3	2019-10-18 02:43:20.06007	2019-10-18 02:43:20.06007	{yellow,yellow,yellow,white,white}
647	2	227	3	2019-10-18 02:43:27.086259	2019-10-18 02:43:27.086259	{yellow,yellow,yellow,white,white}
648	2	293	5	2019-10-18 02:43:59.712782	2019-10-18 02:43:59.712782	{yellow,yellow,yellow,yellow,yellow}
649	2	297	3	2019-10-18 02:44:01.797608	2019-10-18 02:44:01.797608	{yellow,yellow,yellow,white,white}
650	2	978	3	2019-10-18 02:44:08.318887	2019-10-18 02:44:08.318887	{yellow,yellow,yellow,white,white}
651	2	1164	3	2019-10-18 02:44:10.370174	2019-10-18 02:44:10.370174	{yellow,yellow,yellow,white,white}
652	2	4476	4	2019-10-18 02:44:16.528539	2019-10-18 02:44:16.528539	{yellow,yellow,yellow,yellow,white}
653	2	4512	4	2019-10-18 02:44:19.746219	2019-10-18 02:44:28.901273	{yellow,yellow,yellow,yellow,white}
654	2	10909	3	2019-10-18 02:44:31.947678	2019-10-18 02:44:31.947678	{yellow,yellow,yellow,white,white}
655	2	6073	3	2019-10-18 02:44:33.878607	2019-10-18 02:44:33.878607	{yellow,yellow,yellow,white,white}
656	2	60308	4	2019-10-18 02:44:36.757816	2019-10-18 02:44:36.757816	{yellow,yellow,yellow,yellow,white}
657	2	64689	3	2019-10-18 02:44:39.136268	2019-10-18 02:44:39.136268	{yellow,yellow,yellow,white,white}
658	2	298	2	2019-10-18 02:45:00.134915	2019-10-18 02:45:00.134915	{yellow,yellow,white,white,white}
659	2	1535	3	2019-10-18 02:45:09.592373	2019-10-18 02:45:09.592373	{yellow,yellow,yellow,white,white}
660	2	63	3	2019-10-18 02:45:24.156043	2019-10-18 02:45:24.156043	{yellow,yellow,yellow,white,white}
662	2	319	5	2019-10-18 02:45:57.371574	2019-10-18 02:45:57.371574	{yellow,yellow,yellow,yellow,yellow}
663	2	492	3	2019-10-18 02:46:25.379952	2019-10-18 02:46:25.379952	{yellow,yellow,yellow,white,white}
664	2	1907	3	2019-10-18 02:47:25.653119	2019-10-18 02:47:25.653119	{yellow,yellow,yellow,white,white}
665	2	12113	3	2019-10-18 02:47:34.405168	2019-10-18 02:47:34.405168	{yellow,yellow,yellow,white,white}
666	2	9313	2	2019-10-18 02:47:37.734581	2019-10-18 02:47:37.734581	{yellow,yellow,white,white,white}
632	2	559969	4	2019-10-12 23:51:34.140648	2022-03-24 17:13:30.069386	{yellow,yellow,yellow,yellow,white}
668	2	88794	3	2019-10-18 02:47:51.577911	2019-10-18 02:47:51.577911	{yellow,yellow,yellow,white,white}
669	2	8092	3	2019-10-18 02:48:03.519231	2019-10-18 02:48:03.519231	{yellow,yellow,yellow,white,white}
633	2	523172	3	2019-10-14 03:33:24.537784	2019-10-21 00:55:41.587407	{yellow,yellow,yellow,white,white}
661	2	4912	4	2019-10-18 02:45:40.554238	2020-03-21 02:21:34.506013	{yellow,yellow,yellow,yellow,white}
625	2	11593	4	2019-10-08 00:28:12.712847	2021-11-06 19:45:48.36966	{yellow,yellow,yellow,yellow,white}
634	2	12106	5	2019-10-15 11:56:10.642055	2022-04-23 06:16:59.10753	{yellow,yellow,yellow,yellow,yellow}
1269	2	999100052	3	2022-06-01 23:37:10.636041	2022-06-01 23:37:10.636041	{yellow,yellow,yellow,white,white}
1270	2	513576	3	2022-06-01 23:38:32.704951	2022-06-01 23:38:32.704951	{yellow,yellow,yellow,white,white}
626	2	396806	2	2019-10-09 03:24:49.844272	2022-06-01 23:39:04.518948	{yellow,yellow,white,white,white}
670	2	9819	3	2019-10-18 02:48:20.779504	2019-10-18 02:48:20.779504	{yellow,yellow,yellow,white,white}
671	2	2001	3	2019-10-18 02:49:43.96681	2019-10-18 02:49:43.96681	{yellow,yellow,yellow,white,white}
672	2	12723	4	2019-10-18 02:49:49.841252	2019-10-18 02:49:49.841252	{yellow,yellow,yellow,yellow,white}
673	2	26618	3	2019-10-18 02:49:53.685831	2019-10-18 02:49:53.685831	{yellow,yellow,yellow,white,white}
674	2	6947	3	2019-10-18 02:50:09.395731	2019-10-18 02:50:09.395731	{yellow,yellow,yellow,white,white}
675	2	19457	2	2019-10-18 02:50:13.731364	2019-10-18 02:50:13.731364	{yellow,yellow,white,white,white}
676	2	440161	3	2019-10-18 02:50:16.443291	2019-10-18 02:50:16.443291	{yellow,yellow,yellow,white,white}
677	2	10278	3	2019-10-18 02:50:20.141224	2019-10-18 02:50:20.141224	{yellow,yellow,yellow,white,white}
678	2	205	3	2019-10-18 02:50:35.758855	2019-10-18 02:50:35.758855	{yellow,yellow,yellow,white,white}
679	2	1552	3	2019-10-18 02:50:39.727167	2019-10-18 02:50:39.727167	{yellow,yellow,yellow,white,white}
680	2	1966	3	2019-10-18 05:38:55.88455	2019-10-18 05:38:55.88455	{yellow,yellow,yellow,white,white}
681	2	10687	3	2019-10-18 05:38:55.961388	2019-10-18 05:38:55.961388	{yellow,yellow,yellow,white,white}
682	2	1817	3	2019-10-18 05:38:56.250785	2019-10-18 05:38:56.250785	{yellow,yellow,yellow,white,white}
683	2	11400	2	2019-10-18 05:38:56.383122	2019-10-18 05:38:56.383122	{yellow,yellow,white,white,white}
684	2	64635	2	2019-10-18 05:39:07.681718	2019-10-18 05:39:07.681718	{yellow,yellow,white,white,white}
685	2	48838	3	2019-10-18 05:39:14.582485	2019-10-18 05:39:14.582485	{yellow,yellow,yellow,white,white}
686	2	49009	3	2019-10-18 05:39:18.24635	2019-10-18 05:39:18.24635	{yellow,yellow,yellow,white,white}
687	2	10592	3	2019-10-18 05:39:26.429319	2019-10-18 05:39:26.429319	{yellow,yellow,yellow,white,white}
688	2	1647	3	2019-10-18 05:39:28.839373	2019-10-18 05:39:28.839373	{yellow,yellow,yellow,white,white}
689	2	58151	3	2019-10-18 05:39:47.289789	2019-10-18 05:39:47.289789	{yellow,yellow,yellow,white,white}
690	2	51540	3	2019-10-18 05:39:56.747035	2019-10-18 05:39:56.747035	{yellow,yellow,yellow,white,white}
691	2	12490	2	2019-10-18 05:40:04.452601	2019-10-18 05:40:04.452601	{yellow,yellow,white,white,white}
692	2	25208	2	2019-10-18 06:23:38.07998	2019-10-18 06:23:38.07998	{yellow,yellow,white,white,white}
693	2	7874	3	2019-10-18 06:23:38.330073	2019-10-18 06:23:38.330073	{yellow,yellow,yellow,white,white}
694	2	1537	3	2019-10-18 06:24:33.504256	2019-10-18 06:24:33.504256	{yellow,yellow,yellow,white,white}
695	2	8247	3	2019-10-18 06:25:10.293019	2019-10-18 06:25:10.293019	{yellow,yellow,yellow,white,white}
696	2	10782	3	2019-10-18 06:25:12.888358	2019-10-18 06:25:12.888358	{yellow,yellow,yellow,white,white}
697	2	10153	3	2019-10-18 06:25:15.836662	2019-10-18 06:25:15.836662	{yellow,yellow,yellow,white,white}
698	2	1645	3	2019-10-18 06:25:18.202012	2019-10-18 06:25:18.202012	{yellow,yellow,yellow,white,white}
699	2	13815	3	2019-10-18 06:25:23.267913	2019-10-18 06:25:23.267913	{yellow,yellow,yellow,white,white}
700	2	87516	3	2019-10-18 06:25:39.164689	2019-10-18 06:25:39.164689	{yellow,yellow,yellow,white,white}
701	2	602	2	2019-10-18 06:26:31.333842	2019-10-18 06:26:31.333842	{yellow,yellow,white,white,white}
702	2	8488	3	2019-10-18 06:26:36.706073	2019-10-18 06:26:36.706073	{yellow,yellow,yellow,white,white}
703	2	8960	3	2019-10-18 06:26:38.807343	2019-10-18 06:26:38.807343	{yellow,yellow,yellow,white,white}
1271	2	734265	3	2022-06-01 23:40:40.477499	2022-06-01 23:40:40.477499	{yellow,yellow,yellow,white,white}
705	2	321741	3	2019-10-18 06:26:55.416857	2019-10-18 06:26:55.416857	{yellow,yellow,yellow,white,white}
706	2	400106	3	2019-10-18 06:27:06.237143	2019-10-18 06:27:06.237143	{yellow,yellow,yellow,white,white}
707	2	4958	3	2019-10-18 06:27:15.413763	2019-10-18 06:27:15.413763	{yellow,yellow,yellow,white,white}
708	2	109443	3	2019-10-18 06:27:31.859289	2019-10-18 06:27:31.859289	{yellow,yellow,yellow,white,white}
709	2	9040	3	2019-10-18 14:44:13.900002	2019-10-18 14:44:13.900002	{yellow,yellow,yellow,white,white}
710	2	9008	3	2019-10-18 14:44:15.257656	2019-10-18 14:44:15.257656	{yellow,yellow,yellow,white,white}
711	2	6075	3	2019-10-18 14:44:23.876014	2019-10-18 14:44:23.876014	{yellow,yellow,yellow,white,white}
712	2	320	4	2019-10-18 14:44:28.738351	2019-10-18 14:44:28.738351	{yellow,yellow,yellow,yellow,white}
713	2	9366	4	2019-10-18 14:44:53.120736	2019-10-18 14:44:53.120736	{yellow,yellow,yellow,yellow,white}
715	2	2135	3	2019-10-18 14:46:18.224576	2019-10-18 14:46:18.224576	{yellow,yellow,yellow,white,white}
716	2	81796	3	2019-10-18 14:46:39.941845	2019-10-18 14:46:39.941845	{yellow,yellow,yellow,white,white}
717	2	20766	3	2019-10-18 14:47:30.687705	2019-10-18 14:47:30.687705	{yellow,yellow,yellow,white,white}
718	2	1900	4	2019-10-19 01:45:58.416301	2019-10-19 01:45:58.416301	{yellow,yellow,yellow,yellow,white}
714	2	9998592	5	2019-10-18 14:45:32.349945	2020-07-26 23:28:38.714183	{yellow,yellow,yellow,yellow,yellow}
719	2	13	5	2019-10-19 02:02:15.721579	2019-10-19 02:02:15.721579	{yellow,yellow,yellow,yellow,yellow}
720	2	8393	3	2019-10-19 02:04:53.386183	2019-10-19 02:04:53.386183	{yellow,yellow,yellow,white,white}
721	2	620	5	2019-10-19 02:05:37.929893	2019-10-19 02:05:37.929893	{yellow,yellow,yellow,yellow,yellow}
722	2	957	4	2019-10-19 02:06:52.178188	2019-10-19 02:06:52.178188	{yellow,yellow,yellow,yellow,white}
723	2	9614	4	2019-10-19 02:06:57.772743	2019-10-19 02:06:57.772743	{yellow,yellow,yellow,yellow,white}
724	2	4964	3	2019-10-19 02:07:14.186624	2019-10-19 02:07:14.186624	{yellow,yellow,yellow,white,white}
725	2	90	4	2019-10-19 02:12:57.448897	2019-10-19 02:12:57.448897	{yellow,yellow,yellow,yellow,white}
726	2	2898	4	2019-10-19 02:13:11.394835	2019-10-19 02:13:11.394835	{yellow,yellow,yellow,yellow,white}
727	2	137106	3	2019-10-19 02:13:20.448239	2019-10-19 02:13:20.448239	{yellow,yellow,yellow,white,white}
728	2	525	3	2019-10-19 02:13:28.270016	2019-10-19 02:13:28.270016	{yellow,yellow,yellow,white,white}
729	2	1593	3	2019-10-19 02:13:34.691585	2019-10-19 02:13:34.691585	{yellow,yellow,yellow,white,white}
730	2	203801	3	2019-10-19 02:13:36.988309	2019-10-19 02:13:36.988309	{yellow,yellow,yellow,white,white}
731	2	228967	3	2019-10-19 02:13:44.144259	2019-10-19 02:13:44.144259	{yellow,yellow,yellow,white,white}
732	2	9870	4	2019-10-19 02:13:57.92933	2019-10-19 02:13:57.92933	{yellow,yellow,yellow,yellow,white}
733	2	15413	3	2019-10-19 02:14:01.30523	2019-10-19 02:14:01.30523	{yellow,yellow,yellow,white,white}
734	2	134374	2	2019-10-19 02:14:16.626905	2019-10-19 02:14:16.626905	{yellow,yellow,white,white,white}
735	2	2978	2	2019-10-19 02:14:32.267938	2019-10-19 02:14:32.267938	{yellow,yellow,white,white,white}
736	2	4247	3	2019-10-19 02:14:53.468537	2019-10-19 02:14:53.468537	{yellow,yellow,yellow,white,white}
737	2	7518	3	2019-10-19 02:14:57.825719	2019-10-19 02:14:57.825719	{yellow,yellow,yellow,white,white}
738	2	38055	3	2019-10-19 02:15:06.336847	2019-10-19 02:15:06.336847	{yellow,yellow,yellow,white,white}
739	2	8012	3	2019-10-19 02:15:15.147913	2019-10-19 02:15:15.147913	{yellow,yellow,yellow,white,white}
740	2	18785	4	2019-10-19 02:15:35.414139	2019-10-19 02:15:39.583689	{yellow,yellow,yellow,yellow,white}
741	2	37136	4	2019-10-19 02:16:07.75054	2019-10-19 02:16:07.75054	{yellow,yellow,yellow,yellow,white}
742	2	6978	2	2019-10-19 02:16:17.861636	2019-10-19 02:16:17.861636	{yellow,yellow,white,white,white}
743	2	114	4	2019-10-19 02:16:27.279974	2019-10-19 02:16:27.279974	{yellow,yellow,yellow,yellow,white}
744	2	509	3	2019-10-19 02:16:32.591881	2019-10-19 02:16:32.591881	{yellow,yellow,yellow,white,white}
745	2	1542	4	2019-10-19 02:16:38.92505	2019-10-19 02:16:38.92505	{yellow,yellow,yellow,yellow,white}
746	2	9384	3	2019-10-19 02:18:05.111052	2019-10-19 02:18:05.111052	{yellow,yellow,yellow,white,white}
747	2	136400	3	2019-10-19 02:18:23.685876	2019-10-19 02:18:23.685876	{yellow,yellow,yellow,white,white}
748	2	942	3	2019-10-19 02:18:43.590028	2019-10-19 02:18:43.590028	{yellow,yellow,yellow,white,white}
749	2	8363	4	2019-10-19 02:18:57.843902	2019-10-19 02:18:57.843902	{yellow,yellow,yellow,yellow,white}
750	2	9377	5	2019-10-19 02:19:00.070316	2019-10-19 02:19:00.070316	{yellow,yellow,yellow,yellow,yellow}
751	2	134	3	2019-10-19 02:19:04.428289	2019-10-19 02:19:04.428289	{yellow,yellow,yellow,white,white}
752	2	48988	3	2019-10-19 02:19:14.287158	2019-10-19 02:19:14.287158	{yellow,yellow,yellow,white,white}
753	2	460668	3	2019-10-19 02:19:31.93181	2019-10-19 02:19:31.93181	{yellow,yellow,yellow,white,white}
754	2	290250	3	2019-10-19 02:19:57.113863	2019-10-19 02:19:57.113863	{yellow,yellow,yellow,white,white}
755	2	196	2	2019-10-19 02:25:12.623901	2019-10-19 02:25:12.623901	{yellow,yellow,white,white,white}
756	2	7516	3	2019-10-19 02:25:41.832037	2019-10-19 02:25:41.832037	{yellow,yellow,yellow,white,white}
757	2	34544	3	2019-10-19 02:25:45.510129	2019-10-19 02:25:45.510129	{yellow,yellow,yellow,white,white}
758	2	1597	4	2019-10-19 02:26:22.338503	2019-10-19 02:26:22.338503	{yellow,yellow,yellow,yellow,white}
759	2	9522	5	2019-10-19 02:26:30.554482	2019-10-19 02:26:30.554482	{yellow,yellow,yellow,yellow,yellow}
760	2	437557	3	2019-10-19 02:26:40.366729	2019-10-19 02:26:40.366729	{yellow,yellow,yellow,white,white}
761	2	1406	3	2019-10-19 02:26:42.939358	2019-10-19 02:26:42.939358	{yellow,yellow,yellow,white,white}
762	2	2493	5	2019-10-19 02:26:45.186395	2019-10-19 02:26:45.186395	{yellow,yellow,yellow,yellow,yellow}
763	2	9340	5	2019-10-19 02:26:50.156415	2019-10-19 02:26:50.156415	{yellow,yellow,yellow,yellow,yellow}
764	2	45243	3	2019-10-19 02:26:57.770668	2019-10-19 02:26:57.770668	{yellow,yellow,yellow,white,white}
765	2	6415	3	2019-10-19 02:27:04.232091	2019-10-19 02:27:04.232091	{yellow,yellow,yellow,white,white}
766	2	9543	3	2019-10-19 21:07:46.227981	2019-10-19 21:07:46.227981	{yellow,yellow,yellow,white,white}
1272	2	36773	3	2022-06-22 22:44:11.787058	2022-06-22 22:44:11.787058	{yellow,yellow,yellow,white,white}
767	2	7445	3	2019-10-19 21:08:12.768344	2019-10-19 21:08:32.140813	{yellow,yellow,yellow,white,white}
768	2	9962	3	2019-10-19 21:08:36.611333	2019-10-19 21:08:36.611333	{yellow,yellow,yellow,white,white}
769	2	251	4	2019-10-19 21:09:09.145394	2019-10-19 21:09:09.145394	{yellow,yellow,yellow,yellow,white}
770	2	1089	5	2019-10-19 21:09:10.905794	2019-10-19 21:09:10.905794	{yellow,yellow,yellow,yellow,yellow}
771	2	10135	4	2019-10-19 21:09:15.146751	2019-10-19 21:09:15.146751	{yellow,yellow,yellow,yellow,white}
772	2	27418	2	2019-10-19 21:09:19.132727	2019-10-19 21:09:19.132727	{yellow,yellow,white,white,white}
773	2	47821	3	2019-10-19 21:09:30.538059	2019-10-19 21:09:30.538059	{yellow,yellow,yellow,white,white}
774	2	88	3	2019-10-19 21:09:50.959545	2019-10-19 21:09:50.959545	{yellow,yellow,yellow,white,white}
775	2	59961	3	2019-10-19 21:11:15.819517	2019-10-19 21:11:15.819517	{yellow,yellow,yellow,white,white}
777	2	578	5	2019-10-19 21:12:16.555433	2019-10-19 21:12:16.555433	{yellow,yellow,yellow,yellow,yellow}
778	2	36586	3	2019-10-19 21:12:19.389475	2019-10-19 21:12:19.389475	{yellow,yellow,yellow,white,white}
779	2	16995	3	2019-10-19 21:12:28.558967	2019-10-19 21:12:28.558967	{yellow,yellow,yellow,white,white}
780	2	7299	3	2019-10-19 21:12:58.1444	2019-10-19 21:12:58.1444	{yellow,yellow,yellow,white,white}
781	2	6278	3	2019-10-19 21:13:04.541216	2019-10-19 21:13:04.541216	{yellow,yellow,yellow,white,white}
782	2	384680	3	2019-10-19 21:13:15.289287	2019-10-19 21:13:15.289287	{yellow,yellow,yellow,white,white}
784	2	45317	4	2019-10-19 21:13:30.689979	2019-10-19 21:13:30.689979	{yellow,yellow,yellow,yellow,white}
785	2	6114	3	2019-10-19 21:14:24.153043	2019-10-19 21:14:24.153043	{yellow,yellow,yellow,white,white}
786	2	20504	3	2019-10-19 21:14:45.619638	2019-10-19 21:14:45.619638	{yellow,yellow,yellow,white,white}
787	2	399404	3	2019-10-19 21:14:56.155025	2019-10-19 21:14:56.155025	{yellow,yellow,yellow,white,white}
788	2	1662	3	2019-10-19 21:14:59.938029	2019-10-19 21:14:59.938029	{yellow,yellow,yellow,white,white}
789	2	97020	3	2019-10-19 21:15:13.451044	2019-10-19 21:15:13.451044	{yellow,yellow,yellow,white,white}
790	2	8438	3	2019-10-19 21:15:25.051742	2019-10-19 21:16:42.307042	{yellow,yellow,yellow,white,white}
791	2	276907	3	2019-10-19 21:17:26.30224	2019-10-19 21:17:26.30224	{yellow,yellow,yellow,white,white}
792	2	13809	3	2019-10-19 21:17:54.20467	2019-10-19 21:17:54.20467	{yellow,yellow,yellow,white,white}
793	2	855	5	2019-10-19 21:18:09.497068	2019-10-19 21:18:09.497068	{yellow,yellow,yellow,yellow,yellow}
794	2	38199	3	2019-10-19 21:19:33.640644	2019-10-19 21:19:33.640644	{yellow,yellow,yellow,white,white}
795	2	13252	3	2019-10-19 21:19:38.65723	2019-10-19 21:19:38.65723	{yellow,yellow,yellow,white,white}
796	2	36955	3	2019-10-19 21:20:55.623724	2019-10-19 21:20:55.623724	{yellow,yellow,yellow,white,white}
797	2	3595	3	2019-10-19 21:21:30.933192	2019-10-19 21:21:30.933192	{yellow,yellow,yellow,white,white}
798	2	9802	3	2019-10-19 21:21:35.355815	2019-10-19 21:21:35.355815	{yellow,yellow,yellow,white,white}
799	2	27576	3	2019-10-19 21:21:39.362	2019-10-19 21:21:39.362	{yellow,yellow,yellow,white,white}
800	2	294254	3	2019-10-19 21:21:44.230551	2019-10-19 21:21:44.230551	{yellow,yellow,yellow,white,white}
801	2	402	4	2019-10-19 21:22:17.39537	2019-10-19 21:22:17.39537	{yellow,yellow,yellow,yellow,white}
802	2	31867	3	2019-10-19 21:23:22.47292	2019-10-19 21:23:22.47292	{yellow,yellow,yellow,white,white}
803	2	95	3	2019-10-19 21:31:20.844962	2019-10-19 21:31:20.844962	{yellow,yellow,yellow,white,white}
804	2	187	3	2019-10-19 21:31:23.922168	2019-10-19 21:31:23.922168	{yellow,yellow,yellow,white,white}
805	2	4244	3	2019-10-19 21:31:51.647291	2019-10-19 21:31:51.647291	{yellow,yellow,yellow,white,white}
806	2	4824	3	2019-10-19 21:31:59.184065	2019-10-19 21:31:59.184065	{yellow,yellow,yellow,white,white}
807	2	8838	3	2019-10-19 21:32:03.545995	2019-10-19 21:32:03.545995	{yellow,yellow,yellow,white,white}
808	2	7457	4	2019-10-19 21:32:07.69584	2019-10-19 21:32:07.69584	{yellow,yellow,yellow,yellow,white}
809	2	11549	3	2019-10-20 00:45:12.411531	2019-10-20 00:45:12.411531	{yellow,yellow,yellow,white,white}
810	2	59967	3	2019-10-20 01:01:43.180912	2019-10-20 01:01:43.180912	{yellow,yellow,yellow,white,white}
811	2	861	5	2019-10-20 01:09:43.140568	2019-10-20 01:09:43.140568	{yellow,yellow,yellow,yellow,yellow}
812	2	9620	2	2019-10-20 01:09:48.117554	2019-10-20 01:09:48.117554	{yellow,yellow,white,white,white}
813	2	188927	3	2019-10-20 01:10:11.686033	2019-10-20 01:10:11.686033	{yellow,yellow,yellow,white,white}
783	2	10419	4	2019-10-19 21:13:22.700329	2020-02-02 19:46:01.731902	{yellow,yellow,yellow,yellow,white}
776	2	49040	4	2019-10-19 21:11:18.628439	2021-11-28 20:24:09.522161	{yellow,yellow,yellow,yellow,white}
1273	2	12509	4	2022-06-22 22:44:16.210623	2022-06-22 22:44:16.210623	{yellow,yellow,yellow,yellow,white}
1274	2	2756	5	2022-06-22 22:44:29.38383	2022-06-22 22:44:29.38383	{yellow,yellow,yellow,yellow,yellow}
814	2	415	1	2019-10-20 01:10:38.616739	2019-10-20 01:10:38.616739	{yellow,white,white,white,white}
815	2	9804	3	2019-10-20 01:10:44.627526	2019-10-20 01:10:44.627526	{yellow,yellow,yellow,white,white}
816	12	271715	4	2019-10-20 02:03:42.643555	2019-10-20 02:03:42.643555	{yellow,yellow,yellow,yellow,white}
817	2	17622	4	2019-10-20 05:54:08.57533	2019-10-20 05:54:08.57533	{yellow,yellow,yellow,yellow,white}
818	2	356305	3	2019-10-20 05:54:46.503555	2019-10-20 05:54:46.503555	{yellow,yellow,yellow,white,white}
819	2	50348	3	2019-10-20 05:55:16.986997	2019-10-20 05:55:16.986997	{yellow,yellow,yellow,white,white}
820	15	429617	5	2019-10-21 05:41:22.218695	2019-10-21 05:41:22.218695	{yellow,yellow,yellow,yellow,yellow}
821	15	559969	5	2019-10-21 05:41:27.291206	2019-10-21 05:41:27.291206	{yellow,yellow,yellow,yellow,yellow}
822	15	475557	5	2019-10-21 05:41:31.755511	2019-10-21 05:41:31.755511	{yellow,yellow,yellow,yellow,yellow}
823	15	299534	5	2019-10-21 05:41:35.630783	2019-10-21 05:41:35.630783	{yellow,yellow,yellow,yellow,yellow}
824	15	458156	5	2019-10-21 05:41:38.533171	2019-10-21 05:41:38.533171	{yellow,yellow,yellow,yellow,yellow}
825	15	479455	5	2019-10-21 05:41:44.149128	2019-10-21 05:41:44.149128	{yellow,yellow,yellow,yellow,yellow}
826	2	15801	3	2019-10-24 21:20:19.737493	2019-10-24 21:20:19.737493	{yellow,yellow,yellow,white,white}
827	2	21755	3	2019-10-24 21:20:32.578539	2019-10-24 21:20:32.578539	{yellow,yellow,yellow,white,white}
828	2	35056	3	2019-10-24 21:21:07.971577	2019-10-24 21:21:07.971577	{yellow,yellow,yellow,white,white}
1275	2	8986	3	2022-06-22 22:44:50.029572	2022-06-22 22:44:50.029572	{yellow,yellow,yellow,white,white}
830	2	22267	3	2019-10-24 21:21:18.607216	2019-10-24 21:21:18.607216	{yellow,yellow,yellow,white,white}
831	17	429617	4	2019-10-25 13:27:38.395801	2019-10-25 13:27:38.395801	{yellow,yellow,yellow,yellow,white}
832	17	299534	4	2019-10-25 13:29:06.36764	2019-10-25 13:29:06.36764	{yellow,yellow,yellow,yellow,white}
833	17	412117	3	2019-10-25 13:29:24.547685	2019-10-25 13:29:24.547685	{yellow,yellow,yellow,white,white}
834	17	181812	5	2019-10-25 13:29:38.15578	2019-10-25 13:29:38.15578	{yellow,yellow,yellow,yellow,yellow}
835	17	299536	3	2019-10-25 13:30:10.437966	2019-10-25 13:30:10.437966	{yellow,yellow,yellow,white,white}
836	17	297802	4	2019-10-25 13:30:21.878765	2019-10-25 13:30:21.878765	{yellow,yellow,yellow,yellow,white}
837	17	299537	5	2019-10-25 13:30:22.426686	2019-10-25 13:30:22.426686	{yellow,yellow,yellow,yellow,yellow}
838	17	287947	5	2019-10-25 13:31:53.71844	2019-10-25 13:31:53.71844	{yellow,yellow,yellow,yellow,yellow}
839	18	429617	4	2019-10-25 13:57:17.40379	2019-10-25 13:57:17.40379	{yellow,yellow,yellow,yellow,white}
840	18	181812	5	2019-10-25 13:57:58.973462	2019-10-25 13:57:58.973462	{yellow,yellow,yellow,yellow,yellow}
841	18	299534	5	2019-10-25 13:58:24.998733	2019-10-25 13:58:24.998733	{yellow,yellow,yellow,yellow,yellow}
842	18	299537	5	2019-10-25 13:58:43.29457	2019-10-25 13:58:43.29457	{yellow,yellow,yellow,yellow,yellow}
843	18	284054	5	2019-10-25 13:58:51.868598	2019-10-25 13:58:51.868598	{yellow,yellow,yellow,yellow,yellow}
844	18	287947	5	2019-10-25 13:59:18.089831	2019-10-25 13:59:18.089831	{yellow,yellow,yellow,yellow,yellow}
845	18	363088	5	2019-10-25 14:00:52.482972	2019-10-25 14:00:52.482972	{yellow,yellow,yellow,yellow,yellow}
846	18	297762	5	2019-10-25 14:00:59.278652	2019-10-25 14:01:01.83222	{yellow,yellow,yellow,yellow,yellow}
847	18	284052	5	2019-10-25 14:01:28.864903	2019-10-25 14:01:28.864903	{yellow,yellow,yellow,yellow,yellow}
848	18	36657	5	2019-10-25 14:02:17.700489	2019-10-25 14:02:17.700489	{yellow,yellow,yellow,yellow,yellow}
849	18	10195	5	2019-10-25 14:03:03.441144	2019-10-25 14:03:03.441144	{yellow,yellow,yellow,yellow,yellow}
850	18	76338	5	2019-10-25 14:04:17.66921	2019-10-25 14:04:17.66921	{yellow,yellow,yellow,yellow,yellow}
851	18	635324	5	2019-10-25 14:05:29.307663	2019-10-25 14:05:29.307663	{yellow,yellow,yellow,yellow,yellow}
852	18	197353	5	2019-10-25 14:05:56.47924	2019-10-25 14:05:56.47924	{yellow,yellow,yellow,yellow,yellow}
853	18	158600	5	2019-10-25 14:06:08.069556	2019-10-25 14:06:08.069556	{yellow,yellow,yellow,yellow,yellow}
854	18	600030	5	2019-10-25 14:06:13.659776	2019-10-25 14:06:13.659776	{yellow,yellow,yellow,yellow,yellow}
855	18	456788	5	2019-10-25 14:06:19.92376	2019-10-25 14:06:19.92376	{yellow,yellow,yellow,yellow,yellow}
856	18	420818	5	2019-10-25 14:06:38.284038	2019-10-25 14:06:38.284038	{yellow,yellow,yellow,yellow,yellow}
859	19	429617	5	2019-10-25 15:06:24.440938	2019-10-25 15:06:24.440938	{yellow,yellow,yellow,yellow,yellow}
860	19	299534	4	2019-10-25 15:06:36.043528	2019-10-25 15:06:36.043528	{yellow,yellow,yellow,yellow,white}
862	19	24428	4	2019-10-25 15:07:34.048453	2019-10-25 15:07:34.048453	{yellow,yellow,yellow,yellow,white}
861	19	99960735	5	2019-10-25 15:06:54.804738	2020-07-26 23:25:55.716008	{yellow,yellow,yellow,yellow,yellow}
857	18	99989247	4	2019-10-25 14:58:30.636139	2020-07-26 23:25:55.966381	{yellow,yellow,yellow,yellow,white}
858	18	99960735	4	2019-10-25 14:58:36.173997	2020-07-26 23:40:21.701095	{yellow,yellow,yellow,yellow,white}
863	19	99861	5	2019-10-25 15:07:43.616221	2019-10-25 15:07:43.616221	{yellow,yellow,yellow,yellow,yellow}
864	19	181812	5	2019-10-25 15:09:00.270082	2019-10-25 15:09:00.270082	{yellow,yellow,yellow,yellow,yellow}
865	19	299536	4	2019-10-25 15:09:27.844666	2019-10-25 15:09:27.844666	{yellow,yellow,yellow,yellow,white}
866	19	299537	5	2019-10-25 15:09:45.073507	2019-10-25 15:09:45.073507	{yellow,yellow,yellow,yellow,yellow}
867	19	297802	5	2019-10-25 15:10:09.36011	2019-10-25 15:10:09.36011	{yellow,yellow,yellow,yellow,yellow}
868	19	287947	5	2019-10-25 15:10:20.757581	2019-10-25 15:10:20.757581	{yellow,yellow,yellow,yellow,yellow}
869	19	181808	5	2019-10-25 15:11:17.025114	2019-10-25 15:11:17.025114	{yellow,yellow,yellow,yellow,yellow}
870	19	284054	5	2019-10-25 15:12:56.181161	2019-10-25 15:12:56.181161	{yellow,yellow,yellow,yellow,yellow}
1276	2	10922	2	2022-06-22 22:45:11.226949	2022-06-22 22:45:11.226949	{yellow,yellow,white,white,white}
881	2	504949	5	2019-11-04 18:24:22.307191	2020-01-19 07:12:31.156587	{yellow,yellow,yellow,yellow,yellow}
1277	2	4771	5	2022-06-22 22:45:56.295883	2022-06-22 22:45:56.295883	{yellow,yellow,yellow,yellow,yellow}
300	2	37165	3	2019-05-27 01:26:51.622164	2022-06-22 22:46:10.455812	{yellow,yellow,yellow,white,white}
1278	2	49527	3	2022-06-22 22:46:15.39062	2022-06-22 22:46:15.39062	{yellow,yellow,yellow,white,white}
873	21	487680	1	2019-10-28 23:39:45.262266	2019-10-28 23:39:45.262266	{yellow,white,white,white,white}
874	2	1551	3	2019-10-31 13:53:12.909865	2019-10-31 13:53:12.909865	{yellow,yellow,yellow,white,white}
875	2	41263	3	2019-10-31 13:53:26.839359	2019-10-31 13:53:26.839359	{yellow,yellow,yellow,white,white}
876	2	10057	2	2019-10-31 13:53:38.292377	2019-10-31 13:53:38.292377	{yellow,yellow,white,white,white}
877	2	9086	4	2019-10-31 13:53:51.28913	2019-10-31 13:53:53.932888	{yellow,yellow,yellow,yellow,white}
878	2	11081	3	2019-10-31 13:56:00.131712	2019-10-31 13:56:00.131712	{yellow,yellow,yellow,white,white}
879	2	13715	2	2019-10-31 13:56:47.042394	2019-10-31 13:56:47.042394	{yellow,yellow,white,white,white}
880	2	10377	4	2019-10-31 15:41:57.824207	2019-10-31 15:41:57.824207	{yellow,yellow,yellow,yellow,white}
882	2	69	3	2019-11-04 18:28:34.121046	2019-11-04 18:28:34.121046	{yellow,yellow,yellow,white,white}
1279	2	59	4	2022-06-22 22:46:19.955747	2022-06-22 22:46:19.955747	{yellow,yellow,yellow,yellow,white}
883	2	177677	3	2019-11-04 18:30:06.814395	2019-11-04 18:30:39.892927	{yellow,yellow,yellow,white,white}
884	22	475557	5	2019-11-05 17:51:43.047452	2019-11-05 17:51:43.047452	{yellow,yellow,yellow,yellow,yellow}
1280	2	9061	3	2022-06-22 22:46:24.208236	2022-06-22 22:46:24.208236	{yellow,yellow,yellow,white,white}
480	2	35588	5	2019-08-19 09:16:45.063248	2019-11-07 03:41:18.086147	{yellow,yellow,yellow,yellow,yellow}
886	2	72976	3	2019-11-16 23:49:11.228337	2019-11-16 23:49:11.228337	{yellow,yellow,yellow,white,white}
887	2	68730	3	2019-11-16 23:49:37.460422	2019-11-16 23:49:37.460422	{yellow,yellow,yellow,white,white}
888	2	783	3	2019-11-16 23:50:13.282401	2019-11-16 23:50:13.282401	{yellow,yellow,yellow,white,white}
889	2	20539	3	2019-11-16 23:50:23.785943	2019-11-16 23:50:23.785943	{yellow,yellow,yellow,white,white}
890	2	7984	4	2019-11-16 23:50:30.849198	2019-11-16 23:50:30.849198	{yellow,yellow,yellow,yellow,white}
891	2	16992	3	2019-11-16 23:50:38.126622	2019-11-16 23:50:38.126622	{yellow,yellow,yellow,white,white}
892	2	2669	4	2019-11-16 23:51:00.76876	2019-11-16 23:51:00.76876	{yellow,yellow,yellow,yellow,white}
893	2	9941	4	2019-11-25 19:02:32.210116	2019-11-25 19:02:32.210116	{yellow,yellow,yellow,yellow,white}
894	2	239571	3	2019-11-25 19:06:33.724287	2019-11-25 19:06:33.724287	{yellow,yellow,yellow,white,white}
895	2	1452	2	2019-11-25 19:06:53.304983	2019-11-25 19:06:53.304983	{yellow,yellow,white,white,white}
896	2	76493	3	2019-11-25 19:08:36.403172	2019-11-25 19:08:36.403172	{yellow,yellow,yellow,white,white}
897	2	8194	3	2019-12-04 03:31:22.374783	2019-12-04 03:31:22.374783	{yellow,yellow,yellow,white,white}
898	2	8373	3	2019-12-04 03:31:26.786132	2019-12-04 03:31:26.786132	{yellow,yellow,yellow,white,white}
899	2	38356	3	2019-12-04 03:31:53.054219	2019-12-04 03:31:53.054219	{yellow,yellow,yellow,white,white}
900	2	217	2	2019-12-04 03:32:28.243497	2019-12-04 03:32:28.243497	{yellow,yellow,white,white,white}
901	2	335988	3	2019-12-04 03:32:47.46559	2019-12-04 03:32:47.46559	{yellow,yellow,yellow,white,white}
902	2	11184	3	2019-12-04 03:34:50.025745	2019-12-04 03:34:51.301348	{yellow,yellow,yellow,white,white}
903	2	4513	5	2019-12-04 03:36:28.315677	2019-12-04 03:36:28.315677	{yellow,yellow,yellow,yellow,yellow}
904	2	9676	3	2019-12-04 03:36:35.244368	2019-12-04 03:36:35.244368	{yellow,yellow,yellow,white,white}
905	2	676	1	2019-12-04 03:36:44.230488	2019-12-04 03:36:44.230488	{yellow,white,white,white,white}
906	2	11543	3	2019-12-04 03:37:51.259723	2019-12-04 03:37:51.259723	{yellow,yellow,yellow,white,white}
907	2	10158	4	2019-12-04 03:38:13.51062	2019-12-04 03:38:13.51062	{yellow,yellow,yellow,yellow,white}
908	2	14905	3	2019-12-04 03:38:20.380147	2019-12-04 03:38:20.380147	{yellow,yellow,yellow,white,white}
909	2	13260	3	2019-12-04 03:38:24.18599	2019-12-04 03:38:24.18599	{yellow,yellow,yellow,white,white}
910	2	3509	3	2019-12-04 03:38:37.470549	2019-12-04 03:38:37.470549	{yellow,yellow,yellow,white,white}
911	2	4478	3	2019-12-04 03:38:41.522941	2019-12-04 03:38:41.522941	{yellow,yellow,yellow,white,white}
912	2	586	3	2019-12-04 03:39:11.422859	2019-12-04 03:39:11.422859	{yellow,yellow,yellow,white,white}
913	2	11821	3	2019-12-04 03:39:14.39821	2019-12-04 03:39:14.39821	{yellow,yellow,yellow,white,white}
914	2	9506	3	2019-12-04 03:39:44.497697	2019-12-04 03:39:44.497697	{yellow,yellow,yellow,white,white}
915	2	6957	5	2019-12-05 16:42:45.188132	2019-12-05 16:42:45.188132	{yellow,yellow,yellow,yellow,yellow}
916	2	179	2	2019-12-05 16:43:17.530942	2019-12-05 16:43:17.530942	{yellow,yellow,white,white,white}
917	2	1607	3	2019-12-05 16:43:51.239465	2019-12-05 16:43:51.239465	{yellow,yellow,yellow,white,white}
919	2	11005	4	2019-12-05 16:43:57.656497	2019-12-05 16:43:57.656497	{yellow,yellow,yellow,yellow,white}
918	2	2749	2	2019-12-05 16:43:54.882695	2019-12-05 16:44:08.798801	{yellow,yellow,white,white,white}
920	2	11371	3	2019-12-05 16:44:19.274229	2019-12-05 16:44:19.274229	{yellow,yellow,yellow,white,white}
921	2	5851	3	2019-12-05 16:44:22.448911	2019-12-05 16:44:22.448911	{yellow,yellow,yellow,white,white}
922	2	11416	3	2019-12-05 16:44:34.362667	2019-12-05 16:44:34.362667	{yellow,yellow,yellow,white,white}
923	2	11978	3	2019-12-05 16:44:38.044873	2019-12-05 16:44:38.044873	{yellow,yellow,yellow,white,white}
924	2	8195	3	2019-12-05 16:44:39.671986	2019-12-05 16:44:39.671986	{yellow,yellow,yellow,white,white}
925	2	9535	3	2019-12-05 16:44:47.640459	2019-12-05 16:44:47.640459	{yellow,yellow,yellow,white,white}
926	2	13536	1	2019-12-05 16:44:52.280231	2019-12-05 16:44:52.280231	{yellow,white,white,white,white}
927	2	10950	3	2019-12-05 16:46:00.549048	2019-12-05 16:46:00.549048	{yellow,yellow,yellow,white,white}
928	2	526	3	2019-12-05 16:46:15.081919	2019-12-05 16:46:15.081919	{yellow,yellow,yellow,white,white}
929	2	859	3	2019-12-05 16:46:20.033764	2019-12-05 16:46:20.033764	{yellow,yellow,yellow,white,white}
930	2	10395	3	2019-12-05 16:46:27.127818	2019-12-05 16:46:33.810475	{yellow,yellow,yellow,white,white}
931	2	399361	3	2019-12-11 14:10:49.198627	2019-12-11 14:10:49.198627	{yellow,yellow,yellow,white,white}
932	2	343668	3	2019-12-11 14:10:54.157164	2019-12-11 14:10:54.157164	{yellow,yellow,yellow,white,white}
933	2	38050	3	2019-12-11 14:10:59.450325	2019-12-11 14:10:59.450325	{yellow,yellow,yellow,white,white}
1281	2	147441	3	2022-06-25 20:10:58.02458	2022-06-25 20:10:58.02458	{yellow,yellow,yellow,white,white}
936	2	1883	3	2019-12-11 14:12:24.707436	2019-12-11 14:12:24.707436	{yellow,yellow,yellow,white,white}
937	2	2116	3	2019-12-11 14:12:28.153884	2019-12-11 14:12:28.153884	{yellow,yellow,yellow,white,white}
938	2	10400	3	2019-12-11 14:12:30.10245	2019-12-11 14:12:30.10245	{yellow,yellow,yellow,white,white}
939	2	7551	2	2019-12-11 14:12:35.090638	2019-12-11 14:12:35.090638	{yellow,yellow,white,white,white}
940	2	10684	4	2019-12-11 14:12:40.620369	2019-12-11 14:12:40.620369	{yellow,yellow,yellow,yellow,white}
941	2	8963	4	2019-12-11 14:12:46.14587	2019-12-11 14:12:46.14587	{yellow,yellow,yellow,yellow,white}
942	2	8470	3	2019-12-11 14:12:48.301449	2019-12-11 14:12:48.301449	{yellow,yellow,yellow,white,white}
943	2	9271	3	2019-12-11 14:12:51.512469	2019-12-11 14:12:51.512469	{yellow,yellow,yellow,white,white}
944	2	9481	3	2019-12-11 14:12:56.349562	2019-12-11 14:12:56.349562	{yellow,yellow,yellow,white,white}
945	2	9546	3	2019-12-11 14:12:59.015469	2019-12-11 14:13:03.330285	{yellow,yellow,yellow,white,white}
946	2	9882	5	2019-12-11 14:13:07.100552	2019-12-11 14:13:07.100552	{yellow,yellow,yellow,yellow,yellow}
947	2	14462	3	2019-12-11 14:13:13.436785	2019-12-11 14:13:13.436785	{yellow,yellow,yellow,white,white}
948	2	9665	5	2019-12-11 14:13:32.437188	2019-12-11 14:13:32.437188	{yellow,yellow,yellow,yellow,yellow}
949	2	333484	3	2019-12-11 14:13:36.668849	2019-12-11 14:13:36.668849	{yellow,yellow,yellow,white,white}
934	2	99980968	4	2019-12-11 14:11:56.056578	2020-07-26 23:25:56.043321	{yellow,yellow,yellow,yellow,white}
935	2	99963351	4	2019-12-11 14:12:01.676607	2020-07-26 23:25:56.057827	{yellow,yellow,yellow,yellow,white}
950	2	87502	3	2019-12-11 14:13:40.531102	2019-12-11 14:13:40.531102	{yellow,yellow,yellow,white,white}
951	2	9800	3	2019-12-11 14:13:46.577027	2019-12-11 14:13:46.577027	{yellow,yellow,yellow,white,white}
952	2	13435	3	2019-12-11 14:13:56.265	2019-12-11 14:13:56.265	{yellow,yellow,yellow,white,white}
953	2	515195	3	2019-12-22 02:30:33.480527	2019-12-22 02:30:33.480527	{yellow,yellow,yellow,white,white}
543	2	1895	3	2019-08-31 23:04:59.727284	2019-12-22 03:34:28.678598	{yellow,yellow,yellow,white,white}
955	2	11850	3	2019-12-22 04:34:32.937277	2019-12-22 04:34:32.937277	{yellow,yellow,yellow,white,white}
956	2	16619	5	2019-12-22 04:34:37.316391	2019-12-22 04:34:37.316391	{yellow,yellow,yellow,yellow,yellow}
957	2	12554	3	2019-12-22 04:35:11.263191	2019-12-22 04:35:11.263191	{yellow,yellow,yellow,white,white}
958	2	12117	3	2019-12-22 04:36:10.024046	2019-12-22 04:36:10.024046	{yellow,yellow,yellow,white,white}
959	2	8676	2	2019-12-22 04:36:15.249421	2019-12-22 04:36:15.249421	{yellow,yellow,white,white,white}
960	2	27582	2	2019-12-22 04:36:23.63666	2019-12-22 04:36:23.63666	{yellow,yellow,white,white,white}
961	2	49494	2	2019-12-22 04:36:39.039702	2019-12-22 04:36:39.039702	{yellow,yellow,white,white,white}
962	2	6950	4	2019-12-22 04:36:54.101477	2019-12-22 04:36:54.101477	{yellow,yellow,yellow,yellow,white}
963	2	9654	3	2019-12-22 04:37:01.825446	2019-12-22 04:37:01.825446	{yellow,yellow,yellow,white,white}
964	2	2289	3	2019-12-22 04:37:11.843924	2019-12-22 04:37:11.843924	{yellow,yellow,yellow,white,white}
829	2	3682	3	2019-10-24 21:21:11.690246	2019-12-24 21:54:13.138082	{yellow,yellow,yellow,white,white}
967	2	99971912	3	2019-12-31 02:37:41.994987	2022-02-27 03:09:08.54408	{yellow,yellow,yellow,white,white}
954	2	463257	4	2019-12-22 02:30:39.6431	2019-12-29 05:46:21.461776	{yellow,yellow,yellow,yellow,white}
966	2	459992	3	2019-12-29 05:46:37.596796	2019-12-29 05:46:37.596796	{yellow,yellow,yellow,white,white}
1282	2	9477	3	2022-06-25 20:12:13.666974	2022-06-25 20:12:13.666974	{yellow,yellow,yellow,white,white}
1283	2	64688	3	2022-06-25 20:15:38.660749	2022-06-25 20:15:38.660749	{yellow,yellow,yellow,white,white}
969	2	398978	3	2019-12-31 04:50:39.816605	2020-04-11 00:35:23.93984	{yellow,yellow,yellow,white,white}
983	2	9991398	4	2020-01-08 19:34:48.373475	2020-07-26 23:25:56.124027	{yellow,yellow,yellow,yellow,white}
971	2	466272	3	2020-01-02 19:04:56.031266	2020-01-02 19:04:56.031266	{yellow,yellow,yellow,white,white}
972	2	2207	3	2020-01-04 05:12:59.082894	2020-01-04 05:12:59.082894	{yellow,yellow,yellow,white,white}
973	2	20544	5	2020-01-04 05:13:06.394556	2020-01-04 05:13:06.394556	{yellow,yellow,yellow,yellow,yellow}
974	2	13996	3	2020-01-04 05:13:13.611613	2020-01-04 05:13:13.611613	{yellow,yellow,yellow,white,white}
975	2	1770	3	2020-01-04 05:13:44.347837	2020-01-04 05:13:44.347837	{yellow,yellow,yellow,white,white}
981	2	9270	4	2020-01-07 08:13:58.16212	2020-01-07 08:13:58.16212	{yellow,yellow,yellow,yellow,white}
984	2	86850	3	2020-01-13 23:04:25.514184	2020-01-13 23:04:25.514184	{yellow,yellow,yellow,white,white}
985	2	9433	4	2020-01-15 00:21:51.483927	2020-01-15 00:21:51.483927	{yellow,yellow,yellow,yellow,white}
986	2	12201	3	2020-01-15 00:22:04.520539	2020-01-15 00:22:04.520539	{yellow,yellow,yellow,white,white}
987	2	941	5	2020-01-15 00:22:12.260844	2020-01-15 00:22:12.260844	{yellow,yellow,yellow,yellow,yellow}
988	2	944	3	2020-01-15 00:22:16.527479	2020-01-15 00:22:16.527479	{yellow,yellow,yellow,white,white}
989	2	943	3	2020-01-15 00:22:19.451377	2020-01-15 00:22:19.451377	{yellow,yellow,yellow,white,white}
990	2	2112	4	2020-01-15 00:22:26.219096	2020-01-15 00:22:26.219096	{yellow,yellow,yellow,yellow,white}
991	2	10264	3	2020-01-15 00:22:29.136477	2020-01-15 00:22:29.136477	{yellow,yellow,yellow,white,white}
965	2	99981532	3	2019-12-28 01:59:23.711654	2020-07-26 23:25:55.920968	{yellow,yellow,yellow,white,white}
970	2	99982856	5	2020-01-02 19:04:53.211183	2020-07-26 23:25:56.027265	{yellow,yellow,yellow,yellow,yellow}
976	2	99969740	4	2020-01-06 20:11:54.284595	2020-07-26 23:25:56.171953	{yellow,yellow,yellow,yellow,white}
977	2	99960059	4	2020-01-06 20:14:08.599529	2020-07-26 23:25:56.187277	{yellow,yellow,yellow,yellow,white}
978	2	9991423	4	2020-01-06 20:15:40.641574	2020-07-26 23:25:56.208702	{yellow,yellow,yellow,yellow,white}
979	2	99919885	5	2020-01-06 20:17:51.804823	2020-07-26 23:25:56.23625	{yellow,yellow,yellow,yellow,yellow}
980	2	99963174	3	2020-01-06 20:20:37.621454	2020-07-26 23:25:56.284126	{yellow,yellow,yellow,white,white}
982	2	99967683	4	2020-01-08 19:34:12.222702	2020-07-26 23:25:56.309313	{yellow,yellow,yellow,yellow,white}
1284	2	361743	4	2022-06-26 22:54:44.792586	2022-06-26 22:54:44.792586	{yellow,yellow,yellow,yellow,white}
993	2	10590	4	2020-01-15 00:22:46.711577	2020-01-15 00:22:46.711577	{yellow,yellow,yellow,yellow,white}
994	2	11856	3	2020-01-15 00:22:51.626615	2020-01-15 00:22:51.626615	{yellow,yellow,yellow,white,white}
995	2	11646	4	2020-01-15 00:22:53.336764	2020-01-15 00:22:53.336764	{yellow,yellow,yellow,yellow,white}
996	2	8834	3	2020-01-15 00:22:56.038174	2020-01-15 00:22:56.038174	{yellow,yellow,yellow,white,white}
997	2	9359	3	2020-01-15 00:22:58.830692	2020-01-15 00:22:58.830692	{yellow,yellow,yellow,white,white}
998	2	9659	2	2020-01-15 00:23:04.494716	2020-01-15 00:23:04.494716	{yellow,yellow,white,white,white}
999	2	50780	3	2020-01-15 00:23:17.15516	2020-01-15 00:23:17.15516	{yellow,yellow,yellow,white,white}
1000	2	381663	3	2020-01-15 00:23:38.7063	2020-01-15 00:23:38.7063	{yellow,yellow,yellow,white,white}
1001	2	2310	3	2020-01-15 00:24:10.672697	2020-01-15 00:24:10.672697	{yellow,yellow,yellow,white,white}
1002	2	11826	3	2020-01-15 00:24:12.632141	2020-01-15 00:24:12.632141	{yellow,yellow,yellow,white,white}
1003	2	10999	3	2020-01-17 14:19:02.961877	2020-01-17 14:19:02.961877	{yellow,yellow,yellow,white,white}
1004	2	865	5	2020-01-17 14:19:02.966079	2020-01-17 14:19:02.966079	{yellow,yellow,yellow,yellow,yellow}
1005	2	2099	3	2020-01-17 14:19:02.964533	2020-01-17 14:19:02.964533	{yellow,yellow,yellow,white,white}
1006	2	8452	3	2020-01-17 14:19:06.07031	2020-01-17 14:19:06.07031	{yellow,yellow,yellow,white,white}
1007	2	9493	4	2020-01-17 14:19:09.676288	2020-01-17 14:19:09.676288	{yellow,yellow,yellow,yellow,white}
1008	2	9593	3	2020-01-17 14:19:13.414496	2020-01-17 14:19:13.414496	{yellow,yellow,yellow,white,white}
1009	2	9884	2	2020-01-17 14:19:19.306749	2020-01-17 14:19:19.306749	{yellow,yellow,white,white,white}
1010	2	951	5	2020-01-17 14:19:47.650404	2020-01-17 14:19:47.650404	{yellow,yellow,yellow,yellow,yellow}
1011	2	11381	5	2020-01-24 02:56:49.323138	2020-01-24 02:56:49.323138	{yellow,yellow,yellow,yellow,yellow}
1012	2	1213	3	2020-01-24 02:57:10.758219	2020-01-24 02:57:10.758219	{yellow,yellow,yellow,white,white}
1013	2	1247	2	2020-01-24 02:57:12.991059	2020-01-24 02:57:12.991059	{yellow,yellow,white,white,white}
1014	2	1792	3	2020-01-24 02:57:15.488682	2020-01-24 02:57:15.488682	{yellow,yellow,yellow,white,white}
1015	2	10220	3	2020-01-24 02:57:17.637467	2020-01-24 02:57:17.637467	{yellow,yellow,yellow,white,white}
1016	2	21355	3	2020-01-24 02:57:25.794966	2020-01-24 02:57:25.794966	{yellow,yellow,yellow,white,white}
1017	2	11323	3	2020-01-24 02:57:36.177648	2020-01-24 02:57:36.177648	{yellow,yellow,yellow,white,white}
1018	2	44603	3	2020-01-24 02:57:49.717158	2020-01-24 02:57:49.717158	{yellow,yellow,yellow,white,white}
1019	2	231	3	2020-01-24 02:58:08.348855	2020-01-24 02:58:08.348855	{yellow,yellow,yellow,white,white}
1020	2	14684	4	2020-01-24 02:58:13.916978	2020-01-24 02:58:13.916978	{yellow,yellow,yellow,yellow,white}
1021	2	8880	4	2020-01-24 02:59:20.098147	2020-01-24 02:59:20.098147	{yellow,yellow,yellow,yellow,white}
1022	2	9319	5	2020-01-24 03:01:38.104107	2020-01-24 03:01:38.104107	{yellow,yellow,yellow,yellow,yellow}
1023	2	9567	3	2020-01-24 03:01:44.486975	2020-01-24 03:01:44.486975	{yellow,yellow,yellow,white,white}
1024	2	19959	2	2020-01-24 03:01:48.898096	2020-01-24 03:01:48.898096	{yellow,yellow,white,white,white}
1025	2	39514	3	2020-01-24 03:01:57.391989	2020-01-24 03:01:57.391989	{yellow,yellow,yellow,white,white}
1026	2	12647	3	2020-01-24 03:02:33.359595	2020-01-24 03:02:33.359595	{yellow,yellow,yellow,white,white}
1027	2	72559	2	2020-01-24 03:02:38.418998	2020-01-24 03:02:38.418998	{yellow,yellow,white,white,white}
1028	2	9494	4	2020-01-24 03:02:51.038854	2020-01-24 03:02:51.038854	{yellow,yellow,yellow,yellow,white}
1029	2	11062	3	2020-01-25 04:31:51.571956	2020-01-25 04:31:51.571956	{yellow,yellow,yellow,white,white}
1030	2	9296	3	2020-01-25 04:32:22.757481	2020-01-25 04:32:22.757481	{yellow,yellow,yellow,white,white}
1031	2	187017	3	2020-01-25 04:33:02.46204	2020-01-25 04:33:02.46204	{yellow,yellow,yellow,white,white}
1032	2	109414	3	2020-01-25 04:33:41.834314	2020-01-25 04:33:41.834314	{yellow,yellow,yellow,white,white}
1033	2	10466	5	2020-01-29 04:01:49.705482	2020-01-29 04:01:49.705482	{yellow,yellow,yellow,yellow,yellow}
1034	2	591	2	2020-01-29 04:02:00.445198	2020-01-29 04:02:00.445198	{yellow,yellow,white,white,white}
1035	2	2280	3	2020-01-29 04:02:07.723643	2020-01-29 04:02:07.723643	{yellow,yellow,yellow,white,white}
1036	2	2565	3	2020-01-29 04:02:14.094399	2020-01-29 04:02:14.094399	{yellow,yellow,yellow,white,white}
1037	2	4147	4	2020-01-29 04:02:20.79259	2020-01-29 04:02:20.79259	{yellow,yellow,yellow,yellow,white}
1038	2	2619	4	2020-01-29 04:02:24.55643	2020-01-29 04:02:24.55643	{yellow,yellow,yellow,yellow,white}
1039	2	11287	3	2020-01-29 04:02:30.562675	2020-01-29 04:02:30.562675	{yellow,yellow,yellow,white,white}
1040	2	11974	3	2020-01-29 04:02:32.758603	2020-01-29 04:02:32.758603	{yellow,yellow,yellow,white,white}
1041	2	6951	3	2020-01-29 04:02:36.959632	2020-01-29 04:02:36.959632	{yellow,yellow,yellow,white,white}
1042	2	6538	3	2020-01-29 04:02:39.917356	2020-01-29 04:02:39.917356	{yellow,yellow,yellow,white,white}
1043	2	9489	3	2020-01-29 04:02:43.956712	2020-01-29 04:02:43.956712	{yellow,yellow,yellow,white,white}
1044	2	9586	3	2020-01-29 04:02:51.098433	2020-01-29 04:02:51.098433	{yellow,yellow,yellow,white,white}
1045	2	10023	4	2020-01-29 04:05:06.41566	2020-01-29 04:05:06.41566	{yellow,yellow,yellow,yellow,white}
1046	2	9952	2	2020-02-02 19:45:42.71518	2020-02-02 19:45:42.71518	{yellow,yellow,white,white,white}
1047	2	43539	3	2020-02-02 19:47:07.714209	2020-02-02 19:47:07.714209	{yellow,yellow,yellow,white,white}
1048	2	290859	4	2020-02-02 22:38:18.520084	2020-02-02 22:38:18.520084	{yellow,yellow,yellow,yellow,white}
1054	2	399170	5	2020-03-21 02:22:53.184452	2022-06-25 20:15:21.360565	{yellow,yellow,yellow,yellow,yellow}
1051	2	475557	4	2020-03-15 20:27:19.072865	2020-03-15 20:27:19.072865	{yellow,yellow,yellow,yellow,white}
450	2	99976479	5	2019-08-16 20:11:14.617341	2022-06-26 22:55:38.86472	{yellow,yellow,yellow,yellow,yellow}
704	2	9798	4	2019-10-18 06:26:45.73584	2020-03-21 02:19:24.402407	{yellow,yellow,yellow,yellow,white}
1053	2	22954	3	2020-03-21 02:20:41.990743	2020-03-21 02:20:41.990743	{yellow,yellow,yellow,white,white}
1055	2	10219	3	2020-03-21 03:32:45.724459	2020-03-21 03:32:45.724459	{yellow,yellow,yellow,white,white}
1056	2	7305	3	2020-03-21 03:32:56.830683	2020-03-21 03:32:56.830683	{yellow,yellow,yellow,white,white}
1057	2	19901	3	2020-03-21 03:33:01.904814	2020-03-21 03:33:01.904814	{yellow,yellow,yellow,white,white}
1058	2	8978	2	2020-03-21 03:33:05.1892	2020-03-21 03:33:05.1892	{yellow,yellow,white,white,white}
1059	2	206487	3	2020-03-21 03:33:13.991775	2020-03-21 03:33:13.991775	{yellow,yellow,yellow,white,white}
1060	2	12227	3	2020-03-21 03:34:11.999657	2020-03-21 03:34:11.999657	{yellow,yellow,yellow,white,white}
1061	2	23908	3	2020-03-21 03:34:36.191862	2020-03-21 03:34:36.191862	{yellow,yellow,yellow,white,white}
1062	2	2788	3	2020-03-21 03:34:40.472207	2020-03-21 03:34:40.472207	{yellow,yellow,yellow,white,white}
1063	2	145066	2	2020-03-21 03:34:51.884446	2020-03-21 03:34:51.884446	{yellow,yellow,white,white,white}
1064	2	11450	4	2020-03-21 03:34:58.98879	2020-03-21 03:34:58.98879	{yellow,yellow,yellow,yellow,white}
1065	2	10544	3	2020-03-21 03:47:23.22262	2020-03-21 03:47:23.22262	{yellow,yellow,yellow,white,white}
1066	2	13813	4	2020-03-21 21:06:13.613237	2020-03-21 21:06:13.613237	{yellow,yellow,yellow,yellow,white}
1067	2	612	3	2020-03-21 21:06:29.312951	2020-03-21 21:06:29.312951	{yellow,yellow,yellow,white,white}
1068	2	49849	3	2020-03-21 21:07:02.704955	2020-03-21 21:07:02.704955	{yellow,yellow,yellow,white,white}
1069	2	1632	3	2020-03-28 02:52:12.405914	2020-03-28 02:52:12.405914	{yellow,yellow,yellow,white,white}
1070	2	2149	1	2020-03-28 02:52:18.421871	2020-03-28 02:52:18.421871	{yellow,white,white,white,white}
1071	2	9331	3	2020-03-28 02:52:29.791953	2020-03-28 02:52:29.791953	{yellow,yellow,yellow,white,white}
1072	2	424694	3	2020-04-04 03:25:00.955276	2020-04-04 03:25:00.955276	{yellow,yellow,yellow,white,white}
1105	2	3536	3	2020-04-10 23:42:02.129317	2020-04-10 23:42:02.129317	{yellow,yellow,yellow,white,white}
1106	2	7364	2	2020-04-10 23:42:24.578634	2020-04-10 23:42:24.578634	{yellow,yellow,white,white,white}
1107	2	12149	5	2020-04-10 23:42:40.123142	2020-04-10 23:42:40.123142	{yellow,yellow,yellow,yellow,yellow}
1108	2	9910	2	2020-04-10 23:43:00.37891	2020-04-10 23:43:00.37891	{yellow,yellow,white,white,white}
1109	2	11831	3	2020-04-10 23:43:08.203539	2020-04-10 23:43:08.203539	{yellow,yellow,yellow,white,white}
1110	2	9571	3	2020-04-10 23:43:31.439953	2020-04-10 23:43:31.439953	{yellow,yellow,yellow,white,white}
1112	2	1266	3	2020-04-11 02:13:13.514563	2020-04-11 02:13:13.514563	{yellow,yellow,yellow,white,white}
1113	2	8923	4	2020-04-11 02:50:56.248708	2020-04-11 02:50:56.248708	{yellow,yellow,yellow,yellow,white}
1114	2	11060	3	2020-04-11 02:51:10.98849	2020-04-11 02:51:10.98849	{yellow,yellow,yellow,white,white}
1115	2	4349	3	2020-04-19 02:54:31.018061	2020-04-19 02:54:31.018061	{yellow,yellow,yellow,white,white}
1116	2	11365	3	2020-04-19 02:56:01.273512	2020-04-19 02:56:01.273512	{yellow,yellow,yellow,white,white}
1117	2	359724	3	2020-04-19 21:20:44.071348	2020-04-19 21:20:44.071348	{yellow,yellow,yellow,white,white}
1118	2	1722	2	2020-04-19 21:22:09.971226	2020-04-19 21:22:09.971226	{yellow,yellow,white,white,white}
1119	2	545609	4	2020-05-17 02:16:14.82146	2020-05-17 02:16:14.82146	{yellow,yellow,yellow,yellow,white}
1120	2	181812	3	2020-05-17 02:16:28.603576	2020-05-17 02:16:28.603576	{yellow,yellow,yellow,white,white}
1049	2	515001	4	2020-03-14 05:08:43.715472	2020-05-17 02:17:13.480378	{yellow,yellow,yellow,yellow,white}
1052	2	99972750	4	2020-03-21 02:17:38.616619	2020-07-26 23:25:56.351739	{yellow,yellow,yellow,yellow,white}
1111	2	9991408	4	2020-04-11 02:12:56.524722	2020-07-26 23:25:56.408401	{yellow,yellow,yellow,yellow,white}
1121	2	530915	3	2020-05-17 02:16:34.107454	2020-05-17 02:16:34.107454	{yellow,yellow,yellow,white,white}
1122	2	522627	3	2020-05-17 02:16:56.711846	2020-05-17 02:16:56.711846	{yellow,yellow,yellow,white,white}
1050	2	546554	4	2020-03-14 05:08:58.249632	2020-05-17 02:17:01.58039	{yellow,yellow,yellow,yellow,white}
1123	2	23483	4	2020-06-21 21:55:05.91511	2020-06-21 21:55:05.91511	{yellow,yellow,yellow,yellow,white}
1124	2	419704	4	2020-06-22 23:06:51.620332	2020-06-22 23:06:51.620332	{yellow,yellow,yellow,yellow,white}
1125	2	414425	3	2020-06-24 01:55:30.191096	2020-06-24 01:55:30.191096	{yellow,yellow,yellow,white,white}
1127	24	547016	4	2020-07-13 05:05:30.533917	2020-07-13 05:05:30.533917	\N
1128	24	516486	3	2020-07-13 05:06:03.341211	2020-07-13 05:06:03.341211	\N
1129	24	99970523	2	2020-07-13 05:06:05.08591	2020-07-13 05:06:05.08591	\N
1159	2	602211	3	2020-12-13 23:08:33.752486	2021-01-09 19:07:43.781609	{yellow,yellow,yellow,white,white}
1134	2	99982856	3	2020-07-22 00:35:41.481991	2020-07-23 00:19:35.32405	{yellow,yellow,yellow,white,white}
1135	2	10681	2	2020-07-22 00:36:14.481286	2020-07-23 00:19:35.329564	{yellow,yellow,white,white,white}
1136	2	9992316	4	2020-07-22 00:36:21.829474	2020-07-23 00:19:35.336731	{yellow,yellow,yellow,yellow,white}
1137	2	99982104	2	2020-07-22 00:36:35.714499	2020-07-23 00:19:35.342623	{yellow,yellow,white,white,white}
1130	2	74387	3	2020-07-21 22:58:33.028926	2020-07-23 03:25:41.456624	{yellow,yellow,yellow,white,white}
1140	2	99966732	5	2020-07-23 03:37:09.010436	2020-07-23 03:37:09.010436	{yellow,yellow,yellow,yellow,yellow}
1141	2	65	3	2020-07-27 00:11:59.854247	2020-07-27 00:11:59.854247	{yellow,yellow,yellow,white,white}
1144	2	99983125	2	2020-07-27 00:14:21.567977	2020-07-27 00:14:21.567977	{yellow,yellow,white,white,white}
1145	2	246741	4	2020-07-29 18:59:32.587774	2020-07-29 18:59:32.587774	{yellow,yellow,yellow,yellow,white}
1146	2	547016	3	2020-07-29 19:04:06.94222	2020-07-30 23:00:12.883953	{yellow,yellow,yellow,white,white}
1138	2	287689	4	2020-07-23 03:26:01.397324	2020-07-30 23:00:25.621834	{yellow,yellow,yellow,yellow,white}
1153	2	21641	3	2020-07-30 23:04:18.810191	2020-07-30 23:04:18.810191	{yellow,yellow,yellow,white,white}
1154	2	10074	3	2020-09-12 21:35:41.391264	2020-09-12 21:35:41.391264	{yellow,yellow,yellow,white,white}
1155	2	340102	2	2020-12-13 00:26:29.096305	2020-12-13 00:26:29.096305	{yellow,yellow,white,white,white}
1156	2	7	5	2020-12-13 23:06:21.872216	2020-12-13 23:06:21.872216	{yellow,yellow,yellow,yellow,yellow}
1157	2	8	5	2020-12-13 23:06:33.076973	2020-12-13 23:06:33.076973	{yellow,yellow,yellow,yellow,yellow}
1158	2	9	5	2020-12-13 23:06:37.275977	2020-12-13 23:06:37.275977	{yellow,yellow,yellow,yellow,yellow}
1160	2	11780	5	2020-12-13 23:34:43.795623	2020-12-13 23:34:43.795623	{yellow,yellow,yellow,yellow,yellow}
1161	2	8681	4	2020-12-13 23:34:46.940594	2020-12-13 23:34:46.940594	{yellow,yellow,yellow,yellow,white}
1162	2	9556	3	2020-12-13 23:35:03.100251	2020-12-13 23:35:03.100251	{yellow,yellow,yellow,white,white}
1163	2	82675	3	2020-12-13 23:35:19.600962	2020-12-13 23:35:19.600962	{yellow,yellow,yellow,white,white}
1164	2	18823	3	2020-12-13 23:35:43.188933	2020-12-13 23:35:43.188933	{yellow,yellow,yellow,white,white}
1165	2	57165	3	2020-12-13 23:35:46.2158	2020-12-13 23:35:46.2158	{yellow,yellow,yellow,white,white}
992	2	10502	4	2020-01-15 00:22:41.537452	2020-12-13 23:37:14.76038	{yellow,yellow,yellow,yellow,white}
1166	2	34851	3	2020-12-16 05:43:24.593044	2020-12-16 05:43:24.593044	{yellow,yellow,yellow,white,white}
1167	2	438145	3	2021-01-15 05:08:14.818053	2021-01-15 05:08:14.818053	{yellow,yellow,yellow,white,white}
1168	2	625568	3	2021-01-15 05:10:18.744329	2021-01-15 05:10:18.744329	{yellow,yellow,yellow,white,white}
1169	2	9991396	5	2021-01-15 05:11:24.790455	2021-01-15 05:11:24.790455	{yellow,yellow,yellow,yellow,yellow}
1170	2	9993322	5	2021-01-15 05:11:48.791332	2021-01-15 05:11:48.791332	{yellow,yellow,yellow,yellow,yellow}
1171	2	464052	3	2021-01-16 00:01:25.326207	2021-01-16 00:01:25.326207	{yellow,yellow,yellow,white,white}
1172	2	551332	3	2021-01-16 00:04:51.491395	2021-01-16 00:04:51.491395	{yellow,yellow,yellow,white,white}
1173	2	259695	3	2021-05-02 01:56:53.615821	2021-05-02 01:56:53.615821	{yellow,yellow,yellow,white,white}
1174	2	11120	5	2021-05-02 04:28:41.422191	2021-05-02 04:28:41.422191	{yellow,yellow,yellow,yellow,yellow}
1177	2	10360	2	2021-05-23 03:31:29.661528	2021-05-23 03:31:30.948305	{yellow,yellow,white,white,white}
1175	2	335778	3	2021-05-23 03:30:27.277449	2022-05-14 03:25:59.922458	{yellow,yellow,yellow,white,white}
1176	2	23759	3	2021-05-23 03:31:22.566636	2022-05-14 03:26:04.153226	{yellow,yellow,yellow,white,white}
1285	2	99992830	4	2022-07-01 07:07:05.329082	2022-07-01 07:07:05.329082	{yellow,yellow,yellow,yellow,white}
968	2	99963639	4	2019-12-31 02:37:52.982251	2022-07-02 22:13:17.289545	{yellow,yellow,yellow,yellow,white}
435	2	24	3	2019-07-31 17:46:51.736838	2022-07-03 00:42:18.378743	{yellow,yellow,yellow,white,white}
1286	2	99952814	4	2022-07-04 05:11:04.58358	2022-07-04 05:11:04.58358	{yellow,yellow,yellow,yellow,white}
1287	2	453395	3	2022-07-15 21:24:53.093988	2022-07-15 21:24:53.093988	{yellow,yellow,yellow,white,white}
1288	2	99993716	4	2022-07-23 02:32:00.967626	2022-07-23 02:32:00.967626	{yellow,yellow,yellow,yellow,white}
1289	2	725201	4	2022-07-30 20:40:06.152979	2022-07-30 20:40:06.152979	{yellow,yellow,yellow,yellow,white}
1291	2	50646	4	2022-08-13 03:17:18.339709	2022-08-13 03:17:18.339709	{yellow,yellow,yellow,yellow,white}
1292	2	766507	4	2022-08-16 03:21:41.527485	2022-08-16 03:21:41.527485	{yellow,yellow,yellow,yellow,white}
1293	2	505026	3	2022-08-19 16:38:47.595846	2022-08-19 16:38:47.595846	{yellow,yellow,yellow,white,white}
1294	2	99990802	4	2022-08-29 05:31:59.036723	2022-08-29 05:31:59.036723	{yellow,yellow,yellow,yellow,white}
1295	2	616651	4	2022-09-03 22:49:18.027568	2022-09-03 22:49:18.027568	{yellow,yellow,yellow,yellow,white}
1296	2	999155537	4	2022-09-19 22:33:22.494073	2022-09-19 22:33:22.494073	{yellow,yellow,yellow,yellow,white}
1297	2	698948	5	2022-09-21 21:13:43.288615	2022-09-21 21:13:43.288615	{yellow,yellow,yellow,yellow,yellow}
1298	2	99988329	3	2022-09-21 21:14:28.769552	2022-09-21 21:14:28.769552	{yellow,yellow,yellow,white,white}
1299	2	209403	4	2022-09-25 00:42:40.695063	2022-09-25 00:42:40.695063	{yellow,yellow,yellow,yellow,white}
1300	2	913	4	2022-09-25 00:44:00.976873	2022-09-25 00:44:00.976873	{yellow,yellow,yellow,yellow,white}
1301	2	99992783	3	2022-10-19 23:01:30.137505	2022-10-19 23:01:30.137505	{yellow,yellow,yellow,white,white}
1290	2	799876	4	2022-08-12 19:08:03.644581	2022-10-19 23:10:51.151898	{yellow,yellow,yellow,yellow,white}
1302	2	99960574	5	2022-10-26 22:04:49.306784	2022-10-26 22:04:49.306784	{yellow,yellow,yellow,yellow,yellow}
1303	2	99994997	4	2022-10-28 03:52:28.799068	2022-10-28 03:52:35.742755	{yellow,yellow,yellow,yellow,white}
71	2	787	2	2019-04-06 04:15:21.366904	2022-10-28 04:27:04.826705	{yellow,yellow,white,white,white}
125	2	4922	2	2019-04-23 07:18:04.185547	2022-10-28 04:27:19.826751	{yellow,yellow,white,white,white}
1304	2	999124067	4	2022-10-28 22:07:49.59523	2022-10-28 22:07:49.59523	{yellow,yellow,yellow,yellow,white}
1305	2	1669	4	2022-10-28 22:25:54.916434	2022-10-28 22:25:58.046328	{yellow,yellow,yellow,yellow,white}
1306	2	2246	4	2022-10-28 22:26:26.912523	2022-10-28 22:26:26.912523	{yellow,yellow,yellow,yellow,white}
1307	2	2087	3	2022-10-28 22:26:30.405895	2022-10-28 22:26:30.405895	{yellow,yellow,yellow,white,white}
1308	2	7552	3	2022-10-28 22:27:03.008285	2022-10-28 22:27:03.008285	{yellow,yellow,yellow,white,white}
1309	2	756999	3	2022-11-02 14:40:07.213479	2022-11-02 14:40:07.213479	{yellow,yellow,yellow,white,white}
1310	2	9894	3	2022-11-02 14:59:02.34043	2022-11-02 14:59:02.34043	{yellow,yellow,yellow,white,white}
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: hmbsjvszjwjnui
--

COPY "public"."schema_migrations" ("version") FROM stdin;
20181129035016
20181210220700
20181210221652
20181211160419
20181211162216
20190102223126
20190110213658
20190110220645
20190304205012
20190304210722
20190819141308
20190822030450
20190911223400
20200629034941
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hmbsjvszjwjnui
--

COPY "public"."users" ("id", "first_name", "last_name", "username", "email", "password_digest", "created_at", "updated_at", "role") FROM stdin;
1	Benedict	Daly	Bendaly	dalybenedict@hotmail.com	$2a$10$Ek79lWcagA7ZZs2Ep8WKkeJC2zDpquDC8a4tKgPvVJIYm1j1ZabX2	2019-03-08 21:00:07.035928	2019-03-08 21:00:07.035928	0
5	\N	\N	Joan Daly	joanmdaly@comcast.net	$2a$10$fRoYEjVg2M.w7Z6QSX4KzOoob0hXfsSZC6VY.bs8QAaz/wJGLXMX6	2019-05-10 17:33:05.652739	2019-05-10 17:33:05.652739	0
25	Peggy	Defren	nagua10	defren@comcast.com	$2a$12$/E5HP36mIlG6zwLGsxOxEeGsqzfz.uB1ZOWJdO2DUw/.rXE6/Lvhm	2022-03-06 01:37:53.997173	2022-03-06 01:37:53.997173	0
2	\N	\N	testuser	testuser@email.com	$2a$10$7jyrwwvNUWhSp7MEfegLO.MD.3WVuD3wJQ3QXgjKSvope/ZMpdqWy	2019-03-08 21:07:39.001588	2019-09-16 19:41:28.529437	1
12	Matthew	Daly	dnutsnd	mattdaly7@yahoo.com	$2a$12$uptnXahGqe4pc2k0rPQDhOcd0gVkoUc8EpjQwk5TWG.NThWfKoU9S	2019-10-20 01:50:30.015175	2019-10-20 01:50:30.015175	0
17	Max	Dukowicz	Maxceltics.com	27.maxwell.dukowicz@carolinaday.com	$2a$12$iGAFLRItFymM5ux/hQyoAOE0lgJGViKIryex6Mzrvi8u.RjVn1DeK	2019-10-25 13:27:01.371954	2019-10-25 13:27:01.371954	0
18	Max	Dukowicz	Maxceltics.com	27.maxwell.dukowicz@carolinaday.org	$2a$12$MsHb.GxpDgBtBYhSCfghRu27L3MaWzOWOPIJ2EfYpdXeUQJycxdSS	2019-10-25 13:56:34.268576	2019-10-25 13:56:34.268576	0
19	Jennifer	Dukowicz	Jdaly8	jdaly8@yahoo.com	$2a$12$fmiQKTHhSj23i1BL2NC1yebZmFI4hejzDtUxet3dSIISxtmQUz/Oy	2019-10-25 15:05:14.272204	2019-10-25 15:05:14.272204	0
20	Ellie 	Dukowicz	edukowicz	adukowicz@yahoo.com	$2a$12$xX.MhOOJAdigF.IVtF6DmeOtnsHLPTXbZ/qWdjMAQeJFheVYy8wai	2019-10-25 16:12:18.140317	2019-10-25 16:12:18.140317	0
21	Peggy	Defren	Defren	defren@comcast.net	$2a$12$7KwFzBZz9Tik8NU7jXmBp.C1cLSx0KM5Si0TUK35HhhlmKHLvhI46	2019-10-27 20:42:13.585641	2019-10-27 20:42:13.585641	0
22	Test	Tester	tester1	test@test.com	$2a$12$8.3UqWlMLJxuMX90D5zWMOtCLU/O8WY0DpBtP7dy8ecnVvNWiMmcy	2019-11-05 17:51:20.695337	2019-11-05 17:51:20.695337	0
26	\N	\N	testuser500	testuser500@email.com	$2a$12$yJ44ZLxJrzYeuEbVGCtpLOBVyLipvw2HT6.8SxCjAjio89Cltg0Gq	2022-09-27 21:29:58.475803	2022-09-27 21:29:58.475803	0
\.


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmbsjvszjwjnui
--

SELECT pg_catalog.setval('"public"."movies_id_seq"', 9, true);


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmbsjvszjwjnui
--

SELECT pg_catalog.setval('"public"."playlists_id_seq"', 83, true);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmbsjvszjwjnui
--

SELECT pg_catalog.setval('"public"."ratings_id_seq"', 1310, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmbsjvszjwjnui
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 26, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."ar_internal_metadata"
    ADD CONSTRAINT "ar_internal_metadata_pkey" PRIMARY KEY ("key");


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."movies"
    ADD CONSTRAINT "movies_pkey" PRIMARY KEY ("id");


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."playlists"
    ADD CONSTRAINT "playlists_pkey" PRIMARY KEY ("id");


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."ratings"
    ADD CONSTRAINT "ratings_pkey" PRIMARY KEY ("id");


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: hmbsjvszjwjnui
--

ALTER TABLE ONLY "public"."users"
    ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


--
-- Name: index_movies_playlists_on_movie_id_and_playlist_id; Type: INDEX; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE INDEX "index_movies_playlists_on_movie_id_and_playlist_id" ON "public"."movies_playlists" USING "btree" ("movie_id", "playlist_id");


--
-- Name: index_movies_playlists_on_playlist_id_and_movie_id; Type: INDEX; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE INDEX "index_movies_playlists_on_playlist_id_and_movie_id" ON "public"."movies_playlists" USING "btree" ("playlist_id", "movie_id");


--
-- Name: index_playlists_on_user_id; Type: INDEX; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE INDEX "index_playlists_on_user_id" ON "public"."playlists" USING "btree" ("user_id");


--
-- Name: index_ratings_on_movie_id; Type: INDEX; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE INDEX "index_ratings_on_movie_id" ON "public"."ratings" USING "btree" ("movie_id");


--
-- Name: index_ratings_on_user_id; Type: INDEX; Schema: public; Owner: hmbsjvszjwjnui
--

CREATE INDEX "index_ratings_on_user_id" ON "public"."ratings" USING "btree" ("user_id");


--
-- PostgreSQL database dump complete
--

