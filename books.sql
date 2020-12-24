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
-- Name: app_library_book; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_library_book (
    id integer NOT NULL,
    author character varying(50),
    country character varying(50),
    imagelink character varying(100) NOT NULL,
    language character varying(50),
    link character varying(200),
    pages integer NOT NULL,
    title character varying(100) NOT NULL,
    year integer
);


--
-- Name: app_library_book_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.app_library_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_library_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.app_library_book_id_seq OWNED BY public.app_library_book.id;


--
-- Name: app_library_userprofile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_library_userprofile (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    phone_number character varying(17) NOT NULL,
    user_id integer NOT NULL,
    user_books text
);


--
-- Name: app_library_userprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.app_library_userprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_library_userprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.app_library_userprofile_id_seq OWNED BY public.app_library_userprofile.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: app_library_book id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_library_book ALTER COLUMN id SET DEFAULT nextval('public.app_library_book_id_seq'::regclass);


--
-- Name: app_library_userprofile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_library_userprofile ALTER COLUMN id SET DEFAULT nextval('public.app_library_userprofile_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: app_library_book; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_library_book (id, author, country, imagelink, language, link, pages, title, year) FROM stdin;
1	Chinua Achebe	Nigeria	images/things-fall-apart.jpg	English	https://en.wikipedia.org/wiki/Things_Fall_Apart\n	209	Things Fall Apart	1958
2	Hans Christian Andersen	Denmark	images/fairy-tales.jpg	Danish	https://en.wikipedia.org/wiki/Fairy_Tales_Told_for_Children._First_Collection.\n	784	Fairy tales	1836
3	Dante Alighieri	Italy	images/the-divine-comedy.jpg	Italian	https://en.wikipedia.org/wiki/Divine_Comedy\n	928	The Divine Comedy	1315
4	Unknown	Sumer and Akkadian Empire	images/the-epic-of-gilgamesh.jpg	Akkadian	https://en.wikipedia.org/wiki/Epic_of_Gilgamesh\n	160	The Epic Of Gilgamesh	-1700
5	Unknown	Achaemenid Empire	images/the-book-of-job.jpg	Hebrew	https://en.wikipedia.org/wiki/Book_of_Job\n	176	The Book Of Job	-600
6	Unknown	India/Iran/Iraq/Egypt/Tajikistan	images/one-thousand-and-one-nights.jpg	Arabic	https://en.wikipedia.org/wiki/One_Thousand_and_One_Nights\n	288	One Thousand and One Nights	1200
7	Unknown	Iceland	images/njals-saga.jpg	Old Norse	https://en.wikipedia.org/wiki/Nj%C3%A1ls_saga\n	384	Njál's Saga	1350
8	Jane Austen	United Kingdom	images/pride-and-prejudice.jpg	English	https://en.wikipedia.org/wiki/Pride_and_Prejudice\n	226	Pride and Prejudice	1813
9	Honoré de Balzac	France	images/le-pere-goriot.jpg	French	https://en.wikipedia.org/wiki/Le_P%C3%A8re_Goriot\n	443	Le Père Goriot	1835
10	Samuel Beckett	Republic of Ireland	images/molloy-malone-dies-the-unnamable.jpg	French, English	https://en.wikipedia.org/wiki/Molloy_(novel)\n	256	Molloy, Malone Dies, The Unnamable, the trilogy	1952
11	Giovanni Boccaccio	Italy	images/the-decameron.jpg	Italian	https://en.wikipedia.org/wiki/The_Decameron\n	1024	The Decameron	1351
12	Jorge Luis Borges	Argentina	images/ficciones.jpg	Spanish	https://en.wikipedia.org/wiki/Ficciones\n	224	Ficciones	1965
13	Emily Brontë	United Kingdom	images/wuthering-heights.jpg	English	https://en.wikipedia.org/wiki/Wuthering_Heights\n	342	Wuthering Heights	1847
14	Albert Camus	Algeria, French Empire	images/l-etranger.jpg	French	https://en.wikipedia.org/wiki/The_Stranger_(novel)\n	185	The Stranger	1942
15	Paul Celan	Romania, France	images/poems-paul-celan.jpg	German	\n	320	Poems	1952
16	Louis-Ferdinand Céline	France	images/voyage-au-bout-de-la-nuit.jpg	French	https://en.wikipedia.org/wiki/Journey_to_the_End_of_the_Night\n	505	Journey to the End of the Night	1932
17	Miguel de Cervantes	Spain	images/don-quijote-de-la-mancha.jpg	Spanish	https://en.wikipedia.org/wiki/Don_Quixote\n	1056	Don Quijote De La Mancha	1610
18	Geoffrey Chaucer	England	images/the-canterbury-tales.jpg	English	https://en.wikipedia.org/wiki/The_Canterbury_Tales\n	544	The Canterbury Tales	1450
19	Anton Chekhov	Russia	images/stories-of-anton-chekhov.jpg	Russian	https://en.wikipedia.org/wiki/List_of_short_stories_by_Anton_Chekhov\n	194	Stories	1886
20	Joseph Conrad	United Kingdom	images/nostromo.jpg	English	https://en.wikipedia.org/wiki/Nostromo\n	320	Nostromo	1904
21	Charles Dickens	United Kingdom	images/great-expectations.jpg	English	https://en.wikipedia.org/wiki/Great_Expectations\n	194	Great Expectations	1861
22	Denis Diderot	France	images/jacques-the-fatalist.jpg	French	https://en.wikipedia.org/wiki/Jacques_the_Fatalist\n	596	Jacques the Fatalist	1796
23	Alfred Döblin	Germany	images/berlin-alexanderplatz.jpg	German	https://en.wikipedia.org/wiki/Berlin_Alexanderplatz\n	600	Berlin Alexanderplatz	1929
24	Fyodor Dostoevsky	Russia	images/crime-and-punishment.jpg	Russian	https://en.wikipedia.org/wiki/Crime_and_Punishment\n	551	Crime and Punishment	1866
25	Fyodor Dostoevsky	Russia	images/the-idiot.jpg	Russian	https://en.wikipedia.org/wiki/The_Idiot\n	656	The Idiot	1869
26	Fyodor Dostoevsky	Russia	images/the-possessed.jpg	Russian	https://en.wikipedia.org/wiki/Demons_(Dostoyevsky_novel)\n	768	The Possessed	1872
27	Fyodor Dostoevsky	Russia	images/the-brothers-karamazov.jpg	Russian	https://en.wikipedia.org/wiki/The_Brothers_Karamazov\n	824	The Brothers Karamazov	1880
28	George Eliot	United Kingdom	images/middlemarch.jpg	English	https://en.wikipedia.org/wiki/Middlemarch\n	800	Middlemarch	1871
29	Ralph Ellison	United States	images/invisible-man.jpg	English	https://en.wikipedia.org/wiki/Invisible_Man\n	581	Invisible Man	1952
30	Euripides	Greece	images/medea.jpg	Greek	https://en.wikipedia.org/wiki/Medea_(play)\n	104	Medea	-431
31	William Faulkner	United States	images/absalom-absalom.jpg	English	https://en.wikipedia.org/wiki/Absalom,_Absalom!\n	313	Absalom, Absalom!	1936
32	William Faulkner	United States	images/the-sound-and-the-fury.jpg	English	https://en.wikipedia.org/wiki/The_Sound_and_the_Fury\n	326	The Sound and the Fury	1929
33	Gustave Flaubert	France	images/madame-bovary.jpg	French	https://en.wikipedia.org/wiki/Madame_Bovary\n	528	Madame Bovary	1857
34	Gustave Flaubert	France	images/l-education-sentimentale.jpg	French	https://en.wikipedia.org/wiki/Sentimental_Education\n	606	Sentimental Education	1869
35	Federico García Lorca	Spain	images/gypsy-ballads.jpg	Spanish	https://en.wikipedia.org/wiki/Gypsy_Ballads\n	218	Gypsy Ballads	1928
36	Gabriel García Márquez	Colombia	images/one-hundred-years-of-solitude.jpg	Spanish	https://en.wikipedia.org/wiki/One_Hundred_Years_of_Solitude\n	417	One Hundred Years of Solitude	1967
37	Gabriel García Márquez	Colombia	images/love-in-the-time-of-cholera.jpg	Spanish	https://en.wikipedia.org/wiki/Love_in_the_Time_of_Cholera\n	368	Love in the Time of Cholera	1985
38	Johann Wolfgang von Goethe	Saxe-Weimar	images/faust.jpg	German	https://en.wikipedia.org/wiki/Goethe%27s_Faust\n	158	Faust	1832
39	Nikolai Gogol	Russia	images/dead-souls.jpg	Russian	https://en.wikipedia.org/wiki/Dead_Souls\n	432	Dead Souls	1842
40	Günter Grass	Germany	images/the-tin-drum.jpg	German	https://en.wikipedia.org/wiki/The_Tin_Drum\n	600	The Tin Drum	1959
41	João Guimarães Rosa	Brazil	images/the-devil-to-pay-in-the-backlands.jpg	Portuguese	https://en.wikipedia.org/wiki/The_Devil_to_Pay_in_the_Backlands\n	494	The Devil to Pay in the Backlands	1956
42	Knut Hamsun	Norway	images/hunger.jpg	Norwegian	https://en.wikipedia.org/wiki/Hunger_(Hamsun_novel)\n	176	Hunger	1890
43	Ernest Hemingway	United States	images/the-old-man-and-the-sea.jpg	English	https://en.wikipedia.org/wiki/The_Old_Man_and_the_Sea\n	128	The Old Man and the Sea	1952
44	Homer	Greece	images/the-iliad-of-homer.jpg	Greek	https://en.wikipedia.org/wiki/Iliad\n	608	Iliad	-735
45	Homer	Greece	images/the-odyssey-of-homer.jpg	Greek	https://en.wikipedia.org/wiki/Odyssey\n	374	Odyssey	-800
46	Henrik Ibsen	Norway	images/a-Dolls-house.jpg	Norwegian	https://en.wikipedia.org/wiki/A_Doll%27s_House\n	68	A Doll's House	1879
47	James Joyce	Irish Free State	images/ulysses.jpg	English	https://en.wikipedia.org/wiki/Ulysses_(novel)\n	228	Ulysses	1922
48	Franz Kafka	Czechoslovakia	images/stories-of-franz-kafka.jpg	German	https://en.wikipedia.org/wiki/Franz_Kafka_bibliography#Short_stories\n	488	Stories	1924
49	Franz Kafka	Czechoslovakia	images/the-trial.jpg	German	https://en.wikipedia.org/wiki/The_Trial\n	160	The Trial	1925
50	Franz Kafka	Czechoslovakia	images/the-castle.jpg	German	https://en.wikipedia.org/wiki/The_Castle_(novel)\n	352	The Castle	1926
51	Kālidāsa	India	images/the-recognition-of-shakuntala.jpg	Sanskrit	https://en.wikipedia.org/wiki/Abhij%C3%B1%C4%81na%C5%9B%C4%81kuntalam\n	147	The recognition of Shakuntala	150
52	Yasunari Kawabata	Japan	images/the-sound-of-the-mountain.jpg	Japanese	https://en.wikipedia.org/wiki/The_Sound_of_the_Mountain\n	288	The Sound of the Mountain	1954
53	Nikos Kazantzakis	Greece	images/zorba-the-greek.jpg	Greek	https://en.wikipedia.org/wiki/Zorba_the_Greek\n	368	Zorba the Greek	1946
54	D. H. Lawrence	United Kingdom	images/sons-and-lovers.jpg	English	https://en.wikipedia.org/wiki/Sons_and_Lovers\n	432	Sons and Lovers	1913
55	Halldór Laxness	Iceland	images/independent-people.jpg	Icelandic	https://en.wikipedia.org/wiki/Independent_People\n	470	Independent People	1934
56	Giacomo Leopardi	Italy	images/poems-giacomo-leopardi.jpg	Italian	\n	184	Poems	1818
57	Doris Lessing	United Kingdom	images/the-golden-notebook.jpg	English	https://en.wikipedia.org/wiki/The_Golden_Notebook\n	688	The Golden Notebook	1962
58	Astrid Lindgren	Sweden	images/pippi-longstocking.jpg	Swedish	https://en.wikipedia.org/wiki/Pippi_Longstocking\n	160	Pippi Longstocking	1945
59	Lu Xun	China	images/diary-of-a-madman.jpg	Chinese	https://en.wikipedia.org/wiki/A_Madman%27s_Diary\n	389	Diary of a Madman	1918
60	Naguib Mahfouz	Egypt	images/children-of-gebelawi.jpg	Arabic	https://en.wikipedia.org/wiki/Children_of_Gebelawi\n	355	Children of Gebelawi	1959
61	Thomas Mann	Germany	images/buddenbrooks.jpg	German	https://en.wikipedia.org/wiki/Buddenbrooks\n	736	Buddenbrooks	1901
62	Thomas Mann	Germany	images/the-magic-mountain.jpg	German	https://en.wikipedia.org/wiki/The_Magic_Mountain\n	720	The Magic Mountain	1924
63	Herman Melville	United States	images/moby-dick.jpg	English	https://en.wikipedia.org/wiki/Moby-Dick\n	378	Moby Dick	1851
64	Michel de Montaigne	France	images/essais.jpg	French	https://en.wikipedia.org/wiki/Essays_(Montaigne)\n	404	Essays	1595
65	Elsa Morante	Italy	images/history.jpg	Italian	https://en.wikipedia.org/wiki/History_(novel)\n	600	History	1974
66	Toni Morrison	United States	images/beloved.jpg	English	https://en.wikipedia.org/wiki/Beloved_(novel)\n	321	Beloved	1987
67	Murasaki Shikibu	Japan	images/the-tale-of-genji.jpg	Japanese	https://en.wikipedia.org/wiki/The_Tale_of_Genji\n	1360	The Tale of Genji	1006
68	Robert Musil	Austria	images/the-man-without-qualities.jpg	German	https://en.wikipedia.org/wiki/The_Man_Without_Qualities\n	365	The Man Without Qualities	1931
69	Vladimir Nabokov	Russia/United States	images/lolita.jpg	English	https://en.wikipedia.org/wiki/Lolita\n	317	Lolita	1955
70	George Orwell	United Kingdom	images/nineteen-eighty-four.jpg	English	https://en.wikipedia.org/wiki/Nineteen_Eighty-Four\n	272	Nineteen Eighty-Four	1949
71	Ovid	Roman Empire	images/the-metamorphoses-of-ovid.jpg	Classical Latin	https://en.wikipedia.org/wiki/Metamorphoses\n	576	Metamorphoses	100
72	Fernando Pessoa	Portugal	images/the-book-of-disquiet.jpg	Portuguese	https://en.wikipedia.org/wiki/The_Book_of_Disquiet\n	272	The Book of Disquiet	1928
73	Edgar Allan Poe	United States	images/tales-and-poems-of-edgar-allan-poe.jpg	English	https://en.wikipedia.org/wiki/Edgar_Allan_Poe_bibliography#Tales\n	842	Tales	1950
74	Marcel Proust	France	images/a-la-recherche-du-temps-perdu.jpg	French	https://en.wikipedia.org/wiki/In_Search_of_Lost_Time\n	2408	In Search of Lost Time	1920
75	François Rabelais	France	images/gargantua-and-pantagruel.jpg	French	https://en.wikipedia.org/wiki/Gargantua_and_Pantagruel\n	623	Gargantua and Pantagruel	1533
76	Juan Rulfo	Mexico	images/pedro-paramo.jpg	Spanish	https://en.wikipedia.org/wiki/Pedro_P%C3%A1ramo\n	124	Pedro Páramo	1955
77	Rumi	Sultanate of Rum	images/the-masnavi.jpg	Persian	https://en.wikipedia.org/wiki/Masnavi\n	438	The Masnavi	1236
78	Salman Rushdie	United Kingdom, India	images/midnights-children.jpg	English	https://en.wikipedia.org/wiki/Midnight%27s_Children\n	536	Midnight's Children	1981
79	Saadi	Persia, Persian Empire	images/bostan.jpg	Persian	https://en.wikipedia.org/wiki/Bustan_(book)\n	298	Bostan	1257
80	Tayeb Salih	Sudan	images/season-of-migration-to-the-north.jpg	Arabic	https://en.wikipedia.org/wiki/Season_of_Migration_to_the_North\n	139	Season of Migration to the North	1966
81	José Saramago	Portugal	images/blindness.jpg	Portuguese	https://en.wikipedia.org/wiki/Blindness_(novel)\n	352	Blindness	1995
82	William Shakespeare	England	images/hamlet.jpg	English	https://en.wikipedia.org/wiki/Hamlet\n	432	Hamlet	1603
83	William Shakespeare	England	images/king-lear.jpg	English	https://en.wikipedia.org/wiki/King_Lear\n	384	King Lear	1608
84	William Shakespeare	England	images/othello.jpg	English	https://en.wikipedia.org/wiki/Othello\n	314	Othello	1609
85	Sophocles	Greece	images/oedipus-the-king.jpg	Greek	https://en.wikipedia.org/wiki/Oedipus_the_King\n	88	Oedipus the King	-430
86	Stendhal	France	images/le-rouge-et-le-noir.jpg	French	https://en.wikipedia.org/wiki/The_Red_and_the_Black\n	576	The Red and the Black	1830
87	Laurence Sterne	England	images/the-life-and-opinions-of-tristram-shandy.jpg	English	https://en.wikipedia.org/wiki/The_Life_and_Opinions_of_Tristram_Shandy,_Gentleman\n	640	The Life And Opinions of Tristram Shandy	1760
88	Italo Svevo	Italy	images/confessions-of-zeno.jpg	Italian	https://en.wikipedia.org/wiki/Zeno%27s_Conscience\n	412	Confessions of Zeno	1923
89	Jonathan Swift	Ireland	images/gullivers-travels.jpg	English	https://en.wikipedia.org/wiki/Gulliver%27s_Travels\n	178	Gulliver's Travels	1726
90	Leo Tolstoy	Russia	images/war-and-peace.jpg	Russian	https://en.wikipedia.org/wiki/War_and_Peace\n	1296	War and Peace	1867
91	Leo Tolstoy	Russia	images/anna-karenina.jpg	Russian	https://en.wikipedia.org/wiki/Anna_Karenina\n	864	Anna Karenina	1877
92	Leo Tolstoy	Russia	images/the-death-of-ivan-ilyich.jpg	Russian	https://en.wikipedia.org/wiki/The_Death_of_Ivan_Ilyich\n	92	The Death of Ivan Ilyich	1886
93	Mark Twain	United States	images/the-adventures-of-huckleberry-finn.jpg	English	https://en.wikipedia.org/wiki/Adventures_of_Huckleberry_Finn\n	224	The Adventures of Huckleberry Finn	1884
94	Valmiki	India	images/ramayana.jpg	Sanskrit	https://en.wikipedia.org/wiki/Ramayana\n	152	Ramayana	-450
95	Virgil	Roman Empire	images/the-aeneid.jpg	Classical Latin	https://en.wikipedia.org/wiki/Aeneid\n	442	The Aeneid	-23
96	Vyasa	India	images/the-mahab-harata.jpg	Sanskrit	https://en.wikipedia.org/wiki/Mahabharata\n	276	Mahabharata	-700
97	Walt Whitman	United States	images/leaves-of-grass.jpg	English	https://en.wikipedia.org/wiki/Leaves_of_Grass\n	152	Leaves of Grass	1855
98	Virginia Woolf	United Kingdom	images/mrs-dalloway.jpg	English	https://en.wikipedia.org/wiki/Mrs_Dalloway\n	216	Mrs Dalloway	1925
99	Virginia Woolf	United Kingdom	images/to-the-lighthouse.jpg	English	https://en.wikipedia.org/wiki/To_the_Lighthouse\n	209	To the Lighthouse	1927
100	Marguerite Yourcenar	France/Belgium	images/memoirs-of-hadrian.jpg	French	https://en.wikipedia.org/wiki/Memoirs_of_Hadrian\n	408	Memoirs of Hadrian	1951
\.


--
-- Data for Name: app_library_userprofile; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_library_userprofile (id, image, phone_number, user_id, user_books) FROM stdin;
1	media/armen_6u9Qhc8.jpg	+37491626569	1	1,15,16,12,
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add book	7	add_book
26	Can change book	7	change_book
27	Can delete book	7	delete_book
28	Can view book	7	view_book
29	Can add user profile	8	add_userprofile
30	Can change user profile	8	change_userprofile
31	Can delete user profile	8	delete_userprofile
32	Can view user profile	8	view_userprofile
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$vQdazH7j7W3t$nN0nj+LXNCf4B9UCNbVH+pRgHAd6ZxVwejvc/y0785k=	2020-12-22 11:48:15.110004+04	t	armen			a@gmail.com	t	t	2020-12-09 14:39:17.662405+04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-12-09 15:36:35.703253+04	1	armen	1	[{"added": {}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	app_library	book
8	app_library	userprofile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-12-09 13:32:08.329183+04
2	auth	0001_initial	2020-12-09 13:32:08.365812+04
3	admin	0001_initial	2020-12-09 13:32:08.41762+04
4	admin	0002_logentry_remove_auto_add	2020-12-09 13:32:08.436309+04
5	admin	0003_logentry_add_action_flag_choices	2020-12-09 13:32:08.446642+04
6	app_library	0001_initial	2020-12-09 13:32:08.469385+04
7	app_library	0002_auto_20201207_1151	2020-12-09 13:32:08.494238+04
8	app_library	0003_auto_20201207_1216	2020-12-09 13:32:08.514847+04
9	app_library	0004_auto_20201208_1301	2020-12-09 13:32:08.525039+04
10	app_library	0005_auto_20201208_1416	2020-12-09 13:32:08.528956+04
11	app_library	0006_userprofile_user_books	2020-12-09 13:32:08.541115+04
12	app_library	0007_auto_20201208_1729	2020-12-09 13:32:08.561889+04
13	app_library	0008_auto_20201208_1731	2020-12-09 13:32:08.578634+04
14	app_library	0009_auto_20201209_0719	2020-12-09 13:32:08.601327+04
15	app_library	0010_auto_20201209_0729	2020-12-09 13:32:08.61185+04
16	app_library	0011_auto_20201209_0844	2020-12-09 13:32:08.621751+04
17	app_library	0012_auto_20201209_1004	2020-12-09 13:32:08.632584+04
18	contenttypes	0002_remove_content_type_name	2020-12-09 13:32:08.654772+04
19	auth	0002_alter_permission_name_max_length	2020-12-09 13:32:08.664707+04
20	auth	0003_alter_user_email_max_length	2020-12-09 13:32:08.674405+04
21	auth	0004_alter_user_username_opts	2020-12-09 13:32:08.683678+04
22	auth	0005_alter_user_last_login_null	2020-12-09 13:32:08.693083+04
23	auth	0006_require_contenttypes_0002	2020-12-09 13:32:08.69524+04
24	auth	0007_alter_validators_add_error_messages	2020-12-09 13:32:08.704782+04
25	auth	0008_alter_user_username_max_length	2020-12-09 13:32:08.717599+04
26	auth	0009_alter_user_last_name_max_length	2020-12-09 13:32:08.727598+04
27	auth	0010_alter_group_name_max_length	2020-12-09 13:32:08.74191+04
28	auth	0011_update_proxy_permissions	2020-12-09 13:32:08.751906+04
29	auth	0012_alter_user_first_name_max_length	2020-12-09 13:32:08.762008+04
30	sessions	0001_initial	2020-12-09 13:32:08.769345+04
31	app_library	0013_auto_20201212_2155	2020-12-12 21:55:28.618445+04
32	app_library	0014_auto_20201212_2207	2020-12-12 22:07:43.403299+04
33	app_library	0015_auto_20201212_2319	2020-12-12 23:19:58.301997+04
34	app_library	0016_auto_20201220_1337	2020-12-20 13:38:14.698578+04
35	app_library	0017_auto_20201224_0113	2020-12-24 09:51:41.903186+04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2mg5wz66b8y1zc3z2eqbwuzplmsfbn1x	.eJxVjEEOwiAQRe_C2hCghWFcuu8ZmhkYpWpoUtqV8e7apAvd_vfef6mRtrWMW5NlnLI6K6tOvxtTekjdQb5Tvc06zXVdJta7og_a9DBneV4O9--gUCvfOkQDUVzXpRSSZUA2AT1KBnuNzjr0AsAcQ0Zhws4TcE8oaAxR70G9P85jN40:1kmwsg:9SmC2_KsbW_TNG02tCvcYx5uvRztXpz3PFf7ur7xRwI	2020-12-23 14:39:34.709933+04
dftitdnuwnenczozdzpyoa9qp58fh2gh	.eJxVjEEOwiAQRe_C2hCghWFcuu8ZmhkYpWpoUtqV8e7apAvd_vfef6mRtrWMW5NlnLI6K6tOvxtTekjdQb5Tvc06zXVdJta7og_a9DBneV4O9--gUCvfOkQDUVzXpRSSZUA2AT1KBnuNzjr0AsAcQ0Zhws4TcE8oaAxR70G9P85jN40:1krIt2:ZTYjDU8js8rJb7DZHHJ68v-PiTVdrarQUFK20zXpBFM	2021-01-04 14:57:56.090184+04
k9447v8tgbv7zz9kwf2qlx6gppq7mlgx	e30:1krcP1:vj--a0_L5kvVCGQglmykXbE5vCClY5Sw0AaAtJSAy0Y	2021-01-05 11:48:15.105332+04
\.


--
-- Name: app_library_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.app_library_book_id_seq', 100, true);


--
-- Name: app_library_userprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.app_library_userprofile_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 32, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 8, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 35, true);


--
-- Name: app_library_book app_library_book_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_library_book
    ADD CONSTRAINT app_library_book_pkey PRIMARY KEY (id);


--
-- Name: app_library_userprofile app_library_userprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_library_userprofile
    ADD CONSTRAINT app_library_userprofile_pkey PRIMARY KEY (id);


--
-- Name: app_library_userprofile app_library_userprofile_user_id_4158562e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_library_userprofile
    ADD CONSTRAINT app_library_userprofile_user_id_4158562e_uniq UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: app_library_userprofile app_library_userprofile_user_id_4158562e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_library_userprofile
    ADD CONSTRAINT app_library_userprofile_user_id_4158562e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

